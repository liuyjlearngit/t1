# 此文档为业务设计文档

### 1.错误数据存储架构

    错误数据会以一个独立的程序把错误数据从分库上传到主库；
    
    设计上分了3个表：
    索引表：dims_data_index 用来查询的，目前主要支持指标/专业/实体表/三级区域来过滤，通过该表过滤出来需要导出的数据的dataKey，通过dataKey/tableName/specialityName三个关键词到数据表中去加载数据，通过tableName/specialityName去列头表里面寻找列头
    数据表: dims_data_storage 用来存储数据，数据记录dataKey, tableName, specialityName三者用于作为外键关联
    列头表：dims_data_column 用来存储列头，通过tableName, specialityName两者作为key
    
    其中三个表都会有task_code, 这个主要用来记录dims_task_latest里面的taskCode
    
    由于删除数据会慢很多，为了避免核查程序过长的占用资源，这里在上传程序中只会处理新增，不处理删除，删除后续考虑单独的程序去定期处理
    
    
### 2.如何快速导出数据

    对于数据导出，建议用JDBC TEMPLATE 来做，不建议JPA，索然我已经把JPA写好；JPA在这种大数据量的情况下有性能问题

```sql
    SELECT
    	s.DATA -- 文本数据直接用原始的分隔符，查询出来后，直接写入CSV文件
    FROM
    	dims_data_index i
    	LEFT JOIN dims_data_storage s ON i.task_code = s.task_code 
    	AND i.speciality_name = s.speciality_name 
    	AND i.TABLE_NAME = s.TABLE_NAME 
    	AND i.data_key = s.data_key 
    	-- 这里的left join四个关联项缺一不可
    WHERE
    	i.index_code = 'XXX-0001' -- 这里加查询条件，必须要有index_code否则可能会导出多张表的数据，可能导出的文件就乱套了
    	AND i.province_code = '000000' -- 这里加查询条件，所有的查询条件都要从索引表中出，到时候索引表会加索引以加快查询
    ORDER BY
    	s.ID -- 这里一定要有orderby的查询，由于插入的顺序是一定是id自增的顺序，一方面保证数据的分页稳定
    	LIMIT 10000 OFFSET 0 -- 分页，建议20000一次或者可以自行调整
```

    对于列头，如果查询到了数据，那么取第一条里面的specialtyName和tableName和taskCode去列头表里面根据这三者去匹配
    同样对于列头，也是不需要做任何处理的，只需要取列头表里面的columns作为csv文件的第一行即可
    
    另外避免深分页的问题，可以记录上一页的最大的那个id，然后查询条件里面增加一个id>xxx的条件，这样就可以解决深分页带来的性能问题
    具体可以百度，如何避免深分页造成的性能问题
    
    
```sql
SELECT
	s.DATA 
FROM
	dims_data_index i
	LEFT JOIN dims_data_storage s ON i.task_code = s.task_code 
	AND i.speciality_name = s.speciality_name 
	AND i.TABLE_NAME = s.TABLE_NAME 
	AND i.data_key = s.data_key 
WHERE
	i.index_code = 'XXX-0001' 
	AND i.province_code = '000000' 
	AND s.id > 0 -- 第一页可以用0来代替
ORDER BY
	s.ID 
	LIMIT 10000
	

SELECT
	s.DATA 
FROM
	dims_data_index i
	LEFT JOIN dims_data_storage s ON i.task_code = s.task_code 
	AND i.speciality_name = s.speciality_name 
	AND i.TABLE_NAME = s.TABLE_NAME 
	AND i.data_key = s.data_key 
WHERE
	i.index_code = 'XXX-0001' 
	AND i.province_code = '000000' 
	AND s.id > 10000 -- 下一页的时候可以取上一页最大的一个id，假设上一页最大的id是10000，那么只要大于10000之后取10000个即是下一页， 注意这种方式最大的限制是必须是有序的，如果无序的是不能用这种方式来实现的
ORDER BY
	s.ID 
	LIMIT 10000
```