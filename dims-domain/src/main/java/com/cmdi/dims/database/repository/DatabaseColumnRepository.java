package com.cmdi.dims.database.repository;

import java.util.List;

import com.cmdi.dims.database.entity.DatabaseColumn;
import org.springframework.data.repository.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface DatabaseColumnRepository extends Repository<DatabaseColumn, DatabaseColumn.DatabaseColumnKey> {

    List<DatabaseColumn> findByTableSchemaAndTableNameOrderByOrdinalPosition(String tableSchema, String tableName);
}
