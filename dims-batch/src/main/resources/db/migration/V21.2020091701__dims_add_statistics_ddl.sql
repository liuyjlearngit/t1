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

CREATE OR REPLACE FUNCTION proc_countresource("p_provincecode" varchar, "p_taskcode" varchar, "p_indexid" int4)
  RETURNS void AS $BODY$
declare
	v_idxName          text;
	cur	              refcursor;
	v_entitytypeId     integer;
	v_attributeTypeId     integer;
	v_dictTypeId	      integer;
	v_selectSql        text;
	v_tableName	      varchar(100);
	v_columnName	      varchar(100);
	v_groupColumnName  varchar(100);
	v_conditon        varchar(100);
	v_unit        varchar(100);
	v_methodType         varchar(100);
	v_specialityName         varchar(100);
	v_amount           integer;
	v_provinceCode         varchar(100);
	v_prefectureCode         varchar(100);
	v_countyCode         varchar(100);
	v_resType         varchar(100);
begin
  -- Routine body goes here...
	select entitytype_id,attributeType_id,dictionaryType_id,filterCondition,unit,methodType,specialityName,name
	into v_entitytypeId,v_attributeTypeId,v_dictTypeId,v_conditon,v_unit,v_methodType,v_specialityName,v_idxName
	from dims_tm_res_index
	where id=p_indexid;

	select code into v_tableName	from dims_mm_entitytype where id=v_entitytypeId;
	select code into v_columnName	from dims_mm_attributetype where id=v_attributeTypeId;
	select code into v_groupColumnName	from dims_mm_attributetype where id=v_dictTypeId;

	if v_methodType='sum' then
			v_selectSql := 'select province_id,city_id,county_id,'||v_groupColumnName||',sum(to_number('||v_columnName||')) from '||v_tableName||' where isnotnull('||v_groupColumnName||')';
	else
			v_selectSql := 'select province_id,city_id,county_id,'||v_groupColumnName||',count(distinct '||v_columnName||') from '||v_tableName||' where isnotnull('||v_groupColumnName||')';
	end if;

	if isNotNull(v_conditon) then
		 v_selectSql := v_selectSql||' and '||v_conditon||' group by province_id,city_id,county_id,'||v_groupColumnName;
	else
		 v_selectSql := v_selectSql||' group by province_id,city_id,county_id,'||v_groupColumnName;
	end if;

	open cur for execute v_selectSql;
	fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_resType,v_amount;
	while found loop
	    insert into dims_tm_res_statistics(resIndex,taskCode,provinceCode,prefectureCode,
										   countyCode,specialityName,resName,resType,amount,unit)
        values(p_indexid,p_taskcode,v_provinceCode,v_prefectureCode,
             v_countyCode,v_specialityName,v_idxName,v_resType,
             v_amount,v_unit);
	    fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_resType,v_amount;
	 end loop;
	 close cur;
	 --指标值,更新指标的区域名称
   update dims_tm_res_statistics t
      set province=(select name from dims_tm_areaCodeConfig where code=t.provinceCode and regiontype=1),
          prefecture=(select name from dims_tm_areaCodeConfig where code=t.prefectureCode and regiontype=2),
          county=(select name from dims_tm_areaCodeConfig where code=t.countyCode and regiontype=3)
    where taskcode=p_taskCode
      and resIndex=p_indexId;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;