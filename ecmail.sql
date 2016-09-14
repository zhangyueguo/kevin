/*
Navicat MySQL Data Transfer

Source Server         : 远程数据库
Source Server Version : 50540
Source Host           : 192.168.123.53:3306
Source Database       : ecmail

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-09-14 13:19:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ecm_acategory
-- ----------------------------
DROP TABLE IF EXISTS `ecm_acategory`;
CREATE TABLE `ecm_acategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_acategory
-- ----------------------------
INSERT INTO `ecm_acategory` VALUES ('1', '商城帮助', '0', '0', 'help');
INSERT INTO `ecm_acategory` VALUES ('2', '商城公告', '0', '0', 'notice');
INSERT INTO `ecm_acategory` VALUES ('3', '内置文章', '0', '0', 'system');
INSERT INTO `ecm_acategory` VALUES ('4', '帮助中心', '1', '1', null);
INSERT INTO `ecm_acategory` VALUES ('5', '支付帮助', '1', '2', null);
INSERT INTO `ecm_acategory` VALUES ('6', '消费保障', '1', '3', null);
INSERT INTO `ecm_acategory` VALUES ('7', '服务条款', '1', '4', null);
INSERT INTO `ecm_acategory` VALUES ('8', '特色服务', '1', '5', null);
INSERT INTO `ecm_acategory` VALUES ('9', '商家服务', '1', '6', null);

-- ----------------------------
-- Table structure for ecm_address
-- ----------------------------
DROP TABLE IF EXISTS `ecm_address`;
CREATE TABLE `ecm_address` (
  `addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_address
-- ----------------------------
INSERT INTO `ecm_address` VALUES ('1', '3', '超级买家', '1', '中国', '请如实填写收货人详细地址', '', '', '8888888');
INSERT INTO `ecm_address` VALUES ('2', '3', '小刚上阵', '2214', '中国	山东	济南	天桥区', '重汽彩世界', '250000', '15689694786', '');
INSERT INTO `ecm_address` VALUES ('3', '7', 'test2', '2215', '中国	山东	济南	槐荫区', 'dfa', '256980', '15689694786', '');
INSERT INTO `ecm_address` VALUES ('4', '6', 'test1', '2213', '中国	山东	济南	历下区', '文化东路76号万豪星光天地步行街', '250000', '', '15689694786');

-- ----------------------------
-- Table structure for ecm_affiliate
-- ----------------------------
DROP TABLE IF EXISTS `ecm_affiliate`;
CREATE TABLE `ecm_affiliate` (
  `log_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(250) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `tname` varchar(255) NOT NULL,
  `leixing` varchar(100) NOT NULL,
  `time` int(10) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `store` int(20) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(10) NOT NULL DEFAULT '0',
  `separate_type` tinyint(1) NOT NULL DEFAULT '0',
  `daiid` int(11) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_affiliate
-- ----------------------------
INSERT INTO `ecm_affiliate` VALUES ('1', '1502032898', '91', '105', '注册分成', '1421814463', '90', '106', '21', '测试www', '65.40', '0', '0', '0');
INSERT INTO `ecm_affiliate` VALUES ('2', '1502032898', '91', '104', '注册分成', '1421814463', '89', '106', '21', '测试www', '54.50', '0', '0', '0');
INSERT INTO `ecm_affiliate` VALUES ('3', '1502032898', '91', '101', '注册分成', '1421814463', '21', '106', '21', '测试www', '43.60', '0', '0', '0');
INSERT INTO `ecm_affiliate` VALUES ('4', '1502096266', '91', '105', '注册分成', '1421821032', '90', '106', '21', '测试www', '65.40', '0', '0', '0');
INSERT INTO `ecm_affiliate` VALUES ('5', '1502096266', '91', '104', '注册分成', '1421821032', '89', '106', '21', '测试www', '54.50', '0', '0', '0');
INSERT INTO `ecm_affiliate` VALUES ('6', '1502096266', '91', '101', '注册分成', '1421821032', '21', '106', '21', '测试www', '43.60', '0', '0', '0');
INSERT INTO `ecm_affiliate` VALUES ('7', '1502955221', '96', '101', '代理商分成', '1422672373', '21', '115', '95', '测试代理商', '1.80', '0', '0', '1038');
INSERT INTO `ecm_affiliate` VALUES ('8', '1502955221', '96', 'sam123', '代理商分成', '1422672373', '2', '115', '95', '测试代理商', '2.40', '0', '0', '1047');

-- ----------------------------
-- Table structure for ecm_article
-- ----------------------------
DROP TABLE IF EXISTS `ecm_article`;
CREATE TABLE `ecm_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `cate_id` int(10) NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) DEFAULT NULL,
  `content` text,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `code` (`code`),
  KEY `cate_id` (`cate_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_article
-- ----------------------------
INSERT INTO `ecm_article` VALUES ('1', 'eula', '用户服务协议', '3', '0', '', '<p>特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 <br /> <br /> <strong>一、定义</strong><br /></p>\r\n<ol>\r\n<li>\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。</li>\r\n<li>\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。</li>\r\n<li>\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>二、用户资格</strong><br /> <br /> 只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。</p>\r\n<ol>\r\n<li>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</li>\r\n<li>未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；</li>\r\n<li>根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。</li>\r\n</ol>\r\n<p><br /> 无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。<br /> <br /> <strong>三.用户的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。</li>\r\n<li>用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。</li>\r\n<li>用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。</li>\r\n<li>用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户帐号。</li>\r\n<li>用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。</li>\r\n<li>用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。</li>\r\n<li>用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。</li>\r\n<li>用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。</li>\r\n<li>用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</li>\r\n<li>用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。</li>\r\n<li>用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。</li>\r\n<li>用户应自行承担因交易产生的相关费用，并依法纳税。</li>\r\n<li>未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。</li>\r\n<li>用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>四、 本网站的权利和义务</strong><br /></p>\r\n<ol>\r\n<li>本网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，  本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。</li>\r\n<li>本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</li>\r\n<li>本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。 </li>\r\n<li>本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。</li>\r\n<li>用  户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠  纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对  方。 </li>\r\n<li>因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：         \r\n<ul>\r\n<li>用户违反本协议或因被提及而纳入本协议的文件；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；</li>\r\n<li>存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。 </li>\r\n</ul>\r\n</li>\r\n<li>在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。</li>\r\n<li>根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。</li>\r\n<li>本  网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。</li>\r\n<li>用  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述  信息纳入其他作品内。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>五、服务的中断和终止</strong><br /></p>\r\n<ol>\r\n<li>在  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  (包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通  知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。 </li>\r\n<li>如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：         \r\n<ul>\r\n<li>用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。 </li>\r\n<li>用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。 </li>\r\n</ul>\r\n</li>\r\n<li>如存在下列情况，本网站可以通过注销用户的方式终止服务：         \r\n<ul>\r\n<li>在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；</li>\r\n<li>一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务； </li>\r\n<li>本协议终止或更新时，用户未确认新的协议的。 </li>\r\n<li>其它本网站认为需终止服务的情况。 </li>\r\n</ul>\r\n</li>\r\n<li>因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：         \r\n<ul>\r\n<li>本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。</li>\r\n<li>服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。 </li>\r\n<li>服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。</li>\r\n</ul>\r\n</li>\r\n<li>本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。</li>\r\n<li>对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>六、协议的修订</strong><br /> <br /> 本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。<br /> <br /> <strong>七、 本网站的责任范围 </strong><br /> <br /> 当用户接受该协议时，用户应明确了解并同意∶</p>\r\n<ol>\r\n<li>是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。</li>\r\n<li>用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。</li>\r\n<li>基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：         \r\n<ul>\r\n<li>本网站的使用或无法使用。</li>\r\n<li>经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。</li>\r\n<li>用户的传输或资料遭到未获授权的存取或变更。</li>\r\n<li>本网站中任何第三方之声明或行为。</li>\r\n<li>本网站其它相关事宜。</li>\r\n</ul>\r\n</li>\r\n<li>本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。</li>\r\n<li>本  网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均  由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。</li>\r\n</ol>\r\n<p><br /> <br /> <strong>八.、不可抗力</strong><br /> <br /> 因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的  客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人  为造成的灾难等客观情况。<br /> <br /> <strong>九、争议解决方式</strong><br /></p>\r\n<ol>\r\n<li>本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</li>\r\n<li>因  使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。</li>\r\n</ol>', '255', '1', '1240122848');
INSERT INTO `ecm_article` VALUES ('2', 'cert_autonym', '什么是实名认证', '3', '0', '', '<p><strong>什么是实名认证？</strong></p>\r\n<p>&ldquo;认证店铺&rdquo;服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。</p>\r\n<p>通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。</p>\r\n<p><strong>认证申请的方式：</strong></p>\r\n<p>Email：XXXX@XX.com</p>\r\n<p>管理员：XXXXXX</p>', '255', '1', '1240122848');
INSERT INTO `ecm_article` VALUES ('3', 'cert_material', '什么是实体店铺认证', '3', '0', '', '<p><strong>什么是实体店铺认证？</strong></p>\r\n<p>&ldquo;认证店铺&rdquo;服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。</p>\r\n<p>通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。</p>\r\n<p><strong>认证申请的方式：</strong></p>\r\n<p>Email：XXXX@XX.com</p>\r\n<p>管理员：XXXXXX</p>', '255', '1', '1240122848');
INSERT INTO `ecm_article` VALUES ('4', 'setup_store', '开店协议', '3', '0', '', '<p>使用本公司服务所须遵守的条款和条件。<br /><br />1.用户资格<br />本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的帐户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的帐户的权利。<br /><br />2.您的资料（包括但不限于所添加的任何商品）不得：<br />*具有欺诈性、虚假、不准确或具误导性；<br />*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br /><br />3.违约<br />如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />(a)您违反本协议或纳入本协议的文件；<br />(b)本公司无法核证或验证您向本公司提供的任何资料；<br />(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br /><br />4.责任限制<br />本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br /><br />5.无代理关系<br />用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br /><br />6.一般规定<br />本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</p>', '255', '1', '1240122848');
INSERT INTO `ecm_article` VALUES ('5', 'msn_privacy', 'MSN在线通隐私策略', '3', '0', '', '<p>Msn在线通隐私策略旨在说明您在本网站使用Msn在线通功能时我们如何保护您的Msn帐号信息。<br /> 我们认为隐私权非常重要。我们希望此隐私保护中心有助于您在本网站更好使用Msn在线通<br /> <strong>我们收集的信息</strong></p><blockquote>* 您在本网站激活Msn在线通时,程序将会记录您的Msn在线通帐号</blockquote><p><br /> <strong>您的选择</strong></p><blockquote>* 您可以在本网站随时注销您的Msn在线通帐号</blockquote><p><br /> <strong>其他隐私声明</strong></p><blockquote>* 如果我们需要改变本网站Msn在线通的隐私策略, 我们会把相关的改动在此页面发布.</blockquote>', '255', '1', '1240122848');
INSERT INTO `ecm_article` VALUES ('6', '', '怎么购物', '4', '0', '', '<p>怎么购物内容</p>', '255', '1', '1403733977');
INSERT INTO `ecm_article` VALUES ('7', '', '积分说明', '4', '0', '', '<p>积分说明内容</p>', '255', '1', '1403733991');
INSERT INTO `ecm_article` VALUES ('8', '', '如何维权', '4', '0', '', '<p>如何维权内容</p>', '255', '1', '1403734008');
INSERT INTO `ecm_article` VALUES ('9', '', '优惠券使用', '4', '0', '', '<p>优惠券使用内容</p>', '255', '1', '1403734025');
INSERT INTO `ecm_article` VALUES ('10', '', '付款方式', '5', '0', '', '<p>付款方式内容</p>', '255', '1', '1403734047');
INSERT INTO `ecm_article` VALUES ('11', '', '发票说明', '5', '0', '', '<p>发票说明内容</p>', '255', '1', '1403734068');
INSERT INTO `ecm_article` VALUES ('12', '', '货到付款', '5', '0', '', '<p>货到付款内容</p>', '255', '1', '1403734088');
INSERT INTO `ecm_article` VALUES ('13', '', '在线支付', '5', '0', '', '<p>在线支付内容</p>', '255', '1', '1403734102');
INSERT INTO `ecm_article` VALUES ('14', '', '服务承诺', '6', '0', '', '<p>服务承诺内容</p>', '255', '1', '1403734136');
INSERT INTO `ecm_article` VALUES ('15', '', '配送说明', '6', '0', '', '<p>配送说明内容</p>', '255', '1', '1403734172');
INSERT INTO `ecm_article` VALUES ('16', '', '售后上门', '6', '0', '', '<p>售后上门内容</p>', '255', '1', '1403734196');
INSERT INTO `ecm_article` VALUES ('17', '', '买差赔付', '6', '0', '', '<p>买差赔付内容</p>', '255', '1', '1403734223');
INSERT INTO `ecm_article` VALUES ('18', '', '退换货说明', '7', '0', '', '<p>退换货说明内容</p>', '255', '1', '1403734264');
INSERT INTO `ecm_article` VALUES ('19', '', '退款政策', '7', '0', '', '<p>退款政策内容</p>', '255', '1', '1403734296');
INSERT INTO `ecm_article` VALUES ('20', '', '退换货流程', '7', '0', '', '<p>退换货流程内容</p>', '255', '1', '1403734346');
INSERT INTO `ecm_article` VALUES ('21', '', '服务评论规则', '7', '0', '', '<p>服务评论规则内容</p>', '255', '1', '1403734380');
INSERT INTO `ecm_article` VALUES ('22', '', '会员卡购买', '8', '0', '', '<p>会员卡购买内容</p>', '255', '1', '1403734416');
INSERT INTO `ecm_article` VALUES ('23', '', '商家服务说明', '9', '0', '', '<p>商家服务说明内容</p>', '255', '1', '1403734442');
INSERT INTO `ecm_article` VALUES ('24', '', '我要开店', '9', '0', 'http://vmall.vchuang.cn/index.php?app=apply', '', '255', '1', '1403734666');
INSERT INTO `ecm_article` VALUES ('25', '', '商家后台', '9', '0', 'http://vmall.vchuang.cn/index.php?app=member&act=login', '', '255', '1', '1403734769');

-- ----------------------------
-- Table structure for ecm_attribute
-- ----------------------------
DROP TABLE IF EXISTS `ecm_attribute`;
CREATE TABLE `ecm_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `input_mode` varchar(10) NOT NULL DEFAULT 'text',
  `def_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_bank
-- ----------------------------
DROP TABLE IF EXISTS `ecm_bank`;
CREATE TABLE `ecm_bank` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  `account_name` varchar(20) NOT NULL,
  `open_bank` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `num` varchar(50) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_bank
-- ----------------------------
INSERT INTO `ecm_bank` VALUES ('3', '3', '中国工商银行', 'ICBC', '肖文纲', '中国工商银行打发十分行', 'debit', '622021602024087407');
INSERT INTO `ecm_bank` VALUES ('4', '6', '中国工商银行', 'ICBC', '小刚', '中国工商银行', 'debit', '6212261602009606106');
INSERT INTO `ecm_bank` VALUES ('6', '8', '中国工商银行', 'ICBC', '张曰国', '济南工商银行大观园支行', 'debit', '6222021602016553572');
INSERT INTO `ecm_bank` VALUES ('7', '10', '中国工商银行', 'ICBC', '越过', '济南经七路支行', 'debit', '6222021602016553572');

-- ----------------------------
-- Table structure for ecm_billing
-- ----------------------------
DROP TABLE IF EXISTS `ecm_billing`;
CREATE TABLE `ecm_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT '0',
  `shopid` int(11) DEFAULT NULL,
  `limit_money` int(5) DEFAULT NULL COMMENT '最大记账金额',
  `had_limit` float(5,2) DEFAULT '0.00' COMMENT '已使用记账单额度',
  `apply_time` int(11) DEFAULT NULL COMMENT '申请时间',
  `status` int(4) DEFAULT NULL COMMENT '状态：1、审核中；2、已通过；3、已驳回；41：逾期未还款；421个人已还款；422企业已还款；43本期结算后有新记账；5已过期；6取消记账功能',
  `this_balance` float(8,2) DEFAULT '0.00' COMMENT '本期欠款总额',
  `overdue_times` tinyint(4) DEFAULT '0' COMMENT '逾期次数',
  `excuse` varchar(600) DEFAULT NULL COMMENT '驳回理由',
  `bohui_time` int(11) DEFAULT NULL COMMENT '驳回时间',
  `bohuier_id` int(11) DEFAULT NULL COMMENT '驳回操作员id',
  `date_circle` tinyint(2) DEFAULT '0' COMMENT '结账周期（天）',
  `time_start` int(11) unsigned DEFAULT '0' COMMENT '本期结算开始时间，方便同一周期内进行多次结算！',
  `expiration_time` int(11) DEFAULT NULL COMMENT '到期时间',
  `times` int(3) DEFAULT '0' COMMENT '本期结算次数（注：记得进入下一周期清零）',
  `pass_time` int(11) DEFAULT NULL COMMENT '审核通过时间',
  `passer_id` int(11) DEFAULT NULL COMMENT '审核人员id',
  `revoke_shuoming` varchar(255) DEFAULT NULL COMMENT '取消记账的原因说明',
  `revoke_time` int(11) DEFAULT NULL COMMENT '取消记账特权时间',
  `revoker_id` int(11) DEFAULT NULL COMMENT '操作取消特权的人员id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_billing
-- ----------------------------
INSERT INTO `ecm_billing` VALUES ('19', '6', '2', '2', '1000', null, '1473218085', '2', '46.00', '0', null, null, null, '90', '0', '1480953600', '0', '1473218117', '2', null, null, null);
INSERT INTO `ecm_billing` VALUES ('20', '3', '0', '2', '500', '43.60', '1473235883', '421', '43.60', '0', null, null, null, '45', '1473307378', '1477065600', '2', '1473235901', '2', null, null, null);
INSERT INTO `ecm_billing` VALUES ('21', '3', '0', '9', '1000', null, '1473297861', '6', '0.00', '0', null, null, null, '0', '0', '1477605600', '0', '1473319830', '9', null, '1473321100', '9');
INSERT INTO `ecm_billing` VALUES ('22', '8', '2', '9', null, '0.00', '1473321324', '1', '0.00', '0', null, null, null, '0', '0', null, '0', null, null, null, null, null);
INSERT INTO `ecm_billing` VALUES ('23', '6', '0', '9', null, '0.00', '1473382644', '1', '0.00', '0', null, null, null, '0', '0', null, '0', null, null, null, null, null);
INSERT INTO `ecm_billing` VALUES ('24', '3', '0', '5', null, '0.00', '1473384488', '1', '0.00', '0', null, null, null, '0', '0', null, '0', null, null, null, null, null);
INSERT INTO `ecm_billing` VALUES ('25', '6', '0', '5', '100', '84.90', '1473385828', '2', '84.90', '0', null, null, null, '35', '0', '1476374400', '0', '1473385881', '5', null, null, null);

-- ----------------------------
-- Table structure for ecm_billing_balance
-- ----------------------------
DROP TABLE IF EXISTS `ecm_billing_balance`;
CREATE TABLE `ecm_billing_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `trade_sn` varchar(30) DEFAULT NULL,
  `is_press` tinyint(2) DEFAULT NULL COMMENT '是否被商家催账',
  `press_time` int(11) DEFAULT NULL COMMENT '商家催账时间',
  `this_money` float(11,2) DEFAULT NULL COMMENT '本次结算的金额数',
  `total_money` float(11,2) DEFAULT '0.00' COMMENT '本期账单内总共结算的金额数',
  `balance_time` int(11) DEFAULT NULL COMMENT '买家清算记账时间',
  `expiration_time` int(11) DEFAULT NULL COMMENT '本期到期时间',
  `status` int(2) DEFAULT '0' COMMENT '是否结算成功：1成功、2失败',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_billing_balance
-- ----------------------------
INSERT INTO `ecm_billing_balance` VALUES ('25', '20', '2016090811593473', null, null, '13.00', '43.60', '1473307378', '1477065600', '1');

-- ----------------------------
-- Table structure for ecm_billing_balance_faild
-- ----------------------------
DROP TABLE IF EXISTS `ecm_billing_balance_faild`;
CREATE TABLE `ecm_billing_balance_faild` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `balance_amount` float(11,2) DEFAULT NULL,
  `fail_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_billing_balance_faild
-- ----------------------------
INSERT INTO `ecm_billing_balance_faild` VALUES ('2', '18', '6', '2', '0.00', '1473228093');
INSERT INTO `ecm_billing_balance_faild` VALUES ('3', '0', '6', '2', '0.00', '1473228858');
INSERT INTO `ecm_billing_balance_faild` VALUES ('4', '0', '6', '2', '0.00', '1473229318');
INSERT INTO `ecm_billing_balance_faild` VALUES ('5', '0', '6', '2', '0.00', '1473229359');

-- ----------------------------
-- Table structure for ecm_brand
-- ----------------------------
DROP TABLE IF EXISTS `ecm_brand`;
CREATE TABLE `ecm_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL DEFAULT '',
  `brand_logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `if_show` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `tag` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`brand_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_brand
-- ----------------------------
INSERT INTO `ecm_brand` VALUES ('147', '米其林', 'data/files/mall/brand/147.jpg', '1', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('148', '固特异', 'data/files/mall/brand/148.jpg', '2', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('149', '普利司通', 'data/files/mall/brand/149.jpg', '3', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('150', '邓禄普', 'data/files/mall/brand/150.jpg', '4', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('151', '前进', 'data/files/mall/brand/151.jpg', '5', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('152', '朝阳', 'data/files/mall/brand/152.jpg', '6', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('153', '双钱', 'data/files/mall/brand/153.jpg', '7', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('154', '回力', 'data/files/mall/brand/154.jpg', '8', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('155', '风神', 'data/files/mall/brand/155.jpg', '9', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('156', '多力通', 'data/files/mall/brand/156.jpg', '10', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('157', '东洋', 'data/files/mall/brand/157.jpg', '11', '1', '11', '1', '轮胎');
INSERT INTO `ecm_brand` VALUES ('82', '宝马', 'data/files/mall/brand/82.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('83', '奥迪', 'data/files/mall/brand/83.jpg', '1', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('84', '奔驰', 'data/files/mall/brand/84.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('85', '本田', 'data/files/mall/brand/85.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('86', '雪佛兰', 'data/files/mall/brand/86.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('87', '大众', 'data/files/mall/brand/87.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('88', '雷克萨斯', 'data/files/mall/brand/88.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('89', '别克', 'data/files/mall/brand/89.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('90', '长安', 'data/files/mall/brand/90.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('91', '福特', 'data/files/mall/brand/91.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('92', '起亚', 'data/files/mall/brand/92.gif', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('93', '宝骏', 'data/files/mall/brand/93.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('94', '福田', 'data/files/mall/brand/94.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('95', '奇瑞', 'data/files/mall/brand/95.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('96', 'MG', 'data/files/mall/brand/96.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('97', '雪铁龙', 'data/files/mall/brand/97.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('98', '日产', 'data/files/mall/brand/98.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('99', '一汽', 'data/files/mall/brand/99.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('100', '现代', 'data/files/mall/brand/100.jpg', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('101', '比亚迪', 'data/files/mall/brand/101.gif', '255', '1', '0', '1', '汽车');
INSERT INTO `ecm_brand` VALUES ('102', '丰田', 'data/files/mall/brand/102.jpg', '255', '1', '0', '1', '汽车');

-- ----------------------------
-- Table structure for ecm_cart
-- ----------------------------
DROP TABLE IF EXISTS `ecm_cart`;
CREATE TABLE `ecm_cart` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `spec_id` int(10) unsigned NOT NULL DEFAULT '0',
  `specification` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `goods_image` varchar(255) DEFAULT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `old_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_cart
-- ----------------------------
INSERT INTO `ecm_cart` VALUES ('9', '3', '', '2', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:12', '9.50', '1', '', '0', '0.00');
INSERT INTO `ecm_cart` VALUES ('15', '5', '', '2', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:A4', '10.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '0.00');
INSERT INTO `ecm_cart` VALUES ('20', '8', '', '9', '112', '测试', '134', '20:1 30:1', '1.00', '1', 'data/files/store_9/goods_129/small_201609091732097224.png', '0', '0.00');

-- ----------------------------
-- Table structure for ecm_category_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecm_category_goods`;
CREATE TABLE `ecm_category_goods` (
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_category_goods
-- ----------------------------
INSERT INTO `ecm_category_goods` VALUES ('481', '112');

-- ----------------------------
-- Table structure for ecm_category_store
-- ----------------------------
DROP TABLE IF EXISTS `ecm_category_store`;
CREATE TABLE `ecm_category_store` (
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_category_store
-- ----------------------------
INSERT INTO `ecm_category_store` VALUES ('3', '2');
INSERT INTO `ecm_category_store` VALUES ('4', '5');
INSERT INTO `ecm_category_store` VALUES ('13', '9');
INSERT INTO `ecm_category_store` VALUES ('13', '11');

-- ----------------------------
-- Table structure for ecm_cate_pvs
-- ----------------------------
DROP TABLE IF EXISTS `ecm_cate_pvs`;
CREATE TABLE `ecm_cate_pvs` (
  `cate_id` int(11) NOT NULL,
  `pvs` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_cate_pvs
-- ----------------------------
INSERT INTO `ecm_cate_pvs` VALUES ('19', '1:1;1:6;2:2;2:7;2:8;2:9;3:3;3:10;4:4;4:11;5:5;5:12;5:13;5:14');
INSERT INTO `ecm_cate_pvs` VALUES ('20', '1:1;1:6;2:2;2:7;2:8;2:9;3:3;3:10;4:4;4:11;5:5;5:12;5:13;5:14');
INSERT INTO `ecm_cate_pvs` VALUES ('97', '1:1;1:6;2:2;2:7;2:8;2:9;3:3;3:10;4:4;4:11;5:5;5:12;5:13;5:14');
INSERT INTO `ecm_cate_pvs` VALUES ('461', '');
INSERT INTO `ecm_cate_pvs` VALUES ('466', '');
INSERT INTO `ecm_cate_pvs` VALUES ('472', '4:16;4:23;4:4;4:11;4:17');
INSERT INTO `ecm_cate_pvs` VALUES ('464', '3:22');
INSERT INTO `ecm_cate_pvs` VALUES ('473', '4:16;4:23;4:4;4:11;4:17');
INSERT INTO `ecm_cate_pvs` VALUES ('474', '4:16;4:23;4:4;4:11;4:17');

-- ----------------------------
-- Table structure for ecm_collect
-- ----------------------------
DROP TABLE IF EXISTS `ecm_collect`;
CREATE TABLE `ecm_collect` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'goods',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(60) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`type`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_collect
-- ----------------------------
INSERT INTO `ecm_collect` VALUES ('2', 'goods', '100', '', '1470422173');

-- ----------------------------
-- Table structure for ecm_company
-- ----------------------------
DROP TABLE IF EXISTS `ecm_company`;
CREATE TABLE `ecm_company` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(50) DEFAULT NULL,
  `prinvce` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `lxrname` varchar(30) DEFAULT NULL,
  `section` varchar(30) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `region_name` varchar(60) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `bus_img` varchar(100) DEFAULT NULL,
  `card_s` varchar(100) DEFAULT NULL,
  `card_x` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_company
-- ----------------------------
INSERT INTO `ecm_company` VALUES ('1', '曰国企业', '山东', '济南', '市中', '曰国', '一部', '879912345', '2147483647', 'woshistore2@qq.com', '中国	山东	济南	市中区', '2212', 'data/files/mall/company/bus_img.png', 'data/files/mall/company/card_s.png', 'data/files/mall/company/card_x.png', null);
INSERT INTO `ecm_company` VALUES ('2', '曰国企业', '山东', '济南', '槐荫', '曰国', '一部', '879912345', '2147483647', 'woshistore2@qq.com', '中国	山东	济南	市中区', '2212', 'data/files/mall/company/bus_img.png', 'data/files/mall/company/card_s.png', 'data/files/mall/company/card_x.png', null);
INSERT INTO `ecm_company` VALUES ('3', '曰国企业', null, null, null, '曰国', '一部', '879912345', '2147483647', 'woshistore2@qq.com', '中国	山东	济南	市中区', '2212', 'data/files/mall/company/bus_img.png', 'data/files/mall/company/card_s.png', 'data/files/mall/company/card_x.png', null);
INSERT INTO `ecm_company` VALUES ('4', '曰国企业', null, null, null, '曰国', '一部', '879912345', '2147483647', 'woshistore2@qq.com', '中国	山东	济南	市中区', '2212', 'data/files/mall/company/bus_img.png', 'data/files/mall/company/card_s.png', 'data/files/mall/company/card_x.png', null);
INSERT INTO `ecm_company` VALUES ('5', '曰国企业', null, null, null, '曰国', '一部', '879912345', '2147483647', 'woshistore2@qq.com', '中国	山东	济南	市中区', '2212', 'data/files/mall/company/bus_img.png', 'data/files/mall/company/card_s.png', 'data/files/mall/company/card_x.png', '8');
INSERT INTO `ecm_company` VALUES ('6', '糖果果', null, null, null, '曰国', '一部', '87995678', '2147483647', 'woshiqiye2@qq.com', '中国	山东	济南	市中区', '2212', 'data/files/mall/company/bus_img6.png', 'data/files/mall/company/card_s6.png', 'data/files/mall/company/card_x6.png', '10');

-- ----------------------------
-- Table structure for ecm_company_sect
-- ----------------------------
DROP TABLE IF EXISTS `ecm_company_sect`;
CREATE TABLE `ecm_company_sect` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `company_id` int(100) DEFAULT NULL,
  `sectname` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_company_sect
-- ----------------------------
INSERT INTO `ecm_company_sect` VALUES ('1', '2', '技术部', '0', '255');
INSERT INTO `ecm_company_sect` VALUES ('2', '5', '第一部门', '0', '255');
INSERT INTO `ecm_company_sect` VALUES ('3', '5', '第二部门', '0', '255');
INSERT INTO `ecm_company_sect` VALUES ('4', '5', '自部门', '2', '255');
INSERT INTO `ecm_company_sect` VALUES ('5', '6', '一部 ', '0', '255');

-- ----------------------------
-- Table structure for ecm_comworker
-- ----------------------------
DROP TABLE IF EXISTS `ecm_comworker`;
CREATE TABLE `ecm_comworker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workername` varchar(30) DEFAULT NULL,
  `workerphone` varchar(20) DEFAULT NULL,
  `sectid` int(100) DEFAULT NULL,
  `juese` int(1) DEFAULT NULL COMMENT '0 表示系统管理员 1 部门负责人 2 职工',
  `status` int(1) DEFAULT NULL COMMENT '0 未激活   1 激活',
  `company_id` int(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_comworker
-- ----------------------------
INSERT INTO `ecm_comworker` VALUES ('6', '肖文纲', '0536-3879138', '1', '0', '1', '2', '3');
INSERT INTO `ecm_comworker` VALUES ('7', '张新', '13864001247', '4', '2', '0', '5', null);
INSERT INTO `ecm_comworker` VALUES ('8', '刘一', '13969001256', '5', '2', '0', '6', null);

-- ----------------------------
-- Table structure for ecm_consumer_service
-- ----------------------------
DROP TABLE IF EXISTS `ecm_consumer_service`;
CREATE TABLE `ecm_consumer_service` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `c_s_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deposit_quota` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_consumer_service
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ecm_coupon`;
CREATE TABLE `ecm_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `coupon_name` varchar(100) NOT NULL DEFAULT '',
  `coupon_value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `use_times` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `if_issue` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`coupon_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_coupon
-- ----------------------------
INSERT INTO `ecm_coupon` VALUES ('1', '2', '我要测试下优惠券', '100.00', '1', '1470816000', '1472111999', '1000.00', '1');

-- ----------------------------
-- Table structure for ecm_coupon_sn
-- ----------------------------
DROP TABLE IF EXISTS `ecm_coupon_sn`;
CREATE TABLE `ecm_coupon_sn` (
  `coupon_sn` varchar(20) NOT NULL,
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0',
  `remain_times` int(10) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`coupon_sn`),
  KEY `coupon_id` (`coupon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_coupon_sn
-- ----------------------------
INSERT INTO `ecm_coupon_sn` VALUES ('000001069352', '1', '1');

-- ----------------------------
-- Table structure for ecm_credit
-- ----------------------------
DROP TABLE IF EXISTS `ecm_credit`;
CREATE TABLE `ecm_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shopid` int(11) DEFAULT NULL,
  `limit_yu` double(10,2) DEFAULT NULL COMMENT '预批准额度',
  `limit` double(10,2) DEFAULT NULL,
  `apliy_time` varchar(11) DEFAULT NULL COMMENT '申请时间',
  `approve_time` varchar(11) DEFAULT NULL COMMENT '批准时间',
  `approve_managerid` int(11) DEFAULT NULL COMMENT '批准人id',
  `approve_managename` varchar(255) DEFAULT NULL COMMENT '批准人姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_credit
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_credit_set
-- ----------------------------
DROP TABLE IF EXISTS `ecm_credit_set`;
CREATE TABLE `ecm_credit_set` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(50) DEFAULT NULL,
  `zhouqi` int(11) DEFAULT NULL,
  `zhangdanri` varchar(5) DEFAULT NULL,
  `jiesuanri` varchar(5) DEFAULT NULL,
  `zhijin` varchar(10) DEFAULT NULL,
  `emailtm` varchar(200) DEFAULT NULL,
  `phonetm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_credit_set
-- ----------------------------
INSERT INTO `ecm_credit_set` VALUES ('1', '2', '50', '2', '7', '1', '123', '123');
INSERT INTO `ecm_credit_set` VALUES ('6', '11', '50', null, null, '1', 'ewqe', 'werew');
INSERT INTO `ecm_credit_set` VALUES ('4', '5', '40', null, null, '0.3', '打发', '额啊发');
INSERT INTO `ecm_credit_set` VALUES ('5', '9', '50', null, null, '0.3', 'wozai cehsi', 'wozai ceshi');

-- ----------------------------
-- Table structure for ecm_credit_template
-- ----------------------------
DROP TABLE IF EXISTS `ecm_credit_template`;
CREATE TABLE `ecm_credit_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) NOT NULL,
  `credit_circle` tinyint(4) NOT NULL,
  `statement_date` int(11) DEFAULT NULL COMMENT '账单日',
  `close_date` int(11) DEFAULT NULL COMMENT '结算日',
  `late_fee` double(4,2) DEFAULT NULL COMMENT '滞纳金',
  `email_bill` text COMMENT '电子账单模板',
  `sms_bill` text COMMENT '短信账单模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_credit_template
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_datapacket
-- ----------------------------
DROP TABLE IF EXISTS `ecm_datapacket`;
CREATE TABLE `ecm_datapacket` (
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `add_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_datapacket
-- ----------------------------
INSERT INTO `ecm_datapacket` VALUES ('2', '100', '1471571146');
INSERT INTO `ecm_datapacket` VALUES ('2', '103', '1471590998');
INSERT INTO `ecm_datapacket` VALUES ('2', '104', '1471591019');

-- ----------------------------
-- Table structure for ecm_dazhuanpan
-- ----------------------------
DROP TABLE IF EXISTS `ecm_dazhuanpan`;
CREATE TABLE `ecm_dazhuanpan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `zhizhen` int(10) NOT NULL,
  `gailv` int(10) NOT NULL,
  `num` int(10) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_dazhuanpan
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_dazhuanpan_log
-- ----------------------------
DROP TABLE IF EXISTS `ecm_dazhuanpan_log`;
CREATE TABLE `ecm_dazhuanpan_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `is_zhong` int(10) NOT NULL,
  `jiangpin_id` int(10) NOT NULL,
  `is_fangfa` int(12) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_dazhuanpan_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_deposit_account
-- ----------------------------
DROP TABLE IF EXISTS `ecm_deposit_account`;
CREATE TABLE `ecm_deposit_account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `frozen` decimal(10,2) NOT NULL,
  `real_name` varchar(30) NOT NULL,
  `pay_status` varchar(3) NOT NULL DEFAULT 'off',
  `add_time` int(11) NOT NULL,
  `last_update` int(11) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=737 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_deposit_account
-- ----------------------------
INSERT INTO `ecm_deposit_account` VALUES ('726', '2', '1439623269@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '43.60', '0.00', 'seller', 'ON', '1439623269', '0');
INSERT INTO `ecm_deposit_account` VALUES ('727', '0', '1470105524@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '游客', 'ON', '1470105524', '0');
INSERT INTO `ecm_deposit_account` VALUES ('728', '3', '1470273419@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '56.40', '0.00', 'buyer', 'ON', '1470273419', '0');
INSERT INTO `ecm_deposit_account` VALUES ('729', '1', '1470621259@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', 'admin', 'ON', '1470621259', '0');
INSERT INTO `ecm_deposit_account` VALUES ('730', '5', '494443101@qq.com', '9cdcec454f5523923c9192650df00666', '0.00', '0.00', '小刚上阵', 'ON', '1471562329', '0');
INSERT INTO `ecm_deposit_account` VALUES ('731', '6', 'test1@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', 'test1', 'ON', '1472412973', '0');
INSERT INTO `ecm_deposit_account` VALUES ('732', '7', '123@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', 'test2', 'ON', '1472492021', '0');
INSERT INTO `ecm_deposit_account` VALUES ('733', '8', 'woshiqiye@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1500.00', '0.00', 'woshiqiye', 'ON', '1473015613', '1473708494');
INSERT INTO `ecm_deposit_account` VALUES ('734', '9', 'woshistore@qq.com', '947bc649339701b2bd27299097a4dee2', '200.00', '0.00', 'woshistore', 'ON', '1473221014', '0');
INSERT INTO `ecm_deposit_account` VALUES ('735', '10', 'woshiqiye2@qq.com', 'f2cccc7cacc0c4dab53d7eae44ff17e9', '0.00', '0.00', 'woshiqiye2', 'ON', '1473790845', '0');
INSERT INTO `ecm_deposit_account` VALUES ('736', '11', 'woshistore2@qq.com', 'cc0be3b340161f9a4734ee7b7f25d38e', '0.00', '0.00', 'woshistore2', 'ON', '1473794173', '0');

-- ----------------------------
-- Table structure for ecm_deposit_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ecm_deposit_recharge`;
CREATE TABLE `ecm_deposit_recharge` (
  `recharge_id` int(11) NOT NULL AUTO_INCREMENT,
  `tradesn` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `is_online` int(1) NOT NULL,
  `extra` text NOT NULL,
  `add_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `order_id` int(10) NOT NULL,
  PRIMARY KEY (`recharge_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_deposit_recharge
-- ----------------------------
INSERT INTO `ecm_deposit_recharge` VALUES ('32', '2016091309272976', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"j \";}', '1473701249', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('33', '2016091309314938', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473701509', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('34', '2016091309322640', '6', '1.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473701546', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('35', '2016091309362034', '6', '1.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473701780', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('36', '2016091309363951', '6', '0.50', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473701799', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('37', '2016091309370680', '6', '0.50', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473701826', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('38', '2016091309381979', '6', '0.50', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473701899', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('39', '2016091310433544', '6', '0.50', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473705815', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('40', '2016091310544693', '6', '0.50', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473706486', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('41', '2016091311072940', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473707249', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('42', '2016091311092118', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473707361', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('43', '2016091311094449', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473707384', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('44', '2016091311121321', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473707533', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('45', '2016091311184404', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473707924', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('46', '2016091311224392', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473708163', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('47', '2016091311313298', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473708692', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('48', '2016091311361183', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473708971', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('49', '2016091311364628', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473709006', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('50', '2016091315314529', '6', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473723105', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('51', '2016091316015604', '8', '300.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:3:\"300\";}', '1473724916', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('52', '2016091316115396', '8', '300.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:3:\"300\";}', '1473725513', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('53', '2016091316133764', '8', '300.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:3:\"300\";}', '1473725617', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('54', '2016091316144448', '8', '300.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:1:\"4\";}', '1473725684', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('55', '2016091316181353', '8', '50.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"50\";}', '1473725893', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('56', '2016091316220169', '8', '344.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"44\";}', '1473726121', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('57', '2016091316231088', '8', '55.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"55\";}', '1473726190', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('58', '2016091316233802', '8', '88.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"88\";}', '1473726218', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('59', '2016091316240338', '8', '77.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"77\";}', '1473726243', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('60', '2016091316243646', '8', '77.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"77\";}', '1473726276', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('61', '2016091316291011', '8', '77.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"77\";}', '1473726550', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('62', '2016091316292613', '8', '55.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"55\";}', '1473726566', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('63', '2016091316324549', '8', '99.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"99\";}', '1473726765', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('64', '2016091316342199', '8', '88.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"88\";}', '1473726861', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('65', '2016091316390082', '8', '23.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:2:\"23\";}', '1473727140', '0', '0', '0');
INSERT INTO `ecm_deposit_recharge` VALUES ('66', '2016091316475069', '8', '10.00', 'PENDING', '1', 'a:3:{s:6:\"payway\";s:9:\"支付宝\";s:12:\"payment_code\";s:6:\"alipay\";s:6:\"remark\";s:0:\"\";}', '1473727670', '0', '0', '0');

-- ----------------------------
-- Table structure for ecm_deposit_record
-- ----------------------------
DROP TABLE IF EXISTS `ecm_deposit_record`;
CREATE TABLE `ecm_deposit_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `tradesn` varchar(30) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `flow` varchar(10) NOT NULL,
  `purpose` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `payway` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `add_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_deposit_record
-- ----------------------------
INSERT INTO `ecm_deposit_record` VALUES ('127', '2016090811593473', '', '3', '2', '30.60', '69.40', 'outlay', 'billing_balance', 'SUCCESS', '预付款', '记账单结算', '', '1473278374', '1473278374', '1473278374');
INSERT INTO `ecm_deposit_record` VALUES ('128', '2016090811593473', '', '2', '3', '30.60', '30.60', 'income', 'billing_balance', 'SUCCESS', '预付款', '记账单结算', '', '1473278374', '1473278374', '1473278374');
INSERT INTO `ecm_deposit_record` VALUES ('129', '2016090812025850', '', '3', '2', '13.00', '56.40', 'outlay', 'billing_balance', 'SUCCESS', '预付款', '记账单结算', '', '1473278578', '1473278578', '1473278578');
INSERT INTO `ecm_deposit_record` VALUES ('130', '2016090812025850', '', '2', '3', '13.00', '43.60', 'income', 'billing_balance', 'SUCCESS', '预付款', '记账单结算', '', '1473278578', '1473278578', '1473278578');
INSERT INTO `ecm_deposit_record` VALUES ('131', '2016091412030291', '', '10', '11', '30.00', '30.00', 'income', 'billing_balance', 'SUCCESS', '预付款', '授信结算', '', '1473828187', '1473828187', '1473828187');

-- ----------------------------
-- Table structure for ecm_deposit_refund
-- ----------------------------
DROP TABLE IF EXISTS `ecm_deposit_refund`;
CREATE TABLE `ecm_deposit_refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`refund_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_deposit_refund
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_deposit_setting
-- ----------------------------
DROP TABLE IF EXISTS `ecm_deposit_setting`;
CREATE TABLE `ecm_deposit_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `trade_rate` decimal(10,3) NOT NULL,
  `transfer_rate` decimal(10,3) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_deposit_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_deposit_tequan
-- ----------------------------
DROP TABLE IF EXISTS `ecm_deposit_tequan`;
CREATE TABLE `ecm_deposit_tequan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tradesn` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `money` varchar(200) NOT NULL,
  `is_online` int(10) NOT NULL,
  `add_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_deposit_tequan
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_deposit_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `ecm_deposit_withdraw`;
CREATE TABLE `ecm_deposit_withdraw` (
  `withdraw_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `tradesn` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `card_info` text NOT NULL,
  `add_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`withdraw_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_deposit_withdraw
-- ----------------------------
INSERT INTO `ecm_deposit_withdraw` VALUES ('4', '98', '2016090616542211', '6', '20.00', 'CLOSED', 'a:6:{s:9:\"bank_name\";s:18:\"中国工商银行\";s:10:\"short_name\";s:4:\"ICBC\";s:12:\"account_name\";s:6:\"小刚\";s:9:\"open_bank\";s:18:\"中国工商银行\";s:4:\"type\";s:5:\"debit\";s:3:\"num\";s:19:\"6212261602009606106\";}', '1473123262', '1473123262', '1473123363');

-- ----------------------------
-- Table structure for ecm_egg
-- ----------------------------
DROP TABLE IF EXISTS `ecm_egg`;
CREATE TABLE `ecm_egg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `noun` int(10) DEFAULT NULL COMMENT '所需积分',
  `rate` int(10) DEFAULT NULL COMMENT '中奖比例 为千分比',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_egg
-- ----------------------------
INSERT INTO `ecm_egg` VALUES ('1', '金蛋', '1000', '10');
INSERT INTO `ecm_egg` VALUES ('2', '银蛋', '500', '100');
INSERT INTO `ecm_egg` VALUES ('3', '铜蛋', '100', '500');

-- ----------------------------
-- Table structure for ecm_eggpresent
-- ----------------------------
DROP TABLE IF EXISTS `ecm_eggpresent`;
CREATE TABLE `ecm_eggpresent` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `eggpresent_logo` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `byeggid` int(10) DEFAULT NULL COMMENT '所属的蛋的id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_eggpresent
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_eggpresentrec
-- ----------------------------
DROP TABLE IF EXISTS `ecm_eggpresentrec`;
CREATE TABLE `ecm_eggpresentrec` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `presentname` varchar(50) DEFAULT NULL COMMENT '礼品名称',
  `eggname` varchar(50) DEFAULT NULL COMMENT '砸的蛋的名称  如金蛋',
  `addtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_eggpresentrec
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_fengc
-- ----------------------------
DROP TABLE IF EXISTS `ecm_fengc`;
CREATE TABLE `ecm_fengc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `levol` int(11) NOT NULL,
  `pasen` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ecm_fengc
-- ----------------------------
INSERT INTO `ecm_fengc` VALUES ('10', '2', '1', '');
INSERT INTO `ecm_fengc` VALUES ('11', '2', '2', '');
INSERT INTO `ecm_fengc` VALUES ('12', '2', '3', '');
INSERT INTO `ecm_fengc` VALUES ('13', '5', '1', '3');
INSERT INTO `ecm_fengc` VALUES ('14', '5', '2', '');
INSERT INTO `ecm_fengc` VALUES ('15', '5', '3', '');
INSERT INTO `ecm_fengc` VALUES ('16', '9', '1', '');
INSERT INTO `ecm_fengc` VALUES ('17', '9', '2', '');
INSERT INTO `ecm_fengc` VALUES ('18', '9', '3', '');

-- ----------------------------
-- Table structure for ecm_friend
-- ----------------------------
DROP TABLE IF EXISTS `ecm_friend`;
CREATE TABLE `ecm_friend` (
  `owner_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friend_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`owner_id`,`friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_friend
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_function
-- ----------------------------
DROP TABLE IF EXISTS `ecm_function`;
CREATE TABLE `ecm_function` (
  `func_code` varchar(20) NOT NULL DEFAULT '',
  `func_name` varchar(60) NOT NULL DEFAULT '',
  `privileges` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`func_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_function
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_gcategory
-- ----------------------------
DROP TABLE IF EXISTS `ecm_gcategory`;
CREATE TABLE `ecm_gcategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `catpic` varchar(60) NOT NULL,
  PRIMARY KEY (`cate_id`),
  KEY `store_id` (`store_id`,`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=482 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_gcategory
-- ----------------------------
INSERT INTO `ecm_gcategory` VALUES ('481', '9', 'ceshi', '0', '255', '1', 'data/files/mall/catpic/catpic_481.png');
INSERT INTO `ecm_gcategory` VALUES ('480', '0', '特种纸', '476', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('479', '0', '铜版纸覆膜', '476', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('478', '0', '布纹纸', '475', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('477', '0', '皮纹纸', '475', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('476', '0', '特殊封面', '467', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('475', '0', '常规封面', '467', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('474', '0', 'B5', '466', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('473', '0', 'A4', '466', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('472', '0', 'A3', '466', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('471', '0', '胶装', '465', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('470', '0', '骑马钉', '465', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('469', '0', '平钉', '465', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('468', '0', '角钉', '465', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('467', '0', '封面', '461', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('466', '0', '纸张大小', '461', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('465', '0', '装订方式', '461', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('464', '0', '名片', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('463', '0', '户外广告', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('462', '0', '印刷', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('461', '0', '打印', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('448', '2', '果蔬', '0', '255', '0', '');
INSERT INTO `ecm_gcategory` VALUES ('449', '2', '酒水', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('450', '2', '食品', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('451', '2', '粮油干货', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('453', '2', '玩具用品', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('454', '2', '生活百货', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('456', '2', '电器', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('457', '2', '服装鞋', '0', '255', '1', '');
INSERT INTO `ecm_gcategory` VALUES ('459', '2', '电脑手机', '0', '255', '1', '');

-- ----------------------------
-- Table structure for ecm_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods`;
CREATE TABLE `ecm_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'material',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_name` varchar(255) NOT NULL DEFAULT '',
  `brand` varchar(100) NOT NULL,
  `spec_qty` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `spec_name_1` varchar(60) NOT NULL DEFAULT '',
  `spec_name_2` varchar(60) NOT NULL DEFAULT '',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `closed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `close_reason` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `default_spec` int(11) unsigned NOT NULL DEFAULT '0',
  `default_image` varchar(255) NOT NULL DEFAULT '',
  `recommended` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `cate_id_1` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_2` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_3` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id_4` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tags` varchar(102) NOT NULL,
  `if_open` tinyint(3) NOT NULL DEFAULT '0',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `recom` varchar(100) NOT NULL,
  `virtual_seles` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  KEY `store_id` (`store_id`),
  KEY `cate_id` (`cate_id`),
  KEY `cate_id_1` (`cate_id_1`),
  KEY `cate_id_2` (`cate_id_2`),
  KEY `cate_id_3` (`cate_id_3`),
  KEY `cate_id_4` (`cate_id_4`),
  KEY `brand` (`brand`(10)),
  KEY `tags` (`tags`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods
-- ----------------------------
INSERT INTO `ecm_goods` VALUES ('100', '2', 'material', '最好的测试黑白打印', '<p>这次填写的比较全面，希望能通过</p>', '461', '打印', '', '2', '颜色', '尺码', '1', '0', null, '1470421894', '1471565468', '103', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '1', '461', '0', '0', '0', '10.00', ',在线打印,', '0', '0.00', '', '1356');
INSERT INTO `ecm_goods` VALUES ('105', '2', 'material', '角钉', '<p>角钉</p>', '468', '打印	装订方式	角钉', '', '0', '', '', '1', '0', null, '1471566985', '1471566985', '114', '', '1', '461', '465', '468', '0', '0.30', ',角钉,', '0', '0.00', '', '12');
INSERT INTO `ecm_goods` VALUES ('106', '2', 'material', '平钉方式', '<p>平钉方式</p>', '469', '打印	装订方式	平钉', '', '0', '', '', '1', '0', null, '1471567022', '1471567022', '115', '', '1', '461', '465', '469', '0', '0.50', ',平钉方式,', '0', '0.00', '', '15');
INSERT INTO `ecm_goods` VALUES ('107', '2', 'material', '骑马钉方式', '<p>骑马钉方式</p>', '470', '打印	装订方式	骑马钉', '', '0', '', '', '1', '0', null, '1471567051', '1471567051', '116', '', '1', '461', '465', '470', '0', '0.50', ',骑马钉,', '0', '0.00', '', '16');
INSERT INTO `ecm_goods` VALUES ('108', '2', 'material', 'A3铜版纸70g打印', '<p>采用的是最好的铜版纸70g，保证打印效果！</p>', '472', '打印	纸张大小	A3', '', '2', '色彩', '单双面', '1', '0', null, '1471570195', '1471570478', '117', '', '1', '461', '466', '472', '0', '0.20', ',A3,铜版纸,打印,70g,', '0', '0.00', '', '15');
INSERT INTO `ecm_goods` VALUES ('109', '2', 'material', 'A3铜版纸80g打印', '<p>80g铜版纸对于要求比较高的企业石再好不过的了！</p>', '472', '打印	纸张大小	A3', '', '2', '色彩', '单双面', '1', '0', null, '1471570462', '1471570462', '121', '', '1', '461', '466', '472', '0', '0.50', ',A3,铜版纸,打印,80g,', '0', '0.00', '', '100');
INSERT INTO `ecm_goods` VALUES ('110', '2', 'material', 'A3布纹纸打印', '<p>布纹纸的效果显著提升了档次</p>', '472', '打印	纸张大小	A3', '', '2', '色彩', '单双面', '1', '0', null, '1471570584', '1471570584', '125', '', '1', '461', '466', '472', '0', '1.50', ',A3,布纹纸,打印,', '0', '0.00', '', '0');
INSERT INTO `ecm_goods` VALUES ('111', '2', 'material', 'A4铜版纸70g打印', '<p>精英产品</p>', '473', '打印	纸张大小	A4', '', '2', '色彩', '单双面', '1', '0', null, '1471629076', '1471629153', '129', '', '1', '461', '466', '473', '0', '0.10', ',A4铜版纸,70g,打印,', '0', '0.00', '', '0');
INSERT INTO `ecm_goods` VALUES ('112', '9', 'material', '测试', '<p>测试的小张的店的商品</p>', '464', '名片', '', '2', '20', '30', '1', '0', null, '1473384758', '1473385461', '134', 'data/files/store_9/goods_129/small_201609091732097224.png', '1', '464', '0', '0', '0', '1.00', ',ceshi,aaa,', '0', '0.00', '', '4');

-- ----------------------------
-- Table structure for ecm_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_attr`;
CREATE TABLE `ecm_goods_attr` (
  `gattr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_value` varchar(255) NOT NULL DEFAULT '',
  `attr_id` int(10) unsigned DEFAULT NULL,
  `sort_order` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`gattr_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_attr
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_goods_image
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_image`;
CREATE TABLE `ecm_goods_image` (
  `image_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `image_url` varchar(255) NOT NULL DEFAULT '',
  `thumbnail` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `file_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_image
-- ----------------------------
INSERT INTO `ecm_goods_image` VALUES ('105', '101', 'data/files/store_2/goods_11/201608190943317382.jpeg', 'data/files/store_2/goods_11/small_201608190943317382.jpeg', '1', '106');
INSERT INTO `ecm_goods_image` VALUES ('106', '100', 'data/files/store_2/goods_38/201608190943582337.jpeg', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '1', '107');
INSERT INTO `ecm_goods_image` VALUES ('108', '112', 'data/files/store_9/goods_129/201609091732097224.png', 'data/files/store_9/goods_129/small_201609091732097224.png', '1', '109');

-- ----------------------------
-- Table structure for ecm_goods_integral
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_integral`;
CREATE TABLE `ecm_goods_integral` (
  `goods_id` int(11) NOT NULL,
  `has_integral` int(11) NOT NULL DEFAULT '0',
  `max_exchange` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_integral
-- ----------------------------
INSERT INTO `ecm_goods_integral` VALUES ('1', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('2', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('3', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('4', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('5', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('6', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('7', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('8', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('9', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('10', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('11', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('12', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('13', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('14', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('15', '10', '10');
INSERT INTO `ecm_goods_integral` VALUES ('16', '10', '10');
INSERT INTO `ecm_goods_integral` VALUES ('17', '10', '10');
INSERT INTO `ecm_goods_integral` VALUES ('18', '10', '10');
INSERT INTO `ecm_goods_integral` VALUES ('19', '10', '10');
INSERT INTO `ecm_goods_integral` VALUES ('99', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('100', '1', '10');
INSERT INTO `ecm_goods_integral` VALUES ('101', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('102', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('103', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('104', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('105', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('106', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('107', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('108', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('109', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('110', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('111', '0', '0');
INSERT INTO `ecm_goods_integral` VALUES ('112', '2', '2');

-- ----------------------------
-- Table structure for ecm_goods_prop
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_prop`;
CREATE TABLE `ecm_goods_prop` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_prop
-- ----------------------------
INSERT INTO `ecm_goods_prop` VALUES ('4', '纸张类型', '1', '255');
INSERT INTO `ecm_goods_prop` VALUES ('5', '价格区间', '1', '255');

-- ----------------------------
-- Table structure for ecm_goods_prop_value
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_prop_value`;
CREATE TABLE `ecm_goods_prop_value` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `prop_value` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_prop_value
-- ----------------------------
INSERT INTO `ecm_goods_prop_value` VALUES ('4', '4', '皮纹纸', '1', '255');
INSERT INTO `ecm_goods_prop_value` VALUES ('5', '5', '0-50', '1', '255');
INSERT INTO `ecm_goods_prop_value` VALUES ('11', '4', '布纹纸', '1', '255');
INSERT INTO `ecm_goods_prop_value` VALUES ('12', '5', '50-100', '1', '255');
INSERT INTO `ecm_goods_prop_value` VALUES ('13', '5', '100-200', '1', '255');
INSERT INTO `ecm_goods_prop_value` VALUES ('14', '5', '200-500', '1', '255');
INSERT INTO `ecm_goods_prop_value` VALUES ('16', '4', '铜版纸70g', '1', '1');
INSERT INTO `ecm_goods_prop_value` VALUES ('17', '4', '特种纸', '1', '255');
INSERT INTO `ecm_goods_prop_value` VALUES ('23', '4', '铜版纸80g', '1', '1');

-- ----------------------------
-- Table structure for ecm_goods_pvs
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_pvs`;
CREATE TABLE `ecm_goods_pvs` (
  `goods_id` int(11) NOT NULL,
  `pvs` text NOT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_pvs
-- ----------------------------
INSERT INTO `ecm_goods_pvs` VALUES ('1', '5:12;4:11;3:3;2:2;1:6');
INSERT INTO `ecm_goods_pvs` VALUES ('2', '');
INSERT INTO `ecm_goods_pvs` VALUES ('3', '');
INSERT INTO `ecm_goods_pvs` VALUES ('4', '');
INSERT INTO `ecm_goods_pvs` VALUES ('5', '');
INSERT INTO `ecm_goods_pvs` VALUES ('6', '');
INSERT INTO `ecm_goods_pvs` VALUES ('7', '');
INSERT INTO `ecm_goods_pvs` VALUES ('8', '');
INSERT INTO `ecm_goods_pvs` VALUES ('19', '');
INSERT INTO `ecm_goods_pvs` VALUES ('20', '');
INSERT INTO `ecm_goods_pvs` VALUES ('21', '');
INSERT INTO `ecm_goods_pvs` VALUES ('25', '');
INSERT INTO `ecm_goods_pvs` VALUES ('26', '');
INSERT INTO `ecm_goods_pvs` VALUES ('27', '');
INSERT INTO `ecm_goods_pvs` VALUES ('99', '');
INSERT INTO `ecm_goods_pvs` VALUES ('100', '1:1;3:10;4:11');
INSERT INTO `ecm_goods_pvs` VALUES ('101', '6:18');
INSERT INTO `ecm_goods_pvs` VALUES ('102', '6:19');
INSERT INTO `ecm_goods_pvs` VALUES ('103', '6:20');
INSERT INTO `ecm_goods_pvs` VALUES ('104', '6:21');
INSERT INTO `ecm_goods_pvs` VALUES ('108', '4:16');
INSERT INTO `ecm_goods_pvs` VALUES ('109', '4:23');
INSERT INTO `ecm_goods_pvs` VALUES ('110', '4:11');
INSERT INTO `ecm_goods_pvs` VALUES ('111', '4:16');

-- ----------------------------
-- Table structure for ecm_goods_qa
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_qa`;
CREATE TABLE `ecm_goods_qa` (
  `ques_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_content` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `email` varchar(60) NOT NULL,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `reply_content` varchar(255) NOT NULL,
  `time_post` int(10) unsigned NOT NULL,
  `time_reply` int(10) unsigned NOT NULL,
  `if_new` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'goods',
  PRIMARY KEY (`ques_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`item_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_qa
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_spec`;
CREATE TABLE `ecm_goods_spec` (
  `spec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `spec_1` varchar(60) NOT NULL DEFAULT '',
  `spec_2` varchar(60) NOT NULL DEFAULT '',
  `color_rgb` varchar(7) NOT NULL DEFAULT '',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`spec_id`),
  KEY `goods_id` (`goods_id`),
  KEY `price` (`price`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_spec
-- ----------------------------
INSERT INTO `ecm_goods_spec` VALUES ('109', '100', '单面', 'A4', '', '15.00', '12', '');
INSERT INTO `ecm_goods_spec` VALUES ('108', '104', '', '', '', '1.00', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('107', '103', '', '', '', '0.50', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('106', '102', '', '', '', '0.50', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('105', '101', '', '', '', '0.30', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('104', '100', '彩色', 'A4', '', '18.00', '12', '');
INSERT INTO `ecm_goods_spec` VALUES ('103', '100', '黑白', 'A4', '', '10.00', '2', '');
INSERT INTO `ecm_goods_spec` VALUES ('115', '106', '', '', '', '0.50', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('114', '105', '', '', '', '0.30', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('113', '100', '单面', 'A3', '', '25.00', '12', '');
INSERT INTO `ecm_goods_spec` VALUES ('112', '100', '彩色', 'A3', '', '25.00', '11', '');
INSERT INTO `ecm_goods_spec` VALUES ('111', '100', '黑白', 'A3', '', '20.00', '12', '');
INSERT INTO `ecm_goods_spec` VALUES ('110', '100', '双面', 'A4', '', '13.00', '10', '');
INSERT INTO `ecm_goods_spec` VALUES ('120', '108', '彩色', '双面', '', '0.25', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('119', '108', '彩色', '单面', '', '0.30', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('118', '108', '黑白', '双面', '', '0.15', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('117', '108', '黑白', '单面', '', '0.20', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('116', '107', '', '', '', '0.50', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('125', '110', '黑白', '单面', '', '1.50', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('124', '109', '彩色', '双面', '', '0.80', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('123', '109', '黑白', '双面', '', '0.40', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('122', '109', '彩色', '单面', '', '1.00', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('121', '109', '黑白', '单面', '', '0.50', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('130', '111', '黑白', '双面', '', '0.08', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('129', '111', '黑白', '单面', '', '0.10', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('128', '110', '彩色', '双面', '', '2.00', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('127', '110', '黑白', '双面', '', '1.20', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('126', '110', '彩色', '单面', '', '2.50', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('134', '112', '1', '1', '', '1.00', '2', '1');
INSERT INTO `ecm_goods_spec` VALUES ('132', '111', '彩色', '双面', '', '0.17', '0', '');
INSERT INTO `ecm_goods_spec` VALUES ('131', '111', '彩色', '单面', '', '0.20', '0', '');

-- ----------------------------
-- Table structure for ecm_goods_statistics
-- ----------------------------
DROP TABLE IF EXISTS `ecm_goods_statistics`;
CREATE TABLE `ecm_goods_statistics` (
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `collects` int(10) unsigned NOT NULL DEFAULT '0',
  `carts` int(10) unsigned NOT NULL DEFAULT '0',
  `orders` int(10) unsigned NOT NULL DEFAULT '0',
  `sales` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_goods_statistics
-- ----------------------------
INSERT INTO `ecm_goods_statistics` VALUES ('108', '3', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('107', '0', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('106', '0', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('105', '2', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('104', '0', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('103', '2', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('102', '0', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('101', '2', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('100', '51', '1', '11', '8', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('112', '9', '0', '1', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('111', '2', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('110', '5', '0', '0', '0', '0', '0');
INSERT INTO `ecm_goods_statistics` VALUES ('109', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for ecm_grade_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecm_grade_goods`;
CREATE TABLE `ecm_grade_goods` (
  `goods_id` int(255) NOT NULL,
  `grade_id` int(20) NOT NULL,
  `grade` int(20) NOT NULL,
  `grade_discount` decimal(4,2) NOT NULL DEFAULT '1.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_grade_goods
-- ----------------------------
INSERT INTO `ecm_grade_goods` VALUES ('100', '1', '1', '0.95');
INSERT INTO `ecm_grade_goods` VALUES ('100', '2', '2', '0.90');

-- ----------------------------
-- Table structure for ecm_groupbuy
-- ----------------------------
DROP TABLE IF EXISTS `ecm_groupbuy`;
CREATE TABLE `ecm_groupbuy` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL DEFAULT '',
  `group_image` varchar(255) NOT NULL,
  `group_desc` varchar(255) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `spec_price` text NOT NULL,
  `min_quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `max_per_user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `goods_id` (`goods_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_groupbuy
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_groupbuy_log
-- ----------------------------
DROP TABLE IF EXISTS `ecm_groupbuy_log`;
CREATE TABLE `ecm_groupbuy_log` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `quantity` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spec_quantity` text NOT NULL,
  `linkman` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_groupbuy_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_huibiaoli_wanted
-- ----------------------------
DROP TABLE IF EXISTS `ecm_huibiaoli_wanted`;
CREATE TABLE `ecm_huibiaoli_wanted` (
  `w_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price_from` decimal(10,2) NOT NULL DEFAULT '0.00',
  `price_to` decimal(10,2) NOT NULL DEFAULT '0.00',
  `region` varchar(255) NOT NULL,
  `linkman` varchar(60) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `detail` text NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`w_id`),
  KEY `user_id` (`user_id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_huibiaoli_wanted
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_huibiaoli_wcategory
-- ----------------------------
DROP TABLE IF EXISTS `ecm_huibiaoli_wcategory`;
CREATE TABLE `ecm_huibiaoli_wcategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_huibiaoli_wcategory
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_integral
-- ----------------------------
DROP TABLE IF EXISTS `ecm_integral`;
CREATE TABLE `ecm_integral` (
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_integral
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_invite_record
-- ----------------------------
DROP TABLE IF EXISTS `ecm_invite_record`;
CREATE TABLE `ecm_invite_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `user_name` varchar(120) NOT NULL DEFAULT '0',
  `invite_id` int(10) NOT NULL DEFAULT '0',
  `invite_name` varchar(120) NOT NULL DEFAULT '0',
  `user_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `start_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_invite_record
-- ----------------------------
INSERT INTO `ecm_invite_record` VALUES ('1', '14', 'xiaozhi10', '6', '德可士', '125.89.50.209', '1417825761');
INSERT INTO `ecm_invite_record` VALUES ('2', '8', 'woshiqiye', '1', 'admin', '0.0.0.0', '1473015613');
INSERT INTO `ecm_invite_record` VALUES ('3', '10', 'woshiqiye2', '8', 'woshiqiye', '127.0.0.1', '1473790845');
INSERT INTO `ecm_invite_record` VALUES ('4', '11', 'woshistore2', '9', 'woshistore', '127.0.0.1', '1473794173');

-- ----------------------------
-- Table structure for ecm_invoice
-- ----------------------------
DROP TABLE IF EXISTS `ecm_invoice`;
CREATE TABLE `ecm_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `invoice_tid` int(11) NOT NULL DEFAULT '0' COMMENT '发票模板id',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '发票类型：1个人、2企业',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态：1、已申请；2、已受理；3、已寄出；4、已收到',
  `apply_date` int(11) NOT NULL DEFAULT '0',
  `apply_uid` int(11) NOT NULL DEFAULT '0',
  `agree_date` int(11) NOT NULL DEFAULT '0',
  `agree_uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_invoice
-- ----------------------------
INSERT INTO `ecm_invoice` VALUES ('1', '3', '0', '1', '1', '1471078090', '3', '0', '0');
INSERT INTO `ecm_invoice` VALUES ('7', '2', '0', '2', '1', '1471404836', '3', '0', '0');

-- ----------------------------
-- Table structure for ecm_invoice_template
-- ----------------------------
DROP TABLE IF EXISTS `ecm_invoice_template`;
CREATE TABLE `ecm_invoice_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `company_id` int(11) NOT NULL COMMENT '会员所属公司id',
  `company_name` varchar(255) NOT NULL,
  `taxpayer_code` varchar(30) NOT NULL COMMENT '纳税人识别号码',
  `company_address` varchar(255) NOT NULL COMMENT '注册地址',
  `company_phone` int(12) NOT NULL COMMENT '注册电话',
  `deposit_bank` varchar(255) NOT NULL COMMENT '开户银行',
  `number_bank` varchar(255) NOT NULL COMMENT '开户账号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_invoice_template
-- ----------------------------
INSERT INTO `ecm_invoice_template` VALUES ('17', '3', '0', '山东子曰教育科技有限公司', '598221678951', '山东省济南大学', '531', '中国银行济南分行', '6275896565899544621');
INSERT INTO `ecm_invoice_template` VALUES ('18', '8', '0', 'wer', 'wr', 'we', '0', '', '');

-- ----------------------------
-- Table structure for ecm_jindan_log
-- ----------------------------
DROP TABLE IF EXISTS `ecm_jindan_log`;
CREATE TABLE `ecm_jindan_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `jiner` int(10) NOT NULL,
  `stime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_jindan_log
-- ----------------------------
INSERT INTO `ecm_jindan_log` VALUES ('1', '10', '10', '2', '1406563200');
INSERT INTO `ecm_jindan_log` VALUES ('2', '10', '555', '0', '1406563200');
INSERT INTO `ecm_jindan_log` VALUES ('3', '10', '10', '2', '1408723200');

-- ----------------------------
-- Table structure for ecm_jindan_shop
-- ----------------------------
DROP TABLE IF EXISTS `ecm_jindan_shop`;
CREATE TABLE `ecm_jindan_shop` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) NOT NULL,
  `jindan_num` int(10) NOT NULL,
  `stime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_jindan_shop
-- ----------------------------
INSERT INTO `ecm_jindan_shop` VALUES ('1', '10', '9995', '1406602613');

-- ----------------------------
-- Table structure for ecm_ju
-- ----------------------------
DROP TABLE IF EXISTS `ecm_ju`;
CREATE TABLE `ecm_ju` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned DEFAULT NULL,
  `cate_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_desc` text,
  `goods_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `spec_price` text NOT NULL,
  `max_per_user` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `status_desc` varchar(50) NOT NULL,
  `recommend` tinyint(3) unsigned NOT NULL,
  `views` int(10) unsigned NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `channel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `brand_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `goods_id` (`goods_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_ju
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_ju_brand
-- ----------------------------
DROP TABLE IF EXISTS `ecm_ju_brand`;
CREATE TABLE `ecm_ju_brand` (
  `brand_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL DEFAULT '',
  `brand_logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `if_show` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `tag` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`brand_id`),
  KEY `tag` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_ju_brand
-- ----------------------------
INSERT INTO `ecm_ju_brand` VALUES ('1', '森马', 'data/files/mall/ju_brand/1.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('2', 'OSA', 'data/files/mall/ju_brand/5.jpg', '255', '0', '0', '1', '数码家电');
INSERT INTO `ecm_ju_brand` VALUES ('3', '名鞋库', 'data/files/mall/ju_brand/3.jpg', '255', '0', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('4', '童年时光', 'data/files/mall/ju_brand/34.jpg', '255', '0', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('5', '周黑鸭', 'data/files/mall/ju_brand/33.jpg', '255', '1', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('6', 'ONLY', 'data/files/mall/ju_brand/6.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('7', '浪莎', 'data/files/mall/ju_brand/7.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('8', '太平鸟', 'data/files/mall/ju_brand/8.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('9', 'OSA欧莎', 'data/files/mall/ju_brand/9.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('10', '乐町', 'data/files/mall/ju_brand/10.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('11', '九牧王', 'data/files/mall/ju_brand/11.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('12', '骆驼男装', 'data/files/mall/ju_brand/12.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('13', '秋水伊人', 'data/files/mall/ju_brand/13.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('14', '马克华菲', 'data/files/mall/ju_brand/14.jpg', '255', '1', '0', '1', '服装服饰');
INSERT INTO `ecm_ju_brand` VALUES ('15', '如熙', 'data/files/mall/ju_brand/15.jpg', '255', '1', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('16', '茵曼', 'data/files/mall/ju_brand/16.jpg', '255', '1', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('17', '李宁', 'data/files/mall/ju_brand/17.jpg', '255', '1', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('18', '佳钓尼', 'data/files/mall/ju_brand/18.jpg', '255', '1', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('19', '卓诗尼', 'data/files/mall/ju_brand/19.jpg', '255', '1', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('20', '奥康', 'data/files/mall/ju_brand/20.jpg', '255', '1', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('21', '意尔康', 'data/files/mall/ju_brand/21.jpg', '255', '0', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('22', '丹尼熊', 'data/files/mall/ju_brand/22.jpg', '255', '1', '0', '1', '运动鞋包');
INSERT INTO `ecm_ju_brand` VALUES ('23', 'SKG', 'data/files/mall/ju_brand/23.jpg', '255', '1', '0', '1', '数码家电');
INSERT INTO `ecm_ju_brand` VALUES ('24', '爱斯基摩人', 'data/files/mall/ju_brand/24.jpg', '255', '1', '0', '1', '数码家电');
INSERT INTO `ecm_ju_brand` VALUES ('25', '美的', 'data/files/mall/ju_brand/25.jpg', '255', '1', '0', '1', '数码家电');
INSERT INTO `ecm_ju_brand` VALUES ('26', '亨氏', 'data/files/mall/ju_brand/26.jpg', '255', '0', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('27', '贝因美', 'data/files/mall/ju_brand/27.jpg', '255', '1', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('28', '帮宝适', 'data/files/mall/ju_brand/28.jpg', '255', '0', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('29', '安耐驰', 'data/files/mall/ju_brand/29.jpg', '255', '1', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('30', '宝宝金水', 'data/files/mall/ju_brand/30.jpg', '255', '1', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('31', '山野农夫', 'data/files/mall/ju_brand/31.jpg', '255', '0', '0', '1', '母婴百货');
INSERT INTO `ecm_ju_brand` VALUES ('32', '苏菲', 'data/files/mall/ju_brand/32.jpg', '255', '1', '0', '1', '母婴百货');

-- ----------------------------
-- Table structure for ecm_ju_cate
-- ----------------------------
DROP TABLE IF EXISTS `ecm_ju_cate`;
CREATE TABLE `ecm_ju_cate` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(20) NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `channel` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_ju_cate
-- ----------------------------
INSERT INTO `ecm_ju_cate` VALUES ('1', '商品团', '0', '1', '1', '1');
INSERT INTO `ecm_ju_cate` VALUES ('2', '生活汇', '0', '11', '1', '5');
INSERT INTO `ecm_ju_cate` VALUES ('3', '休闲', '2', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('4', '服饰', '1', '44', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('5', '配饰', '1', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('6', '美食', '2', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('7', '电影', '2', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('8', '超市', '2', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('9', '摄影', '2', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('10', '门票', '2', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('12', '鞋包', '1', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('13', '运动', '1', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('16', '服饰鞋包', '15', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('17', '美容百货', '15', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('18', '母婴孕产', '15', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('19', '家装家纺', '15', '255', '1', null);
INSERT INTO `ecm_ju_cate` VALUES ('20', '聚名品', '0', '255', '1', '3');
INSERT INTO `ecm_ju_cate` VALUES ('21', '童装专场', '20', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('22', '饰品专场', '20', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('23', '家电专场', '20', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('24', '拉歌蒂尼', '20', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('25', '聚家装', '0', '255', '1', '4');
INSERT INTO `ecm_ju_cate` VALUES ('26', '建材', '25', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('27', '家具', '25', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('28', '家纺', '25', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('29', '家电', '25', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('30', '旅游团', '0', '255', '1', '6');
INSERT INTO `ecm_ju_cate` VALUES ('31', '境内游', '30', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('32', '境外游', '30', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('33', '周边游', '30', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('34', '美妆', '1', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('35', '食品', '1', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('36', '母婴', '1', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('37', '家居', '1', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('38', '家电', '1', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('39', '百货', '1', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('40', '车品', '1', '255', '1', '0');
INSERT INTO `ecm_ju_cate` VALUES ('41', '内衣', '1', '255', '1', '0');

-- ----------------------------
-- Table structure for ecm_ju_template
-- ----------------------------
DROP TABLE IF EXISTS `ecm_ju_template`;
CREATE TABLE `ecm_ju_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `join_end_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `state` tinyint(1) unsigned NOT NULL,
  `channel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_ju_template
-- ----------------------------
INSERT INTO `ecm_ju_template` VALUES ('4', '双12促销', '1413577363', '1414009363', '1414700563', '2', '1');
INSERT INTO `ecm_ju_template` VALUES ('5', '新年团购', '1418716800', '1421395200', '1450252800', '2', '1');

-- ----------------------------
-- Table structure for ecm_kmenus
-- ----------------------------
DROP TABLE IF EXISTS `ecm_kmenus`;
CREATE TABLE `ecm_kmenus` (
  `kmenus_id` int(10) unsigned NOT NULL,
  `stypeinfo` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stype` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`kmenus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_kmenus
-- ----------------------------
INSERT INTO `ecm_kmenus` VALUES ('2', '4', '0', '1');

-- ----------------------------
-- Table structure for ecm_kmenusinfo
-- ----------------------------
DROP TABLE IF EXISTS `ecm_kmenusinfo`;
CREATE TABLE `ecm_kmenusinfo` (
  `kmenusinfo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kmenus_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `color` varchar(20) NOT NULL DEFAULT '',
  `loadurl` varchar(255) NOT NULL DEFAULT '',
  `imgurl` varchar(255) NOT NULL DEFAULT '',
  `nums` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`kmenusinfo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_kmenusinfo
-- ----------------------------
INSERT INTO `ecm_kmenusinfo` VALUES ('1', '2', '', 'FFB92E', 'tel:12345678', 'http://vmall.vchuang.cn/mall/kmenus/plugmenu1.png', '1');
INSERT INTO `ecm_kmenusinfo` VALUES ('2', '2', '客服QQ', '088CFF', 'http://wpa.qq.com/msgrd?v=3&uin=361818525&site=qq&menu=yes', 'http://vmall.vchuang.cn/mall/kmenus/plugmenu20.png', '2');
INSERT INTO `ecm_kmenusinfo` VALUES ('3', '2', '购物', 'FF47E0', 'http://vmall.vchuang.cn/index.php?app=cart', 'http://vmall.vchuang.cn/mall/kmenus/plugmenu9.png', '3');

-- ----------------------------
-- Table structure for ecm_lottery
-- ----------------------------
DROP TABLE IF EXISTS `ecm_lottery`;
CREATE TABLE `ecm_lottery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '活动名称',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `statdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `startinfo` varchar(255) NOT NULL DEFAULT '' COMMENT '活动规则',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '活动说明',
  `startpicurl` varchar(255) NOT NULL DEFAULT '' COMMENT '开始图片',
  `endinfo` varchar(255) NOT NULL DEFAULT '' COMMENT '结束说明',
  `endpicurl` varchar(255) NOT NULL DEFAULT '' COMMENT '结束图片',
  `fist` varchar(255) NOT NULL DEFAULT '',
  `fistnums` int(10) unsigned NOT NULL DEFAULT '0',
  `second` varchar(255) NOT NULL DEFAULT '',
  `secondnums` int(10) unsigned NOT NULL DEFAULT '0',
  `third` varchar(255) NOT NULL DEFAULT '',
  `thirdnums` int(10) unsigned NOT NULL DEFAULT '0',
  `dayflag` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '抽奖方式',
  `allpeople` varchar(255) NOT NULL DEFAULT '' COMMENT '中奖概率',
  `joinnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '加入人数',
  `checkpwd` varchar(255) NOT NULL DEFAULT '' COMMENT '兑奖密码',
  `displayjpnums` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示奖品数量',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数量',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_lottery
-- ----------------------------
INSERT INTO `ecm_lottery` VALUES ('4', '大转盘活动', '2', '1400025600', '1400544000', '123123', '亲，请点击进入大转盘活123动页面，祝您好运哦！', '', '亲，活动已经结束，请继续关注我们的后续活动哦。', '', '1', '2', '1', '2', '1', '2', '1', '1', '2', '', '0', '0', '1');
INSERT INTO `ecm_lottery` VALUES ('3', '1212', '2', '1400112000', '1401494400', '活动规则', '1', 'data/files/store_2/lottery/201405211419571075.png', '2', 'data/files/store_2/lottery/201405211419576308.png', '1', '1', '2', '2', '3', '3', '1', '1', '2', '123456', '0', '0', '0');

-- ----------------------------
-- Table structure for ecm_mail_queue
-- ----------------------------
DROP TABLE IF EXISTS `ecm_mail_queue`;
CREATE TABLE `ecm_mail_queue` (
  `queue_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(150) NOT NULL DEFAULT '',
  `mail_encoding` varchar(50) NOT NULL DEFAULT '',
  `mail_subject` varchar(255) NOT NULL DEFAULT '',
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `lock_expiry` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_mail_queue
-- ----------------------------
INSERT INTO `ecm_mail_queue` VALUES ('48', 'woshiqiye@qq.com', 'utf-8', '微创动力微信商城预存款账户激活邮件', '微创动力微信商城提醒：您的验证码为：7166', '1', '3', '1473708098', '1473794469');
INSERT INTO `ecm_mail_queue` VALUES ('49', 'woshiqiye@qq.com', 'utf-8', '微创动力微信商城预存款账户激活邮件', '微创动力微信商城提醒：您的验证码为：1111', '1', '2', '1473708485', '1473794469');
INSERT INTO `ecm_mail_queue` VALUES ('50', 'woshistore2@qq.com', 'utf-8', '恭喜您在微创动力微信商城开店成功', '恭喜您在微创动力微信商城开店成功，请点击以下地址下载开店流程使用手册：http://vmall.vchuang.cn/help/help.doc 微创动力微信商城官方客服qq：361818525  旺旺：微创动力源码', '2', '1', '1473794439', '1473794469');

-- ----------------------------
-- Table structure for ecm_member
-- ----------------------------
DROP TABLE IF EXISTS `ecm_member`;
CREATE TABLE `ecm_member` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `real_name` varchar(60) DEFAULT NULL,
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  `im_qq` varchar(60) DEFAULT NULL,
  `im_msn` varchar(60) DEFAULT NULL,
  `im_skype` varchar(60) DEFAULT NULL,
  `im_yahoo` varchar(60) DEFAULT NULL,
  `im_aliww` varchar(60) DEFAULT NULL,
  `reg_time` int(10) unsigned DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `ugrade` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `portrait` varchar(255) DEFAULT NULL,
  `outer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `activation` varchar(60) DEFAULT NULL,
  `feed_config` text NOT NULL,
  `growth` int(20) NOT NULL DEFAULT '0',
  `quan` int(100) NOT NULL,
  `lng` decimal(12,8) NOT NULL,
  `zoom` int(3) NOT NULL,
  `lat` decimal(12,8) NOT NULL,
  `sid` int(11) NOT NULL,
  `sname` varchar(150) NOT NULL,
  `is_qr` int(11) NOT NULL,
  `tuijian_id` int(11) NOT NULL,
  `card` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `phone_g` varchar(20) DEFAULT NULL,
  `companyname` varchar(30) DEFAULT NULL,
  `sectname` varchar(30) DEFAULT NULL,
  `juese` varchar(20) DEFAULT NULL,
  `card_first` varchar(80) DEFAULT NULL,
  `card_end` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `outer_id` (`outer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_member
-- ----------------------------
INSERT INTO `ecm_member` VALUES ('1', 'admin', 'admin@qq.com', '7fef6171469e80d32c0559f88b377245', '', '0', null, null, null, '', '', null, null, null, '1388016632', '1473794408', '127.0.0.1', '70', '1', '', '0', null, '', '0', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('2', 'seller', '123456@qq.com', 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, null, null, null, null, null, null, null, '1388031020', '1473728963', '127.0.0.1', '55', '1', null, '0', null, '', '0', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('3', 'buyer', '123456@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '张小蓉', '0', '0000-00-00', null, null, '', '', null, null, null, '1388031042', '1473355537', '192.168.123.53', '28', '1', null, '0', null, '', '0', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '0', '370781198906034025', '15689694786', '3879138', '', '', '', null, null);
INSERT INTO `ecm_member` VALUES ('5', '小刚上阵', '494443101@qq.com', '9cdcec454f5523923c9192650df00666', null, '0', null, null, null, null, null, null, null, null, '1471562329', '1473700721', '127.0.0.1', '15', '1', null, '0', null, '', '5', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('6', 'test1', 'test1@qq.com', 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, null, null, null, null, null, null, null, '1472412973', '1473353396', '192.168.123.53', '11', '1', null, '0', null, '', '5', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('7', 'test2', '123@qq.com', 'e10adc3949ba59abbe56e057f20f883e', null, '0', null, null, null, null, null, null, null, null, '1472492021', '1472492021', '0.0.0.0', '1', '1', null, '0', null, '', '5', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '0', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('8', 'woshiqiye', 'woshiqiye@qq.com', '8c9531348995cec27e7baa74f75aaff8', null, '0', null, null, null, null, null, null, null, null, '1473015613', '1473789492', '127.0.0.1', '18', '1', null, '0', null, '', '5', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '1', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('9', 'woshistore', 'woshistore2@qq.com', '947bc649339701b2bd27299097a4dee2', null, '0', null, null, null, null, null, null, null, null, '1473221014', '1473792010', '127.0.0.1', '16', '1', null, '0', null, '', '5', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '1', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('10', 'woshiqiye2', 'woshiqiye2@qq.com', 'f2cccc7cacc0c4dab53d7eae44ff17e9', null, '0', null, null, null, null, null, null, null, null, '1473790845', '1473791356', '127.0.0.1', '2', '1', null, '0', null, '', '5', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '8', null, null, null, null, null, null, null, null);
INSERT INTO `ecm_member` VALUES ('11', 'woshistore2', 'woshistore2@qq.com', 'cc0be3b340161f9a4734ee7b7f25d38e', null, '0', null, null, null, null, null, null, null, null, '1473794173', '1473794173', '127.0.0.1', '1', '1', null, '0', null, '', '5', '0', '0.00000000', '0', '0.00000000', '0', '', '0', '9', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ecm_membership_card_info
-- ----------------------------
DROP TABLE IF EXISTS `ecm_membership_card_info`;
CREATE TABLE `ecm_membership_card_info` (
  `membership_card_info_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `card_num` int(10) NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(100) DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`membership_card_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_membership_card_info
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_membership_setting
-- ----------------------------
DROP TABLE IF EXISTS `ecm_membership_setting`;
CREATE TABLE `ecm_membership_setting` (
  `membership_setting_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `cover_image` varchar(100) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `card_name` varchar(60) NOT NULL DEFAULT '',
  `card_name_color` varchar(10) NOT NULL DEFAULT '',
  `bg` varchar(255) NOT NULL DEFAULT '',
  `card_bg` varchar(100) NOT NULL DEFAULT '',
  `card_num_color` varchar(10) NOT NULL DEFAULT '',
  `card_description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`membership_setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_membership_setting
-- ----------------------------
INSERT INTO `ecm_membership_setting` VALUES ('2', '微创动力微信商城会员卡', '', '1', '中国', '北京', '010-12345678', '微创动力微信商城会员卡', 'FFFFFF', '', 'themes/mall/taocz/styles/default/images/huodong/membership_card/card_bg/card_bg05.png', 'FFFFFF', '微创动力微信商城官方网址http://vmall.vchuang.cn');

-- ----------------------------
-- Table structure for ecm_member_bind
-- ----------------------------
DROP TABLE IF EXISTS `ecm_member_bind`;
CREATE TABLE `ecm_member_bind` (
  `openid` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `app` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_member_bind
-- ----------------------------
INSERT INTO `ecm_member_bind` VALUES ('DB6EC8DA55C144BBEDC2E28468B06EEF', '601', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('1B917E18FFCAC250650E7A7C914EDEC3', '602', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('E142B8B08B3CC3FA4B64B3DD43F1F5D2', '604', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('FCE14BA28B2A51B20541936949748174', '606', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('2.00Pf5CpB3ph8pB6828eb6d73xCb1lD', '608', 'xwb');
INSERT INTO `ecm_member_bind` VALUES ('E016AE803F077A883EB66617A31B85B8', '613', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('4E0AED110A398A2D6C5F252C461D4064', '615', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('53BF2A642BB56190DD2E65DFB2DCD745', '618', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('4FDBDFA4747DAA0123E2005590924E05', '619', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('7F22130FD8BD87B93A55DAFF59B7491B', '621', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('D7F0EF2CE0CD5E93706BCFCBE777EA71', '625', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('1A933E7269EA2FBDA9DF3E0319B010A4', '626', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('0677A711F2E7B955345EAD6FFDDE5CBA', '627', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('A511B1C7AD798AB88C292DE07E32D625', '631', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('CCC011E9A8465F4B1E01C30E5826894D', '642', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('1AA71F9ED52A1B92EFEAB058C07EE2DD', '646', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('4C01AF370D768C04D6A58A360DDEA09F', '648', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('512F199DE914696086B2CCB04501045A', '651', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('D363E49E844C3F700F8E944BCC75362C', '656', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('1591DDE9F9DE19F103CE90EDC7272E98', '658', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('588D2CA9524719E2C0EC877E9FC63A39', '669', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('D0EE900156F3C01298277E6D15E0C245', '670', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('21D7523952D57C4A91B5AC652656F1A0', '672', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('F8BE82AE3DFA7C3B8E7B6CA2619B0951', '676', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('11D96726D891A1517E269D34BADED515', '678', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('35959CAAF39E613FBBA85DDFCFD66026', '679', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('2DA4CB94431297FC2A76701AD73B7D3D', '681', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('0BD201A1444D615F2F1A382A88365EAC', '682', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('10916B896B965DDA6F039F23A8C8EEBE', '0', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('A53D8F9C8BED963A496ED1A2BC4CEFDC', '688', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('9922363E3AAFF59CE7507C470E25B0B2', '689', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('5FC4043B87EFBCF14E040219DEFFD386', '690', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('9987DF2B49AA329DA4FE86CF75CB7331', '691', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('56850930A06B488F6BBF6BCF32360625', '692', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('A7B188810CA4EF8F14C4ED3CA81B5EA0', '695', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('C9570C100B3B91810E49A40E0AEDFC95', '696', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('B298BC76187B75BBE2F2B7D9BAF9DA2B', '697', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('8BFD79317BB8803B29975784D6B5CA88', '698', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('36FDACA3FAA17957692EE458E653F303', '705', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('79CA8794A607B5BFFD5339D2617E3D55', '708', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('46175B7BDD405D13052985CC2ED94B93', '717', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('E5F22B8D292C2E4235B484E697794A7E', '718', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('2.00DOKlGC3ph8pBb3b74c8cdc0sGD_T', '726', 'xwb');
INSERT INTO `ecm_member_bind` VALUES ('83CD12DA2A2A5A7F68CB82C704863475', '728', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('DDA3EB3BFD6B68D163827BA9690BA557', '729', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('2D0E8795104823FEF86CE091A5735287', '730', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('DC79163870D92DDC002CBD8B5B729C78', '734', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('AD0FACE2C72A65D970EFF2F3755E7EB0', '736', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('2.00DOKlGC3ph8pBccdaf797260jq91o', '741', 'xwb');
INSERT INTO `ecm_member_bind` VALUES ('79ED14FF14500D340EC31E1E57FC27F2', '748', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('791F29D800CF8E3E865F797A5C756D62', '752', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('562CE1483F8D319DDF4CCBE772756AF0', '754', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('1D712A0D4A0E6F5237025502A3DF1C8D', '759', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('903B635D7B790AC8D0B6981B66BB4150', '768', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('6E9BD51AD3609446D42A17B208C697FC', '769', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('1EBD1D82854AC77BE62DDFC4BF97113E', '770', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('7B0657BE7B2A7ABC58DFAD642A67FB92', '772', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('DD130F7534759395D7127A3C846610A0', '777', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('F30B4E91080066736E108E6AF61B00A7', '786', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('B0359F885D3DC29BE70B9F2570F66383', '800', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('94916E0D1F3FA998AC5BFD76C676EAB7', '803', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('38D8BE14970F306B15F9D6BB75DADCED', '809', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('45C4B3327812D378E73F92AC8DB51B4B', '810', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('9354F4D3E3E46B08FD12AE69DD44300E', '811', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('9BFA14E63DD07A466303AD30E106BD30', '818', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('B1B84EA20A07FD86AAE2E9AAF13C8262', '819', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('960BA622148DE75744F49E09367C271C', '821', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('6FCBE85E07981871288F1E3CAB577472', '831', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('C569EBE3915D54EEE598ACA10CCC3838', '832', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('6D6BFAB3EDBDB13116697F870E754049', '835', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('49A861874980FDA9B0A2395470B4AD3B', '836', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('E4DAF376C106F73AE62AE1D38998BEEC', '839', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('36D0D809FC39DE38F1A6F1CEB5896FDD', '841', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('AB9EFC93ADE40E239C82B52505D7A82D', '842', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('D202EB5B70724896E6BB4C57FD760081', '844', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('34A89139EC9799915B36079D70DAF727', '845', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('1ADEF0F3AE2010DF2B85A6576664BF7E', '849', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('7E91EB11559ED09E4E230CBD3FDAB98F', '17', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('07D55D9AA9D29E8C6BBE8AA9E72ACD48', '19', 'qq');
INSERT INTO `ecm_member_bind` VALUES ('E8C8F168D12A6A820119B78A6EAA67AB', '4', 'qq');

-- ----------------------------
-- Table structure for ecm_message
-- ----------------------------
DROP TABLE IF EXISTS `ecm_message`;
CREATE TABLE `ecm_message` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_message
-- ----------------------------
INSERT INTO `ecm_message` VALUES ('1', '0', '2', '', '恭喜，您的店铺已开通，赶快来用户中心发布商品吧。', '1388031275', '1388031275', '0', '0', '3');
INSERT INTO `ecm_message` VALUES ('3', '0', '1', '', '团购活动结束5天后卖家未确认完成，活动自动取消，[url=http://localhost/index.php?app=groupbuy&amp;id=1]查看详情[/url]', '1439594453', '1439594453', '1', '0', '3');
INSERT INTO `ecm_message` VALUES ('104', '0', '9', '', '恭喜，您的店铺已开通，赶快来用户中心发布商品吧。', '1473221993', '1473221993', '1', '0', '3');
INSERT INTO `ecm_message` VALUES ('105', '0', '11', '', '恭喜，您的店铺已开通，赶快来用户中心发布商品吧。', '1473794439', '1473794439', '1', '0', '3');
INSERT INTO `ecm_message` VALUES ('103', '0', '3', '', '您收到了 “超级店铺” 发送来的优惠券 \r\n 优惠金额：100.00 \r\n有效期：2016-08-11 至2016-08-25 \r\n优惠券号码：000001069352 \r\n使用条件：购物满 1000.00 即可使用 \r\n店铺地址：[url=http://localhost/pecmall/index.php?app=store&amp;id=2]超级店铺[/url]', '1470874871', '1470874871', '0', '0', '3');

-- ----------------------------
-- Table structure for ecm_module
-- ----------------------------
DROP TABLE IF EXISTS `ecm_module`;
CREATE TABLE `ecm_module` (
  `module_id` varchar(30) NOT NULL DEFAULT '',
  `module_name` varchar(100) NOT NULL DEFAULT '',
  `module_version` varchar(5) NOT NULL DEFAULT '',
  `module_desc` text NOT NULL,
  `module_config` text NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_module
-- ----------------------------
INSERT INTO `ecm_module` VALUES ('datacall', '数据调用', '1.0', '可以在商城以外调用商城的数据', '', '1');
INSERT INTO `ecm_module` VALUES ('dazhuanpan', '幸运大转盘', '1.0', '转啊转啊大转盘 ', '', '1');
INSERT INTO `ecm_module` VALUES ('jindan', '店铺砸金蛋', '1.0', '砸个砸个大金蛋', '', '1');
INSERT INTO `ecm_module` VALUES ('msg', '手机短信', '1.0', '安装以后，用户可以使用手机短信收发功能', '', '1');
INSERT INTO `ecm_module` VALUES ('my_money', '站内宝2.2', '2.2', '安装以后，用户可以使用站内资金功能（卸载时请注意）', '', '1');

-- ----------------------------
-- Table structure for ecm_msg
-- ----------------------------
DROP TABLE IF EXISTS `ecm_msg`;
CREATE TABLE `ecm_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `functions` varchar(255) DEFAULT NULL,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_msg
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_msglog
-- ----------------------------
DROP TABLE IF EXISTS `ecm_msglog`;
CREATE TABLE `ecm_msglog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `to_mobile` varchar(100) DEFAULT NULL,
  `content` text,
  `state` varchar(100) DEFAULT NULL,
  `type` int(10) unsigned DEFAULT '0',
  `time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_msglog
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_my_card
-- ----------------------------
DROP TABLE IF EXISTS `ecm_my_card`;
CREATE TABLE `ecm_my_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT NULL,
  `cz_time` int(10) unsigned DEFAULT NULL,
  `guoqi_time` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `card_sn` varchar(30) DEFAULT NULL,
  `card_pass` varchar(30) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_my_card
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_my_jifen
-- ----------------------------
DROP TABLE IF EXISTS `ecm_my_jifen`;
CREATE TABLE `ecm_my_jifen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yes_no` int(10) NOT NULL DEFAULT '0',
  `ids` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned DEFAULT NULL,
  `jifen` int(10) NOT NULL DEFAULT '0',
  `wupin_name` varchar(60) DEFAULT NULL,
  `wupin_imgs` varchar(255) DEFAULT NULL,
  `wupin_img` varchar(255) DEFAULT NULL,
  `jiazhi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shuliang` int(10) unsigned NOT NULL DEFAULT '0',
  `yiduihuan` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `my_name` varchar(100) DEFAULT NULL,
  `my_add` varchar(255) DEFAULT NULL,
  `my_tel` varchar(255) DEFAULT NULL,
  `my_mobile` varchar(255) DEFAULT NULL,
  `log_text` text,
  `shenhe` int(10) NOT NULL DEFAULT '0',
  `wuliu_name` varchar(100) DEFAULT NULL,
  `wuliu_danhao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_my_jifen
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_my_mibao
-- ----------------------------
DROP TABLE IF EXISTS `ecm_my_mibao`;
CREATE TABLE `ecm_my_mibao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mibao_sn` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(20) DEFAULT NULL,
  `admin_name` varchar(100) DEFAULT NULL,
  `add_time` int(8) unsigned NOT NULL DEFAULT '0',
  `bd_time` int(8) unsigned DEFAULT NULL,
  `dq_time` int(8) unsigned DEFAULT NULL,
  `ztai` int(3) unsigned NOT NULL DEFAULT '0',
  `A1` varchar(10) DEFAULT NULL,
  `B1` varchar(10) DEFAULT NULL,
  `C1` varchar(10) DEFAULT NULL,
  `D1` varchar(10) DEFAULT NULL,
  `E1` varchar(10) DEFAULT NULL,
  `F1` varchar(10) DEFAULT NULL,
  `G1` varchar(10) DEFAULT NULL,
  `H1` varchar(10) DEFAULT NULL,
  `A2` varchar(10) DEFAULT NULL,
  `B2` varchar(10) DEFAULT NULL,
  `C2` varchar(10) DEFAULT NULL,
  `D2` varchar(10) DEFAULT NULL,
  `E2` varchar(10) DEFAULT NULL,
  `F2` varchar(10) DEFAULT NULL,
  `G2` varchar(10) DEFAULT NULL,
  `H2` varchar(10) DEFAULT NULL,
  `A3` varchar(10) DEFAULT NULL,
  `B3` varchar(10) DEFAULT NULL,
  `C3` varchar(10) DEFAULT NULL,
  `D3` varchar(10) DEFAULT NULL,
  `E3` varchar(10) DEFAULT NULL,
  `F3` varchar(10) DEFAULT NULL,
  `G3` varchar(10) DEFAULT NULL,
  `H3` varchar(10) DEFAULT NULL,
  `A4` varchar(10) DEFAULT NULL,
  `B4` varchar(10) DEFAULT NULL,
  `C4` varchar(10) DEFAULT NULL,
  `D4` varchar(10) DEFAULT NULL,
  `E4` varchar(10) DEFAULT NULL,
  `F4` varchar(10) DEFAULT NULL,
  `G4` varchar(10) DEFAULT NULL,
  `H4` varchar(10) DEFAULT NULL,
  `A5` varchar(10) DEFAULT NULL,
  `B5` varchar(10) DEFAULT NULL,
  `C5` varchar(10) DEFAULT NULL,
  `D5` varchar(10) DEFAULT NULL,
  `E5` varchar(10) DEFAULT NULL,
  `F5` varchar(10) DEFAULT NULL,
  `G5` varchar(10) DEFAULT NULL,
  `H5` varchar(10) DEFAULT NULL,
  `A6` varchar(10) DEFAULT NULL,
  `B6` varchar(10) DEFAULT NULL,
  `C6` varchar(10) DEFAULT NULL,
  `D6` varchar(10) DEFAULT NULL,
  `E6` varchar(10) DEFAULT NULL,
  `F6` varchar(10) DEFAULT NULL,
  `G6` varchar(10) DEFAULT NULL,
  `H6` varchar(10) DEFAULT NULL,
  `A7` varchar(10) DEFAULT NULL,
  `B7` varchar(10) DEFAULT NULL,
  `C7` varchar(10) DEFAULT NULL,
  `D7` varchar(10) DEFAULT NULL,
  `E7` varchar(10) DEFAULT NULL,
  `F7` varchar(10) DEFAULT NULL,
  `G7` varchar(10) DEFAULT NULL,
  `H7` varchar(10) DEFAULT NULL,
  `A8` varchar(10) DEFAULT NULL,
  `B8` varchar(10) DEFAULT NULL,
  `C8` varchar(10) DEFAULT NULL,
  `D8` varchar(10) DEFAULT NULL,
  `E8` varchar(10) DEFAULT NULL,
  `F8` varchar(10) DEFAULT NULL,
  `G8` varchar(10) DEFAULT NULL,
  `H8` varchar(10) DEFAULT NULL,
  `A9` varchar(10) DEFAULT NULL,
  `B9` varchar(10) DEFAULT NULL,
  `C9` varchar(10) DEFAULT NULL,
  `D9` varchar(10) DEFAULT NULL,
  `E9` varchar(10) DEFAULT NULL,
  `F9` varchar(10) DEFAULT NULL,
  `G9` varchar(10) DEFAULT NULL,
  `H9` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_my_mibao
-- ----------------------------
INSERT INTO `ecm_my_mibao` VALUES ('1', 'SN1001-XSFX-IFTM-IMAC', '3', 'buyer', 'admin', '1470983267', '1470983314', '1534055314', '1', '913', '581', '859', '417', '892', '580', '247', '196', '536', '207', '314', '411', '588', '236', '950', '580', '878', '175', '804', '215', '758', '660', '538', '860', '744', '447', '725', '823', '887', '505', '931', '734', '860', '277', '694', '726', '879', '429', '846', '177', '337', '741', '487', '600', '496', '274', '661', '133', '887', '163', '139', '903', '267', '855', '654', '622', '810', '465', '709', '488', '246', '459', '690', '754', '343', '124', '204', '726', '248', '462', '482', '662');
INSERT INTO `ecm_my_mibao` VALUES ('2', 'SN1002-EFRZ-MCPF-VULW', '0', null, 'admin', '1470983267', null, null, '0', '371', '742', '866', '741', '637', '258', '410', '846', '792', '230', '825', '864', '977', '392', '199', '724', '361', '502', '709', '786', '154', '419', '868', '901', '682', '887', '921', '541', '648', '464', '933', '150', '866', '645', '377', '685', '779', '202', '377', '606', '860', '705', '304', '798', '108', '643', '683', '467', '825', '105', '509', '796', '902', '639', '928', '314', '187', '657', '695', '553', '267', '696', '738', '543', '846', '911', '558', '537', '834', '600', '206', '702');
INSERT INTO `ecm_my_mibao` VALUES ('3', 'SN1003-RWQJ-LSFD-TVCY', '0', null, 'admin', '1470983267', null, null, '0', '147', '143', '433', '763', '416', '759', '380', '753', '617', '650', '705', '749', '221', '952', '698', '634', '460', '254', '890', '492', '133', '997', '604', '843', '820', '229', '167', '655', '853', '624', '809', '427', '999', '730', '283', '166', '300', '368', '628', '489', '544', '840', '912', '228', '481', '768', '372', '606', '994', '527', '985', '343', '515', '784', '705', '760', '992', '918', '573', '750', '127', '823', '762', '676', '954', '177', '641', '470', '101', '477', '434', '182');
INSERT INTO `ecm_my_mibao` VALUES ('4', 'SN1004-GEXX-UURZ-DBXG', '0', null, 'admin', '1470983267', null, null, '0', '203', '307', '659', '873', '596', '876', '509', '576', '971', '553', '377', '346', '923', '854', '678', '703', '355', '823', '365', '785', '789', '425', '807', '348', '840', '726', '413', '689', '298', '770', '969', '147', '684', '512', '290', '973', '517', '742', '233', '696', '165', '335', '176', '992', '108', '680', '526', '886', '293', '519', '745', '979', '612', '935', '252', '847', '276', '144', '215', '991', '612', '510', '168', '497', '965', '243', '966', '872', '339', '311', '835', '918');
INSERT INTO `ecm_my_mibao` VALUES ('5', 'SN1005-VYML-GYHD-NTZU', '0', null, 'admin', '1470983267', null, null, '0', '740', '807', '509', '325', '560', '214', '620', '427', '978', '608', '130', '902', '210', '738', '569', '676', '372', '729', '584', '899', '904', '338', '834', '252', '615', '116', '163', '268', '295', '907', '371', '100', '950', '230', '519', '244', '411', '785', '795', '945', '477', '820', '455', '377', '337', '495', '898', '844', '127', '306', '168', '185', '276', '474', '735', '933', '696', '776', '672', '910', '760', '729', '863', '501', '542', '492', '164', '199', '633', '603', '350', '264');
INSERT INTO `ecm_my_mibao` VALUES ('6', 'SN1006-CYQW-PKMR-GMDA', '0', null, 'admin', '1470983267', null, null, '0', '145', '914', '868', '382', '988', '447', '744', '363', '932', '327', '235', '678', '671', '714', '705', '265', '157', '195', '700', '303', '450', '258', '198', '584', '750', '811', '217', '793', '540', '153', '752', '509', '128', '676', '436', '345', '498', '411', '876', '747', '269', '474', '165', '858', '572', '433', '141', '276', '340', '873', '172', '701', '919', '452', '229', '417', '701', '432', '467', '186', '485', '399', '233', '911', '263', '822', '839', '850', '944', '686', '630', '613');
INSERT INTO `ecm_my_mibao` VALUES ('7', 'SN1007-QLPI-KKTJ-AFAF', '0', null, 'admin', '1470983267', null, null, '0', '708', '456', '156', '358', '403', '386', '610', '996', '477', '840', '724', '115', '265', '944', '475', '767', '113', '428', '620', '385', '962', '985', '991', '502', '977', '293', '973', '932', '943', '244', '607', '184', '913', '910', '320', '867', '728', '904', '441', '459', '390', '853', '311', '408', '325', '949', '820', '407', '194', '101', '296', '956', '806', '230', '188', '817', '588', '762', '550', '782', '152', '338', '875', '382', '138', '703', '685', '723', '453', '995', '131', '104');
INSERT INTO `ecm_my_mibao` VALUES ('8', 'SN1008-TMCB-TGMM-VMUS', '0', null, 'admin', '1470983267', null, null, '0', '494', '797', '404', '994', '376', '159', '614', '614', '941', '581', '831', '815', '792', '534', '754', '495', '704', '328', '998', '841', '169', '900', '967', '134', '925', '527', '296', '320', '423', '150', '540', '270', '892', '584', '586', '644', '737', '544', '471', '664', '245', '324', '777', '930', '936', '274', '582', '679', '826', '716', '960', '905', '932', '538', '780', '872', '109', '205', '813', '303', '725', '132', '196', '201', '479', '157', '360', '178', '967', '951', '474', '541');
INSERT INTO `ecm_my_mibao` VALUES ('9', 'SN1009-LHBH-LJMM-FMFQ', '0', null, 'admin', '1470983267', null, null, '0', '184', '518', '401', '726', '496', '104', '633', '513', '142', '984', '794', '123', '722', '139', '578', '228', '515', '486', '210', '673', '685', '486', '692', '744', '539', '384', '942', '672', '765', '707', '169', '929', '730', '575', '787', '777', '667', '257', '432', '745', '234', '214', '775', '595', '658', '169', '992', '139', '158', '349', '878', '782', '671', '335', '385', '747', '249', '364', '764', '755', '872', '515', '368', '516', '642', '839', '233', '113', '989', '545', '770', '127');
INSERT INTO `ecm_my_mibao` VALUES ('10', 'SN1010-ETEM-JCSM-KNIJ', '0', null, 'admin', '1470983267', null, null, '0', '572', '219', '194', '177', '200', '670', '315', '543', '346', '600', '623', '235', '292', '179', '702', '665', '275', '122', '874', '207', '369', '659', '450', '493', '173', '779', '553', '717', '239', '358', '105', '813', '319', '137', '955', '577', '751', '365', '809', '285', '275', '272', '769', '691', '195', '996', '730', '752', '974', '612', '436', '864', '277', '998', '157', '954', '165', '793', '777', '322', '938', '462', '859', '260', '126', '937', '381', '156', '251', '252', '600', '710');

-- ----------------------------
-- Table structure for ecm_my_money
-- ----------------------------
DROP TABLE IF EXISTS `ecm_my_money`;
CREATE TABLE `ecm_my_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `add_time` int(10) unsigned DEFAULT NULL,
  `mibao_id` int(10) NOT NULL DEFAULT '0',
  `mibao_sn` varchar(30) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(100) DEFAULT NULL,
  `bank_sn` varchar(100) DEFAULT NULL,
  `bank_name` varchar(20) DEFAULT NULL,
  `bank_username` varchar(20) DEFAULT NULL,
  `bank_add` varchar(60) DEFAULT NULL,
  `zf_pass` varchar(32) DEFAULT NULL,
  `pass_tw` varchar(60) DEFAULT NULL,
  `pass_hd` varchar(60) DEFAULT NULL,
  `jifen_z` int(10) NOT NULL DEFAULT '0',
  `jifen` int(10) NOT NULL DEFAULT '0',
  `money_dj` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_my_money
-- ----------------------------
INSERT INTO `ecm_my_money` VALUES ('1', '1422910869', '0', null, '2', 'seller', null, null, null, null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '0', '82', '30.60', '0.00');
INSERT INTO `ecm_my_money` VALUES ('2', '1422926867', '1', 'SN1001-XSFX-IFTM-IMAC', '3', 'buyer', null, null, null, null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '0', '0', '0.00', '969.40');
INSERT INTO `ecm_my_money` VALUES ('3', '1422926969', '0', null, '4', '南京彩斯', null, null, null, null, '7c99039473f6d699d33018053d097207', null, null, '0', '0', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('4', '1470621257', '0', null, '1', 'admin', null, null, null, null, '7fef6171469e80d32c0559f88b377245', null, null, '0', '50', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('5', '1471591129', '0', null, '5', '小刚上阵', null, null, null, null, '9cdcec454f5523923c9192650df00666', null, null, '0', '100', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('6', '1472441773', '0', null, '6', 'test1', null, null, null, null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '0', '100', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('7', '1472520821', '0', null, '7', 'test2', null, null, null, null, 'e10adc3949ba59abbe56e057f20f883e', null, null, '0', '100', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('8', '1473044413', '0', null, '8', 'woshiqiye', null, null, null, null, '8c9531348995cec27e7baa74f75aaff8', null, null, '0', '150', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('9', '1473228214', '0', null, '9', 'woshistore', null, null, null, null, '947bc649339701b2bd27299097a4dee2', null, null, '0', '150', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('10', '1473819645', '0', null, '10', 'woshiqiye2', null, null, null, null, 'f2cccc7cacc0c4dab53d7eae44ff17e9', null, null, '0', '100', '0.00', '0.00');
INSERT INTO `ecm_my_money` VALUES ('11', '1473822973', '0', null, '11', 'woshistore2', null, null, null, null, 'cc0be3b340161f9a4734ee7b7f25d38e', null, null, '0', '100', '0.00', '0.00');

-- ----------------------------
-- Table structure for ecm_my_moneylog
-- ----------------------------
DROP TABLE IF EXISTS `ecm_my_moneylog`;
CREATE TABLE `ecm_my_moneylog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `user_name` varchar(50) DEFAULT '0',
  `order_id` int(10) NOT NULL DEFAULT '0',
  `order_sn` varchar(50) DEFAULT '0',
  `seller_id` int(10) unsigned DEFAULT NULL,
  `seller_name` varchar(100) DEFAULT NULL,
  `buyer_id` int(10) unsigned DEFAULT NULL,
  `buyer_name` varchar(100) DEFAULT NULL,
  `coupon_id` int(10) unsigned DEFAULT NULL,
  `coupon_sn` varchar(50) DEFAULT '0',
  `coupon_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tx_username` varchar(50) DEFAULT NULL,
  `tx_bankname` varchar(50) DEFAULT NULL,
  `tx_banksn` varchar(50) DEFAULT NULL,
  `tx_add` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT NULL,
  `admin_name` varchar(100) DEFAULT NULL,
  `admin_time` int(10) unsigned DEFAULT NULL,
  `leixing` int(3) unsigned NOT NULL DEFAULT '0',
  `caozuo` int(3) unsigned NOT NULL DEFAULT '0',
  `s_and_z` int(3) unsigned DEFAULT NULL,
  `user_log_del` int(3) unsigned DEFAULT '0',
  `money_zs` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `log_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_my_moneylog
-- ----------------------------
INSERT INTO `ecm_my_moneylog` VALUES ('1', '3', 'buyer', '0', '2015-02-03-092814', null, null, null, null, null, '0', '0.00', null, null, null, null, '1422926894', 'admin', null, '30', '50', '1', '0', '1000.00', '0.00', 'admin管理员手工操作用户资金');
INSERT INTO `ecm_my_moneylog` VALUES ('2', '3', 'buyer', '2', '1503306357', '2', 'seller', '3', 'buyer', null, '0', '0.00', null, null, null, null, '1422926928', null, null, '20', '10', '2', '0', '-30.60', '30.60', '购买商品，店主 seller');
INSERT INTO `ecm_my_moneylog` VALUES ('3', '2', 'seller', '2', '1503306357', '2', 'seller', '3', 'buyer', null, '0', '0.00', null, null, null, null, '1422926928', null, null, '10', '10', '1', '0', '30.60', '30.60', '出售商品，买家 buyer');

-- ----------------------------
-- Table structure for ecm_my_paysetup
-- ----------------------------
DROP TABLE IF EXISTS `ecm_my_paysetup`;
CREATE TABLE `ecm_my_paysetup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chinabank_key` varchar(255) DEFAULT NULL,
  `chinabank_mid` int(32) unsigned DEFAULT NULL,
  `chinabank_url` varchar(255) DEFAULT NULL,
  `chinabank_remark1` varchar(255) DEFAULT NULL,
  `chinabank_remark2` varchar(255) DEFAULT NULL,
  `yeepay_key` varchar(255) DEFAULT NULL,
  `yeepay_mid` int(32) unsigned DEFAULT NULL,
  `yeepay_url` varchar(255) DEFAULT NULL,
  `yeepay_ext1` varchar(255) DEFAULT NULL,
  `yeepay_ext2` varchar(255) DEFAULT NULL,
  `yeepay_bank` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_junnet` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_sndacard` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_szx` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_zhengtu` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_qqcard` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_unicom` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_jiuyou` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_ypcard` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_lianhuaokcard` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_netease` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_wanmei` int(8) unsigned NOT NULL DEFAULT '100',
  `yeepay_sohu` int(8) unsigned NOT NULL DEFAULT '100',
  `alipay_id` varchar(255) DEFAULT NULL,
  `alipay_key` varchar(255) DEFAULT NULL,
  `alipay_jiekou` varchar(255) DEFAULT NULL,
  `alipay_qubiema` varchar(255) DEFAULT NULL,
  `tenpay_id` varchar(255) DEFAULT NULL,
  `tenpay_key` varchar(255) DEFAULT NULL,
  `tenpay_qianmeng` varchar(255) DEFAULT NULL,
  `tenpay_qubiema` varchar(255) DEFAULT NULL,
  `tenpay2_id` varchar(255) DEFAULT NULL,
  `tenpay2_key` varchar(255) DEFAULT NULL,
  `tenpay2_leixing` varchar(255) DEFAULT NULL,
  `tenpay2_qubiema` varchar(255) DEFAULT NULL,
  `bank_icbc_id` varchar(255) DEFAULT NULL,
  `bank_icbc_name` varchar(255) DEFAULT NULL,
  `bank_icbc_add` varchar(255) DEFAULT NULL,
  `bank_ccb_id` varchar(255) DEFAULT NULL,
  `bank_ccb_name` varchar(255) DEFAULT NULL,
  `bank_ccb_add` varchar(255) DEFAULT NULL,
  `bank_abb_id` varchar(255) DEFAULT NULL,
  `bank_abb_name` varchar(255) DEFAULT NULL,
  `bank_abb_add` varchar(255) DEFAULT NULL,
  `bank_cib_id` varchar(255) DEFAULT NULL,
  `bank_cib_name` varchar(255) DEFAULT NULL,
  `bank_cib_add` varchar(255) DEFAULT NULL,
  `bank_bc_id` varchar(255) DEFAULT NULL,
  `bank_bc_name` varchar(255) DEFAULT NULL,
  `bank_bc_add` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_my_paysetup
-- ----------------------------
INSERT INTO `ecm_my_paysetup` VALUES ('1', '350500198704145018', '21391940', 'index.php?app=my_money&act=chinabank_pay', null, null, '', '0', '', '', '', '100', '100', '100', '100', '100', '100', '100', '100', '100', '100', '100', '100', '100', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ecm_navigation
-- ----------------------------
DROP TABLE IF EXISTS `ecm_navigation`;
CREATE TABLE `ecm_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '',
  `title` varchar(60) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `open_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hot` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_navigation
-- ----------------------------
INSERT INTO `ecm_navigation` VALUES ('1', 'middle', '官方淘宝店', 'http://taobao.vchuang.cn', '8', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('2', 'middle', '外卖订餐', 'wm/', '0', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('3', 'middle', '聚划算', 'index.php?app=ju', '1', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('4', 'middle', '团购', 'index.php?app=search&act=groupbuy', '2', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('6', 'middle', '积分商城', 'index.php?app=integral', '3', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('7', 'middle', '幸运大转盘', 'index.php?app=dazhuanpan', '4', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('8', 'middle', '积分砸蛋', 'index.php?app=search&act=eggact', '5', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('9', 'middle', '打折促销', 'index.php?app=promotion', '6', '1', '0');
INSERT INTO `ecm_navigation` VALUES ('10', 'middle', '供求信息', 'index.php?app=sdemand', '7', '1', '0');

-- ----------------------------
-- Table structure for ecm_order
-- ----------------------------
DROP TABLE IF EXISTS `ecm_order`;
CREATE TABLE `ecm_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `order_name` varchar(255) DEFAULT NULL COMMENT '订单名称',
  `type` varchar(10) NOT NULL DEFAULT 'material',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `seller_id` int(10) unsigned NOT NULL DEFAULT '0',
  `seller_name` varchar(100) DEFAULT NULL,
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `buyer_name` varchar(100) DEFAULT NULL,
  `buyer_email` varchar(60) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `del_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_id` int(10) DEFAULT NULL,
  `payment_name` varchar(100) DEFAULT NULL,
  `payment_bank` varchar(100) NOT NULL,
  `payment_code` varchar(20) NOT NULL DEFAULT '',
  `out_trade_sn` varchar(20) NOT NULL DEFAULT '',
  `pay_time` int(10) unsigned DEFAULT '0',
  `pay_message` varchar(255) NOT NULL DEFAULT '',
  `ship_time` int(10) unsigned DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `finished_time` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `evaluation_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0',
  `anonymous` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `pay_alter` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `express_company` varchar(150) NOT NULL,
  `trade_no` varchar(150) NOT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单类型：1个人订单，2企业订单',
  `company_id` int(30) DEFAULT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_sn` (`order_sn`,`seller_id`),
  KEY `seller_name` (`seller_name`),
  KEY `buyer_name` (`buyer_name`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_order
-- ----------------------------
INSERT INTO `ecm_order` VALUES ('1', '1335948628', null, 'material', 'normal', '2', '超级店铺', '3', 'buyer', '123456@qq.com', '11', '0', '1388043112', '1', '支付宝', '', 'alipay', '1335948628', null, '', null, null, '0', '32.00', '0.00', '32.10', '0', '0', '0', '', '0', '', '', '1', null, null);
INSERT INTO `ecm_order` VALUES ('2', '1503306357', null, 'material', 'normal', '2', '超级店铺', '3', 'buyer', '123456@qq.com', '20', '0', '1422898116', '-1', '站内宝', '', 'sft', '', '1468026928', '', null, null, '0', '30.60', '0.00', '30.60', '0', '0', '0', '', '0', '', '', '1', null, null);
INSERT INTO `ecm_order` VALUES ('3', '1517713302', '测试订单名称', 'material', 'normal', '5', '小刚的店', '2', 'buyer', '123456@qq.com', '40', '0', '1435401957', '-1', '到店付款', '', 'cos', '', '1467926928', '', '1470966564', '123465789', '1470966697', '0.10', '0.00', '0.10', '1', '1470966709', '0', '', '0', 'shunfeng', '', '2', '3', '测试企业名称');
INSERT INTO `ecm_order` VALUES ('4', '1621686886', null, 'material', 'normal', '2', '超级店铺', '3', 'buyer', '123456@qq.com', '0', '0', '1470251482', '9', '支付宝网银', 'ICBCB2C', 'alipay_bank', '1621686886', null, '', null, null, '0', '100.10', '0.00', '100.10', '0', '0', '0', '', '0', '', '', '1', null, null);
INSERT INTO `ecm_order` VALUES ('5', '1621624460', null, 'material', 'normal', '2', '超级店铺', '3', 'buyer', '123456@qq.com', '0', '-2', '1470252667', '0', null, '', '', '', null, '', null, null, '0', '30.60', '0.00', '30.60', '0', '0', '0', '', '0', '', '', '1', null, null);
INSERT INTO `ecm_order` VALUES ('6', '1624193322', null, 'material', 'normal', '5', '小刚的店', '6', 'test1', 'test1@qq.com', '11', '0', '1472413196', '-1', null, '', '', '', '0', '', null, null, '0', '10.00', '0.00', '10.00', '0', '0', '0', '', '0', '', '', '1', null, null);
INSERT INTO `ecm_order` VALUES ('7', '1624253922', null, 'material', 'normal', '5', '小刚的店', '7', 'test2', '123@qq.com', '11', '0', '1472492084', '-1', null, '', '', '', null, '', null, null, '0', '10.00', '0.00', '10.00', '0', '0', '0', '', '0', '', '', '2', '3', '测试企业名称');
INSERT INTO `ecm_order` VALUES ('8', '1624282952', null, 'material', 'normal', '5', '超级店铺', '7', 'test2', '123@qq.com', '11', '0', '1472492494', '-1', null, '', '', '', null, '', null, null, '0', '99.00', '0.00', '99.00', '0', '0', '0', '', '0', '', '', '2', '3', '测试企业名称');
INSERT INTO `ecm_order` VALUES ('9', '1624255309', null, 'material', 'normal', '5', '小刚的店', '6', 'test1', 'test1@qq.com', '11', '0', '1472496018', '-1', null, '', '', '', '0', '', null, null, '0', '60.00', '0.00', '49.90', '0', '0', '0', '', '0', '', '', '1', null, null);
INSERT INTO `ecm_order` VALUES ('10', '1624392761', null, 'material', 'normal', '2', '超级店铺', '6', 'test1', 'test1@qq.com', '11', '0', '1472600490', '-1', null, '', '', '', null, '', null, null, '0', '10.00', '0.00', '10.00', '0', '0', '0', '', '0', '', '', '2', '2', '某某测试');
INSERT INTO `ecm_order` VALUES ('11', '1624513063', null, 'material', 'normal', '2', '超级店铺', '6', 'test1', 'test1@qq.com', '11', '0', '1472773109', '-1', null, '', '', '', null, '', null, null, '0', '10.00', '0.00', '10.00', '0', '0', '0', '', '0', '', '', '2', '2', '某某测试');
INSERT INTO `ecm_order` VALUES ('12', '1624504497', null, 'material', 'normal', '5', '超级店铺', '6', 'test1', 'test1@qq.com', '11', '0', '1472773196', '-1', null, '', '', '', '0', '', null, null, '0', '25.00', '0.00', '25.00', '0', '0', '0', '', '0', '', '', '1', null, null);
INSERT INTO `ecm_order` VALUES ('13', '1624533354', null, 'material', 'normal', '2', '超级店铺', '6', 'test1', 'test1@qq.com', '11', '0', '1472773395', '-1', null, '', '', '', null, '', null, null, '0', '13.00', '0.00', '13.00', '0', '0', '0', '', '0', '', '', '2', '2', '某某测试');
INSERT INTO `ecm_order` VALUES ('14', '1625073502', null, 'material', 'normal', '2', '超级店铺', '3', 'buyer', '123456@qq.com', '11', '0', '1473213408', '-1', null, '', '', '', '1473307274', '', null, null, '0', '13.00', '0.00', '13.00', '0', '0', '0', '', '0', '', '', '1', null, '');

-- ----------------------------
-- Table structure for ecm_order_billing
-- ----------------------------
DROP TABLE IF EXISTS `ecm_order_billing`;
CREATE TABLE `ecm_order_billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '申请人id',
  `company_id` int(11) DEFAULT NULL COMMENT '申请人所属企业id,没有则留空',
  `shopid` int(11) NOT NULL COMMENT '商家id',
  `date_add` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_order_billing
-- ----------------------------
INSERT INTO `ecm_order_billing` VALUES ('1', '3', '3', null, '0', '0');

-- ----------------------------
-- Table structure for ecm_order_extm
-- ----------------------------
DROP TABLE IF EXISTS `ecm_order_extm`;
CREATE TABLE `ecm_order_extm` (
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  `shipping_id` int(10) unsigned DEFAULT NULL,
  `shipping_name` varchar(100) DEFAULT NULL,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`order_id`),
  KEY `consignee` (`consignee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_order_extm
-- ----------------------------
INSERT INTO `ecm_order_extm` VALUES ('1', '超级买家', '1', '中国', '请如实填写收货人详细地址', '', '', '8888888', '1', '快递', '0.10');
INSERT INTO `ecm_order_extm` VALUES ('2', '超级买家', '1', '中国', '请如实填写收货人详细地址', '', '', '8888888', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('3', '超级买家', '1', '中国', '请如实填写收货人详细地址', '', '', '8888888', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('4', '小刚上阵', '2214', '中国	山东	济南	天桥区', '重汽彩世界', '250000', '15689694786', '', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('5', '小刚上阵', '2214', '中国	山东	济南	天桥区', '重汽彩世界', '250000', '15689694786', '', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('6', 'test1', '2625', '中国	上海	上海	闸北区', 'dfa', '156000', '15689694786', '', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('7', 'test2', '2215', '中国	山东	济南	槐荫区', 'dfa', '256980', '15689694786', '', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('8', 'test2', '2215', '中国	山东	济南	槐荫区', 'dfa', '256980', '15689694786', '', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('9', 'test2', '2215', '中国	山东	济南	槐荫区', 'dfa', '256980', '15689694786', '', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('10', 'test1', '2213', '中国	山东	济南	历下区', '文化东路76号万豪星光天地步行街', '250000', '', '15689694786', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('11', 'test1', '2213', '中国	山东	济南	历下区', '文化东路76号万豪星光天地步行街', '250000', '', '15689694786', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('12', 'test1', '2213', '中国	山东	济南	历下区', '文化东路76号万豪星光天地步行街', '250000', '', '15689694786', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('13', 'test1', '2213', '中国	山东	济南	历下区', '文化东路76号万豪星光天地步行街', '250000', '', '15689694786', '1', '包邮', '0.00');
INSERT INTO `ecm_order_extm` VALUES ('14', 'test1', '2213', '中国	山东	济南	历下区', '文化东路76号万豪星光天地步行街', '250000', '', '15689694786', '1', '包邮', '0.00');

-- ----------------------------
-- Table structure for ecm_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecm_order_goods`;
CREATE TABLE `ecm_order_goods` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL DEFAULT '',
  `spec_id` int(10) unsigned NOT NULL DEFAULT '0',
  `specification` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  `goods_image` varchar(255) DEFAULT NULL,
  `evaluation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `credit_value` tinyint(1) NOT NULL DEFAULT '0',
  `is_valid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `recom` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`,`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_order_goods
-- ----------------------------
INSERT INTO `ecm_order_goods` VALUES ('1', '1', '18', '沙洲优黄花开富贵480ml/瓶', '18', '', '32.00', '1', 'data/files/store_2/goods_166/small_201312262109269656.jpg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('2', '2', '15', '海泉 进口柠檬 尤力克 新鲜配送', '15', '', '30.60', '1', 'data/files/store_2/goods_153/small_201312262105539118.jpg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('3', '3', '99', '测试商品', '99', '颜色:红色 尺码:S', '0.10', '1', 'data/files/store_2/goods_123/small_201406260258439769.jpg', '3', '测试好评', '1', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('4', '4', '99', '测试商品', '100', '颜色:红色 尺码:M', '0.10', '1', 'data/files/store_2/goods_123/small_201406260258439769.jpg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('5', '4', '2', '袋装水果', '2', '', '100.00', '1', 'data/files/store_2/goods_198/small_201312262049586818.jpg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('6', '5', '15', '海泉 进口柠檬 尤力克 新鲜配送', '15', '', '30.60', '1', 'data/files/store_2/goods_153/small_201312262105539118.jpg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('7', '6', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:A4', '10.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('8', '7', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:A4', '10.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('9', '8', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:A4', '10.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('10', '9', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:A4', '10.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('11', '10', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:A4', '10.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('12', '11', '100', '最好的测试黑白打印', '103', '颜色:黑白 尺码:A4', '10.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('13', '12', '100', '最好的测试黑白打印', '112', '颜色:彩色 尺码:A3', '25.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('14', '13', '100', '最好的测试黑白打印', '110', '颜色:双面 尺码:A4', '13.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');
INSERT INTO `ecm_order_goods` VALUES ('15', '14', '100', '最好的测试黑白打印', '110', '颜色:双面 尺码:A4', '13.00', '1', 'data/files/store_2/goods_38/small_201608190943582337.jpeg', '0', '', '0', '1', '0', '0', '', '');

-- ----------------------------
-- Table structure for ecm_order_integral
-- ----------------------------
DROP TABLE IF EXISTS `ecm_order_integral`;
CREATE TABLE `ecm_order_integral` (
  `order_id` int(11) NOT NULL,
  `buyer_has_integral` int(11) NOT NULL DEFAULT '0',
  `seller_has_integral` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_order_integral
-- ----------------------------
INSERT INTO `ecm_order_integral` VALUES ('4', '0', '0');
INSERT INTO `ecm_order_integral` VALUES ('5', '10', '0');
INSERT INTO `ecm_order_integral` VALUES ('6', '1', '0');
INSERT INTO `ecm_order_integral` VALUES ('7', '1', '0');
INSERT INTO `ecm_order_integral` VALUES ('8', '1', '0');
INSERT INTO `ecm_order_integral` VALUES ('9', '1', '0');
INSERT INTO `ecm_order_integral` VALUES ('10', '1', '0');
INSERT INTO `ecm_order_integral` VALUES ('11', '1', '0');
INSERT INTO `ecm_order_integral` VALUES ('12', '1', '0');
INSERT INTO `ecm_order_integral` VALUES ('14', '1', '0');

-- ----------------------------
-- Table structure for ecm_order_log
-- ----------------------------
DROP TABLE IF EXISTS `ecm_order_log`;
CREATE TABLE `ecm_order_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `operator` varchar(60) NOT NULL DEFAULT '',
  `order_status` varchar(60) NOT NULL DEFAULT '',
  `changed_status` varchar(60) NOT NULL DEFAULT '',
  `remark` varchar(255) DEFAULT NULL,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_order_log
-- ----------------------------
INSERT INTO `ecm_order_log` VALUES ('1', '4', 'buyer', '等待买家付款', '交易关闭', '改选其他商品', '1470252637');
INSERT INTO `ecm_order_log` VALUES ('2', '5', 'buyer', '等待买家付款', '交易关闭', '改选其他商品', '1470682451');
INSERT INTO `ecm_order_log` VALUES ('3', '3', 'seller', '已提交', '买家已付款', '准备发货', '1470966502');
INSERT INTO `ecm_order_log` VALUES ('4', '3', 'seller', '买家已付款', '卖家已发货', '生产完毕', '1470966564');
INSERT INTO `ecm_order_log` VALUES ('5', '3', 'buyer', '卖家已发货', '交易完成', '买家确认收货', '1470966697');

-- ----------------------------
-- Table structure for ecm_pageview
-- ----------------------------
DROP TABLE IF EXISTS `ecm_pageview`;
CREATE TABLE `ecm_pageview` (
  `rec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_date` date NOT NULL DEFAULT '0000-00-00',
  `view_times` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `storedate` (`store_id`,`view_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_pageview
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_partner
-- ----------------------------
DROP TABLE IF EXISTS `ecm_partner`;
CREATE TABLE `ecm_partner` (
  `partner_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) DEFAULT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`partner_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_partner
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_payment
-- ----------------------------
DROP TABLE IF EXISTS `ecm_payment`;
CREATE TABLE `ecm_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `payment_code` varchar(20) NOT NULL DEFAULT '',
  `payment_name` varchar(100) NOT NULL DEFAULT '',
  `payment_desc` varchar(255) DEFAULT NULL,
  `config` text,
  `is_online` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`payment_id`),
  KEY `store_id` (`store_id`),
  KEY `payment_code` (`payment_code`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_payment
-- ----------------------------
INSERT INTO `ecm_payment` VALUES ('3', '2', 'cod', '货到付款', '', '', '0', '1', '0');
INSERT INTO `ecm_payment` VALUES ('2', '2', 'bank', '银行汇款', '', '', '0', '1', '0');
INSERT INTO `ecm_payment` VALUES ('4', '2', 'alipayfree', '支付宝免签接口', '', 'a:2:{s:18:\"alipayfree_account\";s:15:\"yuhui.f@163.com\";s:5:\"pcode\";s:0:\"\";}', '1', '1', '0');
INSERT INTO `ecm_payment` VALUES ('5', '2', 'cos', '到店付款', '', '', '0', '1', '0');
INSERT INTO `ecm_payment` VALUES ('6', '2', 'wxnative', '微信扫码支付', '', 'a:5:{s:5:\"appid\";s:18:\"wxd58a555551eb4b0c\";s:5:\"mchid\";s:10:\"1220360701\";s:3:\"key\";s:32:\"7b54d71fa0db7f1f58925a26a421b7ea\";s:9:\"appsecret\";s:32:\"ef9bb711068b5060677e99a8667b6b3e\";s:5:\"pcode\";s:0:\"\";}', '1', '1', '0');
INSERT INTO `ecm_payment` VALUES ('7', '2', 'wxjsapi', '微信jsapi支付', '', 'a:5:{s:5:\"appid\";s:18:\"wxd58a555551eb4b0c\";s:5:\"mchid\";s:10:\"1220360701\";s:3:\"key\";s:32:\"7b54d71fa0db7f1f58925a26a421b7ea\";s:9:\"appsecret\";s:32:\"ef9bb711068b5060677e99a8667b6b3e\";s:5:\"pcode\";s:0:\"\";}', '1', '1', '0');
INSERT INTO `ecm_payment` VALUES ('8', '2', 'sft', '站内宝', '', '', '0', '1', '0');
INSERT INTO `ecm_payment` VALUES ('9', '2', 'alipay_bank', '支付宝网银', '', 'a:5:{s:14:\"alipay_account\";s:15:\"yuhui.f@163.com\";s:10:\"alipay_key\";s:3:\"111\";s:14:\"alipay_partner\";s:3:\"222\";s:14:\"alipay_service\";s:25:\"create_direct_pay_by_user\";s:5:\"pcode\";s:0:\"\";}', '1', '1', '0');
INSERT INTO `ecm_payment` VALUES ('10', '2', 'alipaywap', '支付宝手机支付', '', 'a:4:{s:14:\"alipay_account\";s:15:\"yuhui.f@163.com\";s:10:\"alipay_key\";s:3:\"111\";s:14:\"alipay_partner\";s:3:\"222\";s:5:\"pcode\";s:0:\"\";}', '1', '1', '0');
INSERT INTO `ecm_payment` VALUES ('11', '2', 'alipay', '支付宝', '', 'a:5:{s:14:\"alipay_account\";s:16:\"361818525@qq.com\";s:10:\"alipay_key\";s:32:\"7w1xf9to8epcwzsvl8uu7278h1ar6bia\";s:14:\"alipay_partner\";s:16:\"2088002842299644\";s:14:\"alipay_service\";s:21:\"trade_create_by_buyer\";s:5:\"pcode\";s:0:\"\";}', '1', '1', '0');
INSERT INTO `ecm_payment` VALUES ('12', '0', 'sft', '站内宝', '', '', '0', '1', '0');

-- ----------------------------
-- Table structure for ecm_privilege
-- ----------------------------
DROP TABLE IF EXISTS `ecm_privilege`;
CREATE TABLE `ecm_privilege` (
  `priv_code` varchar(20) NOT NULL DEFAULT '',
  `priv_name` varchar(60) NOT NULL DEFAULT '',
  `parent_code` varchar(20) DEFAULT NULL,
  `owner` varchar(10) NOT NULL DEFAULT 'mall',
  PRIMARY KEY (`priv_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_promotion
-- ----------------------------
DROP TABLE IF EXISTS `ecm_promotion`;
CREATE TABLE `ecm_promotion` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_desc` varchar(255) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `spec_price` text NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_recommend
-- ----------------------------
DROP TABLE IF EXISTS `ecm_recommend`;
CREATE TABLE `ecm_recommend` (
  `recom_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recom_name` varchar(100) NOT NULL DEFAULT '',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`recom_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_recommend
-- ----------------------------
INSERT INTO `ecm_recommend` VALUES ('1', '果蔬', '0');
INSERT INTO `ecm_recommend` VALUES ('2', '酒水', '0');
INSERT INTO `ecm_recommend` VALUES ('4', '测试推荐类型', '2');

-- ----------------------------
-- Table structure for ecm_recommended_goods
-- ----------------------------
DROP TABLE IF EXISTS `ecm_recommended_goods`;
CREATE TABLE `ecm_recommended_goods` (
  `recom_id` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`recom_id`,`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_recommended_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_refund
-- ----------------------------
DROP TABLE IF EXISTS `ecm_refund`;
CREATE TABLE `ecm_refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_sn` varchar(50) NOT NULL,
  `order_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `spec_id` int(10) NOT NULL,
  `refund_reason` varchar(50) NOT NULL,
  `refund_desc` varchar(255) NOT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `goods_fee` decimal(10,2) NOT NULL,
  `shipping_fee` decimal(10,2) NOT NULL,
  `refund_goods_fee` decimal(10,2) NOT NULL,
  `refund_shipping_fee` decimal(10,2) NOT NULL,
  `buyer_id` int(10) NOT NULL,
  `seller_id` int(10) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '',
  `shipped` int(11) NOT NULL,
  `ask_customer` int(1) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`refund_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_refund
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_refund_file
-- ----------------------------
DROP TABLE IF EXISTS `ecm_refund_file`;
CREATE TABLE `ecm_refund_file` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refund_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `file_type` varchar(255) NOT NULL DEFAULT '',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL,
  `belong` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `log_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `refund_id` (`refund_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_refund_file
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_refund_log
-- ----------------------------
DROP TABLE IF EXISTS `ecm_refund_log`;
CREATE TABLE `ecm_refund_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refund_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `refund_status` varchar(60) NOT NULL DEFAULT '',
  `changed_status` varchar(60) NOT NULL DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `refund_id` (`refund_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_refund_log
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_refund_message
-- ----------------------------
DROP TABLE IF EXISTS `ecm_refund_message`;
CREATE TABLE `ecm_refund_message` (
  `rm_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `owner_role` varchar(10) NOT NULL,
  `refund_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`rm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_refund_message
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_refund_return
-- ----------------------------
DROP TABLE IF EXISTS `ecm_refund_return`;
CREATE TABLE `ecm_refund_return` (
  `refund_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned DEFAULT NULL,
  `logistics_company` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `return_mark` varchar(255) NOT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  `shipping_name` varchar(100) DEFAULT NULL,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `invoice_no` varchar(255) NOT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `consignee` (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_refund_return
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_region
-- ----------------------------
DROP TABLE IF EXISTS `ecm_region`;
CREATE TABLE `ecm_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3398 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_region
-- ----------------------------
INSERT INTO `ecm_region` VALUES ('1', '中国', '0', '255');
INSERT INTO `ecm_region` VALUES ('2', '北京', '1', '255');
INSERT INTO `ecm_region` VALUES ('3', '北京', '2', '255');
INSERT INTO `ecm_region` VALUES ('4', '东城区', '3', '255');
INSERT INTO `ecm_region` VALUES ('5', '西城区', '3', '255');
INSERT INTO `ecm_region` VALUES ('6', '海淀区', '3', '255');
INSERT INTO `ecm_region` VALUES ('7', '朝阳区', '3', '255');
INSERT INTO `ecm_region` VALUES ('8', '崇文区', '3', '255');
INSERT INTO `ecm_region` VALUES ('9', '宣武区', '3', '255');
INSERT INTO `ecm_region` VALUES ('10', '丰台区', '3', '255');
INSERT INTO `ecm_region` VALUES ('11', '石景山区', '3', '255');
INSERT INTO `ecm_region` VALUES ('12', '房山区', '3', '255');
INSERT INTO `ecm_region` VALUES ('13', '门头沟区', '3', '255');
INSERT INTO `ecm_region` VALUES ('14', '通州区', '3', '255');
INSERT INTO `ecm_region` VALUES ('15', '顺义区', '3', '255');
INSERT INTO `ecm_region` VALUES ('16', '昌平区', '3', '255');
INSERT INTO `ecm_region` VALUES ('17', '怀柔区', '3', '255');
INSERT INTO `ecm_region` VALUES ('18', '平谷区', '3', '255');
INSERT INTO `ecm_region` VALUES ('19', '大兴区', '3', '255');
INSERT INTO `ecm_region` VALUES ('20', '密云县', '3', '255');
INSERT INTO `ecm_region` VALUES ('21', '延庆县', '3', '255');
INSERT INTO `ecm_region` VALUES ('22', '安徽', '1', '255');
INSERT INTO `ecm_region` VALUES ('23', '安庆', '22', '255');
INSERT INTO `ecm_region` VALUES ('24', '迎江区', '23', '255');
INSERT INTO `ecm_region` VALUES ('25', '大观区', '23', '255');
INSERT INTO `ecm_region` VALUES ('26', '宜秀区', '23', '255');
INSERT INTO `ecm_region` VALUES ('27', '桐城市', '23', '255');
INSERT INTO `ecm_region` VALUES ('28', '怀宁县', '23', '255');
INSERT INTO `ecm_region` VALUES ('29', '枞阳县', '23', '255');
INSERT INTO `ecm_region` VALUES ('30', '潜山县', '23', '255');
INSERT INTO `ecm_region` VALUES ('31', '太湖县', '23', '255');
INSERT INTO `ecm_region` VALUES ('32', '宿松县', '23', '255');
INSERT INTO `ecm_region` VALUES ('33', '望江县', '23', '255');
INSERT INTO `ecm_region` VALUES ('34', '岳西县', '23', '255');
INSERT INTO `ecm_region` VALUES ('35', '蚌埠', '22', '255');
INSERT INTO `ecm_region` VALUES ('36', '中市区', '35', '255');
INSERT INTO `ecm_region` VALUES ('37', '东市区', '35', '255');
INSERT INTO `ecm_region` VALUES ('38', '西市区', '35', '255');
INSERT INTO `ecm_region` VALUES ('39', '郊区', '35', '255');
INSERT INTO `ecm_region` VALUES ('40', '怀远县', '35', '255');
INSERT INTO `ecm_region` VALUES ('41', '五河县', '35', '255');
INSERT INTO `ecm_region` VALUES ('42', '固镇县', '35', '255');
INSERT INTO `ecm_region` VALUES ('43', '巢湖', '22', '255');
INSERT INTO `ecm_region` VALUES ('44', '居巢区', '43', '255');
INSERT INTO `ecm_region` VALUES ('45', '庐江县', '43', '255');
INSERT INTO `ecm_region` VALUES ('46', '无为县', '43', '255');
INSERT INTO `ecm_region` VALUES ('47', '含山县', '43', '255');
INSERT INTO `ecm_region` VALUES ('48', '和县', '43', '255');
INSERT INTO `ecm_region` VALUES ('49', '池州', '22', '255');
INSERT INTO `ecm_region` VALUES ('50', '贵池区', '49', '255');
INSERT INTO `ecm_region` VALUES ('51', '东至县', '49', '255');
INSERT INTO `ecm_region` VALUES ('52', '石台县', '49', '255');
INSERT INTO `ecm_region` VALUES ('53', '青阳县', '49', '255');
INSERT INTO `ecm_region` VALUES ('54', '滁州', '22', '255');
INSERT INTO `ecm_region` VALUES ('55', '琅琊区', '54', '255');
INSERT INTO `ecm_region` VALUES ('56', '南谯区', '54', '255');
INSERT INTO `ecm_region` VALUES ('57', '天长市', '54', '255');
INSERT INTO `ecm_region` VALUES ('58', '明光市', '54', '255');
INSERT INTO `ecm_region` VALUES ('59', '来安县', '54', '255');
INSERT INTO `ecm_region` VALUES ('60', '全椒县', '54', '255');
INSERT INTO `ecm_region` VALUES ('61', '定远县', '54', '255');
INSERT INTO `ecm_region` VALUES ('62', '凤阳县', '54', '255');
INSERT INTO `ecm_region` VALUES ('63', '阜阳', '22', '255');
INSERT INTO `ecm_region` VALUES ('64', '蚌山区', '63', '255');
INSERT INTO `ecm_region` VALUES ('65', '龙子湖区', '63', '255');
INSERT INTO `ecm_region` VALUES ('66', '禹会区', '63', '255');
INSERT INTO `ecm_region` VALUES ('67', '淮上区', '63', '255');
INSERT INTO `ecm_region` VALUES ('68', '颍州区', '63', '255');
INSERT INTO `ecm_region` VALUES ('69', '颍东区', '63', '255');
INSERT INTO `ecm_region` VALUES ('70', '颍泉区', '63', '255');
INSERT INTO `ecm_region` VALUES ('71', '界首市', '63', '255');
INSERT INTO `ecm_region` VALUES ('72', '临泉县', '63', '255');
INSERT INTO `ecm_region` VALUES ('73', '太和县', '63', '255');
INSERT INTO `ecm_region` VALUES ('74', '阜南县', '63', '255');
INSERT INTO `ecm_region` VALUES ('75', '颖上县', '63', '255');
INSERT INTO `ecm_region` VALUES ('76', '淮北', '22', '255');
INSERT INTO `ecm_region` VALUES ('77', '相山区', '76', '255');
INSERT INTO `ecm_region` VALUES ('78', '杜集区', '76', '255');
INSERT INTO `ecm_region` VALUES ('79', '烈山区', '76', '255');
INSERT INTO `ecm_region` VALUES ('80', '濉溪县', '76', '255');
INSERT INTO `ecm_region` VALUES ('81', '淮南', '22', '255');
INSERT INTO `ecm_region` VALUES ('82', '田家庵区', '81', '255');
INSERT INTO `ecm_region` VALUES ('83', '大通区', '81', '255');
INSERT INTO `ecm_region` VALUES ('84', '谢家集区', '81', '255');
INSERT INTO `ecm_region` VALUES ('85', '八公山区', '81', '255');
INSERT INTO `ecm_region` VALUES ('86', '潘集区', '81', '255');
INSERT INTO `ecm_region` VALUES ('87', '凤台县', '81', '255');
INSERT INTO `ecm_region` VALUES ('88', '黄山', '22', '255');
INSERT INTO `ecm_region` VALUES ('89', '屯溪区', '88', '255');
INSERT INTO `ecm_region` VALUES ('90', '黄山区', '88', '255');
INSERT INTO `ecm_region` VALUES ('91', '徽州区', '88', '255');
INSERT INTO `ecm_region` VALUES ('92', '歙县', '88', '255');
INSERT INTO `ecm_region` VALUES ('93', '休宁县', '88', '255');
INSERT INTO `ecm_region` VALUES ('94', '黟县', '88', '255');
INSERT INTO `ecm_region` VALUES ('95', '祁门县', '88', '255');
INSERT INTO `ecm_region` VALUES ('96', '六安', '22', '255');
INSERT INTO `ecm_region` VALUES ('97', '金安区', '96', '255');
INSERT INTO `ecm_region` VALUES ('98', '裕安区', '96', '255');
INSERT INTO `ecm_region` VALUES ('99', '寿县', '96', '255');
INSERT INTO `ecm_region` VALUES ('100', '霍邱县', '96', '255');
INSERT INTO `ecm_region` VALUES ('101', '舒城县', '96', '255');
INSERT INTO `ecm_region` VALUES ('102', '金寨县', '96', '255');
INSERT INTO `ecm_region` VALUES ('103', '霍山县', '96', '255');
INSERT INTO `ecm_region` VALUES ('104', '马鞍山', '22', '255');
INSERT INTO `ecm_region` VALUES ('105', '雨山区', '104', '255');
INSERT INTO `ecm_region` VALUES ('106', '花山区', '104', '255');
INSERT INTO `ecm_region` VALUES ('107', '金家庄区', '104', '255');
INSERT INTO `ecm_region` VALUES ('108', '当涂县', '104', '255');
INSERT INTO `ecm_region` VALUES ('109', '宿州', '22', '255');
INSERT INTO `ecm_region` VALUES ('110', '埇桥区', '109', '255');
INSERT INTO `ecm_region` VALUES ('111', '砀山县', '109', '255');
INSERT INTO `ecm_region` VALUES ('112', '萧县', '109', '255');
INSERT INTO `ecm_region` VALUES ('113', '灵璧县', '109', '255');
INSERT INTO `ecm_region` VALUES ('114', '泗县', '109', '255');
INSERT INTO `ecm_region` VALUES ('115', '铜陵', '22', '255');
INSERT INTO `ecm_region` VALUES ('116', '铜官山区', '115', '255');
INSERT INTO `ecm_region` VALUES ('117', '狮子山区', '115', '255');
INSERT INTO `ecm_region` VALUES ('118', '郊区', '115', '255');
INSERT INTO `ecm_region` VALUES ('119', '铜陵县', '115', '255');
INSERT INTO `ecm_region` VALUES ('120', '芜湖', '22', '255');
INSERT INTO `ecm_region` VALUES ('121', '镜湖区', '120', '255');
INSERT INTO `ecm_region` VALUES ('122', '弋江区', '120', '255');
INSERT INTO `ecm_region` VALUES ('123', '鸠江区', '120', '255');
INSERT INTO `ecm_region` VALUES ('124', '三山区', '120', '255');
INSERT INTO `ecm_region` VALUES ('125', '芜湖县', '120', '255');
INSERT INTO `ecm_region` VALUES ('126', '繁昌县', '120', '255');
INSERT INTO `ecm_region` VALUES ('127', '南陵县', '120', '255');
INSERT INTO `ecm_region` VALUES ('128', '宣城', '22', '255');
INSERT INTO `ecm_region` VALUES ('129', '宣州区', '128', '255');
INSERT INTO `ecm_region` VALUES ('130', '宁国市', '128', '255');
INSERT INTO `ecm_region` VALUES ('131', '郎溪县', '128', '255');
INSERT INTO `ecm_region` VALUES ('132', '广德县', '128', '255');
INSERT INTO `ecm_region` VALUES ('133', '泾县', '128', '255');
INSERT INTO `ecm_region` VALUES ('134', '绩溪县', '128', '255');
INSERT INTO `ecm_region` VALUES ('135', '旌德县', '128', '255');
INSERT INTO `ecm_region` VALUES ('136', '亳州', '22', '255');
INSERT INTO `ecm_region` VALUES ('137', '涡阳县', '136', '255');
INSERT INTO `ecm_region` VALUES ('138', '蒙城县', '136', '255');
INSERT INTO `ecm_region` VALUES ('139', '利辛县', '136', '255');
INSERT INTO `ecm_region` VALUES ('140', '谯城区', '136', '255');
INSERT INTO `ecm_region` VALUES ('141', '合肥', '22', '255');
INSERT INTO `ecm_region` VALUES ('142', '庐阳区', '141', '255');
INSERT INTO `ecm_region` VALUES ('143', '瑶海区', '141', '255');
INSERT INTO `ecm_region` VALUES ('144', '蜀山区', '141', '255');
INSERT INTO `ecm_region` VALUES ('145', '包河区', '141', '255');
INSERT INTO `ecm_region` VALUES ('146', '长丰县', '141', '255');
INSERT INTO `ecm_region` VALUES ('147', '肥东县', '141', '255');
INSERT INTO `ecm_region` VALUES ('148', '肥西县', '141', '255');
INSERT INTO `ecm_region` VALUES ('149', '福建', '1', '255');
INSERT INTO `ecm_region` VALUES ('150', '福州', '149', '255');
INSERT INTO `ecm_region` VALUES ('151', '鼓楼区', '150', '255');
INSERT INTO `ecm_region` VALUES ('152', '台江区', '150', '255');
INSERT INTO `ecm_region` VALUES ('153', '仓山区', '150', '255');
INSERT INTO `ecm_region` VALUES ('154', '马尾区', '150', '255');
INSERT INTO `ecm_region` VALUES ('155', '晋安区', '150', '255');
INSERT INTO `ecm_region` VALUES ('156', '福清市', '150', '255');
INSERT INTO `ecm_region` VALUES ('157', '长乐市', '150', '255');
INSERT INTO `ecm_region` VALUES ('158', '闽侯县', '150', '255');
INSERT INTO `ecm_region` VALUES ('159', '连江县', '150', '255');
INSERT INTO `ecm_region` VALUES ('160', '罗源县', '150', '255');
INSERT INTO `ecm_region` VALUES ('161', '闽清县', '150', '255');
INSERT INTO `ecm_region` VALUES ('162', '永泰县', '150', '255');
INSERT INTO `ecm_region` VALUES ('163', '平潭县', '150', '255');
INSERT INTO `ecm_region` VALUES ('164', '龙岩', '149', '255');
INSERT INTO `ecm_region` VALUES ('165', '新罗区', '164', '255');
INSERT INTO `ecm_region` VALUES ('166', '漳平市', '164', '255');
INSERT INTO `ecm_region` VALUES ('167', '长汀县', '164', '255');
INSERT INTO `ecm_region` VALUES ('168', '永定县', '164', '255');
INSERT INTO `ecm_region` VALUES ('169', '上杭县', '164', '255');
INSERT INTO `ecm_region` VALUES ('170', '武平县', '164', '255');
INSERT INTO `ecm_region` VALUES ('171', '连城县', '164', '255');
INSERT INTO `ecm_region` VALUES ('172', '南平', '149', '255');
INSERT INTO `ecm_region` VALUES ('173', '延平区', '172', '255');
INSERT INTO `ecm_region` VALUES ('174', '邵武市', '172', '255');
INSERT INTO `ecm_region` VALUES ('175', '武夷山市', '172', '255');
INSERT INTO `ecm_region` VALUES ('176', '建瓯市', '172', '255');
INSERT INTO `ecm_region` VALUES ('177', '建阳市', '172', '255');
INSERT INTO `ecm_region` VALUES ('178', '顺昌县', '172', '255');
INSERT INTO `ecm_region` VALUES ('179', '浦城县', '172', '255');
INSERT INTO `ecm_region` VALUES ('180', '光泽县', '172', '255');
INSERT INTO `ecm_region` VALUES ('181', '松溪县', '172', '255');
INSERT INTO `ecm_region` VALUES ('182', '政和县', '172', '255');
INSERT INTO `ecm_region` VALUES ('183', '宁德', '149', '255');
INSERT INTO `ecm_region` VALUES ('184', '蕉城区', '183', '255');
INSERT INTO `ecm_region` VALUES ('185', '福安市', '183', '255');
INSERT INTO `ecm_region` VALUES ('186', '福鼎市', '183', '255');
INSERT INTO `ecm_region` VALUES ('187', '霞浦县', '183', '255');
INSERT INTO `ecm_region` VALUES ('188', '古田县', '183', '255');
INSERT INTO `ecm_region` VALUES ('189', '屏南县', '183', '255');
INSERT INTO `ecm_region` VALUES ('190', '寿宁县', '183', '255');
INSERT INTO `ecm_region` VALUES ('191', '周宁县', '183', '255');
INSERT INTO `ecm_region` VALUES ('192', '柘荣县', '183', '255');
INSERT INTO `ecm_region` VALUES ('193', '莆田', '149', '255');
INSERT INTO `ecm_region` VALUES ('194', '城厢区', '193', '255');
INSERT INTO `ecm_region` VALUES ('195', '涵江区', '193', '255');
INSERT INTO `ecm_region` VALUES ('196', '荔城区', '193', '255');
INSERT INTO `ecm_region` VALUES ('197', '秀屿区', '193', '255');
INSERT INTO `ecm_region` VALUES ('198', '仙游县', '193', '255');
INSERT INTO `ecm_region` VALUES ('199', '泉州', '149', '255');
INSERT INTO `ecm_region` VALUES ('200', '鲤城区', '199', '255');
INSERT INTO `ecm_region` VALUES ('201', '丰泽区', '199', '255');
INSERT INTO `ecm_region` VALUES ('202', '洛江区', '199', '255');
INSERT INTO `ecm_region` VALUES ('203', '清濛开发区', '199', '255');
INSERT INTO `ecm_region` VALUES ('204', '泉港区', '199', '255');
INSERT INTO `ecm_region` VALUES ('205', '石狮市', '199', '255');
INSERT INTO `ecm_region` VALUES ('206', '晋江市', '199', '255');
INSERT INTO `ecm_region` VALUES ('207', '南安市', '199', '255');
INSERT INTO `ecm_region` VALUES ('208', '惠安县', '199', '255');
INSERT INTO `ecm_region` VALUES ('209', '安溪县', '199', '255');
INSERT INTO `ecm_region` VALUES ('210', '永春县', '199', '255');
INSERT INTO `ecm_region` VALUES ('211', '德化县', '199', '255');
INSERT INTO `ecm_region` VALUES ('212', '金门县', '199', '255');
INSERT INTO `ecm_region` VALUES ('213', '三明', '149', '255');
INSERT INTO `ecm_region` VALUES ('214', '梅列区', '213', '255');
INSERT INTO `ecm_region` VALUES ('215', '三元区', '213', '255');
INSERT INTO `ecm_region` VALUES ('216', '永安市', '213', '255');
INSERT INTO `ecm_region` VALUES ('217', '明溪县', '213', '255');
INSERT INTO `ecm_region` VALUES ('218', '清流县', '213', '255');
INSERT INTO `ecm_region` VALUES ('219', '宁化县', '213', '255');
INSERT INTO `ecm_region` VALUES ('220', '大田县', '213', '255');
INSERT INTO `ecm_region` VALUES ('221', '尤溪县', '213', '255');
INSERT INTO `ecm_region` VALUES ('222', '沙县', '213', '255');
INSERT INTO `ecm_region` VALUES ('223', '将乐县', '213', '255');
INSERT INTO `ecm_region` VALUES ('224', '泰宁县', '213', '255');
INSERT INTO `ecm_region` VALUES ('225', '建宁县', '213', '255');
INSERT INTO `ecm_region` VALUES ('226', '厦门', '149', '255');
INSERT INTO `ecm_region` VALUES ('227', '思明区', '226', '255');
INSERT INTO `ecm_region` VALUES ('228', '海沧区', '226', '255');
INSERT INTO `ecm_region` VALUES ('229', '湖里区', '226', '255');
INSERT INTO `ecm_region` VALUES ('230', '集美区', '226', '255');
INSERT INTO `ecm_region` VALUES ('231', '同安区', '226', '255');
INSERT INTO `ecm_region` VALUES ('232', '翔安区', '226', '255');
INSERT INTO `ecm_region` VALUES ('233', '漳州', '149', '255');
INSERT INTO `ecm_region` VALUES ('234', '芗城区', '233', '255');
INSERT INTO `ecm_region` VALUES ('235', '龙文区', '233', '255');
INSERT INTO `ecm_region` VALUES ('236', '龙海市', '233', '255');
INSERT INTO `ecm_region` VALUES ('237', '云霄县', '233', '255');
INSERT INTO `ecm_region` VALUES ('238', '漳浦县', '233', '255');
INSERT INTO `ecm_region` VALUES ('239', '诏安县', '233', '255');
INSERT INTO `ecm_region` VALUES ('240', '长泰县', '233', '255');
INSERT INTO `ecm_region` VALUES ('241', '东山县', '233', '255');
INSERT INTO `ecm_region` VALUES ('242', '南靖县', '233', '255');
INSERT INTO `ecm_region` VALUES ('243', '平和县', '233', '255');
INSERT INTO `ecm_region` VALUES ('244', '华安县', '233', '255');
INSERT INTO `ecm_region` VALUES ('245', '甘肃', '1', '255');
INSERT INTO `ecm_region` VALUES ('246', '兰州', '245', '255');
INSERT INTO `ecm_region` VALUES ('247', '皋兰县', '246', '255');
INSERT INTO `ecm_region` VALUES ('248', '城关区', '246', '255');
INSERT INTO `ecm_region` VALUES ('249', '七里河区', '246', '255');
INSERT INTO `ecm_region` VALUES ('250', '西固区', '246', '255');
INSERT INTO `ecm_region` VALUES ('251', '安宁区', '246', '255');
INSERT INTO `ecm_region` VALUES ('252', '红古区', '246', '255');
INSERT INTO `ecm_region` VALUES ('253', '永登县', '246', '255');
INSERT INTO `ecm_region` VALUES ('254', '榆中县', '246', '255');
INSERT INTO `ecm_region` VALUES ('255', '白银', '245', '255');
INSERT INTO `ecm_region` VALUES ('256', '白银区', '255', '255');
INSERT INTO `ecm_region` VALUES ('257', '平川区', '255', '255');
INSERT INTO `ecm_region` VALUES ('258', '会宁县', '255', '255');
INSERT INTO `ecm_region` VALUES ('259', '景泰县', '255', '255');
INSERT INTO `ecm_region` VALUES ('260', '靖远县', '255', '255');
INSERT INTO `ecm_region` VALUES ('261', '定西', '245', '255');
INSERT INTO `ecm_region` VALUES ('262', '临洮县', '261', '255');
INSERT INTO `ecm_region` VALUES ('263', '陇西县', '261', '255');
INSERT INTO `ecm_region` VALUES ('264', '通渭县', '261', '255');
INSERT INTO `ecm_region` VALUES ('265', '渭源县', '261', '255');
INSERT INTO `ecm_region` VALUES ('266', '漳县', '261', '255');
INSERT INTO `ecm_region` VALUES ('267', '岷县', '261', '255');
INSERT INTO `ecm_region` VALUES ('268', '安定区', '261', '255');
INSERT INTO `ecm_region` VALUES ('269', '甘南', '245', '255');
INSERT INTO `ecm_region` VALUES ('270', '合作市', '269', '255');
INSERT INTO `ecm_region` VALUES ('271', '临潭县', '269', '255');
INSERT INTO `ecm_region` VALUES ('272', '卓尼县', '269', '255');
INSERT INTO `ecm_region` VALUES ('273', '舟曲县', '269', '255');
INSERT INTO `ecm_region` VALUES ('274', '迭部县', '269', '255');
INSERT INTO `ecm_region` VALUES ('275', '玛曲县', '269', '255');
INSERT INTO `ecm_region` VALUES ('276', '碌曲县', '269', '255');
INSERT INTO `ecm_region` VALUES ('277', '夏河县', '269', '255');
INSERT INTO `ecm_region` VALUES ('278', '嘉峪关', '245', '255');
INSERT INTO `ecm_region` VALUES ('279', '嘉峪关市', '278', '255');
INSERT INTO `ecm_region` VALUES ('280', '金昌', '245', '255');
INSERT INTO `ecm_region` VALUES ('281', '金川区', '280', '255');
INSERT INTO `ecm_region` VALUES ('282', '永昌县', '280', '255');
INSERT INTO `ecm_region` VALUES ('283', '酒泉', '245', '255');
INSERT INTO `ecm_region` VALUES ('284', '肃州区', '283', '255');
INSERT INTO `ecm_region` VALUES ('285', '玉门市', '283', '255');
INSERT INTO `ecm_region` VALUES ('286', '敦煌市', '283', '255');
INSERT INTO `ecm_region` VALUES ('287', '金塔县', '283', '255');
INSERT INTO `ecm_region` VALUES ('288', '瓜州县', '283', '255');
INSERT INTO `ecm_region` VALUES ('289', '肃北', '283', '255');
INSERT INTO `ecm_region` VALUES ('290', '阿克塞', '283', '255');
INSERT INTO `ecm_region` VALUES ('291', '临夏', '245', '255');
INSERT INTO `ecm_region` VALUES ('292', '临夏市', '291', '255');
INSERT INTO `ecm_region` VALUES ('293', '临夏县', '291', '255');
INSERT INTO `ecm_region` VALUES ('294', '康乐县', '291', '255');
INSERT INTO `ecm_region` VALUES ('295', '永靖县', '291', '255');
INSERT INTO `ecm_region` VALUES ('296', '广河县', '291', '255');
INSERT INTO `ecm_region` VALUES ('297', '和政县', '291', '255');
INSERT INTO `ecm_region` VALUES ('298', '东乡族自治县', '291', '255');
INSERT INTO `ecm_region` VALUES ('299', '积石山', '291', '255');
INSERT INTO `ecm_region` VALUES ('300', '陇南', '245', '255');
INSERT INTO `ecm_region` VALUES ('301', '成县', '300', '255');
INSERT INTO `ecm_region` VALUES ('302', '徽县', '300', '255');
INSERT INTO `ecm_region` VALUES ('303', '康县', '300', '255');
INSERT INTO `ecm_region` VALUES ('304', '礼县', '300', '255');
INSERT INTO `ecm_region` VALUES ('305', '两当县', '300', '255');
INSERT INTO `ecm_region` VALUES ('306', '文县', '300', '255');
INSERT INTO `ecm_region` VALUES ('307', '西和县', '300', '255');
INSERT INTO `ecm_region` VALUES ('308', '宕昌县', '300', '255');
INSERT INTO `ecm_region` VALUES ('309', '武都区', '300', '255');
INSERT INTO `ecm_region` VALUES ('310', '平凉', '245', '255');
INSERT INTO `ecm_region` VALUES ('311', '崇信县', '310', '255');
INSERT INTO `ecm_region` VALUES ('312', '华亭县', '310', '255');
INSERT INTO `ecm_region` VALUES ('313', '静宁县', '310', '255');
INSERT INTO `ecm_region` VALUES ('314', '灵台县', '310', '255');
INSERT INTO `ecm_region` VALUES ('315', '崆峒区', '310', '255');
INSERT INTO `ecm_region` VALUES ('316', '庄浪县', '310', '255');
INSERT INTO `ecm_region` VALUES ('317', '泾川县', '310', '255');
INSERT INTO `ecm_region` VALUES ('318', '庆阳', '245', '255');
INSERT INTO `ecm_region` VALUES ('319', '合水县', '318', '255');
INSERT INTO `ecm_region` VALUES ('320', '华池县', '318', '255');
INSERT INTO `ecm_region` VALUES ('321', '环县', '318', '255');
INSERT INTO `ecm_region` VALUES ('322', '宁县', '318', '255');
INSERT INTO `ecm_region` VALUES ('323', '庆城县', '318', '255');
INSERT INTO `ecm_region` VALUES ('324', '西峰区', '318', '255');
INSERT INTO `ecm_region` VALUES ('325', '镇原县', '318', '255');
INSERT INTO `ecm_region` VALUES ('326', '正宁县', '318', '255');
INSERT INTO `ecm_region` VALUES ('327', '天水', '245', '255');
INSERT INTO `ecm_region` VALUES ('328', '甘谷县', '327', '255');
INSERT INTO `ecm_region` VALUES ('329', '秦安县', '327', '255');
INSERT INTO `ecm_region` VALUES ('330', '清水县', '327', '255');
INSERT INTO `ecm_region` VALUES ('331', '秦州区', '327', '255');
INSERT INTO `ecm_region` VALUES ('332', '麦积区', '327', '255');
INSERT INTO `ecm_region` VALUES ('333', '武山县', '327', '255');
INSERT INTO `ecm_region` VALUES ('334', '张家川', '327', '255');
INSERT INTO `ecm_region` VALUES ('335', '武威', '245', '255');
INSERT INTO `ecm_region` VALUES ('336', '古浪县', '335', '255');
INSERT INTO `ecm_region` VALUES ('337', '民勤县', '335', '255');
INSERT INTO `ecm_region` VALUES ('338', '天祝', '335', '255');
INSERT INTO `ecm_region` VALUES ('339', '凉州区', '335', '255');
INSERT INTO `ecm_region` VALUES ('340', '张掖', '245', '255');
INSERT INTO `ecm_region` VALUES ('341', '高台县', '340', '255');
INSERT INTO `ecm_region` VALUES ('342', '临泽县', '340', '255');
INSERT INTO `ecm_region` VALUES ('343', '民乐县', '340', '255');
INSERT INTO `ecm_region` VALUES ('344', '山丹县', '340', '255');
INSERT INTO `ecm_region` VALUES ('345', '肃南', '340', '255');
INSERT INTO `ecm_region` VALUES ('346', '甘州区', '340', '255');
INSERT INTO `ecm_region` VALUES ('347', '广东', '1', '255');
INSERT INTO `ecm_region` VALUES ('348', '广州', '347', '255');
INSERT INTO `ecm_region` VALUES ('349', '从化市', '348', '255');
INSERT INTO `ecm_region` VALUES ('350', '天河区', '348', '255');
INSERT INTO `ecm_region` VALUES ('351', '东山区', '348', '255');
INSERT INTO `ecm_region` VALUES ('352', '白云区', '348', '255');
INSERT INTO `ecm_region` VALUES ('353', '海珠区', '348', '255');
INSERT INTO `ecm_region` VALUES ('354', '荔湾区', '348', '255');
INSERT INTO `ecm_region` VALUES ('355', '越秀区', '348', '255');
INSERT INTO `ecm_region` VALUES ('356', '黄埔区', '348', '255');
INSERT INTO `ecm_region` VALUES ('357', '番禺区', '348', '255');
INSERT INTO `ecm_region` VALUES ('358', '花都区', '348', '255');
INSERT INTO `ecm_region` VALUES ('359', '增城区', '348', '255');
INSERT INTO `ecm_region` VALUES ('360', '从化区', '348', '255');
INSERT INTO `ecm_region` VALUES ('361', '市郊', '348', '255');
INSERT INTO `ecm_region` VALUES ('362', '深圳', '347', '255');
INSERT INTO `ecm_region` VALUES ('363', '福田区', '362', '255');
INSERT INTO `ecm_region` VALUES ('364', '罗湖区', '362', '255');
INSERT INTO `ecm_region` VALUES ('365', '南山区', '362', '255');
INSERT INTO `ecm_region` VALUES ('366', '宝安区', '362', '255');
INSERT INTO `ecm_region` VALUES ('367', '龙岗区', '362', '255');
INSERT INTO `ecm_region` VALUES ('368', '盐田区', '362', '255');
INSERT INTO `ecm_region` VALUES ('369', '潮州', '347', '255');
INSERT INTO `ecm_region` VALUES ('370', '湘桥区', '369', '255');
INSERT INTO `ecm_region` VALUES ('371', '潮安县', '369', '255');
INSERT INTO `ecm_region` VALUES ('372', '饶平县', '369', '255');
INSERT INTO `ecm_region` VALUES ('373', '东莞', '347', '255');
INSERT INTO `ecm_region` VALUES ('374', '南城区', '373', '255');
INSERT INTO `ecm_region` VALUES ('375', '东城区', '373', '255');
INSERT INTO `ecm_region` VALUES ('376', '万江区', '373', '255');
INSERT INTO `ecm_region` VALUES ('377', '莞城区', '373', '255');
INSERT INTO `ecm_region` VALUES ('378', '石龙镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('379', '虎门镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('380', '麻涌镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('381', '道滘镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('382', '石碣镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('383', '沙田镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('384', '望牛墩镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('385', '洪梅镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('386', '茶山镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('387', '寮步镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('388', '大岭山镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('389', '大朗镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('390', '黄江镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('391', '樟木头', '373', '255');
INSERT INTO `ecm_region` VALUES ('392', '凤岗镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('393', '塘厦镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('394', '谢岗镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('395', '厚街镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('396', '清溪镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('397', '常平镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('398', '桥头镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('399', '横沥镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('400', '东坑镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('401', '企石镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('402', '石排镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('403', '长安镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('404', '中堂镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('405', '高埗镇', '373', '255');
INSERT INTO `ecm_region` VALUES ('406', '佛山', '347', '255');
INSERT INTO `ecm_region` VALUES ('407', '禅城区', '406', '255');
INSERT INTO `ecm_region` VALUES ('408', '南海区', '406', '255');
INSERT INTO `ecm_region` VALUES ('409', '顺德区', '406', '255');
INSERT INTO `ecm_region` VALUES ('410', '三水区', '406', '255');
INSERT INTO `ecm_region` VALUES ('411', '高明区', '406', '255');
INSERT INTO `ecm_region` VALUES ('412', '河源', '347', '255');
INSERT INTO `ecm_region` VALUES ('413', '东源县', '412', '255');
INSERT INTO `ecm_region` VALUES ('414', '和平县', '412', '255');
INSERT INTO `ecm_region` VALUES ('415', '源城区', '412', '255');
INSERT INTO `ecm_region` VALUES ('416', '连平县', '412', '255');
INSERT INTO `ecm_region` VALUES ('417', '龙川县', '412', '255');
INSERT INTO `ecm_region` VALUES ('418', '紫金县', '412', '255');
INSERT INTO `ecm_region` VALUES ('419', '惠州', '347', '255');
INSERT INTO `ecm_region` VALUES ('420', '惠阳区', '419', '255');
INSERT INTO `ecm_region` VALUES ('421', '惠城区', '419', '255');
INSERT INTO `ecm_region` VALUES ('422', '大亚湾', '419', '255');
INSERT INTO `ecm_region` VALUES ('423', '博罗县', '419', '255');
INSERT INTO `ecm_region` VALUES ('424', '惠东县', '419', '255');
INSERT INTO `ecm_region` VALUES ('425', '龙门县', '419', '255');
INSERT INTO `ecm_region` VALUES ('426', '江门', '347', '255');
INSERT INTO `ecm_region` VALUES ('427', '江海区', '426', '255');
INSERT INTO `ecm_region` VALUES ('428', '蓬江区', '426', '255');
INSERT INTO `ecm_region` VALUES ('429', '新会区', '426', '255');
INSERT INTO `ecm_region` VALUES ('430', '台山市', '426', '255');
INSERT INTO `ecm_region` VALUES ('431', '开平市', '426', '255');
INSERT INTO `ecm_region` VALUES ('432', '鹤山市', '426', '255');
INSERT INTO `ecm_region` VALUES ('433', '恩平市', '426', '255');
INSERT INTO `ecm_region` VALUES ('434', '揭阳', '347', '255');
INSERT INTO `ecm_region` VALUES ('435', '榕城区', '434', '255');
INSERT INTO `ecm_region` VALUES ('436', '普宁市', '434', '255');
INSERT INTO `ecm_region` VALUES ('437', '揭东县', '434', '255');
INSERT INTO `ecm_region` VALUES ('438', '揭西县', '434', '255');
INSERT INTO `ecm_region` VALUES ('439', '惠来县', '434', '255');
INSERT INTO `ecm_region` VALUES ('440', '茂名', '347', '255');
INSERT INTO `ecm_region` VALUES ('441', '茂南区', '440', '255');
INSERT INTO `ecm_region` VALUES ('442', '茂港区', '440', '255');
INSERT INTO `ecm_region` VALUES ('443', '高州市', '440', '255');
INSERT INTO `ecm_region` VALUES ('444', '化州市', '440', '255');
INSERT INTO `ecm_region` VALUES ('445', '信宜市', '440', '255');
INSERT INTO `ecm_region` VALUES ('446', '电白县', '440', '255');
INSERT INTO `ecm_region` VALUES ('447', '梅州', '347', '255');
INSERT INTO `ecm_region` VALUES ('448', '梅县', '447', '255');
INSERT INTO `ecm_region` VALUES ('449', '梅江区', '447', '255');
INSERT INTO `ecm_region` VALUES ('450', '兴宁市', '447', '255');
INSERT INTO `ecm_region` VALUES ('451', '大埔县', '447', '255');
INSERT INTO `ecm_region` VALUES ('452', '丰顺县', '447', '255');
INSERT INTO `ecm_region` VALUES ('453', '五华县', '447', '255');
INSERT INTO `ecm_region` VALUES ('454', '平远县', '447', '255');
INSERT INTO `ecm_region` VALUES ('455', '蕉岭县', '447', '255');
INSERT INTO `ecm_region` VALUES ('456', '清远', '347', '255');
INSERT INTO `ecm_region` VALUES ('457', '清城区', '456', '255');
INSERT INTO `ecm_region` VALUES ('458', '英德市', '456', '255');
INSERT INTO `ecm_region` VALUES ('459', '连州市', '456', '255');
INSERT INTO `ecm_region` VALUES ('460', '佛冈县', '456', '255');
INSERT INTO `ecm_region` VALUES ('461', '阳山县', '456', '255');
INSERT INTO `ecm_region` VALUES ('462', '清新县', '456', '255');
INSERT INTO `ecm_region` VALUES ('463', '连山', '456', '255');
INSERT INTO `ecm_region` VALUES ('464', '连南', '456', '255');
INSERT INTO `ecm_region` VALUES ('465', '汕头', '347', '255');
INSERT INTO `ecm_region` VALUES ('466', '南澳县', '465', '255');
INSERT INTO `ecm_region` VALUES ('467', '潮阳区', '465', '255');
INSERT INTO `ecm_region` VALUES ('468', '澄海区', '465', '255');
INSERT INTO `ecm_region` VALUES ('469', '龙湖区', '465', '255');
INSERT INTO `ecm_region` VALUES ('470', '金平区', '465', '255');
INSERT INTO `ecm_region` VALUES ('471', '濠江区', '465', '255');
INSERT INTO `ecm_region` VALUES ('472', '潮南区', '465', '255');
INSERT INTO `ecm_region` VALUES ('473', '汕尾', '347', '255');
INSERT INTO `ecm_region` VALUES ('474', '城区', '473', '255');
INSERT INTO `ecm_region` VALUES ('475', '陆丰市', '473', '255');
INSERT INTO `ecm_region` VALUES ('476', '海丰县', '473', '255');
INSERT INTO `ecm_region` VALUES ('477', '陆河县', '473', '255');
INSERT INTO `ecm_region` VALUES ('478', '韶关', '347', '255');
INSERT INTO `ecm_region` VALUES ('479', '曲江县', '478', '255');
INSERT INTO `ecm_region` VALUES ('480', '浈江区', '478', '255');
INSERT INTO `ecm_region` VALUES ('481', '武江区', '478', '255');
INSERT INTO `ecm_region` VALUES ('482', '曲江区', '478', '255');
INSERT INTO `ecm_region` VALUES ('483', '乐昌市', '478', '255');
INSERT INTO `ecm_region` VALUES ('484', '南雄市', '478', '255');
INSERT INTO `ecm_region` VALUES ('485', '始兴县', '478', '255');
INSERT INTO `ecm_region` VALUES ('486', '仁化县', '478', '255');
INSERT INTO `ecm_region` VALUES ('487', '翁源县', '478', '255');
INSERT INTO `ecm_region` VALUES ('488', '新丰县', '478', '255');
INSERT INTO `ecm_region` VALUES ('489', '乳源', '478', '255');
INSERT INTO `ecm_region` VALUES ('490', '阳江', '347', '255');
INSERT INTO `ecm_region` VALUES ('491', '江城区', '490', '255');
INSERT INTO `ecm_region` VALUES ('492', '阳春市', '490', '255');
INSERT INTO `ecm_region` VALUES ('493', '阳西县', '490', '255');
INSERT INTO `ecm_region` VALUES ('494', '阳东县', '490', '255');
INSERT INTO `ecm_region` VALUES ('495', '云浮', '347', '255');
INSERT INTO `ecm_region` VALUES ('496', '云城区', '495', '255');
INSERT INTO `ecm_region` VALUES ('497', '罗定市', '495', '255');
INSERT INTO `ecm_region` VALUES ('498', '新兴县', '495', '255');
INSERT INTO `ecm_region` VALUES ('499', '郁南县', '495', '255');
INSERT INTO `ecm_region` VALUES ('500', '云安县', '495', '255');
INSERT INTO `ecm_region` VALUES ('501', '湛江', '347', '255');
INSERT INTO `ecm_region` VALUES ('502', '赤坎区', '501', '255');
INSERT INTO `ecm_region` VALUES ('503', '霞山区', '501', '255');
INSERT INTO `ecm_region` VALUES ('504', '坡头区', '501', '255');
INSERT INTO `ecm_region` VALUES ('505', '麻章区', '501', '255');
INSERT INTO `ecm_region` VALUES ('506', '廉江市', '501', '255');
INSERT INTO `ecm_region` VALUES ('507', '雷州市', '501', '255');
INSERT INTO `ecm_region` VALUES ('508', '吴川市', '501', '255');
INSERT INTO `ecm_region` VALUES ('509', '遂溪县', '501', '255');
INSERT INTO `ecm_region` VALUES ('510', '徐闻县', '501', '255');
INSERT INTO `ecm_region` VALUES ('511', '肇庆', '347', '255');
INSERT INTO `ecm_region` VALUES ('512', '肇庆市', '511', '255');
INSERT INTO `ecm_region` VALUES ('513', '高要市', '511', '255');
INSERT INTO `ecm_region` VALUES ('514', '四会市', '511', '255');
INSERT INTO `ecm_region` VALUES ('515', '广宁县', '511', '255');
INSERT INTO `ecm_region` VALUES ('516', '怀集县', '511', '255');
INSERT INTO `ecm_region` VALUES ('517', '封开县', '511', '255');
INSERT INTO `ecm_region` VALUES ('518', '德庆县', '511', '255');
INSERT INTO `ecm_region` VALUES ('519', '中山', '347', '255');
INSERT INTO `ecm_region` VALUES ('520', '石岐街道', '519', '255');
INSERT INTO `ecm_region` VALUES ('521', '东区街道', '519', '255');
INSERT INTO `ecm_region` VALUES ('522', '西区街道', '519', '255');
INSERT INTO `ecm_region` VALUES ('523', '环城街道', '519', '255');
INSERT INTO `ecm_region` VALUES ('524', '中山港街道', '519', '255');
INSERT INTO `ecm_region` VALUES ('525', '五桂山街道', '519', '255');
INSERT INTO `ecm_region` VALUES ('526', '珠海', '347', '255');
INSERT INTO `ecm_region` VALUES ('527', '香洲区', '526', '255');
INSERT INTO `ecm_region` VALUES ('528', '斗门区', '526', '255');
INSERT INTO `ecm_region` VALUES ('529', '金湾区', '526', '255');
INSERT INTO `ecm_region` VALUES ('530', '广西', '1', '255');
INSERT INTO `ecm_region` VALUES ('531', '南宁', '530', '255');
INSERT INTO `ecm_region` VALUES ('532', '邕宁区', '531', '255');
INSERT INTO `ecm_region` VALUES ('533', '青秀区', '531', '255');
INSERT INTO `ecm_region` VALUES ('534', '兴宁区', '531', '255');
INSERT INTO `ecm_region` VALUES ('535', '良庆区', '531', '255');
INSERT INTO `ecm_region` VALUES ('536', '西乡塘区', '531', '255');
INSERT INTO `ecm_region` VALUES ('537', '江南区', '531', '255');
INSERT INTO `ecm_region` VALUES ('538', '武鸣县', '531', '255');
INSERT INTO `ecm_region` VALUES ('539', '隆安县', '531', '255');
INSERT INTO `ecm_region` VALUES ('540', '马山县', '531', '255');
INSERT INTO `ecm_region` VALUES ('541', '上林县', '531', '255');
INSERT INTO `ecm_region` VALUES ('542', '宾阳县', '531', '255');
INSERT INTO `ecm_region` VALUES ('543', '横县', '531', '255');
INSERT INTO `ecm_region` VALUES ('544', '桂林', '530', '255');
INSERT INTO `ecm_region` VALUES ('545', '秀峰区', '544', '255');
INSERT INTO `ecm_region` VALUES ('546', '叠彩区', '544', '255');
INSERT INTO `ecm_region` VALUES ('547', '象山区', '544', '255');
INSERT INTO `ecm_region` VALUES ('548', '七星区', '544', '255');
INSERT INTO `ecm_region` VALUES ('549', '雁山区', '544', '255');
INSERT INTO `ecm_region` VALUES ('550', '阳朔县', '544', '255');
INSERT INTO `ecm_region` VALUES ('551', '临桂县', '544', '255');
INSERT INTO `ecm_region` VALUES ('552', '灵川县', '544', '255');
INSERT INTO `ecm_region` VALUES ('553', '全州县', '544', '255');
INSERT INTO `ecm_region` VALUES ('554', '平乐县', '544', '255');
INSERT INTO `ecm_region` VALUES ('555', '兴安县', '544', '255');
INSERT INTO `ecm_region` VALUES ('556', '灌阳县', '544', '255');
INSERT INTO `ecm_region` VALUES ('557', '荔浦县', '544', '255');
INSERT INTO `ecm_region` VALUES ('558', '资源县', '544', '255');
INSERT INTO `ecm_region` VALUES ('559', '永福县', '544', '255');
INSERT INTO `ecm_region` VALUES ('560', '龙胜', '544', '255');
INSERT INTO `ecm_region` VALUES ('561', '恭城', '544', '255');
INSERT INTO `ecm_region` VALUES ('562', '百色', '530', '255');
INSERT INTO `ecm_region` VALUES ('563', '右江区', '562', '255');
INSERT INTO `ecm_region` VALUES ('564', '凌云县', '562', '255');
INSERT INTO `ecm_region` VALUES ('565', '平果县', '562', '255');
INSERT INTO `ecm_region` VALUES ('566', '西林县', '562', '255');
INSERT INTO `ecm_region` VALUES ('567', '乐业县', '562', '255');
INSERT INTO `ecm_region` VALUES ('568', '德保县', '562', '255');
INSERT INTO `ecm_region` VALUES ('569', '田林县', '562', '255');
INSERT INTO `ecm_region` VALUES ('570', '田阳县', '562', '255');
INSERT INTO `ecm_region` VALUES ('571', '靖西县', '562', '255');
INSERT INTO `ecm_region` VALUES ('572', '田东县', '562', '255');
INSERT INTO `ecm_region` VALUES ('573', '那坡县', '562', '255');
INSERT INTO `ecm_region` VALUES ('574', '隆林', '562', '255');
INSERT INTO `ecm_region` VALUES ('575', '北海', '530', '255');
INSERT INTO `ecm_region` VALUES ('576', '海城区', '575', '255');
INSERT INTO `ecm_region` VALUES ('577', '银海区', '575', '255');
INSERT INTO `ecm_region` VALUES ('578', '铁山港区', '575', '255');
INSERT INTO `ecm_region` VALUES ('579', '合浦县', '575', '255');
INSERT INTO `ecm_region` VALUES ('580', '崇左', '530', '255');
INSERT INTO `ecm_region` VALUES ('581', '江州区', '580', '255');
INSERT INTO `ecm_region` VALUES ('582', '凭祥市', '580', '255');
INSERT INTO `ecm_region` VALUES ('583', '宁明县', '580', '255');
INSERT INTO `ecm_region` VALUES ('584', '扶绥县', '580', '255');
INSERT INTO `ecm_region` VALUES ('585', '龙州县', '580', '255');
INSERT INTO `ecm_region` VALUES ('586', '大新县', '580', '255');
INSERT INTO `ecm_region` VALUES ('587', '天等县', '580', '255');
INSERT INTO `ecm_region` VALUES ('588', '防城港', '530', '255');
INSERT INTO `ecm_region` VALUES ('589', '港口区', '588', '255');
INSERT INTO `ecm_region` VALUES ('590', '防城区', '588', '255');
INSERT INTO `ecm_region` VALUES ('591', '东兴市', '588', '255');
INSERT INTO `ecm_region` VALUES ('592', '上思县', '588', '255');
INSERT INTO `ecm_region` VALUES ('593', '贵港', '530', '255');
INSERT INTO `ecm_region` VALUES ('594', '港北区', '593', '255');
INSERT INTO `ecm_region` VALUES ('595', '港南区', '593', '255');
INSERT INTO `ecm_region` VALUES ('596', '覃塘区', '593', '255');
INSERT INTO `ecm_region` VALUES ('597', '桂平市', '593', '255');
INSERT INTO `ecm_region` VALUES ('598', '平南县', '593', '255');
INSERT INTO `ecm_region` VALUES ('599', '河池', '530', '255');
INSERT INTO `ecm_region` VALUES ('600', '金城江区', '599', '255');
INSERT INTO `ecm_region` VALUES ('601', '宜州市', '599', '255');
INSERT INTO `ecm_region` VALUES ('602', '天峨县', '599', '255');
INSERT INTO `ecm_region` VALUES ('603', '凤山县', '599', '255');
INSERT INTO `ecm_region` VALUES ('604', '南丹县', '599', '255');
INSERT INTO `ecm_region` VALUES ('605', '东兰县', '599', '255');
INSERT INTO `ecm_region` VALUES ('606', '都安', '599', '255');
INSERT INTO `ecm_region` VALUES ('607', '罗城', '599', '255');
INSERT INTO `ecm_region` VALUES ('608', '巴马', '599', '255');
INSERT INTO `ecm_region` VALUES ('609', '环江', '599', '255');
INSERT INTO `ecm_region` VALUES ('610', '大化', '599', '255');
INSERT INTO `ecm_region` VALUES ('611', '贺州', '530', '255');
INSERT INTO `ecm_region` VALUES ('612', '八步区', '611', '255');
INSERT INTO `ecm_region` VALUES ('613', '钟山县', '611', '255');
INSERT INTO `ecm_region` VALUES ('614', '昭平县', '611', '255');
INSERT INTO `ecm_region` VALUES ('615', '富川', '611', '255');
INSERT INTO `ecm_region` VALUES ('616', '来宾', '530', '255');
INSERT INTO `ecm_region` VALUES ('617', '兴宾区', '616', '255');
INSERT INTO `ecm_region` VALUES ('618', '合山市', '616', '255');
INSERT INTO `ecm_region` VALUES ('619', '象州县', '616', '255');
INSERT INTO `ecm_region` VALUES ('620', '武宣县', '616', '255');
INSERT INTO `ecm_region` VALUES ('621', '忻城县', '616', '255');
INSERT INTO `ecm_region` VALUES ('622', '金秀', '616', '255');
INSERT INTO `ecm_region` VALUES ('623', '柳州', '530', '255');
INSERT INTO `ecm_region` VALUES ('624', '城中区', '623', '255');
INSERT INTO `ecm_region` VALUES ('625', '鱼峰区', '623', '255');
INSERT INTO `ecm_region` VALUES ('626', '柳北区', '623', '255');
INSERT INTO `ecm_region` VALUES ('627', '柳南区', '623', '255');
INSERT INTO `ecm_region` VALUES ('628', '柳江县', '623', '255');
INSERT INTO `ecm_region` VALUES ('629', '柳城县', '623', '255');
INSERT INTO `ecm_region` VALUES ('630', '鹿寨县', '623', '255');
INSERT INTO `ecm_region` VALUES ('631', '融安县', '623', '255');
INSERT INTO `ecm_region` VALUES ('632', '融水', '623', '255');
INSERT INTO `ecm_region` VALUES ('633', '三江', '623', '255');
INSERT INTO `ecm_region` VALUES ('634', '钦州', '530', '255');
INSERT INTO `ecm_region` VALUES ('635', '钦南区', '634', '255');
INSERT INTO `ecm_region` VALUES ('636', '钦北区', '634', '255');
INSERT INTO `ecm_region` VALUES ('637', '灵山县', '634', '255');
INSERT INTO `ecm_region` VALUES ('638', '浦北县', '634', '255');
INSERT INTO `ecm_region` VALUES ('639', '梧州', '530', '255');
INSERT INTO `ecm_region` VALUES ('640', '万秀区', '639', '255');
INSERT INTO `ecm_region` VALUES ('641', '蝶山区', '639', '255');
INSERT INTO `ecm_region` VALUES ('642', '长洲区', '639', '255');
INSERT INTO `ecm_region` VALUES ('643', '岑溪市', '639', '255');
INSERT INTO `ecm_region` VALUES ('644', '苍梧县', '639', '255');
INSERT INTO `ecm_region` VALUES ('645', '藤县', '639', '255');
INSERT INTO `ecm_region` VALUES ('646', '蒙山县', '639', '255');
INSERT INTO `ecm_region` VALUES ('647', '玉林', '530', '255');
INSERT INTO `ecm_region` VALUES ('648', '玉州区', '647', '255');
INSERT INTO `ecm_region` VALUES ('649', '北流市', '647', '255');
INSERT INTO `ecm_region` VALUES ('650', '容县', '647', '255');
INSERT INTO `ecm_region` VALUES ('651', '陆川县', '647', '255');
INSERT INTO `ecm_region` VALUES ('652', '博白县', '647', '255');
INSERT INTO `ecm_region` VALUES ('653', '兴业县', '647', '255');
INSERT INTO `ecm_region` VALUES ('654', '贵州', '1', '255');
INSERT INTO `ecm_region` VALUES ('655', '贵阳', '654', '255');
INSERT INTO `ecm_region` VALUES ('656', '南明区', '655', '255');
INSERT INTO `ecm_region` VALUES ('657', '云岩区', '655', '255');
INSERT INTO `ecm_region` VALUES ('658', '花溪区', '655', '255');
INSERT INTO `ecm_region` VALUES ('659', '乌当区', '655', '255');
INSERT INTO `ecm_region` VALUES ('660', '白云区', '655', '255');
INSERT INTO `ecm_region` VALUES ('661', '小河区', '655', '255');
INSERT INTO `ecm_region` VALUES ('662', '金阳新区', '655', '255');
INSERT INTO `ecm_region` VALUES ('663', '新天园区', '655', '255');
INSERT INTO `ecm_region` VALUES ('664', '清镇市', '655', '255');
INSERT INTO `ecm_region` VALUES ('665', '开阳县', '655', '255');
INSERT INTO `ecm_region` VALUES ('666', '修文县', '655', '255');
INSERT INTO `ecm_region` VALUES ('667', '息烽县', '655', '255');
INSERT INTO `ecm_region` VALUES ('668', '安顺', '654', '255');
INSERT INTO `ecm_region` VALUES ('669', '西秀区', '668', '255');
INSERT INTO `ecm_region` VALUES ('670', '关岭', '668', '255');
INSERT INTO `ecm_region` VALUES ('671', '镇宁', '668', '255');
INSERT INTO `ecm_region` VALUES ('672', '紫云', '668', '255');
INSERT INTO `ecm_region` VALUES ('673', '平坝县', '668', '255');
INSERT INTO `ecm_region` VALUES ('674', '普定县', '668', '255');
INSERT INTO `ecm_region` VALUES ('675', '毕节', '654', '255');
INSERT INTO `ecm_region` VALUES ('676', '毕节市', '675', '255');
INSERT INTO `ecm_region` VALUES ('677', '大方县', '675', '255');
INSERT INTO `ecm_region` VALUES ('678', '黔西县', '675', '255');
INSERT INTO `ecm_region` VALUES ('679', '金沙县', '675', '255');
INSERT INTO `ecm_region` VALUES ('680', '织金县', '675', '255');
INSERT INTO `ecm_region` VALUES ('681', '纳雍县', '675', '255');
INSERT INTO `ecm_region` VALUES ('682', '赫章县', '675', '255');
INSERT INTO `ecm_region` VALUES ('683', '威宁', '675', '255');
INSERT INTO `ecm_region` VALUES ('684', '六盘水', '654', '255');
INSERT INTO `ecm_region` VALUES ('685', '钟山区', '684', '255');
INSERT INTO `ecm_region` VALUES ('686', '六枝特区', '684', '255');
INSERT INTO `ecm_region` VALUES ('687', '水城县', '684', '255');
INSERT INTO `ecm_region` VALUES ('688', '盘县', '684', '255');
INSERT INTO `ecm_region` VALUES ('689', '黔东南', '654', '255');
INSERT INTO `ecm_region` VALUES ('690', '凯里市', '689', '255');
INSERT INTO `ecm_region` VALUES ('691', '黄平县', '689', '255');
INSERT INTO `ecm_region` VALUES ('692', '施秉县', '689', '255');
INSERT INTO `ecm_region` VALUES ('693', '三穗县', '689', '255');
INSERT INTO `ecm_region` VALUES ('694', '镇远县', '689', '255');
INSERT INTO `ecm_region` VALUES ('695', '岑巩县', '689', '255');
INSERT INTO `ecm_region` VALUES ('696', '天柱县', '689', '255');
INSERT INTO `ecm_region` VALUES ('697', '锦屏县', '689', '255');
INSERT INTO `ecm_region` VALUES ('698', '剑河县', '689', '255');
INSERT INTO `ecm_region` VALUES ('699', '台江县', '689', '255');
INSERT INTO `ecm_region` VALUES ('700', '黎平县', '689', '255');
INSERT INTO `ecm_region` VALUES ('701', '榕江县', '689', '255');
INSERT INTO `ecm_region` VALUES ('702', '从江县', '689', '255');
INSERT INTO `ecm_region` VALUES ('703', '雷山县', '689', '255');
INSERT INTO `ecm_region` VALUES ('704', '麻江县', '689', '255');
INSERT INTO `ecm_region` VALUES ('705', '丹寨县', '689', '255');
INSERT INTO `ecm_region` VALUES ('706', '黔南', '654', '255');
INSERT INTO `ecm_region` VALUES ('707', '都匀市', '706', '255');
INSERT INTO `ecm_region` VALUES ('708', '福泉市', '706', '255');
INSERT INTO `ecm_region` VALUES ('709', '荔波县', '706', '255');
INSERT INTO `ecm_region` VALUES ('710', '贵定县', '706', '255');
INSERT INTO `ecm_region` VALUES ('711', '瓮安县', '706', '255');
INSERT INTO `ecm_region` VALUES ('712', '独山县', '706', '255');
INSERT INTO `ecm_region` VALUES ('713', '平塘县', '706', '255');
INSERT INTO `ecm_region` VALUES ('714', '罗甸县', '706', '255');
INSERT INTO `ecm_region` VALUES ('715', '长顺县', '706', '255');
INSERT INTO `ecm_region` VALUES ('716', '龙里县', '706', '255');
INSERT INTO `ecm_region` VALUES ('717', '惠水县', '706', '255');
INSERT INTO `ecm_region` VALUES ('718', '三都', '706', '255');
INSERT INTO `ecm_region` VALUES ('719', '黔西南', '654', '255');
INSERT INTO `ecm_region` VALUES ('720', '兴义市', '719', '255');
INSERT INTO `ecm_region` VALUES ('721', '兴仁县', '719', '255');
INSERT INTO `ecm_region` VALUES ('722', '普安县', '719', '255');
INSERT INTO `ecm_region` VALUES ('723', '晴隆县', '719', '255');
INSERT INTO `ecm_region` VALUES ('724', '贞丰县', '719', '255');
INSERT INTO `ecm_region` VALUES ('725', '望谟县', '719', '255');
INSERT INTO `ecm_region` VALUES ('726', '册亨县', '719', '255');
INSERT INTO `ecm_region` VALUES ('727', '安龙县', '719', '255');
INSERT INTO `ecm_region` VALUES ('728', '铜仁', '654', '255');
INSERT INTO `ecm_region` VALUES ('729', '铜仁市', '728', '255');
INSERT INTO `ecm_region` VALUES ('730', '江口县', '728', '255');
INSERT INTO `ecm_region` VALUES ('731', '石阡县', '728', '255');
INSERT INTO `ecm_region` VALUES ('732', '思南县', '728', '255');
INSERT INTO `ecm_region` VALUES ('733', '德江县', '728', '255');
INSERT INTO `ecm_region` VALUES ('734', '玉屏', '728', '255');
INSERT INTO `ecm_region` VALUES ('735', '印江', '728', '255');
INSERT INTO `ecm_region` VALUES ('736', '沿河', '728', '255');
INSERT INTO `ecm_region` VALUES ('737', '松桃', '728', '255');
INSERT INTO `ecm_region` VALUES ('738', '万山特区', '728', '255');
INSERT INTO `ecm_region` VALUES ('739', '遵义', '654', '255');
INSERT INTO `ecm_region` VALUES ('740', '红花岗区', '739', '255');
INSERT INTO `ecm_region` VALUES ('741', '务川县', '739', '255');
INSERT INTO `ecm_region` VALUES ('742', '道真县', '739', '255');
INSERT INTO `ecm_region` VALUES ('743', '汇川区', '739', '255');
INSERT INTO `ecm_region` VALUES ('744', '赤水市', '739', '255');
INSERT INTO `ecm_region` VALUES ('745', '仁怀市', '739', '255');
INSERT INTO `ecm_region` VALUES ('746', '遵义县', '739', '255');
INSERT INTO `ecm_region` VALUES ('747', '桐梓县', '739', '255');
INSERT INTO `ecm_region` VALUES ('748', '绥阳县', '739', '255');
INSERT INTO `ecm_region` VALUES ('749', '正安县', '739', '255');
INSERT INTO `ecm_region` VALUES ('750', '凤冈县', '739', '255');
INSERT INTO `ecm_region` VALUES ('751', '湄潭县', '739', '255');
INSERT INTO `ecm_region` VALUES ('752', '余庆县', '739', '255');
INSERT INTO `ecm_region` VALUES ('753', '习水县', '739', '255');
INSERT INTO `ecm_region` VALUES ('754', '道真', '739', '255');
INSERT INTO `ecm_region` VALUES ('755', '务川', '739', '255');
INSERT INTO `ecm_region` VALUES ('756', '海南', '1', '255');
INSERT INTO `ecm_region` VALUES ('757', '海口', '756', '255');
INSERT INTO `ecm_region` VALUES ('758', '秀英区', '757', '255');
INSERT INTO `ecm_region` VALUES ('759', '龙华区', '757', '255');
INSERT INTO `ecm_region` VALUES ('760', '琼山区', '757', '255');
INSERT INTO `ecm_region` VALUES ('761', '美兰区', '757', '255');
INSERT INTO `ecm_region` VALUES ('762', '三亚', '756', '255');
INSERT INTO `ecm_region` VALUES ('763', '白沙', '756', '255');
INSERT INTO `ecm_region` VALUES ('764', '保亭', '756', '255');
INSERT INTO `ecm_region` VALUES ('765', '昌江', '756', '255');
INSERT INTO `ecm_region` VALUES ('766', '澄迈县', '756', '255');
INSERT INTO `ecm_region` VALUES ('767', '定安县', '756', '255');
INSERT INTO `ecm_region` VALUES ('768', '东方', '756', '255');
INSERT INTO `ecm_region` VALUES ('769', '乐东', '756', '255');
INSERT INTO `ecm_region` VALUES ('770', '临高县', '756', '255');
INSERT INTO `ecm_region` VALUES ('771', '陵水', '756', '255');
INSERT INTO `ecm_region` VALUES ('772', '琼海', '756', '255');
INSERT INTO `ecm_region` VALUES ('773', '琼中', '756', '255');
INSERT INTO `ecm_region` VALUES ('774', '屯昌县', '756', '255');
INSERT INTO `ecm_region` VALUES ('775', '万宁', '756', '255');
INSERT INTO `ecm_region` VALUES ('776', '文昌', '756', '255');
INSERT INTO `ecm_region` VALUES ('777', '五指山', '756', '255');
INSERT INTO `ecm_region` VALUES ('778', '儋州', '756', '255');
INSERT INTO `ecm_region` VALUES ('779', '市区', '778', '255');
INSERT INTO `ecm_region` VALUES ('780', '洋浦开发区', '778', '255');
INSERT INTO `ecm_region` VALUES ('781', '那大镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('782', '王五镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('783', '雅星镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('784', '大成镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('785', '中和镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('786', '峨蔓镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('787', '南丰镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('788', '白马井镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('789', '兰洋镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('790', '和庆镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('791', '海头镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('792', '排浦镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('793', '东成镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('794', '光村镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('795', '木棠镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('796', '新州镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('797', '三都镇', '778', '255');
INSERT INTO `ecm_region` VALUES ('798', '其他', '778', '255');
INSERT INTO `ecm_region` VALUES ('799', '河北', '1', '255');
INSERT INTO `ecm_region` VALUES ('800', '石家庄', '799', '255');
INSERT INTO `ecm_region` VALUES ('801', '长安区', '800', '255');
INSERT INTO `ecm_region` VALUES ('802', '桥东区', '800', '255');
INSERT INTO `ecm_region` VALUES ('803', '桥西区', '800', '255');
INSERT INTO `ecm_region` VALUES ('804', '新华区', '800', '255');
INSERT INTO `ecm_region` VALUES ('805', '裕华区', '800', '255');
INSERT INTO `ecm_region` VALUES ('806', '井陉矿区', '800', '255');
INSERT INTO `ecm_region` VALUES ('807', '高新区', '800', '255');
INSERT INTO `ecm_region` VALUES ('808', '辛集市', '800', '255');
INSERT INTO `ecm_region` VALUES ('809', '藁城市', '800', '255');
INSERT INTO `ecm_region` VALUES ('810', '晋州市', '800', '255');
INSERT INTO `ecm_region` VALUES ('811', '新乐市', '800', '255');
INSERT INTO `ecm_region` VALUES ('812', '鹿泉市', '800', '255');
INSERT INTO `ecm_region` VALUES ('813', '井陉县', '800', '255');
INSERT INTO `ecm_region` VALUES ('814', '正定县', '800', '255');
INSERT INTO `ecm_region` VALUES ('815', '栾城县', '800', '255');
INSERT INTO `ecm_region` VALUES ('816', '行唐县', '800', '255');
INSERT INTO `ecm_region` VALUES ('817', '灵寿县', '800', '255');
INSERT INTO `ecm_region` VALUES ('818', '高邑县', '800', '255');
INSERT INTO `ecm_region` VALUES ('819', '深泽县', '800', '255');
INSERT INTO `ecm_region` VALUES ('820', '赞皇县', '800', '255');
INSERT INTO `ecm_region` VALUES ('821', '无极县', '800', '255');
INSERT INTO `ecm_region` VALUES ('822', '平山县', '800', '255');
INSERT INTO `ecm_region` VALUES ('823', '元氏县', '800', '255');
INSERT INTO `ecm_region` VALUES ('824', '赵县', '800', '255');
INSERT INTO `ecm_region` VALUES ('825', '保定', '799', '255');
INSERT INTO `ecm_region` VALUES ('826', '新市区', '825', '255');
INSERT INTO `ecm_region` VALUES ('827', '南市区', '825', '255');
INSERT INTO `ecm_region` VALUES ('828', '北市区', '825', '255');
INSERT INTO `ecm_region` VALUES ('829', '涿州市', '825', '255');
INSERT INTO `ecm_region` VALUES ('830', '定州市', '825', '255');
INSERT INTO `ecm_region` VALUES ('831', '安国市', '825', '255');
INSERT INTO `ecm_region` VALUES ('832', '高碑店市', '825', '255');
INSERT INTO `ecm_region` VALUES ('833', '满城县', '825', '255');
INSERT INTO `ecm_region` VALUES ('834', '清苑县', '825', '255');
INSERT INTO `ecm_region` VALUES ('835', '涞水县', '825', '255');
INSERT INTO `ecm_region` VALUES ('836', '阜平县', '825', '255');
INSERT INTO `ecm_region` VALUES ('837', '徐水县', '825', '255');
INSERT INTO `ecm_region` VALUES ('838', '定兴县', '825', '255');
INSERT INTO `ecm_region` VALUES ('839', '唐县', '825', '255');
INSERT INTO `ecm_region` VALUES ('840', '高阳县', '825', '255');
INSERT INTO `ecm_region` VALUES ('841', '容城县', '825', '255');
INSERT INTO `ecm_region` VALUES ('842', '涞源县', '825', '255');
INSERT INTO `ecm_region` VALUES ('843', '望都县', '825', '255');
INSERT INTO `ecm_region` VALUES ('844', '安新县', '825', '255');
INSERT INTO `ecm_region` VALUES ('845', '易县', '825', '255');
INSERT INTO `ecm_region` VALUES ('846', '曲阳县', '825', '255');
INSERT INTO `ecm_region` VALUES ('847', '蠡县', '825', '255');
INSERT INTO `ecm_region` VALUES ('848', '顺平县', '825', '255');
INSERT INTO `ecm_region` VALUES ('849', '博野县', '825', '255');
INSERT INTO `ecm_region` VALUES ('850', '雄县', '825', '255');
INSERT INTO `ecm_region` VALUES ('851', '沧州', '799', '255');
INSERT INTO `ecm_region` VALUES ('852', '运河区', '851', '255');
INSERT INTO `ecm_region` VALUES ('853', '新华区', '851', '255');
INSERT INTO `ecm_region` VALUES ('854', '泊头市', '851', '255');
INSERT INTO `ecm_region` VALUES ('855', '任丘市', '851', '255');
INSERT INTO `ecm_region` VALUES ('856', '黄骅市', '851', '255');
INSERT INTO `ecm_region` VALUES ('857', '河间市', '851', '255');
INSERT INTO `ecm_region` VALUES ('858', '沧县', '851', '255');
INSERT INTO `ecm_region` VALUES ('859', '青县', '851', '255');
INSERT INTO `ecm_region` VALUES ('860', '东光县', '851', '255');
INSERT INTO `ecm_region` VALUES ('861', '海兴县', '851', '255');
INSERT INTO `ecm_region` VALUES ('862', '盐山县', '851', '255');
INSERT INTO `ecm_region` VALUES ('863', '肃宁县', '851', '255');
INSERT INTO `ecm_region` VALUES ('864', '南皮县', '851', '255');
INSERT INTO `ecm_region` VALUES ('865', '吴桥县', '851', '255');
INSERT INTO `ecm_region` VALUES ('866', '献县', '851', '255');
INSERT INTO `ecm_region` VALUES ('867', '孟村', '851', '255');
INSERT INTO `ecm_region` VALUES ('868', '承德', '799', '255');
INSERT INTO `ecm_region` VALUES ('869', '双桥区', '868', '255');
INSERT INTO `ecm_region` VALUES ('870', '双滦区', '868', '255');
INSERT INTO `ecm_region` VALUES ('871', '鹰手营子矿区', '868', '255');
INSERT INTO `ecm_region` VALUES ('872', '承德县', '868', '255');
INSERT INTO `ecm_region` VALUES ('873', '兴隆县', '868', '255');
INSERT INTO `ecm_region` VALUES ('874', '平泉县', '868', '255');
INSERT INTO `ecm_region` VALUES ('875', '滦平县', '868', '255');
INSERT INTO `ecm_region` VALUES ('876', '隆化县', '868', '255');
INSERT INTO `ecm_region` VALUES ('877', '丰宁', '868', '255');
INSERT INTO `ecm_region` VALUES ('878', '宽城', '868', '255');
INSERT INTO `ecm_region` VALUES ('879', '围场', '868', '255');
INSERT INTO `ecm_region` VALUES ('880', '邯郸', '799', '255');
INSERT INTO `ecm_region` VALUES ('881', '从台区', '880', '255');
INSERT INTO `ecm_region` VALUES ('882', '复兴区', '880', '255');
INSERT INTO `ecm_region` VALUES ('883', '邯山区', '880', '255');
INSERT INTO `ecm_region` VALUES ('884', '峰峰矿区', '880', '255');
INSERT INTO `ecm_region` VALUES ('885', '武安市', '880', '255');
INSERT INTO `ecm_region` VALUES ('886', '邯郸县', '880', '255');
INSERT INTO `ecm_region` VALUES ('887', '临漳县', '880', '255');
INSERT INTO `ecm_region` VALUES ('888', '成安县', '880', '255');
INSERT INTO `ecm_region` VALUES ('889', '大名县', '880', '255');
INSERT INTO `ecm_region` VALUES ('890', '涉县', '880', '255');
INSERT INTO `ecm_region` VALUES ('891', '磁县', '880', '255');
INSERT INTO `ecm_region` VALUES ('892', '肥乡县', '880', '255');
INSERT INTO `ecm_region` VALUES ('893', '永年县', '880', '255');
INSERT INTO `ecm_region` VALUES ('894', '邱县', '880', '255');
INSERT INTO `ecm_region` VALUES ('895', '鸡泽县', '880', '255');
INSERT INTO `ecm_region` VALUES ('896', '广平县', '880', '255');
INSERT INTO `ecm_region` VALUES ('897', '馆陶县', '880', '255');
INSERT INTO `ecm_region` VALUES ('898', '魏县', '880', '255');
INSERT INTO `ecm_region` VALUES ('899', '曲周县', '880', '255');
INSERT INTO `ecm_region` VALUES ('900', '衡水', '799', '255');
INSERT INTO `ecm_region` VALUES ('901', '桃城区', '900', '255');
INSERT INTO `ecm_region` VALUES ('902', '冀州市', '900', '255');
INSERT INTO `ecm_region` VALUES ('903', '深州市', '900', '255');
INSERT INTO `ecm_region` VALUES ('904', '枣强县', '900', '255');
INSERT INTO `ecm_region` VALUES ('905', '武邑县', '900', '255');
INSERT INTO `ecm_region` VALUES ('906', '武强县', '900', '255');
INSERT INTO `ecm_region` VALUES ('907', '饶阳县', '900', '255');
INSERT INTO `ecm_region` VALUES ('908', '安平县', '900', '255');
INSERT INTO `ecm_region` VALUES ('909', '故城县', '900', '255');
INSERT INTO `ecm_region` VALUES ('910', '景县', '900', '255');
INSERT INTO `ecm_region` VALUES ('911', '阜城县', '900', '255');
INSERT INTO `ecm_region` VALUES ('912', '廊坊', '799', '255');
INSERT INTO `ecm_region` VALUES ('913', '安次区', '912', '255');
INSERT INTO `ecm_region` VALUES ('914', '广阳区', '912', '255');
INSERT INTO `ecm_region` VALUES ('915', '霸州市', '912', '255');
INSERT INTO `ecm_region` VALUES ('916', '三河市', '912', '255');
INSERT INTO `ecm_region` VALUES ('917', '固安县', '912', '255');
INSERT INTO `ecm_region` VALUES ('918', '永清县', '912', '255');
INSERT INTO `ecm_region` VALUES ('919', '香河县', '912', '255');
INSERT INTO `ecm_region` VALUES ('920', '大城县', '912', '255');
INSERT INTO `ecm_region` VALUES ('921', '文安县', '912', '255');
INSERT INTO `ecm_region` VALUES ('922', '大厂', '912', '255');
INSERT INTO `ecm_region` VALUES ('923', '秦皇岛', '799', '255');
INSERT INTO `ecm_region` VALUES ('924', '海港区', '923', '255');
INSERT INTO `ecm_region` VALUES ('925', '山海关区', '923', '255');
INSERT INTO `ecm_region` VALUES ('926', '北戴河区', '923', '255');
INSERT INTO `ecm_region` VALUES ('927', '昌黎县', '923', '255');
INSERT INTO `ecm_region` VALUES ('928', '抚宁县', '923', '255');
INSERT INTO `ecm_region` VALUES ('929', '卢龙县', '923', '255');
INSERT INTO `ecm_region` VALUES ('930', '青龙', '923', '255');
INSERT INTO `ecm_region` VALUES ('931', '唐山', '799', '255');
INSERT INTO `ecm_region` VALUES ('932', '路北区', '931', '255');
INSERT INTO `ecm_region` VALUES ('933', '路南区', '931', '255');
INSERT INTO `ecm_region` VALUES ('934', '古冶区', '931', '255');
INSERT INTO `ecm_region` VALUES ('935', '开平区', '931', '255');
INSERT INTO `ecm_region` VALUES ('936', '丰南区', '931', '255');
INSERT INTO `ecm_region` VALUES ('937', '丰润区', '931', '255');
INSERT INTO `ecm_region` VALUES ('938', '遵化市', '931', '255');
INSERT INTO `ecm_region` VALUES ('939', '迁安市', '931', '255');
INSERT INTO `ecm_region` VALUES ('940', '滦县', '931', '255');
INSERT INTO `ecm_region` VALUES ('941', '滦南县', '931', '255');
INSERT INTO `ecm_region` VALUES ('942', '乐亭县', '931', '255');
INSERT INTO `ecm_region` VALUES ('943', '迁西县', '931', '255');
INSERT INTO `ecm_region` VALUES ('944', '玉田县', '931', '255');
INSERT INTO `ecm_region` VALUES ('945', '唐海县', '931', '255');
INSERT INTO `ecm_region` VALUES ('946', '邢台', '799', '255');
INSERT INTO `ecm_region` VALUES ('947', '桥东区', '946', '255');
INSERT INTO `ecm_region` VALUES ('948', '桥西区', '946', '255');
INSERT INTO `ecm_region` VALUES ('949', '南宫市', '946', '255');
INSERT INTO `ecm_region` VALUES ('950', '沙河市', '946', '255');
INSERT INTO `ecm_region` VALUES ('951', '邢台县', '946', '255');
INSERT INTO `ecm_region` VALUES ('952', '临城县', '946', '255');
INSERT INTO `ecm_region` VALUES ('953', '内丘县', '946', '255');
INSERT INTO `ecm_region` VALUES ('954', '柏乡县', '946', '255');
INSERT INTO `ecm_region` VALUES ('955', '隆尧县', '946', '255');
INSERT INTO `ecm_region` VALUES ('956', '任县', '946', '255');
INSERT INTO `ecm_region` VALUES ('957', '南和县', '946', '255');
INSERT INTO `ecm_region` VALUES ('958', '宁晋县', '946', '255');
INSERT INTO `ecm_region` VALUES ('959', '巨鹿县', '946', '255');
INSERT INTO `ecm_region` VALUES ('960', '新河县', '946', '255');
INSERT INTO `ecm_region` VALUES ('961', '广宗县', '946', '255');
INSERT INTO `ecm_region` VALUES ('962', '平乡县', '946', '255');
INSERT INTO `ecm_region` VALUES ('963', '威县', '946', '255');
INSERT INTO `ecm_region` VALUES ('964', '清河县', '946', '255');
INSERT INTO `ecm_region` VALUES ('965', '临西县', '946', '255');
INSERT INTO `ecm_region` VALUES ('966', '张家口', '799', '255');
INSERT INTO `ecm_region` VALUES ('967', '桥西区', '966', '255');
INSERT INTO `ecm_region` VALUES ('968', '桥东区', '966', '255');
INSERT INTO `ecm_region` VALUES ('969', '宣化区', '966', '255');
INSERT INTO `ecm_region` VALUES ('970', '下花园区', '966', '255');
INSERT INTO `ecm_region` VALUES ('971', '宣化县', '966', '255');
INSERT INTO `ecm_region` VALUES ('972', '张北县', '966', '255');
INSERT INTO `ecm_region` VALUES ('973', '康保县', '966', '255');
INSERT INTO `ecm_region` VALUES ('974', '沽源县', '966', '255');
INSERT INTO `ecm_region` VALUES ('975', '尚义县', '966', '255');
INSERT INTO `ecm_region` VALUES ('976', '蔚县', '966', '255');
INSERT INTO `ecm_region` VALUES ('977', '阳原县', '966', '255');
INSERT INTO `ecm_region` VALUES ('978', '怀安县', '966', '255');
INSERT INTO `ecm_region` VALUES ('979', '万全县', '966', '255');
INSERT INTO `ecm_region` VALUES ('980', '怀来县', '966', '255');
INSERT INTO `ecm_region` VALUES ('981', '涿鹿县', '966', '255');
INSERT INTO `ecm_region` VALUES ('982', '赤城县', '966', '255');
INSERT INTO `ecm_region` VALUES ('983', '崇礼县', '966', '255');
INSERT INTO `ecm_region` VALUES ('984', '河南', '1', '255');
INSERT INTO `ecm_region` VALUES ('985', '郑州', '984', '255');
INSERT INTO `ecm_region` VALUES ('986', '金水区', '985', '255');
INSERT INTO `ecm_region` VALUES ('987', '邙山区', '985', '255');
INSERT INTO `ecm_region` VALUES ('988', '二七区', '985', '255');
INSERT INTO `ecm_region` VALUES ('989', '管城区', '985', '255');
INSERT INTO `ecm_region` VALUES ('990', '中原区', '985', '255');
INSERT INTO `ecm_region` VALUES ('991', '上街区', '985', '255');
INSERT INTO `ecm_region` VALUES ('992', '惠济区', '985', '255');
INSERT INTO `ecm_region` VALUES ('993', '郑东新区', '985', '255');
INSERT INTO `ecm_region` VALUES ('994', '经济技术开发区', '985', '255');
INSERT INTO `ecm_region` VALUES ('995', '高新开发区', '985', '255');
INSERT INTO `ecm_region` VALUES ('996', '出口加工区', '985', '255');
INSERT INTO `ecm_region` VALUES ('997', '巩义市', '985', '255');
INSERT INTO `ecm_region` VALUES ('998', '荥阳市', '985', '255');
INSERT INTO `ecm_region` VALUES ('999', '新密市', '985', '255');
INSERT INTO `ecm_region` VALUES ('1000', '新郑市', '985', '255');
INSERT INTO `ecm_region` VALUES ('1001', '登封市', '985', '255');
INSERT INTO `ecm_region` VALUES ('1002', '中牟县', '985', '255');
INSERT INTO `ecm_region` VALUES ('1003', '洛阳', '984', '255');
INSERT INTO `ecm_region` VALUES ('1004', '西工区', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1005', '老城区', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1006', '涧西区', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1007', '瀍河回族区', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1008', '洛龙区', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1009', '吉利区', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1010', '偃师市', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1011', '孟津县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1012', '新安县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1013', '栾川县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1014', '嵩县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1015', '汝阳县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1016', '宜阳县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1017', '洛宁县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1018', '伊川县', '1003', '255');
INSERT INTO `ecm_region` VALUES ('1019', '开封', '984', '255');
INSERT INTO `ecm_region` VALUES ('1020', '鼓楼区', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1021', '龙亭区', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1022', '顺河回族区', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1023', '金明区', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1024', '禹王台区', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1025', '杞县', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1026', '通许县', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1027', '尉氏县', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1028', '开封县', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1029', '兰考县', '1019', '255');
INSERT INTO `ecm_region` VALUES ('1030', '安阳', '984', '255');
INSERT INTO `ecm_region` VALUES ('1031', '北关区', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1032', '文峰区', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1033', '殷都区', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1034', '龙安区', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1035', '林州市', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1036', '安阳县', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1037', '汤阴县', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1038', '滑县', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1039', '内黄县', '1030', '255');
INSERT INTO `ecm_region` VALUES ('1040', '鹤壁', '984', '255');
INSERT INTO `ecm_region` VALUES ('1041', '淇滨区', '1040', '255');
INSERT INTO `ecm_region` VALUES ('1042', '山城区', '1040', '255');
INSERT INTO `ecm_region` VALUES ('1043', '鹤山区', '1040', '255');
INSERT INTO `ecm_region` VALUES ('1044', '浚县', '1040', '255');
INSERT INTO `ecm_region` VALUES ('1045', '淇县', '1040', '255');
INSERT INTO `ecm_region` VALUES ('1046', '济源', '984', '255');
INSERT INTO `ecm_region` VALUES ('1047', '济源市', '1046', '255');
INSERT INTO `ecm_region` VALUES ('1048', '焦作', '984', '255');
INSERT INTO `ecm_region` VALUES ('1049', '解放区', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1050', '中站区', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1051', '马村区', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1052', '山阳区', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1053', '沁阳市', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1054', '孟州市', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1055', '修武县', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1056', '博爱县', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1057', '武陟县', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1058', '温县', '1048', '255');
INSERT INTO `ecm_region` VALUES ('1059', '南阳', '984', '255');
INSERT INTO `ecm_region` VALUES ('1060', '卧龙区', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1061', '宛城区', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1062', '邓州市', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1063', '南召县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1064', '方城县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1065', '西峡县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1066', '镇平县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1067', '内乡县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1068', '淅川县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1069', '社旗县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1070', '唐河县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1071', '新野县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1072', '桐柏县', '1059', '255');
INSERT INTO `ecm_region` VALUES ('1073', '平顶山', '984', '255');
INSERT INTO `ecm_region` VALUES ('1074', '新华区', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1075', '卫东区', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1076', '湛河区', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1077', '石龙区', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1078', '舞钢市', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1079', '汝州市', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1080', '宝丰县', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1081', '叶县', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1082', '鲁山县', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1083', '郏县', '1073', '255');
INSERT INTO `ecm_region` VALUES ('1084', '三门峡', '984', '255');
INSERT INTO `ecm_region` VALUES ('1085', '湖滨区', '1084', '255');
INSERT INTO `ecm_region` VALUES ('1086', '义马市', '1084', '255');
INSERT INTO `ecm_region` VALUES ('1087', '灵宝市', '1084', '255');
INSERT INTO `ecm_region` VALUES ('1088', '渑池县', '1084', '255');
INSERT INTO `ecm_region` VALUES ('1089', '陕县', '1084', '255');
INSERT INTO `ecm_region` VALUES ('1090', '卢氏县', '1084', '255');
INSERT INTO `ecm_region` VALUES ('1091', '商丘', '984', '255');
INSERT INTO `ecm_region` VALUES ('1092', '梁园区', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1093', '睢阳区', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1094', '永城市', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1095', '民权县', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1096', '睢县', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1097', '宁陵县', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1098', '虞城县', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1099', '柘城县', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1100', '夏邑县', '1091', '255');
INSERT INTO `ecm_region` VALUES ('1101', '新乡', '984', '255');
INSERT INTO `ecm_region` VALUES ('1102', '卫滨区', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1103', '红旗区', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1104', '凤泉区', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1105', '牧野区', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1106', '卫辉市', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1107', '辉县市', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1108', '新乡县', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1109', '获嘉县', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1110', '原阳县', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1111', '延津县', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1112', '封丘县', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1113', '长垣县', '1101', '255');
INSERT INTO `ecm_region` VALUES ('1114', '信阳', '984', '255');
INSERT INTO `ecm_region` VALUES ('1115', '浉河区', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1116', '平桥区', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1117', '罗山县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1118', '光山县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1119', '新县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1120', '商城县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1121', '固始县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1122', '潢川县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1123', '淮滨县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1124', '息县', '1114', '255');
INSERT INTO `ecm_region` VALUES ('1125', '许昌', '984', '255');
INSERT INTO `ecm_region` VALUES ('1126', '魏都区', '1125', '255');
INSERT INTO `ecm_region` VALUES ('1127', '禹州市', '1125', '255');
INSERT INTO `ecm_region` VALUES ('1128', '长葛市', '1125', '255');
INSERT INTO `ecm_region` VALUES ('1129', '许昌县', '1125', '255');
INSERT INTO `ecm_region` VALUES ('1130', '鄢陵县', '1125', '255');
INSERT INTO `ecm_region` VALUES ('1131', '襄城县', '1125', '255');
INSERT INTO `ecm_region` VALUES ('1132', '周口', '984', '255');
INSERT INTO `ecm_region` VALUES ('1133', '川汇区', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1134', '项城市', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1135', '扶沟县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1136', '西华县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1137', '商水县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1138', '沈丘县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1139', '郸城县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1140', '淮阳县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1141', '太康县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1142', '鹿邑县', '1132', '255');
INSERT INTO `ecm_region` VALUES ('1143', '驻马店', '984', '255');
INSERT INTO `ecm_region` VALUES ('1144', '驿城区', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1145', '西平县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1146', '上蔡县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1147', '平舆县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1148', '正阳县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1149', '确山县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1150', '泌阳县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1151', '汝南县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1152', '遂平县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1153', '新蔡县', '1143', '255');
INSERT INTO `ecm_region` VALUES ('1154', '漯河', '984', '255');
INSERT INTO `ecm_region` VALUES ('1155', '郾城区', '1154', '255');
INSERT INTO `ecm_region` VALUES ('1156', '源汇区', '1154', '255');
INSERT INTO `ecm_region` VALUES ('1157', '召陵区', '1154', '255');
INSERT INTO `ecm_region` VALUES ('1158', '舞阳县', '1154', '255');
INSERT INTO `ecm_region` VALUES ('1159', '临颍县', '1154', '255');
INSERT INTO `ecm_region` VALUES ('1160', '濮阳', '984', '255');
INSERT INTO `ecm_region` VALUES ('1161', '华龙区', '1160', '255');
INSERT INTO `ecm_region` VALUES ('1162', '清丰县', '1160', '255');
INSERT INTO `ecm_region` VALUES ('1163', '南乐县', '1160', '255');
INSERT INTO `ecm_region` VALUES ('1164', '范县', '1160', '255');
INSERT INTO `ecm_region` VALUES ('1165', '台前县', '1160', '255');
INSERT INTO `ecm_region` VALUES ('1166', '濮阳县', '1160', '255');
INSERT INTO `ecm_region` VALUES ('1167', '黑龙江', '1', '255');
INSERT INTO `ecm_region` VALUES ('1168', '哈尔滨', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1169', '道里区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1170', '南岗区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1171', '动力区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1172', '平房区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1173', '香坊区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1174', '太平区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1175', '道外区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1176', '阿城区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1177', '呼兰区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1178', '松北区', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1179', '尚志市', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1180', '双城市', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1181', '五常市', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1182', '方正县', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1183', '宾县', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1184', '依兰县', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1185', '巴彦县', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1186', '通河县', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1187', '木兰县', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1188', '延寿县', '1168', '255');
INSERT INTO `ecm_region` VALUES ('1189', '大庆', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1190', '萨尔图区', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1191', '红岗区', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1192', '龙凤区', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1193', '让胡路区', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1194', '大同区', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1195', '肇州县', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1196', '肇源县', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1197', '林甸县', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1198', '杜尔伯特', '1189', '255');
INSERT INTO `ecm_region` VALUES ('1199', '大兴安岭', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1200', '呼玛县', '1199', '255');
INSERT INTO `ecm_region` VALUES ('1201', '漠河县', '1199', '255');
INSERT INTO `ecm_region` VALUES ('1202', '塔河县', '1199', '255');
INSERT INTO `ecm_region` VALUES ('1203', '鹤岗', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1204', '兴山区', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1205', '工农区', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1206', '南山区', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1207', '兴安区', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1208', '向阳区', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1209', '东山区', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1210', '萝北县', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1211', '绥滨县', '1203', '255');
INSERT INTO `ecm_region` VALUES ('1212', '黑河', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1213', '爱辉区', '1212', '255');
INSERT INTO `ecm_region` VALUES ('1214', '五大连池市', '1212', '255');
INSERT INTO `ecm_region` VALUES ('1215', '北安市', '1212', '255');
INSERT INTO `ecm_region` VALUES ('1216', '嫩江县', '1212', '255');
INSERT INTO `ecm_region` VALUES ('1217', '逊克县', '1212', '255');
INSERT INTO `ecm_region` VALUES ('1218', '孙吴县', '1212', '255');
INSERT INTO `ecm_region` VALUES ('1219', '鸡西', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1220', '鸡冠区', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1221', '恒山区', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1222', '城子河区', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1223', '滴道区', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1224', '梨树区', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1225', '虎林市', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1226', '密山市', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1227', '鸡东县', '1219', '255');
INSERT INTO `ecm_region` VALUES ('1228', '佳木斯', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1229', '前进区', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1230', '郊区', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1231', '向阳区', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1232', '东风区', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1233', '同江市', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1234', '富锦市', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1235', '桦南县', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1236', '桦川县', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1237', '汤原县', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1238', '抚远县', '1228', '255');
INSERT INTO `ecm_region` VALUES ('1239', '牡丹江', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1240', '爱民区', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1241', '东安区', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1242', '阳明区', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1243', '西安区', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1244', '绥芬河市', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1245', '海林市', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1246', '宁安市', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1247', '穆棱市', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1248', '东宁县', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1249', '林口县', '1239', '255');
INSERT INTO `ecm_region` VALUES ('1250', '七台河', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1251', '桃山区', '1250', '255');
INSERT INTO `ecm_region` VALUES ('1252', '新兴区', '1250', '255');
INSERT INTO `ecm_region` VALUES ('1253', '茄子河区', '1250', '255');
INSERT INTO `ecm_region` VALUES ('1254', '勃利县', '1250', '255');
INSERT INTO `ecm_region` VALUES ('1255', '齐齐哈尔', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1256', '龙沙区', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1257', '昂昂溪区', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1258', '铁峰区', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1259', '建华区', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1260', '富拉尔基区', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1261', '碾子山区', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1262', '梅里斯达斡尔区', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1263', '讷河市', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1264', '龙江县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1265', '依安县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1266', '泰来县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1267', '甘南县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1268', '富裕县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1269', '克山县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1270', '克东县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1271', '拜泉县', '1255', '255');
INSERT INTO `ecm_region` VALUES ('1272', '双鸭山', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1273', '尖山区', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1274', '岭东区', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1275', '四方台区', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1276', '宝山区', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1277', '集贤县', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1278', '友谊县', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1279', '宝清县', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1280', '饶河县', '1272', '255');
INSERT INTO `ecm_region` VALUES ('1281', '绥化', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1282', '北林区', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1283', '安达市', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1284', '肇东市', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1285', '海伦市', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1286', '望奎县', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1287', '兰西县', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1288', '青冈县', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1289', '庆安县', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1290', '明水县', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1291', '绥棱县', '1281', '255');
INSERT INTO `ecm_region` VALUES ('1292', '伊春', '1167', '255');
INSERT INTO `ecm_region` VALUES ('1293', '伊春区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1294', '带岭区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1295', '南岔区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1296', '金山屯区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1297', '西林区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1298', '美溪区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1299', '乌马河区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1300', '翠峦区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1301', '友好区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1302', '上甘岭区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1303', '五营区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1304', '红星区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1305', '新青区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1306', '汤旺河区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1307', '乌伊岭区', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1308', '铁力市', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1309', '嘉荫县', '1292', '255');
INSERT INTO `ecm_region` VALUES ('1310', '湖北', '1', '255');
INSERT INTO `ecm_region` VALUES ('1311', '武汉', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1312', '江岸区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1313', '武昌区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1314', '江汉区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1315', '硚口区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1316', '汉阳区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1317', '青山区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1318', '洪山区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1319', '东西湖区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1320', '汉南区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1321', '蔡甸区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1322', '江夏区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1323', '黄陂区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1324', '新洲区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1325', '经济开发区', '1311', '255');
INSERT INTO `ecm_region` VALUES ('1326', '仙桃', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1327', '仙桃市', '1326', '255');
INSERT INTO `ecm_region` VALUES ('1328', '鄂州', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1329', '鄂城区', '1328', '255');
INSERT INTO `ecm_region` VALUES ('1330', '华容区', '1328', '255');
INSERT INTO `ecm_region` VALUES ('1331', '梁子湖区', '1328', '255');
INSERT INTO `ecm_region` VALUES ('1332', '黄冈', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1333', '黄州区', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1334', '麻城市', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1335', '武穴市', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1336', '团风县', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1337', '红安县', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1338', '罗田县', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1339', '英山县', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1340', '浠水县', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1341', '蕲春县', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1342', '黄梅县', '1332', '255');
INSERT INTO `ecm_region` VALUES ('1343', '黄石', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1344', '黄石港区', '1343', '255');
INSERT INTO `ecm_region` VALUES ('1345', '西塞山区', '1343', '255');
INSERT INTO `ecm_region` VALUES ('1346', '下陆区', '1343', '255');
INSERT INTO `ecm_region` VALUES ('1347', '铁山区', '1343', '255');
INSERT INTO `ecm_region` VALUES ('1348', '大冶市', '1343', '255');
INSERT INTO `ecm_region` VALUES ('1349', '阳新县', '1343', '255');
INSERT INTO `ecm_region` VALUES ('1350', '荆门', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1351', '东宝区', '1350', '255');
INSERT INTO `ecm_region` VALUES ('1352', '掇刀区', '1350', '255');
INSERT INTO `ecm_region` VALUES ('1353', '钟祥市', '1350', '255');
INSERT INTO `ecm_region` VALUES ('1354', '京山县', '1350', '255');
INSERT INTO `ecm_region` VALUES ('1355', '沙洋县', '1350', '255');
INSERT INTO `ecm_region` VALUES ('1356', '荆州', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1357', '沙市区', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1358', '荆州区', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1359', '石首市', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1360', '洪湖市', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1361', '松滋市', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1362', '公安县', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1363', '监利县', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1364', '江陵县', '1356', '255');
INSERT INTO `ecm_region` VALUES ('1365', '潜江', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1366', '潜江市', '1365', '255');
INSERT INTO `ecm_region` VALUES ('1367', '神农架林区', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1368', '神农架林区', '1367', '255');
INSERT INTO `ecm_region` VALUES ('1369', '十堰', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1370', '张湾区', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1371', '茅箭区', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1372', '丹江口市', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1373', '郧县', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1374', '郧西县', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1375', '竹山县', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1376', '竹溪县', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1377', '房县', '1369', '255');
INSERT INTO `ecm_region` VALUES ('1378', '随州', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1379', '曾都区', '1378', '255');
INSERT INTO `ecm_region` VALUES ('1380', '广水市', '1378', '255');
INSERT INTO `ecm_region` VALUES ('1381', '天门', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1382', '天门市', '1381', '255');
INSERT INTO `ecm_region` VALUES ('1383', '咸宁', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1384', '咸安区', '1383', '255');
INSERT INTO `ecm_region` VALUES ('1385', '赤壁市', '1383', '255');
INSERT INTO `ecm_region` VALUES ('1386', '嘉鱼县', '1383', '255');
INSERT INTO `ecm_region` VALUES ('1387', '通城县', '1383', '255');
INSERT INTO `ecm_region` VALUES ('1388', '崇阳县', '1383', '255');
INSERT INTO `ecm_region` VALUES ('1389', '通山县', '1383', '255');
INSERT INTO `ecm_region` VALUES ('1390', '襄樊', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1391', '襄城区', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1392', '樊城区', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1393', '襄阳区', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1394', '老河口市', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1395', '枣阳市', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1396', '宜城市', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1397', '南漳县', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1398', '谷城县', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1399', '保康县', '1390', '255');
INSERT INTO `ecm_region` VALUES ('1400', '孝感', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1401', '孝南区', '1400', '255');
INSERT INTO `ecm_region` VALUES ('1402', '应城市', '1400', '255');
INSERT INTO `ecm_region` VALUES ('1403', '安陆市', '1400', '255');
INSERT INTO `ecm_region` VALUES ('1404', '汉川市', '1400', '255');
INSERT INTO `ecm_region` VALUES ('1405', '孝昌县', '1400', '255');
INSERT INTO `ecm_region` VALUES ('1406', '大悟县', '1400', '255');
INSERT INTO `ecm_region` VALUES ('1407', '云梦县', '1400', '255');
INSERT INTO `ecm_region` VALUES ('1408', '宜昌', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1409', '长阳', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1410', '五峰', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1411', '西陵区', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1412', '伍家岗区', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1413', '点军区', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1414', '猇亭区', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1415', '夷陵区', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1416', '宜都市', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1417', '当阳市', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1418', '枝江市', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1419', '远安县', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1420', '兴山县', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1421', '秭归县', '1408', '255');
INSERT INTO `ecm_region` VALUES ('1422', '恩施', '1310', '255');
INSERT INTO `ecm_region` VALUES ('1423', '恩施市', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1424', '利川市', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1425', '建始县', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1426', '巴东县', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1427', '宣恩县', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1428', '咸丰县', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1429', '来凤县', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1430', '鹤峰县', '1422', '255');
INSERT INTO `ecm_region` VALUES ('1431', '湖南', '1', '255');
INSERT INTO `ecm_region` VALUES ('1432', '长沙', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1433', '岳麓区', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1434', '芙蓉区', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1435', '天心区', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1436', '开福区', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1437', '雨花区', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1438', '开发区', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1439', '浏阳市', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1440', '长沙县', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1441', '望城县', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1442', '宁乡县', '1432', '255');
INSERT INTO `ecm_region` VALUES ('1443', '张家界', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1444', '永定区', '1443', '255');
INSERT INTO `ecm_region` VALUES ('1445', '武陵源区', '1443', '255');
INSERT INTO `ecm_region` VALUES ('1446', '慈利县', '1443', '255');
INSERT INTO `ecm_region` VALUES ('1447', '桑植县', '1443', '255');
INSERT INTO `ecm_region` VALUES ('1448', '常德', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1449', '武陵区', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1450', '鼎城区', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1451', '津市市', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1452', '安乡县', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1453', '汉寿县', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1454', '澧县', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1455', '临澧县', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1456', '桃源县', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1457', '石门县', '1448', '255');
INSERT INTO `ecm_region` VALUES ('1458', '郴州', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1459', '北湖区', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1460', '苏仙区', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1461', '资兴市', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1462', '桂阳县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1463', '宜章县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1464', '永兴县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1465', '嘉禾县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1466', '临武县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1467', '汝城县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1468', '桂东县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1469', '安仁县', '1458', '255');
INSERT INTO `ecm_region` VALUES ('1470', '衡阳', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1471', '雁峰区', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1472', '珠晖区', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1473', '石鼓区', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1474', '蒸湘区', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1475', '南岳区', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1476', '耒阳市', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1477', '常宁市', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1478', '衡阳县', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1479', '衡南县', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1480', '衡山县', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1481', '衡东县', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1482', '祁东县', '1470', '255');
INSERT INTO `ecm_region` VALUES ('1483', '怀化', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1484', '鹤城区', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1485', '靖州', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1486', '麻阳', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1487', '通道', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1488', '新晃', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1489', '芷江', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1490', '沅陵县', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1491', '辰溪县', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1492', '溆浦县', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1493', '中方县', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1494', '会同县', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1495', '洪江市', '1483', '255');
INSERT INTO `ecm_region` VALUES ('1496', '娄底', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1497', '娄星区', '1496', '255');
INSERT INTO `ecm_region` VALUES ('1498', '冷水江市', '1496', '255');
INSERT INTO `ecm_region` VALUES ('1499', '涟源市', '1496', '255');
INSERT INTO `ecm_region` VALUES ('1500', '双峰县', '1496', '255');
INSERT INTO `ecm_region` VALUES ('1501', '新化县', '1496', '255');
INSERT INTO `ecm_region` VALUES ('1502', '邵阳', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1503', '城步', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1504', '双清区', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1505', '大祥区', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1506', '北塔区', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1507', '武冈市', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1508', '邵东县', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1509', '新邵县', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1510', '邵阳县', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1511', '隆回县', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1512', '洞口县', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1513', '绥宁县', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1514', '新宁县', '1502', '255');
INSERT INTO `ecm_region` VALUES ('1515', '湘潭', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1516', '岳塘区', '1515', '255');
INSERT INTO `ecm_region` VALUES ('1517', '雨湖区', '1515', '255');
INSERT INTO `ecm_region` VALUES ('1518', '湘乡市', '1515', '255');
INSERT INTO `ecm_region` VALUES ('1519', '韶山市', '1515', '255');
INSERT INTO `ecm_region` VALUES ('1520', '湘潭县', '1515', '255');
INSERT INTO `ecm_region` VALUES ('1521', '湘西', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1522', '吉首市', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1523', '泸溪县', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1524', '凤凰县', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1525', '花垣县', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1526', '保靖县', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1527', '古丈县', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1528', '永顺县', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1529', '龙山县', '1521', '255');
INSERT INTO `ecm_region` VALUES ('1530', '益阳', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1531', '赫山区', '1530', '255');
INSERT INTO `ecm_region` VALUES ('1532', '资阳区', '1530', '255');
INSERT INTO `ecm_region` VALUES ('1533', '沅江市', '1530', '255');
INSERT INTO `ecm_region` VALUES ('1534', '南县', '1530', '255');
INSERT INTO `ecm_region` VALUES ('1535', '桃江县', '1530', '255');
INSERT INTO `ecm_region` VALUES ('1536', '安化县', '1530', '255');
INSERT INTO `ecm_region` VALUES ('1537', '永州', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1538', '江华', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1539', '冷水滩区', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1540', '零陵区', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1541', '祁阳县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1542', '东安县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1543', '双牌县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1544', '道县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1545', '江永县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1546', '宁远县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1547', '蓝山县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1548', '新田县', '1537', '255');
INSERT INTO `ecm_region` VALUES ('1549', '岳阳', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1550', '岳阳楼区', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1551', '君山区', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1552', '云溪区', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1553', '汨罗市', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1554', '临湘市', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1555', '岳阳县', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1556', '华容县', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1557', '湘阴县', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1558', '平江县', '1549', '255');
INSERT INTO `ecm_region` VALUES ('1559', '株洲', '1431', '255');
INSERT INTO `ecm_region` VALUES ('1560', '天元区', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1561', '荷塘区', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1562', '芦淞区', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1563', '石峰区', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1564', '醴陵市', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1565', '株洲县', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1566', '攸县', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1567', '茶陵县', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1568', '炎陵县', '1559', '255');
INSERT INTO `ecm_region` VALUES ('1569', '吉林', '1', '255');
INSERT INTO `ecm_region` VALUES ('1570', '长春', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1571', '朝阳区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1572', '宽城区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1573', '二道区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1574', '南关区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1575', '绿园区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1576', '双阳区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1577', '净月潭开发区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1578', '高新技术开发区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1579', '经济技术开发区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1580', '汽车产业开发区', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1581', '德惠市', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1582', '九台市', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1583', '榆树市', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1584', '农安县', '1570', '255');
INSERT INTO `ecm_region` VALUES ('1585', '吉林', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1586', '船营区', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1587', '昌邑区', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1588', '龙潭区', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1589', '丰满区', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1590', '蛟河市', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1591', '桦甸市', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1592', '舒兰市', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1593', '磐石市', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1594', '永吉县', '1585', '255');
INSERT INTO `ecm_region` VALUES ('1595', '白城', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1596', '洮北区', '1595', '255');
INSERT INTO `ecm_region` VALUES ('1597', '洮南市', '1595', '255');
INSERT INTO `ecm_region` VALUES ('1598', '大安市', '1595', '255');
INSERT INTO `ecm_region` VALUES ('1599', '镇赉县', '1595', '255');
INSERT INTO `ecm_region` VALUES ('1600', '通榆县', '1595', '255');
INSERT INTO `ecm_region` VALUES ('1601', '白山', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1602', '江源区', '1601', '255');
INSERT INTO `ecm_region` VALUES ('1603', '八道江区', '1601', '255');
INSERT INTO `ecm_region` VALUES ('1604', '长白', '1601', '255');
INSERT INTO `ecm_region` VALUES ('1605', '临江市', '1601', '255');
INSERT INTO `ecm_region` VALUES ('1606', '抚松县', '1601', '255');
INSERT INTO `ecm_region` VALUES ('1607', '靖宇县', '1601', '255');
INSERT INTO `ecm_region` VALUES ('1608', '辽源', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1609', '龙山区', '1608', '255');
INSERT INTO `ecm_region` VALUES ('1610', '西安区', '1608', '255');
INSERT INTO `ecm_region` VALUES ('1611', '东丰县', '1608', '255');
INSERT INTO `ecm_region` VALUES ('1612', '东辽县', '1608', '255');
INSERT INTO `ecm_region` VALUES ('1613', '四平', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1614', '铁西区', '1613', '255');
INSERT INTO `ecm_region` VALUES ('1615', '铁东区', '1613', '255');
INSERT INTO `ecm_region` VALUES ('1616', '伊通', '1613', '255');
INSERT INTO `ecm_region` VALUES ('1617', '公主岭市', '1613', '255');
INSERT INTO `ecm_region` VALUES ('1618', '双辽市', '1613', '255');
INSERT INTO `ecm_region` VALUES ('1619', '梨树县', '1613', '255');
INSERT INTO `ecm_region` VALUES ('1620', '松原', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1621', '前郭尔罗斯', '1620', '255');
INSERT INTO `ecm_region` VALUES ('1622', '宁江区', '1620', '255');
INSERT INTO `ecm_region` VALUES ('1623', '长岭县', '1620', '255');
INSERT INTO `ecm_region` VALUES ('1624', '乾安县', '1620', '255');
INSERT INTO `ecm_region` VALUES ('1625', '扶余县', '1620', '255');
INSERT INTO `ecm_region` VALUES ('1626', '通化', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1627', '东昌区', '1626', '255');
INSERT INTO `ecm_region` VALUES ('1628', '二道江区', '1626', '255');
INSERT INTO `ecm_region` VALUES ('1629', '梅河口市', '1626', '255');
INSERT INTO `ecm_region` VALUES ('1630', '集安市', '1626', '255');
INSERT INTO `ecm_region` VALUES ('1631', '通化县', '1626', '255');
INSERT INTO `ecm_region` VALUES ('1632', '辉南县', '1626', '255');
INSERT INTO `ecm_region` VALUES ('1633', '柳河县', '1626', '255');
INSERT INTO `ecm_region` VALUES ('1634', '延边', '1569', '255');
INSERT INTO `ecm_region` VALUES ('1635', '延吉市', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1636', '图们市', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1637', '敦化市', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1638', '珲春市', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1639', '龙井市', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1640', '和龙市', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1641', '安图县', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1642', '汪清县', '1634', '255');
INSERT INTO `ecm_region` VALUES ('1643', '江苏', '1', '255');
INSERT INTO `ecm_region` VALUES ('1644', '南京', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1645', '玄武区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1646', '鼓楼区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1647', '白下区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1648', '建邺区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1649', '秦淮区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1650', '雨花台区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1651', '下关区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1652', '栖霞区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1653', '浦口区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1654', '江宁区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1655', '六合区', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1656', '溧水县', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1657', '高淳县', '1644', '255');
INSERT INTO `ecm_region` VALUES ('1658', '苏州', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1659', '沧浪区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1660', '金阊区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1661', '平江区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1662', '虎丘区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1663', '吴中区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1664', '相城区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1665', '园区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1666', '新区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1667', '常熟市', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1668', '张家港市', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1669', '玉山镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1670', '巴城镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1671', '周市镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1672', '陆家镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1673', '花桥镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1674', '淀山湖镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1675', '张浦镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1676', '周庄镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1677', '千灯镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1678', '锦溪镇', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1679', '开发区', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1680', '吴江市', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1681', '太仓市', '1658', '255');
INSERT INTO `ecm_region` VALUES ('1682', '无锡', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1683', '崇安区', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1684', '北塘区', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1685', '南长区', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1686', '锡山区', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1687', '惠山区', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1688', '滨湖区', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1689', '新区', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1690', '江阴市', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1691', '宜兴市', '1682', '255');
INSERT INTO `ecm_region` VALUES ('1692', '常州', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1693', '天宁区', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1694', '钟楼区', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1695', '戚墅堰区', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1696', '郊区', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1697', '新北区', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1698', '武进区', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1699', '溧阳市', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1700', '金坛市', '1692', '255');
INSERT INTO `ecm_region` VALUES ('1701', '淮安', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1702', '清河区', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1703', '清浦区', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1704', '楚州区', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1705', '淮阴区', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1706', '涟水县', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1707', '洪泽县', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1708', '盱眙县', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1709', '金湖县', '1701', '255');
INSERT INTO `ecm_region` VALUES ('1710', '连云港', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1711', '新浦区', '1710', '255');
INSERT INTO `ecm_region` VALUES ('1712', '连云区', '1710', '255');
INSERT INTO `ecm_region` VALUES ('1713', '海州区', '1710', '255');
INSERT INTO `ecm_region` VALUES ('1714', '赣榆县', '1710', '255');
INSERT INTO `ecm_region` VALUES ('1715', '东海县', '1710', '255');
INSERT INTO `ecm_region` VALUES ('1716', '灌云县', '1710', '255');
INSERT INTO `ecm_region` VALUES ('1717', '灌南县', '1710', '255');
INSERT INTO `ecm_region` VALUES ('1718', '南通', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1719', '崇川区', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1720', '港闸区', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1721', '经济开发区', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1722', '启东市', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1723', '如皋市', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1724', '通州市', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1725', '海门市', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1726', '海安县', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1727', '如东县', '1718', '255');
INSERT INTO `ecm_region` VALUES ('1728', '宿迁', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1729', '宿城区', '1728', '255');
INSERT INTO `ecm_region` VALUES ('1730', '宿豫区', '1728', '255');
INSERT INTO `ecm_region` VALUES ('1731', '宿豫县', '1728', '255');
INSERT INTO `ecm_region` VALUES ('1732', '沭阳县', '1728', '255');
INSERT INTO `ecm_region` VALUES ('1733', '泗阳县', '1728', '255');
INSERT INTO `ecm_region` VALUES ('1734', '泗洪县', '1728', '255');
INSERT INTO `ecm_region` VALUES ('1735', '泰州', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1736', '海陵区', '1735', '255');
INSERT INTO `ecm_region` VALUES ('1737', '高港区', '1735', '255');
INSERT INTO `ecm_region` VALUES ('1738', '兴化市', '1735', '255');
INSERT INTO `ecm_region` VALUES ('1739', '靖江市', '1735', '255');
INSERT INTO `ecm_region` VALUES ('1740', '泰兴市', '1735', '255');
INSERT INTO `ecm_region` VALUES ('1741', '姜堰市', '1735', '255');
INSERT INTO `ecm_region` VALUES ('1742', '徐州', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1743', '云龙区', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1744', '鼓楼区', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1745', '九里区', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1746', '贾汪区', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1747', '泉山区', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1748', '新沂市', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1749', '邳州市', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1750', '丰县', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1751', '沛县', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1752', '铜山县', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1753', '睢宁县', '1742', '255');
INSERT INTO `ecm_region` VALUES ('1754', '盐城', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1755', '城区', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1756', '亭湖区', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1757', '盐都区', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1758', '盐都县', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1759', '东台市', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1760', '大丰市', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1761', '响水县', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1762', '滨海县', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1763', '阜宁县', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1764', '射阳县', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1765', '建湖县', '1754', '255');
INSERT INTO `ecm_region` VALUES ('1766', '扬州', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1767', '广陵区', '1766', '255');
INSERT INTO `ecm_region` VALUES ('1768', '维扬区', '1766', '255');
INSERT INTO `ecm_region` VALUES ('1769', '邗江区', '1766', '255');
INSERT INTO `ecm_region` VALUES ('1770', '仪征市', '1766', '255');
INSERT INTO `ecm_region` VALUES ('1771', '高邮市', '1766', '255');
INSERT INTO `ecm_region` VALUES ('1772', '江都市', '1766', '255');
INSERT INTO `ecm_region` VALUES ('1773', '宝应县', '1766', '255');
INSERT INTO `ecm_region` VALUES ('1774', '镇江', '1643', '255');
INSERT INTO `ecm_region` VALUES ('1775', '京口区', '1774', '255');
INSERT INTO `ecm_region` VALUES ('1776', '润州区', '1774', '255');
INSERT INTO `ecm_region` VALUES ('1777', '丹徒区', '1774', '255');
INSERT INTO `ecm_region` VALUES ('1778', '丹阳市', '1774', '255');
INSERT INTO `ecm_region` VALUES ('1779', '扬中市', '1774', '255');
INSERT INTO `ecm_region` VALUES ('1780', '句容市', '1774', '255');
INSERT INTO `ecm_region` VALUES ('1781', '江西', '1', '255');
INSERT INTO `ecm_region` VALUES ('1782', '南昌', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1783', '东湖区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1784', '西湖区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1785', '青云谱区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1786', '湾里区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1787', '青山湖区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1788', '红谷滩新区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1789', '昌北区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1790', '高新区', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1791', '南昌县', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1792', '新建县', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1793', '安义县', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1794', '进贤县', '1782', '255');
INSERT INTO `ecm_region` VALUES ('1795', '抚州', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1796', '临川区', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1797', '南城县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1798', '黎川县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1799', '南丰县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1800', '崇仁县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1801', '乐安县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1802', '宜黄县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1803', '金溪县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1804', '资溪县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1805', '东乡县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1806', '广昌县', '1795', '255');
INSERT INTO `ecm_region` VALUES ('1807', '赣州', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1808', '章贡区', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1809', '于都县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1810', '瑞金市', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1811', '南康市', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1812', '赣县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1813', '信丰县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1814', '大余县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1815', '上犹县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1816', '崇义县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1817', '安远县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1818', '龙南县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1819', '定南县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1820', '全南县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1821', '宁都县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1822', '兴国县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1823', '会昌县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1824', '寻乌县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1825', '石城县', '1807', '255');
INSERT INTO `ecm_region` VALUES ('1826', '吉安', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1827', '安福县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1828', '吉州区', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1829', '青原区', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1830', '井冈山市', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1831', '吉安县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1832', '吉水县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1833', '峡江县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1834', '新干县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1835', '永丰县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1836', '泰和县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1837', '遂川县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1838', '万安县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1839', '永新县', '1826', '255');
INSERT INTO `ecm_region` VALUES ('1840', '景德镇', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1841', '珠山区', '1840', '255');
INSERT INTO `ecm_region` VALUES ('1842', '昌江区', '1840', '255');
INSERT INTO `ecm_region` VALUES ('1843', '乐平市', '1840', '255');
INSERT INTO `ecm_region` VALUES ('1844', '浮梁县', '1840', '255');
INSERT INTO `ecm_region` VALUES ('1845', '九江', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1846', '浔阳区', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1847', '庐山区', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1848', '瑞昌市', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1849', '九江县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1850', '武宁县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1851', '修水县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1852', '永修县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1853', '德安县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1854', '星子县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1855', '都昌县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1856', '湖口县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1857', '彭泽县', '1845', '255');
INSERT INTO `ecm_region` VALUES ('1858', '萍乡', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1859', '安源区', '1858', '255');
INSERT INTO `ecm_region` VALUES ('1860', '湘东区', '1858', '255');
INSERT INTO `ecm_region` VALUES ('1861', '莲花县', '1858', '255');
INSERT INTO `ecm_region` VALUES ('1862', '芦溪县', '1858', '255');
INSERT INTO `ecm_region` VALUES ('1863', '上栗县', '1858', '255');
INSERT INTO `ecm_region` VALUES ('1864', '上饶', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1865', '信州区', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1866', '德兴市', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1867', '上饶县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1868', '广丰县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1869', '玉山县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1870', '铅山县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1871', '横峰县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1872', '弋阳县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1873', '余干县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1874', '波阳县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1875', '万年县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1876', '婺源县', '1864', '255');
INSERT INTO `ecm_region` VALUES ('1877', '新余', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1878', '渝水区', '1877', '255');
INSERT INTO `ecm_region` VALUES ('1879', '分宜县', '1877', '255');
INSERT INTO `ecm_region` VALUES ('1880', '宜春', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1881', '袁州区', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1882', '丰城市', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1883', '樟树市', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1884', '高安市', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1885', '奉新县', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1886', '万载县', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1887', '上高县', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1888', '宜丰县', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1889', '靖安县', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1890', '铜鼓县', '1880', '255');
INSERT INTO `ecm_region` VALUES ('1891', '鹰潭', '1781', '255');
INSERT INTO `ecm_region` VALUES ('1892', '月湖区', '1891', '255');
INSERT INTO `ecm_region` VALUES ('1893', '贵溪市', '1891', '255');
INSERT INTO `ecm_region` VALUES ('1894', '余江县', '1891', '255');
INSERT INTO `ecm_region` VALUES ('1895', '辽宁', '1', '255');
INSERT INTO `ecm_region` VALUES ('1896', '沈阳', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1897', '沈河区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1898', '皇姑区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1899', '和平区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1900', '大东区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1901', '铁西区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1902', '苏家屯区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1903', '东陵区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1904', '沈北新区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1905', '于洪区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1906', '浑南新区', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1907', '新民市', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1908', '辽中县', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1909', '康平县', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1910', '法库县', '1896', '255');
INSERT INTO `ecm_region` VALUES ('1911', '大连', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1912', '西岗区', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1913', '中山区', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1914', '沙河口区', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1915', '甘井子区', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1916', '旅顺口区', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1917', '金州区', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1918', '开发区', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1919', '瓦房店市', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1920', '普兰店市', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1921', '庄河市', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1922', '长海县', '1911', '255');
INSERT INTO `ecm_region` VALUES ('1923', '鞍山', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1924', '铁东区', '1923', '255');
INSERT INTO `ecm_region` VALUES ('1925', '铁西区', '1923', '255');
INSERT INTO `ecm_region` VALUES ('1926', '立山区', '1923', '255');
INSERT INTO `ecm_region` VALUES ('1927', '千山区', '1923', '255');
INSERT INTO `ecm_region` VALUES ('1928', '岫岩', '1923', '255');
INSERT INTO `ecm_region` VALUES ('1929', '海城市', '1923', '255');
INSERT INTO `ecm_region` VALUES ('1930', '台安县', '1923', '255');
INSERT INTO `ecm_region` VALUES ('1931', '本溪', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1932', '本溪', '1931', '255');
INSERT INTO `ecm_region` VALUES ('1933', '平山区', '1931', '255');
INSERT INTO `ecm_region` VALUES ('1934', '明山区', '1931', '255');
INSERT INTO `ecm_region` VALUES ('1935', '溪湖区', '1931', '255');
INSERT INTO `ecm_region` VALUES ('1936', '南芬区', '1931', '255');
INSERT INTO `ecm_region` VALUES ('1937', '桓仁', '1931', '255');
INSERT INTO `ecm_region` VALUES ('1938', '朝阳', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1939', '双塔区', '1938', '255');
INSERT INTO `ecm_region` VALUES ('1940', '龙城区', '1938', '255');
INSERT INTO `ecm_region` VALUES ('1941', '喀喇沁左翼蒙古族自治县', '1938', '255');
INSERT INTO `ecm_region` VALUES ('1942', '北票市', '1938', '255');
INSERT INTO `ecm_region` VALUES ('1943', '凌源市', '1938', '255');
INSERT INTO `ecm_region` VALUES ('1944', '朝阳县', '1938', '255');
INSERT INTO `ecm_region` VALUES ('1945', '建平县', '1938', '255');
INSERT INTO `ecm_region` VALUES ('1946', '丹东', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1947', '振兴区', '1946', '255');
INSERT INTO `ecm_region` VALUES ('1948', '元宝区', '1946', '255');
INSERT INTO `ecm_region` VALUES ('1949', '振安区', '1946', '255');
INSERT INTO `ecm_region` VALUES ('1950', '宽甸', '1946', '255');
INSERT INTO `ecm_region` VALUES ('1951', '东港市', '1946', '255');
INSERT INTO `ecm_region` VALUES ('1952', '凤城市', '1946', '255');
INSERT INTO `ecm_region` VALUES ('1953', '抚顺', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1954', '顺城区', '1953', '255');
INSERT INTO `ecm_region` VALUES ('1955', '新抚区', '1953', '255');
INSERT INTO `ecm_region` VALUES ('1956', '东洲区', '1953', '255');
INSERT INTO `ecm_region` VALUES ('1957', '望花区', '1953', '255');
INSERT INTO `ecm_region` VALUES ('1958', '清原', '1953', '255');
INSERT INTO `ecm_region` VALUES ('1959', '新宾', '1953', '255');
INSERT INTO `ecm_region` VALUES ('1960', '抚顺县', '1953', '255');
INSERT INTO `ecm_region` VALUES ('1961', '阜新', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1962', '阜新', '1961', '255');
INSERT INTO `ecm_region` VALUES ('1963', '海州区', '1961', '255');
INSERT INTO `ecm_region` VALUES ('1964', '新邱区', '1961', '255');
INSERT INTO `ecm_region` VALUES ('1965', '太平区', '1961', '255');
INSERT INTO `ecm_region` VALUES ('1966', '清河门区', '1961', '255');
INSERT INTO `ecm_region` VALUES ('1967', '细河区', '1961', '255');
INSERT INTO `ecm_region` VALUES ('1968', '彰武县', '1961', '255');
INSERT INTO `ecm_region` VALUES ('1969', '葫芦岛', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1970', '龙港区', '1969', '255');
INSERT INTO `ecm_region` VALUES ('1971', '南票区', '1969', '255');
INSERT INTO `ecm_region` VALUES ('1972', '连山区', '1969', '255');
INSERT INTO `ecm_region` VALUES ('1973', '兴城市', '1969', '255');
INSERT INTO `ecm_region` VALUES ('1974', '绥中县', '1969', '255');
INSERT INTO `ecm_region` VALUES ('1975', '建昌县', '1969', '255');
INSERT INTO `ecm_region` VALUES ('1976', '锦州', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1977', '太和区', '1976', '255');
INSERT INTO `ecm_region` VALUES ('1978', '古塔区', '1976', '255');
INSERT INTO `ecm_region` VALUES ('1979', '凌河区', '1976', '255');
INSERT INTO `ecm_region` VALUES ('1980', '凌海市', '1976', '255');
INSERT INTO `ecm_region` VALUES ('1981', '北镇市', '1976', '255');
INSERT INTO `ecm_region` VALUES ('1982', '黑山县', '1976', '255');
INSERT INTO `ecm_region` VALUES ('1983', '义县', '1976', '255');
INSERT INTO `ecm_region` VALUES ('1984', '辽阳', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1985', '白塔区', '1984', '255');
INSERT INTO `ecm_region` VALUES ('1986', '文圣区', '1984', '255');
INSERT INTO `ecm_region` VALUES ('1987', '宏伟区', '1984', '255');
INSERT INTO `ecm_region` VALUES ('1988', '太子河区', '1984', '255');
INSERT INTO `ecm_region` VALUES ('1989', '弓长岭区', '1984', '255');
INSERT INTO `ecm_region` VALUES ('1990', '灯塔市', '1984', '255');
INSERT INTO `ecm_region` VALUES ('1991', '辽阳县', '1984', '255');
INSERT INTO `ecm_region` VALUES ('1992', '盘锦', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1993', '双台子区', '1992', '255');
INSERT INTO `ecm_region` VALUES ('1994', '兴隆台区', '1992', '255');
INSERT INTO `ecm_region` VALUES ('1995', '大洼县', '1992', '255');
INSERT INTO `ecm_region` VALUES ('1996', '盘山县', '1992', '255');
INSERT INTO `ecm_region` VALUES ('1997', '铁岭', '1895', '255');
INSERT INTO `ecm_region` VALUES ('1998', '银州区', '1997', '255');
INSERT INTO `ecm_region` VALUES ('1999', '清河区', '1997', '255');
INSERT INTO `ecm_region` VALUES ('2000', '调兵山市', '1997', '255');
INSERT INTO `ecm_region` VALUES ('2001', '开原市', '1997', '255');
INSERT INTO `ecm_region` VALUES ('2002', '铁岭县', '1997', '255');
INSERT INTO `ecm_region` VALUES ('2003', '西丰县', '1997', '255');
INSERT INTO `ecm_region` VALUES ('2004', '昌图县', '1997', '255');
INSERT INTO `ecm_region` VALUES ('2005', '营口', '1895', '255');
INSERT INTO `ecm_region` VALUES ('2006', '站前区', '2005', '255');
INSERT INTO `ecm_region` VALUES ('2007', '西市区', '2005', '255');
INSERT INTO `ecm_region` VALUES ('2008', '鲅鱼圈区', '2005', '255');
INSERT INTO `ecm_region` VALUES ('2009', '老边区', '2005', '255');
INSERT INTO `ecm_region` VALUES ('2010', '盖州市', '2005', '255');
INSERT INTO `ecm_region` VALUES ('2011', '大石桥市', '2005', '255');
INSERT INTO `ecm_region` VALUES ('2012', '内蒙古', '1', '255');
INSERT INTO `ecm_region` VALUES ('2013', '呼和浩特', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2014', '回民区', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2015', '玉泉区', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2016', '新城区', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2017', '赛罕区', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2018', '清水河县', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2019', '土默特左旗', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2020', '托克托县', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2021', '和林格尔县', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2022', '武川县', '2013', '255');
INSERT INTO `ecm_region` VALUES ('2023', '阿拉善盟', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2024', '阿拉善左旗', '2023', '255');
INSERT INTO `ecm_region` VALUES ('2025', '阿拉善右旗', '2023', '255');
INSERT INTO `ecm_region` VALUES ('2026', '额济纳旗', '2023', '255');
INSERT INTO `ecm_region` VALUES ('2027', '巴彦淖尔盟', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2028', '临河区', '2027', '255');
INSERT INTO `ecm_region` VALUES ('2029', '五原县', '2027', '255');
INSERT INTO `ecm_region` VALUES ('2030', '磴口县', '2027', '255');
INSERT INTO `ecm_region` VALUES ('2031', '乌拉特前旗', '2027', '255');
INSERT INTO `ecm_region` VALUES ('2032', '乌拉特中旗', '2027', '255');
INSERT INTO `ecm_region` VALUES ('2033', '乌拉特后旗', '2027', '255');
INSERT INTO `ecm_region` VALUES ('2034', '杭锦后旗', '2027', '255');
INSERT INTO `ecm_region` VALUES ('2035', '包头', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2036', '昆都仑区', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2037', '青山区', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2038', '东河区', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2039', '九原区', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2040', '石拐区', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2041', '白云矿区', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2042', '土默特右旗', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2043', '固阳县', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2044', '达尔罕茂明安联合旗', '2035', '255');
INSERT INTO `ecm_region` VALUES ('2045', '赤峰', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2046', '红山区', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2047', '元宝山区', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2048', '松山区', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2049', '阿鲁科尔沁旗', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2050', '巴林左旗', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2051', '巴林右旗', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2052', '林西县', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2053', '克什克腾旗', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2054', '翁牛特旗', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2055', '喀喇沁旗', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2056', '宁城县', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2057', '敖汉旗', '2045', '255');
INSERT INTO `ecm_region` VALUES ('2058', '鄂尔多斯', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2059', '东胜区', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2060', '达拉特旗', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2061', '准格尔旗', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2062', '鄂托克前旗', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2063', '鄂托克旗', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2064', '杭锦旗', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2065', '乌审旗', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2066', '伊金霍洛旗', '2058', '255');
INSERT INTO `ecm_region` VALUES ('2067', '呼伦贝尔', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2068', '海拉尔区', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2069', '莫力达瓦', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2070', '满洲里市', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2071', '牙克石市', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2072', '扎兰屯市', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2073', '额尔古纳市', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2074', '根河市', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2075', '阿荣旗', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2076', '鄂伦春自治旗', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2077', '鄂温克族自治旗', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2078', '陈巴尔虎旗', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2079', '新巴尔虎左旗', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2080', '新巴尔虎右旗', '2067', '255');
INSERT INTO `ecm_region` VALUES ('2081', '通辽', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2082', '科尔沁区', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2083', '霍林郭勒市', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2084', '科尔沁左翼中旗', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2085', '科尔沁左翼后旗', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2086', '开鲁县', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2087', '库伦旗', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2088', '奈曼旗', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2089', '扎鲁特旗', '2081', '255');
INSERT INTO `ecm_region` VALUES ('2090', '乌海', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2091', '海勃湾区', '2090', '255');
INSERT INTO `ecm_region` VALUES ('2092', '乌达区', '2090', '255');
INSERT INTO `ecm_region` VALUES ('2093', '海南区', '2090', '255');
INSERT INTO `ecm_region` VALUES ('2094', '乌兰察布市', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2095', '化德县', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2096', '集宁区', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2097', '丰镇市', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2098', '卓资县', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2099', '商都县', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2100', '兴和县', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2101', '凉城县', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2102', '察哈尔右翼前旗', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2103', '察哈尔右翼中旗', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2104', '察哈尔右翼后旗', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2105', '四子王旗', '2094', '255');
INSERT INTO `ecm_region` VALUES ('2106', '锡林郭勒盟', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2107', '二连浩特市', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2108', '锡林浩特市', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2109', '阿巴嘎旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2110', '苏尼特左旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2111', '苏尼特右旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2112', '东乌珠穆沁旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2113', '西乌珠穆沁旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2114', '太仆寺旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2115', '镶黄旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2116', '正镶白旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2117', '正蓝旗', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2118', '多伦县', '2106', '255');
INSERT INTO `ecm_region` VALUES ('2119', '兴安盟', '2012', '255');
INSERT INTO `ecm_region` VALUES ('2120', '乌兰浩特市', '2119', '255');
INSERT INTO `ecm_region` VALUES ('2121', '阿尔山市', '2119', '255');
INSERT INTO `ecm_region` VALUES ('2122', '科尔沁右翼前旗', '2119', '255');
INSERT INTO `ecm_region` VALUES ('2123', '科尔沁右翼中旗', '2119', '255');
INSERT INTO `ecm_region` VALUES ('2124', '扎赉特旗', '2119', '255');
INSERT INTO `ecm_region` VALUES ('2125', '突泉县', '2119', '255');
INSERT INTO `ecm_region` VALUES ('2126', '宁夏', '1', '255');
INSERT INTO `ecm_region` VALUES ('2127', '银川', '2126', '255');
INSERT INTO `ecm_region` VALUES ('2128', '西夏区', '2127', '255');
INSERT INTO `ecm_region` VALUES ('2129', '金凤区', '2127', '255');
INSERT INTO `ecm_region` VALUES ('2130', '兴庆区', '2127', '255');
INSERT INTO `ecm_region` VALUES ('2131', '灵武市', '2127', '255');
INSERT INTO `ecm_region` VALUES ('2132', '永宁县', '2127', '255');
INSERT INTO `ecm_region` VALUES ('2133', '贺兰县', '2127', '255');
INSERT INTO `ecm_region` VALUES ('2134', '固原', '2126', '255');
INSERT INTO `ecm_region` VALUES ('2135', '原州区', '2134', '255');
INSERT INTO `ecm_region` VALUES ('2136', '海原县', '2134', '255');
INSERT INTO `ecm_region` VALUES ('2137', '西吉县', '2134', '255');
INSERT INTO `ecm_region` VALUES ('2138', '隆德县', '2134', '255');
INSERT INTO `ecm_region` VALUES ('2139', '泾源县', '2134', '255');
INSERT INTO `ecm_region` VALUES ('2140', '彭阳县', '2134', '255');
INSERT INTO `ecm_region` VALUES ('2141', '石嘴山', '2126', '255');
INSERT INTO `ecm_region` VALUES ('2142', '惠农县', '2141', '255');
INSERT INTO `ecm_region` VALUES ('2143', '大武口区', '2141', '255');
INSERT INTO `ecm_region` VALUES ('2144', '惠农区', '2141', '255');
INSERT INTO `ecm_region` VALUES ('2145', '陶乐县', '2141', '255');
INSERT INTO `ecm_region` VALUES ('2146', '平罗县', '2141', '255');
INSERT INTO `ecm_region` VALUES ('2147', '吴忠', '2126', '255');
INSERT INTO `ecm_region` VALUES ('2148', '利通区', '2147', '255');
INSERT INTO `ecm_region` VALUES ('2149', '中卫县', '2147', '255');
INSERT INTO `ecm_region` VALUES ('2150', '青铜峡市', '2147', '255');
INSERT INTO `ecm_region` VALUES ('2151', '中宁县', '2147', '255');
INSERT INTO `ecm_region` VALUES ('2152', '盐池县', '2147', '255');
INSERT INTO `ecm_region` VALUES ('2153', '同心县', '2147', '255');
INSERT INTO `ecm_region` VALUES ('2154', '中卫', '2126', '255');
INSERT INTO `ecm_region` VALUES ('2155', '沙坡头区', '2154', '255');
INSERT INTO `ecm_region` VALUES ('2156', '海原县', '2154', '255');
INSERT INTO `ecm_region` VALUES ('2157', '中宁县', '2154', '255');
INSERT INTO `ecm_region` VALUES ('2158', '青海', '1', '255');
INSERT INTO `ecm_region` VALUES ('2159', '西宁', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2160', '城中区', '2159', '255');
INSERT INTO `ecm_region` VALUES ('2161', '城东区', '2159', '255');
INSERT INTO `ecm_region` VALUES ('2162', '城西区', '2159', '255');
INSERT INTO `ecm_region` VALUES ('2163', '城北区', '2159', '255');
INSERT INTO `ecm_region` VALUES ('2164', '湟中县', '2159', '255');
INSERT INTO `ecm_region` VALUES ('2165', '湟源县', '2159', '255');
INSERT INTO `ecm_region` VALUES ('2166', '大通', '2159', '255');
INSERT INTO `ecm_region` VALUES ('2167', '果洛', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2168', '玛沁县', '2167', '255');
INSERT INTO `ecm_region` VALUES ('2169', '班玛县', '2167', '255');
INSERT INTO `ecm_region` VALUES ('2170', '甘德县', '2167', '255');
INSERT INTO `ecm_region` VALUES ('2171', '达日县', '2167', '255');
INSERT INTO `ecm_region` VALUES ('2172', '久治县', '2167', '255');
INSERT INTO `ecm_region` VALUES ('2173', '玛多县', '2167', '255');
INSERT INTO `ecm_region` VALUES ('2174', '海北', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2175', '海晏县', '2174', '255');
INSERT INTO `ecm_region` VALUES ('2176', '祁连县', '2174', '255');
INSERT INTO `ecm_region` VALUES ('2177', '刚察县', '2174', '255');
INSERT INTO `ecm_region` VALUES ('2178', '门源', '2174', '255');
INSERT INTO `ecm_region` VALUES ('2179', '海东', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2180', '平安县', '2179', '255');
INSERT INTO `ecm_region` VALUES ('2181', '乐都县', '2179', '255');
INSERT INTO `ecm_region` VALUES ('2182', '民和', '2179', '255');
INSERT INTO `ecm_region` VALUES ('2183', '互助', '2179', '255');
INSERT INTO `ecm_region` VALUES ('2184', '化隆', '2179', '255');
INSERT INTO `ecm_region` VALUES ('2185', '循化', '2179', '255');
INSERT INTO `ecm_region` VALUES ('2186', '海南', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2187', '共和县', '2186', '255');
INSERT INTO `ecm_region` VALUES ('2188', '同德县', '2186', '255');
INSERT INTO `ecm_region` VALUES ('2189', '贵德县', '2186', '255');
INSERT INTO `ecm_region` VALUES ('2190', '兴海县', '2186', '255');
INSERT INTO `ecm_region` VALUES ('2191', '贵南县', '2186', '255');
INSERT INTO `ecm_region` VALUES ('2192', '海西', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2193', '德令哈市', '2192', '255');
INSERT INTO `ecm_region` VALUES ('2194', '格尔木市', '2192', '255');
INSERT INTO `ecm_region` VALUES ('2195', '乌兰县', '2192', '255');
INSERT INTO `ecm_region` VALUES ('2196', '都兰县', '2192', '255');
INSERT INTO `ecm_region` VALUES ('2197', '天峻县', '2192', '255');
INSERT INTO `ecm_region` VALUES ('2198', '黄南', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2199', '同仁县', '2198', '255');
INSERT INTO `ecm_region` VALUES ('2200', '尖扎县', '2198', '255');
INSERT INTO `ecm_region` VALUES ('2201', '泽库县', '2198', '255');
INSERT INTO `ecm_region` VALUES ('2202', '河南蒙古族自治县', '2198', '255');
INSERT INTO `ecm_region` VALUES ('2203', '玉树', '2158', '255');
INSERT INTO `ecm_region` VALUES ('2204', '玉树县', '2203', '255');
INSERT INTO `ecm_region` VALUES ('2205', '杂多县', '2203', '255');
INSERT INTO `ecm_region` VALUES ('2206', '称多县', '2203', '255');
INSERT INTO `ecm_region` VALUES ('2207', '治多县', '2203', '255');
INSERT INTO `ecm_region` VALUES ('2208', '囊谦县', '2203', '255');
INSERT INTO `ecm_region` VALUES ('2209', '曲麻莱县', '2203', '255');
INSERT INTO `ecm_region` VALUES ('2210', '山东', '1', '255');
INSERT INTO `ecm_region` VALUES ('2211', '济南', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2212', '市中区', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2213', '历下区', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2214', '天桥区', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2215', '槐荫区', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2216', '历城区', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2217', '长清区', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2218', '章丘市', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2219', '平阴县', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2220', '济阳县', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2221', '商河县', '2211', '255');
INSERT INTO `ecm_region` VALUES ('2222', '青岛', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2223', '市南区', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2224', '市北区', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2225', '城阳区', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2226', '四方区', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2227', '李沧区', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2228', '黄岛区', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2229', '崂山区', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2230', '胶州市', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2231', '即墨市', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2232', '平度市', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2233', '胶南市', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2234', '莱西市', '2222', '255');
INSERT INTO `ecm_region` VALUES ('2235', '滨州', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2236', '滨城区', '2235', '255');
INSERT INTO `ecm_region` VALUES ('2237', '惠民县', '2235', '255');
INSERT INTO `ecm_region` VALUES ('2238', '阳信县', '2235', '255');
INSERT INTO `ecm_region` VALUES ('2239', '无棣县', '2235', '255');
INSERT INTO `ecm_region` VALUES ('2240', '沾化县', '2235', '255');
INSERT INTO `ecm_region` VALUES ('2241', '博兴县', '2235', '255');
INSERT INTO `ecm_region` VALUES ('2242', '邹平县', '2235', '255');
INSERT INTO `ecm_region` VALUES ('2243', '德州', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2244', '德城区', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2245', '陵县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2246', '乐陵市', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2247', '禹城市', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2248', '宁津县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2249', '庆云县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2250', '临邑县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2251', '齐河县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2252', '平原县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2253', '夏津县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2254', '武城县', '2243', '255');
INSERT INTO `ecm_region` VALUES ('2255', '东营', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2256', '东营区', '2255', '255');
INSERT INTO `ecm_region` VALUES ('2257', '河口区', '2255', '255');
INSERT INTO `ecm_region` VALUES ('2258', '垦利县', '2255', '255');
INSERT INTO `ecm_region` VALUES ('2259', '利津县', '2255', '255');
INSERT INTO `ecm_region` VALUES ('2260', '广饶县', '2255', '255');
INSERT INTO `ecm_region` VALUES ('2261', '菏泽', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2262', '牡丹区', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2263', '曹县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2264', '单县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2265', '成武县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2266', '巨野县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2267', '郓城县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2268', '鄄城县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2269', '定陶县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2270', '东明县', '2261', '255');
INSERT INTO `ecm_region` VALUES ('2271', '济宁', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2272', '市中区', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2273', '任城区', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2274', '曲阜市', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2275', '兖州市', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2276', '邹城市', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2277', '微山县', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2278', '鱼台县', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2279', '金乡县', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2280', '嘉祥县', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2281', '汶上县', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2282', '泗水县', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2283', '梁山县', '2271', '255');
INSERT INTO `ecm_region` VALUES ('2284', '莱芜', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2285', '莱城区', '2284', '255');
INSERT INTO `ecm_region` VALUES ('2286', '钢城区', '2284', '255');
INSERT INTO `ecm_region` VALUES ('2287', '聊城', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2288', '东昌府区', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2289', '临清市', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2290', '阳谷县', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2291', '莘县', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2292', '茌平县', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2293', '东阿县', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2294', '冠县', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2295', '高唐县', '2287', '255');
INSERT INTO `ecm_region` VALUES ('2296', '临沂', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2297', '兰山区', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2298', '罗庄区', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2299', '河东区', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2300', '沂南县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2301', '郯城县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2302', '沂水县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2303', '苍山县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2304', '费县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2305', '平邑县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2306', '莒南县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2307', '蒙阴县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2308', '临沭县', '2296', '255');
INSERT INTO `ecm_region` VALUES ('2309', '日照', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2310', '东港区', '2309', '255');
INSERT INTO `ecm_region` VALUES ('2311', '岚山区', '2309', '255');
INSERT INTO `ecm_region` VALUES ('2312', '五莲县', '2309', '255');
INSERT INTO `ecm_region` VALUES ('2313', '莒县', '2309', '255');
INSERT INTO `ecm_region` VALUES ('2314', '泰安', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2315', '泰山区', '2314', '255');
INSERT INTO `ecm_region` VALUES ('2316', '岱岳区', '2314', '255');
INSERT INTO `ecm_region` VALUES ('2317', '新泰市', '2314', '255');
INSERT INTO `ecm_region` VALUES ('2318', '肥城市', '2314', '255');
INSERT INTO `ecm_region` VALUES ('2319', '宁阳县', '2314', '255');
INSERT INTO `ecm_region` VALUES ('2320', '东平县', '2314', '255');
INSERT INTO `ecm_region` VALUES ('2321', '威海', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2322', '荣成市', '2321', '255');
INSERT INTO `ecm_region` VALUES ('2323', '乳山市', '2321', '255');
INSERT INTO `ecm_region` VALUES ('2324', '环翠区', '2321', '255');
INSERT INTO `ecm_region` VALUES ('2325', '文登市', '2321', '255');
INSERT INTO `ecm_region` VALUES ('2326', '潍坊', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2327', '潍城区', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2328', '寒亭区', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2329', '坊子区', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2330', '奎文区', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2331', '青州市', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2332', '诸城市', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2333', '寿光市', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2334', '安丘市', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2335', '高密市', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2336', '昌邑市', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2337', '临朐县', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2338', '昌乐县', '2326', '255');
INSERT INTO `ecm_region` VALUES ('2339', '烟台', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2340', '芝罘区', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2341', '福山区', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2342', '牟平区', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2343', '莱山区', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2344', '开发区', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2345', '龙口市', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2346', '莱阳市', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2347', '莱州市', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2348', '蓬莱市', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2349', '招远市', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2350', '栖霞市', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2351', '海阳市', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2352', '长岛县', '2339', '255');
INSERT INTO `ecm_region` VALUES ('2353', '枣庄', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2354', '市中区', '2353', '255');
INSERT INTO `ecm_region` VALUES ('2355', '山亭区', '2353', '255');
INSERT INTO `ecm_region` VALUES ('2356', '峄城区', '2353', '255');
INSERT INTO `ecm_region` VALUES ('2357', '台儿庄区', '2353', '255');
INSERT INTO `ecm_region` VALUES ('2358', '薛城区', '2353', '255');
INSERT INTO `ecm_region` VALUES ('2359', '滕州市', '2353', '255');
INSERT INTO `ecm_region` VALUES ('2360', '淄博', '2210', '255');
INSERT INTO `ecm_region` VALUES ('2361', '张店区', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2362', '临淄区', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2363', '淄川区', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2364', '博山区', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2365', '周村区', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2366', '桓台县', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2367', '高青县', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2368', '沂源县', '2360', '255');
INSERT INTO `ecm_region` VALUES ('2369', '山西', '1', '255');
INSERT INTO `ecm_region` VALUES ('2370', '太原', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2371', '杏花岭区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2372', '小店区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2373', '迎泽区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2374', '尖草坪区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2375', '万柏林区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2376', '晋源区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2377', '高新开发区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2378', '民营经济开发区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2379', '经济技术开发区', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2380', '清徐县', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2381', '阳曲县', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2382', '娄烦县', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2383', '古交市', '2370', '255');
INSERT INTO `ecm_region` VALUES ('2384', '长治', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2385', '城区', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2386', '郊区', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2387', '沁县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2388', '潞城市', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2389', '长治县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2390', '襄垣县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2391', '屯留县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2392', '平顺县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2393', '黎城县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2394', '壶关县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2395', '长子县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2396', '武乡县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2397', '沁源县', '2384', '255');
INSERT INTO `ecm_region` VALUES ('2398', '大同', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2399', '城区', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2400', '矿区', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2401', '南郊区', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2402', '新荣区', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2403', '阳高县', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2404', '天镇县', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2405', '广灵县', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2406', '灵丘县', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2407', '浑源县', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2408', '左云县', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2409', '大同县', '2398', '255');
INSERT INTO `ecm_region` VALUES ('2410', '晋城', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2411', '城区', '2410', '255');
INSERT INTO `ecm_region` VALUES ('2412', '高平市', '2410', '255');
INSERT INTO `ecm_region` VALUES ('2413', '沁水县', '2410', '255');
INSERT INTO `ecm_region` VALUES ('2414', '阳城县', '2410', '255');
INSERT INTO `ecm_region` VALUES ('2415', '陵川县', '2410', '255');
INSERT INTO `ecm_region` VALUES ('2416', '泽州县', '2410', '255');
INSERT INTO `ecm_region` VALUES ('2417', '晋中', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2418', '榆次区', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2419', '介休市', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2420', '榆社县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2421', '左权县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2422', '和顺县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2423', '昔阳县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2424', '寿阳县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2425', '太谷县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2426', '祁县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2427', '平遥县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2428', '灵石县', '2417', '255');
INSERT INTO `ecm_region` VALUES ('2429', '临汾', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2430', '尧都区', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2431', '侯马市', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2432', '霍州市', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2433', '曲沃县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2434', '翼城县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2435', '襄汾县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2436', '洪洞县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2437', '吉县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2438', '安泽县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2439', '浮山县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2440', '古县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2441', '乡宁县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2442', '大宁县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2443', '隰县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2444', '永和县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2445', '蒲县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2446', '汾西县', '2429', '255');
INSERT INTO `ecm_region` VALUES ('2447', '吕梁', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2448', '离石市', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2449', '离石区', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2450', '孝义市', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2451', '汾阳市', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2452', '文水县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2453', '交城县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2454', '兴县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2455', '临县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2456', '柳林县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2457', '石楼县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2458', '岚县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2459', '方山县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2460', '中阳县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2461', '交口县', '2447', '255');
INSERT INTO `ecm_region` VALUES ('2462', '朔州', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2463', '朔城区', '2462', '255');
INSERT INTO `ecm_region` VALUES ('2464', '平鲁区', '2462', '255');
INSERT INTO `ecm_region` VALUES ('2465', '山阴县', '2462', '255');
INSERT INTO `ecm_region` VALUES ('2466', '应县', '2462', '255');
INSERT INTO `ecm_region` VALUES ('2467', '右玉县', '2462', '255');
INSERT INTO `ecm_region` VALUES ('2468', '怀仁县', '2462', '255');
INSERT INTO `ecm_region` VALUES ('2469', '忻州', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2470', '忻府区', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2471', '原平市', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2472', '定襄县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2473', '五台县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2474', '代县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2475', '繁峙县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2476', '宁武县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2477', '静乐县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2478', '神池县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2479', '五寨县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2480', '岢岚县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2481', '河曲县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2482', '保德县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2483', '偏关县', '2469', '255');
INSERT INTO `ecm_region` VALUES ('2484', '阳泉', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2485', '城区', '2484', '255');
INSERT INTO `ecm_region` VALUES ('2486', '矿区', '2484', '255');
INSERT INTO `ecm_region` VALUES ('2487', '郊区', '2484', '255');
INSERT INTO `ecm_region` VALUES ('2488', '平定县', '2484', '255');
INSERT INTO `ecm_region` VALUES ('2489', '盂县', '2484', '255');
INSERT INTO `ecm_region` VALUES ('2490', '运城', '2369', '255');
INSERT INTO `ecm_region` VALUES ('2491', '盐湖区', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2492', '永济市', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2493', '河津市', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2494', '临猗县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2495', '万荣县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2496', '闻喜县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2497', '稷山县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2498', '新绛县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2499', '绛县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2500', '垣曲县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2501', '夏县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2502', '平陆县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2503', '芮城县', '2490', '255');
INSERT INTO `ecm_region` VALUES ('2504', '陕西', '1', '255');
INSERT INTO `ecm_region` VALUES ('2505', '西安', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2506', '莲湖区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2507', '新城区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2508', '碑林区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2509', '雁塔区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2510', '灞桥区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2511', '未央区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2512', '阎良区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2513', '临潼区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2514', '长安区', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2515', '蓝田县', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2516', '周至县', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2517', '户县', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2518', '高陵县', '2505', '255');
INSERT INTO `ecm_region` VALUES ('2519', '安康', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2520', '汉滨区', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2521', '汉阴县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2522', '石泉县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2523', '宁陕县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2524', '紫阳县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2525', '岚皋县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2526', '平利县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2527', '镇坪县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2528', '旬阳县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2529', '白河县', '2519', '255');
INSERT INTO `ecm_region` VALUES ('2530', '宝鸡', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2531', '陈仓区', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2532', '渭滨区', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2533', '金台区', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2534', '凤翔县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2535', '岐山县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2536', '扶风县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2537', '眉县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2538', '陇县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2539', '千阳县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2540', '麟游县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2541', '凤县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2542', '太白县', '2530', '255');
INSERT INTO `ecm_region` VALUES ('2543', '汉中', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2544', '汉台区', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2545', '南郑县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2546', '城固县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2547', '洋县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2548', '西乡县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2549', '勉县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2550', '宁强县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2551', '略阳县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2552', '镇巴县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2553', '留坝县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2554', '佛坪县', '2543', '255');
INSERT INTO `ecm_region` VALUES ('2555', '商洛', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2556', '商州区', '2555', '255');
INSERT INTO `ecm_region` VALUES ('2557', '洛南县', '2555', '255');
INSERT INTO `ecm_region` VALUES ('2558', '丹凤县', '2555', '255');
INSERT INTO `ecm_region` VALUES ('2559', '商南县', '2555', '255');
INSERT INTO `ecm_region` VALUES ('2560', '山阳县', '2555', '255');
INSERT INTO `ecm_region` VALUES ('2561', '镇安县', '2555', '255');
INSERT INTO `ecm_region` VALUES ('2562', '柞水县', '2555', '255');
INSERT INTO `ecm_region` VALUES ('2563', '铜川', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2564', '耀州区', '2563', '255');
INSERT INTO `ecm_region` VALUES ('2565', '王益区', '2563', '255');
INSERT INTO `ecm_region` VALUES ('2566', '印台区', '2563', '255');
INSERT INTO `ecm_region` VALUES ('2567', '宜君县', '2563', '255');
INSERT INTO `ecm_region` VALUES ('2568', '渭南', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2569', '临渭区', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2570', '韩城市', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2571', '华阴市', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2572', '华县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2573', '潼关县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2574', '大荔县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2575', '合阳县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2576', '澄城县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2577', '蒲城县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2578', '白水县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2579', '富平县', '2568', '255');
INSERT INTO `ecm_region` VALUES ('2580', '咸阳', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2581', '秦都区', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2582', '渭城区', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2583', '杨陵区', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2584', '兴平市', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2585', '三原县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2586', '泾阳县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2587', '乾县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2588', '礼泉县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2589', '永寿县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2590', '彬县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2591', '长武县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2592', '旬邑县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2593', '淳化县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2594', '武功县', '2580', '255');
INSERT INTO `ecm_region` VALUES ('2595', '延安', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2596', '吴起县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2597', '宝塔区', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2598', '延长县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2599', '延川县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2600', '子长县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2601', '安塞县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2602', '志丹县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2603', '甘泉县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2604', '富县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2605', '洛川县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2606', '宜川县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2607', '黄龙县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2608', '黄陵县', '2595', '255');
INSERT INTO `ecm_region` VALUES ('2609', '榆林', '2504', '255');
INSERT INTO `ecm_region` VALUES ('2610', '榆阳区', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2611', '神木县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2612', '府谷县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2613', '横山县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2614', '靖边县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2615', '定边县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2616', '绥德县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2617', '米脂县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2618', '佳县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2619', '吴堡县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2620', '清涧县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2621', '子洲县', '2609', '255');
INSERT INTO `ecm_region` VALUES ('2622', '上海', '1', '255');
INSERT INTO `ecm_region` VALUES ('2623', '上海', '2622', '255');
INSERT INTO `ecm_region` VALUES ('2624', '长宁区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2625', '闸北区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2626', '闵行区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2627', '徐汇区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2628', '浦东新区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2629', '杨浦区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2630', '普陀区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2631', '静安区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2632', '卢湾区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2633', '虹口区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2634', '黄浦区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2635', '南汇区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2636', '松江区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2637', '嘉定区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2638', '宝山区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2639', '青浦区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2640', '金山区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2641', '奉贤区', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2642', '崇明县', '2623', '255');
INSERT INTO `ecm_region` VALUES ('2643', '四川', '1', '255');
INSERT INTO `ecm_region` VALUES ('2644', '成都', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2645', '青羊区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2646', '锦江区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2647', '金牛区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2648', '武侯区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2649', '成华区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2650', '龙泉驿区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2651', '青白江区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2652', '新都区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2653', '温江区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2654', '高新区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2655', '高新西区', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2656', '都江堰市', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2657', '彭州市', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2658', '邛崃市', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2659', '崇州市', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2660', '金堂县', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2661', '双流县', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2662', '郫县', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2663', '大邑县', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2664', '蒲江县', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2665', '新津县', '2644', '255');
INSERT INTO `ecm_region` VALUES ('2666', '绵阳', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2667', '涪城区', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2668', '游仙区', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2669', '江油市', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2670', '盐亭县', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2671', '三台县', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2672', '平武县', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2673', '安县', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2674', '梓潼县', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2675', '北川县', '2666', '255');
INSERT INTO `ecm_region` VALUES ('2676', '阿坝', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2677', '马尔康县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2678', '汶川县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2679', '理县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2680', '茂县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2681', '松潘县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2682', '九寨沟县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2683', '金川县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2684', '小金县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2685', '黑水县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2686', '壤塘县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2687', '阿坝县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2688', '若尔盖县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2689', '红原县', '2676', '255');
INSERT INTO `ecm_region` VALUES ('2690', '巴中', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2691', '巴州区', '2690', '255');
INSERT INTO `ecm_region` VALUES ('2692', '通江县', '2690', '255');
INSERT INTO `ecm_region` VALUES ('2693', '南江县', '2690', '255');
INSERT INTO `ecm_region` VALUES ('2694', '平昌县', '2690', '255');
INSERT INTO `ecm_region` VALUES ('2695', '达州', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2696', '通川区', '2695', '255');
INSERT INTO `ecm_region` VALUES ('2697', '万源市', '2695', '255');
INSERT INTO `ecm_region` VALUES ('2698', '达县', '2695', '255');
INSERT INTO `ecm_region` VALUES ('2699', '宣汉县', '2695', '255');
INSERT INTO `ecm_region` VALUES ('2700', '开江县', '2695', '255');
INSERT INTO `ecm_region` VALUES ('2701', '大竹县', '2695', '255');
INSERT INTO `ecm_region` VALUES ('2702', '渠县', '2695', '255');
INSERT INTO `ecm_region` VALUES ('2703', '德阳', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2704', '旌阳区', '2703', '255');
INSERT INTO `ecm_region` VALUES ('2705', '广汉市', '2703', '255');
INSERT INTO `ecm_region` VALUES ('2706', '什邡市', '2703', '255');
INSERT INTO `ecm_region` VALUES ('2707', '绵竹市', '2703', '255');
INSERT INTO `ecm_region` VALUES ('2708', '罗江县', '2703', '255');
INSERT INTO `ecm_region` VALUES ('2709', '中江县', '2703', '255');
INSERT INTO `ecm_region` VALUES ('2710', '甘孜', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2711', '康定县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2712', '丹巴县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2713', '泸定县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2714', '炉霍县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2715', '九龙县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2716', '甘孜县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2717', '雅江县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2718', '新龙县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2719', '道孚县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2720', '白玉县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2721', '理塘县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2722', '德格县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2723', '乡城县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2724', '石渠县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2725', '稻城县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2726', '色达县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2727', '巴塘县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2728', '得荣县', '2710', '255');
INSERT INTO `ecm_region` VALUES ('2729', '广安', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2730', '广安区', '2729', '255');
INSERT INTO `ecm_region` VALUES ('2731', '华蓥市', '2729', '255');
INSERT INTO `ecm_region` VALUES ('2732', '岳池县', '2729', '255');
INSERT INTO `ecm_region` VALUES ('2733', '武胜县', '2729', '255');
INSERT INTO `ecm_region` VALUES ('2734', '邻水县', '2729', '255');
INSERT INTO `ecm_region` VALUES ('2735', '广元', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2736', '利州区', '2735', '255');
INSERT INTO `ecm_region` VALUES ('2737', '元坝区', '2735', '255');
INSERT INTO `ecm_region` VALUES ('2738', '朝天区', '2735', '255');
INSERT INTO `ecm_region` VALUES ('2739', '旺苍县', '2735', '255');
INSERT INTO `ecm_region` VALUES ('2740', '青川县', '2735', '255');
INSERT INTO `ecm_region` VALUES ('2741', '剑阁县', '2735', '255');
INSERT INTO `ecm_region` VALUES ('2742', '苍溪县', '2735', '255');
INSERT INTO `ecm_region` VALUES ('2743', '乐山', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2744', '峨眉山市', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2745', '乐山市', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2746', '犍为县', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2747', '井研县', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2748', '夹江县', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2749', '沐川县', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2750', '峨边', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2751', '马边', '2743', '255');
INSERT INTO `ecm_region` VALUES ('2752', '凉山', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2753', '西昌市', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2754', '盐源县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2755', '德昌县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2756', '会理县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2757', '会东县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2758', '宁南县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2759', '普格县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2760', '布拖县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2761', '金阳县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2762', '昭觉县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2763', '喜德县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2764', '冕宁县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2765', '越西县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2766', '甘洛县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2767', '美姑县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2768', '雷波县', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2769', '木里', '2752', '255');
INSERT INTO `ecm_region` VALUES ('2770', '眉山', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2771', '东坡区', '2770', '255');
INSERT INTO `ecm_region` VALUES ('2772', '仁寿县', '2770', '255');
INSERT INTO `ecm_region` VALUES ('2773', '彭山县', '2770', '255');
INSERT INTO `ecm_region` VALUES ('2774', '洪雅县', '2770', '255');
INSERT INTO `ecm_region` VALUES ('2775', '丹棱县', '2770', '255');
INSERT INTO `ecm_region` VALUES ('2776', '青神县', '2770', '255');
INSERT INTO `ecm_region` VALUES ('2777', '南充', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2778', '阆中市', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2779', '南部县', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2780', '营山县', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2781', '蓬安县', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2782', '仪陇县', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2783', '顺庆区', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2784', '高坪区', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2785', '嘉陵区', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2786', '西充县', '2777', '255');
INSERT INTO `ecm_region` VALUES ('2787', '内江', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2788', '市中区', '2787', '255');
INSERT INTO `ecm_region` VALUES ('2789', '东兴区', '2787', '255');
INSERT INTO `ecm_region` VALUES ('2790', '威远县', '2787', '255');
INSERT INTO `ecm_region` VALUES ('2791', '资中县', '2787', '255');
INSERT INTO `ecm_region` VALUES ('2792', '隆昌县', '2787', '255');
INSERT INTO `ecm_region` VALUES ('2793', '攀枝花', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2794', '东 区', '2793', '255');
INSERT INTO `ecm_region` VALUES ('2795', '西 区', '2793', '255');
INSERT INTO `ecm_region` VALUES ('2796', '仁和区', '2793', '255');
INSERT INTO `ecm_region` VALUES ('2797', '米易县', '2793', '255');
INSERT INTO `ecm_region` VALUES ('2798', '盐边县', '2793', '255');
INSERT INTO `ecm_region` VALUES ('2799', '遂宁', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2800', '船山区', '2799', '255');
INSERT INTO `ecm_region` VALUES ('2801', '安居区', '2799', '255');
INSERT INTO `ecm_region` VALUES ('2802', '蓬溪县', '2799', '255');
INSERT INTO `ecm_region` VALUES ('2803', '射洪县', '2799', '255');
INSERT INTO `ecm_region` VALUES ('2804', '大英县', '2799', '255');
INSERT INTO `ecm_region` VALUES ('2805', '雅安', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2806', '雨城区', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2807', '名山县', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2808', '荥经县', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2809', '汉源县', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2810', '石棉县', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2811', '天全县', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2812', '芦山县', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2813', '宝兴县', '2805', '255');
INSERT INTO `ecm_region` VALUES ('2814', '宜宾', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2815', '翠屏区', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2816', '宜宾县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2817', '南溪县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2818', '江安县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2819', '长宁县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2820', '高县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2821', '珙县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2822', '筠连县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2823', '兴文县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2824', '屏山县', '2814', '255');
INSERT INTO `ecm_region` VALUES ('2825', '资阳', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2826', '雁江区', '2825', '255');
INSERT INTO `ecm_region` VALUES ('2827', '简阳市', '2825', '255');
INSERT INTO `ecm_region` VALUES ('2828', '安岳县', '2825', '255');
INSERT INTO `ecm_region` VALUES ('2829', '乐至县', '2825', '255');
INSERT INTO `ecm_region` VALUES ('2830', '自贡', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2831', '大安区', '2830', '255');
INSERT INTO `ecm_region` VALUES ('2832', '自流井区', '2830', '255');
INSERT INTO `ecm_region` VALUES ('2833', '贡井区', '2830', '255');
INSERT INTO `ecm_region` VALUES ('2834', '沿滩区', '2830', '255');
INSERT INTO `ecm_region` VALUES ('2835', '荣县', '2830', '255');
INSERT INTO `ecm_region` VALUES ('2836', '富顺县', '2830', '255');
INSERT INTO `ecm_region` VALUES ('2837', '泸州', '2643', '255');
INSERT INTO `ecm_region` VALUES ('2838', '江阳区', '2837', '255');
INSERT INTO `ecm_region` VALUES ('2839', '纳溪区', '2837', '255');
INSERT INTO `ecm_region` VALUES ('2840', '龙马潭区', '2837', '255');
INSERT INTO `ecm_region` VALUES ('2841', '泸县', '2837', '255');
INSERT INTO `ecm_region` VALUES ('2842', '合江县', '2837', '255');
INSERT INTO `ecm_region` VALUES ('2843', '叙永县', '2837', '255');
INSERT INTO `ecm_region` VALUES ('2844', '古蔺县', '2837', '255');
INSERT INTO `ecm_region` VALUES ('2845', '天津', '1', '255');
INSERT INTO `ecm_region` VALUES ('2846', '天津', '2845', '255');
INSERT INTO `ecm_region` VALUES ('2847', '和平区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2848', '河西区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2849', '南开区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2850', '河北区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2851', '河东区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2852', '红桥区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2853', '东丽区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2854', '津南区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2855', '西青区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2856', '北辰区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2857', '塘沽区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2858', '汉沽区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2859', '大港区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2860', '武清区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2861', '宝坻区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2862', '经济开发区', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2863', '宁河县', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2864', '静海县', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2865', '蓟县', '2846', '255');
INSERT INTO `ecm_region` VALUES ('2866', '西藏', '1', '255');
INSERT INTO `ecm_region` VALUES ('2867', '拉萨', '2866', '255');
INSERT INTO `ecm_region` VALUES ('2868', '城关区', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2869', '林周县', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2870', '当雄县', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2871', '尼木县', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2872', '曲水县', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2873', '堆龙德庆县', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2874', '达孜县', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2875', '墨竹工卡县', '2867', '255');
INSERT INTO `ecm_region` VALUES ('2876', '阿里', '2866', '255');
INSERT INTO `ecm_region` VALUES ('2877', '噶尔县', '2876', '255');
INSERT INTO `ecm_region` VALUES ('2878', '普兰县', '2876', '255');
INSERT INTO `ecm_region` VALUES ('2879', '札达县', '2876', '255');
INSERT INTO `ecm_region` VALUES ('2880', '日土县', '2876', '255');
INSERT INTO `ecm_region` VALUES ('2881', '革吉县', '2876', '255');
INSERT INTO `ecm_region` VALUES ('2882', '改则县', '2876', '255');
INSERT INTO `ecm_region` VALUES ('2883', '措勤县', '2876', '255');
INSERT INTO `ecm_region` VALUES ('2884', '昌都', '2866', '255');
INSERT INTO `ecm_region` VALUES ('2885', '昌都县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2886', '江达县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2887', '贡觉县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2888', '类乌齐县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2889', '丁青县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2890', '察雅县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2891', '八宿县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2892', '左贡县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2893', '芒康县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2894', '洛隆县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2895', '边坝县', '2884', '255');
INSERT INTO `ecm_region` VALUES ('2896', '林芝', '2866', '255');
INSERT INTO `ecm_region` VALUES ('2897', '林芝县', '2896', '255');
INSERT INTO `ecm_region` VALUES ('2898', '工布江达县', '2896', '255');
INSERT INTO `ecm_region` VALUES ('2899', '米林县', '2896', '255');
INSERT INTO `ecm_region` VALUES ('2900', '墨脱县', '2896', '255');
INSERT INTO `ecm_region` VALUES ('2901', '波密县', '2896', '255');
INSERT INTO `ecm_region` VALUES ('2902', '察隅县', '2896', '255');
INSERT INTO `ecm_region` VALUES ('2903', '朗县', '2896', '255');
INSERT INTO `ecm_region` VALUES ('2904', '那曲', '2866', '255');
INSERT INTO `ecm_region` VALUES ('2905', '那曲县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2906', '嘉黎县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2907', '比如县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2908', '聂荣县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2909', '安多县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2910', '申扎县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2911', '索县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2912', '班戈县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2913', '巴青县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2914', '尼玛县', '2904', '255');
INSERT INTO `ecm_region` VALUES ('2915', '日喀则', '2866', '255');
INSERT INTO `ecm_region` VALUES ('2916', '日喀则市', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2917', '南木林县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2918', '江孜县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2919', '定日县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2920', '萨迦县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2921', '拉孜县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2922', '昂仁县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2923', '谢通门县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2924', '白朗县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2925', '仁布县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2926', '康马县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2927', '定结县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2928', '仲巴县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2929', '亚东县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2930', '吉隆县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2931', '聂拉木县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2932', '萨嘎县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2933', '岗巴县', '2915', '255');
INSERT INTO `ecm_region` VALUES ('2934', '山南', '2866', '255');
INSERT INTO `ecm_region` VALUES ('2935', '乃东县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2936', '扎囊县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2937', '贡嘎县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2938', '桑日县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2939', '琼结县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2940', '曲松县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2941', '措美县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2942', '洛扎县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2943', '加查县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2944', '隆子县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2945', '错那县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2946', '浪卡子县', '2934', '255');
INSERT INTO `ecm_region` VALUES ('2947', '新疆', '1', '255');
INSERT INTO `ecm_region` VALUES ('2948', '乌鲁木齐', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2949', '天山区', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2950', '沙依巴克区', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2951', '新市区', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2952', '水磨沟区', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2953', '头屯河区', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2954', '达坂城区', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2955', '米东区', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2956', '乌鲁木齐县', '2948', '255');
INSERT INTO `ecm_region` VALUES ('2957', '阿克苏', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2958', '阿克苏市', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2959', '温宿县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2960', '库车县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2961', '沙雅县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2962', '新和县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2963', '拜城县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2964', '乌什县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2965', '阿瓦提县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2966', '柯坪县', '2957', '255');
INSERT INTO `ecm_region` VALUES ('2967', '阿拉尔', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2968', '阿拉尔市', '2967', '255');
INSERT INTO `ecm_region` VALUES ('2969', '巴音郭楞', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2970', '库尔勒市', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2971', '轮台县', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2972', '尉犁县', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2973', '若羌县', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2974', '且末县', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2975', '焉耆', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2976', '和静县', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2977', '和硕县', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2978', '博湖县', '2969', '255');
INSERT INTO `ecm_region` VALUES ('2979', '博尔塔拉', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2980', '博乐市', '2979', '255');
INSERT INTO `ecm_region` VALUES ('2981', '精河县', '2979', '255');
INSERT INTO `ecm_region` VALUES ('2982', '温泉县', '2979', '255');
INSERT INTO `ecm_region` VALUES ('2983', '昌吉', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2984', '呼图壁县', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2985', '米泉市', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2986', '昌吉市', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2987', '阜康市', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2988', '玛纳斯县', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2989', '奇台县', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2990', '吉木萨尔县', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2991', '木垒', '2983', '255');
INSERT INTO `ecm_region` VALUES ('2992', '哈密', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2993', '哈密市', '2992', '255');
INSERT INTO `ecm_region` VALUES ('2994', '伊吾县', '2992', '255');
INSERT INTO `ecm_region` VALUES ('2995', '巴里坤', '2992', '255');
INSERT INTO `ecm_region` VALUES ('2996', '和田', '2947', '255');
INSERT INTO `ecm_region` VALUES ('2997', '和田市', '2996', '255');
INSERT INTO `ecm_region` VALUES ('2998', '和田县', '2996', '255');
INSERT INTO `ecm_region` VALUES ('2999', '墨玉县', '2996', '255');
INSERT INTO `ecm_region` VALUES ('3000', '皮山县', '2996', '255');
INSERT INTO `ecm_region` VALUES ('3001', '洛浦县', '2996', '255');
INSERT INTO `ecm_region` VALUES ('3002', '策勒县', '2996', '255');
INSERT INTO `ecm_region` VALUES ('3003', '于田县', '2996', '255');
INSERT INTO `ecm_region` VALUES ('3004', '民丰县', '2996', '255');
INSERT INTO `ecm_region` VALUES ('3005', '喀什', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3006', '喀什市', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3007', '疏附县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3008', '疏勒县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3009', '英吉沙县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3010', '泽普县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3011', '莎车县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3012', '叶城县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3013', '麦盖提县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3014', '岳普湖县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3015', '伽师县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3016', '巴楚县', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3017', '塔什库尔干', '3005', '255');
INSERT INTO `ecm_region` VALUES ('3018', '克拉玛依', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3019', '克拉玛依市', '3018', '255');
INSERT INTO `ecm_region` VALUES ('3020', '克孜勒苏', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3021', '阿图什市', '3020', '255');
INSERT INTO `ecm_region` VALUES ('3022', '阿克陶县', '3020', '255');
INSERT INTO `ecm_region` VALUES ('3023', '阿合奇县', '3020', '255');
INSERT INTO `ecm_region` VALUES ('3024', '乌恰县', '3020', '255');
INSERT INTO `ecm_region` VALUES ('3025', '石河子', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3026', '石河子市', '3025', '255');
INSERT INTO `ecm_region` VALUES ('3027', '图木舒克', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3028', '图木舒克市', '3027', '255');
INSERT INTO `ecm_region` VALUES ('3029', '吐鲁番', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3030', '吐鲁番市', '3029', '255');
INSERT INTO `ecm_region` VALUES ('3031', '鄯善县', '3029', '255');
INSERT INTO `ecm_region` VALUES ('3032', '托克逊县', '3029', '255');
INSERT INTO `ecm_region` VALUES ('3033', '五家渠', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3034', '五家渠市', '3033', '255');
INSERT INTO `ecm_region` VALUES ('3035', '伊犁', '2947', '255');
INSERT INTO `ecm_region` VALUES ('3036', '阿勒泰市', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3037', '布克赛尔', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3038', '伊宁市', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3039', '布尔津县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3040', '奎屯市', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3041', '乌苏市', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3042', '额敏县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3043', '富蕴县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3044', '伊宁县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3045', '福海县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3046', '霍城县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3047', '沙湾县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3048', '巩留县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3049', '哈巴河县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3050', '托里县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3051', '青河县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3052', '新源县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3053', '裕民县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3054', '和布克赛尔', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3055', '吉木乃县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3056', '昭苏县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3057', '特克斯县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3058', '尼勒克县', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3059', '察布查尔', '3035', '255');
INSERT INTO `ecm_region` VALUES ('3060', '云南', '1', '255');
INSERT INTO `ecm_region` VALUES ('3061', '昆明', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3062', '盘龙区', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3063', '五华区', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3064', '官渡区', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3065', '西山区', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3066', '东川区', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3067', '安宁市', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3068', '呈贡县', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3069', '晋宁县', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3070', '富民县', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3071', '宜良县', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3072', '嵩明县', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3073', '石林县', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3074', '禄劝', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3075', '寻甸', '3061', '255');
INSERT INTO `ecm_region` VALUES ('3076', '怒江', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3077', '兰坪', '3076', '255');
INSERT INTO `ecm_region` VALUES ('3078', '泸水县', '3076', '255');
INSERT INTO `ecm_region` VALUES ('3079', '福贡县', '3076', '255');
INSERT INTO `ecm_region` VALUES ('3080', '贡山', '3076', '255');
INSERT INTO `ecm_region` VALUES ('3081', '普洱', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3082', '宁洱', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3083', '思茅区', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3084', '墨江', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3085', '景东', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3086', '景谷', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3087', '镇沅', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3088', '江城', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3089', '孟连', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3090', '澜沧', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3091', '西盟', '3081', '255');
INSERT INTO `ecm_region` VALUES ('3092', '丽江', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3093', '古城区', '3092', '255');
INSERT INTO `ecm_region` VALUES ('3094', '宁蒗', '3092', '255');
INSERT INTO `ecm_region` VALUES ('3095', '玉龙', '3092', '255');
INSERT INTO `ecm_region` VALUES ('3096', '永胜县', '3092', '255');
INSERT INTO `ecm_region` VALUES ('3097', '华坪县', '3092', '255');
INSERT INTO `ecm_region` VALUES ('3098', '保山', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3099', '隆阳区', '3098', '255');
INSERT INTO `ecm_region` VALUES ('3100', '施甸县', '3098', '255');
INSERT INTO `ecm_region` VALUES ('3101', '腾冲县', '3098', '255');
INSERT INTO `ecm_region` VALUES ('3102', '龙陵县', '3098', '255');
INSERT INTO `ecm_region` VALUES ('3103', '昌宁县', '3098', '255');
INSERT INTO `ecm_region` VALUES ('3104', '楚雄', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3105', '楚雄市', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3106', '双柏县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3107', '牟定县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3108', '南华县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3109', '姚安县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3110', '大姚县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3111', '永仁县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3112', '元谋县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3113', '武定县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3114', '禄丰县', '3104', '255');
INSERT INTO `ecm_region` VALUES ('3115', '大理', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3116', '大理市', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3117', '祥云县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3118', '宾川县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3119', '弥渡县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3120', '永平县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3121', '云龙县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3122', '洱源县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3123', '剑川县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3124', '鹤庆县', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3125', '漾濞', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3126', '南涧', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3127', '巍山', '3115', '255');
INSERT INTO `ecm_region` VALUES ('3128', '德宏', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3129', '潞西市', '3128', '255');
INSERT INTO `ecm_region` VALUES ('3130', '瑞丽市', '3128', '255');
INSERT INTO `ecm_region` VALUES ('3131', '梁河县', '3128', '255');
INSERT INTO `ecm_region` VALUES ('3132', '盈江县', '3128', '255');
INSERT INTO `ecm_region` VALUES ('3133', '陇川县', '3128', '255');
INSERT INTO `ecm_region` VALUES ('3134', '迪庆', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3135', '香格里拉县', '3134', '255');
INSERT INTO `ecm_region` VALUES ('3136', '德钦县', '3134', '255');
INSERT INTO `ecm_region` VALUES ('3137', '维西', '3134', '255');
INSERT INTO `ecm_region` VALUES ('3138', '红河', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3139', '泸西县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3140', '蒙自县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3141', '个旧市', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3142', '开远市', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3143', '绿春县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3144', '建水县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3145', '石屏县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3146', '弥勒县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3147', '元阳县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3148', '红河县', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3149', '金平', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3150', '河口', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3151', '屏边', '3138', '255');
INSERT INTO `ecm_region` VALUES ('3152', '临沧', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3153', '临翔区', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3154', '凤庆县', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3155', '云县', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3156', '永德县', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3157', '镇康县', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3158', '双江', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3159', '耿马', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3160', '沧源', '3152', '255');
INSERT INTO `ecm_region` VALUES ('3161', '曲靖', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3162', '麒麟区', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3163', '宣威市', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3164', '马龙县', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3165', '陆良县', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3166', '师宗县', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3167', '罗平县', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3168', '富源县', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3169', '会泽县', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3170', '沾益县', '3161', '255');
INSERT INTO `ecm_region` VALUES ('3171', '文山', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3172', '文山县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3173', '砚山县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3174', '西畴县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3175', '麻栗坡县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3176', '马关县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3177', '丘北县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3178', '广南县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3179', '富宁县', '3171', '255');
INSERT INTO `ecm_region` VALUES ('3180', '西双版纳', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3181', '景洪市', '3180', '255');
INSERT INTO `ecm_region` VALUES ('3182', '勐海县', '3180', '255');
INSERT INTO `ecm_region` VALUES ('3183', '勐腊县', '3180', '255');
INSERT INTO `ecm_region` VALUES ('3184', '玉溪', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3185', '红塔区', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3186', '江川县', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3187', '澄江县', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3188', '通海县', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3189', '华宁县', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3190', '易门县', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3191', '峨山', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3192', '新平', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3193', '元江', '3184', '255');
INSERT INTO `ecm_region` VALUES ('3194', '昭通', '3060', '255');
INSERT INTO `ecm_region` VALUES ('3195', '昭阳区', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3196', '鲁甸县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3197', '巧家县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3198', '盐津县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3199', '大关县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3200', '永善县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3201', '绥江县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3202', '镇雄县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3203', '彝良县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3204', '威信县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3205', '水富县', '3194', '255');
INSERT INTO `ecm_region` VALUES ('3206', '浙江', '1', '255');
INSERT INTO `ecm_region` VALUES ('3207', '杭州', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3208', '西湖区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3209', '上城区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3210', '下城区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3211', '拱墅区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3212', '滨江区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3213', '江干区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3214', '萧山区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3215', '余杭区', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3216', '市郊', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3217', '建德市', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3218', '富阳市', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3219', '临安市', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3220', '桐庐县', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3221', '淳安县', '3207', '255');
INSERT INTO `ecm_region` VALUES ('3222', '湖州', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3223', '吴兴区', '3222', '255');
INSERT INTO `ecm_region` VALUES ('3224', '南浔区', '3222', '255');
INSERT INTO `ecm_region` VALUES ('3225', '德清县', '3222', '255');
INSERT INTO `ecm_region` VALUES ('3226', '长兴县', '3222', '255');
INSERT INTO `ecm_region` VALUES ('3227', '安吉县', '3222', '255');
INSERT INTO `ecm_region` VALUES ('3228', '嘉兴', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3229', '南湖区', '3228', '255');
INSERT INTO `ecm_region` VALUES ('3230', '秀洲区', '3228', '255');
INSERT INTO `ecm_region` VALUES ('3231', '海宁市', '3228', '255');
INSERT INTO `ecm_region` VALUES ('3232', '嘉善县', '3228', '255');
INSERT INTO `ecm_region` VALUES ('3233', '平湖市', '3228', '255');
INSERT INTO `ecm_region` VALUES ('3234', '桐乡市', '3228', '255');
INSERT INTO `ecm_region` VALUES ('3235', '海盐县', '3228', '255');
INSERT INTO `ecm_region` VALUES ('3236', '金华', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3237', '婺城区', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3238', '金东区', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3239', '兰溪市', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3240', '市区', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3241', '佛堂镇', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3242', '上溪镇', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3243', '义亭镇', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3244', '大陈镇', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3245', '苏溪镇', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3246', '赤岸镇', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3247', '东阳市', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3248', '永康市', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3249', '武义县', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3250', '浦江县', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3251', '磐安县', '3236', '255');
INSERT INTO `ecm_region` VALUES ('3252', '丽水', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3253', '莲都区', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3254', '龙泉市', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3255', '青田县', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3256', '缙云县', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3257', '遂昌县', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3258', '松阳县', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3259', '云和县', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3260', '庆元县', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3261', '景宁', '3252', '255');
INSERT INTO `ecm_region` VALUES ('3262', '宁波', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3263', '海曙区', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3264', '江东区', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3265', '江北区', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3266', '镇海区', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3267', '北仑区', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3268', '鄞州区', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3269', '余姚市', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3270', '慈溪市', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3271', '奉化市', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3272', '象山县', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3273', '宁海县', '3262', '255');
INSERT INTO `ecm_region` VALUES ('3274', '绍兴', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3275', '越城区', '3274', '255');
INSERT INTO `ecm_region` VALUES ('3276', '上虞市', '3274', '255');
INSERT INTO `ecm_region` VALUES ('3277', '嵊州市', '3274', '255');
INSERT INTO `ecm_region` VALUES ('3278', '绍兴县', '3274', '255');
INSERT INTO `ecm_region` VALUES ('3279', '新昌县', '3274', '255');
INSERT INTO `ecm_region` VALUES ('3280', '诸暨市', '3274', '255');
INSERT INTO `ecm_region` VALUES ('3281', '台州', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3282', '椒江区', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3283', '黄岩区', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3284', '路桥区', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3285', '温岭市', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3286', '临海市', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3287', '玉环县', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3288', '三门县', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3289', '天台县', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3290', '仙居县', '3281', '255');
INSERT INTO `ecm_region` VALUES ('3291', '温州', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3292', '鹿城区', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3293', '龙湾区', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3294', '瓯海区', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3295', '瑞安市', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3296', '乐清市', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3297', '洞头县', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3298', '永嘉县', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3299', '平阳县', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3300', '苍南县', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3301', '文成县', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3302', '泰顺县', '3291', '255');
INSERT INTO `ecm_region` VALUES ('3303', '舟山', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3304', '定海区', '3303', '255');
INSERT INTO `ecm_region` VALUES ('3305', '普陀区', '3303', '255');
INSERT INTO `ecm_region` VALUES ('3306', '岱山县', '3303', '255');
INSERT INTO `ecm_region` VALUES ('3307', '嵊泗县', '3303', '255');
INSERT INTO `ecm_region` VALUES ('3308', '衢州', '3206', '255');
INSERT INTO `ecm_region` VALUES ('3309', '衢州市', '3308', '255');
INSERT INTO `ecm_region` VALUES ('3310', '江山市', '3308', '255');
INSERT INTO `ecm_region` VALUES ('3311', '常山县', '3308', '255');
INSERT INTO `ecm_region` VALUES ('3312', '开化县', '3308', '255');
INSERT INTO `ecm_region` VALUES ('3313', '龙游县', '3308', '255');
INSERT INTO `ecm_region` VALUES ('3314', '重庆', '1', '255');
INSERT INTO `ecm_region` VALUES ('3315', '重庆', '3314', '255');
INSERT INTO `ecm_region` VALUES ('3316', '合川区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3317', '江津区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3318', '南川区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3319', '永川区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3320', '南岸区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3321', '渝北区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3322', '万盛区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3323', '大渡口区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3324', '万州区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3325', '北碚区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3326', '沙坪坝区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3327', '巴南区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3328', '涪陵区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3329', '江北区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3330', '九龙坡区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3331', '渝中区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3332', '黔江开发区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3333', '长寿区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3334', '双桥区', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3335', '綦江县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3336', '潼南县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3337', '铜梁县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3338', '大足县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3339', '荣昌县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3340', '璧山县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3341', '垫江县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3342', '武隆县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3343', '丰都县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3344', '城口县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3345', '梁平县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3346', '开县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3347', '巫溪县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3348', '巫山县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3349', '奉节县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3350', '云阳县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3351', '忠县', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3352', '石柱', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3353', '彭水', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3354', '酉阳', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3355', '秀山', '3315', '255');
INSERT INTO `ecm_region` VALUES ('3356', '香港', '1', '255');
INSERT INTO `ecm_region` VALUES ('3357', '香港', '3356', '255');
INSERT INTO `ecm_region` VALUES ('3358', '沙田区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3359', '东区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3360', '观塘区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3361', '黄大仙区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3362', '九龙城区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3363', '屯门区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3364', '葵青区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3365', '元朗区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3366', '深水埗区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3367', '西贡区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3368', '大埔区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3369', '湾仔区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3370', '油尖旺区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3371', '北区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3372', '南区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3373', '荃湾区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3374', '中西区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3375', '离岛区', '3357', '255');
INSERT INTO `ecm_region` VALUES ('3376', '澳门', '1', '255');
INSERT INTO `ecm_region` VALUES ('3377', '澳门', '3376', '255');
INSERT INTO `ecm_region` VALUES ('3378', '澳门', '3377', '255');
INSERT INTO `ecm_region` VALUES ('3379', '台湾', '1', '255');
INSERT INTO `ecm_region` VALUES ('3380', '台湾', '3379', '255');
INSERT INTO `ecm_region` VALUES ('3381', '台北', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3382', '高雄', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3383', '基隆', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3384', '台中', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3385', '台南', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3386', '新竹', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3387', '嘉义', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3388', '宜兰县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3389', '桃园县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3390', '苗栗县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3391', '彰化县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3392', '南投县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3393', '云林县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3394', '屏东县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3395', '台东县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3396', '花莲县', '3380', '255');
INSERT INTO `ecm_region` VALUES ('3397', '澎湖县', '3380', '255');

-- ----------------------------
-- Table structure for ecm_scategory
-- ----------------------------
DROP TABLE IF EXISTS `ecm_scategory`;
CREATE TABLE `ecm_scategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_scategory
-- ----------------------------
INSERT INTO `ecm_scategory` VALUES ('1', '个人穿戴', '0', '0');
INSERT INTO `ecm_scategory` VALUES ('2', '个人护理', '0', '1');
INSERT INTO `ecm_scategory` VALUES ('3', '数码设备', '0', '2');
INSERT INTO `ecm_scategory` VALUES ('4', '家用产品', '0', '3');
INSERT INTO `ecm_scategory` VALUES ('5', '吃喝保健', '0', '4');
INSERT INTO `ecm_scategory` VALUES ('6', '汽摩产品', '0', '5');
INSERT INTO `ecm_scategory` VALUES ('7', '宠物用品', '0', '6');
INSERT INTO `ecm_scategory` VALUES ('8', '礼品玩具', '0', '7');
INSERT INTO `ecm_scategory` VALUES ('9', '日用商品', '0', '8');
INSERT INTO `ecm_scategory` VALUES ('10', '收藏/爱好', '0', '255');
INSERT INTO `ecm_scategory` VALUES ('11', '游戏/话费', '0', '255');
INSERT INTO `ecm_scategory` VALUES ('12', '服务类别', '0', '255');
INSERT INTO `ecm_scategory` VALUES ('13', '其他类别', '0', '255');

-- ----------------------------
-- Table structure for ecm_sdcategory
-- ----------------------------
DROP TABLE IF EXISTS `ecm_sdcategory`;
CREATE TABLE `ecm_sdcategory` (
  `cate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `if_show` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_sdcategory
-- ----------------------------
INSERT INTO `ecm_sdcategory` VALUES ('1', '房屋出租', '0', '255', '1');
INSERT INTO `ecm_sdcategory` VALUES ('2', '汽车租赁', '0', '255', '1');
INSERT INTO `ecm_sdcategory` VALUES ('3', '跳蚤市场', '0', '255', '1');
INSERT INTO `ecm_sdcategory` VALUES ('4', '电子产品', '3', '1', '1');
INSERT INTO `ecm_sdcategory` VALUES ('5', '家电类', '3', '2', '1');

-- ----------------------------
-- Table structure for ecm_sdinfo
-- ----------------------------
DROP TABLE IF EXISTS `ecm_sdinfo`;
CREATE TABLE `ecm_sdinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cate_id` int(10) NOT NULL,
  `cate_name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `verify` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL,
  `price_from` decimal(10,2) NOT NULL,
  `price_to` decimal(10,2) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `images` varchar(255) NOT NULL,
  `verify_desc` varchar(100) NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `region_name` varchar(100) NOT NULL,
  `views` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_sdinfo
-- ----------------------------
INSERT INTO `ecm_sdinfo` VALUES ('1', '573', '1', '房屋出租', '3室一厅', '<p>示范11111</p>', '255', '1', '1111', '18888888', '1000.00', '1404240660', '0.00', '0.00', '1', '', '', '11', '厦门市', '32');
INSERT INTO `ecm_sdinfo` VALUES ('2', '3', '1', '房屋出租', '2古埯城城', '<p>霏霏地</p>', '255', '1', '随便坐就', '18585067260', '150.00', '1418628410', '0.00', '0.00', '1', '', '', '486', '中国	北京	北京', '2');

-- ----------------------------
-- Table structure for ecm_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ecm_sessions`;
CREATE TABLE `ecm_sessions` (
  `sesskey` char(32) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `adminid` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `data` char(255) NOT NULL DEFAULT '',
  `is_overflow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_sessions
-- ----------------------------
INSERT INTO `ecm_sessions` VALUES ('30ee03258e1d7c86498f4efdde827c0a', '1473729328', '0', '0', '127.0.0.1', 'user_info|a:6:{s:7:\"user_id\";s:1:\"2\";s:9:\"user_name\";s:6:\"seller\";s:8:\"reg_time\";s:10:\"1388031020\";s:10:\"last_login\";s:10:\"1473723266\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:8:\"store_id\";s:1:\"2\";}', '0');
INSERT INTO `ecm_sessions` VALUES ('54cd36a4be0adc9e0ff4ce01b51048dd', '1473729096', '0', '0', '192.168.123.53', 'user_info|a:6:{s:7:\"user_id\";s:1:\"6\";s:9:\"user_name\";s:5:\"test1\";s:8:\"reg_time\";s:10:\"1472412973\";s:10:\"last_login\";s:10:\"1473353396\";s:7:\"last_ip\";s:14:\"192.168.123.53\";s:8:\"store_id\";N;}', '0');
INSERT INTO `ecm_sessions` VALUES ('51cbd0b97cbcb980161c9db2efcb46a1', '1473797373', '0', '0', '192.168.123.53', 'user_info|a:6:{s:7:\"user_id\";s:1:\"5\";s:9:\"user_name\";s:12:\"小刚上阵\";s:8:\"reg_time\";s:10:\"1471562329\";s:10:\"last_login\";s:10:\"1473700721\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:8:\"store_id\";s:1:\"5\";}member_role|s:12:\"seller_admin\";', '0');
INSERT INTO `ecm_sessions` VALUES ('6b9653d59177f227a9b16763881b03cd', '1473733158', '0', '0', '127.0.0.1', '', '1');
INSERT INTO `ecm_sessions` VALUES ('1783ea46b71ad119af69b52f55366e83', '1473793817', '0', '0', '0.0.0.0', 'user_info|a:6:{s:7:\"user_id\";s:1:\"2\";s:9:\"user_name\";s:6:\"seller\";s:8:\"reg_time\";s:10:\"1388031020\";s:10:\"last_login\";s:10:\"1473728963\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:8:\"store_id\";s:1:\"2\";}', '0');
INSERT INTO `ecm_sessions` VALUES ('fe01ca525e85602a7a948ae15ec4c7ae', '1473797864', '0', '0', '127.0.0.1', '', '1');
INSERT INTO `ecm_sessions` VALUES ('ac8c504c8882a375b1429fe0af595d9d', '1473801005', '0', '0', '127.0.0.1', '', '1');

-- ----------------------------
-- Table structure for ecm_sessions_data
-- ----------------------------
DROP TABLE IF EXISTS `ecm_sessions_data`;
CREATE TABLE `ecm_sessions_data` (
  `sesskey` varchar(32) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_sessions_data
-- ----------------------------
INSERT INTO `ecm_sessions_data` VALUES ('ac8c504c8882a375b1429fe0af595d9d', '1473801005', 'member_role|s:12:\"seller_admin\";captcha|s:8:\"d2Ezaw==\";tuijian_id|s:1:\"8\";referid|s:1:\"8\";user_info|a:6:{s:7:\"user_id\";s:2:\"10\";s:9:\"user_name\";s:10:\"woshiqiye2\";s:8:\"reg_time\";s:10:\"1473790845\";s:10:\"last_login\";s:10:\"1473791356\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:8:\"store_id\";N;}');
INSERT INTO `ecm_sessions_data` VALUES ('fe01ca525e85602a7a948ae15ec4c7ae', '1473797864', 'member_role|s:12:\"seller_admin\";tuijian_id|s:1:\"9\";referid|s:1:\"9\";user_info|a:6:{s:7:\"user_id\";s:2:\"11\";s:9:\"user_name\";s:11:\"woshistore2\";s:8:\"reg_time\";s:10:\"1473794173\";s:10:\"last_login\";s:10:\"1473794173\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:8:\"store_id\";s:2:\"11\";}admin_info|a:5:{s:7:\"user_id\";s:1:\"1\";s:9:\"user_name\";s:5:\"admin\";s:8:\"reg_time\";s:10:\"1388016632\";s:10:\"last_login\";s:10:\"1473698106\";s:7:\"last_ip\";s:7:\"0.0.0.0\";}');
INSERT INTO `ecm_sessions_data` VALUES ('6b9653d59177f227a9b16763881b03cd', '1473733158', 'member_role|s:12:\"seller_admin\";email_captcha|s:8:\"MTExMQ==\";email_captcha_time|i:1473708545;captcha|s:8:\"eGh0Zg==\";user_info|a:6:{s:7:\"user_id\";s:1:\"9\";s:9:\"user_name\";s:10:\"woshistore\";s:8:\"reg_time\";s:10:\"1473221014\";s:10:\"last_login\";s:10:\"1473731607\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:8:\"store_id\";s:1:\"9\";}');

-- ----------------------------
-- Table structure for ecm_sgrade
-- ----------------------------
DROP TABLE IF EXISTS `ecm_sgrade`;
CREATE TABLE `ecm_sgrade` (
  `grade_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(60) NOT NULL DEFAULT '',
  `goods_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `space_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `skin_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `charge` varchar(100) NOT NULL DEFAULT '',
  `need_confirm` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `functions` varchar(255) DEFAULT NULL,
  `skins` text NOT NULL,
  `sort_order` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `wapskin_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `wapskins` text NOT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_sgrade
-- ----------------------------
INSERT INTO `ecm_sgrade` VALUES ('1', '普通店铺', '0', '0', '13', '', '1', '测试用户请选择“普通店铺”，可以立即开通。', 'editor_multimedia,coupon,groupbuy,enable_radar,enable_free_fee,template', 'colorful|default,default|default,default|style1,default|style2,default|style3,default|style4,default|style5,default|style6,default|style7,default|style8,jdlv|default,moolau|default,xiaomistore|default', '255', '26', 'default01|default,default02|default,default03|default,default04|default,default05|default,default06|default,default07|default,default08|default,default09|default,default10|default,default11|default,default12|default,default13|default,default14|default,default15|default,default16|default,default17|default,default18|default,default19|default,default20|default,default21|default,default22|default,default23|default,default24|default,default25|default,waimai|default');
INSERT INTO `ecm_sgrade` VALUES ('2', '旗舰店铺', '0', '0', '13', '100元/年', '1', '', 'editor_multimedia,coupon,groupbuy,enable_radar,enable_free_fee,template', 'colorful|default,default|default,default|style1,default|style2,default|style3,default|style4,default|style5,default|style6,default|style7,default|style8,jdlv|default,moolau|default,xiaomistore|default', '255', '26', 'default01|default,default02|default,default03|default,default04|default,default05|default,default06|default,default07|default,default08|default,default09|default,default10|default,default11|default,default12|default,default13|default,default14|default,default15|default,default16|default,default17|default,default18|default,default19|default,default20|default,default21|default,default22|default,default23|default,default24|default,default25|default,waimai|default');

-- ----------------------------
-- Table structure for ecm_shipping
-- ----------------------------
DROP TABLE IF EXISTS `ecm_shipping`;
CREATE TABLE `ecm_shipping` (
  `shipping_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_name` varchar(100) NOT NULL DEFAULT '',
  `shipping_desc` varchar(255) DEFAULT NULL,
  `first_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `step_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cod_regions` text,
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`shipping_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_shipping
-- ----------------------------
INSERT INTO `ecm_shipping` VALUES ('1', '2', '包邮', '', '0.00', '0.00', 'a:1:{i:1;s:6:\"中国\";}', '1', '255');
INSERT INTO `ecm_shipping` VALUES ('2', '5', '小刚的配送', '发送的', '8.00', '2.00', 'a:4:{i:2212;s:30:\"中国	山东	济南	市中区\";i:2213;s:30:\"中国	山东	济南	历下区\";i:2214;s:30:\"中国	山东	济南	天桥区\";i:2215;s:30:\"中国	山东	济南	槐荫区\";}', '1', '255');
INSERT INTO `ecm_shipping` VALUES ('3', '9', '快递', '物流快递', '0.00', '1.00', null, '1', '255');

-- ----------------------------
-- Table structure for ecm_store
-- ----------------------------
DROP TABLE IF EXISTS `ecm_store`;
CREATE TABLE `ecm_store` (
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_name` varchar(100) NOT NULL DEFAULT '',
  `owner_name` varchar(60) NOT NULL DEFAULT '',
  `owner_card` varchar(60) NOT NULL DEFAULT '',
  `region_id` int(10) unsigned DEFAULT NULL,
  `region_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(20) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `sgrade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `apply_remark` varchar(255) NOT NULL DEFAULT '',
  `credit_value` int(10) NOT NULL DEFAULT '0',
  `praise_rate` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `domain` varchar(60) DEFAULT NULL,
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `close_reason` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned DEFAULT NULL,
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `certification` varchar(255) DEFAULT NULL,
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `recommended` tinyint(4) NOT NULL DEFAULT '0',
  `theme` varchar(60) NOT NULL DEFAULT '',
  `store_banner` varchar(255) DEFAULT NULL,
  `store_logo` varchar(255) DEFAULT NULL,
  `description` text,
  `image_1` varchar(255) NOT NULL DEFAULT '',
  `image_2` varchar(255) NOT NULL DEFAULT '',
  `image_3` varchar(255) NOT NULL DEFAULT '',
  `im_qq` varchar(60) NOT NULL DEFAULT '',
  `im_ww` varchar(60) NOT NULL DEFAULT '',
  `im_msn` varchar(60) NOT NULL DEFAULT '',
  `hot_search` varchar(255) NOT NULL,
  `business_scope` varchar(50) NOT NULL,
  `online_service` varchar(255) NOT NULL,
  `hotline` varchar(255) NOT NULL,
  `pic_slides` text NOT NULL,
  `pic_slides_wap` text NOT NULL,
  `enable_groupbuy` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_radar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `waptheme` varchar(60) NOT NULL DEFAULT '',
  `amount_for_free_fee` int(255) DEFAULT NULL,
  `acount_for_free_fee` int(255) DEFAULT NULL,
  `send_address` varchar(255) NOT NULL,
  `operate_time` varchar(255) NOT NULL,
  `is_open_pay` tinyint(3) NOT NULL DEFAULT '1',
  `store_code` varchar(250) NOT NULL,
  `appkey` varchar(9) NOT NULL,
  `secretKey` varchar(32) NOT NULL,
  `lng` decimal(12,8) NOT NULL,
  `zoom` int(3) NOT NULL,
  `lat` decimal(12,8) NOT NULL,
  `is_open_storemap` tinyint(3) NOT NULL DEFAULT '0',
  `store_wei` varchar(255) DEFAULT NULL,
  `enable_slides` tinyint(3) unsigned NOT NULL,
  `is_affter` tinyint(3) unsigned NOT NULL,
  `reg_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `tuij_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `is_has` tinyint(3) NOT NULL DEFAULT '0',
  `is_open_shua` tinyint(3) NOT NULL DEFAULT '0',
  `images` varchar(60) NOT NULL,
  `storemail` varchar(50) DEFAULT NULL,
  `lxrname` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `sectname` varchar(30) DEFAULT NULL,
  `img_license` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  KEY `store_name` (`store_name`),
  KEY `owner_name` (`owner_name`),
  KEY `region_id` (`region_id`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_store
-- ----------------------------
INSERT INTO `ecm_store` VALUES ('2', '超级店铺', '超级店家', '', '0', '', '', '', '88888888', '2', '', '1', '100.00', '', '1', '', '1388031275', '0', 'autonym,material', '1', '1', 'colorful|default', null, null, '', '', '', '', '361818525', '微创动力源码', '', '微创动力微信商城,微信商城', '', '', '', '{\"1\":{\"url\":\"data/files/store_2/pic_slides/pic_slides_1.jpg\",\"link\":\"\"},\"2\":{\"url\":\"data/files/store_2/pic_slides/pic_slides_2.jpg\",\"link\":\"\"},\"3\":{\"url\":\"data/files/store_2/pic_slides/pic_slides_3.jpg\",\"link\":\"\"}}', '{\"1\":{\"url\":\"data/files/store_2/pic_slides_wap/pic_slides_wap_1.jpg\",\"link\":\"#\"},\"2\":{\"url\":\"data/files/store_2/pic_slides_wap/pic_slides_wap_2.jpg\",\"link\":\"#\"},\"3\":{\"url\":\"data/files/store_2/pic_slides_wap/pic_slides_wap_3.jpg\",\"link\":\"#\"}}', '1', '1', 'default03|default', '0', '0', '思明区', '09:00-23:00', '1', '', '', '', '0.00000000', '0', '0.00000000', '0', null, '0', '0', '0.00', '0.00', '0', '0', '', null, null, null, null, null);
INSERT INTO `ecm_store` VALUES ('5', '小刚的店', '肖文纲', '370781198906034036', '2214', '中国	山东	济南	天桥区', '重汽彩世界', '260000', '15689694786', '2', '', '0', '0.00', '', '1', '', '1471563169', '0', 'autonym,material', '2', '1', '', null, null, null, '', '', '', '', '', '', '', '', '', '', '', '', '0', '1', '', null, null, '济南市', '8:80-20:00', '1', '', '', '', '0.00000000', '0', '0.00000000', '0', null, '0', '0', '0.00', '0.00', '0', '0', '', null, null, null, null, null);
INSERT INTO `ecm_store` VALUES ('9', '小张的店', 'woshistore', '370103198711268818', '2214', '中国	山东	济南	天桥区', '天桥路8888号', '250116', '13964001247', '1', '', '0', '0.00', '', '1', '', '1473221993', '1588147200', 'autonym', '65535', '1', '', null, null, null, 'data/files/mall/application/store_9_1.png', 'data/files/mall/application/store_9_2.png', '', '', '', '', '', '', '', '', '', '', '0', '1', '', null, null, '山东济南', '', '1', '', '', '', '0.00000000', '0', '0.00000000', '0', null, '0', '1', '0.00', '0.00', '1', '1', '', null, null, null, null, null);
INSERT INTO `ecm_store` VALUES ('11', '越过的店', '爱国', '370103198811268846', '2212', '中国	山东	济南	市中区', '济微路88号', '250116', '15964001247', '1', '', '0', '0.00', null, '1', '', '1473794439', '0', null, '65535', '0', '', null, null, null, 'data/files/mall/application/store_11_1.png', 'data/files/mall/application/store_11_2.png', '', '', '', '', '', '', '', '', '', '', '0', '1', '', null, null, '', '', '1', '', '', '', '0.00000000', '0', '0.00000000', '0', null, '0', '0', '0.00', '0.00', '0', '0', '', 'woshistore2@qq.com', '', '', '', 'UPLOAD_PATH_BUS/img_license11.png');

-- ----------------------------
-- Table structure for ecm_storeworker
-- ----------------------------
DROP TABLE IF EXISTS `ecm_storeworker`;
CREATE TABLE `ecm_storeworker` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `workername` varchar(30) DEFAULT NULL,
  `workerphone` varchar(20) DEFAULT NULL,
  `sectid` int(50) DEFAULT NULL,
  `juese` varchar(30) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `store_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_storeworker
-- ----------------------------
INSERT INTO `ecm_storeworker` VALUES ('1', '肖文纲', '15689694786', '9', '员工', '', '2');
INSERT INTO `ecm_storeworker` VALUES ('2', '张一', '13964001247', '0', '1', '0', '9');

-- ----------------------------
-- Table structure for ecm_store_sect
-- ----------------------------
DROP TABLE IF EXISTS `ecm_store_sect`;
CREATE TABLE `ecm_store_sect` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `store_id` int(50) DEFAULT NULL,
  `sectname` varchar(30) DEFAULT NULL,
  `parent_id` int(50) DEFAULT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_store_sect
-- ----------------------------
INSERT INTO `ecm_store_sect` VALUES ('10', '2', '2222222', '9', '255');
INSERT INTO `ecm_store_sect` VALUES ('8', '2', '2222222222', '7', '255');
INSERT INTO `ecm_store_sect` VALUES ('9', '2', '12312312', '0', '255');
INSERT INTO `ecm_store_sect` VALUES ('11', '5', '测试部门', '0', '255');
INSERT INTO `ecm_store_sect` VALUES ('12', '5', '网络运营', '11', '255');
INSERT INTO `ecm_store_sect` VALUES ('13', '5', '部门2', '0', '255');
INSERT INTO `ecm_store_sect` VALUES ('14', '9', '一部', '0', '255');
INSERT INTO `ecm_store_sect` VALUES ('15', '11', 'store2部门', '0', '255');

-- ----------------------------
-- Table structure for ecm_ugrade
-- ----------------------------
DROP TABLE IF EXISTS `ecm_ugrade`;
CREATE TABLE `ecm_ugrade` (
  `grade_id` int(255) NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(255) NOT NULL,
  `grade` tinyint(3) NOT NULL,
  `grade_icon` varchar(255) DEFAULT NULL,
  `growth_needed` int(20) NOT NULL,
  `top_growth` int(20) DEFAULT NULL,
  `floor_growth` int(20) NOT NULL,
  `add_time` int(20) DEFAULT NULL,
  PRIMARY KEY (`grade_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_ugrade
-- ----------------------------
INSERT INTO `ecm_ugrade` VALUES ('1', '普通会员', '1', null, '0', '1000', '0', '1395866446');
INSERT INTO `ecm_ugrade` VALUES ('2', 'VIP等级', '2', null, '1000', null, '1000', '1422883598');

-- ----------------------------
-- Table structure for ecm_ultimate_store
-- ----------------------------
DROP TABLE IF EXISTS `ecm_ultimate_store`;
CREATE TABLE `ecm_ultimate_store` (
  `ultimate_id` int(255) NOT NULL AUTO_INCREMENT,
  `brand_id` int(50) NOT NULL,
  `keyword` varchar(20) NOT NULL,
  `cate_id` int(50) NOT NULL,
  `store_id` int(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ultimate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_ultimate_store
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_uploaded_file
-- ----------------------------
DROP TABLE IF EXISTS `ecm_uploaded_file`;
CREATE TABLE `ecm_uploaded_file` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(60) NOT NULL DEFAULT '',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_path` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `belong` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `BELONG_SDEMAND` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_uploaded_file
-- ----------------------------
INSERT INTO `ecm_uploaded_file` VALUES ('106', '2', 'image/jpeg', '84569', '20160223104150_x2jAC.jpeg', 'data/files/store_2/goods_11/201608190943317382.jpeg', '1471542211', '2', '101', '0');
INSERT INTO `ecm_uploaded_file` VALUES ('107', '2', 'image/jpeg', '84569', '20160223104150_x2jAC.jpeg', 'data/files/store_2/goods_38/201608190943582337.jpeg', '1471542238', '2', '100', '0');
INSERT INTO `ecm_uploaded_file` VALUES ('109', '9', 'image/png', '184262', 'QQ图片20160527170943.png', 'data/files/store_9/goods_129/201609091732097224.png', '1473384729', '2', '112', '0');

-- ----------------------------
-- Table structure for ecm_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ecm_user_coupon`;
CREATE TABLE `ecm_user_coupon` (
  `user_id` int(10) unsigned NOT NULL,
  `coupon_sn` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`coupon_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_user_coupon
-- ----------------------------
INSERT INTO `ecm_user_coupon` VALUES ('3', '000001069352');

-- ----------------------------
-- Table structure for ecm_user_priv
-- ----------------------------
DROP TABLE IF EXISTS `ecm_user_priv`;
CREATE TABLE `ecm_user_priv` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `privs` text NOT NULL,
  PRIMARY KEY (`user_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_user_priv
-- ----------------------------
INSERT INTO `ecm_user_priv` VALUES ('1', '0', 'all');
INSERT INTO `ecm_user_priv` VALUES ('2', '2', 'all');
INSERT INTO `ecm_user_priv` VALUES ('5', '5', 'all');
INSERT INTO `ecm_user_priv` VALUES ('9', '9', 'all');
INSERT INTO `ecm_user_priv` VALUES ('11', '11', 'all');

-- ----------------------------
-- Table structure for ecm_weixin_user
-- ----------------------------
DROP TABLE IF EXISTS `ecm_weixin_user`;
CREATE TABLE `ecm_weixin_user` (
  `uid` int(7) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subscribe` tinyint(1) unsigned NOT NULL,
  `wxid` char(28) NOT NULL,
  `nickname` varchar(200) NOT NULL,
  `sex` tinyint(1) unsigned NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `language` varchar(50) NOT NULL,
  `headimgurl` varchar(200) NOT NULL,
  `subscribe_time` int(10) unsigned NOT NULL,
  `localimgurl` varchar(200) NOT NULL,
  `setp` smallint(2) unsigned NOT NULL,
  `uname` varchar(50) NOT NULL,
  `coupon` varchar(30) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_weixin_user
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_wxch_qr
-- ----------------------------
DROP TABLE IF EXISTS `ecm_wxch_qr`;
CREATE TABLE `ecm_wxch_qr` (
  `qid` int(7) NOT NULL AUTO_INCREMENT,
  `wxid` char(28) NOT NULL,
  `type` varchar(2) NOT NULL,
  `expire_seconds` int(4) NOT NULL,
  `action_name` varchar(30) NOT NULL,
  `scene_id` int(7) NOT NULL,
  `ticket` varchar(120) NOT NULL,
  `scene` varchar(200) NOT NULL,
  `qr_path` varchar(200) NOT NULL,
  `subscribe` int(8) unsigned NOT NULL,
  `scan` int(8) unsigned NOT NULL,
  `function` varchar(100) NOT NULL,
  `affiliate` int(8) NOT NULL,
  `endtime` int(10) NOT NULL,
  `dateline` int(10) NOT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_wxch_qr
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_wxconfig
-- ----------------------------
DROP TABLE IF EXISTS `ecm_wxconfig`;
CREATE TABLE `ecm_wxconfig` (
  `w_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  `type` tinyint(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `pic` varchar(255) NOT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_wxconfig
-- ----------------------------
INSERT INTO `ecm_wxconfig` VALUES ('1', '2', 'http://vmall.vchuang.cn/index.php?app=weixin&id=2', 'R58XBq30', 'wx51e927c5decb591d', '02f934f7a02d50e748a3ad6a62158ad7', '0', '', '');

-- ----------------------------
-- Table structure for ecm_wxfile
-- ----------------------------
DROP TABLE IF EXISTS `ecm_wxfile`;
CREATE TABLE `ecm_wxfile` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `file_type` varchar(60) NOT NULL,
  `file_size` int(10) NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_wxfile
-- ----------------------------
INSERT INTO `ecm_wxfile` VALUES ('1', '2', 'image/jpeg', '81999', 'slider.jpg', 'data/files/mall/weixin/201406260253518453.jpg');
INSERT INTO `ecm_wxfile` VALUES ('2', '2', 'image/jpeg', '2895', 'icon.jpg', 'data/files/mall/weixin/201406260255406158.jpg');

-- ----------------------------
-- Table structure for ecm_wxkeyword
-- ----------------------------
DROP TABLE IF EXISTS `ecm_wxkeyword`;
CREATE TABLE `ecm_wxkeyword` (
  `kid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `kename` varchar(300) DEFAULT NULL,
  `kecontent` varchar(500) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:文本 2：图文',
  `kyword` varchar(255) DEFAULT NULL,
  `titles` varchar(1000) DEFAULT NULL,
  `imageinfo` varchar(1000) DEFAULT NULL,
  `linkinfo` varchar(1000) DEFAULT NULL,
  `ismess` tinyint(1) DEFAULT NULL,
  `isfollow` tinyint(1) DEFAULT NULL,
  `iskey` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_wxkeyword
-- ----------------------------
INSERT INTO `ecm_wxkeyword` VALUES ('1', '2', null, '', '2', null, 'a:4:{i:0;s:36:\"欢迎来到微创动力微信商城\";i:1;s:39:\"测试商品，点击进入测试购买\";i:2;s:30:\"演示微店铺，点击进入\";i:3;s:30:\"演示微商城，点击进入\";}', 'a:4:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";i:1;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";i:2;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";i:3;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";}', 'a:4:{i:0;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:1;s:49:\"http://vmall.vchuang.cn/index.php?app=goods&id=99\";i:2;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:3;s:23:\"http://vmall.vchuang.cn\";}', null, '1', null);
INSERT INTO `ecm_wxkeyword` VALUES ('5', '2', '微店铺', '', '2', '微店铺', 'a:2:{i:0;s:30:\"演示微店铺，点击进入\";i:1;s:39:\"测试商品，点击进入测试购买\";}', 'a:2:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";i:1;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";}', 'a:2:{i:0;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:1;s:49:\"http://vmall.vchuang.cn/index.php?app=goods&id=99\";}', null, null, '1');
INSERT INTO `ecm_wxkeyword` VALUES ('4', '2', null, '', '2', null, 'a:2:{i:0;s:36:\"欢迎来到微创动力微信商城\";i:1;s:39:\"测试商品，点击进入测试购买\";}', 'a:2:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";i:1;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";}', 'a:2:{i:0;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:1;s:49:\"http://vmall.vchuang.cn/index.php?app=goods&id=99\";}', '1', null, null);
INSERT INTO `ecm_wxkeyword` VALUES ('6', '2', '微商城', '', '2', '微商城', 'a:1:{i:0;s:30:\"演示微商城，点击进入\";}', 'a:1:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";}', 'a:1:{i:0;s:23:\"http://vmall.vchuang.cn\";}', null, null, '1');
INSERT INTO `ecm_wxkeyword` VALUES ('7', '2', '关于我们', '本演示站官方淘宝店：微创动力精品网站源码，淘宝旺旺：微创动力源码，客服QQ：361818525。请亲们仔细辨别，以免受骗！', '1', '关于我们', '', '', '', null, null, '1');

-- ----------------------------
-- Table structure for ecm_wxmenu
-- ----------------------------
DROP TABLE IF EXISTS `ecm_wxmenu`;
CREATE TABLE `ecm_wxmenu` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) DEFAULT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) DEFAULT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` varchar(100) DEFAULT NULL,
  `weixin_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:click 1:viwe',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `weixin_status` tinyint(1) NOT NULL DEFAULT '0',
  `weixin_keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `weixin_key` varchar(255) DEFAULT NULL COMMENT 'key值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_wxmenu
-- ----------------------------
INSERT INTO `ecm_wxmenu` VALUES ('2', '2', '微商城', ' ', '0', '0', '1422889277', '0', '', '0', '255', '1', '微商城', 'wsc123');
INSERT INTO `ecm_wxmenu` VALUES ('3', '2', '微店铺', ' ', '0', '0', '1422889296', '0', '', '0', '255', '1', '微店铺', 'wdp123');
INSERT INTO `ecm_wxmenu` VALUES ('4', '2', '关于我们', ' ', '0', '0', '1422889308', '0', '', '0', '255', '1', '关于我们', 'gywm');
INSERT INTO `ecm_wxmenu` VALUES ('5', '2', '演示店铺', ' ', '3', '3|', '1422889337', '0', ' ', '0', '255', '1', '微店铺', 'ysdp123');

-- ----------------------------
-- Table structure for ecm_wxmessage
-- ----------------------------
DROP TABLE IF EXISTS `ecm_wxmessage`;
CREATE TABLE `ecm_wxmessage` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `wxid` char(28) NOT NULL,
  `w_message` text NOT NULL,
  `message` text NOT NULL,
  `belong` int(9) unsigned NOT NULL,
  `dateline` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wxid` (`wxid`)
) ENGINE=MyISAM AUTO_INCREMENT=322 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_wxmessage
-- ----------------------------

-- ----------------------------
-- Table structure for ecm_wxrelation
-- ----------------------------
DROP TABLE IF EXISTS `ecm_wxrelation`;
CREATE TABLE `ecm_wxrelation` (
  `relation_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_openid` varchar(65) NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `store_openid` varchar(65) NOT NULL,
  `creat_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_wxrelation
-- ----------------------------
INSERT INTO `ecm_wxrelation` VALUES ('1', '2', 'oXivit1csCJgBR3o4pvQNbywJgYg', '2', 'gh_5d597e369768', '0', '0');

-- ----------------------------
-- Table structure for ecm_xincredit
-- ----------------------------
DROP TABLE IF EXISTS `ecm_xincredit`;
CREATE TABLE `ecm_xincredit` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `company_id` int(50) DEFAULT NULL,
  `edu` int(11) DEFAULT NULL,
  `seller_store_id` int(50) DEFAULT NULL,
  `seller_store_name` varchar(30) DEFAULT NULL,
  `beilei` varchar(5) DEFAULT NULL,
  `status` int(2) DEFAULT '0' COMMENT '0 未审核  1 审核过  2 为过',
  `shentime` int(20) DEFAULT NULL,
  `shenhetime` int(11) DEFAULT NULL,
  `zhangdanri` int(2) DEFAULT NULL,
  `jiesuanri` int(2) DEFAULT NULL,
  `shenpiedu` int(5) DEFAULT NULL,
  `why` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_xincredit
-- ----------------------------
INSERT INTO `ecm_xincredit` VALUES ('1', '某某测试', '2', '1000', '2', '超级店铺', 'shang', '1', '23412332', '1473405635', '9', '29', '3000', '');
INSERT INTO `ecm_xincredit` VALUES ('2', '默默朋', '1', '200', '3', '测试常德', 'shang', '1', '2342433', '1473405635', '9', '29', '3000', '');
INSERT INTO `ecm_xincredit` VALUES ('3', '某某', '2', '10000', '5', '小刚的店', 'shang', '1', '1472808528', '1473405635', '9', '29', '3000', '');
INSERT INTO `ecm_xincredit` VALUES ('5', '我是企业', '5', '5000', '9', '小张的店', 'shang', '0', '1473234921', '1473406950', '9', '29', '400', '');
INSERT INTO `ecm_xincredit` VALUES ('6', '我是企业', '5', '3000', '5', '', 'shang', '0', '1473385077', '1473405635', null, null, null, '');
INSERT INTO `ecm_xincredit` VALUES ('7', '糖果果', '6', '1000', '11', '', 'shang', '1', '1473824971', '1473825054', '14', '4', '500', null);

-- ----------------------------
-- Table structure for ecm_zhangdan
-- ----------------------------
DROP TABLE IF EXISTS `ecm_zhangdan`;
CREATE TABLE `ecm_zhangdan` (
  `id` int(50) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(50) DEFAULT NULL,
  `company_name` varchar(30) DEFAULT '0' COMMENT '0 表示未结算  1 表示已结算',
  `status` int(1) DEFAULT NULL,
  `store_id` int(50) DEFAULT NULL,
  `leijimony` varchar(10) DEFAULT NULL,
  `jiesuanri` varchar(5) DEFAULT NULL,
  `zhangdanri` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ecm_zhangdan
-- ----------------------------
INSERT INTO `ecm_zhangdan` VALUES ('1', '2', '某某测试', '1', '2', '999', '22', '2');
