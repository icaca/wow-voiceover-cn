if GetLocale() ~= "zhCN" then return end
if not VoiceOver or not VoiceOver.DataModules then return end
AI_VoiceOverData_Vanilla.GossipLookupByObjectName = {
	["奇怪的果树"] = {
		["这个植物矗立在泰达希尔的普通植物之间，散发着奇异的紫色光芒。"] = "0f706fc37d41cf3594fe06a341572d78"
	},
	["奇怪的树木"] = {
		["这是一种非常奇怪的植物，你从未在泰达希尔的其它地方见过。"] = "4bad0d72daceaeaabe7296045b09c363"
	},
	["阵亡英雄的纪念碑"] = {
		["这座纪念碑是用于缅怀在暴风城保卫战中牺牲的勇士。我们的人民经受了难以想象的痛苦才得以恢复自由，重新掌握自己的命运。我们将永远铭记那些在第一次兽人战争中牺牲的同胞。"] = "18d65bf52e8854e76efbc0c79572690b"
	},
	["矩阵式打孔计算机3005-A"] = {
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-A，这是一台一级机密等级的终端。$B$B你必须拥有一张白色穿孔卡片才能够使用该终端的功能。  01000100 01101111 01110111 01101110 00100000 01110111 01101001 01110100 01101000 00100000 01110100 01101000 01100101 00100000 01101000 01101111 01110010 01100100 01100101 00100001"] = "76aaa54e5e30fd41bd34c2fe44645123",
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-A，这是一台一级机密等级的终端。$B$B检测到白色穿孔卡片。权限开放。  01010100 01100101 01101100 01101100 00100000 01111001 01101111 01110101 01110010 00100000 01100110 01110010 01101001 01100101 01101110 01100100 01110011 00100000 01110100 01101111 00100000 01110000 01101100 01100001 01111001 00100000 01010111 01101111 01010111"] = "5899e16466b0cfc8aa73b7cd3df8170b",
		["白色穿孔卡片读取成功……$B$B正在分配二级机密等级权限。  01010000 01101100 01100001 01111001 00100000 01110100 01101000 01100101 00100000 01010111 01100001 01110010 01100011 01100001 01110010 01100110 01110100 00100000 01110010 01101111 01101100 01100101 01110000 01101100 01100001 01111001 01101001 01101110 01100111 00100000 01100111 01100001 01101101 01100101"] = "6aeeb85288821aec717d313e06a57c8a"
	},
	["矩阵式打孔计算机3005-B"] = {
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-B，这是一台二级机密等级的终端。$B$B你必须拥有一张黄色穿孔卡片才能够使用该终端的功能。  01000111 01101110 01101111 01101101 01100101 01110010 01100011 01111001 00100001"] = "f965fd5462e15845678ce52c9a61aa55",
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-B，这是一台二级机密等级的终端。$B$B检测到黄色穿孔卡片。权限开放。  01001011 01101001 01110011 01110011 00100000 01101101 01100101 00101100 00100000 01001001 00100111 01101101 00100000 01100111 01101110 01101111 01101101 01101001 01110011 01101000 00100001"] = "411534682daaf09511478caf8c28d14f",
		["黄色穿孔卡片读取成功……$B$B正在分配三级机密等级权限。  01010100 01101000 01100101 00100000 01001100 01101001 01100011 01101000 00100000 01001011 01101001 01101110 01100111 00100000 01101100 01101001 01110110 01100101 01110011 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001 00100001"] = "2aee0781189cd0b6e9f66a34a29aad6b",
		["矩阵式科技知识检测器探测到了你所具备的工程学天赋。你可以从以下选项中进行选择：  01000111 01101111 00100000 01100111 01101111 00100000 01100111 01101111 00100001 00100001"] = "2b848ce2c7406be289254849c2fcae75",
		["访问中……  工程学<#技能等级 == 菜鸟>   01000111 01100001 01101101 01100101 00100000 01001111 01110110 01100101 01110010  拒绝访问！"] = "c0b813d22da57212ba256d026ec015ec",
		["数据访问授权。祝你开心！  01001110 01100001 01110100 01100001 01101100 01101001 01100101 00100000 01010000 01101111 01110010 01110100 01101101 01100001 01101110 00100000 01010010 01101111 01100011 01101011 01110011"] = "fc3083d846e2925d50011736f2c91202"
	},
	["矩阵式打孔计算机3005-C"] = {
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-C，这是一台三级机密等级的终端。$B$B你必须拥有一张蓝色穿孔卡片才能够使用该终端的功能。  01010010 01100101 01100011 01101001 01110000 01100101 00111010 00100000 01001101 01100101 01100011 01101000 01100001 01101110 01101001 01100011 01100001 01101100 00100000 01000011 01101000 01101001 01100011 01101011 01100101 01101110 00100000 01010011 01101111 01110101 01110000"] = "f9dff1eba81b73fd231bd745abd765c7",
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-C，这是一台三级机密等级的终端。$B$B检测到蓝色穿孔卡片。权限开放。  01000111 01101110 01101111 01101101 01100101 01110010 01100101 01100111 01100001 01101110 00100000 01100110 01101111 01110010 01100101 01110110 01100101 01110010 00100001"] = "69ec3f694a4c97690ecb6baed8808681",
		["蓝色穿孔卡片读取成功……$B$B正在分配四级机密等级权限。  01010000 01101100 01100001 01111001 00100000 01001101 01101111 01110010 01100101 00100000 01010111 01101111 01010111"] = "beeebc97327918e5cefc7e3a0d2dd137"
	},
	["矩阵式打孔计算机3005-D"] = {
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-D，这是一台四级机密等级级终端。$B$B你必须拥有一张红色穿孔卡片才能够使用该终端的功能。  01010011 01101000 01101111 01110010 01110100 00100000 01100001 01101110 01100100 00100000 01110011 01110111 01100101 01100101 01110100"] = "b049659712ff4a6dae12ce1519d7470a",
		["吱吱！$B$B欢迎使用矩阵式打孔计算机3005-D，这是一台四级机密等级的终端。$B$B检测到红色穿孔卡片。权限开放。  01001000 01101111 01110111 00100000 01100001 01101101 00100000 01001001 00100000 01100100 01110010 01101001 01110110 01101001 01101110 01100111 00111111"] = "a12254ed4eafe35d7fbe02ee0a46d1b5",
		["红色穿孔卡片读取成功……$B$B正在分配四级机密等级权限。  00111100 01101001 01101110 01110011 01100101 01110010 01110100 00100000 01100110 01110101 01101110 01101110 01111001 00100000 01101101 01100101 01110011 01110011 01100001 01100111 01100101 00100000 01101000 01100101 01110010 01100101 00111110"] = "429864f19e4aae8eeb214e94d86bc2a8",
		["矩阵式科技知识检测器探测到了你所具备的工程学天赋。你可以从以下选项中进行选择：  01000111 01101111 00100000 01100111 01101111 00100000 01100111 01101111 00100001 00100001"] = "2b848ce2c7406be289254849c2fcae75",
		["访问中……  工程学<#技能等级 == 菜鸟>   01000111 01100001 01101101 01100101 00100000 01001111 01110110 01100101 01110010  拒绝访问！"] = "c0b813d22da57212ba256d026ec015ec",
		["数据访问授权。祝你开心！  01001110 01100001 01110100 01100001 01101100 01101001 01100101 00100000 01010000 01101111 01110010 01110100 01101101 01100001 01101110 00100000 01010010 01101111 01100011 01101011 01110011"] = "fc3083d846e2925d50011736f2c91202"
	},
	["塞卡石板"] = {
		["吉布尔-埃拉卡$B猛虎之神，万兽之王$B$B缪萨拉-安泰恩$B死亡之神，时间之子，睡眠之父，夜晚之友"] = "23565b681fd0e1e4b4d5ee631293f067"
	},
	["艾奎尼克斯石碑"] = {
		["数年前居住在此地的暗夜精灵修建了这座神殿。$B$B它隐藏着什么秘密吗？"] = "bdffb7bd4c1a549ca21fce4994c04b2e"
	},
	["苏塔拉祭坛"] = {
		["祭坛似乎在召唤你，好像它具有生命一样。"] = "547f7a85e9b61fb09fdce63531b6446c"
	},
	["哈卡祭坛"] = {
		["古老的哈卡祭坛静静地矗立在房间的入口处。$B$B你注意到阳台上有一尊巨大的毒蛇雕像立在那儿。它看上去跟祭坛上的雕像非常相似。它们之间一定有什么联系……"] = "91b59c0582fdc11756948115c740b617"
	},
	["沙妮·长齿的遗骸"] = {
		["残骸上满是苍蝇和蛆虫。"] = "2f784284d20f290e01140cc7e43f3bbc"
	},
	["北部水晶塔"] = {
		["安戈洛的水晶塔相当神秘。对这里少数的居住者来说，它们代表某种传奇，而其建造目的则更值得深思了。"] = "9658dbe477ee985df565821f1fefa775",
		["安戈洛环形山水晶塔的秘密现在已经被你破解了。你可以随时造访水晶塔，获取它们的力量。"] = "d639df313298d68d7a237f950f24a630",
		["仔细地检查了这座塔之后，你发现了一个由黄色、红色和绿色水晶组成的图样，它们以一种特殊的形态排列着。$B$B一大圈黄色水晶两侧分别有一小圈红色水晶和另一圈绿色水晶。$B$B你仔细观察水晶的颜色，科琳一定也会对你的发现很感兴趣。"] = "a9edab8eb63991a1d8f002b277b1332a"
	},
	["西部水晶塔"] = {
		["安戈洛的水晶塔相当神秘。对这里少数的居住者来说，它们代表某种传奇，而其建造目的则更值得深思了。"] = "9658dbe477ee985df565821f1fefa775",
		["安戈洛环形山水晶塔的秘密现在已经被你破解了。你可以随时造访水晶塔，获取它们的力量。"] = "d639df313298d68d7a237f950f24a630",
		["仔细地检查了这座塔之后，你发现了一个由红色、蓝色和绿色水晶组成的图样，它们以一种特殊的形态排列着。$B$B一大圈红色水晶两侧分别有一小圈蓝色水晶和另一圈绿色水晶。$B$B你仔细观察水晶的颜色，科琳一定也会对你的发现很感兴趣。"] = "5c6602e9f23f886ebab0f831c71cbfba"
	},
	["东部水晶塔"] = {
		["安戈洛的水晶塔相当神秘。对这里少数的居住者来说，它们代表某种传奇，而其建造目的则更值得深思了。"] = "9658dbe477ee985df565821f1fefa775",
		["安戈洛环形山水晶塔的秘密现在已经被你破解了。你可以随时造访水晶塔，获取它们的力量。"] = "d639df313298d68d7a237f950f24a630",
		["仔细地检查了这座塔之后，你发现了一个由蓝色、黄色和绿色水晶组成的图样，它们以一种特殊的形态排列着。$B$B一大圈蓝色水晶两侧分别有一小圈黄色水晶和另一圈绿色水晶。$B$B你仔细观察水晶的颜色，科琳一定也会对你的发现很感兴趣。"] = "5c358003a14e69ee6ddd9c6f08651f68"
	},
	["七贤石板"] = {
		["燃烧平原 - 七贤石板"] = "d53d78383a00e34fee253b35f4822f53",
		["石板上的符号被小心翼翼地拓了下来……"] = "1441f593f536c438e86c832a3994399f"
	},
	["木制厕所"] = {
		["有人吗？"] = "f1066af8c8e6467a6ae99ec3559a06c9",
		["啊，没问题，$n！对不起……我还以为你已经搞定了。"] = "927e8ff519d8ba1f7268782502991891"
	},
	["测试仪器"] = {
		["当你靠近时，那些液体和混合物剧烈地翻腾起来。设备旁边是一把巨大的钳子，似乎很适合用来夹起淤泥样本。$B$B还有安全齿轮装备，但是上面布满灰尘，似乎很久没有使用过了。$B$B你觉得什么东西都碰为好。"] = "4443edbe9f8e5b3bb25037cef6a76549"
	},
	["达尔松夫人的日记"] = {
		["这本书的标题是手写体：莫琳·达尔松的日记。"] = "7ee3700cb7019901b220464a5ab94655",
		["一本打开的日记放在你的面前，发黄的书页上写着如下的文字：$B$B“哈洛德变成了这个样子，我不知道接下来会发生什么事。把他拖进我能找到的唯一可以关住他的地方之后，我已经心力憔悴了。我把钥匙藏在身上，祈祷能渡过这个难关……$B$B我希望能离开这里，但我需要钱。我想我们的东西都在那个柜橱里……现在我想起来了，哈罗德是不是把柜橱的钥匙藏在自己身上了？$B$B我要先休息一下，现在我实在是太疲倦了。”"] = "717e4452946d86f15f58fb9bae10c1b8"
	},
	["玛雷弗斯的目录"] = {
		["瑟银兄弟会的目录：$B$B你可以从中找到所有你冒险必需的最强装备！我们还将告诉你到哪儿去收集这些材料。"] = "76853600f17808d27848257e7a687168",
		["要是你想要磨损的憎恶缝合线，你就得长途跋涉去斯坦索姆。$B$B以前那儿是光明使者的家园，现在被克尔苏加德的仆从们侵占了。$B$B解除这燃烧的城市的危机，击败那些强大的憎恶吧！从他们那儿夺取磨损的憎恶缝合线！"] = "3f424f4d79a0f2e7f08530b667b2e442",
		["那些疯狂的信徒的最后一处圣地。他们在那制作红色制服，使用的就是魔化红线！$B$B冒险家们，向斯坦索姆城前进！"] = "a1ab5bb20b1a4b85596ee4b43ec71cb8",
		["人类和亡灵天灾所知的最好的肉类防腐剂——莱斯·霜语的防腐液。这种防腐剂只能在一个地方找到，人们认为这东西得名于巫妖，要去那种地方一定不是件容易的事儿。$B$B但是……如果这正是你想要的东西，就去通灵学院吧……"] = "bc097c6ccf37ea8c37e08bf804253ff4",
		["瑟银兄弟会。$B$B奥术水晶是从富瑟银矿脉中采集的。通过强大的炼金师的威力，奥金诞生了。$B$B找出一个矿工，如果你不是的话……还有找到一个出色的炼金术士！你两样都会需要的。"] = "d46d54093f1260912aed6c305f8d3ca6",
		["巴罗夫家族将通灵学院所在的土地给了克尔苏加德。作为交换这块诅咒神教可以研究亡灵天灾堕落法术的地方，克尔苏加德让巴罗夫家族以亡灵的形式获得永生。$B$B在阴影拱顶房间中，你能找到暗影之皮及其拥有者伊露希亚·巴罗夫。$B$B你无法找到比暗影之皮更好反射虚无和死亡的镜子了。"] = "33f4d18ce0ab409c37b0395f421b1056"
	},
	["游荡者目录"] = {
		["书中说很多条龙联合起来对付一条极其强大的、名为死亡之翼的龙。按照我们掌握的信息，多彩龙人差不多全部释放。守护者已经准备就绪。"] = "a39f45feb88e61fcb589760afd9818ef"
	},
	["如何安抚僵尸"] = {
		["这些书页上的内容就像流水一般，你感觉到它们冲刷过了你的心灵，你的一部分知识似乎彻底被这本书抹掉了。"] = "91179f4a7cd672e7c6902020e8567c29"
	},
	["北山伐木场箱子"] = {
		["那个坚固的箱子在木材厂中间，周围推满了残骸和血色十字军的狂热信徒。"] = "c6e0746701f75c4143389544cdc0709b"
	},
	["拉克摩尔的日志"] = {
		["我是奥塞斯·拉克摩尔，豪侠轮船的船长。这是最近几天轮船的航行日志。$B$B我们的船只满载货物驶向羽月要塞，纳迦袭击了船只一侧。我们赶走了他们，但是我们知道他们会回来的。我担心纳迦会毁掉我最宝贵的财物，因此我将豪侠驶向远离凄凉之地的一座小岛，岛上全是古老的暗夜精灵建筑废墟。我将自己的宝箱放在了岛上。"] = "c59de48f730da3b5d7c895e1e6639450",
		["我的箱子设计独特，需要两把钥匙来开锁，一把金钥匙和一把银钥匙。我将银钥匙给了我的大副，自己保留了金钥匙。$B$B但是我们注定会失去它们。在一次纳迦发动的袭击中，我丢了钥匙；而后，龙虾人攻击了我们，将大副推入了深渊。$B$B我想钥匙一定在纳迦和龙虾人那儿。还好这两方是敌人，不会共享钥匙的。"] = "4737220be29ed0b0905a27df23942c8f",
		["在龙虾人的进攻后，我们知道下一次豪侠是无法幸免于难的。于是我和几个幸存的水手弃船逃生。$B$B我们现在上岸了并很快就会向尼耶尔前哨站游去，但是在到达避难所之前我们还有很多危险，而且我害怕凄凉之地会吞噬我们。$B$B我现在写下这些是希望有人能知道我们的困境，有一天能把那些带给我们灭顶之灾的水中魔鬼杀死为我们报仇。"] = "b7584554dd225ef7e529ef1bd508f29b"
	},
	["詹姆斯的日记"] = {
		["日记中似乎记载了关于贸易、买主和其它商业事务的信息。"] = "b452639355066c08bc2c04d51231d65d"
	},
	["卡里尔·温萨鲁斯的骸骨"] = {
		["粗略地检查一下骸骨，上面的肉已经干枯了。真是令人毛骨悚然的场景。"] = "555ade875b44d8dec7f9becc88523688"
	},
	["结构图：战地修理机器人74A型"] = {
		["<你无法理解这份卷轴上记载的任何技术。>"] = "2ed5f0736f5294f29dc1aa5ff45f2e1e",
		["<羊皮纸上画着的是修理机器人的结构示意图。>"] = "b4e9ed9a4e8de9979239fe2638d5d48a",
		["<依你目前的工程学技能是看不懂这张复杂的结构示意图的。>"] = "b489dbbcf2f13d9af3fc5054c2777e4e",
		["<你精通制造和操作这个机器人。>"] = "0b2909b5910f8e6d10745fafc1b09916"
	},
	["命令宝珠"] = {
		["一个巨大的人类手印出现在宝珠的表面。除了看上去的那些处理过的痕迹，宝珠并没有损坏。"] = "0f22270c02f48a29cf9c86a0b391518f",
		["宝珠的印记和你的手正好适合。"] = "bac94d7200b614200b87cee2f536db9b"
	},
	["瑞兹尔的设计图"] = {
		["这些图纸被守卫着。和扎米克谈谈来引开守卫的注意！"] = "041b549b37d0c103ea25eda0b9a0c1e5"
	},
	["作战公告！"] = {
		["工作/遗失和找到物品/悬赏："] = "324d50e454c68ca640804647cebfd92d"
	},
	["稻草人灰烬"] = {
		["燃烧稻草人产生的灰烬散发出了魔法的力量。"] = "28dd5a31538999b63e73fb2d316c92e0",
		["燃烧稻草人产生的灰烬散发出了魔法的力量。你把这些灰烬抹在了脸上。"] = "9fde842505ae51e2e9603bb246e83c36"
	},
	["龙语傻瓜教程"] = {
		["凡人，你想要学习龙人语言，这简直是异想天开。为什么你想要学习这种古老的语言呢？真是不可理喻……"] = "26d2095bf010d5921e9b8e83bc514a84"
	},
	["疯狂石板"] = {
		["石板上篆刻着古老的图案，上面的文字蕴涵着可怕的力量，但是你无法理解它们的意思。"] = "0f473871a39a8811c5b5a7214b981765",
		["石板上篆刻着古老的图案，上面的文字蕴涵着可怕的力量，用来制造Gurubashi Mojo Madness……"] = "8fd8195d0c975f6f3c51d73be763553f"
	},
	["雷戈虫巢雕文水晶"] = {
		["水晶上布满了神秘的雕文和符文。你无法理解。"] = "580ccf1ef42fead3e20032eee01f307c"
	},
	["亚什虫巢雕文水晶"] = {
		["水晶上布满了神秘的雕文和符文。你无法理解。"] = "580ccf1ef42fead3e20032eee01f307c"
	},
	["佐拉虫巢雕文水晶"] = {
		["水晶上布满了神秘的雕文和符文。你无法理解。"] = "580ccf1ef42fead3e20032eee01f307c"
	},
	["次级风石"] = {
		["受死吧，异教徒！愿深渊的力量毁灭你！"] = "01594454427de3b4452e20be980b7818",
		["从石头中传来很轻的声音……$B$B你好，渺小的凡人。你为圣殿骑士带来了什么消息？"] = "66471c117f9a9c8fb2c8bcbff27683fb"
	},
	["强力风石"] = {
		["议会领主面前出现了一只虫子？没错，无疑是一只想要被碾碎的虫子！"] = "9f2e8057a4162af2cc00fd83ab0ece74",
		["从石头中传来雷鸣般的声音……$B$B你好，指挥官。你从希利苏斯给议会领主带来了什么消息？"] = "9e096eb8c378bcc66b01591b1b44e830",
		["从石头中传来雷霆般的声音……$B$B我感觉到你携带着身份勋章，教徒，但是你没有贵族之戒？你是不是真的是暮光之锤的指挥官，或者你只是一个跑腿的？"] = "e9af3f58bfcd009f6ff72f930ea3882f",
		["从石头中传来雷霆般的声音……$B$B这是什么？我感觉到一个小小的信徒在窜来窜去！快点走开，苦力，否则你将面对议会领主的愤怒！"] = "5fb610919b3f9ee9e77b9a37bbabaaea"
	},
	["不稳定的裂隙水晶"] = {
		["你在水晶中看到了巨大的通道和走廊。你认得这个地方：熔火之心。"] = "fa367d2c3c569877041b7b066d0093b9"
	},
	["节日礼物"] = {
		["这里有一大堆精心包裹的礼物。"] = "8ba566373c8454ba2c9076cbe5ab1416"
	},
	["詹迪斯·巴罗夫的日记"] = {
		["詹迪斯·巴罗夫的日记充斥着被遗忘者疯狂的怨念。在日记的结尾似乎有一份制作背包的裁缝图样。按你对裁缝技能的掌握程度，还不足以解读这张图样。"] = "ac3bf49b09e574e839ef683378f6e79d",
		["詹迪斯·巴罗夫的日记充斥着被遗忘者疯狂的怨念。在日记的结尾似乎有一份制作恶魔布包的裁缝图样。术士们使用恶魔布包来存储灵魂碎片。你想要在自己的日记里记录下图样的内容吗？"] = "2e4d9884e93c29c98746aa5d29d39c35",
		["詹迪斯·巴罗夫的日记充斥着被遗忘者疯狂的怨念。在日记的结尾似乎有一份制作恶魔布包的裁缝图样，术士们使用恶魔布包来存储灵魂碎片。你已经学会了制作这种背包的方法。"] = "36abb8fc0a6fcba22ad534dedab0826c"
	},
	["Wickerman Guardian Ember"] = {
		["燃烧稻草人产生的灰烬散发出了魔法的力量。"] = "28dd5a31538999b63e73fb2d316c92e0",
		["燃烧稻草人产生的灰烬散发出了魔法的力量。你把这些灰烬抹在了脸上。"] = "9fde842505ae51e2e9603bb246e83c36"
	},
	["冒泡的大锅"] = {
		["这口大锅冒着浓浓的绿色气泡。  不明生物的头骨、骨头和器官在粘稠的汤汁中游动......B$B懒洋洋地浮出水面的是两个曾经强大的巨魔的头骨：B$B甘祖拉恩和奈兹里奥克。"] = "e2a6c270301c181b6c1842c0f1642d01"
	},
	["通缉板"] = {
		["这块木板上放着粗制滥造的通缉海报。"] = "579f81628d1a733b0ce65a03da79fa94"
	},
	["辛迪加文档"] = {
		["这套卷轴包含各种后勤和战略信息，以及编码通信。"] = "123d940c52a3286b7fe6e73378e8284c"
	},
	["密斯莱尔水晶碎块"] = {
		["这些碎片闪烁着非自然的光泽。  很明显，它们内部隐藏着一种深层的力量。"] = "0bb4ea429a6648cd1a3a092485b0d1df"
	}
}