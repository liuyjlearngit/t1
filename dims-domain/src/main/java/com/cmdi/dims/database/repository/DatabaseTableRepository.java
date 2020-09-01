package com.cmdi.dims.database.repository;

import java.util.List;

import com.cmdi.dims.database.entity.DatabaseTable;
import org.springframework.data.repository.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface DatabaseTableRepository extends Repository<DatabaseTable, DatabaseTable.DatabaseTableKey> {

    List<DatabaseTable> findByTableSchemaOrderByTableName(String tableSchema);
}
