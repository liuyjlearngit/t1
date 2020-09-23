package com.cmdi.dims.domain.entity;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

@Data
@ToString
@Builder
public class StatisticsResIndex implements RowMapper<StatisticsResIndex> {
    private int id;
    private String name;
    private String procName;
    /*private String specialityName;
    private int entitytype_id;
    private int attributeType_id;
    private int dictionaryType_id;
    private String filterCondition;
    private String  unit;
    private boolean isEnable;
    private String  memo;*/
    public StatisticsResIndex(int id, String name,String procName) {
        this.id = id;
        this.name = name;
        this.procName = procName;
    }
    private StatisticsResIndex(){
    }
    @Override
    public StatisticsResIndex mapRow(ResultSet resultSet, int i) throws SQLException {
        StatisticsResIndex index = new StatisticsResIndex();
        index.setId(resultSet.getInt("id"));
        index.setName(resultSet.getString("name"));
        index.setProcName(resultSet.getString("procName"));
        /*index.setSpecialityName(resultSet.getString("specialityName"));
        index.setEntitytype_id(resultSet.getInt("entitytype_id"));
        index.setAttributeType_id(resultSet.getInt("attributeType_id"));
        index.setDictionaryType_id(resultSet.getInt("dictionaryType_id"));
        index.setFilterCondition(resultSet.getString("filterCondition"));
        index.setisEnable(resultSet.getInt("isEnable")==1?true:false);*/
        return index;
    }

}
