insert into dims_tm_res_index (ID, NAME, SPECIALITYNAME, ENTITYTYPE_ID, ATTRIBUTETYPE_ID, DICTIONARYTYPE_ID, FILTERCONDITION, METHODTYPE,UNIT, PROCNAME, ISENABLE,  MEMO) values
--(800000000,'2G基站','无线','901000003','901000624','901000638','lifecycle_status=''在网''','count','个','proc_countresource',1,null);
--无线
(800000000,'2G基站','无线','901000003','901000624','901000638',null,'count','个','proc_countresource',1,null),
(800000001,'4G基站','无线','901000004','901000645','901000660',null,'count','个','proc_countresource',1,null),
(800000002,'5G基站','无线','901000005','901000669','901000684',null,'count','个','proc_countresource',1,null),
(800000003,'2G小区','无线','901000007','901000709','901000722',null,'count','个','proc_countresource',1,null),
(800000004,'4G小区','无线','901000008','901000730','901000744',null,'count','个','proc_countresource',1,null),
(800000005,'5G小区','无线','901000009','901000752','901000766',null,'count','个','proc_countresource',1,null),

--空间
(800000006,'站点','空间','902001001','902001301','902001305',null,'count','个','proc_countresource',1,null),
(800000007,'位置点','空间','902001002','902001317','902001322',null,'count','个','proc_countresource',1,null),
(800000008,'机房','空间','902001003','902001331','902001341','lifecycle_status=''在网''','count','个','proc_countresource',1,null),
(800000009,'机架位置','空间','902001004','902001360','902001366',null,'count','个','proc_countresource',1,null),

--动环
(800000010,'站点动环属性','动环','907001501','907001801','907001806',null,'count','个','proc_countresource',1,null),
(800000011,'机房动环属性','动环','907001502','907001817','907001822',null,'count','个','proc_countresource',1,null),
(800000012,'开关电源','动环','907001515','907002042','907002062',null,'count','个','proc_countresource',1,null),
(800000013,'UPS设备','动环','907001518','907002101','907002118',null,'count','个','proc_countresource',1,null),
(800000014,'蓄电池','动环','907001519','907002121','907002139',null,'count','个','proc_countresource',1,null),
(800000015,'发电机组','动环','907001513','907002004','907002026','device_subclass!=''移动发电机''','count','个','proc_countresource',1,null),
(800000016,'跨专业输出分路','动环','907001525','907002253','907002266',null,'count','个','proc_countresource',1,null),

--传输内线
--槽位  时隙  文本路由
(800000017,'EMS','传输内线','903001001','903001301','903001304',null,'count','个','proc_countresource',1,null),
(800000018,'传输系统','传输内线','903001003','903001311','903001318',null,'count','个','proc_countresource',1,null),
(800000019,'网元','传输内线','903001004','903001322','903001325',null,'count','个','proc_countresource',1,null),
--(800000020,'板卡','传输内线','903001005','903001339','',null,'count','个','proc_countresource',1,null),
(800000021,'端口','传输内线','903001006','903001348','903001350',null,'count','个','proc_countresource',1,null),
--(800000022,'端口连接','传输内线','903001008','903001373','',null,'count','个','proc_countresource',1,null),
--(800000023,'光通道（OCH）（波分）','传输内线','903001009','903001390','',null,'count','个','proc_countresource',1,null),
(800000024,'业务通道（波分）','传输内线','903001012','903001433','903001446',null,'count','个','proc_countresource',1,null),
(800000025,'SDH通道','传输内线','903001013','903001450','903001465',null,'count','个','proc_countresource',1,null),
--(800000026,'隧道','传输内线','903001014','903001470','',null,'count','个','proc_countresource',1,null),
(800000027,'传输电路_电路级别','传输内线','903001016','903001508','903001512',null,'count','个','proc_countresource',1,null),
(800000028,'传输电路_承载方式','传输内线','903001016','903001508','903001531',null,'count','个','proc_countresource',1,null),
(800000029,'保护组','传输内线','903001017','903001645','903001541',null,'count','个','proc_countresource',1,null),
(800000030,'L3VPN-基本信息（SPN)','传输内线','903001018','903001544','903001546',null,'count','个','proc_countresource',1,null),
(800000031,'SR隧道（SPN）','传输内线','903001021','903001581','903001584',null,'count','个','proc_countresource',1,null),
(800000032,'MtnChannel（SPN）','传输内线','903001026','903001633','903001636',null,'count','个','proc_countresource',1,null),

--传输管线
(800000033,'光缆段','传输管线','904001006','904001385','904001374','lifecycle_status=''在网''','sum','皮长公里','proc_countresource',1,null),
--光路 敷设段 光设施 设施点		都是查询表里所有数据	


--承载网
(800000034,'设备_网元类型','承载网','905000500','905000600','905000606',null,'count','个','proc_countresource',1,null),
(800000035,'设备_5G-CE','承载网','905000500','905000600','905000604','5G-CE is not null','count','个','proc_countresource',1,null),
(800000036,'设备_5G-CE','承载网','905000500','905000600','905000614',null,'count','个','proc_countresource',1,null);