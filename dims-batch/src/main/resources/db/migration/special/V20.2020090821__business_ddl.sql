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
drop table if exists WX_BOARD;
drop table if exists WX_PORT;
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
int_id  varchar(500),zh_label 	varchar(500),userlabel 	varchar(500),related_omc 	varchar(500),location_type varchar(500),related_room_location	varchar(500),vendor_id 	varchar(500),product_name varchar(500),software_version varchar(500),lifecycle_status varchar(500),setup_time 	varchar(500),vip_type 	varchar(500),net_model 	varchar(500),beehive_type varchar(500),related_bsc 	varchar(500),qualitor 	varchar(500),maintainor 	varchar(500),province_id 	varchar(500),city_id  varchar(500),county_id 	varchar(500),dims_col_result text,dims_col_rtName text
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
create table WX_BOARD(
int_id varchar(500),board_serial varchar(500),product_name varchar(500),physical_location varchar(500),board_function_type varchar(500),related_bs varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table WX_PORT(
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
create index if not exists idx_BOARD2intId on WX_BOARD(int_id);
create index if not exists idx_PORT2intId on WX_PORT(int_id);
create index if not exists idx_ANTENNA2intId on ANTENNA(int_id);
create index if not exists idx_ANTENNAPARA2intId on ANTENNAPARA(int_id);
create index if not exists idx_TOWER2intId on TOWER(int_id);
create index if not exists idx_RPT2intId on RPT(int_id);
create index if not exists idx_SPEARD2intId on SPEARD(int_id);
create index if not exists idx_PICOAP2intId on PICOAP(int_id);
create index if not exists idx_PICOAU2intId on PICOAU(int_id);
create index if not exists idx_PICOSWITCH2intId on PICOSWITCH(int_id);
-- create index if not exists idx_BOARD2RelatedBs on WX_BOARD(related_bs);


create index if not exists idx_OMC2zh_label on OMC(zh_label);
create index if not exists idx_BTS2related_room_location on BTS(related_room_location);
create index if not exists idx_ENODEB2related_room_location on ENODEB(related_room_location);
create index if not exists idx_GNODEB2related_room_location on GNODEB(related_room_location);
create index if not exists idx_BTS2zh_label on BTS(zh_label);
create index if not exists idx_RTK2related_room_location on RTK(related_room_location);
create index if not exists idx_CELL2related_room_location on CELL(related_room_location);
create index if not exists idx_CELL2related_bs on CELL(related_bs);
create index if not exists idx_ENODEB2zh_label on ENODEB(zh_label);
create index if not exists idx_NRCELL2related_room_location on NRCELL(related_room_location);
create index if not exists idx_NRCELL2related_bs on NRCELL(related_bs);
create index if not exists idx_GNODEB2zh_label on GNODEB(zh_label);
create index if not exists idx_BBU2related_bs on BBU(related_bs);
create index if not exists idx_RRU2related_room_location on RRU(related_room_location);
create index if not exists idx_RRU2related_cell on RRU(related_cell);
create index if not exists idx_RTK2zh_label on RTK(zh_label);
create index if not exists idx_DU2related_bs on DU(related_bs);
create index if not exists idx_DU2related_room_location on DU(related_room_location);
create index if not exists idx_CU2related_room_location on CU(related_room_location);
create index if not exists idx_CELL2zh_label on CELL(zh_label);
create index if not exists idx_AAU2related_room_location on AAU(related_room_location);
create index if not exists idx_AAU2related_cell on AAU(related_cell);
create index if not exists idx_WX_BOARD2related_bs on WX_BOARD(related_bs);
create index if not exists idx_EUTRANCELL2zh_label on EUTRANCELL(zh_label);
create index if not exists idx_WX_PORT2related_ne on WX_PORT(related_ne);
create index if not exists idx_ANTENNA2related_tower on ANTENNA(related_tower);
create index if not exists idx_ANTENNAPARA2related_cell on ANTENNAPARA(related_cell);
create index if not exists idx_ANTENNAPARA2related_antenna on ANTENNAPARA(related_antenna);
create index if not exists idx_NRCELL2zh_label on NRCELL(zh_label);
create index if not exists idx_TOWER2related_room_location on TOWER(related_room_location);
create index if not exists idx_BBU2zh_label on BBU(zh_label);
create index if not exists idx_RPT2related_room_location on RPT(related_room_location);
create index if not exists idx_RPT2related_cell on RPT(related_cell);
create index if not exists idx_RRU2zh_label on RRU(zh_label);
create index if not exists idx_SPEARD2related_location on SPEARD(related_location);
create index if not exists idx_SPEARD2related_bs on SPEARD(related_bs);
create index if not exists idx_DU2zh_label on DU(zh_label);
create index if not exists idx_SPEARD2related_cell on SPEARD(related_cell);
create index if not exists idx_CU2zh_label on CU(zh_label);
create index if not exists idx_AAU2zh_label on AAU(zh_label);
create index if not exists idx_PICOAP2related_femto on PICOAP(related_femto);
create index if not exists idx_PICOAU2related_femto on PICOAU(related_femto);
create index if not exists idx_PICOSWITCH2related_femto on PICOSWITCH(related_femto);
create index if not exists idx_ANTENNA2zh_label on ANTENNA(zh_label);
create index if not exists idx_TOWER2zh_label on TOWER(zh_label);
create index if not exists idx_RPT2zh_label on RPT(zh_label);
create index if not exists idx_SPEARD2zh_label on SPEARD(zh_label);
create index if not exists idx_PICOAP2zh_label on PICOAP(zh_label);
create index if not exists idx_PICOAU2zh_label on PICOAU(zh_label);
create index if not exists idx_PICOSWITCH2zh_label on PICOSWITCH(zh_label);






--承载网
create table CM_DEVICE_IP(
int_id varchar(500),equipment_name varchar(500),equipment_model varchar(500),alisa_name varchar(500),ce_type varchar(500),rackpos_id varchar(500),network_element_type varchar(500),ipv4_management_address varchar(500),ipv6_management_address varchar(500),soft_version varchar(500),lifecycle_status varchar(500),cutin_date varchar(500),qualitor varchar(500),business_system varchar(500),equipment_type varchar(500),network_level varchar(500),pair_equipment_name varchar(500),rated_power varchar(500),cluster_attributes varchar(500),related_equiproom varchar(500),related_site varchar(500),assets_no varchar(500),manufacturer varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500), start_u varchar(500),
occupy_u_count varchar(500),related_rack varchar(500),dims_col_result text,dims_col_rtName	text
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
create table CE_ADDRESS_IP_V4(
int_id varchar(500),zh_label varchar(500),business_status varchar(500),address_segment_name varchar(500),equipment_id varchar(500),port_id varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CE_SEGMENT_IP_V4(
int_id varchar(500),zh_label varchar(500),business_system varchar(500),equipment_id varchar(500),usage_description varchar(500),business_status varchar(500),address_type varchar(500),partition_state varchar(500),vpn_name varchar(500),three_line_ip_address varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,dims_col_rtName	text
);
create table CE_ADDRESS_IP_V6(
int_id varchar(500),zh_label varchar(500),business_status varchar(500),address_segment_name varchar(500),equipment_id varchar(500),port_id varchar(500),address_business_system varchar(500),ip_address_type varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500), dims_col_result text,    dims_col_rtName	text
);
create table CE_SEGMENT_IP_V6(
int_id varchar(500),zh_label varchar(500),type_identifier varchar(500),network_type varchar(500),prefix_length varchar(500),partition_state varchar(500),business_status varchar(500),ipv6_address_segment_purpose varchar(500),affiliated_business varchar(500),equipment_id varchar(500),usage_description varchar(500),vpn_name varchar(500),three_line_ip_address varchar(500),province_id varchar(500),city_id varchar(500),county_id varchar(500),dims_col_result text,    dims_col_rtName text
);

create index if not exists idx_CM_DEVICE_IP2intId on CM_DEVICE_IP(int_id);
create index if not exists idx_CM_WARE_IP_BOARD2intId on CM_WARE_IP_BOARD(int_id);
create index if not exists idx_CE_PORT_IP_PTP2intId on CE_PORT_IP_PTP(int_id);
create index if not exists idx_CE_PORT_IP_FTP2intId on CE_PORT_IP_FTP(int_id);
create index if not exists idx_CE_LINK_PHYSICS2intId on CE_LINK_PHYSICS(int_id);
create index if not exists idx_CE_LINK_IP_LOGIC2intId on CE_LINK_IP_LOGIC(int_id);
create index if not exists idx_CE_ADDRESS_IP_V4_LOGIC2intId on CE_ADDRESS_IP_V4(int_id);
create index if not exists idx_CE_SEGMENT_IP_V4_LOGIC2intId on CE_SEGMENT_IP_V4(int_id);
create index if not exists idx_CE_ADDRESS_IP_V6_LOGIC2intId on CE_ADDRESS_IP_V6(int_id);
create index if not exists idx_CE_SEGMENT_IP_V6_LOGIC2intId on CE_SEGMENT_IP_V6(int_id);

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
DROP TABLE IF EXISTS JIAKE_CE_DEVICE_GF;
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
CREATE TABLE JIAKE_CE_DEVICE_GF (
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
CREATE INDEX IF NOT EXISTS idx_CE_DEVICE_GF2intId ON JIAKE_CE_DEVICE_GF ( int_id );
CREATE INDEX IF NOT EXISTS idx_CM_GF_PORT2intId ON CM_GF_PORT ( int_id );


create index if not exists idx_CM_HOME_CUST_BUSINESS2related_standard_address on CM_HOME_CUST_BUSINESS(related_standard_address);
create index if not exists idx_CM_HOME_CUST_BUSINESS2device_id on CM_HOME_CUST_BUSINESS(device_id);
create index if not exists idx_CM_HOME_CUST_BUSINESS2port_id on CM_HOME_CUST_BUSINESS(port_id);
create index if not exists idx_RM_AREA_RESIDENTIAL2zh_label on RM_AREA_RESIDENTIAL(zh_label);
create index if not exists idx_RM_GRID2zh_label on RM_GRID(zh_label);
create index if not exists idx_RM_GRID2related_area on RM_GRID(related_area);
create index if not exists idx_CE_IMS_BUSINESS2ims_inst_id on CE_IMS_BUSINESS(ims_inst_id);
create index if not exists idx_CM_DEVICE_ONU2zh_label on CM_DEVICE_ONU(zh_label);
create index if not exists idx_CE_TV_BUSINESS2tv_inst_id on CE_TV_BUSINESS(tv_inst_id);
create index if not exists idx_CM_DEVICE_OBD2zh_label on CM_DEVICE_OBD(zh_label);
create index if not exists idx_CE_DEVICE_DMT2zh_label on CE_DEVICE_DMT(zh_label);
create index if not exists idx_JK_CE_DEVICE_GF2zh_label on JIAKE_CE_DEVICE_GF(zh_label);
create index if not exists idx_CM_DEVICE_ONU2relation_up_device_id on CM_DEVICE_ONU(relation_up_device_id);
create index if not exists idx_CM_DEVICE_ONU2relation_up_device_port on CM_DEVICE_ONU(relation_up_device_port);
create index if not exists idx_CM_DEVICE_OBD2up_to_device on CM_DEVICE_OBD(up_to_device);
create index if not exists idx_CM_DEVICE_OBD2link_to_device on CM_DEVICE_OBD(link_to_device);
create index if not exists idx_CM_DEVICE_OBD2link_to_device_port on CM_DEVICE_OBD(link_to_device_port);
create index if not exists idx_CM_OBD_PORT2related_device on CM_OBD_PORT(related_device);
create index if not exists idx_CM_GF_PORT2related_device on CM_GF_PORT(related_device);
create index if not exists idx_CM_HOME_CUST_BUSINESS2cust_num on CM_HOME_CUST_BUSINESS(cust_num);



---核心网
drop table if exists SMS_MSSBASEINFO;
drop table if exists SMS_SMSBASEINFO;
drop table if exists SMS_SMSGWSYS;
drop table if exists SMS_SMSSYS;
drop table if exists SMS_SMSGWBASEINFO;
drop table if exists SMS_MSSSYS;
drop table if exists CS_SSA;
drop table if exists CS_MSC_POOL;
drop table if exists CS_REPEAT;
drop table if exists CS_LINK;
drop table if exists CS_IPSIGNAL;
drop table if exists CS_SSA_LINK;
drop table if exists CS_IPTRAFFIC;
drop table if exists CS_OTHER;
drop table if exists CS_PORT;
drop table if exists CS_MGW;
drop table if exists CS_MSS;
drop table if exists CS_BOARD;
drop table if exists CS_STP;
drop table if exists INT_BIZUNIT;
drop table if exists INT_PUBRES;
drop table if exists INT_SIGNALUNIT;
drop table if exists INT_MAINTAIN;
drop table if exists INT_RELAY;
drop table if exists INT_PORT;
drop table if exists INT_BUSRES;
drop table if exists INT_DEVICE;
drop table if exists INT_SIGNALLINK;
drop table if exists INT_BOARD;
drop table if exists VOLTE_TAS;
drop table if exists VOLTE_PSBC;
drop table if exists VOLTE_LINK;
drop table if exists VOLTE_BCF;
drop table if exists VOLTE_MRFC;
drop table if exists VOLTE_ATCF;
drop table if exists VOLTE_MRFP;
drop table if exists VOLTE_ISBG;
drop table if exists VOLTE_BOARD;
drop table if exists VOLTE_DNS_ENUM;
drop table if exists VOLTE_AP;
drop table if exists VOLTE_AS;
drop table if exists VOLTE_IM_MGW;
drop table if exists VOLTE_BGW;
drop table if exists VOLTE_BGCF;
drop table if exists VOLTE_SCSCF;
drop table if exists VOLTE_ICSCF;
drop table if exists VOLTE_POOL;
drop table if exists VOLTE_MGCF;
drop table if exists VOLTE_PORT;
drop table if exists VOLTE_ATGW;
drop table if exists VOLTE_SCC_AS;
drop table if exists VOLTE_DOMAIN;
drop table if exists IMS_MRFC;
drop table if exists IMS_MMTAS;
drop table if exists IMS_CTXAS_PUBRES;
drop table if exists IMS_MRFP;
drop table if exists IMS_ISBG;
drop table if exists IMS_BOARD;
drop table if exists IMS_CTXAS_BUSRES;
drop table if exists IMS_SBC;
drop table if exists IMS_AGCF;
drop table if exists IMS_SCSCF;
drop table if exists IMS_MGCF;
drop table if exists IMS_IMS_HSS;
drop table if exists IMS_PORT;
drop table if exists IMS_DOMAIN;
drop table if exists IMS_CTXAS_MAINTAIN;
drop table if exists IMS_LINK;
drop table if exists IMS_CG;
drop table if exists IMS_PCSCF;
drop table if exists IMS_CTXAS_BIZUNIT;
drop table if exists IMS_DNS_ENUM;
drop table if exists IMS_UMG;
drop table if exists IMS_UGC;
drop table if exists IMS_IM_MGW;
drop table if exists IMS_TG;
drop table if exists IMS_BGCF;
drop table if exists IMS_ICSCF;
drop table if exists IMS_POOL;
drop table if exists PS_PGW;
drop table if exists PS_PCRF_BE;
drop table if exists PS_PCRF;
drop table if exists PS_SGW;
drop table if exists PS_LINK;
drop table if exists PS_SW;
drop table if exists PS_CG;
drop table if exists PS_MME;
drop table if exists PS_DNS;
drop table if exists PS_SGSN;
drop table if exists PS_BOARD;
drop table if exists PS_SAE_GW;
drop table if exists PS_FW;
drop table if exists PS_DRA;
drop table if exists PS_SPR;
drop table if exists PS_POOL;
drop table if exists PS_GGSN;
drop table if exists PS_PORT;
drop table if exists PS_APN;
drop table if exists HSS_DISTRIBUTED;
drop table if exists HSS_FE;
drop table if exists HSS_PG;
drop table if exists HSS_CENTRALIZED;
drop table if exists HSS_HLR_FE;
drop table if exists HSS_BE;


create table SMS_MSSBASEINFO(int_id varchar(500), zh_label varchar(500), related_sys varchar(500), bear_business_type varchar(500), device_ip varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), ps_cabinet_position varchar(500), lifecycle_status varchar(500), setup_time varchar(500), dims_col_result text,dims_col_rtName text);
create table SMS_SMSBASEINFO(int_id varchar(500), zh_label varchar(500), related_sys varchar(500), bear_business_type varchar(500), device_ip varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), ps_cabinet_position varchar(500), lifecycle_status varchar(500), setup_time varchar(500), dims_col_result text,dims_col_rtName text);
create table SMS_SMSGWSYS(int_id varchar(500), sys_id varchar(500), zh_label varchar(500), sys_integrator varchar(500), max_service_capacity varchar(500), internet_ip varchar(500), intranet_ip varchar(500), related_sms varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), sys_bear_business varchar(500), business_system_coverage_area varchar(500), dims_col_result text,dims_col_rtName text);
create table SMS_SMSSYS(int_id varchar(500), sms_center_no varchar(500), sys_id varchar(500), zh_label varchar(500), sys_integrator varchar(500), max_service_capacity varchar(500), local_signal_code varchar(500), related_smsgw varchar(500), related_mss varchar(500), lifecycle_status varchar(500), software_version varchar(500), setup_time varchar(500), sys_bear_business varchar(500), business_system_coverage_area varchar(500), dims_col_result text,dims_col_rtName text);
create table SMS_SMSGWBASEINFO(int_id varchar(500), zh_label varchar(500), related_sys varchar(500), bear_business_type varchar(500), device_ip varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), ps_cabinet_position varchar(500), lifecycle_status varchar(500), setup_time varchar(500), dims_col_result text,dims_col_rtName text);
create table SMS_MSSSYS(int_id varchar(500), sys_id varchar(500), zh_label varchar(500), sys_integrator varchar(500), max_service_capacity varchar(500), related_sms varchar(500), related_smsgw varchar(500), lifecycle_status varchar(500), software_version varchar(500), setup_time varchar(500), business_system_coverage_area varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_SSA(int_id varchar(500), zh_label varchar(500), native_name varchar(500), vendor_name varchar(500), related_room_id varchar(500), lifecycle_status varchar(500), local_signal_code varchar(500), cover_area varchar(500), ce_name varchar(500), ce_ip varchar(500), province_id varchar(500), city_id varchar(500), county_id varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_MSC_POOL(int_id varchar(500), zh_label varchar(500), cover_area varchar(500), contain_server varchar(500), en_name varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_REPEAT(int_id varchar(500), zh_label varchar(500), a_port_no varchar(500), z_end_ne varchar(500), system_no varchar(500), a_repeat_name varchar(500), circuit_name varchar(500), z_port_no varchar(500), trunk_type varchar(500), a_oddf_sw_port varchar(500), a_oddf_tr_port varchar(500), z_repeat_name varchar(500), z_oddf_sw_port varchar(500), z_oddf_tr_port varchar(500), z_equip_type varchar(500), port_speed varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_LINK(int_id varchar(500), a_end_ne varchar(500), z_end_ne varchar(500), signal_link_name varchar(500), a_signal_link_name varchar(500), timeslot varchar(500), slc varchar(500), a_signal_port varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_IPSIGNAL(int_id varchar(500), zh_label varchar(500), port_no varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_SSA_LINK(int_id varchar(500), link_name varchar(500), linke_level varchar(500), local_province varchar(500), local_ne_id varchar(500), local_ne_name varchar(500), remote_province varchar(500), remote_ne_id varchar(500), remote_ne_name varchar(500), province_id varchar(500), city_id varchar(500), county_id varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_IPTRAFFIC(int_id varchar(500), related_mgw varchar(500), port_no varchar(500), port_related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_OTHER(int_id varchar(500), zh_label varchar(500), operator varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_PORT(int_id varchar(500), port_no varchar(500), port_type varchar(500), physical_position_info varchar(500), port_status varchar(500), related_ne varchar(500), ddf_odf_port varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_MGW(int_id varchar(500), zh_label varchar(500), domestic_signal_code varchar(500), vendor_id varchar(500), hardware_platform varchar(500), related_rackpos varchar(500), switch_id varchar(500), lifecycle_status varchar(500), setup_time varchar(500), software_version varchar(500), mgw_use varchar(500), cover_area varchar(500), realted_msc_pool varchar(500), maintaince_ip varchar(500), ne_type varchar(500), related_ce varchar(500), related_ce_ip varchar(500), related_bsc varchar(500), related_bsc_trans varchar(500), city_id varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_MSS(int_id varchar(500), zh_label varchar(500), domestic_signal_code varchar(500), vendor_id varchar(500), hardware_platform varchar(500), mscid varchar(500), msc_switch_capacity varchar(500), related_rackpos varchar(500), lifecycle_status varchar(500), setup_time varchar(500), software_version varchar(500), mscserver_use varchar(500), cover_area varchar(500), realtead_msc_pool varchar(500), maintaince_ip varchar(500), ne_type varchar(500), is_transport_device varchar(500), device_serial varchar(500), related_stp varchar(500), related_ce varchar(500), related_ce_ip varchar(500), qualitor_contact_info varchar(500), city_id varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_BOARD(int_id varchar(500), card_type varchar(500), physical_position_info varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table CS_STP(int_id varchar(500), zh_label varchar(500), domestic_signal_code varchar(500), vendor_id varchar(500), hardware_platform varchar(500), gt_translation_ability varchar(500), related_rackpos varchar(500), lifecycle_status varchar(500), setup_time varchar(500), software_version varchar(500), stp_use varchar(500), maintaince_ip varchar(500), ne_type varchar(500), alias_name varchar(500), related_ce varchar(500), related_ce_ip varchar(500), cover_area varchar(500), trans_name varchar(500), city_id varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_BIZUNIT(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), device_type varchar(500), related_room varchar(500), related_rack varchar(500), business_ip_address varchar(500), software_version varchar(500), device_work_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_PUBRES(int_id varchar(500), zh_label varchar(500), ne_id varchar(500), ne_gt varchar(500), local_signal_code varchar(500), sys_integrator varchar(500), related_room varchar(500), related_rack varchar(500), related_smp varchar(500), sys_design_caps varchar(500), lifecycle_status varchar(500), setup_time varchar(500), platform_software_version varchar(500), database_software_version varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_SIGNALUNIT(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), device_type varchar(500), related_room varchar(500), related_rack varchar(500), business_ip_address varchar(500), software_version varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_MAINTAIN(int_id varchar(500), zh_label varchar(500), hardware_maintain_vender varchar(500), hardware_maintainres_level varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_RELAY(int_id varchar(500), zh_label varchar(500), port_name varchar(500), relay_group_name varchar(500), city_id varchar(500), circuit_no varchar(500), primary_secondary_flag varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_PORT(int_id varchar(500), port_no varchar(500), physical_position_info varchar(500), opposite_ofc varchar(500), odf_ddf_position varchar(500), port_status varchar(500), port_type varchar(500), port_usage varchar(500), related_signal_processing_unit varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_BUSRES(int_id varchar(500), zh_label varchar(500), business_design_license varchar(500), business_key varchar(500), business_coverage_area varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_DEVICE(int_id varchar(500), zh_label varchar(500), equipment_type varchar(500), vendor_id varchar(500), product_name varchar(500), related_room varchar(500), related_rack varchar(500), management_ip varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_SIGNALLINK(int_id varchar(500), aend_ne varchar(500), zend_ne varchar(500), slc_no varchar(500), local_logical_port_no varchar(500), circuit_name varchar(500), dims_col_result text,dims_col_rtName text);
create table INT_BOARD(int_id varchar(500), zh_label varchar(500), physical_position_info varchar(500), board_type varchar(500), related_signal_processing_unit varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_TAS(int_id varchar(500), zh_label varchar(500), host_name varchar(500), ims_signal_ip varchar(500), domain_name varchar(500), related_volte_as varchar(500), related_cg varchar(500), related_as_pool varchar(500), lifecycle_status varchar(500), related_isbg varchar(500), cover_city varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_PSBC(int_id varchar(500), zh_label varchar(500), host_name varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), rx_interface_signal_ip varchar(500), ims_signal_ip varchar(500), sgi_interface_ip varchar(500), capacity varchar(500), related_omc varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), domain_name varchar(500), cover_city varchar(500), related_ce varchar(500), related_cs_ce varchar(500), related_cs_ce_ip varchar(500), related_ims_ce varchar(500), related_ims_ce_ip varchar(500), ne_type varchar(500), related_psbc_pool varchar(500), city_id varchar(500), related_pgw varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_LINK(int_id varchar(500), aend_room varchar(500), aend_device varchar(500), zend_room varchar(500), zend_device varchar(500), aend_port varchar(500), circuit_name varchar(500), zend_port varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_BCF(int_id varchar(500), zh_label varchar(500), host_name varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), capacity varchar(500), related_omc varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), domain_name varchar(500), cover_city varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_MRFC(int_id varchar(500), zh_label varchar(500), host_name varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), related_omc varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), domain_name varchar(500), cover_city varchar(500), related_volteas varchar(500), related_ce varchar(500), related_mrfp varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_ATCF(int_id varchar(500), zh_label varchar(500), stn_sr varchar(500), domain_name varchar(500), related_psbc varchar(500), lifecycle_status varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_MRFP(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), related_omc varchar(500), support_net_type varchar(500), software_version varchar(500), setup_time varchar(500), lifecycle_status varchar(500), cover_city varchar(500), related_volteas varchar(500), related_mrfc varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_ISBG(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), related_omc varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), domain_name varchar(500), cover_city varchar(500), related_ce varchar(500), related_cs_ce varchar(500), related_cs_ce_ip varchar(500), related_ims_ce varchar(500), related_ims_ce_ip varchar(500), ne_type varchar(500), related_cscf_pool varchar(500), host_name varchar(500), city_id varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_BOARD(int_id varchar(500), physical_position_info varchar(500), board_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_DNS_ENUM(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), related_omc varchar(500), is_backup varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_AP(int_id varchar(500), zh_label varchar(500), host_name varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), domain_name varchar(500), related_volteas varchar(500), lifecycle_status varchar(500), cover_city varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_AS(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), related_omc varchar(500), capacity varchar(500), software_version varchar(500), ne_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), cover_city varchar(500), related_ce varchar(500), related_cs_ce varchar(500), related_cs_ce_ip varchar(500), related_ims_ce varchar(500), related_ims_ce_ip varchar(500), related_as_pool varchar(500), alias_name varchar(500), domain_name varchar(500), local_signal_code varchar(500), city_id varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_IM_MGW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), related_omc varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_ce varchar(500), related_mgcf varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_BGW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), related_omc varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_BGCF(int_id varchar(500), zh_label varchar(500), host_name varchar(500), related_isbg varchar(500), lifecycle_status varchar(500), cover_city varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_SCSCF(int_id varchar(500), zh_label varchar(500), host_name varchar(500), ims_signal_ip varchar(500), capacity varchar(500), related_isbg varchar(500), related_cscf_pool varchar(500), ne_type varchar(500), lifecycle_status varchar(500), vendor_id varchar(500), cover_city varchar(500), related_volte_as varchar(500), related_psbc varchar(500), related_cs_ce varchar(500), related_cs_ce_ip varchar(500), related_ims_ce varchar(500), related_ims_ce_ip varchar(500), network_management_ip varchar(500), local_signal_code varchar(500), city_id varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_ICSCF(int_id varchar(500), zh_label varchar(500), host_name varchar(500), ims_signal_ip varchar(500), related_isbg varchar(500), related_cscf_pool varchar(500), lifecycle_status varchar(500), cover_city varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_POOL(int_id varchar(500), zh_label varchar(500), pool_type varchar(500), contain_devices varchar(500), cover_city varchar(500), related_ims_pool_id varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_MGCF(int_id varchar(500), zh_label varchar(500), host_name varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), local_signal_code varchar(500), network_management_ip varchar(500), traffic_volume varchar(500), related_omc varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), domain_name varchar(500), cover_city varchar(500), related_ce varchar(500), related_cs_ce varchar(500), related_cs_ce_ip varchar(500), related_ims_ce varchar(500), related_ims_ce_ip varchar(500), related_isbg varchar(500), related_im_mgw varchar(500), maintenace_ip_list varchar(500), ne_type varchar(500), city_id varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_PORT(int_id varchar(500), physical_position_info varchar(500), odf_ddf_terminal varchar(500), port_status varchar(500), port_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_ATGW(int_id varchar(500), zh_label varchar(500), related_psbc varchar(500), lifecycle_status varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_SCC_AS(int_id varchar(500), zh_label varchar(500), host_name varchar(500), gt varchar(500), signal_code varchar(500), domain_name varchar(500), releated_volteas varchar(500), releated_as_pool varchar(500), lifecycle_status varchar(500), cover_city varchar(500), releated_stp varchar(500), dims_col_result text,dims_col_rtName text);
create table VOLTE_DOMAIN(int_id varchar(500), zh_label varchar(500), trusted_domain varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_MRFC(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_volte_as varchar(500), related_mrfp varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_MMTAS(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), capacity varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_CTXAS_PUBRES(int_id varchar(500), zh_label varchar(500), sys_integrator varchar(500), ne_id varchar(500), ne_gt varchar(500), related_rack varchar(500), related_smp varchar(500), sys_design_caps varchar(500), lifecycle_status varchar(500), setup_time varchar(500), platform_software_version varchar(500), database_software_version varchar(500), ne_type varchar(500), related_mdcn varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_MRFP(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_volte_as varchar(500), related_mrfc varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_ISBG(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_BOARD(int_id varchar(500), physical_position_info varchar(500), board_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_CTXAS_BUSRES(int_id varchar(500), zh_label varchar(500), business_design_license varchar(500), caps_in_busy_business varchar(500), business_key varchar(500), business_coverage_area varchar(500), related_ne varchar(500), service_version varchar(500), qualitor varchar(500), province_id varchar(500), city_id varchar(500), county_id varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_SBC(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), capacity varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_AGCF(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), traffic_volume varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_tg varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_SCSCF(int_id varchar(500), zh_label varchar(500), capacity varchar(500), related_isbg varchar(500), related_scscf_pool varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_MGCF(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), traffic_volume varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_im_mgw varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_IMS_HSS(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), static_user_numbers varchar(500), hss_primary_secondary_flag varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_PORT(int_id varchar(500), physical_position_info varchar(500), odf_ddf_terminal varchar(500), port_status varchar(500), port_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_DOMAIN(int_id varchar(500), zh_label varchar(500), trusted_domain varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_CTXAS_MAINTAIN(int_id varchar(500), zh_label varchar(500), hardware_maintain_vender varchar(500), software_maintain_vender varchar(500), database_maintain_vender varchar(500), hardware_maintainres_level varchar(500), software_maintainres_level varchar(500), database_maintainres_level varchar(500), omc_nativename varchar(500), product_name varchar(500), qualitor varchar(500), province_id varchar(500), city_id varchar(500), county_id varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_LINK(int_id varchar(500), aend_room varchar(500), aend_device varchar(500), zend_room varchar(500), zend_device varchar(500), aend_port varchar(500), circuit_name varchar(500), zend_port varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_CG(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), setup_time varchar(500), lifecycle_status varchar(500), related_device varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_PCSCF(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), capacity varchar(500), software_version varchar(500), setup_time varchar(500), lifecycle_status varchar(500), cover_city varchar(500), related_ne varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_CTXAS_BIZUNIT(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), operating_system varchar(500), related_rack varchar(500), business_ip_address varchar(500), software_version varchar(500), device_work_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_DNS_ENUM(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_ce varchar(500), related_ims_ce varchar(500), related_ims_ce_ip varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_UMG(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_server varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_UGC(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), traffic_volume varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_umg varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_IM_MGW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_server varchar(500), related_ce varchar(500), related_cs_ce varchar(500), related_cs_ce_ip varchar(500), related_ims_ce varchar(500), related_ims_ce_ip varchar(500), maintenace_ip_list varchar(500), mgcf_id varchar(500), mgcf_ip_list varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_TG(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), support_net_type varchar(500), setup_time varchar(500), lifecycle_status varchar(500), software_version varchar(500), cover_city varchar(500), related_server varchar(500), related_ce varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_BGCF(int_id varchar(500), zh_label varchar(500), related_isbg varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_ICSCF(int_id varchar(500), zh_label varchar(500), related_isbg varchar(500), related_icscf_pool varchar(500), dims_col_result text,dims_col_rtName text);
create table IMS_POOL(int_id varchar(500), zh_label varchar(500), pool_type varchar(500), contain_ne_names varchar(500), cover_area varchar(500), related_ims_pool_id varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_PGW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), host_domain_name_flag varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), support_nsa varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_PCRF_BE(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_PCRF(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), host_domain_name_flag varchar(500), related_rack varchar(500), network_management_ip varchar(500), gx_interface_logic_ip varchar(500), rx_interface_logic_ip varchar(500), connect_boss_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), hardware_version varchar(500), related_ce varchar(500), related_ce_ip varchar(500), related_room varchar(500), related_spr varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_SGW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), host_domain_name_flag varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_LINK(int_id varchar(500), a_end_device varchar(500), a_end_port varchar(500), a_end_ddf varchar(500), circuit_name varchar(500), z_end_device varchar(500), z_end_port varchar(500), z_end_ddf varchar(500), a_device_type varchar(500), z_device_type varchar(500), z_related_network varchar(500), bandwidth varchar(500), link_num varchar(500), comment varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_SW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), related_room varchar(500), related_fw varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_CG(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), related_rack varchar(500), network_management_ip varchar(500), ga_interface_logic_ip varchar(500), connect_boss_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), hardware_version varchar(500), support_nsa varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_MME(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), host_domain_name_flag varchar(500), related_rack varchar(500), network_management_ip varchar(500), gn_interface_logic_ip varchar(500), s1mme_interface_logic_ip varchar(500), s11_interface_logic_ip varchar(500), s6a_interface_logic_ip varchar(500), sgs_interface_logic_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), related_mme_pool varchar(500), hardware_version varchar(500), local_signal_code varchar(500), support_nsa varchar(500), related_ce varchar(500), related_ce_ip varchar(500), alarm_device_type varchar(500), cover_area varchar(500), related_room varchar(500), related_sw varchar(500), related_fw varchar(500), related_ptn varchar(500), related_ptn_ip varchar(500), maintenace_ip_other varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_DNS(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), related_rack varchar(500), network_management_ip varchar(500), device_dns_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), hardware_version varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_SGSN(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), na0_signal_code varchar(500), na1_signal_code varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), related_sgsn_pool varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_BOARD(int_id varchar(500), physical_position_info varchar(500), board_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_SAE_GW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), host_domain_name_flag varchar(500), related_rack varchar(500), network_management_ip varchar(500), s1u_interface_logic_ip varchar(500), s5_interface_logic_ip varchar(500), s8_interface_logic_ip varchar(500), s11_interface_logic_ip varchar(500), sgi_interface_logic_ip varchar(500), ga_interface_logic_ip varchar(500), gx_interface_logic_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), hardware_version varchar(500), support_nsa varchar(500), related_mme_pool varchar(500), related_saegw_pool varchar(500), related_ce varchar(500), related_ce_ip varchar(500), alarm_device_type varchar(500), cover_area varchar(500), related_room varchar(500), alias_name varchar(500), related_sw varchar(500), related_fw varchar(500), related_ptn varchar(500), related_ptn_ip varchar(500), maintenace_ip_other varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_FW(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), product_name varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), hardware_version varchar(500), related_room varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_DRA(int_id varchar(500), zh_label varchar(500), host_domain_name_flag varchar(500), vendor_id varchar(500), product_name varchar(500), hardware_version varchar(500), support_province varchar(500), related_rack varchar(500), network_management_ip varchar(500), pairs_dra_domain varchar(500), other_dra_domain varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), device_net_level varchar(500), s6a_interface_link_ce varchar(500), s9_interface_link_ce varchar(500), gx_interface_link_ce varchar(500), rx_interface_link_ce varchar(500), cx_interface_link_ce varchar(500), sh_interface_link_ce varchar(500), related_room varchar(500), alias_name varchar(500), maintaince_ip varchar(500), local_signal_code varchar(500), related_ce varchar(500), related_ce_ip varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_SPR(int_id varchar(500), zh_label varchar(500), native_name varchar(500), vendor_name varchar(500), related_room_id varchar(500), lifecycle_status varchar(500), domain_hostname varchar(500), gx_ip varchar(500), rx_ip varchar(500), boss_ip varchar(500), maintenace_ip varchar(500), cover_area varchar(500), related_ce varchar(500), related_ce_ip varchar(500), province_id varchar(500), city_id varchar(500), county_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_POOL(int_id varchar(500), zh_label varchar(500), pool_type varchar(500), contain_devices varchar(500), cover_area varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_GGSN(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), related_rack varchar(500), network_management_ip varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_PORT(int_id varchar(500), zh_label varchar(500), port_status varchar(500), port_type varchar(500), related_ne varchar(500), dims_col_result text,dims_col_rtName text);
create table PS_APN(int_id varchar(500), zh_label varchar(500), a_end_tunnel_address varchar(500), z_end_tunnel_address varchar(500), tunnel_type varchar(500), business_coverage varchar(500), address_type varchar(500), static_address_pool varchar(500), static_address_count varchar(500), dynamica_address_pool varchar(500), dynamica_address_count varchar(500), apn_instruction varchar(500), related_device varchar(500), dims_col_result text,dims_col_rtName text);
create table HSS_DISTRIBUTED(int_id varchar(500), zh_label varchar(500), vendor_id varchar(500), lifecycle_status varchar(500), setup_time varchar(500), qualitor varchar(500), dims_col_result text,dims_col_rtName text);
create table HSS_FE(int_id varchar(500), zh_label varchar(500), host_domain_name_flag varchar(500), hss_id varchar(500), local_signal_code varchar(500), hardware_platform varchar(500), related_rack varchar(500), s6a_s6d_ip varchar(500), local_ip varchar(500), bear_cy varchar(500), software_version varchar(500), setup_time varchar(500), fe_primary_secondary_flag varchar(500), related_dra varchar(500), related_ce varchar(500), related_ce_ip varchar(500), related_hss varchar(500), lifecycle_status varchar(500), qualitor varchar(500), cover_area varchar(500), access_power_pos varchar(500), related_lstp varchar(500), backup_fe_name varchar(500), city_id varchar(500), ne_type varchar(500), vendor_id varchar(500), dims_col_result text,dims_col_rtName text);
create table HSS_PG(int_id varchar(500), zh_label varchar(500), hardware_platform varchar(500), related_rack varchar(500), boss_ip varchar(500), static_user_total_cy varchar(500), software_version varchar(500), qualitor varchar(500), pg_primary_secondary_flag varchar(500), connected_mdcn_switch_name varchar(500), related_hss varchar(500), lifecycle_status varchar(500), dims_col_result text,dims_col_rtName text);
create table HSS_CENTRALIZED(int_id varchar(500), zh_label varchar(500), host_domain_name_flag varchar(500), hss_id varchar(500), local_signal_code varchar(500), vendor_id varchar(500), hardware_platform varchar(500), related_rack varchar(500), network_management_ip varchar(500), s6a_s6d_ip varchar(500), auc_total_cy varchar(500), static_user_total_cy varchar(500), auc_total_cy_4g varchar(500), static_user_total_cy_4g varchar(500), software_version varchar(500), lifecycle_status varchar(500), setup_time varchar(500), qualitor varchar(500), hss_primary_secondary_flag varchar(500), related_dra varchar(500), related_ce varchar(500), related_ce_ip varchar(500), cover_area varchar(500), related_lstp varchar(500), alias_name varchar(500), city_id varchar(500), ne_type varchar(500), dims_col_result text,dims_col_rtName text);
create table HSS_HLR_FE(int_id varchar(500), zh_label varchar(500), local_signal_code varchar(500), vendor_id varchar(500), hardware_platform varchar(500), hlrid varchar(500), related_rack varchar(500), lifecycle_status varchar(500), software_version varchar(500), setup_time varchar(500), qualitor varchar(500), cover_area varchar(500), dims_col_result text,dims_col_rtName text);
create table HSS_BE(int_id varchar(500), zh_label varchar(500), hardware_platform varchar(500), related_rack varchar(500), auc_total_cy varchar(500), static_user_total_cy varchar(500), auc_total_cy_4g varchar(500), static_user_total_cy_4g varchar(500), software_version varchar(500), be_primary_secondary_flag varchar(500), related_hss varchar(500), network_management_ip varchar(500), lifecycle_status varchar(500), qualitor varchar(500), related_ce varchar(500), related_ce_ip varchar(500), cover_area varchar(500), access_power_pos varchar(500), alias_name varchar(500), related_lstp varchar(500), city_id varchar(500), ne_type varchar(500), vendor_id varchar(500), related_dra varchar(500), dims_col_result text,dims_col_rtName text);


create index if not exists idx_SMS_MSSBASEINFO2int_id on SMS_MSSBASEINFO(int_id);
create index if not exists idx_SMS_SMSBASEINFO2int_id on SMS_SMSBASEINFO(int_id);
create index if not exists idx_SMS_SMSGWSYS2int_id on SMS_SMSGWSYS(int_id);
create index if not exists idx_SMS_SMSSYS2int_id on SMS_SMSSYS(int_id);
create index if not exists idx_SMS_SMSGWBASEINFO2int_id on SMS_SMSGWBASEINFO(int_id);
create index if not exists idx_SMS_MSSSYS2int_id on SMS_MSSSYS(int_id);
create index if not exists idx_CS_SSA2int_id on CS_SSA(int_id);
create index if not exists idx_CS_MSC_POOL2int_id on CS_MSC_POOL(int_id);
create index if not exists idx_CS_REPEAT2int_id on CS_REPEAT(int_id);
create index if not exists idx_CS_LINK2int_id on CS_LINK(int_id);
create index if not exists idx_CS_IPSIGNAL2int_id on CS_IPSIGNAL(int_id);
create index if not exists idx_CS_SSA_LINK2int_id on CS_SSA_LINK(int_id);
create index if not exists idx_CS_IPTRAFFIC2int_id on CS_IPTRAFFIC(int_id);
create index if not exists idx_CS_OTHER2int_id on CS_OTHER(int_id);
create index if not exists idx_CS_PORT2int_id on CS_PORT(int_id);
create index if not exists idx_CS_MGW2int_id on CS_MGW(int_id);
create index if not exists idx_CS_MSS2int_id on CS_MSS(int_id);
create index if not exists idx_CS_BOARD2int_id on CS_BOARD(int_id);
create index if not exists idx_CS_STP2int_id on CS_STP(int_id);
create index if not exists idx_INT_BIZUNIT2int_id on INT_BIZUNIT(int_id);
create index if not exists idx_INT_PUBRES2int_id on INT_PUBRES(int_id);
create index if not exists idx_INT_SIGNALUNIT2int_id on INT_SIGNALUNIT(int_id);
create index if not exists idx_INT_MAINTAIN2int_id on INT_MAINTAIN(int_id);
create index if not exists idx_INT_RELAY2int_id on INT_RELAY(int_id);
create index if not exists idx_INT_PORT2int_id on INT_PORT(int_id);
create index if not exists idx_INT_BUSRES2int_id on INT_BUSRES(int_id);
create index if not exists idx_INT_DEVICE2int_id on INT_DEVICE(int_id);
create index if not exists idx_INT_SIGNALLINK2int_id on INT_SIGNALLINK(int_id);
create index if not exists idx_INT_BOARD2int_id on INT_BOARD(int_id);
create index if not exists idx_VOLTE_TAS2int_id on VOLTE_TAS(int_id);
create index if not exists idx_VOLTE_PSBC2int_id on VOLTE_PSBC(int_id);
create index if not exists idx_VOLTE_LINK2int_id on VOLTE_LINK(int_id);
create index if not exists idx_VOLTE_BCF2int_id on VOLTE_BCF(int_id);
create index if not exists idx_VOLTE_MRFC2int_id on VOLTE_MRFC(int_id);
create index if not exists idx_VOLTE_ATCF2int_id on VOLTE_ATCF(int_id);
create index if not exists idx_VOLTE_MRFP2int_id on VOLTE_MRFP(int_id);
create index if not exists idx_VOLTE_ISBG2int_id on VOLTE_ISBG(int_id);
create index if not exists idx_VOLTE_BOARD2int_id on VOLTE_BOARD(int_id);
create index if not exists idx_VOLTE_DNS_ENUM2int_id on VOLTE_DNS_ENUM(int_id);
create index if not exists idx_VOLTE_AP2int_id on VOLTE_AP(int_id);
create index if not exists idx_VOLTE_AS2int_id on VOLTE_AS(int_id);
create index if not exists idx_VOLTE_IM_MGW2int_id on VOLTE_IM_MGW(int_id);
create index if not exists idx_VOLTE_BGW2int_id on VOLTE_BGW(int_id);
create index if not exists idx_VOLTE_BGCF2int_id on VOLTE_BGCF(int_id);
create index if not exists idx_VOLTE_SCSCF2int_id on VOLTE_SCSCF(int_id);
create index if not exists idx_VOLTE_ICSCF2int_id on VOLTE_ICSCF(int_id);
create index if not exists idx_VOLTE_POOL2int_id on VOLTE_POOL(int_id);
create index if not exists idx_VOLTE_MGCF2int_id on VOLTE_MGCF(int_id);
create index if not exists idx_VOLTE_PORT2int_id on VOLTE_PORT(int_id);
create index if not exists idx_VOLTE_ATGW2int_id on VOLTE_ATGW(int_id);
create index if not exists idx_VOLTE_SCC_AS2int_id on VOLTE_SCC_AS(int_id);
create index if not exists idx_VOLTE_DOMAIN2int_id on VOLTE_DOMAIN(int_id);
create index if not exists idx_IMS_MRFC2int_id on IMS_MRFC(int_id);
create index if not exists idx_IMS_MMTAS2int_id on IMS_MMTAS(int_id);
create index if not exists idx_IMS_CTXAS_PUBRES2int_id on IMS_CTXAS_PUBRES(int_id);
create index if not exists idx_IMS_MRFP2int_id on IMS_MRFP(int_id);
create index if not exists idx_IMS_ISBG2int_id on IMS_ISBG(int_id);
create index if not exists idx_IMS_BOARD2int_id on IMS_BOARD(int_id);
create index if not exists idx_IMS_CTXAS_BUSRES2int_id on IMS_CTXAS_BUSRES(int_id);
create index if not exists idx_IMS_SBC2int_id on IMS_SBC(int_id);
create index if not exists idx_IMS_AGCF2int_id on IMS_AGCF(int_id);
create index if not exists idx_IMS_SCSCF2int_id on IMS_SCSCF(int_id);
create index if not exists idx_IMS_MGCF2int_id on IMS_MGCF(int_id);
create index if not exists idx_IMS_IMS_HSS2int_id on IMS_IMS_HSS(int_id);
create index if not exists idx_IMS_PORT2int_id on IMS_PORT(int_id);
create index if not exists idx_IMS_DOMAIN2int_id on IMS_DOMAIN(int_id);
create index if not exists idx_IMS_CTXAS_MAINTAIN2int_id on IMS_CTXAS_MAINTAIN(int_id);
create index if not exists idx_IMS_LINK2int_id on IMS_LINK(int_id);
create index if not exists idx_IMS_CG2int_id on IMS_CG(int_id);
create index if not exists idx_IMS_PCSCF2int_id on IMS_PCSCF(int_id);
create index if not exists idx_IMS_CTXAS_BIZUNIT2int_id on IMS_CTXAS_BIZUNIT(int_id);
create index if not exists idx_IMS_DNS_ENUM2int_id on IMS_DNS_ENUM(int_id);
create index if not exists idx_IMS_UMG2int_id on IMS_UMG(int_id);
create index if not exists idx_IMS_UGC2int_id on IMS_UGC(int_id);
create index if not exists idx_IMS_IM_MGW2int_id on IMS_IM_MGW(int_id);
create index if not exists idx_IMS_TG2int_id on IMS_TG(int_id);
create index if not exists idx_IMS_BGCF2int_id on IMS_BGCF(int_id);
create index if not exists idx_IMS_ICSCF2int_id on IMS_ICSCF(int_id);
create index if not exists idx_IMS_POOL2int_id on IMS_POOL(int_id);
create index if not exists idx_PS_PGW2int_id on PS_PGW(int_id);
create index if not exists idx_PS_PCRF_BE2int_id on PS_PCRF_BE(int_id);
create index if not exists idx_PS_PCRF2int_id on PS_PCRF(int_id);
create index if not exists idx_PS_SGW2int_id on PS_SGW(int_id);
create index if not exists idx_PS_LINK2int_id on PS_LINK(int_id);
create index if not exists idx_PS_SW2int_id on PS_SW(int_id);
create index if not exists idx_PS_CG2int_id on PS_CG(int_id);
create index if not exists idx_PS_MME2int_id on PS_MME(int_id);
create index if not exists idx_PS_DNS2int_id on PS_DNS(int_id);
create index if not exists idx_PS_SGSN2int_id on PS_SGSN(int_id);
create index if not exists idx_PS_BOARD2int_id on PS_BOARD(int_id);
create index if not exists idx_PS_SAE_GW2int_id on PS_SAE_GW(int_id);
create index if not exists idx_PS_FW2int_id on PS_FW(int_id);
create index if not exists idx_PS_DRA2int_id on PS_DRA(int_id);
create index if not exists idx_PS_SPR2int_id on PS_SPR(int_id);
create index if not exists idx_PS_POOL2int_id on PS_POOL(int_id);
create index if not exists idx_PS_GGSN2int_id on PS_GGSN(int_id);
create index if not exists idx_PS_PORT2int_id on PS_PORT(int_id);
create index if not exists idx_PS_APN2int_id on PS_APN(int_id);
create index if not exists idx_HSS_DISTRIBUTED2int_id on HSS_DISTRIBUTED(int_id);
create index if not exists idx_HSS_FE2int_id on HSS_FE(int_id);
create index if not exists idx_HSS_PG2int_id on HSS_PG(int_id);
create index if not exists idx_HSS_CENTRALIZED2int_id on HSS_CENTRALIZED(int_id);
create index if not exists idx_HSS_HLR_FE2int_id on HSS_HLR_FE(int_id);
create index if not exists idx_HSS_BE2int_id on HSS_BE(int_id);
create index if not exists idx_SMS_MSSBASEINFO_related_rack on SMS_MSSBASEINFO(related_rack);
create index if not exists idx_SMS_MSSBASEINFO_ps_cabinet_position on SMS_MSSBASEINFO(ps_cabinet_position);
create index if not exists idx_SMS_SMSBASEINFO_related_sys on SMS_SMSBASEINFO(related_sys);
create index if not exists idx_SMS_SMSBASEINFO_related_rack on SMS_SMSBASEINFO(related_rack);
create index if not exists idx_SMS_SMSBASEINFO_ps_cabinet_position on SMS_SMSBASEINFO(ps_cabinet_position);
create index if not exists idx_SMS_SMSGWSYS_related_sms on SMS_SMSGWSYS(related_sms);
create index if not exists idx_SMS_SMSSYS_related_smsgw on SMS_SMSSYS(related_smsgw);
create index if not exists idx_SMS_SMSGWBASEINFO_related_sys on SMS_SMSGWBASEINFO(related_sys);
create index if not exists idx_SMS_SMSGWBASEINFO_related_rack on SMS_SMSGWBASEINFO(related_rack);
create index if not exists idx_SMS_SMSGWBASEINFO_ps_cabinet_position on SMS_SMSGWBASEINFO(ps_cabinet_position);
create index if not exists idx_SMS_MSSSYS_related_sms on SMS_MSSSYS(related_sms);
create index if not exists idx_CS_SSA_related_room_id on CS_SSA(related_room_id);
create index if not exists idx_CS_REPEAT_zh_label on CS_REPEAT(zh_label);
create index if not exists idx_CS_REPEAT_a_port_no on CS_REPEAT(a_port_no);
create index if not exists idx_CS_REPEAT_z_end_ne on CS_REPEAT(z_end_ne);
create index if not exists idx_CS_LINK_a_end_ne on CS_LINK(a_end_ne);
create index if not exists idx_CS_LINK_z_end_ne on CS_LINK(z_end_ne);
create index if not exists idx_CS_LINK_a_signal_port on CS_LINK(a_signal_port);
create index if not exists idx_CS_IPSIGNAL_port_no on CS_IPSIGNAL(port_no);
create index if not exists idx_CS_IPTRAFFIC_related_mgw on CS_IPTRAFFIC(related_mgw);
create index if not exists idx_CS_IPTRAFFIC_port_no on CS_IPTRAFFIC(port_no);
create index if not exists idx_CS_IPTRAFFIC_port_related_ce on CS_IPTRAFFIC(port_related_ce);
create index if not exists idx_CS_PORT_related_ne on CS_PORT(related_ne);
create index if not exists idx_CS_MGW_related_rackpos on CS_MGW(related_rackpos);
create index if not exists idx_CS_MGW_realted_msc_pool on CS_MGW(realted_msc_pool);
create index if not exists idx_CS_MGW_related_ce on CS_MGW(related_ce);
create index if not exists idx_CS_MSS_related_rackpos on CS_MSS(related_rackpos);
create index if not exists idx_CS_MSS_related_stp on CS_MSS(related_stp);
create index if not exists idx_CS_MSS_related_ce on CS_MSS(related_ce);
create index if not exists idx_CS_BOARD_related_ne on CS_BOARD(related_ne);
create index if not exists idx_CS_STP_related_rackpos on CS_STP(related_rackpos);
create index if not exists idx_CS_STP_related_ce on CS_STP(related_ce);
create index if not exists idx_INT_BIZUNIT_related_room on INT_BIZUNIT(related_room);
create index if not exists idx_INT_BIZUNIT_related_rack on INT_BIZUNIT(related_rack);
create index if not exists idx_INT_BIZUNIT_related_ne on INT_BIZUNIT(related_ne);
create index if not exists idx_INT_PUBRES_related_room on INT_PUBRES(related_room);
create index if not exists idx_INT_PUBRES_related_rack on INT_PUBRES(related_rack);
create index if not exists idx_INT_SIGNALUNIT_related_room on INT_SIGNALUNIT(related_room);
create index if not exists idx_INT_SIGNALUNIT_related_rack on INT_SIGNALUNIT(related_rack);
create index if not exists idx_INT_SIGNALUNIT_related_ne on INT_SIGNALUNIT(related_ne);
create index if not exists idx_INT_PORT_physical_position_info on INT_PORT(physical_position_info);
create index if not exists idx_INT_PORT_related_signal_processing_unit on INT_PORT(related_signal_processing_unit);
create index if not exists idx_INT_BUSRES_related_ne on INT_BUSRES(related_ne);
create index if not exists idx_INT_DEVICE_related_room on INT_DEVICE(related_room);
create index if not exists idx_INT_DEVICE_related_rack on INT_DEVICE(related_rack);
create index if not exists idx_INT_SIGNALLINK_aend_ne on INT_SIGNALLINK(aend_ne);
create index if not exists idx_INT_SIGNALLINK_local_logical_port_no on INT_SIGNALLINK(local_logical_port_no);
create index if not exists idx_INT_SIGNALLINK_circuit_name on INT_SIGNALLINK(circuit_name);
create index if not exists idx_INT_BOARD_related_signal_processing_unit on INT_BOARD(related_signal_processing_unit);
create index if not exists idx_VOLTE_TAS_domain_name on VOLTE_TAS(domain_name);
create index if not exists idx_VOLTE_PSBC_related_rack on VOLTE_PSBC(related_rack);
create index if not exists idx_VOLTE_PSBC_domain_name on VOLTE_PSBC(domain_name);
create index if not exists idx_VOLTE_LINK_aend_room on VOLTE_LINK(aend_room);
create index if not exists idx_VOLTE_LINK_zend_room on VOLTE_LINK(zend_room);
create index if not exists idx_VOLTE_LINK_aend_port on VOLTE_LINK(aend_port);
create index if not exists idx_VOLTE_BCF_related_rack on VOLTE_BCF(related_rack);
create index if not exists idx_VOLTE_BCF_domain_name on VOLTE_BCF(domain_name);
create index if not exists idx_VOLTE_MRFC_related_rack on VOLTE_MRFC(related_rack);
create index if not exists idx_VOLTE_MRFC_domain_name on VOLTE_MRFC(domain_name);
create index if not exists idx_VOLTE_MRFC_related_mrfp on VOLTE_MRFC(related_mrfp);
create index if not exists idx_VOLTE_ATCF_domain_name on VOLTE_ATCF(domain_name);
create index if not exists idx_VOLTE_MRFP_related_rack on VOLTE_MRFP(related_rack);
create index if not exists idx_VOLTE_ISBG_related_rack on VOLTE_ISBG(related_rack);
create index if not exists idx_VOLTE_ISBG_domain_name on VOLTE_ISBG(domain_name);
create index if not exists idx_VOLTE_DNS_ENUM_related_rack on VOLTE_DNS_ENUM(related_rack);
create index if not exists idx_VOLTE_AP_related_rack on VOLTE_AP(related_rack);
create index if not exists idx_VOLTE_AP_domain_name on VOLTE_AP(domain_name);
create index if not exists idx_VOLTE_AS_related_rack on VOLTE_AS(related_rack);
create index if not exists idx_VOLTE_IM_MGW_related_rack on VOLTE_IM_MGW(related_rack);
create index if not exists idx_VOLTE_BGW_related_rack on VOLTE_BGW(related_rack);
create index if not exists idx_VOLTE_BGCF_related_isbg on VOLTE_BGCF(related_isbg);
create index if not exists idx_VOLTE_SCSCF_related_isbg on VOLTE_SCSCF(related_isbg);
create index if not exists idx_VOLTE_ICSCF_related_cscf_pool on VOLTE_ICSCF(related_cscf_pool);
create index if not exists idx_VOLTE_SCC_AS_domain_name on VOLTE_SCC_AS(domain_name);
create index if not exists idx_IMS_MMTAS_related_rack on IMS_MMTAS(related_rack);
create index if not exists idx_IMS_CTXAS_PUBRES_related_rack on IMS_CTXAS_PUBRES(related_rack);
create index if not exists idx_IMS_ISBG_related_rack on IMS_ISBG(related_rack);
create index if not exists idx_IMS_SBC_related_rack on IMS_SBC(related_rack);
create index if not exists idx_IMS_AGCF_related_rack on IMS_AGCF(related_rack);
create index if not exists idx_IMS_SCSCF_related_isbg on IMS_SCSCF(related_isbg);
create index if not exists idx_IMS_MGCF_related_rack on IMS_MGCF(related_rack);
create index if not exists idx_IMS_IMS_HSS_related_rack on IMS_IMS_HSS(related_rack);
create index if not exists idx_IMS_LINK_aend_room on IMS_LINK(aend_room);
create index if not exists idx_IMS_LINK_zend_room on IMS_LINK(zend_room);
create index if not exists idx_IMS_LINK_aend_port on IMS_LINK(aend_port);
create index if not exists idx_IMS_CTXAS_BIZUNIT_related_rack on IMS_CTXAS_BIZUNIT(related_rack);
create index if not exists idx_IMS_CTXAS_BIZUNIT_related_ne on IMS_CTXAS_BIZUNIT(related_ne);
create index if not exists idx_IMS_DNS_ENUM_related_rack on IMS_DNS_ENUM(related_rack);
create index if not exists idx_IMS_UMG_related_rack on IMS_UMG(related_rack);
create index if not exists idx_IMS_UGC_related_rack on IMS_UGC(related_rack);
create index if not exists idx_IMS_IM_MGW_related_rack on IMS_IM_MGW(related_rack);
create index if not exists idx_IMS_IM_MGW_mgcf_id on IMS_IM_MGW(mgcf_id);
create index if not exists idx_IMS_TG_related_rack on IMS_TG(related_rack);
create index if not exists idx_IMS_BGCF_related_isbg on IMS_BGCF(related_isbg);
create index if not exists idx_IMS_ICSCF_related_isbg on IMS_ICSCF(related_isbg);
create index if not exists idx_PS_PGW_related_rack on PS_PGW(related_rack);
create index if not exists idx_PS_PCRF_BE_related_rack on PS_PCRF_BE(related_rack);
create index if not exists idx_PS_PCRF_related_rack on PS_PCRF(related_rack);
create index if not exists idx_PS_PCRF_related_room on PS_PCRF(related_room);
create index if not exists idx_PS_SGW_related_rack on PS_SGW(related_rack);
create index if not exists idx_PS_LINK_a_end_device on PS_LINK(a_end_device);
create index if not exists idx_PS_LINK_a_end_port on PS_LINK(a_end_port);
create index if not exists idx_PS_SW_related_rack on PS_SW(related_rack);
create index if not exists idx_PS_SW_related_room on PS_SW(related_room);
create index if not exists idx_PS_SW_related_fw on PS_SW(related_fw);
create index if not exists idx_PS_CG_related_rack on PS_CG(related_rack);
create index if not exists idx_PS_MME_related_rack on PS_MME(related_rack);
create index if not exists idx_PS_MME_related_room on PS_MME(related_room);
create index if not exists idx_PS_DNS_related_rack on PS_DNS(related_rack);
create index if not exists idx_PS_SGSN_related_rack on PS_SGSN(related_rack);
create index if not exists idx_PS_SAE_GW_related_rack on PS_SAE_GW(related_rack);
create index if not exists idx_PS_SAE_GW_related_room on PS_SAE_GW(related_room);
create index if not exists idx_PS_FW_related_rack on PS_FW(related_rack);
create index if not exists idx_PS_FW_related_room on PS_FW(related_room);
create index if not exists idx_PS_DRA_related_rack on PS_DRA(related_rack);
create index if not exists idx_PS_DRA_related_room on PS_DRA(related_room);
create index if not exists idx_PS_SPR_related_room_id on PS_SPR(related_room_id);
create index if not exists idx_PS_GGSN_related_rack on PS_GGSN(related_rack);
create index if not exists idx_PS_PORT_related_ne on PS_PORT(related_ne);
create index if not exists idx_PS_APN_related_device on PS_APN(related_device);
create index if not exists idx_HSS_FE_related_rack on HSS_FE(related_rack);
create index if not exists idx_HSS_FE_related_dra on HSS_FE(related_dra);
create index if not exists idx_HSS_FE_related_hss on HSS_FE(related_hss);
create index if not exists idx_HSS_FE_cover_area on HSS_FE(cover_area);
create index if not exists idx_HSS_FE_access_power_pos on HSS_FE(access_power_pos);
create index if not exists idx_HSS_FE_related_lstp on HSS_FE(related_lstp);
create index if not exists idx_HSS_PG_related_hss on HSS_PG(related_hss);
create index if not exists idx_HSS_CENTRALIZED_related_rack on HSS_CENTRALIZED(related_rack);
create index if not exists idx_HSS_CENTRALIZED_related_dra on HSS_CENTRALIZED(related_dra);
create index if not exists idx_HSS_CENTRALIZED_related_ce on HSS_CENTRALIZED(related_ce);
create index if not exists idx_HSS_CENTRALIZED_related_lstp on HSS_CENTRALIZED(related_lstp);
create index if not exists idx_HSS_HLR_FE_related_rack on HSS_HLR_FE(related_rack);
create index if not exists idx_HSS_HLR_FE_cover_area on HSS_HLR_FE(cover_area);
create index if not exists idx_HSS_BE_related_rack on HSS_BE(related_rack);
create index if not exists idx_HSS_BE_related_hss on HSS_BE(related_hss);
create index if not exists idx_HSS_BE_related_ce_ip on HSS_BE(related_ce_ip);
create index if not exists idx_HSS_BE_access_power_pos on HSS_BE(access_power_pos);
create index if not exists idx_HSS_BE_related_lstp on HSS_BE(related_lstp);
create index if not exists idx_HSS_BE_related_dra on HSS_BE(related_dra);
--传输管线ddl
drop table if exists CE_DEVICE_GJ;
drop table if exists TSGX_CE_DEVICE_GF;
drop table if exists CE_DEVICE_GB;
drop table if exists CE_DEVICE_JT;
drop table if exists CM_PORT_FIBER;
drop table if exists CE_CABLE_SEGMENT;
drop table if exists CE_CABLE_FIBER;
drop table if exists CE_LINK_FIBERLINK;
drop table if exists CE_LINK_OCIRCUIT;
drop table if exists CE_LINK_JUMPLINK;
drop table if exists CE_ASSISTANCE_RESERVE;
drop table if exists CE_FACILITY_WELL;
drop table if exists CE_FACILITY_POLE;
drop table if exists CE_FACILITY_SUPPORT;
drop table if exists CE_FACILITY_UP;
drop table if exists CE_FACILITY_STONE;
drop table if exists CE_LAYINGSEGMENT_UPSEG;
drop table if exists CE_LAYINGSEGMENT_POLESEG;
drop table if exists CE_LAYINGSEGMENT_STONESEG;
drop table if exists CE_LAYINGSEGMENT_WALLSEG;
drop table if exists CE_LAYINGSEGMENT_WELLSEG;
drop table if exists CE_LAYINGSEGMENT_TUBEHOLE;
drop table if exists CE_LAYINGSEGMENT_SUBHOLE;
drop table if exists CM_CABLESEG_SYS;
drop table if exists CR_CABLE_CABLE;
drop table if exists CR_LAYINGSEGMENT_CABLE;

CREATE TABLE CE_DEVICE_GJ (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	cutin_date VARCHAR (500),
	longitude VARCHAR (500),
	latitude VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	side VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	related_gisaccessarea VARCHAR (500),
	specifications VARCHAR (500),
	cm_install_capacity VARCHAR (500),
	fpp_level VARCHAR (500),
	market_grid_no VARCHAR (500),
	process_id VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE TSGX_CE_DEVICE_GF (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	cutin_date VARCHAR (500),
	longitude VARCHAR (500),
	latitude VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	market_grid_no VARCHAR (500),
	process_id VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_GB (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	cutin_date VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	related_rs_type VARCHAR (500),
	related_rs_id VARCHAR (500),
	market_grid_no VARCHAR (500),
	process_id VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_JT (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	cutin_date VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	up_to_facility VARCHAR (500),
	facility_Type VARCHAR (500),
	jt_type VARCHAR (500),
	process_id VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CM_PORT_FIBER (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	frame_id VARCHAR (500),
	slot_id VARCHAR (500),
	port_status VARCHAR (500),
	related_odm VARCHAR (500),
	related_device VARCHAR (500),
	related_device_type VARCHAR (500),
	connect_status VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_CABLE_SEGMENT (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	cable_name VARCHAR (500),
	cableSegment_level VARCHAR (500),
	fiber_count VARCHAR (500),
	related_site VARCHAR (500),
	routes VARCHAR (500),
	a_object_id VARCHAR (500),
	z_object_id VARCHAR (500),
	a_object_type VARCHAR (500),
	z_object_type VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	calculated_length VARCHAR (500),
	lifecycle_status VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	project_name VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_CABLE_FIBER (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	a_object_id VARCHAR (500),
	z_object_id VARCHAR (500),
	a_port_id VARCHAR (500),
	z_port_id VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	lifecycle_status VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	fibercableseg_id VARCHAR (500),
	using_status VARCHAR (500),
	fiber_no VARCHAR (500),
	ref_fiberlink_id VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LINK_FIBERLINK (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	start_equipport_id VARCHAR (500),
	end_equipport_id VARCHAR (500),
	start_device_type VARCHAR (500),
	start_device_id VARCHAR (500),
	end_device_type VARCHAR (500),
	end_device_id VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	using_status VARCHAR (500),
	routes VARCHAR (500),
	start_site_id VARCHAR (500),
	end_site_id VARCHAR (500),
	rs_ocircuit VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LINK_OCIRCUIT (
    resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	start_equipport_id VARCHAR (500),
	end_equipport_id VARCHAR (500),
	start_device_id VARCHAR (500),
	end_device_id VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	bear_business VARCHAR (500),
	business_type VARCHAR (500),
	notes1 VARCHAR (500),
	notes2 VARCHAR (500),
	circuit_standard VARCHAR (500),
	start_site_id VARCHAR (500),
	end_site_id VARCHAR (500),
	start_room_id VARCHAR (500),
	end_room_id VARCHAR (500),
	start_port VARCHAR (500),
	end_port VARCHAR (500),
	routes VARCHAR (500),
	process_id VARCHAR (500),
	start_box_id VARCHAR (500),
    end_box_id VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LINK_JUMPLINK (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	start_device_id VARCHAR (500),
	start_device_type VARCHAR (500),
	start_equipport_id VARCHAR (500),
	end_device_id VARCHAR (500),
	end_device_type VARCHAR (500),
	end_equipport_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	rs_ocircuit VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_ASSISTANCE_RESERVE (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	cablesegment_id VARCHAR (500),
	facility_id VARCHAR (500),
	cable_facility_Type VARCHAR (500),
	length VARCHAR (500),
	process_id VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_FACILITY_WELL (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	longitude VARCHAR (500),
	latitude VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	is_first_well VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_FACILITY_POLE (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	longitude VARCHAR (500),
	latitude VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	is_first_pole VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_FACILITY_SUPPORT (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	longitude VARCHAR (500),
	latitude VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_FACILITY_UP (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	longitude VARCHAR (500),
	latitude VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_FACILITY_STONE (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	lifecycle_status VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	longitude VARCHAR (500),
	latitude VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LAYINGSEGMENT_UPSEG (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	a_object_id VARCHAR (500),
	z_object_id VARCHAR (500),
	a_object_type VARCHAR (500),
	z_object_type VARCHAR (500),
	m_length VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	lifecycle_status VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	length VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LAYINGSEGMENT_POLESEG (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	a_object_id VARCHAR (500),
	z_object_id VARCHAR (500),
	a_object_type VARCHAR (500),
	z_object_type VARCHAR (500),
	m_length VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	lifecycle_status VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	length VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LAYINGSEGMENT_STONESEG (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	a_object_id VARCHAR (500),
	z_object_id VARCHAR (500),
	a_object_type VARCHAR (500),
	z_object_type VARCHAR (500),
	m_length VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	lifecycle_status VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	length VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LAYINGSEGMENT_WALLSEG (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	a_object_id VARCHAR (500),
	z_object_id VARCHAR (500),
	a_object_type VARCHAR (500),
	z_object_type VARCHAR (500),
	m_length VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	lifecycle_status VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	length VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LAYINGSEGMENT_WELLSEG (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	a_object_id VARCHAR (500),
	z_object_id VARCHAR (500),
	a_object_type VARCHAR (500),
	z_object_type VARCHAR (500),
	m_length VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	lifecycle_status VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	length VARCHAR (500),
	tubehole_count VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LAYINGSEGMENT_TUBEHOLE (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	tubehole_no VARCHAR (500),
	tubehole_status VARCHAR (500),
	property_right VARCHAR (500),
	property_unit VARCHAR (500),
	lifecycle_status VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	related_layingsegment VARCHAR (500),
	related_cableseg VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_LAYINGSEGMENT_SUBHOLE (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	subhole_no VARCHAR (500),
	subhole_status VARCHAR (500),
	lifecycle_status VARCHAR (500),
	related_cableseg VARCHAR (500),
	related_tubehole VARCHAR (500),
	qualitor VARCHAR (500),
	maintainor VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CM_CABLESEG_SYS (
	resfdn VARCHAR (500),
	zh_label VARCHAR (500),
	cableseg_sys_level VARCHAR (500),
	process_id VARCHAR (500),
	province VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CR_CABLE_CABLE (
	resfdn VARCHAR (500),
	upper_cable_id VARCHAR (500),
	lower_cable_id VARCHAR (500),
	device_type VARCHAR (500),
	jt_id VARCHAR (500),
	province VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CR_LAYINGSEGMENT_CABLE (
	resfdn VARCHAR (500),
	layingsegment_id VARCHAR (500),
	cable_id VARCHAR (500),
	layingSegment_Type VARCHAR (500),
	tubehole_id VARCHAR (500),
	subehole_id VARCHAR (500),
	province VARCHAR (500),
	city VARCHAR (500),
	county VARCHAR (500),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
create index if not exists idx_CE_DEVICE_GJ2resfdn on CE_DEVICE_GJ(resfdn); 
create index if not exists idx_CE_DEVICE_GF2resfdn on TSGX_CE_DEVICE_GF(resfdn); 
create index if not exists idx_CE_DEVICE_GB2resfdn on CE_DEVICE_GB(resfdn); 
create index if not exists idx_CE_DEVICE_JT2resfdn on CE_DEVICE_JT(resfdn); 
create index if not exists idx_CM_PORT_FIBER2resfdn on CM_PORT_FIBER(resfdn); 
create index if not exists idx_CE_CABLE_SEGMENT2resfdn on CE_CABLE_SEGMENT(resfdn); 
create index if not exists idx_CE_CABLE_SEGMENT2a_object_id on CE_CABLE_SEGMENT(a_object_id); 
create index if not exists idx_CE_CABLE_SEGMENT2z_object_id on CE_CABLE_SEGMENT(z_object_id); 
create index if not exists idx_CE_CABLE_FIBER2resfdn on CE_CABLE_FIBER(resfdn); 
create index if not exists idx_CE_CABLE_FIBER2fibercableseg_id on CE_CABLE_FIBER(fibercableseg_id); 
create index if not exists idx_CE_LINK_FIBERLINK2resfdn on CE_LINK_FIBERLINK(resfdn); 
create index if not exists idx_CE_LINK_FIBERLINK2start_equipport_id on CE_LINK_FIBERLINK(start_equipport_id); 
create index if not exists idx_CE_LINK_FIBERLINK2end_equipport_id on CE_LINK_FIBERLINK(end_equipport_id); 
create index if not exists idx_CE_LINK_OCIRCUIT2resfdn on CE_LINK_OCIRCUIT(resfdn); 
create index if not exists idx_CE_LINK_OCIRCUIT2start_equipport_id on CE_LINK_OCIRCUIT(start_equipport_id); 
create index if not exists idx_CE_LINK_OCIRCUIT2end_equipport_id on CE_LINK_OCIRCUIT(end_equipport_id); 
create index if not exists idx_CE_LINK_OCIRCUIT2start_port on CE_LINK_OCIRCUIT(start_port); 
create index if not exists idx_CE_LINK_OCIRCUIT2end_port on CE_LINK_OCIRCUIT(end_port); 
create index if not exists idx_CE_LINK_JUMPLINK2resfdn on CE_LINK_JUMPLINK(resfdn); 
create index if not exists idx_CE_ASSISTANCE_RESERVE2resfdn on CE_ASSISTANCE_RESERVE(resfdn); 
create index if not exists idx_CE_FACILITY_WELL2resfdn on CE_FACILITY_WELL(resfdn); 
create index if not exists idx_CE_FACILITY_POLE2resfdn on CE_FACILITY_POLE(resfdn); 
create index if not exists idx_CE_FACILITY_SUPPORT2resfdn on CE_FACILITY_SUPPORT(resfdn); 
create index if not exists idx_CE_FACILITY_UP2resfdn on CE_FACILITY_UP(resfdn); 
create index if not exists idx_CE_FACILITY_STONE2resfdn on CE_FACILITY_STONE(resfdn); 
create index if not exists idx_CE_LAYINGSEGMENT_UPSEG2resfdn on CE_LAYINGSEGMENT_UPSEG(resfdn); 
create index if not exists idx_CE_LAYINGSEGMENT_UPSEG2a_object_id on CE_LAYINGSEGMENT_UPSEG(a_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_UPSEG2z_object_id on CE_LAYINGSEGMENT_UPSEG(z_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_POLESEG2resfdn on CE_LAYINGSEGMENT_POLESEG(resfdn); 
create index if not exists idx_CE_LAYINGSEGMENT_POLESEG2a_object_id on CE_LAYINGSEGMENT_POLESEG(a_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_POLESEG2z_object_id on CE_LAYINGSEGMENT_POLESEG(z_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_STONESEG2resfdn on CE_LAYINGSEGMENT_STONESEG(resfdn); 
create index if not exists idx_CE_LAYINGSEGMENT_STONESEG2a_object_id on CE_LAYINGSEGMENT_STONESEG(a_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_STONESEG2z_object_id on CE_LAYINGSEGMENT_STONESEG(z_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_WALLSEG2resfdn on CE_LAYINGSEGMENT_WALLSEG(resfdn); 
create index if not exists idx_CE_LAYINGSEGMENT_WALLSEG2a_object_id on CE_LAYINGSEGMENT_WALLSEG(a_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_WALLSEG2z_object_id on CE_LAYINGSEGMENT_WALLSEG(z_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_WELLSEG2resfdn on CE_LAYINGSEGMENT_WELLSEG(resfdn); 
create index if not exists idx_CE_LAYINGSEGMENT_WELLSEG2a_object_id on CE_LAYINGSEGMENT_WELLSEG(a_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_WELLSEG2z_object_id on CE_LAYINGSEGMENT_WELLSEG(z_object_id); 
create index if not exists idx_CE_LAYINGSEGMENT_TUBEHOLE2resfdn on CE_LAYINGSEGMENT_TUBEHOLE(resfdn); 
create index if not exists idx_CE_LAYINGSEGMENT_SUBHOLE2resfdn on CE_LAYINGSEGMENT_SUBHOLE(resfdn); 
create index if not exists idx_CM_CABLESEG_SYS2resfdn on CM_CABLESEG_SYS(resfdn); 
create index if not exists idx_CR_CABLE_CABLE2resfdn on CR_CABLE_CABLE(resfdn); 
create index if not exists idx_CR_LAYINGSEGMENT_CABLE2resfdn on CR_LAYINGSEGMENT_CABLE(resfdn); 
--idc ddl
drop table if exists IDC_DATACENTER;
drop table if exists IDC_SITE;
drop table if exists IDC_ROOM;
drop table if exists IDC_RACK;
drop table if exists IDC_DEVICE;

CREATE TABLE IDC_DATACENTER (
	int_id VARCHAR ( 500 ),
	dc_id VARCHAR ( 500 ),
	related_dc VARCHAR ( 500 ),
	province VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	floor_area VARCHAR ( 500 ),
	dc_contact VARCHAR ( 500 ),
	network_access_level VARCHAR ( 500 ),
	net_export_bandwidth VARCHAR ( 500 ),
	net_export_gateway_ip_address VARCHAR ( 500 ),
	three_wire_access_capacity VARCHAR ( 500 ),
	setup_time VARCHAR ( 500 ),
	dc_telephone VARCHAR ( 500 ),
	dc_property VARCHAR ( 500 ),
	dc_level VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE IDC_SITE (
	int_id VARCHAR ( 500 ),
	site_code VARCHAR ( 500 ),
	related_site VARCHAR ( 500 ),
	setup_time VARCHAR ( 500 ),
	property_unit VARCHAR ( 500 ),
	property_right VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE IDC_ROOM (
	int_id VARCHAR ( 500 ),
	room_code VARCHAR ( 500 ),
	related_room VARCHAR ( 500 ),
	floor_height VARCHAR ( 500 ),
	room_level VARCHAR ( 500 ),
	plan_rack_num VARCHAR ( 500 ),
	total_rack_loading_number VARCHAR ( 500 ),
	used_rack_number VARCHAR ( 500 ),
	design_power VARCHAR ( 500 ),
	room_contact VARCHAR ( 500 ),
	room_telephone VARCHAR ( 500 ),
	assets_no VARCHAR ( 500 ),
	related_dept VARCHAR ( 500 ),
	position_on_floor VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE IDC_RACK (
	int_id VARCHAR ( 500 ),
	rack_id VARCHAR ( 500 ),
	related_rack VARCHAR ( 500 ),
	location_label VARCHAR ( 500 ),
	planned_use VARCHAR ( 500 ),
	height VARCHAR ( 500 ),
	width VARCHAR ( 500 ),
	depth VARCHAR ( 500 ),
	rated_power VARCHAR ( 500 ),
	specification_type VARCHAR ( 500 ),
	setup_time VARCHAR ( 500 ),
	use_corp VARCHAR ( 500 ),
	related_supplycompany VARCHAR ( 500 ),
	retire_net_time VARCHAR ( 500 ),
	is_occupy VARCHAR ( 500 ),
	integrate_air VARCHAR ( 500 ),
	occupy_upos_num VARCHAR ( 500 ),
	idle_upos_num VARCHAR ( 500 ),
	power_supply_type VARCHAR ( 500 ),
	power_consume_type VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE IDC_DEVICE (
	int_id VARCHAR ( 500 ),
	device_name VARCHAR ( 500 ),
	vendor_name VARCHAR ( 500 ),
	device_model VARCHAR ( 500 ),
	start_u VARCHAR ( 500 ),
	occupy_upos_num VARCHAR ( 500 ),
	ipv4_manage VARCHAR ( 500 ),
	ipv6_manage VARCHAR ( 500 ),
	rated_power VARCHAR ( 500 ),
	collect_port_rate VARCHAR ( 500 ),
	setup_time VARCHAR ( 500 ),
	rack_surface VARCHAR ( 500 ),
	device_type VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	related_rack VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
create index if not exists idx_IDC_DATACENTER2intId on IDC_DATACENTER(int_id);
create index if not exists idx_IDC_SITE2intId on IDC_SITE(int_id);
create index if not exists idx_IDC_ROOM2intId on IDC_ROOM(int_id);
create index if not exists idx_IDC_RACK2intId on IDC_RACK(int_id);
create index if not exists idx_IDC_DEVICE2intId on IDC_DEVICE(int_id);

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
	res_code VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	power_site_level VARCHAR ( 500 ),
	power_supply VARCHAR ( 500 ),
	power_is_substations VARCHAR ( 500 ),
	mains_voltage_level VARCHAR ( 500 ),
	mains_nature VARCHAR ( 500 ),
	total_mains_number VARCHAR ( 500 ),
	mains_capacity VARCHAR ( 500 ),
	mains_configuration_level VARCHAR ( 500 ),
	total_tank_number VARCHAR ( 500 ),
	tatal_tank_volume VARCHAR ( 500 ),
	property_unit VARCHAR ( 500 ),
	is_attach_idc_room VARCHAR ( 500 ),
	design_pue VARCHAR ( 500 ),
	actual_pue VARCHAR ( 500 ),
	water_cooling_conf VARCHAR ( 500 ),
	is_cold_storage_install VARCHAR ( 500 ),
	cold_storage_time VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE RM_ROOM_PROPERTY (
	res_code VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	power_room_type VARCHAR ( 500 ),
	power_related_site_name VARCHAR ( 500 ),
	space_room_type VARCHAR ( 500 ),
	battery_backup_time VARCHAR ( 500 ),
	power_supply_mode VARCHAR ( 500 ),
	power_supply_type VARCHAR ( 500 ),
	ac_terminal VARCHAR ( 500 ),
	ac_config VARCHAR ( 500 ),
	refrigeration_mode VARCHAR ( 500 ),
	refer_pue VARCHAR ( 500 ),
	power_monitor_conf VARCHAR ( 500 ),
	video_monitor_conf VARCHAR ( 500 ),
	log_saved_time VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_TRANSFORM (
	res_code VARCHAR ( 500 ),
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
	res_code VARCHAR ( 500 ),
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
	res_code VARCHAR ( 500 ),
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
	res_code VARCHAR ( 500 ),
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
	res_code VARCHAR ( 500 ),
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
	res_code VARCHAR ( 500 ),
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
	total_rack_loading_modules VARCHAR ( 500 ),
	total_rack_match_modules VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	system_code  VARCHAR ( 500 ),
	system_rated_capacity  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_LOW_AC_DISTRIBUTION (
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	system_code  VARCHAR ( 500 ),
	system_rated_capacity  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_POWER_GENERATION (
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
	system_code  VARCHAR ( 500 ),
	system_rated_capacity  VARCHAR ( 500 ),
	lifecycle_status  VARCHAR ( 500 ),
	qualitor  VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE CE_DEVICE_PE_SWITCH_POWER (
	res_code  VARCHAR ( 500 ),
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
	total_rack_loading_modules  VARCHAR ( 500 ),
	total_rack_match_modules  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	system_type  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
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
	res_code  VARCHAR ( 500 ),
	province_id  VARCHAR ( 500 ),
	city_id  VARCHAR ( 500 ),
	county_id  VARCHAR ( 500 ),
	related_site  VARCHAR ( 500 ),
	related_room  VARCHAR ( 500 ),
	device_type  VARCHAR ( 500 ),
	device_subclass  VARCHAR ( 500 ),
	zh_label  VARCHAR ( 500 ),
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

create index if not exists idx_RM_SITE_PROPERTY2intId on RM_SITE_PROPERTY(res_code);
create index if not exists idx_RM_SITE_PROPERTY2zh_label on RM_SITE_PROPERTY(zh_label);
create index if not exists idx_RM_ROOM_PROPERTY2intId on RM_ROOM_PROPERTY(res_code);
create index if not exists idx_RM_ROOM_PROPERTY2zh_label on RM_ROOM_PROPERTY(zh_label);
create index if not exists idx_RM_ROOM_PROPERTY2power_related_site_name on RM_ROOM_PROPERTY(power_related_site_name);
create index if not exists idx_CE_DEVICE_PE_TRANSFORM2intId on CE_DEVICE_PE_TRANSFORM(res_code);
create index if not exists idx_CE_DEVICE_PE_TRANSFORM2related_room on CE_DEVICE_PE_TRANSFORM(related_room);
create index if not exists idx_CE_DECIVE_PE_TRANSFORM_DEVICE2intId on CE_DECIVE_PE_TRANSFORM_DEVICE(res_code);
create index if not exists idx_CE_DECIVE_PE_TRANSFORM_DEVICE2related_room on CE_DECIVE_PE_TRANSFORM_DEVICE(related_room);
create index if not exists idx_CE_NET_PE_HIGH_DISTRIBUTION2intId on CE_NET_PE_HIGH_DISTRIBUTION(res_code);
create index if not exists idx_CE_NET_PE_HIGH_DISTRIBUTION2related_room on CE_NET_PE_HIGH_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_DISTRIBUTION2intId on CE_DEVICE_PE_HIGH_DISTRIBUTION(res_code);
create index if not exists idx_CE_DEVICE_PE_HIGH_DISTRIBUTION2related_room on CE_DEVICE_PE_HIGH_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_DISTRIBUTION2related_system on CE_DEVICE_PE_HIGH_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_HIGH_POWER2intId on CE_NET_PE_HIGH_POWER(res_code);
create index if not exists idx_CE_NET_PE_HIGH_POWER2related_room on CE_NET_PE_HIGH_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_POWER2intId on CE_DEVICE_PE_HIGH_POWER(res_code);
create index if not exists idx_CE_DEVICE_PE_HIGH_POWER2related_room on CE_DEVICE_PE_HIGH_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_POWER2related_system on CE_DEVICE_PE_HIGH_POWER(related_system);
create index if not exists idx_CE_DEVICE_PE_HIGH_DC_DISTRIBUTION2intId on CE_DEVICE_PE_HIGH_DC_DISTRIBUTION(res_code);
create index if not exists idx_CE_DEVICE_PE_HIGH_DC_DISTRIBUTION2related_room on CE_DEVICE_PE_HIGH_DC_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_HIGH_DC_DISTRIBUTION2related_system on CE_DEVICE_PE_HIGH_DC_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_LOW_DISTRIBUTION2intId on CE_NET_PE_LOW_DISTRIBUTION(res_code);
create index if not exists idx_CE_NET_PE_LOW_DISTRIBUTION2related_room on CE_NET_PE_LOW_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2intId on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(res_code);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2related_room on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_LOW_AC_DISTRIBUTION2related_system on CE_DEVICE_PE_LOW_AC_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_SWITCH_POWER2intId on CE_NET_PE_SWITCH_POWER(res_code);
create index if not exists idx_CE_NET_PE_SWITCH_POWER2related_room on CE_NET_PE_SWITCH_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_POWER_GENERATION2intId on CE_DEVICE_PE_POWER_GENERATION(res_code);
create index if not exists idx_CE_DEVICE_PE_POWER_GENERATION2related_room on CE_DEVICE_PE_POWER_GENERATION(related_room);
create index if not exists idx_CE_DEVICE_PE_POWER_GENERATION2related_system on CE_DEVICE_PE_POWER_GENERATION(related_system);
create index if not exists idx_CE_NET_PE_OPEN_POWER2intId on CE_NET_PE_OPEN_POWER(res_code);
create index if not exists idx_CE_NET_PE_OPEN_POWER2related_room on CE_NET_PE_OPEN_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_SWITCH_POWER2intId on CE_DEVICE_PE_SWITCH_POWER(res_code);
create index if not exists idx_CE_DEVICE_PE_SWITCH_POWER2related_room on CE_DEVICE_PE_SWITCH_POWER(related_room);
create index if not exists idx_CE_DEVICE_PE_SWITCH_POWER2related_system on CE_DEVICE_PE_SWITCH_POWER(related_system);
create index if not exists idx_CE_DEVICE_PE_LOW_DC_DISTRIBUTION2intId on CE_DEVICE_PE_LOW_DC_DISTRIBUTION(res_code);
create index if not exists idx_CE_DEVICE_PE_LOW_DC_DISTRIBUTION2related_room on CE_DEVICE_PE_LOW_DC_DISTRIBUTION(related_room);
create index if not exists idx_CE_DEVICE_PE_LOW_DC_DISTRIBUTION2related_system on CE_DEVICE_PE_LOW_DC_DISTRIBUTION(related_system);
create index if not exists idx_CE_NET_PE_UPS2intId on CE_NET_PE_UPS(res_code);
create index if not exists idx_CE_NET_PE_UPS2related_room on CE_NET_PE_UPS(related_room);
create index if not exists idx_CE_DEVICE_PE_UPS2intId on CE_DEVICE_PE_UPS(res_code);
create index if not exists idx_CE_DEVICE_PE_UPS2related_room on CE_DEVICE_PE_UPS(related_room);
create index if not exists idx_CE_DEVICE_PE_UPS2related_system on CE_DEVICE_PE_UPS(related_system);
create index if not exists idx_CE_DEVICE_PE_BATTERY2intId on CE_DEVICE_PE_BATTERY(res_code);
create index if not exists idx_CE_DEVICE_PE_BATTERY2related_room on CE_DEVICE_PE_BATTERY(related_room);
create index if not exists idx_CE_DEVICE_PE_BATTERY2ralated_power_device on CE_DEVICE_PE_BATTERY(ralated_power_device);
create index if not exists idx_CE_DEVICE_PE_AIR2intId on CE_DEVICE_PE_AIR(res_code);
create index if not exists idx_CE_DEVICE_PE_AIR2related_room on CE_DEVICE_PE_AIR(related_room);
create index if not exists idx_CE_DEVICE_PE_ENERY_SAVE2intId on CE_DEVICE_PE_ENERY_SAVE(res_code);
create index if not exists idx_CE_DEVICE_PE_ENERY_SAVE2related_room on CE_DEVICE_PE_ENERY_SAVE(related_room);
create index if not exists idx_CE_DEVICE_PE_POWER_MONITOR2intId on CE_DEVICE_PE_POWER_MONITOR(res_code);
create index if not exists idx_CE_DEVICE_PE_POWER_MONITOR2related_room on CE_DEVICE_PE_POWER_MONITOR(related_room);
create index if not exists idx_CE_DEVICE_PE_SMART_METER2intId on CE_DEVICE_PE_SMART_METER(res_code);
create index if not exists idx_CE_DEVICE_PE_SMART_METER2related_room on CE_DEVICE_PE_SMART_METER(related_room);
create index if not exists idx_CE_LINK_PE_IN2intId on CE_LINK_PE_IN(res_code);
create index if not exists idx_CE_LINK_PE_IN2related_room on CE_LINK_PE_IN(related_room);
create index if not exists idx_CE_LINK_PE_IN2related_device on CE_LINK_PE_IN(related_device);
create index if not exists idx_CE_LINK_PE_OUT2intId on CE_LINK_PE_OUT(res_code);
create index if not exists idx_CE_LINK_PE_OUT2related_room on CE_LINK_PE_OUT(related_room);
create index if not exists idx_CE_LINK_PE_OUT2down_device_related_rack on CE_LINK_PE_OUT(down_device_related_rack);
create index if not exists idx_CE_DEVICE_PE_OTHER2intId on CE_DEVICE_PE_OTHER(res_code);
create index if not exists idx_CE_DEVICE_PE_OTHER2related_room on CE_DEVICE_PE_OTHER(related_room);
---传输内线--ddl
drop table if exists EMS;
drop table if exists SUBNET;
drop table if exists TRANSI_SYSTEM;
drop table if exists DEVICE;
drop table if exists TSNX_BOARD;
drop table if exists TSNX_PORT;
drop table if exists LINK_PORT_ODF;
drop table if exists TOPO;
drop table if exists OPATH;
drop table if exists OTS;
drop table if exists WDMS;
drop table if exists SERVICE_PATH;
drop table if exists SDH_PATH;
drop table if exists TUNNEL;
drop table if exists PW;
drop table if exists TRANSI_CIRCUIT;
drop table if exists PROTECT_GROUP;
drop table if exists L3VPN_BI;
drop table if exists L3VPN_AP;
drop table if exists SR_TUNNEL_SER;
drop table if exists SR_TUNNEL;
drop table if exists IGP_TOPO;
drop table if exists IGP_LINK_INFO;
drop table if exists NETWORK_SLICING;
drop table if exists MTN_GROUP;
drop table if exists MTN_CHANNEL;
CREATE TABLE EMS (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	ems_type VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	is_protected VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE SUBNET (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	related_omc VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE TRANSI_SYSTEM (
	res_identifier VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	related_ne VARCHAR ( 500 ),
	related_topo VARCHAR ( 500 ),
	system_type VARCHAR ( 500 ),
	designed_capacity VARCHAR ( 500 ),
	system_level VARCHAR ( 500 ),
	related_omc VARCHAR ( 500 ),
	desc_route VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE DEVICE (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	related_rack VARCHAR ( 500 ),
	ne_type VARCHAR ( 500 ),
	service_level VARCHAR ( 500 ),
	vendor_id VARCHAR ( 500 ),
	device_type VARCHAR ( 500 ),
	access_time VARCHAR ( 500 ),
	software_version VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	related_postion_related_room VARCHAR ( 500 ),
	is_nter_working VARCHAR ( 500 ),
	nter_working VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	start_u VARCHAR ( 500 ),
    occupy_u_count VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE TSNX_BOARD (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	related_ne VARCHAR ( 500 ),
	related_solt VARCHAR ( 500 ),
	board_model VARCHAR ( 500 ),
	soft_version VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE TSNX_PORT (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	port_status VARCHAR ( 500 ),
	related_ne VARCHAR ( 500 ),
	related_card VARCHAR ( 500 ),
	use_type VARCHAR ( 500 ),
	port_rate VARCHAR ( 500 ),
	port_net_type VARCHAR ( 500 ),
	physics_type VARCHAR ( 500 ),
	protect_group VARCHAR ( 500 ),
	related_physical_port VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE LINK_PORT_ODF (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE TOPO (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_device VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	related_omc_a VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_device VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	related_omc_z VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	topo_type VARCHAR ( 500 ),
	bottom_connection VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE OPATH (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	related_wdms VARCHAR ( 500 ),
	a_device VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_device VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	rate VARCHAR ( 500 ),
	protection_type VARCHAR ( 500 ),
	bottom_connection VARCHAR ( 500 ),
	related_omc_z VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE OTS (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	related_protect_group VARCHAR ( 500 ),
	use_type VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE WDMS (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	route VARCHAR ( 500 ),
	channel_num VARCHAR ( 500 ),
	related_protect_group VARCHAR ( 500 ),
	use_type VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE SERVICE_PATH (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	type VARCHAR ( 500 ),
	route VARCHAR ( 500 ),
	rate VARCHAR ( 500 ),
	status VARCHAR ( 500 ),
	related_protect_group VARCHAR ( 500 ),
	use_type VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE SDH_PATH (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_device VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_ctp VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_device VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_ctp VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	related_protect_group VARCHAR ( 500 ),
	link_used_flag VARCHAR ( 500 ),
	rate VARCHAR ( 500 ),
	use_type VARCHAR ( 500 ),
	route text,
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE TUNNEL (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_device VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_device VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	related_omc VARCHAR ( 500 ),
	related_protect_group VARCHAR ( 500 ),
	use_type VARCHAR ( 500 ),
	cir VARCHAR ( 500 ),
	pir VARCHAR ( 500 ),
	route VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE PW (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_device VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_device VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	related_omc VARCHAR ( 500 ),
	related_protect_group VARCHAR ( 500 ),
	use_type VARCHAR ( 500 ),
	cir VARCHAR ( 500 ),
	pir VARCHAR ( 500 ),
	VLAN VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE TRANSI_CIRCUIT (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	circuit_no VARCHAR ( 500 ),
	ext_ids VARCHAR ( 500 ),
	cic_level VARCHAR ( 500 ),
	bandwidth VARCHAR ( 500 ),
	circuit_route text,
	a_trans_ne VARCHAR ( 500 ),
	a_biz_port VARCHAR ( 500 ),
	a_trans_port VARCHAR ( 500 ),
	a_trans_ctp VARCHAR ( 500 ),
	z_trans_ne VARCHAR ( 500 ),
	z_biz_port VARCHAR ( 500 ),
	z_trans_port VARCHAR ( 500 ),
	z_trans_ctp VARCHAR ( 500 ),
	biz_vlan VARCHAR ( 500 ),
	a_vlan VARCHAR ( 500 ),
	z_vlan VARCHAR ( 500 ),
	used_time VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	cust_name VARCHAR ( 500 ),
	product_no VARCHAR ( 500 ),
	service_level VARCHAR ( 500 ),
	bearing_type VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE PROTECT_GROUP (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	related_omc VARCHAR ( 500 ),
	protect_purpose VARCHAR ( 500 ),
	reversion_mode VARCHAR ( 500 ),
	protect_type VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
--todu
CREATE TABLE L3VPN_BI (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	direction VARCHAR ( 500 ),
	active_state VARCHAR ( 500 ),
	related_tunnel_related_SR_tunnel_service VARCHAR ( 500 ),  ----------
	is_tunnel_group VARCHAR ( 500 ),
	related_omc VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE L3VPN_AP (
	res_identifier VARCHAR ( 500 ),
	ne_id VARCHAR ( 500 ),
	port_id VARCHAR ( 500 ),
	related_l3vpn VARCHAR ( 500 ),
	cvid VARCHAR ( 500 ),
	svid VARCHAR ( 500 ),
	ip_address VARCHAR ( 500 ),
	ip_mask VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE SR_TUNNEL_SER (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	service_state VARCHAR ( 500 ),
	a_ne VARCHAR ( 500 ),
	a_ip VARCHAR ( 500 ),
	z_ne VARCHAR ( 500 ),
	z_ip VARCHAR ( 500 ),
	reversion_mode VARCHAR ( 500 ),
	protect_type VARCHAR ( 500 ),
	related_SPN VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE SR_TUNNEL (
	res_identifier VARCHAR ( 500 ),
	related_SR_tunnel_service VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	direction VARCHAR ( 500 ),
	status VARCHAR ( 500 ),
	a_ne VARCHAR ( 500 ),
	a_ip VARCHAR ( 500 ),
	z_ne VARCHAR ( 500 ),
	z_ip VARCHAR ( 500 ),
	cir VARCHAR ( 500 ),
	committed_path_delay VARCHAR ( 500 ),
	signal_type VARCHAR ( 500 ),
	role VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE IGP_TOPO (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE IGP_LINK_INFO (
	res_identifier VARCHAR ( 500 ),
	related_SR_tunnel_service VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	a_ne VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	z_ne VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	bandwidth VARCHAR ( 500 ),
	a_province_id VARCHAR ( 500 ),
	a_city_id VARCHAR ( 500 ),
	a_county_id VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);
CREATE TABLE NETWORK_SLICING (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	type VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE MTN_GROUP (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	serial_no VARCHAR ( 500 ),
	bandwidth VARCHAR ( 500 ),
	physical_port VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

CREATE TABLE MTN_CHANNEL (
	res_identifier VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	related_SPN VARCHAR ( 500 ),
	activate_flag VARCHAR ( 500 ),
	a_ne VARCHAR ( 500 ),
	a_port VARCHAR ( 500 ),
	z_ne VARCHAR ( 500 ),
	z_port VARCHAR ( 500 ),
	bandwidth VARCHAR ( 500 ),
	z_province_id VARCHAR ( 500 ),
	z_city_id VARCHAR ( 500 ),
	z_county_id VARCHAR ( 500 ),
	dims_col_result TEXT,
    dims_col_rtName TEXT 
);

create index if not exists idx_EMS2res_identifier on EMS(res_identifier);
create index if not exists idx_SUBNET2res_identifier on SUBNET(res_identifier);
create index if not exists idx_SUBNET2related_omc on SUBNET(related_omc);
create index if not exists idx_TRANSI_SYSTEM2res_identifier on TRANSI_SYSTEM(res_identifier);
create index if not exists idx_TRANSI_SYSTEM2related_omc on TRANSI_SYSTEM(related_omc);
create index if not exists idx_DEVICE2res_identifier on DEVICE(res_identifier);
create index if not exists idx_DEVICE2related_postion_related_room on DEVICE(related_postion_related_room);
create index if not exists idx_BOARD2res_identifier on TSNX_BOARD(res_identifier);
create index if not exists idx_BOARD2related_ne on TSNX_BOARD(related_ne);
create index if not exists idx_PORT2res_identifier on TSNX_PORT(res_identifier);
create index if not exists idx_PORT2related_ne on TSNX_PORT(related_ne);
create index if not exists idx_LINK_PORT_ODF2res_identifier on LINK_PORT_ODF(res_identifier);
create index if not exists idx_LINK_PORT_ODF2a_port on LINK_PORT_ODF(a_port);
create index if not exists idx_LINK_PORT_ODF2z_port on LINK_PORT_ODF(z_port);
create index if not exists idx_TOPO2res_identifier on TOPO(res_identifier);
create index if not exists idx_TOPO2a_device on TOPO(a_device);
create index if not exists idx_TOPO2a_port on TOPO(a_port);
create index if not exists idx_TOPO2z_device on TOPO(z_device);
create index if not exists idx_TOPO2z_port on TOPO(z_port);
create index if not exists idx_OPATH2res_identifier on OPATH(res_identifier);
create index if not exists idx_OPATH2a_device on OPATH(a_device);
create index if not exists idx_OPATH2a_port on OPATH(a_port);
create index if not exists idx_OPATH2z_device on OPATH(z_device);
create index if not exists idx_OPATH2z_port on OPATH(z_port);
create index if not exists idx_OPATH2related_wdms on OPATH(related_wdms);
create index if not exists idx_OTS2res_identifier on OTS(res_identifier);
create index if not exists idx_OTS2a_port on OTS(a_port);
create index if not exists idx_OTS2z_port on OTS(z_port);
create index if not exists idx_WDMS2res_identifier on WDMS(res_identifier);
create index if not exists idx_WDMS2a_port on WDMS(a_port);
create index if not exists idx_WDMS2z_port on WDMS(z_port);
create index if not exists idx_SERVICE_PATH2res_identifier on SERVICE_PATH(res_identifier);
create index if not exists idx_SERVICE_PATH2a_port on SERVICE_PATH(a_port);
create index if not exists idx_SERVICE_PATH2z_port on SERVICE_PATH(z_port);
create index if not exists idx_SDH_PATH2res_identifier on SDH_PATH(res_identifier);
create index if not exists idx_SDH_PATH2a_device on SDH_PATH(a_device);
create index if not exists idx_SDH_PATH2z_device on SDH_PATH(z_device);
create index if not exists idx_SDH_PATH2a_port on SDH_PATH(a_port);
create index if not exists idx_SDH_PATH2z_port on SDH_PATH(z_port);
create index if not exists idx_TUNNEL2res_identifier on TUNNEL(res_identifier);
create index if not exists idx_TUNNEL2a_device on TUNNEL(a_device);
create index if not exists idx_TUNNEL2z_device on TUNNEL(z_device);
create index if not exists idx_TUNNEL2a_port on TUNNEL(a_port);
create index if not exists idx_TUNNEL2z_port on TUNNEL(z_port);
create index if not exists idx_PW2res_identifier on PW(res_identifier);
create index if not exists idx_PW2a_device on PW(a_device);
create index if not exists idx_PW2z_device on PW(z_device);
create index if not exists idx_PW2a_port on PW(a_port);
create index if not exists idx_PW2z_port on PW(z_port);
create index if not exists idx_TRANSI_CIRCUIT2res_identifier on TRANSI_CIRCUIT(res_identifier);
create index if not exists idx_TRANSI_CIRCUIT2a_trans_ne on TRANSI_CIRCUIT(a_trans_ne);
create index if not exists idx_TRANSI_CIRCUIT2z_trans_ne on TRANSI_CIRCUIT(z_trans_ne);
create index if not exists idx_TRANSI_CIRCUIT2a_trans_port on TRANSI_CIRCUIT(a_trans_port);
create index if not exists idx_TRANSI_CIRCUIT2z_trans_port on TRANSI_CIRCUIT(z_trans_port);
create index if not exists idx_PROTECT_GROUP2res_identifier on PROTECT_GROUP(res_identifier);
create index if not exists idx_PROTECT_GROUP2related_omc on PROTECT_GROUP(related_omc);
create index if not exists idx_L3VPN_BI2res_identifier on L3VPN_BI(res_identifier);
create index if not exists idx_L3VPN_BI2related_omc on L3VPN_BI(related_omc);
create index if not exists idx_L3VPN_AP2res_identifier on L3VPN_AP(res_identifier);
create index if not exists idx_L3VPN_AP2ne_id on L3VPN_AP(ne_id);
create index if not exists idx_L3VPN_AP2port_id on L3VPN_AP(port_id);
create index if not exists idx_L3VPN_AP2related_l3vpn on L3VPN_AP(related_l3vpn);
create index if not exists idx_SR_TUNNEL_SER2res_identifier on SR_TUNNEL_SER(res_identifier);
create index if not exists idx_SR_TUNNEL_SER2a_ne on SR_TUNNEL_SER(a_ne);
create index if not exists idx_SR_TUNNEL_SER2z_ne on SR_TUNNEL_SER(z_ne);
create index if not exists idx_SR_TUNNEL2res_identifier on SR_TUNNEL(res_identifier);
create index if not exists idx_SR_TUNNEL2z_ne on SR_TUNNEL(z_ne);
create index if not exists idx_SR_TUNNEL2a_ne on SR_TUNNEL(a_ne);
create index if not exists idx_SR_TUNNEL2related_SR_tunnel_service on SR_TUNNEL(related_SR_tunnel_service);
create index if not exists idx_IGP_TOPO2res_identifier on IGP_TOPO(res_identifier);
create index if not exists idx_IGP_LINK_INFO2res_identifier on IGP_LINK_INFO(res_identifier);
create index if not exists idx_IGP_LINK_INFO2a_ne on IGP_LINK_INFO(a_ne);
create index if not exists idx_IGP_LINK_INFO2z_ne on IGP_LINK_INFO(z_ne);
create index if not exists idx_IGP_LINK_INFO2a_port on IGP_LINK_INFO(a_port);
create index if not exists idx_IGP_LINK_INFO2z_port on IGP_LINK_INFO(z_port);
create index if not exists idx_IGP_LINK_INFO2related_SR_tunnel_service on IGP_LINK_INFO(related_SR_tunnel_service);
create index if not exists idx_NETWORK_SLICING2res_identifier on NETWORK_SLICING(res_identifier);
create index if not exists idx_MTN_GROUP2res_identifier on MTN_GROUP(res_identifier);
create index if not exists idx_MTN_GROUP2zh_label on MTN_GROUP(zh_label);
create index if not exists idx_MTN_CHANNEL2res_identifier on MTN_CHANNEL(res_identifier);
create index if not exists idx_MTN_CHANNEL2a_ne on MTN_CHANNEL(a_ne);
create index if not exists idx_MTN_CHANNEL2z_ne on MTN_CHANNEL(z_ne);
create index if not exists idx_MTN_CHANNEL2a_port on MTN_CHANNEL(a_port);
create index if not exists idx_MTN_CHANNEL2z_port on MTN_CHANNEL(z_port);

--空间ddl
drop table if exists RM_AREA_SITE;
drop table if exists RM_AREA_RESPOINT;
drop table if exists RM_AREA_ROOM;
drop table if exists RM_AREA_RACKPOS;
drop table if exists RM_AREA_DC;
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
	alias_name VARCHAR ( 500 ),
	related_dc VARCHAR ( 500 ),
	floor_number VARCHAR ( 500 ),
	lifecycle_status VARCHAR ( 500 ),
	use_corp VARCHAR ( 500 ),
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
	china_tower_address_code TEXT,
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
	row_num VARCHAR ( 500 ),
	column_num VARCHAR ( 500 ),
	start_row VARCHAR ( 500 ),
	end_row VARCHAR ( 500 ),
	start_column VARCHAR ( 500 ),
	end_column VARCHAR ( 500 ),
	length VARCHAR ( 500 ),
	width VARCHAR ( 500 ),
	air_total_rated_power VARCHAR ( 500 ),
	asset_address_code VARCHAR ( 500 ),
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
CREATE TABLE RM_AREA_DC (
	int_id VARCHAR ( 500 ),
	zh_label VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	dc_level VARCHAR ( 500 ),
	dc_type VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
	address VARCHAR ( 500 ),
	longitude VARCHAR ( 500 ),
	latitude VARCHAR ( 500 ),
	dims_col_result TEXT,
	dims_col_rtName TEXT 
);
create index if not exists idx_RM_AREA_SITE2intId on RM_AREA_SITE(int_id);
create index if not exists idx_RM_AREA_ROOM2intId on RM_AREA_ROOM(int_id);
create index if not exists idx_RM_AREA_ROOM2related_site on RM_AREA_ROOM(related_site);
create index if not exists idx_RM_AREA_RESPOINT2intId on RM_AREA_RESPOINT(int_id);
create index if not exists idx_RM_AREA_RACKPOS2intId on RM_AREA_RACKPOS(int_id);
create index if not exists idx_RM_AREA_RACKPOS2equiproom_id on RM_AREA_RACKPOS(equiproom_id);
create index if not exists idx_RM_AREA_DC2intId on RM_AREA_DC(int_id);
create index if not exists idx_RM_AREA_DC2related_dc on RM_AREA_DC(int_id);

--公共ddl
drop table if exists CM_DEVICE_RACK;
drop table if exists CE_WARE_DDM;
drop table if exists CE_WARE_ODM;
drop table if exists CM_PORT_DDF;
drop table if exists CM_PORT_ODF;
drop table if exists RM_AREA_UPOS;
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
	property_right VARCHAR ( 500 ),
	property_unit VARCHAR ( 500 ),
	qualitor VARCHAR ( 500 ),
	qualitor_phone VARCHAR ( 500 ),
	assets_no VARCHAR ( 500 ),
	faceside VARCHAR ( 500 ),
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
CREATE TABLE RM_AREA_UPOS (
	int_id VARCHAR ( 500 ),
	related_rack VARCHAR ( 500 ),
	related_rackposition VARCHAR ( 500 ),
	rack_unit_serial VARCHAR ( 500 ),
	business_status VARCHAR ( 500 ),
	province_id VARCHAR ( 500 ),
	city_id VARCHAR ( 500 ),
	county_id VARCHAR ( 500 ),
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
create index if not exists idx_RM_AREA_UPOS2intId on RM_AREA_UPOS(int_id);

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
	        sum(amount),sum(errorAmount),coalesce(sum(it.indexValue)/v_idxAmount,0),'db','db'
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
	        sum(amount),sum(errorAmount),coalesce(sum(it.indexValue)/v_idxAmount,0),'db','db'
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
	        sum(amount),sum(errorAmount),coalesce(sum(it.indexValue)/v_idxAmount,0),'db','db'
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
 
 CREATE OR REPLACE FUNCTION "public"."proc_checkonecoordinateindex"("p_provincecode" varchar, "p_taskcode" varchar, "p_indexid" int4)returns void as
$$
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
 $$ language plpgsql
 COST 100;
  ---管线
 CREATE OR REPLACE FUNCTION "public"."proc_gx_checkoneintegralityindex"("p_provincecode" varchar, "p_taskcode" varchar, "p_indexid" int4)returns void as
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
    where attr.columnname in ('PROVINCE','CITY','COUNTY')
      and attr.entitytype_id=me.id
      and me.extensiontable=upper(v_extensiontable);
      
   if v_countRegionCode =3 then
      v_selectSql := 'select '''||p_provinceCode||''',city,county,count(1) amount,coalesce(sum(0';
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
      v_selectSql := v_selectSql||'),0) errorAmount from '||v_extensiontable||' group by city,county';
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
 $$ language plpgsql
 COST 100;
  
 --管线字典值存储过程
create or replace function proc_gx_checkonedictaccuracyindex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer)returns void as
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
	 perform proc_gx_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexid,v_tableName);
end;
$$ LANGUAGE plpgsql;
  
--管线动态sql指标
create or replace function proc_gx_checkOneDynamicSqlIndex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
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
   perform proc_gx_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,v_extensiontable);
end;
$$ language plpgsql;  
  
CREATE OR REPLACE FUNCTION proc_gx_checkoneintegralityindex(p_provincecode varchar, p_taskcode varchar, p_indexid integer)
returns void as $$
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
    where attr.columnname in ('PROVINCE','CITY','COUNTY')
      and attr.entitytype_id=me.id
      and me.extensiontable=upper(v_extensiontable);

   if v_countRegionCode =3 then
      v_selectSql := 'select '''||p_provinceCode||''',city,county,count(1) amount,coalesce(sum(0';
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
      v_selectSql := v_selectSql||'),0) errorAmount from '||v_extensiontable||' group by city,county';
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

 --管线字典值存储过程
create or replace function proc_gx_checkonedictaccuracyindex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer)returns void as
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
	 perform proc_gx_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexid,v_tableName);
end;
$$ LANGUAGE plpgsql;

--管线动态sql指标
create or replace function proc_gx_checkOneDynamicSqlIndex(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
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
   perform proc_gx_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,v_extensiontable);
end;
$$ language plpgsql;

 --管线统计存过
 CREATE OR REPLACE FUNCTION proc_gx_generatecommonindexvalue(p_provincecode varchar, p_taskcode varchar, p_indexid integer, p_tablename varchar, p_condition varchar=NULL::character varying)  returns void as
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
    where attr.columnname in ('PROVINCE','CITY','COUNTY')
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
		 v_selectSql := 'select '''||p_provinceCode||''',city,county,
		                        count(1) amount,
		                        coalesce(sum(case when dims_col_result like ''%'||v_idxCode||'%'' then 1 else 0 end),0) errorCount
		                  from '||v_tabWhereSql||'
		                 group by city,county';
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

CREATE OR REPLACE FUNCTION proc_checkonedictaccuracyindex_DIMS_CZ_02044(p_provincecode varchar, p_taskcode varchar, p_indexid integer)
 returns void as $$
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

      v_sql := 'update '||v_tableName||' c
		            set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
		                                      when dims_col_result is null then '''||v_idxCode||'''
		                                      else dims_col_result||'','||v_idxCode||''' end),
										dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
		                                      when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
		                                      else dims_col_rtName||'','||v_idxName||''' end)
		                                      where isNotNull('||v_columnName||') and not exists ( select 1 from dims_mm_dictionary dict
							                  where c.type_identifier = ''网络地址'' and ''网络设备地址、自有业务地址、其他''~ c.'||v_columnName||') and
		                                      not exists ( select 1 from dims_mm_dictionary dict where c.type_identifier = ''用户地址'' and ''家宽（上网、固话、机顶盒）、手机上网、volte、集客专线、wlan、IDC、物联网、其他'' ~ c.'||v_columnName||' ) 
		                                     and not exists ( select 1 from dims_mm_dictionary dict where c.type_identifier != ''用户地址'' and  c.type_identifier != ''网络地址''   and ''网络设备地址、自有业务地址、家宽（上网、固话、机顶盒）、手机上网、volte、集客专线、wlan、IDC、物联网、其他'' ~ c.'||v_columnName||' )';
	
   execute v_sql;
	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexid,v_tableName);
end;
$$ language plpgsql;
create or replace function   is_valid_ipaddress(ip varchar) returns bool as
$$
declare
begin
    return ip is not null and ip ~ '^\s*(((([0-9A-Fa-f]{1,4}:){7}(([0-9A-Fa-f]{1,4})|:))|(([0-9A-Fa-f]{1,4}:){6}(:|((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})|(:[0-9A-Fa-f]{1,4})))|(([0-9A-Fa-f]{1,4}:){5}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){4}(:[0-9A-Fa-f]{1,4}){0,1}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){3}(:[0-9A-Fa-f]{1,4}){0,2}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){2}(:[0-9A-Fa-f]{1,4}){0,3}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:)(:[0-9A-Fa-f]{1,4}){0,4}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(:(:[0-9A-Fa-f]{1,4}){0,5}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})))\;?\s*)*(/(?:[1-9]|[12][0-9]|3[012]))?$';
end;
$$ language plpgsql STABLE COST 100;
CREATE OR REPLACE FUNCTION "public"."is_not_valid_ipaddress_mul"("ip" varchar)
  RETURNS "pg_catalog"."bool" AS $BODY$
declare
		 v_ip  varchar[];
begin

v_ip := string_to_array(ip,',');
	 for i in 1..array_length(v_ip,1)
			 loop
				if v_ip[i] !~ '^\s*(((([0-9A-Fa-f]{1,4}:){7}(([0-9A-Fa-f]{1,4})|:))|(([0-9A-Fa-f]{1,4}:){6}(:|((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})|(:[0-9A-Fa-f]{1,4})))|(([0-9A-Fa-f]{1,4}:){5}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){4}(:[0-9A-Fa-f]{1,4}){0,1}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){3}(:[0-9A-Fa-f]{1,4}){0,2}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){2}(:[0-9A-Fa-f]{1,4}){0,3}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:)(:[0-9A-Fa-f]{1,4}){0,4}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(:(:[0-9A-Fa-f]{1,4}){0,5}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})))\;?\s*)*(/(?:[1-9]|[12][0-9]|3[012]))?$'l then
        return true;
			  end if;
			 end loop;
return false;
end;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;