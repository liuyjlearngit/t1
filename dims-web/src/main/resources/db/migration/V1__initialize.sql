-- ----------------------------
-- Table structure for dims_idx_folder
-- ----------------------------
DROP TABLE IF EXISTS "dims_idx_folder";
DROP SEQUENCE IF EXISTS "seq_dims_idx_folder";

CREATE SEQUENCE "seq_dims_idx_folder";
CREATE TABLE "dims_idx_folder" (
  "folder_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_idx_folder'),
  "name" varchar(255),
  "parentfolder_id" int8,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Table structure for dims_idx_folderindex
-- ----------------------------
DROP TABLE IF EXISTS "dims_idx_folderindex";
DROP SEQUENCE IF EXISTS "seq_dims_idx_folderindex";

CREATE SEQUENCE "seq_dims_idx_folderindex";
CREATE TABLE "dims_idx_folderindex" (
  "folderindex_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_idx_folderindex'),
  "folder_id" int8,
  "index_id" int8,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Table structure for dims_idx_relativefolder
-- ----------------------------
DROP TABLE IF EXISTS "dims_idx_relativefolder";
DROP SEQUENCE IF EXISTS "seq_dims_idx_relativefolder";

CREATE SEQUENCE "seq_dims_idx_relativefolder";
CREATE TABLE "dims_idx_relativefolder" (
  "relativefolder_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_idx_relativefolder'),
  "relativepath" varchar(255),
  "workfolder_id" int8,
  "currentfolder_id" int8,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Table structure for dims_sm_authorization
-- ----------------------------
DROP TABLE IF EXISTS "dims_sm_authorization";
DROP SEQUENCE IF EXISTS "seq_dims_sm_authorization";

CREATE SEQUENCE "seq_dims_sm_authorization";
CREATE TABLE "dims_sm_authorization" (
  "authorization_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_sm_authorization'),
  "user_id" int8,
  "permission_id" int8,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Table structure for dims_sm_permission
-- ----------------------------
DROP TABLE IF EXISTS "dims_sm_permission";
DROP SEQUENCE IF EXISTS "seq_dims_sm_permission";

CREATE SEQUENCE "seq_dims_sm_permission";
CREATE TABLE "dims_sm_permission" (
  "permission_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_sm_permission'),
  "name" varchar(255),
  "code" varchar(255)
)
;

-- ----------------------------
-- Table structure for dims_sm_role
-- ----------------------------
DROP TABLE IF EXISTS "dims_sm_role";
DROP SEQUENCE IF EXISTS "seq_dims_sm_role";

CREATE SEQUENCE "seq_dims_sm_role";
CREATE TABLE "dims_sm_role" (
  "role_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_sm_role'),
  "name" varchar(255),
  "code" varchar(255)
)
;

-- ----------------------------
-- Table structure for dims_sm_role_permission
-- ----------------------------
DROP TABLE IF EXISTS "dims_sm_role_permission";
CREATE TABLE "dims_sm_role_permission" (
  "role_id" int8 NOT NULL,
  "permission_id" int8
)
;

-- ----------------------------
-- Table structure for dims_sm_user
-- ----------------------------
DROP TABLE IF EXISTS "dims_sm_user";
DROP SEQUENCE IF EXISTS "seq_dims_sm_user";

CREATE SEQUENCE "seq_dims_sm_user";
CREATE TABLE "dims_sm_user" (
  "user_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_sm_user'),
  "name" varchar(255) NOT NULL,
  "username" varchar(50) NOT NULL,
  "email" varchar(100),
  "mobile_phone" varchar(20),
  "dept_name" varchar(100),
  "password" varchar(255),
  "remark" varchar(255),
  "account_expired_at" timestamp(6),
  "password_expired_at" timestamp(6),
  "locked" bool,
  "password_initialized" bool,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  regiontype int,
  regioncode varchar(20)
)
;

-- ----------------------------
-- Table structure for dims_tm_areacodeconfig
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_areacodeconfig";
CREATE TABLE "dims_tm_areacodeconfig" (
  "code" varchar(100),
  "name" varchar(100),
  "regiontype" int2,
  "provincecode" varchar(100),
  "prefecturecode" varchar(100)
)
;

-- ----------------------------
-- Table structure for dims_tm_coordinateconfig
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_coordinateconfig";
CREATE TABLE "dims_tm_coordinateconfig" (
  "province" varchar(100) NOT NULL,
  "longitude_min" numeric(16,9),
  "longitude_max" numeric(16,9),
  "latitude_min" numeric(16,9),
  "latitude_max" numeric(16,9)
)
;

-- ----------------------------
-- Table structure for dims_tm_filelocation
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_filelocation";
DROP SEQUENCE IF EXISTS "seq_dims_tm_filelocation";

CREATE SEQUENCE "seq_dims_tm_filelocation";
CREATE TABLE "dims_tm_filelocation" (
  "filelocation_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_filelocation'),
  "name" varchar(255),
  "host" varchar(255),
  "port" int4,
  "path" varchar(255),
  "schema" varchar(255),
  "encoding" varchar(255),
  "username" varchar(255),
  "password" varchar(255),
  "province" varchar(100),
  "lastcollectiondate" timestamp(6),
  "file_encoding" varchar(255),
  "file_delimiter" varchar(255),
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "specialityname" varchar(200),
  "taskconfig_id" int8
);

-- ----------------------------
-- Table structure for dims_tm_filevalidation
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_filevalidation";
DROP SEQUENCE IF EXISTS "seq_dims_tm_filevalidation";

CREATE SEQUENCE "seq_dims_tm_filevalidation";
CREATE TABLE "dims_tm_filevalidation" (
  "filevalidation_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_filevalidation'),
  "filelocation_id" int8,
  "desttable" varchar(255),
  "entityname" varchar(255),
  "csvfile" varchar(255),
  "validationresult" text,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "taskconfig_id" int8
)
;

-- ----------------------------
-- Table structure for dims_tm_task
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_task";
DROP SEQUENCE IF EXISTS "seq_dims_tm_task";

CREATE SEQUENCE "seq_dims_tm_task";
CREATE TABLE "dims_tm_task" (
  "id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_task'),
  "filelocation_id" int8,
  "name" varchar(100) NOT NULL,
  "code" varchar(100),
  "collectiondate" timestamp(6),
  "province" varchar(100),
  "status" int2,
  "failedreason" text,
  "starttime" timestamp(6),
  "endtime" timestamp(6),
  "version" int4 NOT NULL DEFAULT 0,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "memo" varchar(200),
  "specialityname" varchar(200),
  "taskconfig_id" int8
)
;

-- ----------------------------
-- Table structure for dims_tm_taskconfig
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_taskconfig";
DROP SEQUENCE IF EXISTS "seq_dims_tm_taskconfig";

CREATE SEQUENCE "seq_dims_tm_taskconfig";
CREATE TABLE "dims_tm_taskconfig" (
  "id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_taskconfig'),
  "name" varchar(100) NOT NULL,
  "code" varchar(100),
  "province" varchar(100),
  "specialityname" varchar(200),
  "version" int4 NOT NULL DEFAULT 0,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "memo" varchar(200),
  "includespecialities" varchar(400)
)
;

-- ----------------------------
-- Table structure for dims_tm_taskitem_business
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_taskitem_business";
DROP SEQUENCE IF EXISTS "seq_dims_tm_taskitem_business";

CREATE SEQUENCE "seq_dims_tm_taskitem_business";
CREATE TABLE "dims_tm_taskitem_business" (
  "taskitembusiness_id" int4 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_taskitem_business'),
  "name" varchar(100) NOT NULL,
  "code" varchar(100),
  "task_id" int4,
  "collectiondate" timestamp(6),
  "province" varchar(100),
  "amount" int8,
  "originamount" int8,
  "analysiscosts" int8,
  "issuccessful" int2,
  "version" int4 NOT NULL DEFAULT 0,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "memo" text,
  "taskcode" varchar(64)
)
;

-- ----------------------------
-- Table structure for dims_tm_taskitem_file
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_taskitem_file";
DROP SEQUENCE IF EXISTS "seq_dims_tm_taskitem_file";

CREATE SEQUENCE "seq_dims_tm_taskitem_file";
CREATE TABLE "dims_tm_taskitem_file" (
  "taskitemfile_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_taskitem_file'),
  "name" varchar(100) NOT NULL,
  "code" varchar(100),
  "task_id" int4,
  "collection" timestamp(6),
  "province" varchar(100),
  "desttable" varchar(100),
  "filesize" int8,
  "csvfile" varchar(100),
  "csvfilesize" int8,
  "filegettingcosts" int8,
  "finishtime" timestamp(6),
  "signature" varchar(100),
  "linesize" int8,
  "file_encoding" varchar(255),
  "file_delimiter" varchar(255),
  "issuccessful" int2,
  "failurereason" text,
  "version" int4 NOT NULL DEFAULT 0,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(255),
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "memo" varchar(200),
  "taskcode" varchar(64)
)
;

-- ----------------------------
-- Table structure for dims_tm_taskitem_index
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_taskitem_index";
DROP SEQUENCE IF EXISTS "seq_dims_tm_taskitem_index";

CREATE SEQUENCE "seq_dims_tm_taskitem_index";
CREATE TABLE "dims_tm_taskitem_index" (
  "id" int4 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_taskitem_index'),
  "name" varchar(100),
  "code" varchar(100),
  "taskcode" varchar(100),
  "index_id" int4,
  "collectiondate" timestamp(6) NOT NULL DEFAULT now(),
  "province" varchar(100),
  "prefecture" varchar(100),
  "county" varchar(100),
  "provincecode" varchar(100),
  "prefecturecode" varchar(100),
  "countycode" varchar(100),
  "regiontype" int2,
  "amount" int4,
  "erroramount" int4,
  "indexvalue" numeric(6,5),
  "version" int4 NOT NULL DEFAULT 0,
  "createdate" timestamp(6) NOT NULL DEFAULT now(),
  "creator" varchar(100) NOT NULL,
  "updatedate" timestamp(6) NOT NULL DEFAULT now(),
  "updater" varchar(100) NOT NULL,
  "memo" varchar(200)
)
;

-- ----------------------------
-- Table structure for dims_tm_tasklock
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_tasklock";
DROP SEQUENCE IF EXISTS "seq_dims_tm_tasklock";

CREATE SEQUENCE "seq_dims_tm_tasklock";
CREATE TABLE "dims_tm_tasklock" (
  "lock_id" int4 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_tasklock'),
  "task_id" int4,
  "created_by" varchar(100) NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "locked_by" varchar(255),
  "locked_at" timestamp(6),
  "specialityname" varchar(200),
  "province" varchar(200)
)
;

-- ----------------------------
-- Table structure for dims_tm_taskpipeline
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_taskpipeline";
DROP SEQUENCE IF EXISTS "seq_dims_tm_taskpipeline";

CREATE SEQUENCE "seq_dims_tm_taskpipeline";
CREATE TABLE "dims_tm_taskpipeline" (
  "taskpipeline_id" int8 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_taskpipeline'),
  "filelocation_id" int8,
  "name" varchar(255),
  "type" int4,
  "created_by" varchar(255),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "taskconfig_id" int8,
  "specialityname" varchar(200),
  "province" varchar(200)
)
;