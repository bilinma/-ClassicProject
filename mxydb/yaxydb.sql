--延安中小企业信用担保前台子系统建表脚本
--删除数据库
drop database  if exists yaxydb;

--创建数据库
create database if not exists yaxydb default character set utf8;

use yaxydb;

-- 系统模块表
drop table if exists t_module;
create table t_module (
	id int primary key auto_increment,
	name varchar(50) NOT NULL,
	url  varchar(50) default NULL
);

--系统栏目表
drop table if exists t_section ;
create table t_section(
	id int primary key auto_increment,
	name varchar(50) NOT NULL,
	urlname varchar(50)DEFAULT NULL,
	author varchar(50) DEFAULT NULL,
	mid int NOT NULL,
	foreign key(mid) references t_module(id)
);

--系统信息表
drop table if exists t_information;
create table t_information(
	id int primary key auto_increment,
	name varchar(50) NOT NULL,
	author varchar(50),
	createdate date NOT NULL,
	autdit varchar(50),
	releaseunit varchar(100),
	scansum int,
	context text,
	imgurl varchar(50) DEFAULT NULL,
	mid int NOT NULL,
	mname varchar(50) NOT NULL,
	sid int NOT NULL,
	sname varchar(50) NOT NULL,
	foreign key(mid) references t_module(id),
	foreign key(sid) references t_section(id)
);
--系统公告信息表
drop table if exists t_affiche;
create table t_affiche(
	id int primary key auto_increment,
	name varchar(50) NOT NULL,
	simplename varchar(50),
	author varchar(50),
	createdate date NOT NULL,
	autdit varchar(50),
	releaseunit varchar(100),
	context text,
	scansum int
);

--系统友情链接表
drop table if exists t_friendshipConn;
create table t_friendshipConn (
	id int primary key auto_increment,
	name varchar(50) NOT NULL,
	url  varchar(50)
);

--创建附件表
drop table if exists t_file;
create table t_file(
	id int primary key auto_increment,
	name varchar(100),
	caption text,
	inforid int,
	foreign key(inforid) references t_information(id)
);


--系统脚本初始化
delete from t_module;
delete from t_section;
delete from t_information;
delete from t_friendshipConn;
delete from t_file;

commit;

-- 系统模块表基本数据
insert into t_module(id,name,url) values(1,"关于我们","aboutus/aboutusIndex.action");
insert into t_module(id,name,url) values(2,"新闻资讯","news/newsIndex.action");
insert into t_module(id,name,url) values(3,"政策法规","policy/policyIndex.action");
insert into t_module(id,name,url) values(4,"业务内容","operation/operationIndex.action");
commit;
-- 栏目表基本数据
insert into t_section(id,name,urlname,author,mid) values(1,'公司简介','corpIntorduce.action',"建鹏",1);
insert into t_section(id,name,urlname,author,mid) values(2,'领导致辞','managerWord.action',"建鹏",1);
insert into t_section(id,name,urlname,author,mid) values(3,'组织机构','organiZation.action',"建鹏",1);
insert into t_section(id,name,urlname,author,mid) values(4,'成长历程','growExperi.action',"建鹏",1);
insert into t_section(id,name,urlname,author,mid) values(5,'企业荣誉','corpCredit.action',"马小斌",1);
insert into t_section(id,name,urlname,author,mid) values(6,'经营理念','operateThink.action',"马小斌",1);
insert into t_section(id,name,urlname,author,mid) values(7,'项目经理','proManager.action',"马小斌",1);
insert into t_section(id,name,urlname,author,mid) values(8,'招贤纳士','corpJobs.action',"马小斌",1);
insert into t_section(id,name,urlname,author,mid) values(9,'联系我们','relationUs.action',"马小斌",1);
commit;
insert into t_section(id,name,urlname,author,mid) values(10,'公司新闻','corpNews.action',"建鹏",2);
insert into t_section(id,name,urlname,author,mid) values(11,'行业资讯','industryNews.action',"建鹏",2);
insert into t_section(id,name,urlname,author,mid) values(12,'媒体报道','mediaReport.action',"建鹏",2);
insert into t_section(id,name,urlname,author,mid) values(13,'公司简讯','corpInfo.action',"马小斌",2);
commit;
insert into t_section(id,name,urlname,author,mid) values(14,'国家法规','countryLaw.action',"马小斌",3);
insert into t_section(id,name,urlname,author,mid) values(15,'地方法规','localLaw.action',"马小斌",3);
insert into t_section(id,name,urlname,author,mid) values(16,'行业法规','industryLaw.action',"马小斌",3);
commit;
insert into t_section(id,name,urlname,author,mid) values(17,'业务范围','businessArea.action',"马小斌",4);
insert into t_section(id,name,urlname,author,mid) values(18,'业务流程','businessProc.action',"建鹏",4);
insert into t_section(id,name,urlname,author,mid) values(19,'反担保措施','opposeDeal.action',"马小斌",4);
insert into t_section(id,name,urlname,author,mid) values(20,'担保业务办理问答','businessAnswer.action',"马小斌",4);
commit;

select * from t_section 
--友情链接表基本数据
insert into t_friendshipConn(id,name,url) values(1,'陕西省中小企业促进局','http://www.smte.gov.cn/');
insert into t_friendshipConn(id,name,url) values(2,'中国中小企业信息网','http://www.sme.gov.cn/');
insert into t_friendshipConn(id,name,url) values(3,'中国银行','http://www.boc.cn/');
insert into t_friendshipConn(id,name,url) values(4,'中国农业银行','ttp://www.andadb.com/');
insert into t_friendshipConn(id,name,url) values(5,'中国工商银行','http://www.icbc.com.cn/');
commit;


--网站公告表基本数据
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(1,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','科长',now(),'小强','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(2,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','赵昆',now(),'小强','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(3,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','科长',now(),'小强','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(4,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','赵昆',now(),'小强','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(5,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','科长',now(),'小昭','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(6,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','科长',now(),'小昭','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(7,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','科长',now(),'小昭','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(8,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','科长',now(),'小昭','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);
insert into t_affiche(id,name,simplename,author,createdate,autdit,releaseunit,context,scansum ) 
		values(9,'关于受理社会各界对延安市中小企业信用担保有限责任公司担保贷款监督举报的公告','关于受理社会…','赵昆',now(),'小昭','11#612',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。"
		,10);

--------------------------------------------信息表基本数据-------------------------------------------
--新闻资讯
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(1,'中央35亿扶持中小企业 明确六项政策','11#612',now(),'建鹏','延安大学',"据新华社电 财政部昨日表示，为帮助解决中小企业发展中面临的困难和问题，中央财政今年以来明确了六大政策，安排中小企业专项资金35.1亿元，支持中小企业健康发展。

　　据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。

　　■ 六项政策

　　1.发挥财政政策导向作用，引导中小企业调整企业结构、节能减排
　　2.完善科技创新政策体系
　　3.促进信用担保体系建设
　　4.实施中小企业税收优惠
　　5.完善政府采购制度
　　6.清理行政事业性收费  
		",10,2,'新闻资讯',11,'行业资讯');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(2,'上半年我省非公经济发展再获新突破','11#612',now(),'建鹏','延安大学',"本报讯 （记者 林琳）占全省经济总量近“半壁江山”的非公经济上半年发展又有新突破。7月18日,记者从全省非公有制企业、中小企业上半年经济运行形势分析会上获悉，我省非公有制企业实现营业收入、增加值、利润总额、实交税金同比增长17.3％、17.2％、15.7％和19.6％，成为上半年“领跑”陕西经济的“主力军”。

　　今年以来，我省除在自主创业、税收、工商管理等领域出台大量扶持非公经济发展优惠措施外，还进一步加大财政扶持力度，积极争取金融、铁路、电力、交通等部门的支持，千方百计帮助企业缓解经济运行中的突出问题，确保了非公经济的快速发展。

　　1—6月份，全省规模以上工业增势强劲，以家庭工业为主体的规模以下工业发展加快。全省中小工业、非公有制工业实现营业收入1870亿元、增加值506亿元，同比分别增长20.74％和19％；其中规模以上工业实现营业收入、利润总额同比分别增长21.3％和18.1％；规模以下工业实现营业收入、利润总额，同比分别增长20.2％和26％。

　　县域工业园区成为吸引东部产业转移、规模企业聚集，技术创新和产品升级，壮大支柱产业和培育经济增长点的重要力量。上半年，全省138个中小企业园区实现营业收入约480亿元，同比增长26％。另外，农副产品加工业出口交货值增幅较大，带动农民增收作用明显。全省农产品加工业上半年实现营业收入250亿元，利润总额15.4亿元，同比分别增长16.9％和12.5％。全省中小企业支付劳动者报酬179.7亿元，为全省农民提供工资性收入108亿元，支付农产品收购款50亿元。 
		",10,2,'新闻资讯',12,'媒体报道');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(3,'延安市中小企业2008年一季度经济运行分析报告','11#612',now(),'建鹏','延安大学'," 2008年，延安市中小企业、非公有制经济和乡镇企业发展以党的十七大精神为指导，全面落实科学发展观，立足跨越发展，围绕“三大战略”，突出“八个重点”，实现非公有制经济突破，不断增加企业数量，扩大企业规模，提高发展水平。突出的八个重点是：围绕能源化工强市，实施中小企业成长工程；围绕绿色产业富民，扶持发展农产品加工业；围绕红色旅游兴业，大力发展第三产业；围绕农民就业增收，着力发展劳动密集型企业；围绕农村城镇化，着力发展产业集群型企业；围绕自主创新，着力发展科技型企业；围绕可持续发展战略，着力发展循环经济型企业；以科技进步和技术创新为动力，以深化改革和建立现代企业制度为基本要求，以结构调整为主线，以项目建设为重点，提高自主创新能力，走新型工业化道路，切实转变经济增长方式，积极探索，大胆创新。使全市中小企业截止三月份各项主要经济指标均衡稳步增长，呈现了平稳发展的良好局面。

　　一、中小企业发展基本情况

　　截止3月底,全市中小企业实现增加值16.69亿元,同比增长14.6%,其中工业增加值3.10亿元,同比增长12.91%;营业收入67.13亿元,同比增长13.27%;利润总额7.66亿元,同比增长11.91%;上交税金2.84亿元,同比增长9.31%;现价总产值49.81亿元,同比增长13.86%。

		",10,2,'新闻资讯',11,'行业资讯');
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(4,'延安市规模企业发展势头强劲','11#612',now(),'建鹏','延安大学'," 2008年，延安市中小企业、非公有制经济和乡镇企业发展以党的十七大精神为指导，全面落实科学发展观，立足跨越发展，围绕“三大战略”，突出“八个重点”，实现非公有制经济突破，不断增加企业数量，扩大企业规模，提高发展水平。突出的八个重点是：围绕能源化工强市，实施中小企业成长工程；围绕绿色产业富民，扶持发展农产品加工业；围绕红色旅游兴业，大力发展第三产业；围绕农民就业增收，着力发展劳动密集型企业；围绕农村城镇化，着力发展产业集群型企业；围绕自主创新，着力发展科技型企业；围绕可持续发展战略，着力发展循环经济型企业；以科技进步和技术创新为动力，以深化改革和建立现代企业制度为基本要求，以结构调整为主线，以项目建设为重点，提高自主创新能力，走新型工业化道路，切实转变经济增长方式，积极探索，大胆创新。使全市中小企业截止三月份各项主要经济指标均衡稳步增长，呈现了平稳发展的良好局面。

　　一、中小企业发展基本情况

　　截止3月底,全市中小企业实现增加值16.69亿元,同比增长14.6%,其中工业增加值3.10亿元,同比增长12.91%;营业收入67.13亿元,同比增长13.27%;利润总额7.66亿元,同比增长11.91%;上交税金2.84亿元,同比增长9.31%;现价总产值49.81亿元,同比增长13.86%。

		",10,2,'新闻资讯',11,'行业资讯');
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(5,'李子彬：中小企业下半年资金压力加大','11#612',now(),'建鹏','延安大学'," 2008年，延安市中小企业、非公有制经济和乡镇企业发展以党的十七大精神为指导，全面落实科学发展观，立足跨越发展，围绕“三大战略”，突出“八个重点”，实现非公有制经济突破，不断增加企业数量，扩大企业规模，提高发展水平。突出的八个重点是：围绕能源化工强市，实施中小企业成长工程；围绕绿色产业富民，扶持发展农产品加工业；围绕红色旅游兴业，大力发展第三产业；围绕农民就业增收，着力发展劳动密集型企业；围绕农村城镇化，着力发展产业集群型企业；围绕自主创新，着力发展科技型企业；围绕可持续发展战略，着力发展循环经济型企业；以科技进步和技术创新为动力，以深化改革和建立现代企业制度为基本要求，以结构调整为主线，以项目建设为重点，提高自主创新能力，走新型工业化道路，切实转变经济增长方式，积极探索，大胆创新。使全市中小企业截止三月份各项主要经济指标均衡稳步增长，呈现了平稳发展的良好局面。

　　一、中小企业发展基本情况

　　截止3月底,全市中小企业实现增加值16.69亿元,同比增长14.6%,其中工业增加值3.10亿元,同比增长12.91%;营业收入67.13亿元,同比增长13.27%;利润总额7.66亿元,同比增长11.91%;上交税金2.84亿元,同比增长9.31%;现价总产值49.81亿元,同比增长13.86%。

		",10,2,'新闻资讯',11,'行业资讯');
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(6,'前五月我省国民经济持续稳定发展','11#612',now(),'建鹏','延安大学'," 2008年，延安市中小企业、非公有制经济和乡镇企业发展以党的十七大精神为指导，全面落实科学发展观，立足跨越发展，围绕“三大战略”，突出“八个重点”，实现非公有制经济突破，不断增加企业数量，扩大企业规模，提高发展水平。突出的八个重点是：围绕能源化工强市，实施中小企业成长工程；围绕绿色产业富民，扶持发展农产品加工业；围绕红色旅游兴业，大力发展第三产业；围绕农民就业增收，着力发展劳动密集型企业；围绕农村城镇化，着力发展产业集群型企业；围绕自主创新，着力发展科技型企业；围绕可持续发展战略，着力发展循环经济型企业；以科技进步和技术创新为动力，以深化改革和建立现代企业制度为基本要求，以结构调整为主线，以项目建设为重点，提高自主创新能力，走新型工业化道路，切实转变经济增长方式，积极探索，大胆创新。使全市中小企业截止三月份各项主要经济指标均衡稳步增长，呈现了平稳发展的良好局面。

　　一、中小企业发展基本情况

　　截止3月底,全市中小企业实现增加值16.69亿元,同比增长14.6%,其中工业增加值3.10亿元,同比增长12.91%;营业收入67.13亿元,同比增长13.27%;利润总额7.66亿元,同比增长11.91%;上交税金2.84亿元,同比增长9.31%;现价总产值49.81亿元,同比增长13.86%。

		",10,2,'新闻资讯',11,'行业资讯');

--政策法规		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(7,'陕西省中小企业信用担保业管理试行办法','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(8,'中小企业融资担保机构风险管理暂行办法','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(9,'最高人民法院关于适用《中华人民共和国担…','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(10,'中国人民银行征信中心应收账款质押登记操…','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(11,'中国人民银行信用评级管理指导意见','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(12,'境内机构对外担保管理办法','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(13,'应收帐款质押登记办法','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(14,'中华人民共和国物权法','11#612',now(),'科长','延安大学',"据财政部介绍，在这六大政策中，首要是发挥财政政策导向作用，引导中小企业调整企业结构、节能减排，开拓国内和国际市场，加快中小企业公共服务体系建设。

　　二是完善科技创新政策体系，支持中小企业创业和技术创新。今年中央财政安排科技型中小企业技术创新基金14亿元，同比增长27.3%。

　　三是促进信用担保体系建设，改善中小企业融资环境。按照国务院部署，引导金融机构开展小额担保信贷业务。

　　四是实施中小企业税收优惠政策，促进中小企业发展。对符合条件的小型微利企业，减按20%的税率征收企业所得税。

　　五是完善政府采购制度，拓宽中小企业市场空间。财政部将于近期制定《中小企业政府采购管理办法》，推动各级政府将政府采购资金向中小企业倾斜。

　　六是清理行政事业性收费，减轻中小企业负担。全面清理和检查对中小企业的各种行政事业性收费（基金），整顿和取消涉及企业的不合理收费（基金）。从2008年9月1日起，在全国统一停征个体工商户管理费和集贸市场管理费。
		",12,3,'政策法规',16,'行业法规');
		
		
--公司简讯		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(15,'国家开发银行陕西省分行领导深入我市中小企业考察','yadbadmin888',now(),'豪杰','研发队',"11月12日，国家开发银行陕西省分行副行长许龙章一行，深入我市姚店工业园及甘泉县，对延安嘉盛石油机械有限责任公司、延安延昌工贸有限责任公司、陕西兴银国际贸易有限公司、甘泉刺榆酿造有限责任公司、延安甘泉八千里食品有限责任公司等7户进行了考察。考察期间，许行长一行深入中小企业的生产车间和经营场所，详细了解生产流程和经营情况，与有关企业负责人就开行如何扶持中小企业发展交换了意见。并对我市中小企业担保贷款业务的开展给予了充分肯定。
		",50,2,'新闻资讯',13,'公司简讯');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(16,'简讯','yadbadmin888',now(),'赵昆','研发队',"9月12日上午和9月19日上午，延安市中小企业信用担保贷款项目审贷委员会在延安市人民政府二楼会议室，召开了全市第二批拟上报国家开发银行陕西省分行中小企业贷款申请项目。这次提交会议研究的中小企业贷款申请项目共36个，会议以投票表决方式对申请担保项目进行了表决。",50,2,'新闻资讯',13,'公司简讯');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(17,'关于按期支付省开行贷款利息的通知','yadbadmin888',now(),'豪杰','研发队',"各担保贷款客户：
　　国家开发银行陕西省分行（简称省开行）今年在我市开展中小企业贷款业务，市政府为开展此项贷款业务设立的借款平台（城投公司或投资公司）、担保平台（市中小企业信用担保公司）以及市内各中小企业都处于信用积累阶段。为了建立良好的信用合作关系，积累各企业诚信分值，请已经获得市担保公司担保贷款的各客户，按照借款合同约定的结息日：每季度最后一个月的20日前（遇休假日时间提前）将应付贷款利息全额汇入指定的银行账户。否则，省开行将对我市的借款平台、担保平台和用款企业扣减诚信分值，影响后续贷款申请。严重违约者，除承担省开行的罚息外，将取消省开行贷款申请资格。
　　特此通知。
		",50,2,'新闻资讯',13,'公司简讯');
		
--关于我们	
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(18,'联系我们','yadbadmin888',now(),'社长','研发队',"电话：0911-8231231
															Email: liujianpeng@163.com",50,1,'关于我们',9,'联系我们');
		
insert into t_information(id,name,author,createdate,autdit,releaseunit,context,scansum,mid,mname,sid,sname ) 
		values(19,'公司简介','yadbadmin888',now(),'社长','研发队',"",50,1,'关于我们',1,'公司简介');







--测试语句
select name ,createdate
from t_information
order by createdate
limit 2;


select * 
from t_information 
where mname="新闻资讯";

select *
from  t_information
where  imgurl is not null and imgurl!=''
order by createdate desc;
