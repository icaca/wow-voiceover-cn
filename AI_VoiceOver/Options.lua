setfenv(1, VoiceOver)
Options = { }

local AceGUI = LibStub("AceGUI-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceDBOptions = LibStub("AceDBOptions-3.0")

------------------------------------------------------------
-- Construction of the options table for AceConfigDialog --

local function SortAceConfigOptions(a, b)
    return (a.order or 100) < (b.order or 100)
end

-- Needed to preserve order (modern AceGUI has support for custom sorting of dropdown items, but old versions don't)
local FRAME_STRATAS =
{
    "BACKGROUND",
    "LOW",
    "MEDIUM",
    "HIGH",
    "DIALOG",
}

local slashCommandsHandler = {}
function slashCommandsHandler:values(info)
    if not self.indexToName then
        self.indexToName = { "无" }
        self.indexToCommand = { "" }
        self.commandToIndex = { [""] = 1 }
        for command, handler in Utils:Ordered(Options.table.args.SlashCommands.args, SortAceConfigOptions) do
            if not handler.dropdownHidden then
                table.insert(self.indexToName, handler.name)
                table.insert(self.indexToCommand, command)
                self.commandToIndex[command] = getn(self.indexToCommand)
            end
        end
    end
    return self.indexToName
end
function slashCommandsHandler:get(info)
    local config, key = info.arg()
    return self.commandToIndex[config[key]]
end
function slashCommandsHandler:set(info, value)
    local config, key = info.arg()
    config[key] = self.indexToCommand[value]
end

-- General Tab
---@type AceConfigOptionsTable
local GeneralTab =
{
    name = "常规",
    type = "group",
    order = 10,
    args = {
        MinimapButton = {
            type = "group",
            order = 2,
            inline = true,
            name = "小地图按钮",
            args = {
                MinimapButtonShow = {
                    type = "toggle",
                    order = 1,
                    name = "显示小地图按钮",
                    get = function(info) return not Addon.db.profile.MinimapButton.LibDBIcon.hide end,
                    set = function(info, value)
                        Addon.db.profile.MinimapButton.LibDBIcon.hide = not value
                        if value then
                            LibStub("LibDBIcon-1.0"):Show("VoiceOver")
                        else
                            LibStub("LibDBIcon-1.0"):Hide("VoiceOver")
                        end
                    end,
                },
                MinimapButtonLock = {
                    type = "toggle",
                    order = 2,
                    name = "锁定位置",
                    get = function(info) return Addon.db.profile.MinimapButton.LibDBIcon.lock end,
                    set = function(info, value)
                        if value then
                            LibStub("LibDBIcon-1.0"):Lock("VoiceOver")
                        else
                            LibStub("LibDBIcon-1.0"):Unlock("VoiceOver")
                        end
                    end,
                },
                LineBreak1 = { type = "description", name = "", order = 3 },
                MinimapButtons = {
                    type = "group",
                    inline = true,
                    name = "",
                    handler = slashCommandsHandler,
                    args = {
                        MinimapButtonLeftClick = {
                            type = "select",
                            order = 1,
                            name = "左键",
                            desc = "通过左键单击小地图按钮执行的操作。",
                            values = "values", get = "get", set = "set",
                            arg = function(value) return Addon.db.profile.MinimapButton.Commands, "LeftButton" end,
                        },
                        MinimapButtonMiddleClick = {
                            type = "select",
                            order = 2,
                            name = "中键",
                            desc = "通过中键单击小地图按钮执行的操作。",
                            values = "values", get = "get", set = "set",
                            arg = function(value) return Addon.db.profile.MinimapButton.Commands, "MiddleButton" end,
                        },
                        MinimapButtonRightClick = {
                            type = "select",
                            order = 4,
                            name = "右键",
                            desc = "通过右键单击小地图按钮执行的操作。",
                            values = "values", get = "get", set = "set",
                            arg = function(value) return Addon.db.profile.MinimapButton.Commands, "RightButton" end,
                        }
                    }
                }
            }
        },
        Frame = {
            type = "group",
            order = 3,
            inline = true,
            name = "Frame",
            disabled = function(info) return Addon.db.profile.SoundQueueUI.HideFrame end,
            args = {
                LockFrame = {
                    type = "toggle",
                    order = 1,
                    name = "锁定框架",
                    desc = "防止框架被移动或调整大小。",
                    get = function(info) return Addon.db.profile.SoundQueueUI.LockFrame end,
                    set = function(info, value)
                        Addon.db.profile.SoundQueueUI.LockFrame = value
                        SoundQueueUI:RefreshConfig()
                    end,
                },
                ResetFrame = {
                    type = "execute",
                    order = 2,
                    name = "重置框架",
                    desc = "将框架位置和大小重置回默认值。",
                    func = function(info)
                        SoundQueueUI.frame:Reset()
                    end,
                },
                LineBreak1 = { type = "description", name = "", order = 3 },
                FrameStrata = {
                    type = "select",
                    order = 5,
                    name = "框架层次",
                    desc = "调整框架的层次",
                    values = FRAME_STRATAS,
                    get = function(info)
                        for k, v in ipairs(FRAME_STRATAS) do
                            if v == Addon.db.profile.SoundQueueUI.FrameStrata then
                                return k;
                            end
                        end
                    end,
                    set = function(info, value)
                        Addon.db.profile.SoundQueueUI.FrameStrata = FRAME_STRATAS[value]
                        SoundQueueUI.frame:SetFrameStrata(Addon.db.profile.SoundQueueUI.FrameStrata)
                    end,
                },
                FrameScale = {
                    type = "range",
                    order = 4,
                    name = "框架比例",
                    softMin = 0.5,
                    softMax = 2,
                    bigStep = 0.05,
                    isPercent = true,
                    get = function(info) return Addon.db.profile.SoundQueueUI.FrameScale end,
                    set = function(info, value)
                        local wasShown = Version.IsLegacyVanilla and SoundQueueUI.frame:IsShown() -- 1.12 quirk
                        if wasShown then
                            SoundQueueUI.frame:Hide()
                        end
                        Addon.db.profile.SoundQueueUI.FrameScale = value
                        SoundQueueUI:RefreshConfig()
                        if wasShown then
                            SoundQueueUI.frame:Show()
                        end
                    end,
                },
                LineBreak2 = { type = "description", name = "", order = 6 },
                HidePortrait = {
                    type = "toggle",
                    order = 7,
                    name = "隐藏NPC头像",
                    desc = "播放语音时不会出现会说话的 NPC 肖像。\n\n" ..
                            Utils:ColorizeText("当使用其他替代对话框体验的插件时，这可能很有用，例如 " ..
                                Utils:ColorizeText("Immersion", NORMAL_FONT_COLOR_CODE) .. ".",
                                GRAY_FONT_COLOR_CODE),
                    get = function(info) return Addon.db.profile.SoundQueueUI.HidePortrait end,
                    set = function(info, value)
                        Addon.db.profile.SoundQueueUI.HidePortrait = value
                        SoundQueueUI:RefreshConfig()
                    end,
                },
                HideFrame = {
                    type = "toggle",
                    order = 8,
                    name = "完全隐藏",
                    desc = "播旁白时不显示框架。",
                    disabled = false,
                    get = function(info) return Addon.db.profile.SoundQueueUI.HideFrame end,
                    set = function(info, value)
                        Addon.db.profile.SoundQueueUI.HideFrame = value
                        SoundQueueUI:RefreshConfig()
                    end,
                },
            },
        },
        Audio = {
            type = "group",
            order = 4,
            inline = true,
            name = "音效",
            args = {
                SoundChannel = Version:IsRetailOrAboveLegacyVersion(40000) and {
                    type = "select",
                    width = 0.75,
                    order = 1,
                    name = "Sound Channel",
                    desc = "控制旁白将在哪个声道中播放。",
                    values = Enums.SoundChannel:GetValueToNameMap(),
                    get = function(info) return Addon.db.profile.Audio.SoundChannel end,
                    set = function(info, value)
                        Addon.db.profile.Audio.SoundChannel = value
                        SoundQueueUI:RefreshConfig()
                    end,
                },
                LineBreak = { type = "description", name = "", order = 2 },
                GossipFrequency = {
                    type = "select",
                    width = 0.8,
                    order = 3,
                    name = "NPC问候语播放频率",
                    desc = "控制NPC旁白问候的频率。",
                    values = {
                        [Enums.GossipFrequency.Always] = "总是",
                        [Enums.GossipFrequency.OncePerQuestNPC] = "仅任务NPC",
                        [Enums.GossipFrequency.OncePerNPC] = "所有NPC",
                        [Enums.GossipFrequency.Never] = "从不",
                    },
                    get = function(info) return Addon.db.profile.Audio.GossipFrequency end,
                    set = function(info, value)
                        Addon.db.profile.Audio.GossipFrequency = value
                        SoundQueueUI:RefreshConfig()
                    end,
                },
                AutoToggleDialog = (Version.IsLegacyVanilla or Version:IsRetailOrAboveLegacyVersion(60100) or nil) and {
                    type = "toggle",
                    width = 2.25,
                    order = 4,
                    name = "播放旁白时，使NPC问候语静音",
                    desc = Version.IsLegacyVanilla and "如果开始播放旁白，则在与 NPC 交互时中断通用 NPC 问候语音。”或“当旁白播放时，对话通道将静音。",
                    disabled = function() return Version:IsRetailOrAboveLegacyVersion(60100) and Addon.db.profile.Audio.SoundChannel == Enums.SoundChannel.Dialog end,
                    get = function(info) return Addon.db.profile.Audio.AutoToggleDialog end,
                    set = function(info, value)
                        Addon.db.profile.Audio.AutoToggleDialog = value
                        SoundQueueUI:RefreshConfig()
                        if Addon.db.profile.Audio.AutoToggleDialog and Version:IsRetailOrAboveLegacyVersion(60100) then
                            SetCVar("Sound_EnableDialog", 1)
                        end
                    end,
                },
                LineBreak2 = { type = "description", name = "", order = 5 },
                ToggleSyncToWindowState = {
                    type = "toggle",
                    order = 6,
                    width = 2,
                    name = "旁白与窗口同步",
                    desc = "当窗口关闭时自动关闭旁白。",
                    get = function(info) return Addon.db.profile.Audio.StopAudioOnDisengage end,
                    set = function(info, value)
                        Addon.db.profile.Audio.StopAudioOnDisengage = value
                    end,
                },
            }
        },
        Debug = {
            type = "group",
            order = 5,
            inline = true,
            name = "调试工具",
            args = {
                DebugEnabled = {
                    type = "toggle",
                    order = 1,
                    width = 1.25,
                    name = "启用调试消息",
                    desc = "允许将一些“有用”调试消息打印到聊天窗口。",
                    get = function(info) return Addon.db.profile.DebugEnabled end,
                    set = function(info, value) Addon.db.profile.DebugEnabled = value end,
                },
            }
        }
    }
}

---@type AceConfigOptionsTable
local LegacyWrathTab = (Version.IsLegacyWrath or Version.IsLegacyBurningCrusade or nil) and {
    type = "group",
    name = Version.IsLegacyBurningCrusade and "2.4.3" or "3.3.5",
    order = 19,
    args = {
        PlayOnMusicChannel = {
            type = "group",
            order = 100,
            name = "在音乐频道上播放旁白",
            inline = true,
            args = {
                Description = {
                    type = "description",
                    order = 100,
                    name = format("%s 客户端缺乏随意停止插件声音的能力。 作为解决方法，您可以在音乐频道上播放旁白，与声音不同，旁白可以停止。 在整个配音过程中不会播放常规背景音乐。|n|n如果您通常在禁用音乐的情况下播放 - 配音期间会暂时启用音乐，但不会播放实际的背景音乐。", Version.IsLegacyBurningCrusade and "2.4.3" or "3.3.5"),
                },
                Enabled = {
                    type = "toggle",
                    order = 200,
                    name = "启用",
                    get = function(info) return Addon.db.profile.LegacyWrath.PlayOnMusicChannel.Enabled end,
                    set = function(info, value) Addon.db.profile.LegacyWrath.PlayOnMusicChannel.Enabled = value end,
                },
                Disabled = {
                    type = "description",
                    order = 300,
                    name = format("禁用此选项后，您%s将无法在配音开始播放后暂停|r。 一旦当前声音播放完毕，尝试暂停将会%1$s暂停旁白队列|r。", RED_FONT_COLOR_CODE),
                    hidden = function(info) return Addon.db.profile.LegacyWrath.PlayOnMusicChannel.Enabled end,
                },
                Settings = {
                    type = "group",
                    order = 400,
                    name = "",
                    inline = true,
                    hidden = function(info) return not Addon.db.profile.LegacyWrath.PlayOnMusicChannel.Enabled end,
                    args = {
                        FadeOutMusic = {
                            type = "range",
                            order = 100,
                            name = "音乐淡出（秒）",
                            desc = "在播放旁白之前，背景音乐将在这段时间内淡出。 如果游戏中的音乐被禁用或静音，则没有任何效果。",
                            min = 0,
                            softMax = 2,
                            bigStep = 0.05,
                            disabled = Version.IsLegacyBurningCrusade,
                            get = function(info) return Addon.db.profile.LegacyWrath.PlayOnMusicChannel.FadeOutMusic end,
                            set = function(info, value) Addon.db.profile.LegacyWrath.PlayOnMusicChannel.FadeOutMusic = value end,
                        },
                        Volume = {
                            type = "range",
                            order = 200,
                            name = "旁白音量",
                            desc = "播放旁白时，音乐频道音量将暂时调整为该值。",
                            min = 0,
                            max = 1,
                            bigStep = 0.01,
                            isPercent = true,
                            get = function(info) return Addon.db.profile.LegacyWrath.PlayOnMusicChannel.Volume end,
                            set = function(info, value) Addon.db.profile.LegacyWrath.PlayOnMusicChannel.Volume = value end,
                        },
                    }
                },
            }
        },
        Portraits = {
            type = "group",
            order = 200,
            name = "动画肖像",
            inline = true,
            args = {
                HDModels = {
                    type = "toggle",
                    order = 100,
                    name = "我有高清模型",
                    desc = "如果您使用带有高清角色模型的补丁，请打开此选项。 这将纠正亡灵和地精 NPC 的高清模型的动画时序。",
                    get = function(info) return Addon.db.profile.LegacyWrath.HDModels end,
                    set = function(info, value) Addon.db.profile.LegacyWrath.HDModels = value end,
                },
            }
        },
    }
}

---@type AceConfigOptionsTable
local DataModulesTab =
{
    name = function() return format("数据模块%s", next(Options.table.args.DataModules.args.Available.args) and "|cFF00CCFF (新)|r" or "") end,
    type = "group",
    childGroups = "tree",
    order = 20,
    args = {
        Available = {
            type = "group",
            name = "|cFF00CCFF可用的|r",
            order = 100000,
            hidden = function(info) return not next(Options.table.args.DataModules.args.Available.args) end,
            args = {}
        }
    }
}

---@type AceConfigOptionsTable
local SlashCommands = {
    type = "group",
    name = "Commands",
    order = 110,
    inline = true,
    dialogHidden = true,
    args = {
        PlayPause = {
            type = "execute",
            order = 1,
            name = "播放 / 暂停",
            desc = "播放 / 暂停",
            hidden = true,
            func = function(info)
                SoundQueue:TogglePauseQueue()
            end
        },
        Play = {
            type = "execute",
            order = 2,
            name = "播放",
            desc = "继续播放旁白",
            func = function(info)
                SoundQueue:ResumeQueue()
            end
        },
        Pause = {
            type = "execute",
            order = 3,
            name = "暂停",
            desc = "暂停播放旁白",
            func = function(info)
                SoundQueue:PauseQueue()
            end
        },
        Skip = {
            type = "execute",
            order = 4,
            name = "跳过",
            desc = "跳过当前播放的旁白",
            func = function(info)
                local soundData = SoundQueue:GetCurrentSound()
                if soundData then
                    SoundQueue:RemoveSoundFromQueue(soundData)
                end
            end
        },
        Clear = {
            type = "execute",
            order = 5,
            name = "清除",
            desc = "停止播放并清除队列",
            func = function(info)
                SoundQueue:RemoveAllSoundsFromQueue()
            end
        },
        Options = {
            type = "execute",
            order = 100,
            name = "选项",
            desc = "打开选项面板",
            func = function(info)
                Options:OpenConfigWindow()
            end
        },
    }
}

---@type AceConfigOptionsTable
Options.table = {
    name = "Voice Over",
    type = "group",
    childGroups = "tab",
    args = {
        General = GeneralTab,
        LegacyWrath = LegacyWrathTab,
        DataModules = DataModulesTab,
        Profiles = nil, -- Filled in Options:OnInitialize, order is implicitly 100

        SlashCommands = SlashCommands,
    }
}
------------------------------------------------------------

---@param module DataModuleMetadata
---@param order number
function Options:AddDataModule(module, order)
    local descriptionOrder = 0
    local function GetNextOrder()
        descriptionOrder = descriptionOrder + 1
        return descriptionOrder
    end
    local function MakeDescription(header, text)
        return { type = "description", order = GetNextOrder(), name = function() return format("%s%s: |r%s", NORMAL_FONT_COLOR_CODE, header, type(text) == "function" and text() or text) end }
    end

    local name, title, notes, loadable, reason = DataModules:GetModuleAddOnInfo(module)
    if reason == "DEMAND_LOADED" or reason == "INTERFACE_VERSION" then
        reason = nil
    end
    DataModulesTab.args[module.AddonName] = {
        name = function()
            local isLoaded = DataModules:GetModule(module.AddonName)
            return format("%d. %s%s%s|r",
                order,
                reason and RED_FONT_COLOR_CODE or isLoaded and HIGHLIGHT_FONT_COLOR_CODE or GRAY_FONT_COLOR_CODE,
                string.gsub(module.Title, "VoiceOver Data %- ", ""),
                isLoaded and "" or " (not loaded)")
        end,
        type = "group",
        order = order,
        args = {
            AddonName = MakeDescription("插件名称", module.AddonName),
            Title = MakeDescription("标题", module.Title),
            ModuleVersion = MakeDescription("数据版本", module.ModuleVersion),
            ModulePriority = MakeDescription("模块优先级", module.ModulePriority),
            ContentVersion = MakeDescription("当前版本", module.ContentVersion),
            LoadOnDemand = MakeDescription("按需加载", module.LoadOnDemand and "是" or "否"),
            Loaded = MakeDescription("已加载", function() return DataModules:GetModule(module.AddonName) and "是" or "否" end),
            NotLoadableReason = {
                type = "description",
                order = GetNextOrder(),
                name = format("%sReason: |r%s%s|r", NORMAL_FONT_COLOR_CODE, RED_FONT_COLOR_CODE, reason and _G["ADDON_"..reason] or ""),
                hidden = not reason,
            },
            Load = {
                type = "execute",
                order = GetNextOrder(),
                name = "Load",
                hidden = function() return reason or not module.LoadOnDemand or DataModules:GetModule(module.AddonName) end,
                func = function()
                    local loaded, reason = DataModules:LoadModule(module)
                    if not loaded then
                        StaticPopup_Show("VOICEOVER_ERROR", format([[Failed to load data module "%s". Reason: %s]], module.AddonName, reason and _G["ADDON_" .. reason] or "Unknown"))
                    end
                end,
            },
        }
    }
end

---@param module AvailableDataModule
---@param order number
---@param update boolean Data module has update
function Options:AddAvailableDataModule(module, order, update)
    local descriptionOrder = 0
    local function GetNextOrder()
        descriptionOrder = descriptionOrder + 1
        return descriptionOrder
    end
    local function MakeDescription(header, text)
        return { type = "description", order = GetNextOrder(), name = function() return format("%s%s: |r%s", NORMAL_FONT_COLOR_CODE, header, type(text) == "function" and text() or text) end }
    end

    DataModulesTab.args.Available.args[module.AddonName] = {
        name = Utils:ColorizeText(format(update and "%s (Update)" or "%s", string.gsub(module.Title, "VoiceOver Data %- ", "")), "|cFF00CCFF"),
        type = "group",
        order = order,
        args = {
            AddonName = MakeDescription("Addon Name", module.AddonName),
            Title = MakeDescription("Title", module.Title),
            ContentVersion = MakeDescription("Content Version", format(update and "%2$s -> |cFF00CCFF%1$s|r" or "%s", module.ContentVersion, update and DataModules:GetPresentModule(module.AddonName).ContentVersion)),
            URL = {
                type = "input",
                order = GetNextOrder(),
                width = "full",
                name = "Download URL",
                get = function(info) return module.URL end,
                set = function(info) end,
            },
        }
    }
end

---Initialization of opens panel
function Options:Initialize()
    self.table.args.Profiles = AceDBOptions:GetOptionsTable(Addon.db)

    -- Create options table
    Debug:Print("Registering options table...", "Options")
    local AceConfig = LibStub("AceConfig-3.0")
    if Addon.RegisterOptionsTable then
        -- Embedded version for 1.12
        AceConfig = Addon
    end
    AceConfig:RegisterOptionsTable("VoiceOver", self.table, "vo")
    AceConfigDialog:AddToBlizOptions("VoiceOver")
    for key, tab in Utils:Ordered(Options.table.args, SortAceConfigOptions) do
        if not tab.hidden and not tab.dialogHidden then
            AceConfigDialog:AddToBlizOptions("VoiceOver", type(tab.name) == "function" and tab.name() or tab.name, "VoiceOver", key)
        end
    end
    Debug:Print("Done!", "Options")

    -- Create the option frame
    ---@type AceGUIFrame|AceGUIWidget
    self.frame = AceGUI:Create("Frame")
    --AceConfigDialog:SetDefaultSize("VoiceOver", 640, 780) -- Let it be auto-sized
    AceConfigDialog:Open("VoiceOver", self.frame)
    self.frame:SetLayout("Fill")
    self.frame:Hide()

    -- Enable the frame to be closed with Escape key
    _G["VoiceOverOptions"] = self.frame.frame
    tinsert(UISpecialFrames, "VoiceOverOptions")
end

function Options:OpenConfigWindow()
    if self.frame:IsShown() then
        PlaySound(SOUNDKIT.IG_MAINMENU_CLOSE)
        self.frame:Hide()
    else
        PlaySound(SOUNDKIT.IG_MAINMENU_OPEN)
        self.frame:Show()
        AceConfigDialog:Open("VoiceOver", self.frame)
    end
end
