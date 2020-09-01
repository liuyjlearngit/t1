ALTER TABLE "dims_data_storage"
  ADD COLUMN "province_code" varchar(20) NOT NULL,
  ADD COLUMN "prefecture_code" varchar(20),
  ADD COLUMN "county_code" varchar(20);