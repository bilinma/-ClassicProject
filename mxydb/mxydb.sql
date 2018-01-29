--延安中小企业信用担保后台系统建表脚本
use yaxydb;

-- 管理员表
drop table if exists t_admin;
create table t_admin (
	id int primary key auto_increment,
	name varchar(20),
	loginname varchar(20) unique,
	loginpassword varchar(20),
	phone varchar(20),
	email varchar(30),
	enrolldate date
);
-- 权限表
drop table if exists t_right;
create table t_right (
	id int primary key auto_increment,
	name varchar(20),
	url varchar(50)
);

--管理员权限关系表
drop table if exists t_adminrigh;
create table t_adminright (
	id int primary key auto_increment,
	adminid int,
	rightid int,
	foreign key(adminid) references t_admin(id),
	foreign key(rightid) references t_right(id)
);


select * from t_admin
--管理员表数据
insert into t_admin(id,name,loginname,loginpassword,phone,email,enrolldate) values(1,"建鹏","admin","admin","15801664915","jianpeng@126.com",now());

--用户权限表
insert into	t_right(id,name,url) values(1,'管理员管理','listAdmin.action');
insert into	t_right(id,name,url) values(2,'栏目管理','listModule.action');
insert into	t_right(id,name,url) values(3,'子栏目管理','listSection.action');
insert into	t_right(id,name,url) values(4,'信息管理','listInformation.action');
insert into	t_right(id,name,url) values(5,'公告管理','listAffiche.action');
insert into	t_right(id,name,url) values(6,'友情链接管理','listFriendshipConn.action');
commit;
--管理员权限关系表
insert into t_adminright(id,adminid,rightid) values(1,1,1); 
insert into t_adminright(id,adminid,rightid) values(2,1,2); 
insert into t_adminright(id,adminid,rightid) values(3,1,3); 
insert into t_adminright(id,adminid,rightid) values(4,1,4); 
insert into t_adminright(id,adminid,rightid) values(5,1,5); 
insert into t_adminright(id,adminid,rightid) values(6,1,6); 
commit;


