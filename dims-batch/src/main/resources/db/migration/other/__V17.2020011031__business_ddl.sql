drop table if exists CORE_CS_BOARD;
drop table if exists CORE_CS_IP_SIGNAL;
drop table if exists CORE_CS_IP_TRAFFIC;
drop table if exists CORE_CS_LINK;
drop table if exists CORE_CS_MGW;
drop table if exists CORE_CS_MSC_POOL;
drop table if exists CORE_CS_MSS;
drop table if exists CORE_CS_OTHER;
drop table if exists CORE_CS_PORT;
drop table if exists CORE_CS_RELAY;
drop table if exists CORE_CS_STP;
drop table if exists CORE_IMS_BOARD;
drop table if exists CORE_IMS_CG;
drop table if exists CORE_IMS_CTXAS_PUB_RES;
drop table if exists CORE_IMS_CTXAS_SCP_BUS_RES;
drop table if exists CORE_IMS_CTXAS_SCP_MAINTAIN;
drop table if exists CORE_IMS_CTXAS_SCP_PORT;
drop table if exists CORE_IMS_CTXAS_SCP_SIGNAL_LINK;
drop table if exists CORE_IMS_DEVICE_DNS_ENUM;
drop table if exists CORE_IMS_DEVICE_IM_MGW;
drop table if exists CORE_IMS_DEVICE_ISBG;
drop table if exists CORE_IMS_DEVICE_MGCF;
drop table if exists CORE_IMS_DOMAIN;
drop table if exists CORE_IMS_HSS;
drop table if exists CORE_IMS_LINK;
drop table if exists CORE_IMS_LOGIC_BGCF;
drop table if exists CORE_IMS_LOGIC_ICSCF;
drop table if exists CORE_IMS_LOGIC_MRFC;
drop table if exists CORE_IMS_LOGIC_MRFP;
drop table if exists CORE_IMS_LOGIC_SCSCF;
drop table if exists CORE_IMS_MMTAS;
drop table if exists CORE_IMS_PCSCF;
drop table if exists CORE_IMS_PORT;
drop table if exists CORE_IMS_SBC;
drop table if exists CORE_IMS_SCP_BIZ_UNIT;
drop table if exists CORE_IMS_SCP_BOARD;
drop table if exists CORE_IMS_SCP_SIGNAL_UNIT;
drop table if exists CORE_IN_BOARD;
drop table if exists CORE_IN_COMMON_NE;
drop table if exists CORE_IN_MAINTAIN;
drop table if exists CORE_IN_NET_DEV;
drop table if exists CORE_IN_PORT;
drop table if exists CORE_IN_RELAY;
drop table if exists CORE_IN_SERVICE_RES;
drop table if exists CORE_IN_SERVICE_UNIT;
drop table if exists CORE_IN_SIGNAL_LINK;
drop table if exists CORE_IN_SIGNAL_UNIT;
drop table if exists CORE_LTE_CENTRALIZED_HSS;
drop table if exists CORE_LTE_DISTRIBUTED_HSS;
drop table if exists CORE_LTE_HLRFE;
drop table if exists CORE_LTE_HSSBE;
drop table if exists CORE_LTE_HSSFE;
drop table if exists CORE_LTE_PG;
drop table if exists CORE_PD_APN;
drop table if exists CORE_PD_BOARD;
drop table if exists CORE_PD_CE;
drop table if exists CORE_PD_CG;
drop table if exists CORE_PD_DNS;
drop table if exists CORE_PD_DRA;
drop table if exists CORE_PD_FW;
drop table if exists CORE_PD_GGSN;
drop table if exists CORE_PD_IPADDRESS;
drop table if exists CORE_PD_LINK;
drop table if exists CORE_PD_MME;
drop table if exists CORE_PD_PCRF;
drop table if exists CORE_PD_PCRFBE;
drop table if exists CORE_PD_PGW;
drop table if exists CORE_PD_POOL;
drop table if exists CORE_PD_PORT;
drop table if exists CORE_PD_SAEGW;
drop table if exists CORE_PD_SGSN;
drop table if exists CORE_PD_SGW;
drop table if exists CORE_PD_SW;
drop table if exists CORE_PD_VLAN;
drop table if exists CORE_SMS_MSSBASEINFO;
drop table if exists CORE_SMS_MSSSYS;
drop table if exists CORE_SMS_SMSBASEINFO;
drop table if exists CORE_SMS_SMSGWBASEINFO;
drop table if exists CORE_SMS_SMSGWSYS;
drop table if exists CORE_SMS_SMSSYS;
drop table if exists CORE_VOLTE_ACTF;
drop table if exists CORE_VOLTE_AP;
drop table if exists CORE_VOLTE_ATGW;
drop table if exists CORE_VOLTE_BCF;
drop table if exists CORE_VOLTE_BGCF;
drop table if exists CORE_VOLTE_BGW;
drop table if exists CORE_VOLTE_BOARD;
drop table if exists CORE_VOLTE_DNS_ENUM;
drop table if exists CORE_VOLTE_DOMAIN;
drop table if exists CORE_VOLTE_ICSCF;
drop table if exists CORE_VOLTE_IMMGW;
drop table if exists CORE_VOLTE_ISBG;
drop table if exists CORE_VOLTE_LINK;
drop table if exists CORE_VOLTE_MGCF;
drop table if exists CORE_VOLTE_MRFC;
drop table if exists CORE_VOLTE_MRFP;
drop table if exists CORE_VOLTE_POOL;
drop table if exists CORE_VOLTE_PORT;
drop table if exists CORE_VOLTE_PSBC;
drop table if exists CORE_VOLTE_SCCAS;
drop table if exists CORE_VOLTE_SCSCF;
drop table if exists CORE_VOLTE_VOLTETAS;
drop table if exists CORE_VOLTE_VOLTE_AS;
drop table if exists PE_AIRCONDITIONER;
drop table if exists PE_BATTERY;
drop table if exists PE_ENERGYSAVING;
drop table if exists PE_GENERATORSETS;
drop table if exists PE_HV_DCDIST;
drop table if exists PE_HV_DCPOWER;
drop table if exists PE_HV_DCSYS;
drop table if exists PE_HV_DISTDEVICE;
drop table if exists PE_HV_DISTSYS;
drop table if exists PE_INTELMETER;
drop table if exists PE_LV_ACDIST;
drop table if exists PE_LV_DCDIST;
drop table if exists PE_LV_DISTSYS;
drop table if exists PE_MONITOR;
drop table if exists PE_NONMAINEQU;
drop table if exists PE_POINT;
drop table if exists PE_POWERSYS;
drop table if exists PE_ROOM;
drop table if exists PE_SHUNT_INNER;
drop table if exists PE_SHUNT_OUTER;
drop table if exists PE_SWITCHPOWER;
drop table if exists PE_SWITCHPOWERSYS;
drop table if exists PE_TRANSFORMER;
drop table if exists PE_TRANSFORMER_DEVICE;
drop table if exists PE_UPSDEVICE;
drop table if exists PE_UPSSYS;
drop table if exists WL_AAU;
drop table if exists WL_ANTENNA;
drop table if exists WL_ANTENNA_PARAMETER;
drop table if exists WL_AP;
drop table if exists WL_AU;
drop table if exists WL_BASESTATION;
drop table if exists WL_BBU;
drop table if exists WL_CARD;
drop table if exists WL_CELL;
drop table if exists WL_CONTROLLER;
drop table if exists WL_CU;
drop table if exists WL_DISTRIBUTOR;
drop table if exists WL_DU;
drop table if exists WL_PORT;
drop table if exists WL_REPEATER;
drop table if exists WL_RRU;
drop table if exists WL_SWITCH;
drop table if exists WL_TOWER;
drop table if exists RM_AREA_DATACENTER;
drop table if exists RM_AREA_RACKPOS;
drop table if exists RM_AREA_RACKUNIT;
drop table if exists RM_AREA_RESPOINT;
drop table if exists RM_AREA_ROOM;
drop table if exists RM_AREA_SITE;
drop table if exists DN_BOARD;
drop table if exists DN_BUSINESS_IP_BEAR_NET;
drop table if exists DN_DEVICE;
drop table if exists DN_IPV4_ADDR;
drop table if exists DN_IPV4_ADDR_SEG;
drop table if exists DN_IPV6_ADDR;
drop table if exists DN_IPV6_ADDR_SEG;
drop table if exists DN_LOGICAL_LINK;
drop table if exists DN_LOGICAL_PORT;
drop table if exists DN_PHYSICAL_LINK;
drop table if exists DN_PHYSICAL_PORT;
drop table if exists DN_VLAN;
drop table if exists EB_CUSTOMER;
drop table if exists EB_DEVICE;
drop table if exists EB_PRODUCT;
drop table if exists EB_PRODUCT_APN;
drop table if exists EB_PRODUCT_CMNET;
drop table if exists EB_PRODUCT_DATA;
drop table if exists EB_PRODUCT_MMS;
drop table if exists EB_PRODUCT_SMS;
drop table if exists EB_PRODUCT_VOICE;
drop table if exists FB_CUSTOMER;
drop table if exists FB_INTERGRATED_BOX;
drop table if exists FB_ONU;
drop table if exists FB_ONU_PORT;
drop table if exists FB_PRODUCT_DATA;
drop table if exists FB_PRODUCT_IMS;
drop table if exists FB_PRODUCT_IPTV;
drop table if exists FB_SEP_FIBER_BOX;
drop table if exists FB_SEP_FIBER_BOX_CONNECTOR;
drop table if exists FB_SPLITTER;
drop table if exists FB_SPLITTER_PORT;


create table CORE_PD_MME(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DOMAIN varchar(500),MME_NRI varchar(500),NA0_SIGNALING_POINT_CODE varchar(500),NA1_SIGNALING_POINT_CODE varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),GN_FTP_IP varchar(500),S1_MME_FTP_IP varchar(500),S11_MME_FTP_IP varchar(500),S6A_FTP_IP varchar(500),SGS_FTP_IP varchar(500),SV_FTP_IP varchar(500),GB_FTP_IP varchar(500),IU_PS_FTP_IP varchar(500),DRA_HOST_DOMAIN_NAME varchar(500),GT_ADDRESS varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),RELATED_MME_POOL varchar(500),HARDWARE_VERSION varchar(500),LOCAL_SIGNALING_POINT_CODE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_SAEGW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DOMAIN varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),S1U_FTP_IP varchar(500),S5_FTP_IP varchar(500),S8_FTP_IP varchar(500),S11_FTP_IP varchar(500),SGI_FTP_IP varchar(500),GA_FTP_IP varchar(500),GX_FTP_IP varchar(500),GN_FTP_IP varchar(500),GY_FTP_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),HARDWARE_VERSION varchar(500),RELATED_MME_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_SGW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DOMAIN varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),S1U_FTP_IP varchar(500),S4_FTP_IP varchar(500),S5_FTP_IP varchar(500),S8_FTP_IP varchar(500),S11_FTP_IP varchar(500),GA_FTP_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_PGW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DOMAIN varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),S5_FTP_IP varchar(500),S8_FTP_IP varchar(500),SGI_FTP_IP varchar(500),GA_FTP_IP varchar(500),GX_FTP_IP varchar(500),GN_FTP_IP varchar(500),GY_FTP_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_PCRF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DOMAIN varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),GX_FTP_IP varchar(500),RX_FTP_IP varchar(500),RELATED_BOSS_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),HARDWARE_VERSION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_PCRFBE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),RELATED_BOSS_IP varchar(500),RELATED_PCRF_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_CG(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),HARDWARE_SERIAL_NUMBER varchar(500),INTEGRATE_VENDOR varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),GA_IP varchar(500),RELATED_BOSS_IP varchar(500),RELATED_SGW_GA_IP varchar(500),RELATED_PGW_GA_IP varchar(500),RELATED_SAE_GW_GA_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),HARDWARE_VERSION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_DNS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),HARDWARE_SERIAL_NUMBER varchar(500),INTEGRATE_VENDOR varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),DNS_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),HARDWARE_VERSION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_DRA(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),DOMAIN varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),HARDWARE_TYPE varchar(500),PROVINCES_BEARING varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),S6A_FTP_IP varchar(500),S9_FTP_IP varchar(500),GX_FTP_IP varchar(500),RX_FTP_IP varchar(500),CX_FTP_IP varchar(500),SH_FTP_IP varchar(500),SYNCHRONIZATION_LINK_IP varchar(500),GROUP_DRA_HOST_NAME varchar(500),OTHER_DRA_HOST_NAME varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),DEVICE_NETWORK_LEVEL varchar(500),S6A_RELATED_CE varchar(500),S9_RELATED_CE varchar(500),GX_RELATED_CE varchar(500),RX_RELATED_CE varchar(500),CX_RELATED_CE varchar(500),SH_RELATED_CE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_FW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),HARDWARE_SERIAL_NUMBER varchar(500),INTEGRATE_VENDOR varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),FW_CMNET_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),HARDWARE_VERSION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_SW(RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),HARDWARE_SERIAL_NUMBER varchar(500),INTEGRATE_VENDOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_CE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),HARDWARE_SERIAL_NUMBER varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_SGSN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),NA0_SIGNALING_POINT_CODE varchar(500),NA1_SIGNALING_POINT_CODE varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),GB_IP varchar(500),IU_PS_IP varchar(500),GN_IP varchar(500),GA_IP varchar(500),GT_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),RELATED_SGSN_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_GGSN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),GN_IP varchar(500),GI_IP varchar(500),GA_IP varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_POOL(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),POOL_NAME varchar(500),POOL_TYPE varchar(500),INCLUDE_DEVICE_NAME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_IPADDRESS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),IP_ADDRESS varchar(500),IP_SUBNET varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_VLAN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),VLAN_ID varchar(500),VLAN_DESCRIBE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_BOARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),POSITION varchar(500),BOARD_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PORT_NAME varchar(500),PORT_STATUS varchar(500),PORT_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),AEND_DEVICE_TYPE varchar(500),RELATED_AEND_DEVICE varchar(500),RELATED_AEND_PORT varchar(500),AEND_DDF varchar(500),CIRCUIT_NAME varchar(500),ZEND_DEVICE_TYPE varchar(500),RELATED_ZEND_DEVICE varchar(500),RELATED_ZEND_PORT varchar(500),ZEND_DDF varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_PD_APN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),APN_NAME varchar(500),LOCAL_TUNNEL_ADDRESS varchar(500),OPPOSITE_TUNNEL_ADDRESS varchar(500),TUNNEL_TYPE varchar(500),BUSINESS_RANGE varchar(500),ADDRESS_TYPE varchar(500),STATIC_ADDRESS_POOL varchar(500),STATIC_ADDRESS_NUM varchar(500),DYNAMIC_ADDRESS_POOL varchar(500),DYNAMIC_ADDRESS_NUM varchar(500),APN_EXPLAIN varchar(500),RELATED_SAE_GW_PGW_GGSN varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_DOMAIN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DOMAIN_NAME varchar(500),TRUST_DOMAIN varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_BOARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PHYSICAL_POSITION varchar(500),BOARD_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PHYSICAL_POSITION varchar(500),ODF_DDF_TERMINAL varchar(500),PORT_STATUS varchar(500),PORT_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_DEVICE_ISBG(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_PCSCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_CORE_SIGNAL_IP varchar(500),IMS_JOIN_SIGNAL_IP varchar(500),CAPACITY varchar(500),RELATED_OMC varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_LOGIC_SCSCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),IMS_SIGNAL_IP varchar(500),CAPACITY varchar(500),RELATED_ISBG varchar(500),RELATED_S_CSCF_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_LOGIC_ICSCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_ISBG varchar(500),RELATED_I_CSCF_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_LOGIC_BGCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_ISBG varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_CG(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),CHARGING_IP varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),QUALITOR varchar(500),RELATED_PHYSICAL_DEVICE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_HSS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),TRAFFIC_IP varchar(500),STATIC_USER_NUMBERS varchar(500),IS_MAIN varchar(500),RELATED_OMC varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_SBC(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_CORE_SIGNAL_IP varchar(500),IMS_JOIN_SIGNAL_IP varchar(500),IMS_CORE_MEDIA_IP varchar(500),IMS_JOIN_MEDIA_IP varchar(500),CAPACITY varchar(500),RELATED_OMC varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_DEVICE_MGCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),SIGNAL_CODE varchar(500),NET_MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),CS_SIGNAL_IP varchar(500),CHARGING_IP varchar(500),TRAFFIC varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_DEVICE_IM_MGW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),NET_MANAGE_IP varchar(500),CS_SIGNAL_IP varchar(500),IMS_MEDIA_IP varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_LOGIC_MRFC(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),RELATED_VOLTE_AS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_LOGIC_MRFP(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACK varchar(500),MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),IMS_MEIDIA_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),RELATED_VOLTE_AS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_MMTAS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),CHARGING_IP varchar(500),TRAFFIC_IP varchar(500),CAPACITY varchar(500),IS_MAIN varchar(500),RELATED_OMC varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_DEVICE_DNS_ENUM(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),NET_MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),TRAFFIC_IP varchar(500),RELATED_OMC varchar(500),IS_BACKUP varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CIRCUIT_NAME varchar(500),RELATED_AEND_ROOM varchar(500),AEND_DEVICE_TYPE varchar(500),RELATED_AEND_DEVICE varchar(500),RELATED_AEND_PORT varchar(500),RELATED_ZEND_ROOM varchar(500),ZEND_DEVICE_TYPE varchar(500),ZEND_DEVICE_NAME varchar(500),RELATED_ZEND_PORT varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_CTXAS_PUB_RES(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),SYS_INTEGRATOR varchar(500),NE_ID varchar(500),NE_GT varchar(500),SIGNAL_CODE varchar(500),RELATED_RACKPOS varchar(500),RELATED_SMP varchar(500),SYS_DESIGN_CAPS varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),SYS_PLAT_VERSION varchar(500),SYS_DB_VERSION varchar(500),QUALITOR varchar(500),NE_TYPE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_SCP_BIZ_UNIT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),OPERATING_SYSTEM varchar(500),CPU varchar(500),MEMORY varchar(500),HARD_DISK varchar(500),RELATED_RACKPOS varchar(500),BUSINESS_IP_ADDRESS varchar(500),SOFTWARE_VERSION varchar(500),DEVICE_WORK_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_SCP_SIGNAL_UNIT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),BUSINESS_IP_ADDRESS varchar(500),SOFTWARE_VERSION varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_CTXAS_SCP_BUS_RES(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),BUSINESS_NAME varchar(500),BUSINESS_DESIGN_LICENSE varchar(500),BUSINESS_BUSY_CAPS varchar(500),BUSINESS_KEY varchar(500),COVER_REGION varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_CTXAS_SCP_MAINTAIN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),HARDWARE_MAINTAIN_VENDER varchar(500),SOFTWARE_MAINTAIN_VENDER varchar(500),DATABASE_MAINTAIN_VENDER varchar(500),HARDWARE_MAINTAIN_LEVEL varchar(500),SOFTWARE_MAINTAIN_LEVEL varchar(500),DATABASE_MAINTAIN_LEVEL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_SCP_BOARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),BOARD_NAME varchar(500),PHYSICAL_POSITION varchar(500),BOARD_TYPE varchar(500),RELATED_SIGNAL_DEAL_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_CTXAS_SCP_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PHYSICAL_POSITION varchar(500),PORT_NO varchar(500),OPPOSITE_OFC varchar(500),ODF_DDF_POSITION varchar(500),PORT_STATUS varchar(500),PORT_TYPE varchar(500),PORT_USAGE varchar(500),RELATED_SIGNAL_DEAL_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IMS_CTXAS_SCP_SIGNAL_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),AEND_NE varchar(500),ZEND_NE varchar(500),SLC_NO varchar(500),LOCAL_LOGIC_PORT_NO varchar(500),CIRCUIT_NAME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_LTE_CENTRALIZED_HSS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),DOMAIN varchar(500),HSS_ID varchar(500),LOCAL_SIGNAL_CODE varchar(500),VENDOR varchar(500),HARDWARE_PLATFORM varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),S6A_S6D_IP varchar(500),AUC_TOTAL_CY varchar(500),STATIC_USER_TOTAL_CY varchar(500),AUC_TOTAL_CY_4G varchar(500),STATIC_USER_TOTAL_CY_4G varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),IS_MAIN varchar(500),COVER_REGION varchar(500),RELATED_DRA varchar(500),RELATED_CE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_LTE_DISTRIBUTED_HSS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_LTE_HSSBE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HARDWARE_PLATFORM varchar(500),RELATED_RACKPOS varchar(500),AUC_TOTAL_CY varchar(500),STATIC_USER_TOTAL_CY varchar(500),AUC_TOTAL_CY_4G varchar(500),STATIC_USER_TOTAL_CY_4G varchar(500),MANAGE_IP varchar(500),IS_MAIN varchar(500),RELATED_HSS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_LTE_HSSFE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),DOMAIN varchar(500),HSS_ID varchar(500),LOCAL_SIGNAL_CODE varchar(500),HARDWARE_PLATFORM varchar(500),RELATED_RACKPOS varchar(500),S6A_S6D_IP varchar(500),MANAGE_IP varchar(500),BEAR_CY varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),IS_MAIN varchar(500),COVER_REGION varchar(500),RELATED_DRA varchar(500),RELATED_CE varchar(500),RELATED_HSS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_LTE_PG(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HARDWARE_PLATFORM varchar(500),RELATED_RACKPOS varchar(500),BOSS_IP varchar(500),STATIC_USER_TOTAL_CY varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),IS_MAIN varchar(500),SWITCH_NAME varchar(500),RELATED_HSS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_LTE_HLRFE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),LOCAL_SIGNAL_CODE varchar(500),VENDOR varchar(500),HARDWARE_PLATFORM varchar(500),HLRID varchar(500),RELATED_RACKPOS varchar(500),LIFECYCLE_STATUS varchar(500),MANAGE_IP varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_DOMAIN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DOMAIN_NAME varchar(500),TRUST_DOMAIN varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_BOARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PHYSICAL_POSITION varchar(500),BOARD_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PHYSICAL_POSITION varchar(500),ODF_DDF_TERMINAL varchar(500),PORT_STATUS varchar(500),PORT_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_VOLTE_AS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),RELATED_OMC varchar(500),CAPACITY varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_VOLTETAS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),CHARGING_IP varchar(500),IMS_SIGNAL_IP varchar(500),TRAFFIC_IP varchar(500),DOMAIN_NAME varchar(500),RELATED_VOLTE_AS varchar(500),RELATED_CG varchar(500),RELATED_AS_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_SCCAS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),IMS_SIGNAL_IP varchar(500),CS_SIGNAL_IP varchar(500),GT_CODE varchar(500),SIGNAL_CODE varchar(500),DOMAIN_NAME varchar(500),RELATED_VOLTE_AS varchar(500),RELATED_AS_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_MRFC(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),RELATED_VOLTE_AS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_AP(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),IMS_SIGNAL_IP varchar(500),MANAGE_IP varchar(500),DOMAIN_NAME varchar(500),RELATED_VOLTE_AS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_MRFP(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACK varchar(500),MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),IMS_MEIDIA_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),RELATED_VOLTE_AS varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_PSBC(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),RX_IP varchar(500),IMS_SIGNAL_IP varchar(500),IMS_MEDIA_IP varchar(500),SGI_IP varchar(500),CAPACITY varchar(500),RELATED_OMC varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_ACTF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),STN_SR varchar(500),IMS_SIGNAL_IP varchar(500),DOMAIN_NAME varchar(500),RELATED_PSBC varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_ATGW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),IMS_MEDIA_IP varchar(500),RELATED_PSBC varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_BCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),RX_SIGNAL_IP varchar(500),IMS_SIGNAL_IP varchar(500),SGI_IP varchar(500),CAPACITY varchar(500),RELATED_OMC varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_BGW(DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),IMS_MEDIA_IP varchar(500),RELATED_OMC varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_ISBG(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_SCSCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),IMS_SIGNAL_IP varchar(500),CAPACITY varchar(500),RELATED_ISBG varchar(500),RELATED_S_CSCF_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_ICSCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_ISBG varchar(500),RELATED_I_CSCF_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_BGCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_ISBG varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_MGCF(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOST_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),SIGNAL_CODE varchar(500),NET_MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),CS_SIGNAL_IP varchar(500),CHARGING_IP varchar(500),TRAFFIC varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),DOMAIN_NAME varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_IMMGW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),NET_MANAGE_IP varchar(500),CS_SIGNAL_IP varchar(500),IMS_MEDIA_IP varchar(500),IMS_SIGNAL_IP varchar(500),RELATED_OMC varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_DNS_ENUM(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),NET_MANAGE_IP varchar(500),IMS_SIGNAL_IP varchar(500),TRAFFIC_IP varchar(500),RELATED_OMC varchar(500),IS_BACKUP varchar(500),SUPPORT_NET_TYPE varchar(500),SETUP_TIME varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_POOL(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),POOL_NAME varchar(500),POOL_TYPE varchar(500),CONTAINS_DEVICE_NAME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_VOLTE_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_AEND_ROOM varchar(500),AEND_DEVICE_TYPE varchar(500),RELATED_AEND_DEVICE varchar(500),RELATED_AEND_PORT varchar(500),RELATED_ZEND_ROOM varchar(500),ZEND_DEVICE_TYPE varchar(500),ZEND_DEVICE_NAME varchar(500),RELATED_ZEND_PORT varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_MSS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOME_SIGNAL_CODE varchar(500),VENDOR varchar(500),HARDWAREPLAT varchar(500),MSC_ID varchar(500),BHCA varchar(500),MSCERL varchar(500),RELATED_RACKPOS varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),MSCSERVER_USE varchar(500),COVER_REGION varchar(500),RELATED_MSC_POOL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_MGW(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOME_SIGNAL_CODE varchar(500),VENDOR varchar(500),HARDWAREPLAT varchar(500),RELATED_RACKPOS varchar(500),SW_ID varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),MGW_USE varchar(500),COVER_REGION varchar(500),RELATED_MSC_POOL varchar(500),RELATED_MSS varchar(500),OPPOSITE_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_STP(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),HOME_SIGNAL_CODE varchar(500),VENDOR varchar(500),HARDWARE_PLATFORM varchar(500),GT_TRANS varchar(500),RELATED_RACKPOS varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),STP_USE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_OTHER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),OPERATOR varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_BOARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),BOARD_TYPE varchar(500),PHYSICAL_POSITION varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PORT_NO varchar(500),PORT_TYPE varchar(500),PHYSICAL_POSITION varchar(500),PORT_STATUS varchar(500),RELATED_NE varchar(500),ODF_DDF varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),AEND_NE varchar(500),ZEND_NE varchar(500),LINK_NAME varchar(500),LOCAL_LINK_GROUP_NAME varchar(500),TIME_SLOT varchar(500),SLC_NO varchar(500),LOCAL_SIGNAL_PORT_NO varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_RELAY(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),LOCAL_NE varchar(500),LOCAL_PORT_NO varchar(500),OPPOSITE_NE varchar(500),SYSTEM_NO varchar(500),LOCAL_RELAY_GROUP_NAME varchar(500),QUALITOR varchar(500),CIRCUIT_NAME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_IP_TRAFFIC(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),MGW_NAME varchar(500),LOCAL_IP varchar(500),QUALITOR varchar(500),PORT_NO varchar(500),RELATED_CE_NAME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_IP_SIGNAL(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),LOCAL_IP varchar(500),RELATED_CE_NAME varchar(500),QUALITOR varchar(500),PORT_NO varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_CS_MSC_POOL(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),MSC_POOL_NAME varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_SMS_MSSSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),MSS_CENTER_ID varchar(500),BUSINESS_SYS_NAME varchar(500),SYS_INTEGRATOR varchar(500),MAX_CAPACITY varchar(500),SMS_CENTER_ID varchar(500),SMS_GATEWAY_ID varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_SMS_MSSBASEINFO(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),MMS_CENTER_ID varchar(500),BEAR_BUSINESS_TYPE varchar(500),DEVICE_IP varchar(500),VENDER varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),PS_CABINET_POSITION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_SMS_SMSGWSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),SMS_GATEWAY_ID varchar(500),BUSINESS_SYS_NAME varchar(500),SYS_INTEGRATOR varchar(500),MAX_CAPACITY varchar(500),INTERNET_IP varchar(500),INTRANET_IP varchar(500),SMS_CENTER_ID varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),SYS_BEAR_BUSINESS varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_SMS_SMSGWBASEINFO(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),SMS_GATEWAY_ID varchar(500),BEAR_BUSINESS_TYPE varchar(500),DEVICE_IP varchar(500),VENDER varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),PS_CABINET_POSITION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_SMS_SMSSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),SMS_CENTER_NO varchar(500),SMS_CENTER_ID varchar(500),BUSINESS_SYS_NAME varchar(500),SYS_INTEGRATOR varchar(500),MAX_CAPACITY varchar(500),SIGNALLING_CODE varchar(500),SMS_GATEWAY_ID varchar(500),MMS_CENTER_ID varchar(500),LIFECYCLE_STATUS varchar(500),SOFTWARE_VERSION varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),SYS_BEAR_BUSINESS varchar(500),COVER_REGION varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_SMS_SMSBASEINFO(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),SMS_CENTER_ID varchar(500),BEAR_BUSINESS_TYPE varchar(500),DEVICE_IP varchar(500),VENDER varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),PS_CABINET_POSITION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_COMMON_NE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),NE_NAME varchar(500),NE_ID varchar(500),NE_GT varchar(500),SIGNAL_CODE varchar(500),SYS_INTEGRATOR varchar(500),RELATED_ROOM varchar(500),RELATED_RACKPOS varchar(500),RELATED_SMP varchar(500),SYS_DESIGN_CAPS varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),SYS_PLAT_VERSION varchar(500),SYS_DB_VERSION varchar(500),QUALITOR varchar(500),NE_TYPE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_SERVICE_UNIT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),CPU varchar(500),MEMORY varchar(500),HARD_DISK varchar(500),OPERATING_SYSTEM varchar(500),RELATED_ROOM varchar(500),RELATED_RACKPOS varchar(500),BUSINESS_IP_ADDRESS varchar(500),SOFTWARE_VERSION varchar(500),DEVICE_WORK_TYPE varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_SIGNAL_UNIT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_ROOM varchar(500),RELATED_RACKPOS varchar(500),BUSINESS_IP_ADDRESS varchar(500),SOFTWARE_VERSION varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_NET_DEV(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),DEVICE_TYPE varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_ROOM varchar(500),RELATED_RACKPOS varchar(500),MANAGE_IP varchar(500),SOFTWARE_VERSION varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_SERVICE_RES(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),BUSINESS_NAME varchar(500),BUSINESS_DESIGN_LICENSE varchar(500),BUSINESS_BUSY_CAPS varchar(500),BUSINESS_KEY varchar(500),COVER_REGION varchar(500),RELATED_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_MAINTAIN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),HARDWARE_MAINTAIN_VENDER varchar(500),SOFTWARE_MAINTAIN_VENDER varchar(500),DATABASE_MAINTAIN_VENDER varchar(500),HARDWARE_MAINTAIN_LEVEL varchar(500),SOFTWARE_MAINTAIN_LEVEL varchar(500),DATABASE_MAINTAIN_LEVEL varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_BOARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),BOARD_NAME varchar(500),PHYSICAL_POSITION varchar(500),BOARD_TYPE varchar(500),RELATED_SIGNAL_DEAL_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PORT_NO varchar(500),PHYSICAL_POSITION varchar(500),OPPOSITE_OFC varchar(500),ODF_DDF_POSITION varchar(500),PORT_STATUS varchar(500),PORT_TYPE varchar(500),PORT_USAGE varchar(500),RELATED_SIGNAL_DEAL_NE varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_SIGNAL_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),AEND_NE varchar(500),ZEND_NE varchar(500),SLC_NO varchar(500),LOCAL_LOGIC_PORT_NO varchar(500),CIRCUIT_NAME varchar(500),dims_col_result text,dims_col_rtName text);
create table CORE_IN_RELAY(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),PORT_NAME varchar(500),RELAY_GROUP_NAME varchar(500),RELATED_CITY varchar(500),CIRCUIT_NO varchar(500),IS_MAIN varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_POINT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),POINT_NAME varchar(500),SITE_LEVEL varchar(500),BACKUP_METHOD varchar(500),IS_FROM_DIFFER_TRANS_SITE varchar(500),ES_VOLTAGE_LEVEL varchar(500),ES_NATURE varchar(500),PE_MONITOR_SITE_NAME varchar(500),PE_MONITOR_SITE_CODE varchar(500),ES_SUM_WAYS varchar(500),ES_CAPACITY varchar(500),ES_OIL_MACHINE_LEVEL varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_ROOM(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_ROOM varchar(500),ROOM_NAME varchar(500),PE_ROOM_TYPE varchar(500),PE_MONITOR_ROOM_NAME varchar(500),PE_MONITOR_ROOM_CODE varchar(500),PE_MONITOR_RELATED_SITE varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_TRANSFORMER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),BACKUP_METHOD varchar(500),RATED_POWER varchar(500),INPUT_RATED_VOLTAGE varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_TRANSFORMER_DEVICE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),INPUT_RATED_VOLTAGE varchar(500),OUTPUT_RATED_VOLTAGE varchar(500),OUTPUT_TYPE varchar(500),TRANS_MODULE_CAPACITY varchar(500),TRANS_MODULE_NUMBER varchar(500),MODULE_OUTPUT_CURRENT varchar(500),ASSET_CODE varchar(500),MODULE_RATED_CAPACITY varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_HV_DISTSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),SYSTEM_NAME varchar(500),SYSTEM_CODE varchar(500),RATED_CAPACITY varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_HV_DISTDEVICE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_CAPACITY varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_HV_DCSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),SYSTEM_NAME varchar(500),SYSTEM_CODE varchar(500),RATED_CAPACITY varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_HV_DCPOWER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_OUTPUT_VOLTAGE varchar(500),MONITOR_MODULE_TYPE varchar(500),RECTIFIER_MODULE_CAPACITY varchar(500),RECTIFIER_MODULE_NUMBER varchar(500),SINGLE_MODULE_RATED_CURRENT varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_HV_DCDIST(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_CAPACITY varchar(500),INPUT_PORT_NUMBER varchar(500),OUTPUT_PORT_NUMBER varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_LV_DISTSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),SYSTEM_NAME varchar(500),SYSTEM_CODE varchar(500),RATED_CAPACITY varchar(500),SECTION_BUS_NUMBER varchar(500),OPERATION_MODE varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_LV_ACDIST(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_CAPACITY varchar(500),INPUT_PORT_NUMBER varchar(500),OUTPUT_PORT_NUMBER varchar(500),SPD_BRAND varchar(500),SPD_MAX_CURRENT varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_POWERSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),SYSTEM_NAME varchar(500),SYSTEM_CODE varchar(500),RATED_CAPACITY varchar(500),GENERATOR_SET_NUM varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_GENERATORSETS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_POWER varchar(500),RATED_OUTPUT_VOLTAGE varchar(500),SELF_BOOT varchar(500),OUTPUT_VOLTAGE_TYPE varchar(500),COOL_METHOD varchar(500),INSTALL_METHOD varchar(500),BACKUP_METHOD varchar(500),FUELTANK_VOLUME varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_SWITCHPOWERSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),SYSTEM_NAME varchar(500),SYSTEM_CODE varchar(500),RATED_CAPACITY varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_SWITCHPOWER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_OUTPUT_VOLTAGE varchar(500),MONITOR_MODULE_MODEL varchar(500),MODULE_CAPACITY varchar(500),MODULE_NUMBER varchar(500),RATED_OUTPUT_CAPACITY varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_LV_DCDIST(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_CAPACITY varchar(500),INPUT_PORT_NUM varchar(500),OUTPUT_PORT_NUM varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_UPSSYS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),SYSTEM_NAME varchar(500),SYSTEM_CODE varchar(500),RATED_CAPACITY varchar(500),WORK_STYLE varchar(500),BUS_TYPE varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_UPSDEVICE(DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_SYS varchar(500),RATED_CAPACITY varchar(500),RATED_OUTPUT_VOLTAGE varchar(500),MODULE_CAPACITY varchar(500),MODULE_NUMBER varchar(500),MODULE_RATED_OUTPUT_CAPACITY varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_BATTERY(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_CATEGORY varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RELATED_PARENT_DEVICE_TYPE varchar(500),RELATED_PARENT_DEVICE varchar(500),RATED_CAPACITY varchar(500),MONOMER_VOLTAGE_LEVEL varchar(500),MONOMER_NUMBER varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_AIRCONDITIONER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_CATEGORY varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RATED_REFRIGERATION_QUANTITY varchar(500),RELATED_INPUT_POWER varchar(500),RATED_WORK_VOLTAGE varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_ENERGYSAVING(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RATED_REFRIGERATION_QUANTITY varchar(500),RELATED_INPUT_POWER varchar(500),RATED_WORK_VOLTAGE varchar(500),SYSTEM_CAPACITY varchar(500),OUTPUT_VOLTAGE varchar(500),FAN_TOTAL_NUMBER varchar(500),FAN_TYPE varchar(500),FAN_BRAND varchar(500),FAN_RATED_POWER varchar(500),SE_COMPONENT_NUMBER varchar(500),SE_COMPONENT_BRAND varchar(500),SE_COMPONENT_RATED_CAPACITY varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_MONITOR(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_INTELMETER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),METER_LOOP_NUMBER varchar(500),COLLECT_DEVICE varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_NONMAINEQU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE_NAME varchar(500),DEVICE_NAME varchar(500),DEVICE_CODE varchar(500),DEVICE_MODEL varchar(500),MANUFACTOR varchar(500),DEVICE_BRAND varchar(500),ONLINE_DATE varchar(500),PRE_OFFLINE_DATE varchar(500),RATED_CAPACITY varchar(500),ASSET_CODE varchar(500),LIFECYCLE_STATUS varchar(500),RELATED_RACKPOS varchar(500),DAILY_DUTY_PERSON varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_SHUNT_INNER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_TYPE_ABBRNAME varchar(500),AEND_DEVICE_TYPE varchar(500),AEND_DEVICE_NAME varchar(500),AEND_PORT_NO varchar(500),STANDBY_STATUS varchar(500),WORK_STATUS varchar(500),SHUNT_NAME varchar(500),RATED_CAPACITY varchar(500),ZEND_ROOM varchar(500),ZEND_DEVICE_TYPE varchar(500),ZEND_DEVICE_NAME varchar(500),ZEND_PORT_NO varchar(500),DESTINATION_SHUNT_NAME varchar(500),DESTINATION_SHUNT_TYPE varchar(500),DESTINATION_SHUNT_TYPE_ABBR varchar(500),DESTINATION_STANDBY_STATUS varchar(500),DESTINATION_WORK_STATUS varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table PE_SHUNT_OUTER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_POINT varchar(500),RELATED_ROOM varchar(500),PE_ENTITY_TYPE varchar(500),DEVICE_TYPE varchar(500),DEVICE_TYPE_ABBRNAME varchar(500),AEND_DEVICE_TYPE varchar(500),AEND_DEVICE_NAME varchar(500),AEND_PORT_NO varchar(500),STANDBY_STATUS varchar(500),WORK_STATUS varchar(500),SHUNT_NAME varchar(500),RATED_CAPACITY varchar(500),ZEND_ROOM varchar(500),ZEND_DEVICE_RACKPOSITION varchar(500),ZEND_DEVICE_RACKPOSITION_ABBR varchar(500),ZEND_DEVICE_TYPE varchar(500),ZEND_DEVICE_NAME varchar(500),SWITCH_NAMEINRACK varchar(500),QUALITOR varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_CONTROLLER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),DEVICE_TYPE varchar(500),NAME varchar(500),OMC_NAME varchar(500),MANUFACTOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),RELATED_OMC varchar(500),LOCAL_SIGNALING_POINT_CODE varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),ONLINE_DATE varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),RELATED_MGW varchar(500),RELATED_SGSN_MME varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_BASESTATION(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),DEVICE_TYPE varchar(500),NAME varchar(500),OMC_NAME varchar(500),DEVICE_MODEL varchar(500),INSTALL_POSITION varchar(500),SOFTWARE_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),ONLINE_DATE varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),COVER_TYPE varchar(500),VIP_LEVEL varchar(500),RELATED_CONTROLLER varchar(500),RELATED_BBU varchar(500),RATED_POWER varchar(500),MANUFACTOR varchar(500),NETWORK_MODE varchar(500),ENODEB_ID varchar(500),S1_IP varchar(500),RELATED_OMC varchar(500),BASESTATION_TYPE varchar(500),STRUCTURE_TYPE varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_CELL(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),CELL_TYPE varchar(500),NAME varchar(500),OMC_NAME varchar(500),FREQUENCY_BAND varchar(500),CI varchar(500),TAC varchar(500),LIFECYCLE_STATUS varchar(500),ONLINE_DATE varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),COVER_TYPE varchar(500),COVER_SCENE varchar(500),COVER_SCENE_REFINE varchar(500),SUB_COVER_SCENE varchar(500),SUB_COVER_SCENE_REFINE varchar(500),RELATED_BASESTATION varchar(500),IS_REMOTE_UNIT varchar(500),NETWORK_MODE varchar(500),ECGI varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_BBU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),BBU_NAME varchar(500),SERIAL_NO varchar(500),RATED_POWER varchar(500),NETWORK_MODE varchar(500),RELATED_BASESTATIONS varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_RRU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),NAME varchar(500),OMC_NAME varchar(500),INSTALL_POSITION varchar(500),RELATED_CELL varchar(500),RATED_POWER varchar(500),ACCESS_METHOD varchar(500),RRU_NUMBER varchar(500),DEVICE_MODEL varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_CARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CARD_NUMBER varchar(500),CARD_MODE varchar(500),PHYSICAL_POSITION varchar(500),CARD_FUNCTION_TYPE varchar(500),RELATED_DEVICE_TYPE varchar(500),RELATED_DEVICE varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PORT_NUMBER varchar(500),PHYSICAL_POSITION varchar(500),CIRCUIT_NAME varchar(500),RELATED_CONNECTOR varchar(500),PORT_STATUS varchar(500),INTERFACE_TYPE varchar(500),RELATED_DEVICE_TYPE varchar(500),RELATED_DEVICE varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_ANTENNA(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),ANTENNA_NAME varchar(500),DEVICE_MODEL varchar(500),RELATED_TOWER varchar(500),TOWER_PLATFORM_NO varchar(500),ANTENNA_HEIGHT varchar(500),ONLINE_DATE varchar(500),ANTENNA_TYPE varchar(500),IS_AAU_COMBINE varchar(500),AAU_NAME varchar(500),MANUFACTOR varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_ANTENNA_PARAMETER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_ANTENNA varchar(500),RELATED_CELL varchar(500),FREQUENCY_BAND varchar(500),AZIMUTH_ANGLE varchar(500),ELECTRIC_INCLINATION varchar(500),MECHANICAL_INCLINATION varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_TOWER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),TOWER_NAME varchar(500),NET_HEIGHT varchar(500),PLATFORM_QUANTITY varchar(500),TOWER_TYPE varchar(500),PROPERTY_RIGHT varchar(500),PROPERTY_UNIT varchar(500),SHARE_WITH varchar(500),ONLINE_DATE varchar(500),TOWER_CATEGORY varchar(500),TOWER_INC_CODE varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_REPEATER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),NAME varchar(500),MANUFACTOR varchar(500),SIGNAL_RECEIVE_TYPE varchar(500),POWER_SUPPLY_TYPE varchar(500),INSTALL_LOCATION varchar(500),LIFECYCLE_STATUS varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),REPEATER_TYPE varchar(500),COVER_TYPE varchar(500),RELATED_CELL varchar(500),RATED_POWER varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_DISTRIBUTOR(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),DISTRIBUTOR_NAME varchar(500),INSTALL_VENDOR varchar(500),ANTENNA_AMOUNT varchar(500),AMPLIFIERS_AMOUNT varchar(500),RELATED_BASESTATION varchar(500),RELATED_CELL varchar(500),EQUIPMENT_VENDOR varchar(500),FEEDER_VENDOR varchar(500),ANTENNA_VENDOR varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_AP(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),AP_NAME varchar(500),SERIAL_NO varchar(500),RELATED_BASESTATION varchar(500),RATED_POWER varchar(500),INSTALL_POSITION varchar(500),MANUFACTOR varchar(500),DEVICE_MODEL varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_AU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),AU_NAME varchar(500),SERIAL_NO varchar(500),RELATED_BASESTATION varchar(500),RATED_POWER varchar(500),INSTALL_LOCATION varchar(500),MANUFACTOR varchar(500),DEVICE_MODEL varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_SWITCH(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),SWITCH_NAME varchar(500),SERIAL_NO varchar(500),RELATED_BASESTATION varchar(500),RATED_POWER varchar(500),INSTALL_LOCATION varchar(500),MANUFACTOR varchar(500),DEVICE_MODEL varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_DU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),DU_NAME varchar(500),SERIAL_NO varchar(500),RELATED_BASESTATION varchar(500),RATED_POWER varchar(500),NETWORK_MODE varchar(500),RELATED_CU varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_CU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),CU_NAME varchar(500),SERIAL_NO varchar(500),RATED_POWER varchar(500),NETWORK_MODE varchar(500),dims_col_result text,dims_col_rtName text);
create table WL_AAU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_LOCATION_TYPE varchar(500),RELATED_LOCATION varchar(500),AAU_NAME varchar(500),INSTALL_POSITION varchar(500),RELATED_CELL varchar(500),RATED_POWER varchar(500),ACCESS_METHOD varchar(500),SERIAL_NO varchar(500),DEVICE_MODEL varchar(500),dims_col_result text,dims_col_rtName text);
create table RM_AREA_SITE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),ZH_LABEL varchar(500),ALIAS_NAME varchar(500),RES_CODE varchar(500),SITE_TYPE varchar(500),CHINA_TOWER_STATION_CODE text,ADDRESS varchar(500),LONGITUDE varchar(500),LATITUDE varchar(500),MODIFIER varchar(500),MODIFICATION_TIME varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),VERSION varchar(500),COMMENTS varchar(500),LIFECYCLE_STATUS varchar(500),RELEATED_DATACENTER varchar(500),dims_col_result text,dims_col_rtName text);
create table RM_AREA_ROOM(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),ZH_LABEL varchar(500),CHINA_TOWER_STATION_CODE text,FLOOR_NUM varchar(500),POSITION_ON_FLOOR varchar(500),PROPERTY_RIGHT varchar(500),PROPERTY_UNIT varchar(500),LIFECYCLE_STATUS varchar(500),CUTIN_DATE varchar(500),ROW_NUM varchar(500),COLUMN_NUM varchar(500),RELATED_SITE varchar(500),EQUIPROOM_TYPE varchar(500),EQUIPROOM_LEVEL varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),RES_CODE varchar(500),ALIAS_NAME varchar(500),RELATED_GISACCESSAREA varchar(500),MAINTAINOR_METHOD varchar(500),RELATED_PROJECT varchar(500),RELATED_SUPPLYCOMPANY varchar(500),CREATOR varchar(500),CREATE_TIME varchar(500),MODIFIER varchar(500),MODIFICATION_TIME varchar(500),ASSETS_NO varchar(500),VERSION varchar(500),COMMENTS varchar(500),START_ROW varchar(500),END_ROW varchar(500),START_COLUMN varchar(500),END_COLUMN varchar(500),ROW_DIRECTION varchar(500),COLUMN_DIRECTION varchar(500),ROOM_AREA varchar(500),dims_col_result text,dims_col_rtName text);
create table RM_AREA_RACKPOS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),SERIAL varchar(500),EQUIPROOM_ID varchar(500),ROW_ID varchar(500),LINE_ID varchar(500),USING_STATUS varchar(500),dims_col_result text,dims_col_rtName text);
create table RM_AREA_RESPOINT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),ZH_LABEL varchar(500),ALIAS_NAME varchar(500),RES_CODE varchar(500),RES_TYPE varchar(500),LONGITUDE varchar(500),LATITUDE varchar(500),ADDRESS varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),VERSION varchar(500),COMMENTS varchar(500),CHINA_TOWER_STATION_CODE text,RELEATED_DATACENTER varchar(500),dims_col_result text,dims_col_rtName text);
create table RM_AREA_DATACENTER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),IDC_NAME varchar(500),QUALITOR varchar(500),IDC_CATEGORY varchar(500),dims_col_result text,dims_col_rtName text);
create table RM_AREA_RACKUNIT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_RACKPOS varchar(500),UNIT_NO varchar(500),BUSINESS_STATUS varchar(500),EQUIPROOM_ID varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_DEVICE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),VENDOR varchar(500),DEVICE_MODEL varchar(500),RELATED_RACKPOS varchar(500),IPV4_MANAGEMENT_ADDRESS varchar(500),IPV6_MANAGEMENT_ADDRESS varchar(500),SOFT_VERSION varchar(500),LIFECYCLE_STATUS varchar(500),SETUP_TIME varchar(500),QUALITOR varchar(500),RELATED_BUSINESS_SYSTEM varchar(500),DEVICE_TYPE varchar(500),NETWORK_LEVEL varchar(500),PAIR_DEVICE_NAME varchar(500),ENGINEERING_PERIOD varchar(500),RATED_POWER varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_BOARD(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),MASTER_BOARD_NUMBER varchar(500),SUB_BOARD_NUMBER varchar(500),BOARD_TYPE varchar(500),SLOT_NO varchar(500),RELATED_DEVICE varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_PHYSICAL_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PHYSICAL_PORT_NAME varchar(500),PORT_NO varchar(500),PORT_RATE varchar(500),SLOT_NO varchar(500),IPV4_ADDRESS varchar(500),IPV6_ADDRESS varchar(500),PORT_STATUS varchar(500),PORT_TYPE varchar(500),PORT_MODULE_TYPE varchar(500),RELATED_DEVICE varchar(500),LINE_TYPE varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_LOGICAL_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),LOGICAL_PORT_NAME varchar(500),IPV4_ADDRESS varchar(500),IPV6_ADDRESS varchar(500),RELATION_PORT varchar(500),RELATED_DEVICE varchar(500),PORT_RATE varchar(500),VLAN_ID varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_PHYSICAL_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PHYSICAL_LINK_NAME varchar(500),CIRCUIT_BANDWIDTH varchar(500),A_TERMINAL varchar(500),Z_TERMINAL varchar(500),A_DEVICE varchar(500),A_PORT varchar(500),Z_DEVICE varchar(500),Z_PORT varchar(500),TRANS_CIRCUIT_NAME varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_LOGICAL_LINK(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),LOGICAL_LINK_NAME varchar(500),LINK_BANDWIDTH varchar(500),A_DEVICE varchar(500),A_PORT varchar(500),Z_DEVICE varchar(500),Z_PORT varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_BUSINESS_IP_BEAR_NET(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),VPN_NAME varchar(500),AR_BEARER_BUSINESS varchar(500),CE_NETWORK_SEGMENT varchar(500),AR_DEVICE_NAME varchar(500),AR_PORT varchar(500),CE_DEVICE_NAME varchar(500),CE_PORT varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_IPV4_ADDR_SEG(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),IPV4_ADDRESS_SEGMENT_NAME varchar(500),PARENT_IPV4_ADDR_SEG_NAME varchar(500),USE_DESCRIPTION varchar(500),BUSINESS_STATUS varchar(500),ADDRESS_TYPE varchar(500),RELATED_BUSINESS_SYSTEM varchar(500),RELATED_DEVICE varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_IPV4_ADDR(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),IP_ADDRESS_NAME varchar(500),BUSINESS_STATUS varchar(500),RELATED_ADDR_SEG varchar(500),RELATED_DEVICE varchar(500),RELATED_DEVICE_PORT varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_VLAN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),VLAN_TYPE varchar(500),VLAN_ID_TYPE varchar(500),VLAN_ID varchar(500),PORT_ID varchar(500),RELATED_DEVICE varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_IPV6_ADDR_SEG(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),IPV6_ADDR_SEG_NAME varchar(500),PARENT_IPV6_ADDR_SEG_NAME varchar(500),TYPE_IDENTIFIER varchar(500),NETWORK_TYPE varchar(500),PREFIX_LENGTH varchar(500),DIVIDE_TYPE varchar(500),IPV6_ADDR_SEG_PURPOSE varchar(500),AFFILIATED_BUSINESS varchar(500),BUSINESS_STATUS varchar(500),USE_DESCRIPTION varchar(500),RELATED_DEVICE varchar(500),dims_col_result text,dims_col_rtName text);
create table DN_IPV6_ADDR(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),IPV6_ADDR_NAME varchar(500),BUSINESS_STATUS varchar(500),ADDR_SEG_NAME varchar(500),ADDR_BUSINESS_SYSTEM varchar(500),IP_ADDRESS_TYPE varchar(500),RELATED_DEVICE varchar(500),RELATED_DEVICE_PORT varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_CUSTOMER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_ADDRESS varchar(500),CUSTOMER_LEVEL varchar(500),CUSTOMER_SLA varchar(500),CUSTOMER_MANAGER varchar(500),CUSTOMER_MANAGER_TEL varchar(500),REMARKS varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_PRODUCT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_CODE varchar(500),PRODUCT_TYPE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),PRODUCT_AEND_PROVINCE varchar(500),PRODUCT_AEND_PREFECTURE varchar(500),PRODUCT_AEND_COUNTY varchar(500),PRODUCT_AEND_ADDRESS varchar(500),PRODUCT_AEND_CONTACT varchar(500),PRODUCT_AEND_CONTACT_PHONE varchar(500),PRODUCT_ZEND_PROVINCE varchar(500),PRODUCT_ZEND_PREFECTURE varchar(500),PRODUCT_ZEND_COUNTY varchar(500),PRODUCT_ZEND_ADDRESS varchar(500),PRODUCT_ZEND_CONTACT varchar(500),PRODUCT_ZEND_CONTACT_PHONE varchar(500),PRODUCT_SERVICE_DATE varchar(500),REMARKS varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_PRODUCT_VOICE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),CIRCUIT_NAME varchar(500),BANDWIDTH varchar(500),RELAY_AMOUNT varchar(500),TRANSMISSION_METHOD varchar(500),TN_ZEND_DEVICE_NAME varchar(500),TN_ZEND_PORT_NAME varchar(500),TN_AEND_DEVICE_NAME varchar(500),TN_AEND_PORT_NAME varchar(500),DN_DEVICE_NAME varchar(500),DN_PORT_NAME varchar(500),SN_DEVICE_NAME varchar(500),SN_PORT_NAME varchar(500),IP_ADDRESS varchar(500),OPTICALCIRCUIT_NAME varchar(500),PROTECTION_MODE varchar(500),SERVING_ENSURE_LEVEL varchar(500),REMARKS varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_PRODUCT_CMNET(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),CIRCUIT_NAME varchar(500),BANDWIDTH varchar(500),TRANSMISSION_METHOD varchar(500),TN_ZEND_DEVICE_NAME varchar(500),TN_ZEND_PORT_NAME varchar(500),TN_AEND_DEVICE_NAME varchar(500),TN_AEND_PORT_NAME varchar(500),DN_DEVICE_NAME varchar(500),DN_PORT_NAME varchar(500),IP_ADDRESS varchar(500),OPTICALCIRCUIT_NAME varchar(500),PROTECTION_MODE varchar(500),SERVING_ENSURE_LEVEL varchar(500),REMARKS varchar(500),BEARING_IOT varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_PRODUCT_APN(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),APN_NAME varchar(500),APN_ID varchar(500),APN_RANGE varchar(500),SERVICE_BEARER varchar(500),RELATED_PRODUCTS varchar(500),IP_ALLOCATION_MODE varchar(500),DOUBLE_GGSN varchar(500),FIRST_GGSN_NAME varchar(500),SECOND_GGSN_NAME varchar(500),REMARKS varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_PRODUCT_SMS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),ENTERPRISE_CODE varchar(500),SERVICE_CODE varchar(500),BUSINESS_CODE varchar(500),SERVICE_BEARING_MODE varchar(500),RELATED_PRODUCT varchar(500),REMARKS varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_PRODUCT_MMS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),ENTERPRISE_CODE varchar(500),SERVICE_CODE varchar(500),BUSINESS_CODE varchar(500),SERVICE_BEARING_MODE varchar(500),RELATED_PRODUCT varchar(500),REMARKS varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_PRODUCT_DATA(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NAME varchar(500),CUSTOMER_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),CIRCUIT_NAME varchar(500),AEND_ACCESS_MODE varchar(500),ZEND_ACCESS_MODE varchar(500),SERVICE_BANDWIDTH varchar(500),TN_AEND_DEVICE_NAME varchar(500),TN_AEND_PORT_NAME varchar(500),TN_ZEND_DEVICE_NAME varchar(500),TN_ZEND_PORT_NAME varchar(500),CIRCUIT_LEVEL varchar(500),AEND_OPTICALCIRCUIT_NAME varchar(500),ZEND_OPTICALCIRCUIT_NAME varchar(500),AEND_PROTECTION_MODE varchar(500),ZEND_PROTECTION_MODE varchar(500),AEND_SERVING_ENSURE_LEVEL varchar(500),ZEND_SERVING_ENSURE_LEVEL varchar(500),REMARKS varchar(500),BEARING_IOT varchar(500),dims_col_result text,dims_col_rtName text);
create table EB_DEVICE(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),DEVICE_NAME varchar(500),SERIAL_NO varchar(500),DEVICE_TYPE varchar(500),DEVICE_LAYER varchar(500),RELATION_ROOM varchar(500),VENDOR_NAME varchar(500),DEVICE_MODEL varchar(500),LIFECYCLE_STATUS varchar(500),ONLINE_DATE varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_CUSTOMER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),CUSTOMER_NO varchar(500),CUSTOMER_ACCESS_ADDRESS varchar(500),RELATED_DEVICE_ID varchar(500),RELATED_DEVICE_TYPE varchar(500),RELATED_DEVICE_PORT_ID varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_PRODUCT_DATA(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),CUSTOMER_NO varchar(500),ACCESS_TYPE varchar(500),PRODUCT_STATUS varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_PRODUCT_IMS(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),CUSTOMER_NO varchar(500),PRODUCT_STATUS varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_PRODUCT_IPTV(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),PRODUCT_INSTANCE_CODE varchar(500),CUSTOMER_NO varchar(500),PRODUCT_STATUS varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_ONU(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),ONU_SN varchar(500),LOID_PASSWORD varchar(500),MANUFACTURER varchar(500),SPECIFICATION varchar(500),TERMINAL_TYPE varchar(500),ACCESS_TYPE varchar(500),UPLINK_DEVICE_ID varchar(500),UPLINK_PORT_ID varchar(500),POSITION_TYPE varchar(500),POSITION_ID varchar(500),BROADBAND_PORT_NUM varchar(500),LIFECYCLE_STATUS varchar(500),PROPERTY_UNIT varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),RATED_POWER varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_ONU_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_DEVICE_ID varchar(500),PORT_NO varchar(500),PORT_STATUS varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),ACCESS_TYPE varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_SPLITTER(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),POSITION_TYPE varchar(500),POSITION_ID varchar(500),SPLITTER_RATIO varchar(500),UPLINK_DEVICE_ID varchar(500),UPLINK_DEVICE_TYPE varchar(500),UPLINK_WORK_PORT_ID varchar(500),UPLINK_BACKUP_PORT_ID varchar(500),LIFECYCLE_STATUS varchar(500),PROPERTY_UNIT varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_SPLITTER_PORT(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_DEVICE_ID varchar(500),PORT_SERIAL varchar(500),PORT_STATUS varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_SEP_FIBER_BOX(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),RELATED_RESPOINT_ID varchar(500),INNER_DEVICE_TYPE varchar(500),LIFECYCLE_STATUS varchar(500),PROPERTY_UNIT varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_SEP_FIBER_BOX_CONNECTOR(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),RELATED_DEVICE_ID varchar(500),PORT_SERIAL varchar(500),PORT_STATUS varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),dims_col_result text,dims_col_rtName text);
create table FB_INTERGRATED_BOX(INT_ID varchar(500),PROVINCE_CODE varchar(500),PREFECTURE_CODE varchar(500),COUNTY_CODE varchar(500),DEVICE_NAME varchar(500),RELATED_RESPOINT_ID varchar(500),POSITION_DESC varchar(500),LIFECYCLE_STATUS varchar(500),PROPERTY_UNIT varchar(500),QUALITOR varchar(500),MAINTAINOR varchar(500),dims_col_result text,dims_col_rtName text);

create index if not exists idx_CORE_PD_MME2intId on CORE_PD_MME(int_id);
create index if not exists idx_CORE_PD_SAEGW2intId on CORE_PD_SAEGW(int_id);
create index if not exists idx_CORE_PD_SGW2intId on CORE_PD_SGW(int_id);
create index if not exists idx_CORE_PD_PGW2intId on CORE_PD_PGW(int_id);
create index if not exists idx_CORE_PD_PCRF2intId on CORE_PD_PCRF(int_id);
create index if not exists idx_CORE_PD_PCRFBE2intId on CORE_PD_PCRFBE(int_id);
create index if not exists idx_CORE_PD_CG2intId on CORE_PD_CG(int_id);
create index if not exists idx_CORE_PD_DNS2intId on CORE_PD_DNS(int_id);
create index if not exists idx_CORE_PD_DRA2intId on CORE_PD_DRA(int_id);
create index if not exists idx_CORE_PD_FW2intId on CORE_PD_FW(int_id);
create index if not exists idx_CORE_PD_SW2intId on CORE_PD_SW(int_id);
create index if not exists idx_CORE_PD_CE2intId on CORE_PD_CE(int_id);
create index if not exists idx_CORE_PD_SGSN2intId on CORE_PD_SGSN(int_id);
create index if not exists idx_CORE_PD_GGSN2intId on CORE_PD_GGSN(int_id);
create index if not exists idx_CORE_PD_POOL2intId on CORE_PD_POOL(int_id);
create index if not exists idx_CORE_PD_IPADDRESS2intId on CORE_PD_IPADDRESS(int_id);
create index if not exists idx_CORE_PD_VLAN2intId on CORE_PD_VLAN(int_id);
create index if not exists idx_CORE_PD_BOARD2intId on CORE_PD_BOARD(int_id);
create index if not exists idx_CORE_PD_PORT2intId on CORE_PD_PORT(int_id);
create index if not exists idx_CORE_PD_LINK2intId on CORE_PD_LINK(int_id);
create index if not exists idx_CORE_PD_APN2intId on CORE_PD_APN(int_id);
create index if not exists idx_CORE_IMS_DOMAIN2intId on CORE_IMS_DOMAIN(int_id);
create index if not exists idx_CORE_IMS_BOARD2intId on CORE_IMS_BOARD(int_id);
create index if not exists idx_CORE_IMS_PORT2intId on CORE_IMS_PORT(int_id);
create index if not exists idx_CORE_IMS_DEVICE_ISBG2intId on CORE_IMS_DEVICE_ISBG(int_id);
create index if not exists idx_CORE_IMS_PCSCF2intId on CORE_IMS_PCSCF(int_id);
create index if not exists idx_CORE_IMS_LOGIC_SCSCF2intId on CORE_IMS_LOGIC_SCSCF(int_id);
create index if not exists idx_CORE_IMS_LOGIC_ICSCF2intId on CORE_IMS_LOGIC_ICSCF(int_id);
create index if not exists idx_CORE_IMS_LOGIC_BGCF2intId on CORE_IMS_LOGIC_BGCF(int_id);
create index if not exists idx_CORE_IMS_CG2intId on CORE_IMS_CG(int_id);
create index if not exists idx_CORE_IMS_HSS2intId on CORE_IMS_HSS(int_id);
create index if not exists idx_CORE_IMS_SBC2intId on CORE_IMS_SBC(int_id);
create index if not exists idx_CORE_IMS_DEVICE_MGCF2intId on CORE_IMS_DEVICE_MGCF(int_id);
create index if not exists idx_CORE_IMS_DEVICE_IM_MGW2intId on CORE_IMS_DEVICE_IM_MGW(int_id);
create index if not exists idx_CORE_IMS_LOGIC_MRFC2intId on CORE_IMS_LOGIC_MRFC(int_id);
create index if not exists idx_CORE_IMS_LOGIC_MRFP2intId on CORE_IMS_LOGIC_MRFP(int_id);
create index if not exists idx_CORE_IMS_MMTAS2intId on CORE_IMS_MMTAS(int_id);
create index if not exists idx_CORE_IMS_DEVICE_DNS_ENUM2intId on CORE_IMS_DEVICE_DNS_ENUM(int_id);
create index if not exists idx_CORE_IMS_LINK2intId on CORE_IMS_LINK(int_id);
create index if not exists idx_CORE_IMS_CTXAS_PUB_RES2intId on CORE_IMS_CTXAS_PUB_RES(int_id);
create index if not exists idx_CORE_IMS_SCP_BIZ_UNIT2intId on CORE_IMS_SCP_BIZ_UNIT(int_id);
create index if not exists idx_CORE_IMS_SCP_SIGNAL_UNIT2intId on CORE_IMS_SCP_SIGNAL_UNIT(int_id);
create index if not exists idx_CORE_IMS_CTXAS_SCP_BUS_RES2intId on CORE_IMS_CTXAS_SCP_BUS_RES(int_id);
create index if not exists idx_CORE_IMS_CTXAS_SCP_MAINTAIN2intId on CORE_IMS_CTXAS_SCP_MAINTAIN(int_id);
create index if not exists idx_CORE_IMS_SCP_BOARD2intId on CORE_IMS_SCP_BOARD(int_id);
create index if not exists idx_CORE_IMS_CTXAS_SCP_PORT2intId on CORE_IMS_CTXAS_SCP_PORT(int_id);
create index if not exists idx_CORE_IMS_CTXAS_SCP_SIGNAL_LINK2intId on CORE_IMS_CTXAS_SCP_SIGNAL_LINK(int_id);
create index if not exists idx_CORE_LTE_CENTRALIZED_HSS2intId on CORE_LTE_CENTRALIZED_HSS(int_id);
create index if not exists idx_CORE_LTE_DISTRIBUTED_HSS2intId on CORE_LTE_DISTRIBUTED_HSS(int_id);
create index if not exists idx_CORE_LTE_HSSBE2intId on CORE_LTE_HSSBE(int_id);
create index if not exists idx_CORE_LTE_HSSFE2intId on CORE_LTE_HSSFE(int_id);
create index if not exists idx_CORE_LTE_PG2intId on CORE_LTE_PG(int_id);
create index if not exists idx_CORE_LTE_HLRFE2intId on CORE_LTE_HLRFE(int_id);
create index if not exists idx_CORE_VOLTE_DOMAIN2intId on CORE_VOLTE_DOMAIN(int_id);
create index if not exists idx_CORE_VOLTE_BOARD2intId on CORE_VOLTE_BOARD(int_id);
create index if not exists idx_CORE_VOLTE_PORT2intId on CORE_VOLTE_PORT(int_id);
create index if not exists idx_CORE_VOLTE_VOLTE_AS2intId on CORE_VOLTE_VOLTE_AS(int_id);
create index if not exists idx_CORE_VOLTE_VOLTETAS2intId on CORE_VOLTE_VOLTETAS(int_id);
create index if not exists idx_CORE_VOLTE_SCCAS2intId on CORE_VOLTE_SCCAS(int_id);
create index if not exists idx_CORE_VOLTE_MRFC2intId on CORE_VOLTE_MRFC(int_id);
create index if not exists idx_CORE_VOLTE_AP2intId on CORE_VOLTE_AP(int_id);
create index if not exists idx_CORE_VOLTE_MRFP2intId on CORE_VOLTE_MRFP(int_id);
create index if not exists idx_CORE_VOLTE_PSBC2intId on CORE_VOLTE_PSBC(int_id);
create index if not exists idx_CORE_VOLTE_ACTF2intId on CORE_VOLTE_ACTF(int_id);
create index if not exists idx_CORE_VOLTE_ATGW2intId on CORE_VOLTE_ATGW(int_id);
create index if not exists idx_CORE_VOLTE_BCF2intId on CORE_VOLTE_BCF(int_id);
create index if not exists idx_CORE_VOLTE_BGW2intId on CORE_VOLTE_BGW(int_id);
create index if not exists idx_CORE_VOLTE_ISBG2intId on CORE_VOLTE_ISBG(int_id);
create index if not exists idx_CORE_VOLTE_SCSCF2intId on CORE_VOLTE_SCSCF(int_id);
create index if not exists idx_CORE_VOLTE_ICSCF2intId on CORE_VOLTE_ICSCF(int_id);
create index if not exists idx_CORE_VOLTE_BGCF2intId on CORE_VOLTE_BGCF(int_id);
create index if not exists idx_CORE_VOLTE_MGCF2intId on CORE_VOLTE_MGCF(int_id);
create index if not exists idx_CORE_VOLTE_IMMGW2intId on CORE_VOLTE_IMMGW(int_id);
create index if not exists idx_CORE_VOLTE_DNS_ENUM2intId on CORE_VOLTE_DNS_ENUM(int_id);
create index if not exists idx_CORE_VOLTE_POOL2intId on CORE_VOLTE_POOL(int_id);
create index if not exists idx_CORE_VOLTE_LINK2intId on CORE_VOLTE_LINK(int_id);
create index if not exists idx_CORE_CS_MSS2intId on CORE_CS_MSS(int_id);
create index if not exists idx_CORE_CS_MGW2intId on CORE_CS_MGW(int_id);
create index if not exists idx_CORE_CS_STP2intId on CORE_CS_STP(int_id);
create index if not exists idx_CORE_CS_OTHER2intId on CORE_CS_OTHER(int_id);
create index if not exists idx_CORE_CS_BOARD2intId on CORE_CS_BOARD(int_id);
create index if not exists idx_CORE_CS_PORT2intId on CORE_CS_PORT(int_id);
create index if not exists idx_CORE_CS_LINK2intId on CORE_CS_LINK(int_id);
create index if not exists idx_CORE_CS_RELAY2intId on CORE_CS_RELAY(int_id);
create index if not exists idx_CORE_CS_IP_TRAFFIC2intId on CORE_CS_IP_TRAFFIC(int_id);
create index if not exists idx_CORE_CS_IP_SIGNAL2intId on CORE_CS_IP_SIGNAL(int_id);
create index if not exists idx_CORE_CS_MSC_POOL2intId on CORE_CS_MSC_POOL(int_id);
create index if not exists idx_CORE_SMS_MSSSYS2intId on CORE_SMS_MSSSYS(int_id);
create index if not exists idx_CORE_SMS_MSSBASEINFO2intId on CORE_SMS_MSSBASEINFO(int_id);
create index if not exists idx_CORE_SMS_SMSGWSYS2intId on CORE_SMS_SMSGWSYS(int_id);
create index if not exists idx_CORE_SMS_SMSGWBASEINFO2intId on CORE_SMS_SMSGWBASEINFO(int_id);
create index if not exists idx_CORE_SMS_SMSSYS2intId on CORE_SMS_SMSSYS(int_id);
create index if not exists idx_CORE_SMS_SMSBASEINFO2intId on CORE_SMS_SMSBASEINFO(int_id);
create index if not exists idx_CORE_IN_COMMON_NE2intId on CORE_IN_COMMON_NE(int_id);
create index if not exists idx_CORE_IN_SERVICE_UNIT2intId on CORE_IN_SERVICE_UNIT(int_id);
create index if not exists idx_CORE_IN_SIGNAL_UNIT2intId on CORE_IN_SIGNAL_UNIT(int_id);
create index if not exists idx_CORE_IN_NET_DEV2intId on CORE_IN_NET_DEV(int_id);
create index if not exists idx_CORE_IN_SERVICE_RES2intId on CORE_IN_SERVICE_RES(int_id);
create index if not exists idx_CORE_IN_MAINTAIN2intId on CORE_IN_MAINTAIN(int_id);
create index if not exists idx_CORE_IN_BOARD2intId on CORE_IN_BOARD(int_id);
create index if not exists idx_CORE_IN_PORT2intId on CORE_IN_PORT(int_id);
create index if not exists idx_CORE_IN_SIGNAL_LINK2intId on CORE_IN_SIGNAL_LINK(int_id);
create index if not exists idx_CORE_IN_RELAY2intId on CORE_IN_RELAY(int_id);
create index if not exists idx_PE_POINT2intId on PE_POINT(int_id);
create index if not exists idx_PE_ROOM2intId on PE_ROOM(int_id);
create index if not exists idx_PE_TRANSFORMER2intId on PE_TRANSFORMER(int_id);
create index if not exists idx_PE_TRANSFORMER_DEVICE2intId on PE_TRANSFORMER_DEVICE(int_id);
create index if not exists idx_PE_HV_DISTSYS2intId on PE_HV_DISTSYS(int_id);
create index if not exists idx_PE_HV_DISTDEVICE2intId on PE_HV_DISTDEVICE(int_id);
create index if not exists idx_PE_HV_DCSYS2intId on PE_HV_DCSYS(int_id);
create index if not exists idx_PE_HV_DCPOWER2intId on PE_HV_DCPOWER(int_id);
create index if not exists idx_PE_HV_DCDIST2intId on PE_HV_DCDIST(int_id);
create index if not exists idx_PE_LV_DISTSYS2intId on PE_LV_DISTSYS(int_id);
create index if not exists idx_PE_LV_ACDIST2intId on PE_LV_ACDIST(int_id);
create index if not exists idx_PE_POWERSYS2intId on PE_POWERSYS(int_id);
create index if not exists idx_PE_GENERATORSETS2intId on PE_GENERATORSETS(int_id);
create index if not exists idx_PE_SWITCHPOWERSYS2intId on PE_SWITCHPOWERSYS(int_id);
create index if not exists idx_PE_SWITCHPOWER2intId on PE_SWITCHPOWER(int_id);
create index if not exists idx_PE_LV_DCDIST2intId on PE_LV_DCDIST(int_id);
create index if not exists idx_PE_UPSSYS2intId on PE_UPSSYS(int_id);
create index if not exists idx_PE_UPSDEVICE2intId on PE_UPSDEVICE(int_id);
create index if not exists idx_PE_BATTERY2intId on PE_BATTERY(int_id);
create index if not exists idx_PE_AIRCONDITIONER2intId on PE_AIRCONDITIONER(int_id);
create index if not exists idx_PE_ENERGYSAVING2intId on PE_ENERGYSAVING(int_id);
create index if not exists idx_PE_MONITOR2intId on PE_MONITOR(int_id);
create index if not exists idx_PE_INTELMETER2intId on PE_INTELMETER(int_id);
create index if not exists idx_PE_NONMAINEQU2intId on PE_NONMAINEQU(int_id);
create index if not exists idx_PE_SHUNT_INNER2intId on PE_SHUNT_INNER(int_id);
create index if not exists idx_PE_SHUNT_OUTER2intId on PE_SHUNT_OUTER(int_id);
create index if not exists idx_WL_CONTROLLER2intId on WL_CONTROLLER(int_id);
create index if not exists idx_WL_BASESTATION2intId on WL_BASESTATION(int_id);
create index if not exists idx_WL_CELL2intId on WL_CELL(int_id);
create index if not exists idx_WL_BBU2intId on WL_BBU(int_id);
create index if not exists idx_WL_RRU2intId on WL_RRU(int_id);
create index if not exists idx_WL_CARD2intId on WL_CARD(int_id);
create index if not exists idx_WL_PORT2intId on WL_PORT(int_id);
create index if not exists idx_WL_ANTENNA2intId on WL_ANTENNA(int_id);
create index if not exists idx_WL_ANTENNA_PARAMETER2intId on WL_ANTENNA_PARAMETER(int_id);
create index if not exists idx_WL_TOWER2intId on WL_TOWER(int_id);
create index if not exists idx_WL_REPEATER2intId on WL_REPEATER(int_id);
create index if not exists idx_WL_DISTRIBUTOR2intId on WL_DISTRIBUTOR(int_id);
create index if not exists idx_WL_AP2intId on WL_AP(int_id);
create index if not exists idx_WL_AU2intId on WL_AU(int_id);
create index if not exists idx_WL_SWITCH2intId on WL_SWITCH(int_id);
create index if not exists idx_WL_DU2intId on WL_DU(int_id);
create index if not exists idx_WL_CU2intId on WL_CU(int_id);
create index if not exists idx_WL_AAU2intId on WL_AAU(int_id);
create index if not exists idx_RM_AREA_SITE2intId on RM_AREA_SITE(int_id);
create index if not exists idx_RM_AREA_ROOM2intId on RM_AREA_ROOM(int_id);
create index if not exists idx_RM_AREA_RACKPOS2intId on RM_AREA_RACKPOS(int_id);
create index if not exists idx_RM_AREA_RESPOINT2intId on RM_AREA_RESPOINT(int_id);
create index if not exists idx_RM_AREA_DATACENTER2intId on RM_AREA_DATACENTER(int_id);
create index if not exists idx_RM_AREA_RACKUNIT2intId on RM_AREA_RACKUNIT(int_id);
create index if not exists idx_DN_DEVICE2intId on DN_DEVICE(int_id);
create index if not exists idx_DN_BOARD2intId on DN_BOARD(int_id);
create index if not exists idx_DN_PHYSICAL_PORT2intId on DN_PHYSICAL_PORT(int_id);
create index if not exists idx_DN_LOGICAL_PORT2intId on DN_LOGICAL_PORT(int_id);
create index if not exists idx_DN_PHYSICAL_LINK2intId on DN_PHYSICAL_LINK(int_id);
create index if not exists idx_DN_LOGICAL_LINK2intId on DN_LOGICAL_LINK(int_id);
create index if not exists idx_DN_BUSINESS_IP_BEAR_NET2intId on DN_BUSINESS_IP_BEAR_NET(int_id);
create index if not exists idx_DN_IPV4_ADDR_SEG2intId on DN_IPV4_ADDR_SEG(int_id);
create index if not exists idx_DN_IPV4_ADDR2intId on DN_IPV4_ADDR(int_id);
create index if not exists idx_DN_VLAN2intId on DN_VLAN(int_id);
create index if not exists idx_DN_IPV6_ADDR_SEG2intId on DN_IPV6_ADDR_SEG(int_id);
create index if not exists idx_DN_IPV6_ADDR2intId on DN_IPV6_ADDR(int_id);
create index if not exists idx_EB_CUSTOMER2intId on EB_CUSTOMER(int_id);
create index if not exists idx_EB_PRODUCT2intId on EB_PRODUCT(int_id);
create index if not exists idx_EB_PRODUCT_VOICE2intId on EB_PRODUCT_VOICE(int_id);
create index if not exists idx_EB_PRODUCT_CMNET2intId on EB_PRODUCT_CMNET(int_id);
create index if not exists idx_EB_PRODUCT_APN2intId on EB_PRODUCT_APN(int_id);
create index if not exists idx_EB_PRODUCT_SMS2intId on EB_PRODUCT_SMS(int_id);
create index if not exists idx_EB_PRODUCT_MMS2intId on EB_PRODUCT_MMS(int_id);
create index if not exists idx_EB_PRODUCT_DATA2intId on EB_PRODUCT_DATA(int_id);
create index if not exists idx_EB_DEVICE2intId on EB_DEVICE(int_id);
create index if not exists idx_FB_CUSTOMER2intId on FB_CUSTOMER(int_id);
create index if not exists idx_FB_PRODUCT_DATA2intId on FB_PRODUCT_DATA(int_id);
create index if not exists idx_FB_PRODUCT_IMS2intId on FB_PRODUCT_IMS(int_id);
create index if not exists idx_FB_PRODUCT_IPTV2intId on FB_PRODUCT_IPTV(int_id);
create index if not exists idx_FB_ONU2intId on FB_ONU(int_id);
create index if not exists idx_FB_ONU_PORT2intId on FB_ONU_PORT(int_id);
create index if not exists idx_FB_SPLITTER2intId on FB_SPLITTER(int_id);
create index if not exists idx_FB_SPLITTER_PORT2intId on FB_SPLITTER_PORT(int_id);
create index if not exists idx_FB_SEP_FIBER_BOX2intId on FB_SEP_FIBER_BOX(int_id);
create index if not exists idx_FB_SEP_FIBER_BOX_CONNECTOR2intId on FB_SEP_FIBER_BOX_CONNECTOR(int_id);
create index if not exists idx_FB_INTERGRATED_BOX2intId on FB_INTERGRATED_BOX(int_id);

create index if not exists idx_CORE_CS_MGW2ne_name on CORE_CS_MGW(ne_name);
create index if not exists idx_RM_AREA_RACKPOS2serial on RM_AREA_RACKPOS(serial);
create index if not exists idx_RM_AREA_RESPOINT2zh_label on RM_AREA_RESPOINT(zh_label);
create index if not exists idx_RM_AREA_ROOM2zh_label on RM_AREA_ROOM(zh_label);
create index if not exists idx_WL_ANTENNA2antenna_name on WL_ANTENNA(antenna_name);
create index if not exists idx_WL_BASESTATION2name on WL_BASESTATION(name);
create index if not exists idx_WL_BBU2serial_no on WL_BBU(serial_no);
create index if not exists idx_WL_CARD2card_number on WL_CARD(card_number);
create index if not exists idx_WL_CELL2name on WL_CELL(name);
create index if not exists idx_WL_CELL2omc_name on WL_CELL(omc_name);
create index if not exists idx_WL_CONTROLLER2name on WL_CONTROLLER(name);
create index if not exists idx_WL_DISTRIBUTOR2distributor_name on WL_DISTRIBUTOR(distributor_name);
create index if not exists idx_WL_RRU2rru_number on WL_RRU(rru_number);
create index if not exists idx_WL_TOWER2tower_name on WL_TOWER(tower_name);
create index if not exists idx_CORE_PD_MME2ne_name on CORE_PD_MME(ne_name);
create index if not exists idx_RM_AREA_ROOM2zh_label on RM_AREA_ROOM(zh_label);
create index if not exists idx_WL_CONTROLLER2name on WL_CONTROLLER(name);

create index if not exists idx_CORE_PD_SGSN2ne_name on CORE_PD_SGSN(ne_name);
create index if not exists idx_RM_AREA_RESPOINT2zh_label on RM_AREA_RESPOINT(zh_label);
create index if not exists idx_WL_BASESTATION2name on WL_BASESTATION(name);



create index if not exists idx_RM_AREA_SITE2zh_label on RM_AREA_SITE (zh_label);
create index if not exists idx_RM_AREA_ROOM2zh_label on RM_AREA_ROOM (zh_label);
create index if not exists idx_RM_AREA_RESPOINT2zh_label on RM_AREA_RESPOINT (zh_label);
create index if not exists idx_RM_AREA_RACKPOS2serial on RM_AREA_RACKPOS (serial);
create index if not exists idx_RM_AREA_RACKPOS2equiproom_id on RM_AREA_RACKPOS (equiproom_id);
create index if not exists idx_RM_AREA_ROOM2related_site on RM_AREA_ROOM (related_site);

create index if not exists idx_DN_DEVICE2device_name on DN_DEVICE(device_name);
create index if not exists idx_DN_IPV4_ADDR2ip_address_name on DN_IPV4_ADDR(ip_address_name);
create index if not exists idx_DN_IPV4_ADDR_SEG2ipv4_address_segment_name on DN_IPV4_ADDR_SEG(ipv4_address_segment_name);
create index if not exists idx_DN_IPV6_ADDR2ipv6_addr_name on DN_IPV6_ADDR(ipv6_addr_name);
create index if not exists idx_DN_IPV6_ADDR_SEG2ipv6_addr_seg_name on DN_IPV6_ADDR_SEG(ipv6_addr_seg_name);
create index if not exists idx_DN_LOGICAL_LINK2logical_link_name on DN_LOGICAL_LINK(logical_link_name);
create index if not exists idx_DN_LOGICAL_PORT2logical_port_name on DN_LOGICAL_PORT(logical_port_name);
create index if not exists idx_DN_PHYSICAL_LINK2physical_link_name on DN_PHYSICAL_LINK(physical_link_name);
create index if not exists idx_DN_PHYSICAL_PORT2physical_port_name on DN_PHYSICAL_PORT(physical_port_name);
create index if not exists idx_RM_AREA_RACKPOS2serial on RM_AREA_RACKPOS(serial);

create index if not exists idx_EB_CUSTOMER2customer_code on EB_CUSTOMER(customer_code);
create index if not exists idx_EB_CUSTOMER2customer_name on EB_CUSTOMER(customer_name);
create index if not exists idx_EB_PRODUCT2product_instance_code on EB_PRODUCT(product_instance_code);

create index if not exists idx_FB_CUSTOMER2customer_no on FB_CUSTOMER(customer_no);
create index if not exists idx_FB_ONU2onu_sn on FB_ONU(onu_sn);
create index if not exists idx_FB_PRODUCT_DATA2product_instance_code on FB_PRODUCT_DATA(product_instance_code);
create index if not exists idx_FB_PRODUCT_IMS2product_instance_code on FB_PRODUCT_IMS(product_instance_code);
create index if not exists idx_FB_PRODUCT_IPTV2product_instance_code on FB_PRODUCT_IPTV(product_instance_code);


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
    where attr.columnname in ('PROVINCE_CODE','PREFECTURE_CODE','COUNTY_CODE')
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
		 v_selectSql := 'select '''||p_provinceCode||''',prefecture_code,county_code,
		                        count(1) amount,
		                        coalesce(sum(case when dims_col_result like ''%'||v_idxCode||'%'' then 1 else 0 end),0) errorCount 
		                  from '||v_tabWhereSql||' 
		                 group by prefecture_code,county_code';
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
    where attr.columnname in ('PROVINCE_CODE','PREFECTURE_CODE','COUNTY_CODE')
      and attr.entitytype_id=me.id
      and me.extensiontable=upper(v_extensiontable);
      
   if v_countRegionCode =3 then
      v_selectSql := 'select '''||p_provinceCode||''',prefecture_code,county_code,count(1) amount,coalesce(sum(0';
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
      v_selectSql := v_selectSql||'),0) errorAmount from '||v_extensiontable||' group by prefecture_code,county_code';
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

--------------------------------------------------
--DIMS_PE_02001	位置点动环属性位置点名称唯一性指标
--------------------------------------------------
create or replace function PROC_DIMS_PE_02001(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update PE_POINT t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where exists(select 1 
		               from PE_POINT t2 
		              where t2.ctid <> t1.ctid
		                and t2.point_name=t1.point_name);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'PE_POINT');
end;
$$ language plpgsql;



--------------------------------------------------
--DIMS_PE_02002	机房动环属性机房名称唯一性指标
--------------------------------------------------
create or replace function PROC_DIMS_PE_02002(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update PE_ROOM t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where exists(select 1 
		               from PE_ROOM t2 
		              where t2.ctid <> t1.ctid
		                and t2.room_name=t1.room_name);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'PE_ROOM');
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

-------------------------------
--DIMS_WL_02001	天线挂高合规性
-------------------------------
create or replace function PROC_DIMS_WL_02001(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update WL_ANTENNA t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where to_number(antenna_height) is null
		   or to_number(antenna_height) < 3
		   or to_number(antenna_height) > 70;
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_ANTENNA');
end;
$$ language plpgsql;


-------------------------------
--DIMS_WL_02002	机械下倾角合规性
-------------------------------
create or replace function PROC_DIMS_WL_02002(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update WL_ANTENNA_PARAMETER t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where to_number(mechanical_inclination) is null
		   or to_number(mechanical_inclination) < 0
		   or to_number(mechanical_inclination) > 15;
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_ANTENNA_PARAMETER');
end;
$$ language plpgsql;


-------------------------------
--DIMS_WL_02003	电下倾角合规性
-------------------------------
create or replace function PROC_DIMS_WL_02003(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update WL_ANTENNA_PARAMETER t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where to_number(electric_inclination) is null
		   or to_number(electric_inclination) < 0
		   or to_number(electric_inclination) > 12;
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_ANTENNA_PARAMETER');
end;
$$ language plpgsql;


-------------------------------
--DIMS_WL_02004	方位角合规性
-------------------------------
create or replace function PROC_DIMS_WL_02004(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update WL_ANTENNA_PARAMETER t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where to_number(azimuth_angle) is null
		   or to_number(azimuth_angle) < 0
		   or to_number(azimuth_angle) > 360;
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_ANTENNA_PARAMETER');
end;
$$ language plpgsql;



-------------------------------
--DIMS_WL_02005	天线经纬度有效性
-------------------------------
create or replace function PROC_DIMS_WL_02005(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update WL_ANTENNA t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where not exists(select 1 
		                   from RM_AREA_RESPOINT t3
		                  where to_number(t3.longitude) > 0
		                    and to_number(t3.latitude) > 0
		                    and t3.int_id=t1.related_location
		                    and t1.related_location_type in ('3','网络资源点'))
		  and not exists(select 1 
		                   from RM_AREA_ROOM t2,RM_AREA_SITE t3
		                  where to_number(t3.longitude) > 0
		                    and to_number(t3.latitude) > 0
		                    and t3.int_id=t2.related_site
		                    and t2.int_id=t1.related_location
		                    and t1.related_location_type in ('2','机房'));
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_ANTENNA');
end;
$$ language plpgsql;



-------------------------------
--DIMS_WL_02006	天线经纬度精确性
-------------------------------
create or replace function PROC_DIMS_WL_02006(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update WL_ANTENNA t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where not exists(select 1 
		                   from RM_AREA_RESPOINT t3
		                  where to_number(t3.longitude) > 0
		                    and to_number(t3.latitude) > 0
		                    and length(substring(t3.longitude from '%.#"%#"' for '#')) >=5
		                    and length(substring(t3.latitude from '%.#"%#"' for '#')) >=5
		                    and t3.int_id=t1.related_location
		                    and t1.related_location_type in ('3','网络资源点'))
		  and not exists(select 1 
		                   from RM_AREA_ROOM t2,RM_AREA_SITE t3
		                  where to_number(t3.longitude) > 0
		                    and to_number(t3.latitude) > 0
		                    and length(substring(t3.longitude from '%.#"%#"' for '#')) >=5
		                    and length(substring(t3.latitude from '%.#"%#"' for '#')) >=5
		                    and t3.int_id=t2.related_site
		                    and t2.int_id=t1.related_location
		                    and t1.related_location_type in ('2','机房'));
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_ANTENNA');
end;
$$ language plpgsql;


---------------------------------------------------
--WL_BASESTATION  E-NODEB ID规范性  DIMS_WL_02008
---------------------------------------------------
create or replace function PROC_DIMS_WL_02008(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	  
	 --错误量 
   update WL_BASESTATION t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(enodeb_id)
		  and (to_number(enodeb_id) is not null and length(enodeb_id) <=7)=false
		  and (enodeb_id ~ '^[0-9,a-f,A-F]+$' and length(enodeb_id) <=5)=false;
		  
	 perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_BASESTATION','isNotNull(enodeb_id)');	  
end;
$$ language plpgsql;





---------------------------------------------------
--WL_CELL 小区E-CGI规范性 DIMS_WL_02010
---------------------------------------------------
create or replace function PROC_DIMS_WL_02010(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	  
	 --错误量 
   update WL_CELL t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(ecgi)
		  and not exists(select 1 from WL_BASESTATION t2 where t2.int_id=t1.related_basestation and strpos(t1.ecgi,'460-00-'||t2.enodeb_id) >=1)
		  and not exists(select 1 from WL_BASESTATION t2 where t2.name=t1.related_basestation and strpos(t1.ecgi,'460-00-'||t2.enodeb_id) >=1);
		  
	 perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'WL_CELL','isNotNull(ecgi)');	  
end;
$$ language plpgsql;

--------------------------------------------------
--DIMS_SPA_02001	站点名称在系统内是否唯一	
--------------------------------------------------
create or replace function PROC_DIMS_SPA_02001(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_SITE t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where exists(select 1 
		               from RM_AREA_SITE t2 
		              where t2.ctid <> t1.ctid
		                and t2.zh_label=t1.zh_label);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_SITE');
end;
$$ language plpgsql;


--------------------------------------------------
--DIMS_SPA_02002	机房名称在系统内是否唯		
--------------------------------------------------
create or replace function PROC_DIMS_SPA_02002(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_ROOM t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where exists(select 1 
		               from RM_AREA_ROOM t2 
		              where t2.ctid <> t1.ctid
		                and t2.zh_label=t1.zh_label);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_ROOM');
end;
$$ language plpgsql;


--------------------------------------------------
--DIMS_SPA_02003	资源点名称在系统内是否唯一			
--------------------------------------------------
create or replace function PROC_DIMS_SPA_02003(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_RESPOINT t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where exists(select 1 
		               from RM_AREA_RESPOINT t2 
		              where t2.ctid <> t1.ctid
		                and t2.zh_label=t1.zh_label);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_RESPOINT');
end;
$$ language plpgsql;



--------------------------------------------------
--DIMS_SPA_02004	机架位置编号在同一机房中是否唯一		
--------------------------------------------------
create or replace function PROC_DIMS_SPA_02004(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_RACKPOS t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where exists(select 1 
		               from RM_AREA_RACKPOS t2 
		              where t2.ctid <> t1.ctid
		                and t2.serial=t1.serial
		                and t2.equiproom_id=t1.equiproom_id);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_RACKPOS');
end;
$$ language plpgsql;

--------------------------------------------------
--DIMS_SPA_03001	机房所属站点是否准确	
--------------------------------------------------
create or replace function PROC_DIMS_SPA_03001(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_ROOM t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where not exists(select 1 
		                   from RM_AREA_SITE t2 
		                  where t2.int_id=t1.related_site)
		  and not exists(select 1 
		                   from RM_AREA_SITE t2 
		                  where t2.zh_label=t1.related_site)
		  and isNotNull(related_site);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_ROOM');
end;
$$ language plpgsql;


--------------------------------------------------
--DIMS_SPA_03002	机房和机架位置的关联性	
--------------------------------------------------
create or replace function PROC_DIMS_SPA_03002(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_RACKPOS t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where not exists(select 1 
		                   from RM_AREA_ROOM t2 
		                  where t2.int_id=t1.equiproom_id)
		  and not exists(select 1 
		                   from RM_AREA_ROOM t2 
		                  where t2.zh_label=t1.equiproom_id)
		  and isNotNull(equiproom_id);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_RACKPOS');
end;
$$ language plpgsql;



--------------------------------------------------
--RM_AREA_SITE  站点是否关联机房  DIMS_SPA_03101
--------------------------------------------------
create or replace function PROC_DIMS_SPA_03101(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_SITE t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where not exists(select 1 from RM_AREA_ROOM t2 where t2.related_site=t1.int_id)
		  and not exists(select 1 from RM_AREA_ROOM t2 where t2.related_site=t1.zh_label);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_SITE');
end;
$$ language plpgsql;




------------------------------------------------------
--RM_AREA_ROOM  机房是否关联有机架位置  DIMS_SPA_03102
------------------------------------------------------
create or replace function PROC_DIMS_SPA_03102(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update RM_AREA_ROOM t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where not exists(select 1 from RM_AREA_RACKPOS t2 where t2.equiproom_id=t1.int_id)
		  and not exists(select 1 from RM_AREA_RACKPOS t2 where t2.equiproom_id=t1.zh_label)
		  and exists(select 1 from RM_AREA_SITE t2 where (t2.int_id=t1.related_site or t2.zh_label=t1.related_site) and to_number(t2.site_type)=6)
		  and to_number(equiproom_type)<>4;
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'RM_AREA_ROOM',
      'to_number(equiproom_type)<>4 and exists(select 1 from RM_AREA_SITE t2 where (t2.int_id=t1.related_site or t2.zh_label=t1.related_site) and to_number(t2.site_type)=6)');
end;
$$ language plpgsql;

----------------------------------------------------------------
--DN_LOGICAL_PORT 逻辑端口关联的上一级端口的关联性 DIMS_DN_03021
----------------------------------------------------------------
create or replace function PROC_DIMS_DN_03021(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_LOGICAL_PORT t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(relation_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.relation_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.relation_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_LOGICAL_PORT');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_BUSINESS_IP_BEAR_NET  业务信息AR（或BR/AR）设备端口的关联性  DIMS_DN_03031
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03031(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_BUSINESS_IP_BEAR_NET t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(ar_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.ar_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.ar_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_BUSINESS_IP_BEAR_NET');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_BUSINESS_IP_BEAR_NET 业务信息对接的CE设备端口的关联性 DIMS_DN_03033
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03033(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_BUSINESS_IP_BEAR_NET t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(ce_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.ce_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.ce_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_BUSINESS_IP_BEAR_NET');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_IPV4_ADDR  IPv4地址所属设备端口的关联性  DIMS_DN_03037
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03037(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_IPV4_ADDR t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(related_device_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.related_device_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.related_device_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_IPV4_ADDR');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_VLAN  Vlan绑定的设备端口的关联性  DIMS_DN_03038
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03038(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_VLAN t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(port_id) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.port_id)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.port_id);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_VLAN');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_IPV6_ADDR  IPv6地址所属设备端口的关联性  DIMS_DN_03043
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03043(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_IPV6_ADDR t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(related_device_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.related_device_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.related_device_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_IPV6_ADDR');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_BOARD  板卡子卡编号的关联性  DIMS_DN_03013
-------------------------------------------------------------------------------
/**
create or replace function PROC_DIMS_DN_03013(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_BOARD t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(master_board_number) 
		  and isNotNull(sub_board_number) 
		  and not exists(select 1 
		                   from DN_BOARD t2 
		                  where isNull(t2.master_board_number)
		                    and t2.sub_board_number=t1.sub_board_number);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_BOARD');
end;
$$ language plpgsql;
**/

-------------------------------------------------------------------------
--DN_IPV4_ADDR_SEG  IPv4地址段命名规范性核查 DIMS_DN_02004
--核查“IPv4地址段”对象，“地址段名称”在综合资源管理系统内必须包含“/”与“.”
------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_02004(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_IPV4_ADDR_SEG t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNull(ipv4_address_segment_name)
		   or ipv4_address_segment_name not like '%/%'
		   or ipv4_address_segment_name not like '%.%';
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_IPV4_ADDR_SEG');
end;
$$ language plpgsql;



-------------------------------------------------------------------------
--DN_VLAN VLAN信息VLAN_ID规范性核查  DIMS_DN_02005
--核查“VLAN”对象，“VLAN_ID”的数值是否在0-4095之间
------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_02005(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_VLAN t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where vlan_id like '%.%'
		   or to_number(vlan_id) is null
		   or to_number(vlan_id) < 0
		   or to_number(vlan_id) > 4095;
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_VLAN');
end;
$$ language plpgsql;



-------------------------------------------------------------------------
--DN_IPV6_ADDR_SEG  IPv6地址段命名规范性核查 DIMS_DN_02006 
--核查“IPv6地址段”对象，“地址段名称”在综合资源管理系统内必须包含“/”与“:”
-------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_02006(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_IPV6_ADDR_SEG t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNull(ipv6_addr_seg_name)
		   or ipv6_addr_seg_name not like '%/%'
		   or ipv6_addr_seg_name not like '%:%';
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_IPV6_ADDR_SEG');
end;
$$ language plpgsql;



-------------------------------------------------------------------------
--DN_PHYSICAL_LINK 物理链路A端数据ODF/DDF端子 DIMS_DN_02008
--“A端数据ODF/DDF端子”在综合资源管理系统内必须包含“楼”与“机房”与“ODF”
-------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_02008(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_PHYSICAL_LINK t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where a_terminal not like '%楼%'
		   or a_terminal not like '%机房%'
		   or (a_terminal not like '%DDF%' and a_terminal not like '%ODF%');
		 
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_PHYSICAL_LINK');
end;
$$ language plpgsql;



-------------------------------------------------------------------------
--DN_PHYSICAL_LINK  物理链路Z端数据ODF/DDF端子  DIMS_DN_02009
--“Z端数据ODF/DDF端子”在综合资源管理系统内必须包含“楼”与“机房”与“ODF”
-------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_02009(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_PHYSICAL_LINK t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where z_terminal not like '%楼%'
		   or z_terminal not like '%机房%'
		   or (z_terminal not like '%DDF%' and z_terminal not like '%ODF%');
		 
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_PHYSICAL_LINK');
end;
$$ language plpgsql;

----------------------------------------------------------------
--FB_ONU_PORT ONU端口必填字段完整性 DIMS_FB_01011 
----------------------------------------------------------------
create or replace function PROC_DIMS_FB_01011(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare
	 v_idxCode	        text;
	 v_idxName          text;
	 cur	              record;   
	 v_count	          integer;
begin
   
   --支持重复核查
   delete from dims_tm_taskItem_index where taskcode=p_taskCode and index_id=p_indexId;
		
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	  
	 --错误数据标记
   update FB_ONU_PORT t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNull(int_id)
		   or (upper(access_type) in ('FTTB','1') and isNull(related_device_id))
		   or (upper(access_type) in ('FTTB','1') and isNull(port_no))
		   or (upper(access_type) in ('FTTB','1') and isNull(port_status))
		   or isNull(qualitor)
		   or isNull(maintainor);
		   
	 --区县的指标
	 for cur in (select p_provinceCode province_code,prefecture_code,county_code,
	                    count(1)*6 amount,
	                    sum((case when isNull(int_id) then 1 else 0 end) 
	                        + (case when upper(access_type) in ('FTTB','1') and isNull(related_device_id) then 1 else 0 end) 
	                        + (case when upper(access_type) in ('FTTB','1') and isNull(port_no) then 1 else 0 end) 
	                        + (case when upper(access_type) in ('FTTB','1') and isNull(port_status) then 1 else 0 end) 
	                        + (case when isNull(qualitor) then 1 else 0 end) 
	                        + (case when isNull(maintainor) then 1 else 0 end)) errorAmount
	               from FB_ONU_PORT
	             group by prefecture_code,county_code)
	 loop
	    insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                       provinceCode,prefectureCode,countyCode,regionType,
	                                       amount,errorAmount,indexValue,creator,updater)
      values(v_idxName,v_idxCode,p_taskCode,p_indexId,
             cur.province_code,cur.prefecture_code,cur.county_code,3,
             cur.amount,cur.errorAmount,null,'db','db');
	 end loop;
	 
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

----------------------------------------------------------------
--FB_CUSTOMER  家庭客户实例-所属设备的关联性  DIMS_FB_03001
----------------------------------------------------------------
create or replace function PROC_DIMS_FB_03001(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update FB_CUSTOMER t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(related_device_id) 
		  and not exists(select 1 from FB_ONU t2 where t2.int_id=t1.related_device_id and upper(t1.related_device_type) in ('ONU','1'))
		  and not exists(select 1 from FB_SPLITTER t2 where t2.int_id=t1.related_device_id and upper(t1.related_device_type) in ('分光器','POS','SPLITTER','2'));
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'FB_CUSTOMER');
end;
$$ language plpgsql;


----------------------------------------------------------------
--FB_CUSTOMER  家庭客户实例-所属设备端口的关联性  DIMS_FB_03002'
----------------------------------------------------------------
create or replace function PROC_DIMS_FB_03002(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update FB_CUSTOMER t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(related_device_port_id) 
		  and not exists(select 1 from FB_ONU_PORT t2 where t2.int_id=t1.related_device_port_id and upper(t1.related_device_type) in ('ONU','1'))
		  and not exists(select 1 from FB_SPLITTER_PORT t2 where t2.int_id=t1.related_device_port_id and upper(t1.related_device_type) in ('分光器','POS','SPLITTER','2'));
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'FB_CUSTOMER');
end;
$$ language plpgsql;



--20190908版本修订内容
----------------------------------------------------------------
--DN_LOGICAL_PORT 逻辑端口关联的上一级端口的关联性 DIMS_DN_03021
----------------------------------------------------------------
create or replace function PROC_DIMS_DN_03021(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_LOGICAL_PORT t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(relation_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.relation_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.relation_port)
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.int_id=t1.relation_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.int_id=t1.relation_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_LOGICAL_PORT');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_BUSINESS_IP_BEAR_NET  业务信息AR（或BR/AR）设备端口的关联性  DIMS_DN_03031
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03031(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_BUSINESS_IP_BEAR_NET t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(ar_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.ar_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.ar_port)
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.int_id=t1.ar_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.int_id=t1.ar_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_BUSINESS_IP_BEAR_NET');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_BUSINESS_IP_BEAR_NET 业务信息对接的CE设备端口的关联性 DIMS_DN_03033
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03033(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_BUSINESS_IP_BEAR_NET t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(ce_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.ce_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.ce_port)
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.int_id=t1.ce_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.int_id=t1.ce_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_BUSINESS_IP_BEAR_NET');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_IPV4_ADDR  IPv4地址所属设备端口的关联性  DIMS_DN_03037
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03037(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_IPV4_ADDR t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(related_device_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.related_device_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.related_device_port)
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.int_id=t1.related_device_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.int_id=t1.related_device_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_IPV4_ADDR');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_VLAN  Vlan绑定的设备端口的关联性  DIMS_DN_03038
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03038(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_VLAN t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(port_id) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.port_id)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.port_id)
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.int_id=t1.port_id)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.int_id=t1.port_id);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_VLAN');
end;
$$ language plpgsql;



-------------------------------------------------------------------------------
--DN_IPV6_ADDR  IPv6地址所属设备端口的关联性  DIMS_DN_03043
-------------------------------------------------------------------------------
create or replace function PROC_DIMS_DN_03043(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare 
   v_idxName             varchar(100);
	 v_idxCode             varchar(100);
begin
   
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
	 
	 --错误量 
   update DN_IPV6_ADDR t1
	    set dims_col_result=(case when dims_col_result like '%'||v_idxCode||'%' then dims_col_result
			                          when dims_col_result is null then v_idxCode
																else dims_col_result||','||v_idxCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_idxName||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_idxName
																else dims_col_rtName||','||v_idxName end)
		where isNotNull(related_device_port) 
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.physical_port_name=t1.related_device_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.logical_port_name=t1.related_device_port)
		  and not exists(select 1 from DN_PHYSICAL_PORT t2 where t2.int_id=t1.related_device_port)
		  and not exists(select 1 from DN_LOGICAL_PORT t2 where t2.int_id=t1.related_device_port);
   
   perform proc_generateCommonIndexValue(p_provinceCode,p_taskCode,p_indexId,'DN_IPV6_ADDR');
end;
$$ language plpgsql;


--20191019 修订
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
    where attr.columnname in ('PROVINCE_CODE','PREFECTURE_CODE','COUNTY_CODE')
      and attr.entitytype_id=me.id
      and me.extensiontable=upper(v_extensiontable);
      
   if v_countRegionCode =3 then
      v_selectSql := 'select '''||p_provinceCode||''',prefecture_code,county_code,count(1) amount,coalesce(sum(0';
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
      v_selectSql := v_selectSql||'),0) errorAmount from '||v_extensiontable||' group by prefecture_code,county_code';
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


/*20191104 没有变化*/

/*20191110 集合类指标统计时过滤掉总量为0的*/
--3,指标集合对应的存过
create or replace function proc_checkOneIndexSet(p_provinceCode varchar,p_taskCode varchar,p_indexId integer) returns void as
$$
declare
   v_idxName          varchar(100);
	 v_idxCode          varchar(100);
begin
	 
	 --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
		
	 --支持重复核查
   delete from dims_tm_taskItem_index where taskcode=p_taskCode and index_id=p_indexId;
		
   --区县的指标:regionType=3    
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskCode,p_indexId,
	        provinceCode,prefectureCode,countyCode,3,
	        null,null,coalesce(avg(it.indexValue),0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.amount >0
	    and it.regionType=3
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
	        null,null,coalesce(avg(it.indexValue),0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.amount >0
	    and it.regionType=2
	    and it.taskcode=p_taskCode
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId
	 group by provinceCode,prefectureCode;
	 
	 --省份的指标:regionType=1
	 insert into dims_tm_taskItem_index(name,code,taskcode,index_id,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskCode,p_indexId,
	        p_provinceCode,null,null,1,
	        null,null,coalesce(avg(it.indexValue),0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.amount >0
	    and it.regionType=1
	    and it.taskcode=p_taskCode
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId;
	
   --指标值,更新指标的区域名称
   update dims_tm_taskItem_index t
      set province=(select name from dims_tm_areaCodeConfig where code=t.provinceCode and regiontype=1),
          prefecture=(select name from dims_tm_areaCodeConfig where code=t.prefectureCode and regiontype=2),
          county=(select name from dims_tm_areaCodeConfig where code=t.countyCode and regiontype=3)
    where taskcode=p_taskCode
      and index_id=p_indexId;
end;
$$ language plpgsql;


/*20191205 没有变化*/