drop table if exists OMC;
drop table if exists BSC;
drop table if exists BTS;
drop table if exists ENODEB;
drop table if exists GNODEB;
drop table if exists RTK;
drop table if exists CELL;
drop table if exists EUTRANCELL;
drop table if exists NRCELL;
drop table if exists ANTENNACHOKECOIL;
drop table if exists BBU;
drop table if exists RRU;
drop table if exists DU;
drop table if exists CU;
drop table if exists AAU;
drop table if exists BOARD;
drop table if exists PORT;
drop table if exists ANTENNA;
drop table if exists ANTENNAPARA;
drop table if exists TOWER;
drop table if exists RPT;
drop table if exists SPEARD;
drop table if exists PICOAP;
drop table if exists PICOAU;
drop table if exists PICOSWITCH;

create table OMC(
int_id varchar(500),zh_label varchar(500),vendor_id varchar(500),ip_addr varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table BSC(
int_id 	varchar(500),userlabel varchar(500),vendor_id varchar(500),product_name varchar(500),related_rackpos varchar(500),related_omc varchar(500),local_spc varchar(500),software_version	varchar(500),lifecycle_status varchar(500),setup_time varchar(500),qualitor varchar(500),maintainor varchar(500),related_mgw varchar(500),related_mme_sgsn	varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result 	text,dims_col_rtName text
);
create table BTS(
int_id  varchar(500),zh_label 	varchar(500),userlabel 	varchar(500),related_omc 	varchar(500),location_type varchar(500),related_room_location	varchar(500),vendor_id 	varchar(500),product_name varchar(500),software_version varchar(500),lifecycle_status varchar(500),setup_time 	varchar(500),vip_type 	varchar(500),net_model 	varchar(500),device_type 	varchar(500),beehive_type varchar(500),related_bsc 	varchar(500),qualitor 	varchar(500),maintainor 	varchar(500),province_id 	varchar(500),city_id  varchar(500),county_id 	varchar(500),dims_col_result text,dims_col_rtName text
);
create table ENODEB(
int_id  varchar(500),nodeb_id varchar(500),zh_label varchar(500),userlabel 	varchar(500),related_omc varchar(500),location_type varchar(500),related_room_location	varchar(500),rated_power varchar(500),product_name varchar(500),software_version varchar(500),lifecycle_status varchar(500),setup_time 	varchar(500),vip_type varchar(500),net_model varchar(500),device_type varchar(500),beehive_type varchar(500),related_bsc varchar(500),s1_ipaddress varchar(500),construction_type varchar(500),qualitor varchar(500),maintainor varchar(500),province_id varchar(500),city_id  varchar(500),county_id 	varchar(500),dims_col_result text,dims_col_rtName text
);
create table GNODEB(
int_id 	varchar(500),nodeb_id 	varchar(500),zh_label 	varchar(500),userlabel 	varchar(500),related_omc 	varchar(500),location_type 	varchar(500),related_room_location 	varchar(500),rated_power 	varchar(500),product_name 	varchar(500),software_version 	varchar(500),lifecycle_status 	varchar(500),setup_time 	varchar(500),vip_type 	varchar(500),net_model 	varchar(500),device_type 	varchar(500),beehive_type 	varchar(500),related_bsc 	varchar(500),qualitor 	varchar(500),maintainor 	varchar(500),province_id 	varchar(500),city_id 	varchar(500),county_id 	varchar(500),dims_col_result text,dims_col_rtName	text
);
create table RTK(
int_id varchar(500),cors_id varchar(500),place_type varchar(500),userlabel varchar(500),location_type varchar(500),related_room_location varchar(500),software_version varchar(500),lifecycle_status varchar(500),setup_time varchar(500),qualitor varchar(500),maintainor varchar(500),vendor_id varchar(500),product_name varchar(500),zh_label varchar(500),device_sn varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CELL(
int_id varchar(500),ci varchar(500),lac varchar(500),zh_label varchar(500),userlabel varchar(500),related_bs varchar(500),location_type varchar(500),related_room_location varchar(500),lifecycle_status varchar(500),setup_time varchar(500),net_model varchar(500),frequency varchar(500),if_remote varchar(500),beehive_type varchar(500),cover_scene varchar(500),cover_scene_label varchar(500),secondary_cover_scene varchar(500),secondary_cover_scene_label varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table EUTRANCELL(
int_id varchar(500),e_cgi varchar(500),tac varchar(500),pci varchar(500),zh_label varchar(500),userlabel varchar(500),related_bs varchar(500),location_type varchar(500),related_room_location varchar(500),lifecycle_status varchar(500),setup_time varchar(500),net_model varchar(500),frequency varchar(500),if_remote varchar(500),beehive_type varchar(500),cover_scene varchar(500),cover_scene_label varchar(500),secondary_cover_scene varchar(500),secondary_cover_scene_label varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table NRCELL(
int_id varchar(500),n_cgi varchar(500),tac varchar(500),pci varchar(500),zh_label varchar(500),userlabel varchar(500),related_bs varchar(500),location_type varchar(500),related_room_location varchar(500),lifecycle_status varchar(500),setup_time varchar(500),net_model varchar(500),frequency varchar(500),if_remote varchar(500),beehive_type varchar(500),cover_scene varchar(500),cover_scene_label varchar(500),secondary_cover_scene varchar(500),secondary_cover_scene_label varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table ANTENNACHOKECOIL(
int_id varchar(500),userlabel varchar(500),rtkcors varchar(500),vendor_id varchar(500),device_type varchar(500),device_sn varchar(500),related_tower varchar(500),setup_location varchar(500),lifecycle_status varchar(500),setup_time varchar(500),install_type varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table BBU(
int_id varchar(500),zh_label varchar(500),bbu_serial varchar(500),related_bs varchar(500),rated_power varchar(500),net_model varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table RRU(
int_id varchar(500),zh_label varchar(500),location_type varchar(500),related_room_location varchar(500),location varchar(500),related_cell varchar(500),rated_power varchar(500),connect_model varchar(500),rru_serial varchar(500),product_name varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CU(
int_id varchar(500),zh_label varchar(500),cu_serial varchar(500),rated_power varchar(500),net_model varchar(500),location_type varchar(500),related_room_location varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName text
);
create table DU(
int_id varchar(500),zh_label varchar(500),du_serial varchar(500),related_bs varchar(500),rated_power varchar(500),net_model varchar(500),related_cu varchar(500),location_type varchar(500),related_room_location varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName text
);
create table AAU(
int_id varchar(500),zh_label varchar(500),location_type varchar(500),related_room_location varchar(500),location varchar(500),related_cell varchar(500),rated_power varchar(500),connect_model varchar(500),aau_serial varchar(500),product_name varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table BOARD(
int_id varchar(500),board_serial varchar(500),product_name varchar(500),physical_location varchar(500),board_function_type varchar(500),related_bs varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table PORT(
int_id varchar(500),port_no varchar(500),location varchar(500),circuit_name varchar(500),fiber_id varchar(500),port_status varchar(500),port_type varchar(500),related_ne varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table ANTENNA(
int_id varchar(500),zh_label varchar(500),vendor_id varchar(500),product_name varchar(500),related_tower varchar(500),setup_location varchar(500),height varchar(500),setup_time varchar(500),antenna_type varchar(500),if_aau varchar(500),related_aau varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table ANTENNAPARA(
int_id varchar(500),azimuth varchar(500),related_cell varchar(500),related_antenna varchar(500),ele_bend varchar(500),machine_cor varchar(500),related_frequency varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table TOWER(
int_id varchar(500),zh_label varchar(500),tower_stature varchar(500),tower_platnum varchar(500),location_type varchar(500),related_room_location varchar(500),tower_type varchar(500),property_right varchar(500),property_unit varchar(500),share_unit varchar(500),setup_time varchar(500),production_type varchar(500),tc_res_id varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table RPT(
int_id varchar(500),zh_label varchar(500),vendor_id varchar(500),signal_receive_type varchar(500),power_supply_type varchar(500),location_type varchar(500),related_room_location varchar(500),location varchar(500),lifecycle_status varchar(500),qualitor varchar(500),maintainor varchar(500),repeater_type varchar(500),beehive_type varchar(500),related_cell varchar(500),rated_power varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table SPEARD(
int_id varchar(500),zh_label varchar(500),integrated_vendor varchar(500),related_location varchar(500),antenna_num varchar(500),trunk_amplifier_num varchar(500),related_bs varchar(500),related_cell varchar(500),passive_device_vendor varchar(500),feeder_vendor varchar(500),antenna_vendor_id varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName text
);
create table PICOAP(
int_id varchar(500),zh_label varchar(500),ap_serial varchar(500),related_femto varchar(500),rated_pawer varchar(500),location varchar(500),vendor_id varchar(500),product_name varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName text
);
create table PICOAU(
int_id varchar(500),zh_label varchar(500),au_serial varchar(500),related_femto varchar(500),rated_pawer varchar(500),location varchar(500),vendor_id varchar(500),product_name varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName text
);
create table PICOSWITCH(
int_id varchar(500),zh_label varchar(500),serial varchar(500),related_femto varchar(500),rated_pawer varchar(500),location varchar(500),vendor_id varchar(500),product_name varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);

create index if not exists idx_OMC2intId on OMC(int_id);
create index if not exists idx_BSC2intId on BSC(int_id);
create index if not exists idx_BTS2intId on BTS(int_id);
create index if not exists idx_ENODEB2intId on ENODEB(int_id);
create index if not exists idx_GNODEB2intId on GNODEB(int_id);
create index if not exists idx_RTK2intId on RTK(int_id);
create index if not exists idx_CELL2intId on CELL(int_id);
create index if not exists idx_EUTRANCELL2intId on EUTRANCELL(int_id);
create index if not exists idx_NRCELL2intId on NRCELL(int_id);
create index if not exists idx_ANTENNACHOKECOIL2intId on ANTENNACHOKECOIL(int_id);
create index if not exists idx_BBU2intId on BBU(int_id);
create index if not exists idx_RRU2intId on RRU(int_id);
create index if not exists idx_DU2intId on DU(int_id);
create index if not exists idx_CU2intId on CU(int_id);
create index if not exists idx_AAU2intId on AAU(int_id);
create index if not exists idx_BOARD2intId on BOARD(int_id);
create index if not exists idx_PORT2intId on PORT(int_id);
create index if not exists idx_ANTENNA2intId on ANTENNA(int_id);
create index if not exists idx_ANTENNAPARA2intId on ANTENNAPARA(int_id);
create index if not exists idx_TOWER2intId on TOWER(int_id);
create index if not exists idx_RPT2intId on RPT(int_id);
create index if not exists idx_SPEARD2intId on SPEARD(int_id);
create index if not exists idx_PICOAP2intId on PICOAP(int_id);
create index if not exists idx_PICOAU2intId on PICOAU(int_id);
create index if not exists idx_PICOSWITCH2intId on PICOSWITCH(int_id);

--空间ddl
drop table if exists RM_AREA_SITE;
drop table if exists RM_AREA_RESPOINT;
drop table if exists RM_AREA_ROOM;
drop table if exists RM_AREA_RACKPOS;
CREATE TABLE RM_AREA_SITE (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	china_tower_station_code TEXT,
	qualitor VARCHAR ( 500 ),
	site_type VARCHAR ( 500 ),
	address VARCHAR ( 500 ),
	longitude VARCHAR ( 500 ),
	latitude VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	releated_dc VARCHAR ( 500 ),
	alias_name VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE RM_AREA_RESPOINT (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	longitude VARCHAR ( 500 ),
	latitude VARCHAR ( 500 ),
	address VARCHAR ( 500 ),
	res_type VARCHAR ( 500 ),	
	china_tower_station_code TEXT,
	qualitor VARCHAR ( 500 ),
	alias_name VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
    property_right VARCHAR ( 500 ),
    property_unit VARCHAR ( 500 ),
	dims_col_result TEXT,
	dims_col_rtName TEXT 
);
CREATE TABLE RM_AREA_ROOM (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	china_tower_station_code TEXT,
	related_site VARCHAR ( 500 ),
	floor_num VARCHAR ( 500 ),
	property_right VARCHAR ( 500 ),
	property_unit VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	cutin_date VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	equiproom_type VARCHAR ( 500 ),
	equiproom_level VARCHAR ( 500 ),
	room_area VARCHAR ( 500 ),
	china_tower_room_type VARCHAR ( 500 ),
	shared_unit VARCHAR ( 500 ),
	alias_name VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
	dims_col_rtName TEXT 
);
CREATE TABLE RM_AREA_RACKPOS (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	serial VARCHAR ( 500 ),
	equiproom_id VARCHAR ( 500 ),
	row_id VARCHAR ( 500 ),
	line_id VARCHAR ( 500 ),
	using_status VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
	dims_col_rtName TEXT 
);
create index if not exists idx_RM_AREA_SITE2intId on RM_AREA_SITE(int_id);
create index if not exists idx_RM_AREA_ROOM2intId on RM_AREA_ROOM(int_id);
create index if not exists idx_RM_AREA_ROOM2related_site on RM_AREA_ROOM(related_site);
create index if not exists idx_RM_AREA_RESPOINT2intId on RM_AREA_RESPOINT(int_id);
create index if not exists idx_RM_AREA_RACKPOS2intId on RM_AREA_RACKPOS(int_id);
create index if not exists idx_RM_AREA_RACKPOS2equiproom_id on RM_AREA_RACKPOS(equiproom_id);

--公共ddl
drop table if exists CM_DEVICE_RACK;
drop table if exists CE_WARE_DDM;
drop table if exists CE_WARE_ODM;
drop table if exists CM_PORT_DDF;
drop table if exists CM_PORT_ODF;
CREATE TABLE CM_DEVICE_RACK (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	rack_type VARCHAR ( 500 ),
	related_type VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	related_rackposition VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	rack_unit_size VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE CE_WARE_DDM (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	row_num VARCHAR ( 500 ),
	column_num VARCHAR ( 500 ),
	related_reackpos VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	maintainor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE CE_WARE_ODM (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	shelf_id VARCHAR ( 500 ),
	related_equipment_type VARCHAR ( 500 ),
	related_device_id VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	maintainor VARCHAR ( 500 ),
	row_num VARCHAR ( 500 ),
	column_num VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE CM_PORT_DDF (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	row_column_num VARCHAR ( 500 ),
	port_status VARCHAR ( 500 ),
	related_ddm VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE CM_PORT_ODF (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	row_column_num VARCHAR ( 500 ),
	port_status VARCHAR ( 500 ),
	related_odm VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

create index if not exists idx_CM_DEVICE_RACK2intId on CM_DEVICE_RACK(int_id);
create index if not exists idx_CM_DEVICE_RACK2related_room on CM_DEVICE_RACK(related_room);
create index if not exists idx_CM_DEVICE_RACK2related_rackposition on CM_DEVICE_RACK(related_rackposition);
create index if not exists idx_CE_WARE_DDM2intId on CE_WARE_DDM(int_id);
create index if not exists idx_CE_WARE_DDM2related_reackpos on CE_WARE_DDM(related_reackpos);
create index if not exists idx_CE_WARE_ODM2intId on CE_WARE_ODM(int_id);
create index if not exists idx_CE_WARE_ODM2related_device_id on CE_WARE_ODM(related_device_id);
create index if not exists idx_CM_PORT_DDF2intId on CM_PORT_DDF(int_id);
create index if not exists idx_CM_PORT_DDF2related_ddm on CM_PORT_DDF(related_ddm);
create index if not exists idx_CM_PORT_ODF2intId on CM_PORT_ODF(int_id);
create index if not exists idx_CM_PORT_ODF2related_odm on CM_PORT_ODF(related_odm);

--动环ddl
drop table if exists RM_SITE_PROPERTY;
drop table if exists RM_ROOM_PROPERTY;
drop table if exists CE_DEVICE_PE_TRANSFORM;
drop table if exists CE_DECIVE_PE_TRANSFORM_DEVICE;
drop table if exists CE_NET_PE_HIGH_DISTRIBUTION;
drop table if exists CE_DEVICE_PE_HIGH_DISTRIBUTION;
drop table if exists CE_NET_PE_HIGH_POWER;
drop table if exists CE_DEVICE_PE_HIGH_POWER;
drop table if exists CE_DEVICE_PE_HIGH_DC_DISTRIBUTION;
drop table if exists CE_NET_PE_LOW_DISTRIBUTION;
drop table if exists CE_DEVICE_PE_LOW_AC_DISTRIBUTION;
drop table if exists CE_NET_PE_SWITCH_POWER;
drop table if exists CE_DEVICE_PE_POWER_GENERATION;
drop table if exists CE_NET_PE_OPEN_POWER;
drop table if exists CE_DEVICE_PE_SWITCH_POWER;
drop table if exists CE_DEVICE_PE_LOW_DC_DISTRIBUTION;
drop table if exists CE_NET_PE_UPS;
drop table if exists CE_DEVICE_PE_UPS;
drop table if exists CE_DEVICE_PE_BATTERY;
drop table if exists CE_DEVICE_PE_AIR;
drop table if exists CE_DEVICE_PE_ENERY_SAVE;
drop table if exists CE_DEVICE_PE_POWER_MONITOR;
drop table if exists CE_DEVICE_PE_SMART_METER;
drop table if exists CE_LINK_PE_IN;
drop table if exists CE_LINK_PE_OUT;
drop table if exists CE_DEVICE_PE_OTHER;


CREATE TABLE RM_SITE_PROPERTY (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	power_site_level VARCHAR ( 500 ),
	mains_backup_method VARCHAR ( 500 ),
	power_is_substations VARCHAR ( 500 ),
	mains_voltage_level VARCHAR ( 500 ),
	mains_nature VARCHAR ( 500 ),
	total_mains_number VARCHAR ( 500 ),
	mains_capacity VARCHAR ( 500 ),
	mains_configuration_level VARCHAR ( 500 ),
	total_tank_number VARCHAR ( 500 ),
	tatal_tank_volume VARCHAR ( 500 ),
	property_unit VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE RM_ROOM_PROPERTY (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	power_room_type VARCHAR ( 500 ),
	power_related_site_name VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_TRANSFORM (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	related_site VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	device_type VARCHAR ( 500 ),
	device_subclass VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	device_code VARCHAR ( 500 ),
	product_name VARCHAR ( 500 ),
	vendor_id VARCHAR ( 500 ),
	rated_power VARCHAR ( 500 ),
	input_rated_voltage VARCHAR ( 500 ),
	low_reted_current VARCHAR ( 500 ),
	backup_method VARCHAR ( 500 ),
	start_time VARCHAR ( 500 ),
	estimated_retirement_time VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	maintainor VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DECIVE_PE_TRANSFORM_DEVICE (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	related_site VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	device_type VARCHAR ( 500 ),
	device_subclass VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	device_code VARCHAR ( 500 ),
	product_name VARCHAR ( 500 ),
	vendor_id VARCHAR ( 500 ),
	rated_input_voltage VARCHAR ( 500 ),
	rated_output_voltage VARCHAR ( 500 ),
	output_type VARCHAR ( 500 ),
	total_loading_modules_number VARCHAR ( 500 ),
	total_match_modules_number VARCHAR ( 500 ),
	single_module_output_current VARCHAR ( 500 ),
	start_time VARCHAR ( 500 ),
	estimated_retirement_time VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	maintainor VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_NET_PE_HIGH_DISTRIBUTION (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	related_site VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	system_type VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	system_code VARCHAR ( 500 ),
	system_rated_capacity VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_HIGH_DISTRIBUTION (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	related_site VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	device_type VARCHAR ( 500 ),
	device_subclass VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	device_code VARCHAR ( 500 ),
	product_name VARCHAR ( 500 ),
	vendor_id VARCHAR ( 500 ),
	related_system VARCHAR ( 500 ),
	reted_capacity VARCHAR ( 500 ),
	start_time VARCHAR ( 500 ),
	estimated_retirement_time VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	maintainor VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_NET_PE_HIGH_POWER (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	related_site VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	system_type VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	system_code VARCHAR ( 500 ),
	system_rated_capacity VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_HIGH_POWER (
	int_id VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	related_site VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	device_type VARCHAR ( 500 ),
	device_subclass VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	device_code VARCHAR ( 500 ),
	product_name VARCHAR ( 500 ),
	vendor_id VARCHAR ( 500 ),
	related_system VARCHAR ( 500 ),
	rated_output_voltage VARCHAR ( 500 ),
	monitoring_module_model VARCHAR ( 500 ),
	total_rack_loading_modules_number VARCHAR ( 500 ),
	total_rack_match_modules_number VARCHAR ( 500 ),
	signal_output_rated_capacity VARCHAR ( 500 ),
	start_time VARCHAR ( 500 ),
	estimated_retirement_time VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	maintainor VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_HIGH_DC_DISTRIBUTION (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	related_system  VARCHAR ( 500 ),
	reted_capacity  VARCHAR ( 500 ),
	total_input_port  VARCHAR ( 500 ),
	total_onput_port  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_NET_PE_LOW_DISTRIBUTION (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
	res_type  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	system_code  VARCHAR ( 500 ),
	system_rated_capacity  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_LOW_AC_DISTRIBUTION (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	related_system  VARCHAR ( 500 ),
	reted_capacity  VARCHAR ( 500 ),
	total_input_port  VARCHAR ( 500 ),
	total_output_port  VARCHAR ( 500 ),
	device_configuration_spd_brand  VARCHAR ( 500 ),
	spd_max_rate  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_NET_PE_SWITCH_POWER (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
	res_type  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	system_code  VARCHAR ( 500 ),
	system_rated_capacity  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_POWER_GENERATION (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	rated_power  VARCHAR ( 500 ),
	rated_output_voltage  VARCHAR ( 500 ),
	output_voltage_type  VARCHAR ( 500 ),
	self_start_function  VARCHAR ( 500 ),
	cooling_method  VARCHAR ( 500 ),
	installation_method  VARCHAR ( 500 ),
	backup_method  VARCHAR ( 500 ),
	related_system  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_NET_PE_OPEN_POWER (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
	res_type  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	system_code  VARCHAR ( 500 ),
	system_rated_capacity  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_SWITCH_POWER (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	related_system  VARCHAR ( 500 ),
	rated_output_voltage  VARCHAR ( 500 ),
	monitoring_module_model  VARCHAR ( 500 ),
	total_rack_loading_modules_number  VARCHAR ( 500 ),
	total_rack_match_modules_number  VARCHAR ( 500 ),
	signal_output_rated_capacity  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_LOW_DC_DISTRIBUTION (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	related_system  VARCHAR ( 500 ),
	reted_capacity  VARCHAR ( 500 ),
	total_input_port  VARCHAR ( 500 ),
	total_onput_port  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_NET_PE_UPS (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
	res_type  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	system_code  VARCHAR ( 500 ),
	system_rated_capacity  VARCHAR ( 500 ),
	work_method  VARCHAR ( 500 ),
	bus_type  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_UPS (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	related_system  VARCHAR ( 500 ),
	rated_capacity  VARCHAR ( 500 ),
	rated_output_voltage  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_BATTERY (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	ralated_power_device  VARCHAR ( 500 ),
	reted_capacity  VARCHAR ( 500 ),
	cell_voltage_level  VARCHAR ( 500 ),
	total_monomers_number  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_AIR (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	rated_cooling_capacity  VARCHAR ( 500 ),
	rated_input_power  VARCHAR ( 500 ),
	rated_operating_voltage  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_ENERY_SAVE (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	rated_cooling_capacity  VARCHAR ( 500 ),
	rated_input_power  VARCHAR ( 500 ),
	rated_operating_voltage  VARCHAR ( 500 ),
	total_system_capacity  VARCHAR ( 500 ),
	system_output_voltage  VARCHAR ( 500 ),
	total_fan_number  VARCHAR ( 500 ),
	fan_form  VARCHAR ( 500 ),
	fan_brand  VARCHAR ( 500 ),
	fan_rated_power  VARCHAR ( 500 ),
	solar_modules_number  VARCHAR ( 500 ),
	solar_modules_brand  VARCHAR ( 500 ),
	solar_modules_rated_capacity  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_POWER_MONITOR (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_SMART_METER (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	meter_circuit_number  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LINK_PE_IN (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	res_type  VARCHAR ( 500 ),
	related_device_type  VARCHAR ( 500 ),
	related_device  VARCHAR ( 500 ),
	branch_type  VARCHAR ( 500 ),
	branch_type_abbreviation  VARCHAR ( 500 ),
	branch_number  VARCHAR ( 500 ),
	branch_active_standby  VARCHAR ( 500 ),
	branch_rated_capacity  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	branch_name  VARCHAR ( 500 ),
	down_device_ralated_room  VARCHAR ( 500 ),
	down_device_name  VARCHAR ( 500 ),
	down_branch_name  VARCHAR ( 500 ),
	down_device_type  VARCHAR ( 500 ),
	down_branch_type  VARCHAR ( 500 ),
	down_branch_type_abbreviation  VARCHAR ( 500 ),
	down_branch_number  VARCHAR ( 500 ),
	down_branch_rated_capacity  VARCHAR ( 500 ),
	down_branch_active_standby  VARCHAR ( 500 ),
	down_use_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LINK_PE_OUT (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	res_type  VARCHAR ( 500 ),
	related_device_type  VARCHAR ( 500 ),
	related_device  VARCHAR ( 500 ),
	branch_type  VARCHAR ( 500 ),
	branch_type_abbreviation  VARCHAR ( 500 ),
	branch_number  VARCHAR ( 500 ),
	branch_active_standby  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	branch_name  VARCHAR ( 500 ),
	down_device_ralated_room  VARCHAR ( 500 ),
	down_device_type  VARCHAR ( 500 ),
	branch_rated_capacity  VARCHAR ( 500 ),
	down_device_name  VARCHAR ( 500 ),
	major_type  VARCHAR ( 500 ),
	down_device_related_rack  VARCHAR ( 500 ),
	rack_switch_name  VARCHAR ( 500 ),
	down_device_power  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_OTHER (
	int_id  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	device_code  VARCHAR ( 500 ),
	product_name  VARCHAR ( 500 ),
	vendor_id  VARCHAR ( 500 ),
	start_time  VARCHAR ( 500 ),
	estimated_retirement_time  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	maintainor  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	rated_capacity  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

create index if not exists idx_RM_SITE_PROPERTY2intId on RM_SITE_PROPERTY(int_id);
create index if not exists idx_RM_SITE_PROPERTY2zh_label on RM_SITE_PROPERTY(zh_label);
create index if not exists idx_RM_ROOM_PROPERTY2intId on RM_ROOM_PROPERTY(int_id);
create index if not exists idx_RM_ROOM_PROPERTY2zh_label on RM_ROOM_PROPERTY(zh_label);
create index if not exists idx_RM_ROOM_PROPERTY2power_related_site_name on RM_ROOM_PROPERTY(power_related_site_name);
create index if not exists idx_CE_DEVICE_PE_TRANSFORM2intId on CE_DEVICE_PE_TRANSFORM(int_id);
create index if not exists idx_CE_DEVICE_PE_TRANSFORM2related_site on CE_DEVICE_PE_TRANSFORM(related_site);
create index if not exists idx_CE_DEVICE_PE_TRANSFORM2related_room on CE_DEVICE_PE_TRANSFORM(related_room);
create index if not exists idx_CE_DECIVE_PE_TRANSFORM_DEVICE2intId on CE_DECIVE_PE_TRANSFORM_DEVICE(int_id);
create index if not exists idx_CE_DECIVE_PE_TRANSFORM_DEVICE2related_site on CE_DECIVE_PE_TRANSFORM_DEVICE(related_site);
create index if not exists idx_CE_DECIVE_PE_TRANSFORM_DEVICE2related_room on CE_DECIVE_PE_TRANSFORM_DEVICE(related_room);
create index if not exists idx_CE_NET_PE_HIGH_DISTRIBUTION2intId on CE_NET_PE_HIGH_DISTRIBUTION(int_id);
create index if not exists idx_CE_NET_PE_HIGH_DISTRIBUTION2related_site on CE_NET_PE_HIGH_DISTRIBUTION(related_site);
create index if not exists idx_CE_NET_PE_HIGH_DISTRIBUTION2related_room on CE_NET_PE_HIGH_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_DISTRIBUTION2intId on CE_DEVICE_PE_HIGH_DISTRIBUTION(int_id);
create index if not exists idx_CE_DEVICE_PE_HIGH_DISTRIBUTION2related_site on CE_DEVICE_PE_HIGH_DISTRIBUTION(related_site);
create index if not exists idx_CE_DEVICE_PE_HIGH_DISTRIBUTION2related_room on CE_DEVICE_PE_HIGH_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_DISTRIBUTION2related_system on CE_DEVICE_PE_HIGH_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_HIGH_POWER2intId on CE_NET_PE_HIGH_POWER(int_id);
create index if not exists idx_CE_NET_PE_HIGH_POWER2related_site on CE_NET_PE_HIGH_POWER(related_site);
create index if not exists idx_CE_NET_PE_HIGH_POWER2related_room on CE_NET_PE_HIGH_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_POWER2intId on CE_DEVICE_PE_HIGH_POWER(int_id);
create index if not exists idx_CE_DEVICE_PE_HIGH_POWER2related_room on CE_DEVICE_PE_HIGH_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_POWER2related_site on CE_DEVICE_PE_HIGH_POWER(related_site);
create index if not exists idx_CE_DEVICE_PE_HIGH_POWER2related_system on CE_DEVICE_PE_HIGH_POWER(related_system);
create index if not exists idx_CE_DEVICE_PE_HIGH_DC_DISTRIBUTION2intId on CE_DEVICE_PE_HIGH_DC_DISTRIBUTION(int_id);
create index if not exists idx_CE_DEVICE_PE_HIGH_DC_DISTRIBUTION2related_room on CE_DEVICE_PE_HIGH_DC_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_DC_DISTRIBUTION2related_site on CE_DEVICE_PE_HIGH_DC_DISTRIBUTION(related_site);
create index if not exists idx_CE_DEVICE_PE_HIGH_DC_DISTRIBUTION2related_system on CE_DEVICE_PE_HIGH_DC_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_LOW_DISTRIBUTION2intId on CE_NET_PE_LOW_DISTRIBUTION(int_id);
create index if not exists idx_CE_NET_PE_LOW_DISTRIBUTION2related_room on CE_NET_PE_LOW_DISTRIBUTION(related_room);
create index if not exists idx_CE_NET_PE_LOW_DISTRIBUTION2related_site on CE_NET_PE_LOW_DISTRIBUTION(related_site);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2intId on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(int_id);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2related_room on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2related_site on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(related_site);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2related_system on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(related_system);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2related_system on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_SWITCH_POWER2intId on CE_NET_PE_SWITCH_POWER(int_id);
create index if not exists idx_CE_NET_PE_SWITCH_POWER2related_room on CE_NET_PE_SWITCH_POWER(related_room);
create index if not exists idx_CE_NET_PE_SWITCH_POWER2related_site on CE_NET_PE_SWITCH_POWER(related_site);
create index if not exists idx_CE_DEVICE_PE_POWER_GENERATION2intId on CE_DEVICE_PE_POWER_GENERATION(int_id);
create index if not exists idx_CE_DEVICE_PE_POWER_GENERATION2related_room on CE_DEVICE_PE_POWER_GENERATION(related_room);
create index if not exists idx_CE_DEVICE_PE_POWER_GENERATION2related_site on CE_DEVICE_PE_POWER_GENERATION(related_site);
create index if not exists idx_CE_DEVICE_PE_POWER_GENERATION2related_system on CE_DEVICE_PE_POWER_GENERATION(related_system);
create index if not exists idx_CE_NET_PE_OPEN_POWER2intId on CE_NET_PE_OPEN_POWER(int_id);
create index if not exists idx_CE_NET_PE_OPEN_POWER2related_room on CE_NET_PE_OPEN_POWER(related_room);
create index if not exists idx_CE_NET_PE_OPEN_POWER2related_site on CE_NET_PE_OPEN_POWER(related_site);
create index if not exists idx_CE_DEVICE_PE_SWITCH_POWER2intId on CE_DEVICE_PE_SWITCH_POWER(int_id);
create index if not exists idx_CE_DEVICE_PE_SWITCH_POWER2related_room on CE_DEVICE_PE_SWITCH_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_SWITCH_POWER2related_site on CE_DEVICE_PE_SWITCH_POWER(related_site);
create index if not exists idx_CE_DEVICE_PE_SWITCH_POWER2related_system on CE_DEVICE_PE_SWITCH_POWER(related_system);
create index if not exists idx_CE_DEVICE_PE_LOW_DC_DISTRIBUTION2intId on CE_DEVICE_PE_LOW_DC_DISTRIBUTION(int_id);
create index if not exists idx_CE_DEVICE_PE_LOW_DC_DISTRIBUTION2related_room on CE_DEVICE_PE_LOW_DC_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_LOW_DC_DISTRIBUTION2related_site on CE_DEVICE_PE_LOW_DC_DISTRIBUTION(related_site);
create index if not exists idx_CE_DEVICE_PE_LOW_DC_DISTRIBUTION2related_system on CE_DEVICE_PE_LOW_DC_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_UPS2intId on CE_NET_PE_UPS(int_id);
create index if not exists idx_CE_NET_PE_UPS2related_room on CE_NET_PE_UPS(related_room);
create index if not exists idx_CE_NET_PE_UPS2related_site on CE_NET_PE_UPS(related_site);
create index if not exists idx_CE_DEVICE_PE_UPS2intId on CE_DEVICE_PE_UPS(int_id);
create index if not exists idx_CE_DEVICE_PE_UPS2related_room on CE_DEVICE_PE_UPS(related_room);
create index if not exists idx_CE_DEVICE_PE_UPS2related_site on CE_DEVICE_PE_UPS(related_site);
create index if not exists idx_CE_DEVICE_PE_UPS2related_system on CE_DEVICE_PE_UPS(related_system);
create index if not exists idx_CE_DEVICE_PE_BATTERY2intId on CE_DEVICE_PE_BATTERY(int_id);
create index if not exists idx_CE_DEVICE_PE_BATTERY2related_room on CE_DEVICE_PE_BATTERY(related_room);
create index if not exists idx_CE_DEVICE_PE_BATTERY2related_site on CE_DEVICE_PE_BATTERY(related_site);
create index if not exists idx_CE_DEVICE_PE_BATTERY2ralated_power_device on CE_DEVICE_PE_BATTERY(ralated_power_device);
create index if not exists idx_CE_DEVICE_PE_AIR2intId on CE_DEVICE_PE_AIR(int_id);
create index if not exists idx_CE_DEVICE_PE_AIR2related_room on CE_DEVICE_PE_AIR(related_room);
create index if not exists idx_CE_DEVICE_PE_AIR2related_site on CE_DEVICE_PE_AIR(related_site);
create index if not exists idx_CE_DEVICE_PE_ENERY_SAVE2intId on CE_DEVICE_PE_ENERY_SAVE(int_id);
create index if not exists idx_CE_DEVICE_PE_ENERY_SAVE2related_room on CE_DEVICE_PE_ENERY_SAVE(related_room);
create index if not exists idx_CE_DEVICE_PE_ENERY_SAVE2related_site on CE_DEVICE_PE_ENERY_SAVE(related_site);
create index if not exists idx_CE_DEVICE_PE_POWER_MONITOR2intId on CE_DEVICE_PE_POWER_MONITOR(int_id);
create index if not exists idx_CE_DEVICE_PE_POWER_MONITOR2related_room on CE_DEVICE_PE_POWER_MONITOR(related_room);
create index if not exists idx_CE_DEVICE_PE_POWER_MONITOR2related_site on CE_DEVICE_PE_POWER_MONITOR(related_site);
create index if not exists idx_CE_DEVICE_PE_SMART_METER2intId on CE_DEVICE_PE_SMART_METER(int_id);
create index if not exists idx_CE_DEVICE_PE_SMART_METER2related_room on CE_DEVICE_PE_SMART_METER(related_room);
create index if not exists idx_CE_DEVICE_PE_SMART_METER2related_site on CE_DEVICE_PE_SMART_METER(related_site);
create index if not exists idx_CE_LINK_PE_IN2intId on CE_LINK_PE_IN(int_id);
create index if not exists idx_CE_LINK_PE_IN2related_room on CE_LINK_PE_IN(related_room);
create index if not exists idx_CE_LINK_PE_IN2related_site on CE_LINK_PE_IN(related_site);
create index if not exists idx_CE_LINK_PE_IN2related_device on CE_LINK_PE_IN(related_device);
create index if not exists idx_CE_LINK_PE_IN2down_device_name on CE_LINK_PE_IN(down_device_name);
create index if not exists idx_CE_LINK_PE_IN2down_device_ralated_room on CE_LINK_PE_IN(down_device_ralated_room);
create index if not exists idx_CE_LINK_PE_OUT2intId on CE_LINK_PE_OUT(int_id);
create index if not exists idx_CE_LINK_PE_OUT2related_room on CE_LINK_PE_OUT(related_room);
create index if not exists idx_CE_LINK_PE_OUT2related_site on CE_LINK_PE_OUT(related_site);
create index if not exists idx_CE_LINK_PE_OUT2related_device on CE_LINK_PE_OUT(related_device);
create index if not exists idx_CE_LINK_PE_OUT2down_device_name on CE_LINK_PE_OUT(down_device_name);
create index if not exists idx_CE_LINK_PE_OUT2down_device_ralated_room on CE_LINK_PE_OUT(down_device_ralated_room);
create index if not exists idx_CE_LINK_PE_OUT2down_device_related_rack on CE_LINK_PE_OUT(down_device_related_rack);
create index if not exists idx_CE_DEVICE_PE_OTHER2intId on CE_DEVICE_PE_OTHER(int_id);
create index if not exists idx_CE_DEVICE_PE_OTHER2related_room on CE_DEVICE_PE_OTHER(related_room);
create index if not exists idx_CE_DEVICE_PE_OTHER2related_site on CE_DEVICE_PE_OTHER(related_site);

--承载网
drop table if exists CM_DEVICE_IP;
drop table if exists CM_WARE_IP_BOARD;
drop table if exists CE_PORT_IP_PTP;
drop table if exists CE_PORT_IP_FTP;
drop table if exists CE_LINK_PHYSICS;
drop table if exists CE_LINK_IP_LOGIC;

create table CM_DEVICE_IP(
int_id varchar(500),equipment_name varchar(500),equipment_model varchar(500),alisa_name varchar(500),ce_type varchar(500),rackpos_id varchar(500),network_element_type varchar(500),ipv4_management_address varchar(500),ipv6_management_address varchar(500),soft_version varchar(500),lifecycle_status varchar(500),cutin_date varchar(500),qualitor varchar(500),business_system varchar(500),equipment_type varchar(500),network_level varchar(500),pair_equipment_name varchar(500),rated_power varchar(500),cluster_attributes varchar(500),related_equiproom varchar(500),related_site varchar(500),assets_no varchar(500),manufacturer varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CM_WARE_IP_BOARD(
int_id varchar(500),board_name varchar(500),board_type varchar(500),board_number varchar(500),master_board_number varchar(500),slot_no varchar(500),related_shelf varchar(500),equipment_id varchar(500),series_no varchar(500),manufacturer varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CE_PORT_IP_PTP(
int_id varchar(500),physical_port_name varchar(500),port_number varchar(500),port_rate varchar(500),ipv4_address varchar(500),ipv6_address varchar(500),port_status varchar(500),port_type varchar(500),equipment_id varchar(500),line_type varchar(500),related_board varchar(500),province_id  varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CE_PORT_IP_FTP(
int_id varchar(500),logical_port_name varchar(500),ipv4_address varchar(500),ipv6_address varchar(500),relation_port varchar(500),equipment_id varchar(500),related_vpn varchar(500),vlan_id varchar(500),city_id varchar(500),province_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CE_LINK_PHYSICS(
int_id varchar(500),physical_link_name varchar(500),transmission_circuit_name varchar(500),circuit_bandwidth varchar(500),a_equipment varchar(500),a_port varchar(500),a_ip varchar(500),z_equipment varchar(500),z_port varchar(500),z_ip varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CE_LINK_IP_LOGIC(
int_id varchar(500),logic_link_name varchar(500),circuit_bandwidth varchar(500),a_equipment varchar(500),a_port varchar(500),z_equipment varchar(500),z_port varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create index if not exists idx_CE_LINK_IP_LOGIC2intId on CM_WARE_IP_BOARD(int_id);
create index if not exists idx_CE_PORT_IP_PTP2intId on CE_PORT_IP_PTP(int_id);
create index if not exists idx_CE_PORT_IP_FTP2intId on CE_PORT_IP_FTP(int_id);
create index if not exists idx_CE_LINK_PHYSICS2intId on CE_LINK_PHYSICS(int_id);
create index if not exists idx_CE_LINK_IP_LOGIC2intId on CE_LINK_IP_LOGIC(int_id);

--家客
DROP TABLE IF EXISTS CM_HOME_CUST_BUSINESS;
DROP TABLE IF EXISTS CE_BROADBAND_BUSINESS;
DROP TABLE IF EXISTS CE_IMS_BUSINESS;
DROP TABLE IF EXISTS CE_TV_BUSINESS;
DROP TABLE IF EXISTS RM_AREA_RESIDENTIAL;
DROP TABLE IF EXISTS RM_GRID;
DROP TABLE IF EXISTS CUST_RELATION_RESOURCES;
DROP TABLE IF EXISTS CM_DEVICE_ONU;
DROP TABLE IF EXISTS CM_ONU_PORT;
DROP TABLE IF EXISTS CM_DEVICE_OBD;
DROP TABLE IF EXISTS CM_OBD_PORT;
DROP TABLE IF EXISTS CE_DEVICE_DMT;
DROP TABLE IF EXISTS CE_DEVICE_GF;
DROP TABLE IF EXISTS CM_GF_PORT;
CREATE TABLE CM_HOME_CUST_BUSINESS (int_id VARCHAR ( 500 ),cust_num VARCHAR ( 500 ),related_standard_address VARCHAR ( 500 ),device_id VARCHAR ( 500 ),port_id VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CE_BROADBAND_BUSINESS (
int_id VARCHAR ( 500 ),broadband_inst_id VARCHAR ( 500 ),cust_num VARCHAR ( 500 ),enter_type VARCHAR ( 500 ),service_status VARCHAR ( 500 ),band_rate VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CE_IMS_BUSINESS (
int_id VARCHAR ( 500 ),ims_inst_id VARCHAR ( 500 ),cust_num VARCHAR ( 500 ),service_status VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CE_TV_BUSINESS (
int_id VARCHAR ( 500 ),tv_inst_id VARCHAR ( 500 ),cust_num VARCHAR ( 500 ),service_status VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE RM_AREA_RESIDENTIAL (
int_id VARCHAR ( 500 ),zh_label VARCHAR ( 500 ),location_id VARCHAR ( 500 ),ATTRIBUTES VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),related_grid VARCHAR ( 500 ),lifecycle_status VARCHAR ( 500 ),qualitor VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE RM_GRID (
int_id VARCHAR ( 500 ),grid_code VARCHAR ( 500 ),zh_label VARCHAR ( 500 ),related_area VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),lifecycle_status VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CUST_RELATION_RESOURCES (
int_id VARCHAR ( 500 ),room_address_id VARCHAR ( 500 ),relation_device_id VARCHAR ( 500 ),enter_type VARCHAR ( 500 ),relation_device_free_num VARCHAR ( 500 ),residential_id VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CM_DEVICE_ONU (
int_id VARCHAR ( 500 ),zh_label VARCHAR ( 500 ),loid_password VARCHAR ( 500 ),manufacturer VARCHAR ( 500 ),model VARCHAR ( 500 ),enter_type VARCHAR ( 500 ),relation_up_device_id VARCHAR ( 500 ),relation_up_device_port VARCHAR ( 500 ),port_num VARCHAR ( 500 ),install_box_id VARCHAR ( 500 ),qualitor VARCHAR ( 500 ),maintainor VARCHAR ( 500 ),lifecycle_status VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CM_ONU_PORT (
int_id VARCHAR ( 500 ),onu_id VARCHAR ( 500 ),port_num VARCHAR ( 500 ),port_status VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CM_DEVICE_OBD (
int_id VARCHAR ( 500 ),zh_label VARCHAR ( 500 ),up_to_device VARCHAR ( 500 ),splitter_ratio VARCHAR ( 500 ),link_to_device VARCHAR ( 500 ),link_to_device_port VARCHAR ( 500 ),link_to_device_sub_port VARCHAR ( 500 ),lifecycle_status VARCHAR ( 500 ),qualitor VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CM_OBD_PORT (
int_id VARCHAR ( 500 ),port_no VARCHAR ( 500 ),port_status VARCHAR ( 500 ),related_device VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CE_DEVICE_DMT (
int_id VARCHAR ( 500 ),zh_label VARCHAR ( 500 ),lifecycle_status VARCHAR ( 500 ),qualitor VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CE_DEVICE_GF (
int_id VARCHAR ( 500 ),zh_label VARCHAR ( 500 ),sub_device_type VARCHAR ( 500 ),lifecycle_status VARCHAR ( 500 ),qualitor VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE TABLE CM_GF_PORT (
int_id VARCHAR ( 500 ),port_no VARCHAR ( 500 ),port_status VARCHAR ( 500 ),related_device VARCHAR ( 500 ),province_id VARCHAR ( 500 ),city_id VARCHAR ( 500 ),county_id VARCHAR ( 500 ),dims_col_result TEXT,dims_col_rtName TEXT
);
CREATE INDEX IF NOT EXISTS idx_CM_HOME_CUST_BUSINESS2intId ON CM_HOME_CUST_BUSINESS ( int_id );
CREATE INDEX IF NOT EXISTS idx_CE_BROADBAND_BUSINESS2intId ON CE_BROADBAND_BUSINESS ( int_id );
CREATE INDEX IF NOT EXISTS idx_CE_IMS_BUSINESS2intId ON CE_IMS_BUSINESS ( int_id );
CREATE INDEX IF NOT EXISTS idx_CE_TV_BUSINESS2intId ON CE_TV_BUSINESS ( int_id );
CREATE INDEX IF NOT EXISTS idx_RM_AREA_RESIDENTIAL2intId ON RM_AREA_RESIDENTIAL ( int_id );
CREATE INDEX IF NOT EXISTS idx_GRID2intId ON RM_GRID ( int_id );
CREATE INDEX IF NOT EXISTS idx_CUST_RELATION_RESOURCES2intId ON CUST_RELATION_RESOURCES ( int_id );
CREATE INDEX IF NOT EXISTS idx_CM_DEVICE_ONU2intId ON CM_DEVICE_ONU ( int_id );
CREATE INDEX IF NOT EXISTS idx_CM_ONU_PORT2intId ON CM_ONU_PORT ( int_id );
CREATE INDEX IF NOT EXISTS idx_CM_DEVICE_OBD2intId ON CM_DEVICE_OBD ( int_id );
CREATE INDEX IF NOT EXISTS idx_CM_OBD_PORT2intId ON CM_OBD_PORT ( int_id );
CREATE INDEX IF NOT EXISTS idx_CE_DEVICE_DMT2intId ON CE_DEVICE_DMT ( int_id );
CREATE INDEX IF NOT EXISTS idx_CE_DEVICE_GF2intId ON CE_DEVICE_GF ( int_id );
CREATE INDEX IF NOT EXISTS idx_CM_GF_PORT2intId ON CM_GF_PORT ( int_id );

create or replace function to_number(anyelement) returns numeric as
$$
 declare
 begin
    return $1::numeric;
 exception when others then
    return null;
 end;
$$ language plpgsql immutable;

--创建定制的核查指标的存过
create or replace function proc_createOneProcIndex(p_specialityName varchar,p_tablename varchar,p_indexname varchar,p_indexCode varchar) returns void as
$$
declare
   v_procName   varchar(50);
begin
	 v_procName := 'PROC_'||upper(p_indexCode);
	 insert into dims_idx_index(name,code,entitytype_id,orderby,specialityName,type,isEnable,creator,updater,memo,procName,threadNo,priority)
	 select p_indexname,p_indexCode,id,substring(p_indexCode, '[0-9]+\M')::integer,p_specialityName,1,1,'db','db',v_procName,v_procName,me.id,1
		 from dims_mm_entitytype me
	  where extensiontable=p_tablename
		  and not exists(select 1 from dims_idx_index where code=p_indexCode);
end;
$$ language plpgsql;

--根据已标记的数据生成指标
create or replace function proc_generateCommonIndexValue(p_provinceCode varchar,p_taskCode varchar,p_indexId integer,p_tableName varchar,p_condition varchar default null) returns void as
$$
declare
   v_idxName          varchar(100);
	 v_idxCode          varchar(100);
	 cur	              refcursor;
	 v_tabWhereSql      text;
	 v_selectSql        text;
	 v_provinceCode     varchar(100);
   v_prefectureCode   varchar(100);
   v_countyCode       varchar(100);
   v_amount	          integer;
   v_errorCount       integer;
   v_count	          integer;
begin

   --指标属性
	 select name,code
	   into v_idxName,v_idxCode
	   from dims_idx_index
	  where id=p_indexId;

	 --支持重复核查
   delete from dims_tm_taskItem_index where taskcode=p_taskCode and index_id=p_indexId;

   select count(1)
     into v_count
     from dims_mm_entitytype me,dims_mm_attributetype attr
    where attr.columnname in ('PROVINCE_ID','CITY_ID','COUNTY_ID')
      and attr.entitytype_id=me.id
      and me.extensiontable=upper(p_tableName);

   --带条件?
   if p_condition is null then
      v_tabWhereSql := p_tableName;
   else
      v_tabWhereSql := p_tableName ||' t1 where '||p_condition;
   end if;

	 --区县的指标
	 if v_count =3 then
		 v_selectSql := 'select '''||p_provinceCode||''',city_id,county_id,
		                        count(1) amount,
		                        coalesce(sum(case when dims_col_result like ''%'||v_idxCode||'%'' then 1 else 0 end),0) errorCount
		                  from '||v_tabWhereSql||'
		                 group by city_id,county_id';
	 else
	   v_selectSql := 'select '''||p_provinceCode||''',null,null,
		                        count(1) amount,
		                        coalesce(sum(case when dims_col_result like ''%'||v_idxCode||'%'' then 1 else 0 end),0) errorCount
		                  from '||v_tabWhereSql;
	 end if;

	 open cur for execute v_selectSql;
	 fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_amount,v_errorCount;

	 while found loop
	    insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                      provinceCode,prefectureCode,countyCode,regionType,
	                                      amount,errorAmount,indexValue,creator,updater)
      values(v_idxName,v_idxCode,p_taskCode,p_indexId,
             v_provinceCode,v_prefectureCode,v_countyCode,3,
             v_amount,v_errorCount,null,'db','db');

	    fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_amount,v_errorCount;
	 end loop;
	 close cur;

   --没有数据，就插入一条区县级别的0，0，0
   select count(1)
     into v_count
     from dims_tm_taskItem_index
    where taskcode=p_taskCode
      and index_id=p_indexId;
   if v_count =0 then
     insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
                                        province,
	                                      provinceCode,prefectureCode,countyCode,regionType,
	                                      amount,errorAmount,indexValue,creator,updater)
      values(v_idxName,v_idxCode,p_taskCode,p_indexId,
             (select name from dims_tm_areaCodeConfig where code=p_provinceCode and regiontype=1),
             p_provinceCode,null,null,3,
             0,0,0,'db','db');
   end if;

   --原始数据provicecode为空的更新一下
	 update dims_tm_taskItem_index t
      set provinceCode=p_provinceCode
    where provinceCode is null
      and taskcode=p_taskCode
      and index_id=p_indexId;

   --地市的指标:regionType=2
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
   select v_idxName,v_idxCode,p_taskCode,p_indexId,
          provinceCode,prefectureCode,null,2,
          sum(amount),sum(errorAmount),null,'db','db'
     from dims_tm_taskItem_index
    where taskcode=p_taskCode
      and index_id=p_indexId
      and regionType=3
   group by provinceCode,prefectureCode;

	 --省份的指标:regionType=1
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
   select v_idxName,v_idxCode,p_taskCode,p_indexId,
          provinceCode,null,null,1,
          sum(amount),sum(errorAmount),null,'db','db'
     from dims_tm_taskItem_index
    where taskcode=p_taskCode
      and index_id=p_indexId
      and regionType=3
   group by provinceCode;

   --指标值,更新指标的区域名称
   update dims_tm_taskItem_index t
      set indexValue=(case when amount=0 then 0 else (amount-errorAmount)::numeric(20,5)/amount end),
          province=(select name from dims_tm_areaCodeConfig where code=t.provinceCode and regiontype=1),
          prefecture=(select name from dims_tm_areaCodeConfig where code=t.prefectureCode and regiontype=2),
          county=(select name from dims_tm_areaCodeConfig where code=t.countyCode and regiontype=3)
    where taskcode=p_taskCode
      and index_id=p_indexId;
end;
$$ language plpgsql;

--判断是否为空
create or replace function isNull(anyelement) returns boolean as
$$
declare
begin
   if $1 is null then
	    return true;
	 end if;

	 if $1::text  = ''::text then
	    return true;
	 end if;

	 return false;
exception when others then
   return false;
end;
$$ language plpgsql immutable;

create or replace function isNotNull(anyelement) returns boolean as
$$
   select isNull($1) =false;
$$ language sql immutable;


--3,指标集合对应的存过
create or replace function proc_checkOneIndexSet(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare
   v_idxName          varchar(100);
	 v_idxCode          varchar(100);
	 v_idxAmount        integer;
begin

	 --指标属性
	 select name,code
	   into v_idxName,v_idxCode
	   from dims_idx_index
	  where id=p_indexId;

	 --支持重复核查
   delete from dims_tm_taskItem_index where taskcode=p_taskCode and index_id=p_indexId;

   --指标个数
   select count(1) into v_idxAmount from dims_idx_IndexCarrier where parentIndex_id=p_indexId;
   if v_idxAmount = 0 then
      v_idxAmount := 1;
   end if;

   --区县的指标:regionType=3
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskCode,p_indexId,
	        provinceCode,prefectureCode,countyCode,3,
	        null,null,coalesce(sum(it.indexValue)/v_idxAmount,0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.regionType=3
	    and it.taskcode=p_taskCode
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId
	 group by provinceCode,prefectureCode,countyCode;

   --地市的指标:regionType=2
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskCode,p_indexId,
	        provinceCode,prefectureCode,null,2,
	        null,null,coalesce(sum(it.indexValue)/v_idxAmount,0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.regionType=2
	    and it.taskcode=p_taskCode
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId
	 group by provinceCode,prefectureCode;

	 --省份的指标:regionType=1
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskCode,p_indexId,
	        provinceCode,null,null,1,
	        null,null,coalesce(sum(it.indexValue)/v_idxAmount,0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.regionType=1
	    and it.taskcode=p_taskCode
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId
	 group by provinceCode;

   --指标值,更新指标的区域名称
   update dims_tm_taskItem_index t
      set province=(select name from dims_tm_areaCodeConfig where code=t.provinceCode and regiontype=1),
          prefecture=(select name from dims_tm_areaCodeConfig where code=t.prefectureCode and regiontype=2),
          county=(select name from dims_tm_areaCodeConfig where code=t.countyCode and regiontype=3)
    where taskcode=p_taskCode
      and index_id=p_indexId;
end;
$$ language plpgsql;

--执行动态sql指标，跟proc_dh_checkOneRelevancyIndex有点重复，将来要替换后者。
create or replace function proc_checkOneDynamicSqlIndex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare
	 v_errorSql         text;
	 v_extensiontable   varchar(255);
begin

   select idx.errorSql,me.extensiontable
	   into v_errorSql,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;

   --错误数据标记
	 execute v_errorSql;

   --生成指标
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,v_extensiontable);
end;
$$ language plpgsql;

--2.1.2.2	必填性分析类指标：分析存过
create or replace function proc_dh_checkOneIntegralityIndex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare
	 v_idxCode	        text;
	 v_idxName          text;
	 v_entitytypeId     integer;
	 v_extensiontable   text;
	 curAttr            record;
	 cur	              refcursor;
	 v_attrAmount	      integer := 0;
	 v_whereSql         text;
	 v_columnError      text;
	 v_selectSql        text;
   v_updateSql        text;
   v_provinceCode     varchar(100);
   v_prefectureCode   varchar(100);
   v_countyCode       varchar(100);
   v_amount           integer;
   v_errorCount	      integer;
   v_count	          integer;
   v_countRegionCode  integer;

begin

   --支持重复核查
   delete from dims_tm_taskItem_index where taskcode=p_taskCode and index_id=p_indexId;

   select idx.name,idx.code,idx.entitytype_id,me.extensiontable
	   into v_idxName,v_idxCode,v_entitytypeId,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;

   select count(1)
     into v_countRegionCode
     from dims_mm_entitytype me,dims_mm_attributetype attr
    where attr.columnname in ('PROVINCE_ID','CITY_ID','COUNTY_ID')
      and attr.entitytype_id=me.id
      and me.extensiontable=upper(v_extensiontable);

   if v_countRegionCode =3 then
      v_selectSql := 'select '''||p_provinceCode||''',city_id,county_id,count(1) amount,coalesce(sum(0';
   else
      v_selectSql := 'select '''||p_provinceCode||''',null,null,count(1) amount,coalesce(sum(0';
   end if;

	 v_columnError := '(''';
	 for curAttr in (select row_number() over() as rownum,ma.columnName,ma.name
		                 from dims_idx_rule r,dims_mm_attributetype ma
		                where ma.id=r.attributeType_id
		                  and r.type =2
		                  and r.index_id=p_indexId)
	 loop
	    v_attrAmount := v_attrAmount + 1;
	    if curAttr.rownum =1 then
	       v_whereSql := ' isNull('||curAttr.columnName||')';
	    else
	       v_whereSql := v_whereSql||' or isNull('||curAttr.columnName||')';
	    end if;

	    v_selectSql := v_selectSql||'+(case when isNull('||curAttr.columnName||') then 1 else 0 end)';
	    v_columnError := v_columnError||'||(case when isNull('||curAttr.columnName||') then ''、'||curAttr.name||''' else '''' end)';
	 end loop;
	 v_columnError := v_columnError||'||'')';

	 --标记错误数据
	 v_updateSql:= 'update '||v_extensiontable ||' c
			               set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
					                                     when dims_col_result is null then '''||v_idxCode||'''
								    						              else dims_col_result||'','||v_idxCode||''' end),
								        dims_col_rtName=replace((case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
					                                            when dims_col_rtName is null then ''不满足规范:'||v_idxName||v_columnError||'''
								    						                     else dims_col_rtName||'','||v_idxName||v_columnError||''' end),''(、'',''('')
								  where' || v_whereSql;

	 execute v_updateSql;

	 --区县的指标
	 if v_countRegionCode =3 then
      v_selectSql := v_selectSql||'),0) errorAmount from '||v_extensiontable||' group by city_id,county_id';
   else
      v_selectSql := v_selectSql||'),0) errorAmount from '||v_extensiontable;
   end if;

	 open cur for execute v_selectSql;
	 fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_amount,v_errorCount;

	 while found loop
	    insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                      provinceCode,prefectureCode,countyCode,regionType,
	                                      amount,errorAmount,indexValue,creator,updater)
      values(v_idxName,v_idxCode,p_taskCode,p_indexId,
             v_provinceCode,v_prefectureCode,v_countyCode,3,
             v_amount*v_attrAmount,v_errorCount,null,'db','db');

	    fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_amount,v_errorCount;
	 end loop;
	 close cur;

	 --没有数据，就插入一条区县级别的0，0，0
   select count(1)
     into v_count
     from dims_tm_taskItem_index
    where taskcode=p_taskCode
      and index_id=p_indexId;
   if v_count =0 then
     insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
                                        province,
	                                      provinceCode,prefectureCode,countyCode,regionType,
	                                      amount,errorAmount,indexValue,creator,updater)
      values(v_idxName,v_idxCode,p_taskCode,p_indexId,
             (select name from dims_tm_areaCodeConfig where code=p_provinceCode and regiontype=1),
             p_provinceCode,null,null,3,
             0,0,0,'db','db');
   end if;

   --原始数据provicecode为空的更新一下
	 update dims_tm_taskItem_index t
      set provinceCode=p_provinceCode
    where provinceCode is null
      and taskcode=p_taskCode
      and index_id=p_indexId;

	 --地市的指标
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
   select v_idxName,v_idxCode,p_taskCode,p_indexId,
          provinceCode,prefectureCode,null,2,
          sum(amount),sum(errorAmount),null,'db','db'
     from dims_tm_taskItem_index
    where taskcode=p_taskCode
      and index_id=p_indexId
      and regionType=3
   group by provinceCode,prefectureCode;

	 --省份的指标
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
   select v_idxName,v_idxCode,p_taskCode,p_indexId,
          provinceCode,null,null,1,
          sum(amount),sum(errorAmount),null,'db','db'
     from dims_tm_taskItem_index
    where taskcode=p_taskCode
      and index_id=p_indexId
      and regionType=3
   group by provinceCode;

   --指标值,更新指标的区域名称
   update dims_tm_taskItem_index t
      set indexValue=(case when amount=0 then 0 else (amount-errorAmount)::numeric(20,5)/amount end),
          province=(select name from dims_tm_areaCodeConfig where code=t.provinceCode and regiontype=1),
          prefecture=(select name from dims_tm_areaCodeConfig where code=t.prefectureCode and regiontype=2),
          county=(select name from dims_tm_areaCodeConfig where code=t.countyCode and regiontype=3)
    where taskcode=p_taskCode
      and index_id=p_indexId;
end;
$$ language plpgsql;

--关联性指标存过
create or replace function proc_dh_checkOneRelevancyIndex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare
	 v_errorSql         text;
	 v_extensiontable   varchar(255);
begin

   select idx.errorSql,me.extensiontable
	   into v_errorSql,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;

   --错误数据标记
	 execute v_errorSql;

   --生成指标
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,v_extensiontable);
end;
$$ language plpgsql;

-- ------------------------------
-- 字典规范性查询
-- Function structure for proc_checkonedictaccuracyindex  type=4
-- ----------------------------
create or replace function proc_checkonedictaccuracyindex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer)returns void as
$$
declare
   v_idxName          text;
   v_idxCode          text;
   v_entitytypeId     integer;
   v_sql              text;
	 v_province	        varchar(100);
	 v_tableName	      varchar(100);
	 v_columnName	      varchar(100);
	 v_dictTypeId	      integer;
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

   --select province,startTime
	--   into v_province,v_collectionDate
	--	 from dims_tm_task
	--	where id=p_taskCode;

	 select name,code,entitytype_id
	   into v_idxName,v_idxCode,v_entitytypeId
	   From dims_idx_index
	  where id=p_indexId;

	 select extensiontable
	   into strict v_tableName
	   from dims_mm_entitytype
	  where id=v_entitytypeId;

	 select attr.columnName,attr.dictionarytype_id
	   into strict v_columnName,v_dictTypeId
	   from dims_idx_rule r,dims_mm_attributetype attr
	  where attr.dictionarytype_id is not null
	    and attr.id=r.attributeType_id
	    and r.type=1
	    and r.index_id=p_indexId;

	 --总量
	 v_sql := 'select count(1) from '||v_tableName;
   execute v_sql into v_amount;

	 --错误量
	 v_sql := 'update '||v_tableName||' c
		            set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
		                                      when dims_col_result is null then '''||v_idxCode||'''
			 												            else dims_col_result||'','||v_idxCode||''' end),
										dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
				                                  when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
										  					          else dims_col_rtName||'','||v_idxName||''' end)
							where not exists(select 1
							                   from dims_mm_dictionary dict
							                  where dict.dictionarytype_id='||v_dictTypeId||'
							                    and dict.dictvalue=c.'||v_columnName||')
							  and isNotNull('||v_columnName||')';
   execute v_sql;
	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexid,v_tableName);
end;
$$
  LANGUAGE plpgsql
  COST 100;
--根据经纬度计算距离，返回数据以公里为单位
create or replace function   getdistance(p_latbegin REAL,p_lngbegin REAL,p_latend REAL,p_lngend REAL) returns float as
$$

declare
v_distance			real;
v_earth_radius		real:=6378.137;
v_radlatbegin		real;
v_radlatend			real;
v_radlatdiff		real;
v_radlngdiff		real;

begin

    v_radlatbegin := p_latbegin * pi()/180.0;
    v_radlatend   := p_latend * pi()/180.0;
	v_radlatdiff  := v_radlatbegin - v_radlatend;
    v_radlngdiff  := p_lngbegin * pi()/180.0 - p_lngend * pi()/180.0;

    v_distance := 2 * asin(sqrt(power(sin(v_radlatdiff / 2), 2) + cos(v_radlatbegin) * cos(v_radlatend) * power(sin(v_radlngdiff/2),2)));
    v_distance := v_distance * v_earth_radius;
	--return kilometer
    return v_distance;
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION isfloat(txtstr varchar)
  RETURNS boolean AS $$
BEGIN
	RETURN txtStr ~ '^([0-9]+[.][0-9]*|[.][0-9]+)$' ;
END ;
$$ language plpgsql
COST 100;
  
  CREATE OR REPLACE FUNCTION isnotfloat(txtstr varchar)
  RETURNS boolean AS $$
BEGIN
	if txtStr ~ '^([0-9]+[.][0-9]*|[.][0-9]+)$' then
     return false;
	 else
	   return true;
   end if;
END ;
 $$ language plpgsql
 COST 100;
 
 CREATE OR REPLACE FUNCTION "public"."proc_checkonecoordinateindex"("p_provincecode" varchar, "p_taskcode" varchar, "p_indexid" int4)
  RETURNS "pg_catalog"."void" AS $BODY$
declare 
	 v_entitytypeId     integer;
	 v_idxCode	        text;
	 v_idxName          text;
	 v_tableName        varchar(100);
	 v_longitude_min    numeric(16,9);--经度低值
   v_longitude_max    numeric(16,9);--经度高值
   v_latitude_min     numeric(16,9);--纬度低值
   v_latitude_max     numeric(16,9); --纬度高值
	 curAttr            record;
   v_sql              text;
   v_amount   	      integer;
	 v_errorAmount      integer := 0;

	 
begin 
		select name,code,entitytype_id
	   into v_idxName,v_idxCode,v_entitytypeId
	   From dims_idx_index
	  where id=p_indexId;

	 select extensiontable
	   into strict v_tableName
	   from dims_mm_entitytype
	  where id=v_entitytypeId;

      
   select longitude_min,longitude_max,latitude_min,latitude_max
     into v_longitude_min,v_longitude_max,v_latitude_min,v_latitude_max
     from dims_tm_coordinateConfig
    where province=p_provincecode; 

	 --总的行数 
	 v_sql := 'select count(1) from '||v_tableName;
   execute v_sql into v_amount;

   --错误量
   v_sql := 'update '||v_tableName ||' c
			          set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
					                                when dims_col_result is null then '''||v_idxCode||'''
							      						          else dims_col_result||'','||v_idxCode||''' end),
									  dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
					                                when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
									    					          else dims_col_rtName||'','||v_idxName||''' end)					           
						  where isNull(longitude)
						     or to_number(longitude) > '||v_longitude_max
						 ||' or to_number(longitude) < '||v_longitude_min
             ||' or isNull(latitude)
						     or to_number(latitude) > '||v_latitude_max
						 ||' or to_number(latitude) < '||v_latitude_min;
	 execute v_sql;
   get diagnostics v_errorAmount = row_count; 
			   	 
 --指标值统计
	 perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexid,v_tableName);
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;