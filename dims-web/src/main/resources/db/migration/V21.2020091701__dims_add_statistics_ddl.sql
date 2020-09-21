drop table if exists dims_tm_res_statistics;

drop sequence if exists seq_dims_tm_res_statistics;

create sequence seq_dims_tm_res_statistics;

create table dims_tm_res_statistics
(
	   id                 integer primary key default nextval('seq_dims_tm_res_statistics'),
	   resIndex           integer,--指标id
	   taskCode	          varchar(100),
	   collectionDate     timestamp default current_timestamp not null,--采集日期
	   province	          varchar(100),--省份
 	   prefecture         varchar(100),--地市
       county	          varchar(100),--区县
	   provinceCode	      varchar(100),--省份code
	   prefectureCode     varchar(100),--地市code
       countyCode	      varchar(100),--区县code
	   regionType	      smallint,--指标区域属性：1省，2地市，3区县
	   specialityName	  varchar(100),--专业名称
	   resName            varchar(100),--资源名称
	   resType            varchar(100),--资源类型
	   amount              integer,--总数
	   unit               varchar(100),--单位
	   memo               varchar(200)--备注
);

drop table if exists dims_tm_res_index;

drop sequence if exists seq_dims_tm_res_index;

create sequence seq_dims_tm_res_index;

create table dims_tm_res_index
(
	   id                 integer primary key default nextval('seq_dims_tm_res_index'),
	   name               varchar(100),--指标名称或描述
	   specialityName	  varchar(100),--专业名称
	   entitytype_id	  integer not null references dims_mm_entitytype(id),--核查对象类型
	   attributeType_id   integer not null references dims_mm_attributetype(id),--统计字段，用于sum
	   dictionaryType_id  integer not null references dims_mm_attributetype(id),--对应字典字段，用于group by
	   filterCondition      varchar(100),--过滤条件
	   methodType			  varchar(100),--统计方法：count/sum
	   unit               varchar(100),--单位
	   procName	          varchar(100) ,--存过名称,参数都是：省份编码、任务编码、指标ID
	   isEnable           smallint,--是否启用：1是，2否
	   memo               varchar(200)--备注
);
