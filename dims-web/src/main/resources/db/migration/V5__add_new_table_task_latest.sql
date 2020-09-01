-- ----------------------------
-- Table structure for dims_tm_task_latest
-- ----------------------------
DROP TABLE IF EXISTS "dims_tm_task_latest";
DROP SEQUENCE IF EXISTS "seq_dims_tm_task_latest";

CREATE SEQUENCE "seq_dims_tm_task_latest";
CREATE TABLE "dims_tm_task_latest" (
  "id" int4 NOT NULL PRIMARY key defAULT nextval('seq_dims_tm_task_latest'),
  "taskcode" varchar(100),
  "province" varchar(100),
  "specialityname" varchar(200),
  "version" int4 NOT NULL DEFAULT 0,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "created_by" varchar(100) NOT NULL,
  "updated_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_by" varchar(100) NOT NULL,
  "memo" varchar(200)
)
;