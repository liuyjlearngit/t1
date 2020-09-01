drop table if exists dims_idx_rule;
drop table if exists dims_idx_IndexCarrier;
drop table if exists dims_idx_index;
drop table if exists dims_mm_attributetype;
drop table if exists dims_mm_entitytype;
drop table if exists dims_mm_dictionary;
drop table if exists dims_mm_dictionarytype;
drop table if exists dims_tm_areaCodeConfig;
drop table if exists dims_tm_coordinateConfig;

drop sequence if exists seq_dims_mm_dictionarytype;
drop sequence if exists seq_dims_mm_dictionary;
drop sequence if exists seq_dims_mm_entitytype;
drop sequence if exists seq_dims_mm_attributetype;
drop sequence if exists seq_dims_idx_index;
drop sequence if exists seq_dims_idx_IndexCarrier;
drop sequence if exists seq_dims_idx_rule;

create sequence seq_dims_mm_dictionarytype;
create sequence seq_dims_mm_dictionary;
create sequence seq_dims_mm_entitytype;
create sequence seq_dims_mm_attributetype;
create sequence seq_dims_idx_index;
create sequence seq_dims_idx_IndexCarrier;
create sequence seq_dims_idx_rule;


/**
 * dims_mm_dictionarytype 数据字典类型
 **/
create table dims_mm_dictionarytype
(
  id                   integer primary key default nextval('seq_dims_mm_dictionarytype'),
  SpecialityName	  	 varchar(100) not null,--专业名称
  name                 varchar(100) not null,--名词
  code                 varchar(100) not null,--编码
	version           	 integer default 0 not null,--乐观锁
  createdate           timestamp default current_timestamp not null,--创建时间
  creator           	 varchar(100) not null,--创建人
  updatedate        	 timestamp default current_timestamp not null,--更新时间
  updater           	 varchar(100) not null,--更新人
  memo                 varchar(200),--备注
  unique (SpecialityName,name),
  unique (SpecialityName,code)
);

/**
 * dims_mm_dictionary 数据字典
 **/
create table dims_mm_dictionary
(
	id                   integer primary key default nextval('seq_dims_mm_dictionary'),
	dictionarytype_id    integer not null references dims_mm_dictionarytype(id),
	dictKey              integer not null,
	dictValue	           varchar(200) not null,
	version           	 integer default 0 not null,--乐观锁
  createdate           timestamp default current_timestamp not null,--创建时间
  creator           	 varchar(100) not null,--创建人
  updatedate        	 timestamp default current_timestamp not null,--更新时间
  updater           	 varchar(100) not null,--更新人
  memo                 varchar(200)--备注
);

/**
 * dims_mm_entitytype 对象类型
 * 对象类型模型要兼顾数据入库，即数据先入库，再加入业务特性，对象主表、扩展表关系，因此：
 * 1，先有扩展表（必填）：每个对象导入时，根据文件名称，匹配扩展名称，得到对象类型、表名和字段
 * 2，如果对象有主表（非必填）：就补充主表名称、扩展属性、扩展属性取值
 **/
create table dims_mm_entitytype
(
  id                   integer primary key default nextval('seq_dims_mm_entitytype'),
  name              	 varchar(100) not null,--名称
	code 	            	 varchar(100) not null,--编码
	SpecialityName	  	 varchar(100),--专业名称
  coreTable         	 varchar(100),--主表
	extensionTable	  	 varchar(100) not null,--扩展表
	extensionAttr        varchar(100),--扩展属性:主表里面，区分对象类型的字段
	extensionValue   	   varchar(100),--扩展属性取值：代表该对象的扩展属性取值，注意业务数据表的字段，都是字符型
	version           	 integer default 0 not null,--乐观锁
  createdate           timestamp default current_timestamp not null,--创建时间
  creator           	 varchar(100) not null,--创建人
  updatedate        	 timestamp default current_timestamp not null,--更新时间
  updater           	 varchar(100) not null,--更新人
  memo                 varchar(200),--备注
  unique(SpecialityName,extensionTable)
);

/**
 * dims_mm_attributetype 对象属性类型
 * 主表属性，暂时不用在扩展对象对象里面再描述一遍，根据对象的主表名称，可以查询出主表对象的属性列表
 **/
create table dims_mm_attributetype
(
  id                 integer primary key default nextval('seq_dims_mm_attributetype'),
  name               varchar(100) not null,--名称
	code 	             varchar(100) not null,--编码
  entitytype_id	     integer not null references dims_mm_entitytype(id),--对象类型
  columnName         varchar(100) not null,--属性在表中的列名
  dataType	         varchar(100),--字段类型(在核查规则里面有定义，所以这里应该不用，暂时放这里看看)
  dictionaryType_id  integer references dims_mm_dictionarytype(id),--对应字典
	version            integer default 0 not null,--乐观锁
  createdate         timestamp default current_timestamp not null,--创建时间
  creator            varchar(100) not null,--创建人
  updatedate         timestamp default current_timestamp not null,--更新时间
  updater            varchar(100) not null,--更新人
	memo               text--备注
);

/**
 * dims_idx_index 指标
 * 暂时只支持存过方式，后台写死，前台可以改启动、禁用
 **/
create table dims_idx_index
(
   id                 integer primary key default nextval('seq_dims_idx_index'),
	 name               varchar(100) not null,--指标名称
	 code 	            varchar(100) not null unique,--指标编码
	 orderby            integer,--排序使用，把指标编码后面的数字放里面
	 entitytype_id      integer references dims_mm_entitytype(id),--对象类型
	 specialityName     varchar(100),--专业名称
	 --类型 type:
	 --1,存储过程定制;
	 --2,扩展表关联性指标;
	 --3,指标集合;
	 --4,字典准确性指标;
	 --5,必填性分类指标;
	 --6,关键组成部分指标(非空性要求)
	 --7,区域规范性指标
	 --8,经纬度核查指标
	 --9,重复性指标
	 --10,关联关系KEY指标
	 --11,动态sql指标
	 type	              smallint,
	 amountSql          text,--数据总量查询sql
	 errorSql	          text,--错误数据更新sql
	 isEnable           smallint,--是否启用：1是，2否
	 version           	integer default 0 not null,--乐观锁
   createdate         timestamp default current_timestamp not null,--创建时间
   creator           	varchar(100) not null,--创建人
   updatedate        	timestamp default current_timestamp not null,--更新时间
   updater           	varchar(100) not null,--更新人
   procName	          varchar(100),--存过名称,参数都是：省份编码、任务编码、指标ID
   threadNo           integer, --线程编号相同的表示依赖同一类表，要串行，不能并行执行。
   priority           smallint,--优先级，数字越小，优先级越高，要放在前面执行。优先级为1的全部执行后，才能执行优先级为2的，依次下去.
   memo               varchar(200),--备注
   ruleDesc           varchar(4000)--规则描述
);

/**
 * dims_idx_IndexCarrier 指标间关系
 **/
create table dims_idx_IndexCarrier
 (
    id                 integer primary key default nextval('seq_dims_idx_IndexCarrier'),
		parentIndex_id     integer not null references dims_idx_index(id),
		childIndex_id      integer not null references dims_idx_index(id),
		version            integer default 0 not null,--乐观锁
    createdate         timestamp default current_timestamp not null,--创建时间
    creator            varchar(100) not null,--创建人
    updatedate         timestamp default current_timestamp not null,--更新时间
    updater            varchar(100) not null,--更新人
    memo               varchar(200)--备注
);

 /**
  * dims_idx_rule 规则
  * 先根据涛哥的模型文档建进去，具体细节，实现时要再考虑。
  **/
create table dims_idx_rule
(
    id                 integer primary key default nextval('seq_dims_idx_rule'),
		name               varchar(100) not null unique,--名称
	  code 	             varchar(100),--编码
		index_id           integer not null references dims_idx_index(id),
		attributeType_id   integer not null references dims_mm_attributetype(id),
		type               smallint,--规则类型：1,字典准确性;2,必填性;3,区域规范性;4,重复性
		ruleMemo           varchar(100),
		dictionaryName     varchar(100),
		rateLen            smallint,
		dataFrom           date,
		dataTo             date,
		timeFrom           timestamp,
		timeTo             timestamp,
		stringRegex        varchar(100),
		version            integer default 0 not null,--乐观锁
    createdate         timestamp default current_timestamp not null,--创建时间
    creator            varchar(100) not null,--创建人
    updatedate         timestamp default current_timestamp not null,--更新时间
    updater            varchar(100) not null,--更新人
    memo               varchar(200)--备注
);


/**
 * dims_tm_areaCodeConfig 区域编码配置表
 **/
create table dims_tm_areaCodeConfig
(
    code            varchar(100),--区域编码
    name            varchar(100),--区域名称
    regionType      smallint,--区域类型：1省，2地市，3区县
    provinceCode	  varchar(100),--所属省份code
		prefectureCode  varchar(100)--所属地市code
);
create unique index uk_dimstmareaCodeConfig on dims_tm_areaCodeConfig(code,regionType);

/**
 * dims_tm_coordinateConfig 经纬度范围配置表
 **/
create table dims_tm_coordinateConfig
(
    province        varchar(100) primary key,--省份
    configKey	     	varchar(100),--配置关键字
    longitude_min   numeric(16,9),--经度低值
    longitude_max   numeric(16,9),--经度高值
    latitude_min    numeric(16,9),--纬度低值
    latitude_max    numeric(16,9),--纬度高值
    dataSource      varchar(100) --数据来源
);
create unique index uk_dims_tm_coordinateConfig on dims_tm_coordinateConfig(configKey);


