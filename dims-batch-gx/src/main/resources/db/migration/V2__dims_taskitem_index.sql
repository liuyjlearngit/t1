drop table if exists dims_tm_taskItem_index;

drop sequence if exists seq_dims_tm_taskItem_index;


create sequence seq_dims_tm_taskItem_index;

/**
  * dims_tm_taskItem_index 任务项-数据指标
	* 任务项-数据指标:相当于是指标统计后的统计结果
	* 取文件、文件导入中间表、核查等，都可以算做任务项
  **/
create table dims_tm_taskItem_index
(
	   id                 integer primary key default nextval('seq_dims_tm_taskItem_index'),
		 name               varchar(100),--名称：指标名称
	   code 	            varchar(100),--指标编码
		 taskCode	          varchar(100),
		 index_id           integer,
		 task_id            int8,
		 collectionDate     timestamp default current_timestamp not null,--采集日期
		 province	          varchar(100),--省份
		 prefecture         varchar(100),--地市
		 county	            varchar(100),--区县
		 provinceCode	      varchar(100),--省份code
		 prefectureCode     varchar(100),--地市code
		 countyCode	        varchar(100),--区县code
		 regionType	        smallint,--指标区域属性：1省，2地市，3区县
		 amount             integer,--总数
		 errorAmount        integer,--错误量
		 indexValue	        numeric(6,5),--指标值,小数点后5位，小数点前1位
		 version            integer default 0 not null,--乐观锁
     createdate         timestamp default current_timestamp not null,--创建时间
     creator            varchar(100) not null,--创建人
     updatedate         timestamp default current_timestamp not null,--更新时间
     updater            varchar(100) not null,--更新人
     memo               varchar(200)--备注
);

drop table if exists dims_tm_task;
CREATE TABLE "dims_tm_task" (
  "id" int8 NOT NULL PRIMARY key,
  "starttime" timestamp(6),
  "province" varchar(100),
  "failedreason" text,
  "memo" text
)
;