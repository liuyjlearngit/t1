DROP TABLE IF EXISTS "dims_data_column";
DROP TABLE IF EXISTS "dims_data_index";
DROP TABLE IF EXISTS "dims_data_storage";

DROP SEQUENCE  IF EXISTS "seq_dims_data_column" ;
DROP SEQUENCE  IF EXISTS "seq_dims_data_index" ;
DROP SEQUENCE  IF EXISTS "seq_dims_data_storage" ;


CREATE SEQUENCE "seq_dims_data_column";
CREATE SEQUENCE "seq_dims_data_index";
CREATE SEQUENCE "seq_dims_data_storage";

CREATE TABLE "dims_data_column" (
  "id" int8 NOT NULL PRIMARY KEY defAULT nextval('seq_dims_data_column'),
  "speciality_name" varchar(20) NOT NULL,
  "table_name" varchar(64) NOT NULL,
  "columns" text NOT NULL,
  "task_code" varchar(255) NOT NULL,
  "created_at" timestamp(6)
)
;

CREATE TABLE "dims_data_index" (
  "id" int8 NOT NULL PRIMARY KEY defAULT nextval('seq_dims_data_index'),
  "index_code" varchar(64) NOT NULL,
  "index_name" varchar(255),
  "province_code" varchar(20) NOT NULL,
  "prefecture_code" varchar(20),
  "county_code" varchar(20),
  "created_at" timestamp(6) NOT NULL,
  "speciality_name" varchar(20) NOT NULL,
  "table_name" varchar(64) NOT NULL,
  "data_key" varchar(255) NOT NULL,
  "task_code" varchar(255) NOT NULL
)
;

CREATE TABLE "dims_data_storage" (
  "id" int8 NOT NULL PRIMARY KEY defAULT nextval('seq_dims_data_storage'),
  "task_code" varchar(255) NOT NULL,
  "data_key" varchar(255) NOT NULL,
  "speciality_name" varchar(20) NOT NULL,
  "table_name" varchar(64) NOT NULL,
  "data" text NOT NULL,
  "created_at" timestamp(6) NOT NULL
)
;
