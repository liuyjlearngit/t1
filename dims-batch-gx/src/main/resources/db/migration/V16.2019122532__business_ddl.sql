-- ----------------------------
-- Table structure for ce_assistance_reserve
-- ----------------------------
DROP TABLE IF EXISTS "ce_assistance_reserve";
CREATE TABLE "ce_assistance_reserve" (
  "int_id" varchar(500),
  "cablesegment_id" varchar(500),
  "facility_id" varchar(500),
  "cable_facility_type" varchar(500),
  "length" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_cable_fiber
-- ----------------------------
DROP TABLE IF EXISTS "ce_cable_fiber";
CREATE TABLE "ce_cable_fiber" (
  "int_id" varchar(500),
  "fibercableseg_id" varchar(500),
  "using_status" varchar(500),
  "fiber_no" varchar(500),
  "optical_fiber_mode" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_cable_segment
-- ----------------------------
DROP TABLE IF EXISTS "ce_cable_segment";
CREATE TABLE "ce_cable_segment" (
  "int_id" varchar(500),
  "cable_model" varchar(500),
  "cablesegment_level" varchar(500),
  "cable_name" varchar(500),
  "fiber_count" varchar(500),
  "long_local" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_ddf
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_ddf";
CREATE TABLE "ce_device_ddf" (
  "int_id" varchar(500),
  "rack_module_num" varchar(500),
  "rack_module_used" varchar(500),
  "height" varchar(500),
  "length" varchar(500),
  "width" varchar(500),
  "side" varchar(500),
  "installation_capacity" varchar(500),
  "capacity" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_dmt
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_dmt";
CREATE TABLE "ce_device_dmt" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_gb
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_gb";
CREATE TABLE "ce_device_gb" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_gf
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_gf";
CREATE TABLE "ce_device_gf" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_gj
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_gj";
CREATE TABLE "ce_device_gj" (
  "int_id" varchar(500),
  "related_gisaccessarea" varchar(500),
  "gj_type" varchar(500),
  "specifications" varchar(500),
  "capacity" varchar(500),
  "cm_install_capacity" varchar(500),
  "install_way_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_idf
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_idf";
CREATE TABLE "ce_device_idf" (
  "int_id" varchar(500),
  "rack_module_num" varchar(500),
  "rack_module_used" varchar(500),
  "height" varchar(500),
  "length" varchar(500),
  "width" varchar(500),
  "side" varchar(500),
  "installation_capacity" varchar(500),
  "capacity" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_jt
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_jt";
CREATE TABLE "ce_device_jt" (
  "int_id" varchar(500),
  "up_to_facility" varchar(500),
  "facility_type" varchar(500),
  "jt_type" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_obd
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_obd";
CREATE TABLE "ce_device_obd" (
  "int_id" varchar(500),
  "splitter_type" varchar(500),
  "splitter_ratio" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_device_odf
-- ----------------------------
DROP TABLE IF EXISTS "ce_device_odf";
CREATE TABLE "ce_device_odf" (
  "int_id" varchar(500),
  "rack_module_num" varchar(500),
  "rack_module_used" varchar(500),
  "sort_type" varchar(500),
  "height" varchar(500),
  "length" varchar(500),
  "width" varchar(500),
  "side" varchar(500),
  "installation_capacity" varchar(500),
  "capacity" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_facility_pole
-- ----------------------------
DROP TABLE IF EXISTS "ce_facility_pole";
CREATE TABLE "ce_facility_pole" (
  "int_id" varchar(500),
  "pole_type_id" varchar(500),
  "material_id" varchar(500),
  "height" varchar(500),
  "is_first_pole" varchar(500),
  "is_arrester" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_facility_stone
-- ----------------------------
DROP TABLE IF EXISTS "ce_facility_stone";
CREATE TABLE "ce_facility_stone" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_facility_support
-- ----------------------------
DROP TABLE IF EXISTS "ce_facility_support";
CREATE TABLE "ce_facility_support" (
  "int_id" varchar(500),
  "height" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_facility_up
-- ----------------------------
DROP TABLE IF EXISTS "ce_facility_up";
CREATE TABLE "ce_facility_up" (
  "int_id" varchar(500),
  "height" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_facility_well
-- ----------------------------
DROP TABLE IF EXISTS "ce_facility_well";
CREATE TABLE "ce_facility_well" (
  "int_id" varchar(500),
  "is_first_well" varchar(500),
  "height" varchar(500),
  "length" varchar(500),
  "width" varchar(500),
  "facility_type_id" varchar(500),
  "model_id" varchar(500),
  "wellhole_structure" varchar(500),
  "cover_num" varchar(500),
  "cover_shape_id" varchar(500),
  "cover_material_id" varchar(500),
  "have_lock_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_layingsegment_line
-- ----------------------------
DROP TABLE IF EXISTS "ce_layingsegment_line";
CREATE TABLE "ce_layingsegment_line" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_layingsegment_poleseg
-- ----------------------------
DROP TABLE IF EXISTS "ce_layingsegment_poleseg";
CREATE TABLE "ce_layingsegment_poleseg" (
  "int_id" varchar(500),
  "material" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_layingsegment_stoneseg
-- ----------------------------
DROP TABLE IF EXISTS "ce_layingsegment_stoneseg";
CREATE TABLE "ce_layingsegment_stoneseg" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_layingsegment_tubehole
-- ----------------------------
DROP TABLE IF EXISTS "ce_layingsegment_tubehole";
CREATE TABLE "ce_layingsegment_tubehole" (
  "int_id" varchar(500),
  "tubehole_no" varchar(500),
  "tubehole_status" varchar(500),
  "related_layingsegment" varchar(500),
  "parent_id" varchar(500),
  "material_id" varchar(500),
  "tubehole_type" varchar(500),
  "view_shape_id" varchar(500),
  "diameter" varchar(500),
  "tubehole_level" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_layingsegment_upseg
-- ----------------------------
DROP TABLE IF EXISTS "ce_layingsegment_upseg";
CREATE TABLE "ce_layingsegment_upseg" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_layingsegment_wallseg
-- ----------------------------
DROP TABLE IF EXISTS "ce_layingsegment_wallseg";
CREATE TABLE "ce_layingsegment_wallseg" (
  "int_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_layingsegment_wellseg
-- ----------------------------
DROP TABLE IF EXISTS "ce_layingsegment_wellseg";
CREATE TABLE "ce_layingsegment_wellseg" (
  "int_id" varchar(500),
  "length" varchar(500),
  "material" varchar(500),
  "tubehole_count" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_link_cablelink
-- ----------------------------
DROP TABLE IF EXISTS "ce_link_cablelink";
CREATE TABLE "ce_link_cablelink" (
  "int_id" varchar(500),
  "start_site_id" varchar(500),
  "end_site_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_link_fiberlink
-- ----------------------------
DROP TABLE IF EXISTS "ce_link_fiberlink";
CREATE TABLE "ce_link_fiberlink" (
  "int_id" varchar(500),
  "using_status" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_link_jumplink
-- ----------------------------
DROP TABLE IF EXISTS "ce_link_jumplink";
CREATE TABLE "ce_link_jumplink" (
  "int_id" varchar(500),
  "related_site" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_link_ocircuit
-- ----------------------------
DROP TABLE IF EXISTS "ce_link_ocircuit";
CREATE TABLE "ce_link_ocircuit" (
  "int_id" varchar(500),
  "bear_business" varchar(500),
  "business_type" varchar(500),
  "notes1" text,
  "notes2" text,
  "circuit_standard" varchar(500),
  "rate" varchar(500),
  "start_site_id" varchar(500),
  "end_site_id" varchar(500),
  "start_room_id" varchar(500),
  "end_room_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_link_ocircuitroute
-- ----------------------------
DROP TABLE IF EXISTS "ce_link_ocircuitroute";
CREATE TABLE "ce_link_ocircuitroute" (
  "int_id" varchar(500),
  "start_device_fiberport_id" varchar(500),
  "end_device_fiberport_id" varchar(500),
  "start_line_fiberport_id" varchar(500),
  "end_line_fiberport_id" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_net_ocable
-- ----------------------------
DROP TABLE IF EXISTS "ce_net_ocable";
CREATE TABLE "ce_net_ocable" (
  "int_id" varchar(500),
  "cable_type" varchar(500),
  "capacity" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_port_equipport
-- ----------------------------
DROP TABLE IF EXISTS "ce_port_equipport";
CREATE TABLE "ce_port_equipport" (
  "int_id" varchar(500),
  "port_rate" varchar(500),
  "related_equipment" varchar(500),
  "port_no" varchar(500),
  "ip_address" varchar(500),
  "subnet_mask" varchar(500),
  "net_type" varchar(500),
  "protection_group" varchar(500),
  "role" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_ware_flange
-- ----------------------------
DROP TABLE IF EXISTS "ce_ware_flange";
CREATE TABLE "ce_ware_flange" (
  "int_id" varchar(500),
  "related_odm" varchar(500),
  "linenumber" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for ce_ware_odm
-- ----------------------------
DROP TABLE IF EXISTS "ce_ware_odm";
CREATE TABLE "ce_ware_odm" (
  "int_id" varchar(500),
  "odm_type" varchar(500),
  "related_equipment_type" varchar(500),
  "shelf_id" varchar(500),
  "sort_type" varchar(500),
  "related_device_id" varchar(500),
  "face" varchar(500),
  "row_num" varchar(500),
  "column_num" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_assistance
-- ----------------------------
DROP TABLE IF EXISTS "cm_assistance";
CREATE TABLE "cm_assistance" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "res_code" varchar(500),
  "assistance_type" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "checking_person" varchar(500),
  "check_state" varchar(500),
  "cm_check_time" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_cable
-- ----------------------------
DROP TABLE IF EXISTS "cm_cable";
CREATE TABLE "cm_cable" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "cable_type" varchar(500),
  "a_object_id" varchar(500),
  "z_object_id" varchar(500),
  "a_object_type" varchar(500),
  "z_object_type" varchar(500),
  "manufacturer" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "res_code" varchar(500),
  "length" varchar(500),
  "calculated_length" varchar(500),
  "lifecycle_status" varchar(500),
  "property_right" varchar(500),
  "property_unit" varchar(500),
  "maintainor_method" varchar(500),
  "related_project" varchar(500),
  "related_supplycompany" varchar(500),
  "assets_no" varchar(500),
  "access_time" varchar(500),
  "gatherman" varchar(500),
  "gatherman_time" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "checking_person" varchar(500),
  "check_state" varchar(500),
  "cm_check_time" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_device_optic
-- ----------------------------
DROP TABLE IF EXISTS "cm_device_optic";
CREATE TABLE "cm_device_optic" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "lifecycle_status" varchar(500),
  "device_type" varchar(500),
  "floor_num" varchar(500),
  "position_on_floor" varchar(500),
  "up_to_device" varchar(500),
  "up_to_device_type" varchar(500),
  "cutin_date" varchar(500),
  "longitude" varchar(500),
  "latitude" varchar(500),
  "address" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "res_code" varchar(500),
  "alias_name" varchar(500),
  "property_right" varchar(500),
  "property_unit" varchar(500),
  "use_corp" varchar(500),
  "maintainor_method" varchar(500),
  "related_project" varchar(500),
  "related_supplycompany" varchar(500),
  "assets_no" varchar(500),
  "collection" varchar(500),
  "collection_time" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "checking_person" varchar(500),
  "check_state" varchar(500),
  "cm_check_time" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "manufacturer" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_facility
-- ----------------------------
DROP TABLE IF EXISTS "cm_facility";
CREATE TABLE "cm_facility" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "lifecycle_status" varchar(500),
  "facility_type" varchar(500),
  "property_right" varchar(500),
  "property_unit" varchar(500),
  "longitude" varchar(500),
  "latitude" varchar(500),
  "address" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "res_code" varchar(500),
  "alias_name" varchar(500),
  "use_corp" varchar(500),
  "maintainor_method" varchar(500),
  "related_project" varchar(500),
  "related_supplycompany" varchar(500),
  "assets_no" varchar(500),
  "collection" varchar(500),
  "collection_time" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "checking_person" varchar(500),
  "check_state" varchar(500),
  "cm_check_time" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_layingsegment
-- ----------------------------
DROP TABLE IF EXISTS "cm_layingsegment";
CREATE TABLE "cm_layingsegment" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "a_object_id" varchar(500),
  "z_object_id" varchar(500),
  "a_object_type" varchar(500),
  "z_object_type" varchar(500),
  "seg_type" varchar(500),
  "m_length" varchar(500),
  "res_code" varchar(500),
  "property_right" varchar(500),
  "property_unit" varchar(500),
  "lifecycle_status" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "related_project" varchar(500),
  "related_supplycompany" varchar(500),
  "assets_no" varchar(500),
  "alias_name" varchar(500),
  "collection" varchar(500),
  "collection_time" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "checking_person" varchar(500),
  "check_state" varchar(500),
  "cm_check_time" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "maintainor_method" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_link_transo
-- ----------------------------
DROP TABLE IF EXISTS "cm_link_transo";
CREATE TABLE "cm_link_transo" (
  "int_id" varchar(500),
  "zh_label" varchar(500),
  "link_type" varchar(500),
  "start_equipport_id" varchar(500),
  "end_equipport_id" varchar(500),
  "start_device_type" varchar(500),
  "start_device_id" varchar(500),
  "end_device_type" varchar(500),
  "end_device_id" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "res_code" varchar(500),
  "irms_order_code" varchar(500),
  "special_line_code" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "checking_person" varchar(500),
  "check_state" varchar(500),
  "cm_check_time" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_net
-- ----------------------------
DROP TABLE IF EXISTS "cm_net";
CREATE TABLE "cm_net" (
  "int_id" varchar(500),
  "zh_label" varchar(500),
  "alias_name" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "res_code" varchar(500),
  "long_local_id" varchar(500),
  "lifecycle_status" varchar(500),
  "property_right" varchar(500),
  "property_unit" varchar(500),
  "maintainor_method" varchar(500),
  "related_project" varchar(500),
  "related_supplycompany" varchar(500),
  "assets_no" varchar(500),
  "access_time" varchar(500),
  "gatherman" varchar(500),
  "gatherman_time" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_port_fiber
-- ----------------------------
DROP TABLE IF EXISTS "cm_port_fiber";
CREATE TABLE "cm_port_fiber" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "port_type" varchar(500),
  "port_no" varchar(500),
  "port_status" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "frame_id" varchar(500),
  "slot_id" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "checking_person" varchar(500),
  "check_state" varchar(500),
  "cm_check_time" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "related_equipment" varchar(500),
  "related_odm" varchar(500),
  "related_device" varchar(500),
  "related_device_type" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cm_ware
-- ----------------------------
DROP TABLE IF EXISTS "cm_ware";
CREATE TABLE "cm_ware" (
  "int_id" varchar(500),
  "zh_label" varchar(500),
  "ware_type" varchar(500),
  "lifecycle_status" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "res_code" varchar(500),
  "alias_name" varchar(500),
  "maintainor_method" varchar(500),
  "related_project" varchar(500),
  "related_supplycompany" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modifier" varchar(500),
  "modification_time" varchar(500),
  "access_time" varchar(500),
  "assets_no" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_accessarea_rs
-- ----------------------------
DROP TABLE IF EXISTS "cr_accessarea_rs";
CREATE TABLE "cr_accessarea_rs" (
  "int_id" varchar(500),
  "zh_label" varchar(500),
  "area_id" varchar(500),
  "entity_id" varchar(500),
  "objtype" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_cable_cable
-- ----------------------------
DROP TABLE IF EXISTS "cr_cable_cable";
CREATE TABLE "cr_cable_cable" (
  "int_id" varchar(500),
  "cable_cable_type" varchar(500),
  "zh_label" varchar(500),
  "upper_cable_id" varchar(500),
  "lower_cable_id" varchar(500),
  "device_type" varchar(500),
  "jt_id" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_cable_node
-- ----------------------------
DROP TABLE IF EXISTS "cr_cable_node";
CREATE TABLE "cr_cable_node" (
  "int_id" varchar(500),
  "cable_node_type" varchar(500),
  "zh_label" varchar(500),
  "cable_id" varchar(500),
  "port_id" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "device_id" varchar(500),
  "device_type" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_device_area
-- ----------------------------
DROP TABLE IF EXISTS "cr_device_area";
CREATE TABLE "cr_device_area" (
  "int_id" varchar(500),
  "zh_label" varchar(500),
  "device_id" varchar(500),
  "device_type" varchar(500),
  "equiproom_id" varchar(500),
  "rackposition_id" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_device_ware
-- ----------------------------
DROP TABLE IF EXISTS "cr_device_ware";
CREATE TABLE "cr_device_ware" (
  "int_id" varchar(500),
  "device_ware_type" varchar(500),
  "zh_label" varchar(500),
  "child_id" varchar(500),
  "parent_id" varchar(500),
  "device_type" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_layingsegment_cable
-- ----------------------------
DROP TABLE IF EXISTS "cr_layingsegment_cable";
CREATE TABLE "cr_layingsegment_cable" (
  "int_id" varchar(500),
  "layingseg_cable_type" varchar(500),
  "zh_label" varchar(500),
  "layingsegment_id" varchar(500),
  "cable_id" varchar(500),
  "layingsegment_type" varchar(500),
  "serial" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_link_cable
-- ----------------------------
DROP TABLE IF EXISTS "cr_link_cable";
CREATE TABLE "cr_link_cable" (
  "int_id" varchar(500),
  "link_cable_type" varchar(500),
  "zh_label" varchar(500),
  "sitefiber_id" varchar(500),
  "fiber_id" varchar(500),
  "seq" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_link_link_transo
-- ----------------------------
DROP TABLE IF EXISTS "cr_link_link_transo";
CREATE TABLE "cr_link_link_transo" (
  "int_id" varchar(500),
  "link_link_type" varchar(500),
  "zh_label" varchar(500),
  "upper_link_id" varchar(500),
  "lower_link_id" varchar(500),
  "lower_link_type" varchar(500),
  "seq" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for cr_net_entity
-- ----------------------------
DROP TABLE IF EXISTS "cr_net_entity";
CREATE TABLE "cr_net_entity" (
  "int_id" varchar(500),
  "net_entity_type" varchar(500),
  "zh_label" varchar(500),
  "net_id" varchar(500),
  "entity_id" varchar(500),
  "seq" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modification_time" varchar(500),
  "modifier" varchar(500),
  "comments" varchar(500),
  "version" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for rm_area_accessarea
-- ----------------------------
DROP TABLE IF EXISTS "rm_area_accessarea";
CREATE TABLE "rm_area_accessarea" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "parent_id" varchar(500),
  "zh_label" varchar(500),
  "alias_name" varchar(500),
  "res_code" varchar(500),
  "position_type" varchar(500),
  "lifecycle_status" varchar(500),
  "designby" varchar(500),
  "classification" varchar(500),
  "coordinate" varchar(500),
  "create_time" varchar(500),
  "creator" varchar(500),
  "modifier" varchar(500),
  "modification_time" varchar(500),
  "olt_num" varchar(500),
  "area" varchar(500),
  "length" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for rm_area_rackpos
-- ----------------------------
DROP TABLE IF EXISTS "rm_area_rackpos";
CREATE TABLE "rm_area_rackpos" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "serial" varchar(500),
  "equiproom_id" varchar(500),
  "row_id" varchar(500),
  "line_id" varchar(500),
  "using_status" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for rm_area_respoint
-- ----------------------------
DROP TABLE IF EXISTS "rm_area_respoint";
CREATE TABLE "rm_area_respoint" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "alias_name" varchar(500),
  "res_code" varchar(500),
  "res_type" varchar(500),
  "longitude" varchar(500),
  "latitude" varchar(500),
  "address" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for rm_area_room
-- ----------------------------
DROP TABLE IF EXISTS "rm_area_room";
CREATE TABLE "rm_area_room" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "china_tower_station_code" varchar(500),
  "floor_num" varchar(500),
  "position_on_floor" varchar(500),
  "property_right" varchar(500),
  "property_unit" varchar(500),
  "lifecycle_status" varchar(500),
  "cutin_date" varchar(500),
  "row_num" varchar(500),
  "column_num" varchar(500),
  "related_site" varchar(500),
  "equiproom_type" varchar(500),
  "equiproom_level" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "res_code" varchar(500),
  "alias_name" varchar(500),
  "related_gisaccessarea" varchar(500),
  "maintainor_method" varchar(500),
  "related_project" varchar(500),
  "related_supplycompany" varchar(500),
  "creator" varchar(500),
  "create_time" varchar(500),
  "modifier" varchar(500),
  "modification_time" varchar(500),
  "assets_no" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "start_row" varchar(500),
  "end_row" varchar(500),
  "start_column" varchar(500),
  "end_column" varchar(500),
  "row_direction" varchar(500),
  "column_direction" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for rm_area_site
-- ----------------------------
DROP TABLE IF EXISTS "rm_area_site";
CREATE TABLE "rm_area_site" (
  "int_id" varchar(500),
  "areacode" varchar(500),
  "zh_label" varchar(500),
  "alias_name" varchar(500),
  "res_code" varchar(500),
  "site_type" varchar(500),
  "china_tower_station_code" text,
  "address" varchar(500),
  "longitude" varchar(500),
  "latitude" varchar(500),
  "modifier" varchar(500),
  "modification_time" varchar(500),
  "qualitor" varchar(500),
  "maintainor" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "lifecycle_status" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for rm_dw
-- ----------------------------
DROP TABLE IF EXISTS "rm_dw";
CREATE TABLE "rm_dw" (
  "int_id" varchar(500),
  "zh_label" varchar(500),
  "code" varchar(500),
  "linkman" varchar(500),
  "linkway" varchar(500),
  "version" varchar(500),
  "comments" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for rm_project
-- ----------------------------
DROP TABLE IF EXISTS "rm_project";
CREATE TABLE "rm_project" (
  "int_id" varchar(500),
  "version" varchar(500),
  "code" varchar(500),
  "zh_label" varchar(500),
  "regioncode" varchar(500),
  "rsname" varchar(500),
  "originalprjname" varchar(500),
  "originalprjcode" varchar(500),
  "constructunit" varchar(500),
  "principal" varchar(500),
  "designer" varchar(500),
  "designcode" varchar(500),
  "taskno" varchar(500),
  "consignno" varchar(500),
  "contractno" varchar(500),
  "scrutiny" varchar(500),
  "category" varchar(500),
  "guanzheng" varchar(500),
  "guangzhengcode" varchar(500),
  "ganzheng" varchar(500),
  "ganzhengcode" varchar(500),
  "startdate" varchar(500),
  "finishdate" varchar(500),
  "status" varchar(500),
  "prjname" varchar(500),
  "prjcode" varchar(500),
  "drawingno" varchar(500),
  "influence" varchar(500),
  "prjdesc" varchar(500),
  "prjtype" varchar(500),
  "prjmap" varchar(500),
  "prjfeedback" varchar(500),
  "gatherman" varchar(500),
  "gatherdate" varchar(500),
  "prechecktime" varchar(500),
  "firstchecktime" varchar(500),
  "endchecktime" varchar(500),
  "prjfinishedman" varchar(500),
  "prjfinishedtime" varchar(500),
  "comments" varchar(500),
  "parent_project" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "user";
CREATE TABLE "user" (
  "int_id" varchar(500),
  "user_id" varchar(500),
  "username" varchar(500),
  "username_zh" varchar(500),
  "email" varchar(500),
  "phone" varchar(500),
  "dept_name" varchar(500),
  "level" varchar(500),
  "parent_dept" varchar(500),
  "password" varchar(500),
  "create_time" varchar(500),
  "old_user" varchar(500),
  "is_deleted" varchar(500),
  "unlocked_time" varchar(500),
  "pwd_is_default" varchar(500),
  "pwd_dead_line" varchar(500),
  "remark" varchar(500),
  "operator" varchar(500),
  "operate_time" varchar(500),
  "positiondesc" varchar(500),
  "dims_col_result" text,
  "dims_col_rtname" text
)
;

-- ----------------------------
-- Indexes structure for table ce_assistance_reserve
-- ----------------------------
CREATE INDEX "idx_ce_assistance_reserve2int" ON "ce_assistance_reserve" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_cable_fiber
-- ----------------------------
CREATE INDEX "idx_ce_cable_fiber2fibercableseg_id" ON "ce_cable_fiber" (
  "fibercableseg_id"
);
CREATE INDEX "idx_ce_cable_fiber2int" ON "ce_cable_fiber" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_cable_segment
-- ----------------------------
CREATE INDEX "idx_ce_cable_segment2int" ON "ce_cable_segment" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_ddf
-- ----------------------------
CREATE INDEX "idx_ce_device_ddf2int" ON "ce_device_ddf" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_dmt
-- ----------------------------
CREATE INDEX "idx_ce_device_dmt2int" ON "ce_device_dmt" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_gb
-- ----------------------------
CREATE INDEX "idx_ce_device_gb2int" ON "ce_device_gb" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_gf
-- ----------------------------
CREATE INDEX "idx_ce_device_gf2int" ON "ce_device_gf" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_gj
-- ----------------------------
CREATE INDEX "idx_ce_device_gj2int" ON "ce_device_gj" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_idf
-- ----------------------------
CREATE INDEX "idx_ce_device_idf2int" ON "ce_device_idf" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_jt
-- ----------------------------
CREATE INDEX "idx_ce_device_jt2int" ON "ce_device_jt" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_obd
-- ----------------------------
CREATE INDEX "idx_ce_device_obd2int" ON "ce_device_obd" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_device_odf
-- ----------------------------
CREATE INDEX "idx_ce_device_odf2int" ON "ce_device_odf" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_facility_pole
-- ----------------------------
CREATE INDEX "idx_ce_facility_pole2int" ON "ce_facility_pole" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_facility_stone
-- ----------------------------
CREATE INDEX "idx_ce_facility_stone2int" ON "ce_facility_stone" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_facility_support
-- ----------------------------
CREATE INDEX "idx_ce_facility_support2int" ON "ce_facility_support" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_facility_up
-- ----------------------------
CREATE INDEX "idx_ce_facility_up2int" ON "ce_facility_up" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_facility_well
-- ----------------------------
CREATE INDEX "idx_ce_facility_well2int" ON "ce_facility_well" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_layingsegment_line
-- ----------------------------
CREATE INDEX "idx_ce_layingsegment_line2int" ON "ce_layingsegment_line" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_layingsegment_poleseg
-- ----------------------------
CREATE INDEX "idx_ce_layingsegment_poleseg2int" ON "ce_layingsegment_poleseg" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_layingsegment_stoneseg
-- ----------------------------
CREATE INDEX "idx_ce_layingsegment_stoneseg2int" ON "ce_layingsegment_stoneseg" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_layingsegment_tubehole
-- ----------------------------
CREATE INDEX "idx_ce_layingsegment_tubehole2int" ON "ce_layingsegment_tubehole" (
  "int_id"
);
CREATE INDEX "idx_ce_layingsegment_tubehole2parent_id" ON "ce_layingsegment_tubehole" (
  "parent_id"
);
CREATE INDEX "idx_ce_layingsegment_tubehole2related_layingsegment" ON "ce_layingsegment_tubehole" (
  "related_layingsegment"
);

-- ----------------------------
-- Indexes structure for table ce_layingsegment_upseg
-- ----------------------------
CREATE INDEX "idx_ce_layingsegment_upseg2int" ON "ce_layingsegment_upseg" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_layingsegment_wallseg
-- ----------------------------
CREATE INDEX "idx_ce_layingsegment_wallseg2int" ON "ce_layingsegment_wallseg" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_layingsegment_wellseg
-- ----------------------------
CREATE INDEX "idx_ce_layingsegment_wellseg2int" ON "ce_layingsegment_wellseg" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_link_cablelink
-- ----------------------------
CREATE INDEX "idx_ce_link_cablelink2int" ON "ce_link_cablelink" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_link_fiberlink
-- ----------------------------
CREATE INDEX "idx_ce_link_fiberlink2int" ON "ce_link_fiberlink" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_link_jumplink
-- ----------------------------
CREATE INDEX "idx_ce_link_jumplink2int" ON "ce_link_jumplink" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_link_ocircuit
-- ----------------------------
CREATE INDEX "idx_ce_link_ocircuit2int" ON "ce_link_ocircuit" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_link_ocircuitroute
-- ----------------------------
CREATE INDEX "idx_ce_link_ocircuitroute2int" ON "ce_link_ocircuitroute" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_net_ocable
-- ----------------------------
CREATE INDEX "idx_ce_net_ocable2int" ON "ce_net_ocable" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_port_equipport
-- ----------------------------
CREATE INDEX "idx_ce_port_equipport2int" ON "ce_port_equipport" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table ce_ware_flange
-- ----------------------------
CREATE INDEX "idx_ce_ware_flange2int" ON "ce_ware_flange" (
  "int_id"
);
create index if not exists idx_CE_WARE_FLANGE2related_odm on CE_WARE_FLANGE(related_odm);
-- ----------------------------
-- Indexes structure for table ce_ware_odm
-- ----------------------------
CREATE INDEX "idx_ce_ware_odm2int" ON "ce_ware_odm" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table cm_assistance
-- ----------------------------
CREATE INDEX "idx_cm_assistance2int" ON "cm_assistance" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table cm_cable
-- ----------------------------
CREATE INDEX "idx_cm_cable2a_object_id" ON "cm_cable" (
  "a_object_id"
);
CREATE INDEX "idx_cm_cable2int" ON "cm_cable" (
  "int_id"
);
CREATE INDEX "idx_cm_cable2z_object_id" ON "cm_cable" (
  "z_object_id"
);
CREATE INDEX "idx_cm_cable2zh_label" ON "cm_cable" (
  "zh_label"
);

-- ----------------------------
-- Indexes structure for table cm_device_optic
-- ----------------------------
CREATE INDEX "idx_cm_device2zh_label" ON "cm_device_optic" (
  "zh_label"
);
CREATE INDEX "idx_cm_device_optic2int" ON "cm_device_optic" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table cm_facility
-- ----------------------------
CREATE INDEX "idx_cm_facility2int" ON "cm_facility" (
  "int_id"
);
CREATE INDEX "idx_cm_facility2zh_label" ON "cm_facility" (
  "zh_label"
);

-- ----------------------------
-- Indexes structure for table cm_layingsegment
-- ----------------------------
CREATE INDEX "idx_cm_layingsegment2a_object_id" ON "cm_layingsegment" (
  "a_object_id"
);
CREATE INDEX "idx_cm_layingsegment2int" ON "cm_layingsegment" (
  "int_id"
);
CREATE INDEX "idx_cm_layingsegment2z_object_id" ON "cm_layingsegment" (
  "z_object_id"
);
CREATE INDEX "idx_cm_layingsegment2zh_label" ON "cm_layingsegment" (
  "zh_label"
);

-- ----------------------------
-- Indexes structure for table cm_link_transo
-- ----------------------------
CREATE INDEX "idx_cm_link_transo2end_equipport_id" ON "cm_link_transo" (
  "end_equipport_id"
);
CREATE INDEX "idx_cm_link_transo2int" ON "cm_link_transo" (
  "int_id"
);
CREATE INDEX "idx_cm_link_transo2start_equipport_id" ON "cm_link_transo" (
  "start_equipport_id"
);
CREATE INDEX "idx_cm_link_transo2zh_label" ON "cm_link_transo" (
  "zh_label"
);

-- ----------------------------
-- Indexes structure for table cm_net
-- ----------------------------
CREATE INDEX "idx_cm_net2int" ON "cm_net" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table cm_port_fiber
-- ----------------------------
CREATE INDEX "idx_cm_port_fiber2int" ON "cm_port_fiber" (
  "int_id"
);
CREATE INDEX "idx_cm_port_fiber2related_device" ON "cm_port_fiber" (
  "related_device"
);
CREATE INDEX "idx_cm_port_fiber2related_equipment" ON "cm_port_fiber" (
  "related_equipment"
);
CREATE INDEX "idx_cm_port_fiber2related_odm" ON "cm_port_fiber" (
  "related_odm"
);
CREATE INDEX "idx_cm_port_fiber2zh_label" ON "cm_port_fiber" (
  "zh_label"
);

-- ----------------------------
-- Indexes structure for table cm_ware
-- ----------------------------
CREATE INDEX "idx_cm_ware2int" ON "cm_ware" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table cr_accessarea_rs
-- ----------------------------
CREATE INDEX "idx_cr_accessarea_rs2int" ON "cr_accessarea_rs" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table cr_cable_cable
-- ----------------------------
CREATE INDEX "idx_cr_cable_cable2int" ON "cr_cable_cable" (
  "int_id"
);
CREATE INDEX "idx_cr_cable_cable2lower" ON "cr_cable_cable" (
  "lower_cable_id"
);
CREATE INDEX "idx_cr_cable_cable2upper" ON "cr_cable_cable" (
  "upper_cable_id"
);

-- ----------------------------
-- Indexes structure for table cr_cable_node
-- ----------------------------
CREATE INDEX "idx_cr_cable_node2cable_id" ON "cr_cable_node" (
  "cable_id"
);
CREATE INDEX "idx_cr_cable_node2int" ON "cr_cable_node" (
  "int_id"
);
CREATE INDEX "idx_cr_cable_node2port_id" ON "cr_cable_node" (
  "port_id"
);

-- ----------------------------
-- Indexes structure for table cr_device_area
-- ----------------------------
CREATE INDEX "idx_cr_device_area2int" ON "cr_device_area" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table cr_device_ware
-- ----------------------------
CREATE INDEX "idx_cr_device_ware2child_id" ON "cr_device_ware" (
  "child_id"
);
CREATE INDEX "idx_cr_device_ware2int" ON "cr_device_ware" (
  "int_id"
);
CREATE INDEX "idx_cr_device_ware2parent_id" ON "cr_device_ware" (
  "parent_id"
);

-- ----------------------------
-- Indexes structure for table cr_layingsegment_cable
-- ----------------------------
CREATE INDEX "idx_cr_layingsegment_cable2cable_id" ON "cr_layingsegment_cable" (
  "cable_id"
);
CREATE INDEX "idx_cr_layingsegment_cable2int" ON "cr_layingsegment_cable" (
  "int_id"
);
CREATE INDEX "idx_cr_layingsegment_cable2layingsegment_id" ON "cr_layingsegment_cable" (
  "layingsegment_id"
);

-- ----------------------------
-- Indexes structure for table cr_link_cable
-- ----------------------------
CREATE INDEX "idx_cr_link_cable2int" ON "cr_link_cable" (
  "int_id"
);
CREATE INDEX "idx_cr_link_cable2sitefiber_id" ON "cr_link_cable" (
  "sitefiber_id"
);

-- ----------------------------
-- Indexes structure for table cr_link_link_transo
-- ----------------------------
CREATE INDEX "idx_cr_link_link_transo2int" ON "cr_link_link_transo" (
  "int_id"
);
CREATE INDEX "idx_cr_link_link_transo2lower_link_id" ON "cr_link_link_transo" (
  "lower_link_id"
);
CREATE INDEX "idx_cr_link_link_transo2upper_link_id" ON "cr_link_link_transo" (
  "upper_link_id"
);

-- ----------------------------
-- Indexes structure for table cr_net_entity
-- ----------------------------
CREATE INDEX "idx_cr_net_entity2int" ON "cr_net_entity" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table rm_area_accessarea
-- ----------------------------
CREATE INDEX "idx_rm_area_accessarea2int" ON "rm_area_accessarea" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table rm_area_rackpos
-- ----------------------------
CREATE INDEX "idx_rm_area_rackpos2int" ON "rm_area_rackpos" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table rm_area_respoint
-- ----------------------------
CREATE INDEX "idx_rm_area_respoint2int" ON "rm_area_respoint" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table rm_area_room
-- ----------------------------
CREATE INDEX "idx_rm_area_room2int" ON "rm_area_room" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table rm_area_site
-- ----------------------------
CREATE INDEX "idx_rm_area_site2int" ON "rm_area_site" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table rm_dw
-- ----------------------------
CREATE INDEX "idx_rm_dw2int" ON "rm_dw" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table rm_project
-- ----------------------------
CREATE INDEX "idx_rm_project2int" ON "rm_project" (
  "int_id"
);

-- ----------------------------
-- Indexes structure for table user
-- ----------------------------
CREATE INDEX "idx_user2int" ON "user" (
  "int_id"
);


-- ----------------------------
-- Function structure for func_checklayingsegmentlength
-- ----------------------------
DROP FUNCTION IF EXISTS "func_checklayingsegmentlength"("p_aobjectid" anyelement, "p_aobjecttype" anyelement, "p_zobjectid" anyelement, "p_zobjecttype" anyelement, "p_length" anyelement);
CREATE OR REPLACE FUNCTION "func_checklayingsegmentlength"("p_aobjectid" anyelement, "p_aobjecttype" anyelement, "p_zobjectid" anyelement, "p_zobjecttype" anyelement, "p_length" anyelement)
  RETURNS "bool" AS $$
declare
    v_aObjectType integer;
    v_zObjectType integer;
		v_length      numeric;																					 
		v_aX          numeric;
		v_aY          numeric;
		v_zX          numeric;
		v_zY          numeric;
		v_calLength   numeric;
begin
   
	  /**
	   敷设段端点类型pipelineEndType	
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点 seg_type=v_segtype
	  **/
		
	 v_length := to_number(p_length);
	 if v_length is null or v_length =0 then
	    return false;
	 end if;
		
	 --A端
	 v_aObjectType := to_number(p_aObjectType);
   if v_aObjectType between 0 and 8 then
	    select to_number(longitude),to_number(latitude) 
			  into v_aX,v_aY 
				from CM_DEVICE_OPTIC 
			 where int_id=p_aObjectId;
	 elsif v_aObjectType between 9 and 13 then
	    select to_number(longitude),to_number(latitude) 
			  into v_aX,v_aY 
				from CM_FACILITY 
			 where int_id=p_aObjectId;
	 elsif v_aObjectType = 14 then
	    select to_number(longitude),to_number(latitude) 
			  into v_aX,v_aY 
				from RM_AREA_SITE 
			 where int_id=p_aObjectId;
	 elsif v_aObjectType =15 then
	    select to_number(longitude),to_number(latitude) 
			  into v_aX,v_aY 
				from RM_AREA_RESPOINT 
			 where int_id=p_aObjectId;
	 end if;
	 
	 if v_aX is null or v_aY is null then
	    return false;
	 end if;
	 
	 --Z端
	 v_zObjectType := to_number(p_zObjectType);
   if v_zObjectType between 0 and 8 then
	    select to_number(longitude),to_number(latitude) 
			  into v_zX,v_zY 
				from CM_DEVICE_OPTIC 
			 where int_id=p_zObjectId;
	 elsif v_zObjectType between 9 and 13 then
	    select to_number(longitude),to_number(latitude) 
			  into v_zX,v_zY 
				from CM_FACILITY 
			 where int_id=p_zObjectId;
	 elsif v_zObjectType = 14 then
	    select to_number(longitude),to_number(latitude) 
			  into v_zX,v_zY 
				from RM_AREA_SITE 
			 where int_id=p_zObjectId;
	 elsif v_zObjectType =15 then
	    select to_number(longitude),to_number(latitude) 
			  into v_zX,v_zY 
				from RM_AREA_RESPOINT 
			 where int_id=p_zObjectId;
	 end if;
	 
	 if v_zX is null or v_zY is null then
	    return false;
	 end if;
	 
	 --计算长度
	 v_calLength := func_getDistance(v_aX,v_aY,v_zX,v_zY);
	 if v_calLength = 0 or v_calLength is null then
	    return false;
	 end if;
	 
	 if (v_length/v_calLength) > 2 then
	    return false;
	 end if;
   
	 return true;
exception when others then
   return false;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_fibernoiscontinuousforfiberlink
-- ----------------------------
DROP FUNCTION IF EXISTS "func_fibernoiscontinuousforfiberlink"("p_fiberlinkid" text);
CREATE OR REPLACE FUNCTION "func_fibernoiscontinuousforfiberlink"("p_fiberlinkid" text)
  RETURNS "text" AS $$
declare
   Const_0            varchar(3) := 0;
   cur                record;
   v_priorSeq	        numeric;
begin

	 for cur in (select to_number(seq) seq
							   from CR_LINK_CABLE
							  where link_cable_type=Const_0 --链路缆线关系类型linkCableType:0,纤芯与局向光纤关系
							    and sitefiber_id=p_fiberLinkId
							 order by 1)
	 loop
	    if cur.seq is null then
	       return '序号有空值或者非数字';
	    end if;

	    if v_priorSeq is not null and (cur.seq-v_priorSeq)<>1::numeric then
	       return '序号不连续';
	    end if;

	    v_priorSeq := cur.seq;
	 end loop;

	 if v_priorSeq is null then
	    return '局向光纤不关联纤芯';
	 end if;

	 return null;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_getcreatetablesql
-- ----------------------------
DROP FUNCTION IF EXISTS "func_getcreatetablesql"("p_entitytypeid" int4);
CREATE OR REPLACE FUNCTION "func_getcreatetablesql"("p_entitytypeid" int4)
  RETURNS "text" AS $$
declare
   v_tableName   varchar(50);
   v_sql  	     text;
	 cur    	     record;
begin

   select extensiontable into v_tableName from dims_mm_entitytype where id=p_entitytypeId;
   v_sql := 'create table '||v_tableName ||'(';
   for cur in (select * from dims_mm_attributetype where entitytype_id=p_entitytypeId order by id)
	 loop
	    if upper(cur.columnname) in ('NOTES1','NOTES2','CHINA_TOWER_STATION_CODE') then
	       v_sql := v_sql||cur.columnname||' text,';
	    else
	       v_sql := v_sql||cur.columnname||' varchar(500),';
	    end if;
	 end loop;
	 
	 v_sql := substr(v_sql,1,length(v_sql)-1);
	 v_sql :=v_sql||');';
	 return v_sql;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_getdistance
-- ----------------------------
DROP FUNCTION IF EXISTS "func_getdistance"("p_ax" numeric, "p_ay" numeric, "p_zx" numeric, "p_zy" numeric);
CREATE OR REPLACE FUNCTION "func_getdistance"("p_ax" numeric, "p_ay" numeric, "p_zx" numeric, "p_zy" numeric)
  RETURNS "numeric" AS $$
declare
  v_lngA    numeric;
	v_latA    numeric; 
	v_lngB    numeric;
	v_latB    numeric;
	v_a       numeric; 
	v_b       numeric;
	v_s       numeric;
	v_radius  numeric := 6378.137;--地球半径
	
begin
   
   --经纬度转化为弧度(rad)
   v_lngA := (p_aX * pi()/180.0);
   v_latA := (p_aY * pi()/180.0);
   v_lngB := (p_zX * pi()/180.0);
   v_latB := (p_zY * pi()/180.0);
	 
	 --计算两点的距离，（单位：m）
   v_a := v_latA - v_latB;
   v_b := v_lngA - v_lngB;
   v_s := 2 * asin(sqrt(pow(sin(v_a/2),2)+cos(v_latA)*cos(v_latB)*pow(sin(v_b/2),2)));
   v_s := v_s * v_radius;
   v_s := v_s *1000;
	 
	 return v_s;
end;
$$
  LANGUAGE plpgsql IMMUTABLE
  COST 100;

-- ----------------------------
-- Function structure for func_getselecttablesql
-- ----------------------------
DROP FUNCTION IF EXISTS "func_getselecttablesql"("p_entitytypeid" int4);
CREATE OR REPLACE FUNCTION "func_getselecttablesql"("p_entitytypeid" int4)
  RETURNS "text" AS $$
declare
   v_tableName   varchar(50);
   v_sql  	     text;
	 cur    	     record;
begin

   select extensiontable into v_tableName from dims_mm_entitytype where id=p_entitytypeId;
   v_sql := 'select ';
   for cur in (select * from dims_mm_attributetype where entitytype_id=p_entitytypeId order by id)
	 loop
	    v_sql := v_sql||cur.columnname||',';
	 end loop;

	 v_sql := substr(v_sql,1,length(v_sql)-1);
	 v_sql :=v_sql||' from '||v_tableName||' limit 5;';
	 return v_sql;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_iscableconnected
-- ----------------------------
DROP FUNCTION IF EXISTS "func_iscableconnected"("p_cableid" anyelement);
CREATE OR REPLACE FUNCTION "func_iscableconnected"("p_cableid" anyelement)
  RETURNS "text" AS $$
declare
   Const_1            varchar(3) := 1;
   cur               record;
	 v_onceNodeAmount  integer := 0;
begin

   --敷设端与缆线关系类型layingsegCableType:0管孔与光缆段关系,1敷设段与光缆段关系
	 for cur in (with 
							 ends as(select ls.a_object_id objectId,a_object_type objectType
	                       from CR_LAYINGSEGMENT_CABLE cr,CM_LAYINGSEGMENT ls
									      where ls.int_id=cr.layingsegment_id
									        and ls.seg_type=cr.layingSegment_Type
										      and cr.layingseg_cable_type=Const_1
										      and cr.cable_id=p_cableId
											  union all
											 select ls.z_object_id objectId,z_object_type objectType
	                       from CR_LAYINGSEGMENT_CABLE cr,CM_LAYINGSEGMENT ls
									      where ls.int_id=cr.layingsegment_id
									        and ls.seg_type=cr.layingSegment_Type
										      and cr.layingseg_cable_type=Const_1
										      and cr.cable_id=p_cableId)
							 select objectId,objectType,count(1) cnt from ends group by objectId,objectType)
	 loop
	    if isNUll(cur.objectId) or  isNull(cur.objectType) or cur.cnt >=3 then
			   return '光缆段"'||p_cableId||'"铺设不连通';
			elsif cur.cnt = 1 then
			   v_onceNodeAmount := v_onceNodeAmount + 1;
			end if;
	 end loop;
	 
	 if v_onceNodeAmount = 2 then
	    return null;
	 else
	    return '光缆段"'||p_cableId||'"铺设不连通';
	 end if;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_isfiberconnected
-- ----------------------------
DROP FUNCTION IF EXISTS "func_isfiberconnected"("p_fiberid" text);
CREATE OR REPLACE FUNCTION "func_isfiberconnected"("p_fiberid" text)
  RETURNS "text" AS $$
declare
   v_cableSegId   text;
   v_result	      text;
begin
	 select CE_CABLE_FIBER.fibercableseg_id
	   into v_cableSegId
	   from CM_CABLE,CE_CABLE_FIBER
	  where CE_CABLE_FIBER.int_id=p_fiberId
	    and CM_CABLE.int_id=p_fiberId;

	 if isNull(v_cableSegId) then
	    return '纤芯"'||p_fiberId||'"所属光缆段不存在';
	 end if;

	 --校验光缆段
	 v_result := func_isCableConnected(v_cableSegId);
	 if v_result is null then
	    return null;
	 else
	    return '纤芯"'||p_fiberId||'"-->'||v_result;
	 end if;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_isfiberlinkconnected
-- ----------------------------
DROP FUNCTION IF EXISTS "func_isfiberlinkconnected"("p_fiberlinkid" text, "p_ismultilevel" bool);
CREATE OR REPLACE FUNCTION "func_isfiberlinkconnected"("p_fiberlinkid" text, "p_ismultilevel" bool)
  RETURNS "text" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   cur                record;
	 v_onceNodeAmount   integer := 0;
	 v_aPortId	        text;
	 v_zPortId	        text;
	 v_count	          integer;
	 v_result	          text;

begin

	 select start_equipport_id,end_equipport_id
	   into v_aPortId,v_zPortId
	   from CM_LINK_TRANSO
	  where int_id=p_fiberLinkId;

	 if isNull(v_aPortId) or isNull(v_zPortId) then
	    return '局向光纤"'||p_fiberLinkId||'"两端(一端)端口为空';
	 end if;

	 --链路缆线关系类型linkCableType:0纤芯与局向光纤关系
	 select count(1)
	   into v_count
	   from CR_LINK_CABLE
	  where link_cable_type=Const_0
	    and sitefiber_id=p_fiberLinkId;

	 --缆线类型cable_type:0光缆段,1纤芯
	 if v_count =0 then
	    return '局向光纤"'||p_fiberLinkId||'"未关联纤芯';
	 elsif v_count=1 then
	    select count(distinct CR_CABLE_NODE.port_id)
	      into v_count
	      from CR_LINK_CABLE,CM_CABLE,CR_CABLE_NODE
	     where CR_CABLE_NODE.port_id in (v_aPortId,v_zPortId)
	       and CR_CABLE_NODE.cable_id=CM_CABLE.int_id
	       and CM_CABLE.cable_type=Const_1
	       and CM_CABLE.int_id=CR_LINK_CABLE.fiber_id
	       and CR_LINK_CABLE.link_cable_type=Const_0
	       and CR_LINK_CABLE.sitefiber_id=p_fiberLinkId;
	    if v_count <> 2 then
	       return '局向光纤"'||p_fiberLinkId||'"关联的"纤芯+纤芯熔接+纤芯成端"不连通';
	    end if;
	 else
	    for cur in(select fiber.cable_type,
	                      (select count(1)
	                         from CR_CABLE_CABLE rcc
	                        where rcc.upper_cable_id=fiber.int_id
	                           or rcc.lower_cable_id=fiber.int_id) cnt,
	                      (select port_id from CR_CABLE_NODE where cable_id=fiber.int_id limit 1) portId
	                 from CR_LINK_CABLE r,CM_CABLE fiber
	                where fiber.cable_type=Const_1
	                  and fiber.int_id=r.fiber_id
	                  and r.link_cable_type=Const_0
	                  and r.sitefiber_id=p_fiberLinkId)
	    loop
	       if isNull(cur.cable_type) or cur.cable_type <> Const_1 then
	          return '局向光纤"'||p_fiberLinkId||'"关联的"纤芯+纤芯熔接+纤芯成端"不连通';
	       elsif cur.cnt not in (1,2) then
	          return '局向光纤"'||p_fiberLinkId||'"关联的"纤芯+纤芯熔接+纤芯成端"不连通';
	       elsif cur.cnt =2 and isNotNull(cur.portId) then
	          return '局向光纤"'||p_fiberLinkId||'"关联的"纤芯+纤芯熔接+纤芯成端"不连通';
	       elsif cur.cnt =1 and isNull(cur.portId) then
	          return '局向光纤"'||p_fiberLinkId||'"关联的"纤芯+纤芯熔接+纤芯成端"不连通';
	       elsif cur.cnt =1 and cur.portId not in (v_aPortId,v_zPortId) then
	          return '局向光纤"'||p_fiberLinkId||'"关联的"纤芯+纤芯熔接+纤芯成端"不连通';
	       elsif cur.cnt =1 then
	          v_onceNodeAmount := v_onceNodeAmount + 1;
	       end if;
	    end loop;

	    if v_onceNodeAmount <> 2 then
	  		 return '局向光纤"'||p_fiberLinkId||'"关联的"纤芯+纤芯熔接+纤芯成端"不连通';
	    end if;
   end if;

   --校验下面的纤芯
   if p_isMultilevel then
		  for cur in(select fiber.int_id
			             from CR_LINK_CABLE r,CM_CABLE fiber
			            where fiber.cable_type=Const_1
			              and fiber.int_id=r.fiber_id
			              and r.link_cable_type=Const_0
			              and r.sitefiber_id=p_fiberLinkId)
			loop
			   v_result := func_isFiberConnected(cur.int_id);
			   if v_result is not null then
			      return '局向光纤"'||p_fiberLinkId||'"-->'||v_result;
			   end if;
		   end loop;
   end if;

   return null;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_isocircuitconnected
-- ----------------------------
DROP FUNCTION IF EXISTS "func_isocircuitconnected"("p_opticid" text, "p_ismultilevel" bool);
CREATE OR REPLACE FUNCTION "func_isocircuitconnected"("p_opticid" text, "p_ismultilevel" bool)
  RETURNS "text" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_4            varchar(3) := 4;
   cur                record;
   v_circuitStandard  integer;
	 v_onceNodeAmount   integer := 0;
	 v_fiberLinkCount   integer := 0;
	 v_result           text;
begin

	 select to_number(circuit_standard)
	   into v_circuitStandard
	   from CE_LINK_OCIRCUIT
	  where int_id=p_opticId;

	 if v_circuitStandard is null then
	    return '"光路规格"为空';
	 elsif v_circuitStandard not in (0,1,2) then
	    return '"光路规格"不在字典范围内';
	 end if;

	 ----链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
	 for cur in (with
	             ends as(select CM_LINK_TRANSO.start_equipport_id portId
	                       from CR_LINK_LINK_TRANSO r1,CR_LINK_LINK_TRANSO r2,CM_LINK_TRANSO
	                      where (CM_LINK_TRANSO.link_type=Const_1
	                              or (CM_LINK_TRANSO.link_type=Const_4
	                                   and isNotNull(CM_LINK_TRANSO.start_device_type)
	                                   and isNotNull(CM_LINK_TRANSO.end_device_type)))
	                        and CM_LINK_TRANSO.int_id=r2.lower_link_id
	                        and r2.link_Link_Type=Const_0-- 链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系
	                        and r2.upper_link_id=r1.lower_link_id
	                        and r1.link_Link_Type=Const_2 --链路链路关系类型linkLinkType:2,光路与光路路由关系
	                        and r1.upper_link_id=p_opticId
	                     union all
	                     select CM_LINK_TRANSO.end_equipport_id portId
	                       from CR_LINK_LINK_TRANSO r1,CR_LINK_LINK_TRANSO r2,CM_LINK_TRANSO
	                      where (CM_LINK_TRANSO.link_type=Const_1
	                              or (CM_LINK_TRANSO.link_type=Const_4
	                                   and isNotNull(CM_LINK_TRANSO.start_device_type)
	                                   and isNotNull(CM_LINK_TRANSO.end_device_type)))
	                        and CM_LINK_TRANSO.int_id=r2.lower_link_id
	                        and r2.link_Link_Type=Const_0-- 链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系
	                        and r2.upper_link_id=r1.lower_link_id
	                        and r1.link_Link_Type=Const_2 --链路链路关系类型linkLinkType:2,光路与光路路由关系
	                        and r1.upper_link_id=p_opticId)
	             select portId,count(1) cnt from ends group by portId)
	 loop
	    if isNull(cur.portId) or cur.cnt >=3 then
			   return '光路关联的"局向光纤+硬跳"不连通';
			elsif cur.cnt = 1 then
			   v_onceNodeAmount := v_onceNodeAmount + 1;
			end if;
	 end loop;

	 --光路规格circuitStandard:0单芯,1双芯,2四芯
	if v_onceNodeAmount <> (case v_circuitStandard when 0 then 2 when 1 then 4 when 2 then 8 else -1 end)then
	    return '光路关联的"局向光纤+硬跳"不连通';
	 end if;

	 --校验局向光纤
	 for cur in (select CM_LINK_TRANSO.int_id
	               from CR_LINK_LINK_TRANSO r1,CR_LINK_LINK_TRANSO r2,CM_LINK_TRANSO
	              where CM_LINK_TRANSO.link_type=Const_1  --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
	                and CM_LINK_TRANSO.int_id=r2.lower_link_id
	                and r2.link_Link_Type=Const_0-- 链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系
	                and r2.upper_link_id=r1.lower_link_id
	                and r1.link_Link_Type=Const_2 --链路链路关系类型linkLinkType:2,光路与光路路由关系
	                and r1.upper_link_id=p_opticId)
	 loop
	    v_fiberLinkCount := v_fiberLinkCount + 1;
	    if p_isMultilevel then
		     v_result := func_isFiberLinkConnected(cur.int_id,p_isMultilevel);
		     if v_result is not null then
		        return v_result;
		     end if;
	    end if;
	 end loop;

	 if v_fiberLinkCount < (case v_circuitStandard when 0 then 1 when 1 then 2 when 2 then 4 else 999 end) then
	    return '光路关联的"局向光纤+硬跳"不连通';
	 end if;

	 return null;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for func_isocircuitconnected
-- ----------------------------
DROP FUNCTION IF EXISTS "func_isocircuitconnected"("p_opticid" text);
CREATE OR REPLACE FUNCTION "func_isocircuitconnected"("p_opticid" text)
  RETURNS "text" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_4            varchar(3) := 4;
   cur                record;
   v_circuitStandard  integer;
	 v_onceNodeAmount   integer := 0;
	 v_fiberLinkCount   integer := 0;
	 v_result           text;
begin

	 select to_number(circuit_standard)
	   into v_circuitStandard
	   from CE_LINK_OCIRCUIT
	  where int_id=p_opticId;

	 if v_circuitStandard is null then
	    return '"光路规格"为空';
	 elsif v_circuitStandard not in (0,1,2) then
	    return '"光路规格"不在字典范围内';
	 end if;

	 ----链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
	 for cur in (with
	             ends as(select CM_LINK_TRANSO.start_equipport_id portId
	                       from CR_LINK_LINK_TRANSO r1,CR_LINK_LINK_TRANSO r2,CM_LINK_TRANSO
	                      where (CM_LINK_TRANSO.link_type=Const_1
	                              or (CM_LINK_TRANSO.link_type=Const_4
	                                   and isNotNull(CM_LINK_TRANSO.start_device_type)
	                                   and isNotNull(CM_LINK_TRANSO.end_device_type)))
	                        and CM_LINK_TRANSO.int_id=r2.lower_link_id
	                        and r2.link_Link_Type=Const_0-- 链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系
	                        and r2.upper_link_id=r1.lower_link_id
	                        and r1.link_Link_Type=Const_2 --链路链路关系类型linkLinkType:2,光路与光路路由关系
	                        and r1.upper_link_id=p_opticId
	                     union all
	                     select CM_LINK_TRANSO.end_equipport_id portId
	                       from CR_LINK_LINK_TRANSO r1,CR_LINK_LINK_TRANSO r2,CM_LINK_TRANSO
	                      where (CM_LINK_TRANSO.link_type=Const_1
	                              or (CM_LINK_TRANSO.link_type=Const_4
	                                   and isNotNull(CM_LINK_TRANSO.start_device_type)
	                                   and isNotNull(CM_LINK_TRANSO.end_device_type)))
	                        and CM_LINK_TRANSO.int_id=r2.lower_link_id
	                        and r2.link_Link_Type=Const_0-- 链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系
	                        and r2.upper_link_id=r1.lower_link_id
	                        and r1.link_Link_Type=Const_2 --链路链路关系类型linkLinkType:2,光路与光路路由关系
	                        and r1.upper_link_id=p_opticId)
	             select portId,count(1) cnt from ends group by portId)
	 loop
	    if isNull(cur.portId) or cur.cnt >=3 then
			   return '光路关联的"局向光纤+硬跳"不连通';
			elsif cur.cnt = 1 then
			   v_onceNodeAmount := v_onceNodeAmount + 1;
			end if;
	 end loop;

	 --光路规格circuitStandard:0单芯,1双芯,2四芯
	if v_onceNodeAmount <> (case v_circuitStandard when 0 then 2 when 1 then 4 when 2 then 8 else -1 end)then
	    return '光路关联的"局向光纤+硬跳"不连通';
	 end if;

	 --校验局向光纤
	 for cur in (select CM_LINK_TRANSO.int_id
	               from CR_LINK_LINK_TRANSO r1,CR_LINK_LINK_TRANSO r2,CM_LINK_TRANSO
	              where CM_LINK_TRANSO.link_type=Const_1  --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
	                and CM_LINK_TRANSO.int_id=r2.lower_link_id
	                and r2.link_Link_Type=Const_0-- 链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系
	                and r2.upper_link_id=r1.lower_link_id
	                and r1.link_Link_Type=Const_2 --链路链路关系类型linkLinkType:2,光路与光路路由关系
	                and r1.upper_link_id=p_opticId)
	 loop
	    v_fiberLinkCount := v_fiberLinkCount + 1;
	    v_result := func_isFiberLinkConnected(cur.int_id);
	    if v_result is not null then
	       return v_result;
	    end if;
	 end loop;

	 if v_fiberLinkCount < (case v_circuitStandard when 0 then 1 when 1 then 2 when 2 then 4 else 999 end) then
	    return '光路关联的"局向光纤+硬跳"不连通';
	 end if;

	 return null;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for isnotnull
-- ----------------------------
DROP FUNCTION IF EXISTS "isnotnull"(anyelement);
CREATE OR REPLACE FUNCTION "isnotnull"(anyelement)
  RETURNS "bool" AS $$
   select isNull($1) =false;
$$
  LANGUAGE sql IMMUTABLE
  COST 100;

-- ----------------------------
-- Function structure for isnull
-- ----------------------------
DROP FUNCTION IF EXISTS "isnull"(anyelement);
CREATE OR REPLACE FUNCTION "isnull"(anyelement)
  RETURNS "bool" AS $$
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
$$
  LANGUAGE plpgsql IMMUTABLE
  COST 100;

-- ----------------------------
-- Function structure for proc_checkallcoordinateindexes
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkallcoordinateindexes"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkallcoordinateindexes"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur record;
begin

	 for cur in (select id from dims_idx_index where type=8 order by orderby)
	 loop
	    perform proc_checkOneCoordinateIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkallcriticalareacodeindexes
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkallcriticalareacodeindexes"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkallcriticalareacodeindexes"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur record;
begin

	 for cur in (select id from dims_idx_index where type=7 order by orderby)
	 loop
	    perform proc_checkOneCriticalAreaCodeIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkallcriticalnotnullindexes 
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkallcriticalnotnullindexes"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkallcriticalnotnullindexes"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur record;
begin

	 for cur in (select id from dims_idx_index where type=6 order by orderby)
	 loop
	    perform proc_checkOneCriticalNotNullIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkallmandatoryclassifiedindexes
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkallmandatoryclassifiedindexes"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkallmandatoryclassifiedindexes"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur record;
begin

	 for cur in (select id from dims_idx_index where type=5 order by orderby)
	 loop
	    perform proc_checkOneMandatoryClassifiedIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkallrelationkeyindexes
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkallrelationkeyindexes"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkallrelationkeyindexes"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur record;
begin

	 for cur in (select id from dims_idx_index where type=10 order by orderby)
	 loop
	    perform proc_checkOneRelationKeyIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkallrepeatabilityindexes
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkallrepeatabilityindexes"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkallrepeatabilityindexes"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur record;
begin

	 for cur in (select id from dims_idx_index where type=9 order by orderby)
	 loop
	    perform proc_checkOneRepeatabilityIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkdictaccuracyindex
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkdictaccuracyindex"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkdictaccuracyindex"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur                record;
begin
	 for cur in (select id From dims_idx_index where type=4 order by orderby)
	 loop
	    perform proc_checkOneDictAccuracyIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkexttableassocindex
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkexttableassocindex"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkexttableassocindex"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur record;
begin
	 for cur in (select id From dims_idx_index where type=2 order by orderby)
	 loop
	    perform proc_checkOneExtTableAssocIndex(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkindexset
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkindexset"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkindexset"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur                record;
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
begin

	 select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 for cur in (select id,name,code from dims_idx_index where type=3 and isenable=1)
	 loop
	    insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,province,
		                                     amount,errorAmount,indexValue,creator,updater)
	    select cur.name,cur.code,p_taskId,cur.id,v_collectionDate,v_province,
	           null,null,avg(it.indexValue),'db','db'
	      from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	     where it.task_id=p_taskId
	       and it.index_id=r.childIndex_id
	       and r.parentIndex_id=cur.id;
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkonecoordinateindex  type=8
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkonecoordinateindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkonecoordinateindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare 
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
	 v_idxCode	        text;
	 v_idxName          text;
	 v_extensiontable   text;
	 v_longitude_min    numeric(16,9);--经度低值
   v_longitude_max    numeric(16,9);--经度高值
   v_latitude_min     numeric(16,9);--纬度低值
   v_latitude_max     numeric(16,9); --纬度高值
	 curAttr            record;
   v_sql              text;
   v_amount   	      integer;
	 v_errorAmount      integer := 0;
	 v_indexValue       numeric(6,5);
	 
begin
   	
   select province,startTime 
	   into v_province,v_collectionDate 
		 from dims_tm_task 
		where id=p_taskId;
		
   select idx.name,idx.code,me.extensiontable
	   into v_idxName,v_idxCode,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me 
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;
      
   select longitude_min,longitude_max,latitude_min,latitude_max
     into v_longitude_min,v_longitude_max,v_latitude_min,v_latitude_max
     from dims_tm_coordinateConfig
    where province=v_province; 
    
   --没有经纬度范围配置。
   if isNull(v_longitude_min) or isNull(v_longitude_max) or isNull(v_latitude_min) or isNull(v_latitude_max) then
      update dims_tm_task 
         set failedreason=failedreason||';没有省份“'||v_province||'”的有效经纬度范围,跳过经纬度核查',
             memo=memo||';没有省份“'||v_province||'”的有效经纬度范围,跳过经纬度核查'
       where id=p_taskId;
      return;
   end if;

	 --总的行数 
	 v_sql := 'select count(1) from '||v_extensiontable;
   execute v_sql into v_amount;

   --错误量
   v_sql := 'update '||v_extensiontable ||' c
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
			   	 
   --指标值
			perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_extensiontable);

end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkonecriticalareacodeindex type=7
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkonecriticalareacodeindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkonecriticalareacodeindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare 
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
	 v_idxCode	        text;
	 v_idxName          text;
	 v_extensiontable   text;
	 curAttr            record;
   v_sql              text;
   v_areaCodeSql      text;
   v_amount   	      integer;
	 v_errorAmount      integer := 0;
	 v_indexValue       numeric(6,5);
	 
begin
   	
   select province,startTime 
	   into v_province,v_collectionDate 
		 from dims_tm_task 
		where id=p_taskId;
		
   select idx.name,idx.code,me.extensiontable
	   into v_idxName,v_idxCode,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me 
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;
   
   for curAttr in (select ma.columnName 
		                 from dims_idx_rule r,dims_mm_attributetype ma,dims_mm_entitytype me
		                where me.id=ma.entitytype_id
		                  and ma.id=r.attributeType_id
		                  and r.type =3
		                  and r.index_id=p_indexId)
	 loop
		  if v_areaCodeSql is null then
		     v_areaCodeSql := 'not exists(select 1 from dims_tm_areaCodeConfig t where t.code=c.'||curAttr.columnName||')';
		  else
		     v_areaCodeSql := v_isNullSql||' or not exists(select 1 from dims_tm_areaCodeConfig t where t.code=c.'||curAttr.columnName||')';
		  end if;
	 end loop;
	 
	 --总的行数 
	 v_sql := 'select count(1) from '||v_extensiontable;
   execute v_sql into v_amount;

   --错误量
   v_sql := 'update '||v_extensiontable ||' c
			          set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
					                                when dims_col_result is null then '''||v_idxCode||'''
							      						          else dims_col_result||'','||v_idxCode||''' end),
									  dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
					                                when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
									    					          else dims_col_rtName||'','||v_idxName||''' end)					           
						  where 1=1';

	 v_sql := v_sql||' and ('||v_areaCodeSql||')';
		 

	 execute v_sql;
   get diagnostics v_errorAmount = row_count; 
			   	 
   --指标值
			perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_extensiontable);

end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkonecriticalnotnullindex  type=6
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkonecriticalnotnullindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkonecriticalnotnullindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare 
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
	 v_idxCode	        text;
	 v_idxName          text;
	 v_entitytypeId     integer;
	 v_coretable        text;
	 v_extensionattr    text;
	 v_extensionvalue   text;
	 v_extensiontable   text;
	 curAttr            record;
   v_sql              text;
   v_isNullSql	      text;
   v_amount   	      integer;
	 v_errorAmount      integer := 0;
	 v_indexValue       numeric(6,5);
	 
begin
   	
   select province,startTime 
	   into v_province,v_collectionDate 
		 from dims_tm_task 
		where id=p_taskId;
		
   select idx.name,idx.code,idx.entitytype_id,
	        me.extensionattr,me.extensionvalue,me.extensiontable
	   into v_idxName,v_idxCode,v_entitytypeId,
	        v_extensionattr,v_extensionvalue,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me 
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;
   
   for curAttr in (select me.extensiontable tableName,ma.columnName 
		                 from dims_idx_rule r,dims_mm_attributetype ma,dims_mm_entitytype me
		                where me.id=ma.entitytype_id
		                  and ma.id=r.attributeType_id
		                  and r.type =2
		                  and r.index_id=p_indexId)
	 loop
		  v_coretable := curAttr.tableName;
		  if v_isNullSql is null then
		     v_isNullSql := 'isNull('||curAttr.columnName||')';
		  else
		     v_isNullSql := v_isNullSql||' or isNull('||curAttr.columnName||')';
		  end if;
	 end loop;
	 
	 v_sql := 'select count(1) from '||v_coretable ||' c where 1=1';
   if v_extensionAttr is not null and v_coretable <> v_extensiontable   and v_idxCode <> 'DIMS_TNO_21021'  and  v_idxCode <> 'DIMS_TNO_21024'  and v_idxCode <> 'DIMS_TNO_21027'  then
      v_sql := v_sql ||' and '||v_extensionAttr||'='''||v_extensionvalue||'''';
   end if;

   --DIMS_TNO_21023	敷设段两端不能为空
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   if v_idxCode='DIMS_TNO_21023' then
      v_sql := v_sql ||' and coalesce(seg_type,'''')<>''5''';
   end if;

   --总的行数
   execute v_sql into v_amount;

   --错误量
   v_sql := 'update '||v_coretable ||' c
			          set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
					                                when dims_col_result is null then '''||v_idxCode||'''
							      						          else dims_col_result||'','||v_idxCode||''' end),
									  dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
					                                when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
									    					          else dims_col_rtName||'','||v_idxName||''' end)
						  where 1=1';
   if v_extensionAttr is not null and v_coretable <> v_extensiontable and v_idxCode <> 'DIMS_TNO_21021'  and  v_idxCode <> 'DIMS_TNO_21024'  and v_idxCode <> 'DIMS_TNO_21027'  then
      v_sql := v_sql ||' and '||v_extensionAttr||'='''||v_extensionvalue||'''';
   end if;

   --DIMS_TNO_21023	敷设段两端不能为空
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   if v_idxCode='DIMS_TNO_21023' then
      v_sql := v_sql ||' and coalesce(seg_type,'''')<>''5''';
   end if;

	 v_sql := v_sql||' and ('||v_isNullSql||')';

	 execute v_sql;
   get diagnostics v_errorAmount = row_count;

	--指标值统计
		 if v_extensionAttr is not null and v_idxCode <> 'DIMS_TNO_21021'  and  v_idxCode <> 'DIMS_TNO_21024'  and v_idxCode <> 'DIMS_TNO_21027'  then
            perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_coretable,v_extensionAttr||'='''||v_extensionvalue||'''');
         else
			perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_coretable);
		end if;



end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkonedictaccuracyindex  type=4
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkonedictaccuracyindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkonedictaccuracyindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare
   v_idxName          text;
   v_idxCode          text;
   v_entitytypeId     integer;
   v_sql              text;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
	 v_tableName	      varchar(100);
	 v_columnName	      varchar(100);
	 v_dictTypeId	      integer;
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

   select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

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
							                    and dict.dictKey=to_number(c.'||v_columnName||'))
							  and isNotNull('||v_columnName||')';
   execute v_sql;
	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_tableName);
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkoneexttableassocindex  type=2
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkoneexttableassocindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkoneexttableassocindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare
   v_idxName          text;
   v_idxCode          text;
   v_coretable        text;
   v_extensionattr    text;
   v_extensionvalue   text;
   v_extensiontable   text;
   v_sql              text;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

   select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 select idx.name,idx.code,me.coretable,me.extensionattr,me.extensionvalue,me.extensiontable
	   into v_idxName,v_idxCode,v_coretable,v_extensionattr,v_extensionvalue,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;

   if v_coretable is null then
      v_coretable :=v_extensiontable;
   end if;

	 --总量
	 v_sql := 'select count(1) from '||v_coretable;
   if v_extensionAttr is not null then
      v_sql := v_sql ||' where '||v_extensionAttr||'='''||v_extensionvalue||'''';
   end if;
   execute v_sql into v_amount;

	--错误量
	v_sql := 'update '||v_coretable ||' c
	             set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
	                                       when dims_col_result is null then '''||v_idxCode||'''
															           else dims_col_result||'','||v_idxCode||''' end),
		  						 dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
				                                 when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
																	       else dims_col_rtName||'','||v_idxName||''' end)
						 where not exists(select 1 from '||v_extensiontable||' e where e.int_id=c.int_id)';
   if v_extensionAttr is not null then
		  v_sql := v_sql ||' and '||v_extensionAttr||'='''||v_extensionvalue||'''';
	 end if ;
	 execute v_sql;
	 get diagnostics v_errorAmount = row_count;

	 --指标值
	  perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_coretable,v_extensionAttr||'='''||v_extensionvalue||'''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkonemandatoryclassifiedindex type=5
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkonemandatoryclassifiedindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkonemandatoryclassifiedindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
	 v_idxCode	        text;
	 v_idxName          text;
	 v_entitytypeId     integer;
	 v_coretable        text;
	 v_extensionattr    text;
	 v_extensionvalue   text;
	 v_extensiontable   text;
	 curAttr            record;
   v_sql              text;
	 v_hasLifecycle	    integer;
	 v_count	          integer;
   v_amount           integer := 0;
   v_errorCount	      integer;
	 v_errorAmount      integer := 0;
	 v_indexValue       numeric(6,5);

begin

   select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

   select idx.name,idx.code,idx.entitytype_id,me.coretable,
	        me.extensionattr,me.extensionvalue,me.extensiontable
	   into v_idxName,v_idxCode,v_entitytypeId,v_coretable,
	        v_extensionattr,v_extensionvalue,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;

   if v_coretable is null then
      v_coretable := v_extensiontable;
   end if;

	 v_sql := 'select count(1) from '||v_coretable ||' c where 1=1';
   if v_extensionAttr is not null then
      v_sql := v_sql ||' and '||v_extensionAttr||'='''||v_extensionvalue||'''';
   end if;

   select count(1)
     into v_hasLifecycle
     from dims_mm_entitytype me,dims_mm_attributetype ma
    where upper(ma.columnName)=upper('lifecycle_status')
      and ma.entitytype_id=me.id
      and me.extensiontable=v_coretable;
   if v_hasLifecycle >=1 then
     ----生命周期状态	lifecycleStatus:2在网
     v_sql := v_sql ||' and lifecycle_status=''2''';
   end if;

   --管孔级别tubeholeLevel:0,主孔;1,子孔
   if v_idxCode ='DIMS_TNO_06013' then--管孔
      v_sql := v_sql ||' and exists(select 1
		                                  from CE_LAYINGSEGMENT_TUBEHOLE e
									                   where e.int_id=c.int_id
									                     and e.tubehole_level=''0'')';
   elsif v_idxCode='DIMS_TNO_06014' then --子孔
      v_sql := v_sql ||' and exists(select 1
		                                  from CE_LAYINGSEGMENT_TUBEHOLE e
			  				                     where e.int_id=c.int_id
								                       and e.tubehole_level=''1'')';
	 elsif v_idxCode='DIMS_TNO_06006' then --光交箱端子
	    --设备实体类型deviceType:0光交接箱
	    v_sql := v_sql ||' and exists(select 1
		                                  from CM_DEVICE_OPTIC
		                                 where CM_DEVICE_OPTIC.device_type=''0''
									                     and CM_DEVICE_OPTIC.lifecycle_status=''2''
									                     and CM_DEVICE_OPTIC.int_id=c.related_device)';
   end if;

   --总的行数
   execute v_sql into v_count;

	 for curAttr in (select me.extensiontable tableName,ma.columnName,ma.entitytype_id
		                 from dims_idx_rule r,dims_mm_attributetype ma,dims_mm_entitytype me
		                where me.id=ma.entitytype_id
		                  and ma.id=r.attributeType_id
		                  and r.type =2
		                  and r.index_id=p_indexId)
	 loop
		  --总量累加
			v_amount := v_amount + v_count;

		  --错误量
			v_sql := 'update '||v_coretable ||' c
			             set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
					                                   when dims_col_result is null then '''||v_idxCode||'''
									    						           else dims_col_result||'','||v_idxCode||''' end),
									     dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
					                                   when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
									    						           else dims_col_rtName||'','||v_idxName||''' end)
								 where 1=1';
			if v_extensionAttr is not null then
         v_sql := v_sql ||' and '||v_extensionAttr||'='''||v_extensionvalue||'''';
      end if;

      if v_hasLifecycle >=1 then
         ----生命周期状态	lifecycleStatus:2在网
         v_sql := v_sql ||' and lifecycle_status=''2''';
      end if;

      if v_idxCode ='DIMS_TNO_06013' then--管孔
         v_sql := v_sql ||' and exists(select 1
		                                     from CE_LAYINGSEGMENT_TUBEHOLE e
									                      where e.int_id=c.int_id
									                        and e.tubehole_level=''0'')';
      elsif v_idxCode='DIMS_TNO_06014' then --子孔
         v_sql := v_sql ||' and exists(select 1
		                                  from CE_LAYINGSEGMENT_TUBEHOLE e
									                   where e.int_id=c.int_id
									                     and e.tubehole_level=''1'')';
			elsif v_idxCode='DIMS_TNO_06006' then --光交箱端子
	       v_sql := v_sql ||' and exists(select 1
		                                     from CM_DEVICE_OPTIC
		                                    where CM_DEVICE_OPTIC.device_type=''0''
									                        and CM_DEVICE_OPTIC.lifecycle_status=''2''
									                        and CM_DEVICE_OPTIC.int_id=c.related_device)';
      end if;

			if v_entitytypeId = curAttr.entitytype_id and v_coretable <> v_extensiontable then--必填属性是E表上的
			   v_sql := v_sql ||' and (not exists(select 1 from '||v_extensiontable||' e where e.int_id=c.int_id)'
			  				  ||' or exists(select 1 from '||v_extensiontable||' e where e.int_id=c.int_id and isNull(e.'||curAttr.columnName||')))';

         execute v_sql;
			   get diagnostics v_errorCount = row_count;

			   --标记e表的错误数据
			   v_sql := 'update '||v_extensiontable ||' e
				              set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
					                                      when dims_col_result is null then '''||v_idxCode||'''
									    						              else dims_col_result||'','||v_idxCode||''' end),
									    	  dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
					                                   when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
									    						           else dims_col_rtName||'','||v_idxName||''' end)
								    where isNull('||curAttr.columnName||')
								      and exists(select 1 from '||v_coretable||' c where c.int_id=e.int_id';
				 if v_extensionAttr is not null then
            v_sql := v_sql ||' and c.'||v_extensionAttr||'='''||v_extensionvalue||'''';
         end if;

         if v_hasLifecycle >=1 then
            ----生命周期状态	lifecycleStatus:2在网
            v_sql := v_sql ||' and c.lifecycle_status=''2''';
         end if;

         v_sql := v_sql ||')';

         if v_idxCode ='DIMS_TNO_06013' then--管孔
            v_sql := v_sql ||' and e.tubehole_level=''0''';
         elsif v_idxCode='DIMS_TNO_06014' then --子孔
            v_sql := v_sql ||' and e.tubehole_level=''1''';
         elsif v_idxCode='DIMS_TNO_06006' then --光交箱端子
            --因为端子没有coretable，因此上面coretable取extensiontable，不会进入这里。
            v_sql := v_sql ||' and exists(select 1
		                                        from CM_DEVICE_OPTIC
		                                       where CM_DEVICE_OPTIC.device_type=''0''
									                           and CM_DEVICE_OPTIC.lifecycle_status=''2''
									                           and CM_DEVICE_OPTIC.int_id=e.related_device)';
         end if;

			   execute v_sql;
			else --必填属性是C表上的
			   v_sql := v_sql ||' and isNull(c.'||curAttr.columnName||')';
         execute v_sql;
			   get diagnostics v_errorCount = row_count;
			end if;

			--错误量累加
			v_errorAmount :=v_errorAmount + v_errorCount;
		end loop;

	--指标值统计
		 if v_extensionAttr is not null then
            perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_coretable,v_extensionAttr||'='''||v_extensionvalue||'''');
         else
			perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_coretable);
		end if;



end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkonerelationkeyindex  type=10
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkonerelationkeyindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkonerelationkeyindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
	 v_idxCode	        text;
	 v_idxName          text;
	 v_amountSql        text;
	 v_errorSql         text;
   v_amount   	      integer;
	 v_errorAmount      integer := 0;
	 v_indexValue       numeric(6,5);
	 v_extensiontable text;
begin

   select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

   select idx.name,idx.code,idx.amountSql,idx.errorSql,extensiontable
	   into v_idxName,v_idxCode,v_amountSql,v_errorSql,v_extensiontable
     From dims_idx_index idx ,dims_mm_entitytype me
    where idx.id=p_indexId and me.id=idx.entitytype_id;

	 --总的行数
   execute v_amountSql into v_amount;

   --错误量
	 execute v_errorSql;
   get diagnostics v_errorAmount = row_count;

   --指标值
			perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_extensiontable);

end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_checkonerepeatabilityindex type=9
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_checkonerepeatabilityindex"("p_taskid" int4, "p_indexid" int4);
CREATE OR REPLACE FUNCTION "proc_checkonerepeatabilityindex"("p_taskid" int4, "p_indexid" int4)
  RETURNS "void" AS $$
declare
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
	 v_idxCode	        text;
	 v_idxName          text;
	 v_extensiontable   text;
	 curAttr            record;
   v_sql              text;
   v_repeatedSql      text;
   v_isNullSql	      text;
   v_amount   	      integer;
	 v_errorAmount      integer := 0;
	 v_indexValue       numeric(6,5);

begin

   select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

   select idx.name,idx.code,me.extensiontable
	   into v_idxName,v_idxCode,v_extensiontable
     From dims_idx_index idx,dims_mm_entitytype me
    where me.id=idx.entitytype_id
      and idx.id=p_indexId;

   for curAttr in (select ma.columnName
		                 from dims_idx_rule r,dims_mm_attributetype ma,dims_mm_entitytype me
		                where me.id=ma.entitytype_id
		                  and ma.id=r.attributeType_id
		                  and r.type =4
		                  and r.index_id=p_indexId)
	 loop
		  if v_repeatedSql is null then
		     v_repeatedSql := ' exists(select 1 from '||v_extensiontable||' t2 where t2.ctid<>t1.ctid and t2.'||curAttr.columnName||'=t1.'||curAttr.columnName;
		  else
		     v_repeatedSql := v_repeatedSql||' and t2.'||curAttr.columnName||'=t1.'||curAttr.columnName;
		  end if;

		  if v_isNullSql is null then
		     v_isNullSql := 'isNull('||curAttr.columnName||')';
		  else
		     v_isNullSql := v_isNullSql||'or isNull('||curAttr.columnName||')';
		  end if;
	 end loop;
	 v_repeatedSql := v_repeatedSql||')';

	 --总的行数
	 v_sql := 'select count(1) from '||v_extensiontable;
   execute v_sql into v_amount;

   --错误量
   v_sql := 'update '||v_extensiontable ||' t1
			          set dims_col_result=(case when dims_col_result like ''%'||v_idxCode||'%'' then dims_col_result
					                                when dims_col_result is null then '''||v_idxCode||'''
							      						          else dims_col_result||'','||v_idxCode||''' end),
									  dims_col_rtName=(case when dims_col_rtName like ''%'||v_idxName||'%'' then dims_col_rtName
					                                when dims_col_rtName is null then ''不满足规范:'||v_idxName||'''
									    					          else dims_col_rtName||'','||v_idxName||''' end)
						  where ';

	 v_sql := v_sql||v_isNullSql;
	 v_sql := v_sql||' or '||v_repeatedSql;

	 --raise notice 'v_sql=%',v_sql;
	 execute v_sql;
   get diagnostics v_errorAmount = row_count;

   --指标值
			perform proc_generateCommonIndexValue(p_taskid,p_indexid,v_extensiontable);

end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_createexttableassocindex
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_createexttableassocindex"("p_tablename" varchar, "p_indexname" varchar, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_createexttableassocindex"("p_tablename" varchar, "p_indexname" varchar, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
begin
	 insert into dims_idx_index(name,code,entitytype_id,orderby,specialityName,type,isEnable,creator,updater,memo)
	 select p_indexname,p_indexCode,id,replace(p_indexCode,'DIMS_TNO_','')::integer,'管线',2,1,'db','db',null
		 from dims_mm_entitytype me
	  where extensiontable=p_tablename
		  and not exists(select 1 from dims_idx_index where code=p_indexCode);
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_createonedictaccuracyindex
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_createonedictaccuracyindex"("p_attrtypeid" int4, "p_indexname" varchar, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_createonedictaccuracyindex"("p_attrtypeid" int4, "p_indexname" varchar, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_entitytypeId integer;
	 v_attrColumn	  text;
   v_indexId      integer;
	 v_dictTypeId   integer;
	 v_dictTypeName text;
	 v_dictTypeCode text;
	 v_count        integer;
begin

	 select count(1) into v_count from dims_idx_index where code=p_indexCode;
	 if v_count >=1 then
	    return;
	 end if;

	 select entitytype_id,dictionaryType_id,columnName
	   into strict v_entitytypeId,v_dictTypeId,v_attrColumn
		 from dims_mm_attributetype
		where id=p_attrTypeId;

	 select name,code
	   into strict v_dictTypeName,v_dictTypeCode
	   from dims_mm_dictionarytype
	  where id= v_dictTypeId;

	 v_indexId := nextval('seq_dims_idx_index');

	 insert into dims_idx_index(id,name,code,entitytype_id,orderby,
	                            specialityName,type,isEnable,creator,updater)
	 values(v_indexId,p_indexname,p_indexCode,v_entitytypeId,replace(p_indexCode,'DIMS_TNO_','')::integer,
	        '管线',4,1,'db','db');

	 insert into dims_idx_rule(name,code,index_id,attributeType_id,type,dictionaryName,creator,updater)
	 values(p_indexname,v_attrColumn,v_indexId,p_attrTypeId,1,v_dictTypeName||v_dictTypeCode,'db','db');

end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_createoneprocindex
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_createoneprocindex"("p_tablename" varchar, "p_indexname" varchar, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_createoneprocindex"("p_tablename" varchar, "p_indexname" varchar, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_procName   varchar(50);
begin
	 v_procName := 'PROC_'||upper(p_indexCode);
	 insert into dims_idx_index(name,code,entitytype_id,orderby,specialityName,type,isEnable,creator,updater,memo)
	 select p_indexname,p_indexCode,id,replace(p_indexCode,'DIMS_TNO_','')::integer,'管线',1,1,'db','db',v_procName
		 from dims_mm_entitytype me
	  where extensiontable=p_tablename
		  and not exists(select 1 from dims_idx_index where code=p_indexCode);
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01001
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01001"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01001"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 0;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
	         or isNull(zh_label)
	         or isNull(lifecycle_status)
	         or isNull(property_right)
			     or isNull(property_unit)
	         or isNull(longitude)
	         or isNull(latitude)
	         or isNull(qualitor)
					 or isNull(maintainor))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01002
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01002"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01002"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 1;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
	         or isNull(zh_label)
	         or isNull(lifecycle_status)
	         or isNull(property_right)
			     or isNull(property_unit)
	         or isNull(longitude)
	         or isNull(latitude)
	         or isNull(qualitor)
					 or isNull(maintainor)
					 or not exists(select 1
					                 from CE_FACILITY_POLE e
					                where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_FACILITY_POLE e
					            where e.int_id=c.int_id
					              and isNull(e.height)))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记：
	 update CE_FACILITY_POLE e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(e.height)
		  and exists(select 1
		               from CM_FACILITY c
		              where c.int_id=e.int_id
		                and c.facility_Type = v_facilityType
		                and c.lifecycle_status=v_lifecyclestatus);
	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01003
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01003"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01003"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 4;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
	         or isNull(zh_label)
	         or isNull(lifecycle_status)
	         or isNull(property_right)
			     or isNull(property_unit)
	         or isNull(longitude)
	         or isNull(latitude)
	         or isNull(qualitor)
					 or isNull(maintainor))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01004
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01004"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01004"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 2;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
	         or isNull(zh_label)
	         or isNull(lifecycle_status)
	         or isNull(property_right)
			     or isNull(property_unit)
	         or isNull(longitude)
	         or isNull(latitude)
	         or isNull(qualitor)
					 or isNull(maintainor))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;
	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01005
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01005"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01005"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or not exists(select 1
					                 from CE_DEVICE_GJ e
					                where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_DEVICE_GJ e
					            where e.int_id=c.int_id
					              and (isNull(e.gj_type)
					                   or isNull(e.related_gisaccessarea))))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_DEVICE_GJ e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(e.gj_type)
					 or isNull(e.related_gisaccessarea))
		  and exists(select 1
		               from CM_DEVICE_OPTIC c
		              where c.int_id=e.int_id
		                and c.device_type=v_devicetype
		                and c.lifecycle_status=v_lifecyclestatus);

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01006
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01006"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01006"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER c
		where exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=c.related_device)
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 --错误量
   update CM_PORT_FIBER c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(port_no)
					 or isNull(port_status)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or isNull(frame_id)
					 or isNull(slot_id))
		  and exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=c.related_device)
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01007
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01007"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01007"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 3;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or isNull(manufacturer)
					 or not exists(select 1
					                 from CE_DEVICE_JT e
					                where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_DEVICE_JT e
					            where e.int_id=c.int_id
					              and (isNull(e.up_to_facility)
					                   or isNull(e.jt_type))))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_DEVICE_JT e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(e.up_to_facility)
		       or isNull(e.jt_type))
		  and exists(select 1
		               from CM_DEVICE_OPTIC c
		              where c.int_id=e.int_id
		                and c.device_type=v_devicetype
		                and c.lifecycle_status=v_lifecyclestatus);

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''3''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01008
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01008"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01008"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(a_object_id)
					 or isNull(z_object_id)
					 or isNull(a_object_type)
					 or isNull(z_object_type)
					 or isNull(m_length)
					 or isNull(property_right)
					 or isNull(property_unit)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;
	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');

end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01009
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01009"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01009"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(a_object_id)
					 or isNull(z_object_id)
					 or isNull(a_object_type)
					 or isNull(z_object_type)
					 or isNull(m_length)
					 or isNull(property_right)
					 or isNull(property_unit)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01010
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01010"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01010"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(a_object_id)
					 or isNull(z_object_id)
					 or isNull(a_object_type)
					 or isNull(z_object_type)
					 or isNull(m_length)
					 or isNull(property_unit)
					 or isNull(property_right)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01011
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01011"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01011"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 3;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(a_object_id)
					 or isNull(z_object_id)
					 or isNull(a_object_type)
					 or isNull(z_object_type)
					 or isNull(m_length)
					 or isNull(property_right)
					 or isNull(property_unit)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''3''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01012
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01012"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01012"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(a_object_id)
					 or isNull(z_object_id)
					 or isNull(a_object_type)
					 or isNull(z_object_type)
					 or isNull(m_length)
					 or isNull(property_right)
					 or isNull(property_unit)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01013
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01013"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01013"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
		       or isNull(zh_label)
					 or isNull(property_right)
					 or isNull(property_unit)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or isNull(lifecycle_status)
					 or exists(select 1
					             from CE_LAYINGSEGMENT_TUBEHOLE e
											where e.int_id=c.int_id
											  and e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
											  and (isNull(e.related_layingsegment)
	                           or isNull(e.tubehole_status)
	                           or isNull(e.tubehole_no))))
      and exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_LAYINGSEGMENT_TUBEHOLE e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where (isNull(e.related_layingsegment)
	         or isNull(e.tubehole_status)
	         or isNull(e.tubehole_no))
		  and exists(select 1
			             from CM_LAYINGSEGMENT c
									where c.int_id=e.int_id
									  and c.seg_type=v_segtype
										and c.lifecycle_status=v_lifecyclestatus)
		  and tubehole_level=Const_0; --管孔级别tubeholeLevel:0,主孔;1,子孔


	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''5''' || 'and lifecycle_status='|| '''' ||'2''' );
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01014
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01014"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01014"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_1            varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
		       or isNull(zh_label)
					 or isNull(property_right)
					 or isNull(property_unit)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or isNull(lifecycle_status)
					 or exists(select 1
					             from CE_LAYINGSEGMENT_TUBEHOLE e
											where e.int_id=c.int_id
											  and e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
											  and (isNull(e.related_layingsegment)
											       or isNull(e.parent_id)
	                           or isNull(e.tubehole_status)
	                           or isNull(e.tubehole_no))))
      and exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_LAYINGSEGMENT_TUBEHOLE e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where (isNull(e.related_layingsegment)
	         or isNull(e.parent_id)
	         or isNull(e.tubehole_status)
	         or isNull(e.tubehole_no))
		  and exists(select 1
			             from CM_LAYINGSEGMENT c
									where c.int_id=e.int_id
									  and c.seg_type=v_segtype
										and c.lifecycle_status=v_lifecyclestatus)
		  and tubehole_level=Const_1;--管孔级别tubeholeLevel:0,主孔;1,子孔


	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT', 'seg_type='|| '''5''' || 'and lifecycle_status='|| '''' ||'2''' );
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01015
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01015"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01015"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(a_object_id)
					 or isNull(z_object_id)
					 or isNull(a_object_type)
					 or isNull(z_object_type)
					 or isNull(manufacturer)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or isNull(length)
					 or isNull(lifecycle_status)
					 or isNull(related_project)
					 or not exists(select 1
					                 from CE_CABLE_SEGMENT e
											    where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_CABLE_SEGMENT e
											where e.int_id=c.int_id
											  and (isNull(e.cable_model)
												     or isNull(e.cableSegment_level)
														 or isNull(e.cable_name)
														 or isNull(e.fiber_count))))
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_CABLE_SEGMENT e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where (isNull(e.cable_model)
					 or isNull(e.cableSegment_level)
					 or isNull(e.cable_name)
					 or isNull(e.fiber_count))
		  and exists(select 1
		               from CM_CABLE c
									where c.int_id=e.int_id
									  and c.cable_type=v_cabletype
				            and c.lifecycle_status=v_lifecyclestatus);

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE', 'cable_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''' );
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01016
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01016"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01016"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or isNull(length)
					 or not exists(select 1
					                 from CE_CABLE_FIBER e
											    where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_CABLE_FIBER e
											where e.int_id=c.int_id
											  and (isNull(e.fibercableseg_id)
														 or isNull(e.using_status))))
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_CABLE_FIBER e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where (isNull(e.fibercableseg_id)
					 or isNull(e.using_status))
		  and exists(select 1
		               from CM_CABLE c
									where c.int_id=e.int_id
									  and c.cable_type=v_cabletype
				            and c.lifecycle_status=v_lifecyclestatus);

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE', 'cable_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''' );
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01017
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01017"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01017"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(start_equipport_id)
					 or isNull(end_equipport_id)
					 or isNull(start_device_id)
					 or isNull(end_device_id)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or not exists(select 1
					                 from CE_LINK_FIBERLINK e
											    where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_LINK_FIBERLINK e
											where e.int_id=c.int_id
											  and isNull(e.using_status)))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_LINK_FIBERLINK e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(e.using_status)
		  and exists(select 1
			             from CM_LINK_TRANSO c
									where c.int_id=e.int_id
									  and c.link_type=v_linktype);

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO', 'link_type='|| '''' ||'1''' );
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01018
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01018"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01018"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(start_equipport_id)
					 or isNull(end_equipport_id)
					 or isNull(start_device_id)
					 or isNull(end_device_id)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or not exists(select 1
					                 from CE_LINK_OCIRCUIT e
											    where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_LINK_OCIRCUIT e
											where e.int_id=c.int_id
											  and (isNull(e.bear_business)
												     or isNull(e.business_type)
														 or isNull(e.circuit_standard))))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_LINK_OCIRCUIT e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(e.bear_business)
					 or isNull(e.business_type)
					 or isNull(e.circuit_standard))
		  and exists(select 1
			             from CM_LINK_TRANSO c
									where c.int_id=e.int_id
									  and c.link_type=v_linktype);

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO', 'link_type='|| '''' ||'0''' );
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01019
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01019"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01019"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''1'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01020
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01020"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01020"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC', 'device_type='|| '''2'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01021
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01021"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01021"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''4'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01022
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01022"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01022"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or not exists(select 1
					                 from CE_DEVICE_OBD e
					                where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_DEVICE_OBD e
					            where e.int_id=c.int_id
					              and isNull(e.splitter_ratio)))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_DEVICE_OBD e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(e.splitter_ratio)
		  and exists(select 1
		               from CM_DEVICE_OPTIC c
		              where c.int_id=e.int_id
		                and c.device_type=v_devicetype
		                and c.lifecycle_status=v_lifecyclestatus);

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC', 'device_type='|| '''5'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01023
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01023"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01023"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 6;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or not exists(select 1 from CE_DEVICE_ODF e where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_DEVICE_ODF e
					            where (isNull(e.rack_module_num)
					                    or isNull(e.rack_module_used)
					                    or isNull(e.side))
					              and e.int_id=c.int_id))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC', 'device_type='|| '''6'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01024
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01024"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01024"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 7;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or not exists(select 1 from CE_DEVICE_IDF e where e.int_id=c.int_id)
					 or exists(select 1
					             from CE_DEVICE_IDF e
					            where (isNull(e.rack_module_num)
					                    or isNull(e.rack_module_used)
					                    or isNull(e.side))
					              and e.int_id=c.int_id))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC', 'device_type='|| '''7'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01025
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01025"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01025"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 8;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(int_id)
					 or isNull(zh_label)
					 or isNull(lifecycle_status)
					 or isNull(qualitor)
					 or isNull(maintainor))
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC', 'device_type='|| '''8'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01026
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01026"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01026"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --硬件类型ware_type:0 ODM,1法兰盘
   v_waretype         varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_WARE
		where ware_type=v_waretype;

	 --错误量
   update CM_WARE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1 from CE_WARE_ODM e where e.int_id=c.int_id)
		       or exists(select 1
		                   from CE_WARE_ODM e
		                  where (isNull(e.odm_type)
		                          or isNull(e.related_equipment_type)
		                          or isNull(e.shelf_id)
		                          or isNull(e.sort_type)
		                          or isNull(e.related_device_id)
		                          or isNull(e.face)
		                          or isNull(e.row_num)
		                          or isNull(e.column_num))
		                    and e.int_id=c.int_id))
		  and ware_type=v_waretype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_WARE', 'ware_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_01027
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_01027"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_01027"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER c;

	 --错误量
   update CM_PORT_FIBER c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (isNull(zh_label)
		       or isNull(port_type)
					 or isNull(port_no)
					 or isNull(port_status)
					 or isNull(qualitor)
					 or isNull(maintainor)
					 or isNull(frame_id)
					 or isNull(slot_id)
					 or isNull(related_equipment)
					 or isNull(related_odm)
					 or isNull(related_device)
					 or isNull(related_device_type));

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02001
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02001"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02001"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 0;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_FACILITY t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.facility_Type = v_facilityType)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02002
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02002"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02002"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 0;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%#%'
		  and zh_label not like '%井%'
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02003
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02003"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02003"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 0;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where ((to_number(property_right)=0 and coalesce(to_number(property_unit),-1)<>0)
		       or (to_number(property_right) in (1,2) and coalesce(to_number(property_unit),-1)<> 0)
					 or (to_number(property_right)=3 and to_number(property_unit)=0))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02004
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02004"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02004"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 1;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_FACILITY t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.facility_Type = v_facilityType)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02005
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02005"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02005"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 1;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%P%'
		  and zh_label not like '%杆%'
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02006
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02006"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02006"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 1;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where ((to_number(property_right)=0 and coalesce(to_number(property_unit),-1)<>0)
		       or (to_number(property_right) in (1,2) and coalesce(to_number(property_unit),-1) <> 0)
					 or (to_number(property_right) =3 and to_number(property_unit)=0))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02007
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02007"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02007"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 4;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_FACILITY t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.facility_Type = v_facilityType)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02008
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02008"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02008"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 4;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%标石%'
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02009
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02009"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02009"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 4;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where ((to_number(property_right)=0 and coalesce(to_number(property_unit),-1)<>0)
		       or (to_number(property_right) in (1,2) and coalesce(to_number(property_unit),-1) <> 0)
					 or (to_number(property_right) =3 and to_number(property_unit)=0))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02010
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02010"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02010"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 2;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_FACILITY t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.facility_Type = v_facilityType)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02011
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02011"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02011"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 2;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%撑点%'
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02012
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02012"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02012"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 2;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where ((to_number(property_right)=0 and coalesce(to_number(property_unit),-1)<>0)
		       or (to_number(property_right) in (1,2) and coalesce(to_number(property_unit),-1) <> 0)
					 or (to_number(property_right) =3 and to_number(property_unit)=0))
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02013
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02013"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02013"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_DEVICE_OPTIC t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.device_type=v_devicetype)
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02014
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02014"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02014"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%GJ%'
		  and zh_label not like '%光交%'
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02015
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02015"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02015"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_2            varchar(3) := 2;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC cd
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (select count(1)
			       from CM_PORT_FIBER
		        where CM_PORT_FIBER.related_device_type=Const_0 --设备实体类型deviceType:0光交接箱
		          and CM_PORT_FIBER.related_device=cd.int_id)
				  <>(select coalesce(sum(coalesce(to_number(odm.row_num),0) * coalesce(to_number(odm.column_num),0)),0)
					     from CR_DEVICE_WARE cr,CE_WARE_ODM odm
							where odm.int_id=cr.child_id
							  and cr.device_ware_type=Const_2--设备硬件关系类型deviceWareType:2光设施与ODM关系
							  and cr.device_type=Const_0 --设备实体类型deviceType:0光交接箱
							  and cr.parent_id=cd.int_id)
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02016
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02016"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02016"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER t1
		where exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=t1.related_device)
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 --错误量
   update CM_PORT_FIBER t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_PORT_FIBER t2
									where t2.int_id <> t1.int_id
									  and t2.zh_label=t1.zh_label)
		  and exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=t1.related_device)
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02017
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02017"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02017"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER t1
		where exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=t1.related_device)
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 --错误量
   update CM_PORT_FIBER t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC dev,CE_WARE_ODM odm
		                  where substring(t1.zh_label,1,length(dev.zh_label))=dev.zh_label
		                    and substring(t1.zh_label,length(dev.zh_label)+1)
		                          similar to '-0?'||odm.shelf_id||'-0?'||t1.frame_id ||'-0?'||t1.slot_id escape ''
		                    and odm.int_id=t1.related_odm
		                    and dev.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									      and dev.lifecycle_status=v_lifecyclestatus
									      and dev.int_id=t1.related_device)
		  and exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=t1.related_device)
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02018
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02018"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02018"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 3;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_DEVICE_OPTIC t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.device_type=v_devicetype)
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;


	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC', 'device_type='|| '''3''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02019
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02019"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02019"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 3;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%GT%'
		  and zh_label not like '%GZT%'
			and zh_label not like '%接头盒%'
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC', 'device_type='|| '''3''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02020
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02020"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02020"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LAYINGSEGMENT t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.seg_type=v_segtype)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT', 'seg_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02021
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02021"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02021"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_5            varchar(3) := 5;
	 Const_9            varchar(3) := 9;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点 seg_type=v_segtype
	  **/
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where (seg_type is null or seg_type<> Const_5)
		  and a_object_type=Const_9
		  and z_object_type=Const_9
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (seg_type is null or seg_type<> Const_5)
		  and (seg_type is null or seg_type<>v_segtype)
			and a_object_type=Const_9
		  and z_object_type=Const_9
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02022
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02022"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02022"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(m_length) is null
		       or to_number(m_length) <=0
					 or to_number(m_length) > 200)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02023
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02023"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02023"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_checkLayingSegmentLength(a_object_id::text,a_object_type::text,z_object_id::text,z_object_type::text,m_length::text) =false
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02024
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02024"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02024"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (select count(1)
		         from CE_LAYINGSEGMENT_TUBEHOLE t2
						where t2.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
						  and t2.related_layingsegment=t1.int_id) > 100
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02025
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02025"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02025"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LAYINGSEGMENT t2
									where t2.ctid <> c.ctid
									  and t2.zh_label=c.zh_label
										and t2.seg_type=v_segtype)
      and exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''5''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02026
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02026"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02026"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%管孔%'
      and exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''5''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02027
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02027"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02027"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_1            varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LAYINGSEGMENT t2
									where t2.ctid <> c.ctid
									  and t2.zh_label=c.zh_label
										and t2.seg_type=v_segtype)
      and exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''5''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02028
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02028"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02028"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_1            varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%子孔%'
      and exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''5''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02029
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02029"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02029"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LAYINGSEGMENT t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.seg_type=v_segtype)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02030
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02030"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02030"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_10           varchar(3) := 10;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点 seg_type=v_segtype
	  **/
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where a_object_type=Const_10
		  and z_object_type=Const_10
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (seg_type<>v_segtype or isNull(seg_type))
		  and a_object_type=Const_10
		  and z_object_type=Const_10
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02031
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02031"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02031"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(m_length) is null
		       or to_number(m_length) <=0
					 or to_number(m_length) > 150)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02032
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02032"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02032"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_checkLayingSegmentLength(a_object_id::text,a_object_type::text,z_object_id::text,z_object_type::text,m_length::text) =false
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02033
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02033"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02033"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LAYINGSEGMENT t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.seg_type=v_segtype)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02034
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02034"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02034"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_11           varchar(3) := 11;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点 seg_type=v_segtype
	  **/
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where a_object_type=Const_11
		  and z_object_type=Const_11
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (seg_type<>v_segtype or isNull(seg_type))
		  and a_object_type=Const_11
		  and z_object_type=Const_11
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02035
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02035"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02035"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(m_length) is null
		       or to_number(m_length) <=0
					 or to_number(m_length) > 500)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02036
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02036"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02036"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_checkLayingSegmentLength(a_object_id::text,a_object_type::text,z_object_id::text,z_object_type::text,m_length::text) =false
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''2''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02037
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02037"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02037"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LAYINGSEGMENT t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.seg_type=v_segtype)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02038
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02038"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02038"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_12           varchar(3) := 12;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点 seg_type=v_segtype
	  **/
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where a_object_type=Const_12
		  and z_object_type=Const_12
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (seg_type<>v_segtype or isNull(seg_type))
		  and a_object_type=Const_12
		  and z_object_type=Const_12
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02039
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02039"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02039"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(m_length) is null
		       or to_number(m_length) <=0
					 or to_number(m_length) > 500)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02040
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02040"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02040"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_checkLayingSegmentLength(a_object_id::text,a_object_type::text,z_object_id::text,z_object_type::text,m_length::text) =false
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''4''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02041
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02041"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02041"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_CABLE t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.cable_type=v_cabletype)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02042
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02042"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02042"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%光缆%'
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02043
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02043"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02043"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(t1.length) is null
		       or to_number(t1.length) <=0
					 or to_number(t1.length) > 999999)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

create or replace function PROC_DIMS_TNO_02044(p_taskId integer,p_indexCode varchar) returns void as
$$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype         varchar(3) := 0;
   Const_1             varchar(3) := 1;
	 v_indexId	         integer;
   v_name              varchar(100);
	 v_code              varchar(100);
	 v_taskId	           integer;
	 v_collectionDate    timestamp;
	 v_province	         varchar(100);
   v_amount            integer;
	 v_errorAmount       integer;
	 v_indexValue        numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where cable_type=v_cabletype;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(length) is null
		       or to_number(length)=0
					 or abs(to_number(length)-(select coalesce(sum(to_number(t.m_length)),0)
					                             from CR_LAYINGSEGMENT_CABLE r,CM_LAYINGSEGMENT t
					                            where t.int_id=r.layingsegment_id
					                              and t.seg_type=r.layingSegment_Type
					                              and r.layingseg_cable_type=Const_1 --敷设端与缆线关系类型layingsegCableType:1	敷设段与光缆段关系
					                              and r.cable_id=c.int_id)) > to_number(length)*0.1::numeric)
		  and cable_type=v_cabletype;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''' ||'0''');
end;
$$ language plpgsql;

-- ----------------------------
-- Function structure for proc_dims_tno_02045
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02045"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02045"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1
					              from CE_CABLE_SEGMENT e
											 where e.int_id=c.int_id
											   and to_number(fiber_count)  is not null)
		       or exists(select 1
					             from CE_CABLE_SEGMENT e
											where e.int_id=c.int_id
											  and to_number(fiber_count) not in (2,4,6,8,12,16,20,24,30,36,48,56,60,72,96,144,192,216,288,360,432,576)))
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_CABLE_SEGMENT e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where (to_number(fiber_count) not in (2,4,6,8,12,16,20,24,30,36,48,56,60,72,96,144,192,216,288,360,432,576)
		       or to_number(fiber_count) is null)
		  and exists(select 1
		               from CM_CABLE c
									where c.int_id=e.int_id
									  and c.cable_type=v_cabletype
				            and c.lifecycle_status=v_lifecyclestatus);


	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02046
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02046"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02046"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1
					              from CE_CABLE_SEGMENT e
											 where e.int_id=c.int_id)
		       or exists(select 1
					             from CE_CABLE_SEGMENT e
											where e.int_id=c.int_id
											  and (to_number(e.fiber_count) <> (select count(1) from CE_CABLE_FIBER where fibercableseg_id=e.int_id)
												     or to_number(e.fiber_count) is null )))
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --E表错误数据标标记:
	 update CE_CABLE_SEGMENT e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where (to_number(e.fiber_count) <> (select count(1) from CE_CABLE_FIBER where fibercableseg_id=e.int_id)
		       or to_number(e.fiber_count) is null)
		  and exists(select 1
		               from CM_CABLE c
									where c.int_id=e.int_id
									  and c.cable_type=v_cabletype
				            and c.lifecycle_status=v_lifecyclestatus);

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02047
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02047"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02047"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_CABLE t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.cable_type=v_cabletype)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02048
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02048"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02048"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%F%'
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''1''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02049
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02049"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02049"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LINK_TRANSO t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.link_type=v_linktype)
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02050
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02050"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02050"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%FX%'
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO', 'link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02051
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02051"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02051"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CM_LINK_TRANSO t2
									where t2.ctid <> t1.ctid
									  and t2.zh_label=t1.zh_label
										and t2.link_type=v_linktype)
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_02052
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_02052"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_02052"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where zh_label not like '%FR%'
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03001
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03001"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03001"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 0;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_9            varchar(3) := 9;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.a_object_type = Const_9 --敷设段端点类型pipelineEndType:9 人手井
												and t2.a_object_id=t1.int_id)
			and not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.z_object_type = Const_9 --敷设段端点类型pipelineEndType:9 人手井
												and t2.z_object_id=t1.int_id)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''0''' || 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03002
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03002"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03002"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 1;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_10           varchar(3) := 10;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.a_object_type = Const_10 --敷设段端点类型pipelineEndType:10	电杆
												and t2.a_object_id=t1.int_id)
			and not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.z_object_type = Const_10 --敷设段端点类型pipelineEndType:10	电杆
												and t2.z_object_id=t1.int_id)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''1'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03003
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03003"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03003"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 4;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_11           varchar(3) := 11;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.a_object_type = Const_11 --敷设段端点类型pipelineEndType:11	标石
												and t2.a_object_id=t1.int_id)
			and not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.z_object_type = Const_11 --敷设段端点类型pipelineEndType:11	标石
												and t2.z_object_id=t1.int_id)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''4'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03004
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03004"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03004"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_facilityType     varchar(3) := 2;--设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_12           varchar(3) := 12;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY
		where facility_Type=v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_FACILITY t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.a_object_type = Const_12 --敷设段端点类型pipelineEndType:12	支撑点
												and t2.a_object_id=t1.int_id)
			and not exists(select 1
		                   from CM_LAYINGSEGMENT t2
									    where t2.z_object_type = Const_12 --敷设段端点类型pipelineEndType:12	支撑点
												and t2.z_object_id=t1.int_id)
		  and facility_Type = v_facilityType
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY','facility_Type='|| '''2'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03005
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03005"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03005"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_CABLE t2
									    where t2.a_object_type=v_devicetype
										    and t2.a_object_id = t1.int_id)
			and not exists(select 1
		                   from CM_CABLE t2
									    where t2.z_object_type=v_devicetype
										    and t2.z_object_id = t1.int_id)
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03006
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03006"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03006"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 Const_2            varchar(3) := 2;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER t1
		where exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=t1.related_device)
		  and port_status=Const_2--端口状态portStatus:2 占用
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 --错误量
   update CM_PORT_FIBER t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_LINK_TRANSO t2
									    where t2.start_equipport_id = t1.int_id)
			and not exists(select 1
		                   from CM_LINK_TRANSO t2
									    where t2.end_equipport_id = t1.int_id)
			and not exists(select 1
			                 from CR_CABLE_NODE t2
											where t2.port_id=t1.int_id)
		  and exists(select 1
		               from CM_DEVICE_OPTIC
		              where CM_DEVICE_OPTIC.device_type=Const_0 --设备实体类型deviceType:0光交接箱
									  and CM_DEVICE_OPTIC.lifecycle_status=v_lifecyclestatus
									  and CM_DEVICE_OPTIC.int_id=t1.related_device)
		  and port_status=Const_2--端口状态portStatus:2 占用
		  and related_device_type=Const_0;--设备实体类型deviceType:0光交接箱

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03007
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03007"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03007"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER;

	 --错误量
   update CM_PORT_FIBER t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC
		                  where CM_DEVICE_OPTIC.device_type=t1.related_device_type --设备实体类型deviceType
									      and CM_DEVICE_OPTIC.int_id=t1.related_device);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03008
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03008"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03008"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 3;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_CABLE t2
									    where t2.a_object_type=v_devicetype
										    and t2.a_object_id = t1.int_id)
			and not exists(select 1
		                   from CM_CABLE t2
									    where t2.z_object_type=v_devicetype
										    and t2.z_object_id = t1.int_id)
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''3'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03009
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03009"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03009"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 3;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_DEVICE_OPTIC t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CE_DEVICE_JT,CM_FACILITY
									    where CM_FACILITY.int_id=CE_DEVICE_JT.up_to_facility
										    and CE_DEVICE_JT.int_id = t1.int_id)
		  and device_type=v_devicetype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''3'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03010
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03010"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03010"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点
	  **/
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type=Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type=Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03011
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03011"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03011"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点
	  **/
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type = Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type = Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03012
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03012"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03012"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where not exists(select 1
									                   from CM_LAYINGSEGMENT t2
																		where t2.seg_type =Const_0--敷设段类型layingSegmentType:0管道段
											                and t2.int_id=e.related_layingsegment)
									  and e.tubehole_level=Const_0--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --标记错误数据：CE_LAYINGSEGMENT_TUBEHOLE
	 update CE_LAYINGSEGMENT_TUBEHOLE e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_LAYINGSEGMENT t2
											where t2.seg_type =Const_0--敷设段类型layingSegmentType:0管道段
											  and t2.int_id=e.related_layingsegment)
		  and exists(select 1
			             from CM_LAYINGSEGMENT c
							    where c.seg_type=v_segtype
				            and c.lifecycle_status=v_lifecyclestatus
								    and c.int_id=e.int_id)
		  and e.tubehole_level=Const_0;--管孔级别tubeholeLevel:0,主孔;1,子孔

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''5'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03013
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03013"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03013"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(distinct cable_id)
		 into v_amount
		 from CR_LAYINGSEGMENT_CABLE;

	 --错误量
	 select count(distinct cable_id)
		 into v_errorAmount
		 from CR_LAYINGSEGMENT_CABLE cr
		where not exists(select 1
		                   from CM_CABLE c
											where c.cable_type=v_cabletype
											  and c.int_id=cr.cable_id);

	 --错误数据标标记:CR_LAYINGSEGMENT_CABLE
	 update CR_LAYINGSEGMENT_CABLE cr
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where not exists(select 1
		                   from CM_CABLE c
											where c.cable_type=v_cabletype
											  and c.int_id=cr.cable_id);

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_LAYINGSEGMENT_CABLE');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03014
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03014"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03014"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 5;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_1            varchar(3) := 1;
	 Const_5            varchar(3) := 5;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT c
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量:C表
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CE_LAYINGSEGMENT_TUBEHOLE e
									where not exists(select 1
									                   from CM_LAYINGSEGMENT t2
																		where t2.seg_type =Const_5--敷设段类型layingSegmentType:5管孔
											                and t2.int_id=e.parent_id)
									  and e.tubehole_level=Const_1--管孔级别tubeholeLevel:0,主孔;1,子孔
									  and e.int_id=c.int_id)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --错误数据标记:CE_LAYINGSEGMENT_TUBEHOLE
	 update CE_LAYINGSEGMENT_TUBEHOLE e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
									     from CM_LAYINGSEGMENT t2
											where t2.seg_type =Const_5--敷设段类型layingSegmentType:5管孔
					              and t2.int_id=e.parent_id)
		  and exists(select 1
		               from CM_LAYINGSEGMENT c
									where c.seg_type=v_segtype
		                and c.lifecycle_status=v_lifecyclestatus
										and c.int_id=e.int_id)
		  and tubehole_level=Const_1;--管孔级别tubeholeLevel:0,主孔;1,子孔

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''5'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03015
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03015"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03015"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点
	  **/
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type in (Const_0,Const_1))
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type = Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type = Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''1'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03016
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03016"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03016"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点
	  **/
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type in (Const_0,Const_1))
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type = Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type = Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''1'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03017
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03017"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03017"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type in (Const_0,Const_1))
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type =Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type=Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''4'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03018
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03018"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03018"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 4;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type in (Const_0,Const_1))
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type =Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type =Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''4'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03019
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03019"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03019"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type in (Const_0,Const_1))
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type =Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.a_object_id
										    and t1.a_object_type=Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''2'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03020
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03020"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03020"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   v_segtype          varchar(3) := 2;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type in (Const_0,Const_1))
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type in (Const_9,Const_10,Const_11,Const_12,Const_13))
			and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type =Const_14)
			and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.z_object_id
										    and t1.z_object_type =Const_15)
		  and seg_type=v_segtype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type='|| '''2'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03021
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03021"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03021"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.a_object_id)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03022
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03022"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03022"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
									    where t2.int_id=t1.z_object_id)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03023
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03023"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03023"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_isCableConnected(c.int_id) is not null
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03024
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03024"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03024"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where exists(select 1 from CR_CABLE_NODE cr where cr.cable_id=c.int_id)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CR_CABLE_NODE  cr
									where not exists(select 1
									                   from CM_PORT_FIBER cp
																		where cp.int_id=cr.port_id)
									  and cr.cable_id=c.int_id)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --标记错误数据
	 update CR_CABLE_NODE  cr
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where not exists(select 1
									     from CM_PORT_FIBER cp
											where cp.int_id=cr.port_id)
		  and exists(select 1
			             from CM_CABLE c
									where c.cable_type=v_cabletype
				            and c.lifecycle_status=v_lifecyclestatus
										and c.int_id=cr.cable_id);


	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''1'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03025
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03025"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03025"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CE_CABLE_FIBER e,CM_CABLE c2
											where c2.cable_type = Const_0--缆线类型cable_type:0光缆段
											  and c2.int_id=e.fibercableseg_id
												and e.int_id=c.int_id)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecyclestatus;

	 get diagnostics v_errorAmount = row_count;

	 --错误数据标记
	 update CE_CABLE_FIBER e
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_CABLE c2
											where c2.cable_type = Const_0--缆线类型cable_type:0光缆段
											  and c2.int_id=e.fibercableseg_id)
		  and exists(select 1
		               from CM_CABLE c
									where c.cable_type=v_cabletype
				            and c.lifecycle_status=v_lifecyclestatus
										and c.int_id=e.int_id);


	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''1'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03026
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03026"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03026"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_3            varchar(3) := 3;
   Const_4            varchar(3) := 4;
   Const_6            varchar(3) := 6;
   Const_7            varchar(3) := 7;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
	 --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   update CM_LINK_TRANSO t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_PORT_FIBER
											where CM_PORT_FIBER.related_device_type in (Const_0,Const_1,Const_2,Const_3,Const_4,Const_6,Const_7)
												and CM_PORT_FIBER.int_id=t1.start_equipport_id)
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03027
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03027"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03027"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_3            varchar(3) := 3;
   Const_4            varchar(3) := 4;
   Const_6            varchar(3) := 6;
   Const_7            varchar(3) := 7;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
	 --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   update CM_LINK_TRANSO t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_PORT_FIBER
											where CM_PORT_FIBER.related_device_type in (Const_0,Const_1,Const_2,Const_3,Const_4,Const_6,Const_7)
												and CM_PORT_FIBER.int_id=t1.end_equipport_id)
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03028
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03028"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03028"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
	 Const_1            varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
	 --链路缆线关系类型linkCableType:	0纤芯与局向光纤关系,1局向光缆与光缆段关系
	 --缆线类型cable_type:0光缆段,1纤芯
	 update CM_LINK_TRANSO cl
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1
		                    from CR_LINK_CABLE cr
		                   where cr.link_cable_type=Const_0--0纤芯与局向光纤关系
		                     and cr.sitefiber_id=cl.int_id)
		       or exists(select 1
		                   from CR_LINK_CABLE cr
		                  where not exists(select 1
		                                     from CM_CABLE cc
		                                    where cc.cable_type=Const_1--1纤芯
		                                      and cc.int_id=cr.fiber_id)
		                    and cr.link_cable_type=Const_0--0纤芯与局向光纤关系
		                    and cr.sitefiber_id=cl.int_id))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --错误数据标标记:CR_LINK_CABLE
	 update CR_LINK_CABLE cr
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
	  where not exists(select 1
		                   from CM_CABLE cc
										  where cc.cable_type=Const_1 --1纤芯
											  and cc.int_id=cr.fiber_id)
		  and link_cable_type=Const_0;--0纤芯与局向光纤关系

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_03029
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_03029"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_03029"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_lifecyclestatus  varchar(3) := 2;--生命周期状态	lifecyclestatus:2在网
	 Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_4            varchar(3) := 4;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;


	 --错误量
	 --链路链路关系类型linkLinkType:0光路路由与局向光纤/硬跳关系,1局向光纤与局向光缆关系,2光路与光路路由关系
   update CM_LINK_TRANSO cl
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1
		                    from CR_LINK_LINK_TRANSO cr1,CR_LINK_LINK_TRANSO cr2
		                   where cr2.lower_link_type=Const_1 --1局向光纤
		                     and cr2.link_Link_Type=Const_0--0光路路由与局向光纤/硬跳关系
		                     and cr2.upper_link_id=cr1.lower_link_id
		                     and cr1.link_Link_Type=Const_2--2光路与光路路由关系
		                     and cr1.upper_link_id=cl.int_id)
		       or exists(select 1
		                   from CR_LINK_LINK_TRANSO cr1,CR_LINK_LINK_TRANSO cr2
		                  where not exists(select 1
		                                     from CM_LINK_TRANSO cl2
		                                    where cl2.link_type=Const_1--1局向光纤
		                                      and cl2.int_id=cr2.lower_link_id)
		                    and cr2.lower_link_type=Const_1 --1局向光纤
		                    and cr2.link_Link_Type=Const_0--0光路路由与局向光纤/硬跳关系
		                    and cr2.upper_link_id=cr1.lower_link_id
		                    and cr1.link_Link_Type=Const_2--2光路与光路路由关系
		                    and cr1.upper_link_id=cl.int_id))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_05001
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_05001"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_05001"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_lifecycleStatus  varchar(3) := 2;--生命周期状态	lifecycleStatus:2在网
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_isOCircuitConnected(c.int_id,true) is not null
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_05002
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_05002"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_05002"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype         varchar(3) := 0;
	 v_lifecycleStatus   varchar(3) := 2;--生命周期状态	lifecycleStatus:2在网

	 --光缆段级别cableSegmentLevel:0一干,1二干,2核心层,3汇聚层,4接入层,5主干层,
	 --6配线层,7引入层,8本地骨干光缆,9骨干局房楼间光缆
	 v_cableSegmentLevel varchar(3) := 0;
	 v_lengthLimit       integer := 80000;--80km
	 v_indexId	         integer;
   v_name              varchar(100);
	 v_code              varchar(100);
	 v_taskId	           integer;
	 v_collectionDate    timestamp;
	 v_province	         varchar(100);
   v_amount            integer;
	 v_errorAmount       integer;
	 v_indexValue        numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(length) is null
		       or to_number(length)=0
					 or to_number(length) > v_lengthLimit)
		  and exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_05003
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_05003"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_05003"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype         varchar(3) := 0;
	 v_lifecycleStatus   varchar(3) := 2;--生命周期状态	lifecycleStatus:2在网

	 --光缆段级别cableSegmentLevel:0一干,1二干,2核心层,3汇聚层,4接入层,5主干层,
	 --6配线层,7引入层,8本地骨干光缆,9骨干局房楼间光缆
	 v_cableSegmentLevel varchar(3) := 1;
	 v_lengthLimit       integer := 80000;--80km
	 v_indexId	         integer;
   v_name              varchar(100);
	 v_code              varchar(100);
	 v_taskId	           integer;
	 v_collectionDate    timestamp;
	 v_province	         varchar(100);
   v_amount            integer;
	 v_errorAmount       integer;
	 v_indexValue        numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(length) is null
		       or to_number(length)=0
					 or to_number(length) > v_lengthLimit)
		  and exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 get diagnostics v_errorAmount = row_count;


	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_05004
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_05004"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_05004"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype         varchar(3) := 0;
	 v_lifecycleStatus   varchar(3) := 2;--生命周期状态	lifecycleStatus:2在网

	 --光缆段级别cableSegmentLevel:0一干,1二干,2核心层,3汇聚层,4接入层,5主干层,
	 --6配线层,7引入层,8本地骨干光缆,9骨干局房楼间光缆
	 v_cableSegmentLevel varchar(3) := 2;
	 v_lengthLimit       integer := 40000;--40km
	 v_indexId	         integer;
   v_name              varchar(100);
	 v_code              varchar(100);
	 v_taskId	           integer;
	 v_collectionDate    timestamp;
	 v_province	         varchar(100);
   v_amount            integer;
	 v_errorAmount       integer;
	 v_indexValue        numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(length) is null
		       or to_number(length)=0
					 or to_number(length) > v_lengthLimit)
		  and exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_05005
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_05005"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_05005"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype         varchar(3) := 0;
	 v_lifecycleStatus   varchar(3) := 2;--生命周期状态	lifecycleStatus:2在网

	 --光缆段级别cableSegmentLevel:0一干,1二干,2核心层,3汇聚层,4接入层,5主干层,
	 --6配线层,7引入层,8本地骨干光缆,9骨干局房楼间光缆
	 v_cableSegmentLevel varchar(3) := 3;
	 v_lengthLimit       integer := 20000;--20km
	 v_indexId	         integer;
   v_name              varchar(100);
	 v_code              varchar(100);
	 v_taskId	           integer;
	 v_collectionDate    timestamp;
	 v_province	         varchar(100);
   v_amount            integer;
	 v_errorAmount       integer;
	 v_indexValue        numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(length) is null
		       or to_number(length)=0
					 or to_number(length) > v_lengthLimit)
		  and exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_05006
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_05006"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_05006"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype         varchar(3) := 0;
	 v_lifecycleStatus   varchar(3) := 2;--生命周期状态	lifecycleStatus:2在网

	 --光缆段级别cableSegmentLevel:0一干,1二干,2核心层,3汇聚层,4接入层,5主干层,
	 --6配线层,7引入层,8本地骨干光缆,9骨干局房楼间光缆
	 v_cableSegmentLevel varchar(3) := 4;
	 v_lengthLimit       integer := 5000;--5km
	 v_indexId	         integer;
   v_name              varchar(100);
	 v_code              varchar(100);
	 v_taskId	           integer;
	 v_collectionDate    timestamp;
	 v_province	         varchar(100);
   v_amount            integer;
	 v_errorAmount       integer;
	 v_indexValue        numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(length) is null
		       or to_number(length)=0
					 or to_number(length) > v_lengthLimit)
		  and exists(select 1
		               from CE_CABLE_SEGMENT e
		              where e.int_id=c.int_id
		                and e.cableSegment_level=v_cableSegmentLevel)
		  and cable_type=v_cabletype
		  and lifecycle_status=v_lifecycleStatus;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''0'''|| 'and lifecycle_status='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06034
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06034"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06034"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
   v_error            integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*3
	   into v_amount
		 from CR_DEVICE_AREA;

	 --错误量:设备id
   update CR_DEVICE_AREA
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(device_id);

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_error;

	 --错误量:设备类型
   update CR_DEVICE_AREA
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(device_type);

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:所属机房Id和所属机架位置只要满足其一即可
   update CR_DEVICE_AREA
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(equiproom_id)
		  and isNull(rackposition_id);

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_DEVICE_AREA');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06035
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06035"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06035"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_cableCableType   varchar(3) := 0;--缆线缆线关系类型cableCableType:0 纤芯熔接
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
   v_error            integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*5
	   into v_amount
		 from CR_CABLE_CABLE
		where cable_cable_type=v_cableCableType;

	 --错误量:关系类型
	 --要求纤芯熔接，那满足条件的，关系类型字段肯定是非空的
	 v_error := 0;
	 v_errorAmount := v_error;

	 --错误量:上级缆线ID
   update CR_CABLE_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(upper_cable_id)
		  and cable_cable_type=v_cableCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:下级缆线ID
   update CR_CABLE_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(lower_cable_id)
		  and cable_cable_type=v_cableCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:箱体类型
   update CR_CABLE_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(device_type)
		  and cable_cable_type=v_cableCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:接头id
   update CR_CABLE_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(jt_id)
		  and cable_cable_type=v_cableCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	--指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_CABLE_CABLE','cable_cable_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06036
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06036"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06036"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_cableNodeType    varchar(3) := 0;--缆线与点关系类型cableNodeType:0	纤芯成端
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
   v_error            integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*4
	   into v_amount
		 from CR_CABLE_NODE
		where cable_node_type=v_cableNodeType;

	 --错误量:缆线ID
	 update CR_CABLE_NODE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(cable_id)
		  and cable_node_type=v_cableNodeType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_error;

	 --错误量:端子ID
   update CR_CABLE_NODE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(port_id)
		  and cable_node_type=v_cableNodeType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:端子所在的设备
   update CR_CABLE_NODE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(device_id)
		  and cable_node_type=v_cableNodeType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:端子所在的设备类型
   update CR_CABLE_NODE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(device_type)
		  and cable_node_type=v_cableNodeType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_CABLE_NODE','cable_node_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06037
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06037"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06037"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   v_linkCableType    varchar(3) := 0;--链路缆线关系类型linkCableType:0	纤芯与局向光纤关系
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
   v_error            integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*4
	   into v_amount
		 from CR_LINK_CABLE
		where link_cable_type=v_linkCableType;

	 --错误量:链路缆线关系类型
	 --肯定满足要求
	 v_error = 0;
	 v_errorAmount := v_error;

	 --错误量:链路id
   update CR_LINK_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(sitefiber_id)
		  and link_cable_type=v_linkCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:缆线id
   update CR_LINK_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(fiber_id)
		  and link_cable_type=v_linkCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:顺序
   update CR_LINK_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(seq)
		  and link_cable_type=v_linkCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	  --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_LINK_CABLE','link_cable_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06038
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06038"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06038"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路链路关系类型linkLinkType:0光路路由与局向光纤/硬跳关系,1局向光纤与局向光缆关系,2光路与光路路由关系
   v_linkLinkType     varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
   v_error            integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*3
	   into v_amount
		 from CR_LINK_LINK_TRANSO
		where link_Link_Type=v_linkLinkType;

	 --错误量:上级链路id
   update CR_LINK_LINK_TRANSO
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(upper_link_id)
		  and link_Link_Type=v_linkLinkType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_error;

	 --错误量:下级链路id
   update CR_LINK_LINK_TRANSO
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(lower_link_id)
		  and link_Link_Type=v_linkLinkType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:下级链路类型
   update CR_LINK_LINK_TRANSO
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(lower_link_type)
		  and link_Link_Type=v_linkLinkType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_LINK_LINK_TRANSO','link_Link_Type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06039
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06039"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06039"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路链路关系类型linkLinkType:0光路路由与局向光纤/硬跳关系,1局向光纤与局向光缆关系,2光路与光路路由关系
   v_linkLinkType     varchar(3) := 2;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
   v_error            integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*2
	   into v_amount
		 from CR_LINK_LINK_TRANSO
		where link_Link_Type=v_linkLinkType;

	 --错误量:上级链路id
   update CR_LINK_LINK_TRANSO
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(upper_link_id)
		  and link_Link_Type=v_linkLinkType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_error;

	 --错误量:下级链路id
   update CR_LINK_LINK_TRANSO
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(lower_link_id)
		  and link_Link_Type=v_linkLinkType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_LINK_LINK_TRANSO','link_Link_Type='|| '''' ||'2''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06040
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06040"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06040"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --网与实体关系类型netEntityType:0光缆与光缆段关系,1光缆与接头关系
   v_netEntityType    varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
   v_error            integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*2
	   into v_amount
		 from CR_NET_ENTITY
		where net_entity_type=v_netEntityType;

	 --错误量:网id
   update CR_NET_ENTITY
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(net_id)
		  and net_entity_type=v_netEntityType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_error;

	 --错误量:关联资源实体id
   update CR_NET_ENTITY
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(entity_id)
		  and net_entity_type=v_netEntityType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_NET_ENTITY','net_entity_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06041
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06041"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06041"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设端与缆线关系类型layingsegCableType:0管孔与光缆段关系,1敷设段与光缆段关系
   v_layingsegCableType varchar(3) := 1;
	 v_indexId	          integer;
   v_name               varchar(100);
	 v_code               varchar(100);
	 v_taskId	            integer;
	 v_collectionDate     timestamp;
	 v_province	          varchar(100);
   v_amount             integer;
   v_error              integer;
	 v_errorAmount        integer;
	 v_indexValue         numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*3
	   into v_amount
		 from CR_LAYINGSEGMENT_CABLE
		where layingseg_cable_type=v_layingsegCableType;

	 --错误量:敷设端id
   update CR_LAYINGSEGMENT_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(layingsegment_id)
		  and layingseg_cable_type=v_layingsegCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_error;

	 --错误量:缆线id
   update CR_LAYINGSEGMENT_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(cable_id)
		  and layingseg_cable_type=v_layingsegCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --错误量:敷设段类型
   update CR_LAYINGSEGMENT_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(layingSegment_Type)
		  and layingseg_cable_type=v_layingsegCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_LAYINGSEGMENT_CABLE','layingseg_cable_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_06042
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_06042"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_06042"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设端与缆线关系类型layingsegCableType:0管孔与光缆段关系,1敷设段与光缆段关系
   v_layingsegCableType varchar(3) := 0;
	 v_indexId	          integer;
   v_name               varchar(100);
	 v_code               varchar(100);
	 v_taskId	            integer;
	 v_collectionDate     timestamp;
	 v_province	          varchar(100);
   v_amount             integer;
   v_error              integer;
	 v_errorAmount        integer;
	 v_indexValue         numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)*2
	   into v_amount
		 from CR_LAYINGSEGMENT_CABLE
		where layingseg_cable_type=v_layingsegCableType;

	 --错误量:敷设端id
   update CR_LAYINGSEGMENT_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(layingsegment_id)
		  and layingseg_cable_type=v_layingsegCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_error;

	 --错误量:缆线id
   update CR_LAYINGSEGMENT_CABLE
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where isNull(cable_id)
		  and layingseg_cable_type=v_layingsegCableType;

	 get diagnostics v_error = row_count;
	 v_errorAmount := v_errorAmount + v_error;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CR_LAYINGSEGMENT_CABLE','layingseg_cable_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_23070
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_23070"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_23070"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 6;
   Const_0            varchar(3) := 0;
   Const_2            varchar(3) := 2;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CR_DEVICE_WARE cr,CM_WARE odm
		                  where odm.ware_type=Const_0 --硬件类型ware_type:0,ODM
		                    and odm.int_id=cr.child_id
							  	      and cr.device_ware_type=Const_2 --设备硬件关系类型deviceWareType:2光设施与ODM关系
							          and cr.device_type=v_devicetype
							          and cr.parent_id=c.int_id)
		  and device_type=v_devicetype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	  perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''' ||'6''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_23071
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_23071"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_23071"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
   v_devicetype       varchar(3) := 6;
   Const_2            varchar(3) := 2;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC
		where device_type=v_devicetype;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CR_DEVICE_WARE cr1,CE_WARE_ODM odm1,CR_DEVICE_WARE cr2,CE_WARE_ODM odm2
		              where odm1.int_id<>odm2.int_id
		                and odm1.shelf_id=odm2.shelf_id
		                and odm1.int_id=cr1.child_id
					  	      and cr1.device_ware_type=Const_2--设备硬件关系类型deviceWareType:2光设施与ODM关系
						        and cr1.device_type=v_devicetype
						        and cr1.parent_id=c.int_id
						        and odm2.int_id=cr2.child_id
					  	      and cr2.device_ware_type=Const_2--设备硬件关系类型deviceWareType:2光设施与ODM关系
						        and cr2.device_type=v_devicetype
						        and cr2.parent_id=c.int_id)
		  and device_type=v_devicetype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC','device_type='|| '''' ||'6''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_23077
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_23077"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_23077"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_3            varchar(3) := 3;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER;

	 --错误量
	 --排列方式sort_type:0从上到下,1从下到上,2从左到右,3从右到左
   update CM_PORT_FIBER c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CE_WARE_ODM odm, CM_PORT_FIBER t2
		              where ((odm.sort_type in (Const_0,Const_1) and c.slot_id=t2.slot_id)
		                      or (odm.sort_type in (Const_2,Const_3) and c.frame_id=t2.frame_id))
		                and t2.ctid <> c.ctid
		                and t2.related_equipment=c.related_equipment
		                and odm.int_id=c.related_odm);

	 get diagnostics v_errorAmount = row_count;


	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_23078
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_23078"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_23078"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_3            varchar(3) := 3;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_PORT_FIBER;

	 --错误量
	 --排列方式sort_type:0从上到下,1从下到上,2从左到右,3从右到左
   update CM_PORT_FIBER c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where exists(select 1
		               from CE_WARE_ODM odm
		              where ((odm.sort_type in (Const_0,Const_1) and to_number(c.slot_id) > 12)
		                      or (odm.sort_type in (Const_2,Const_3) and to_number(c.frame_id) > 12))
		                and odm.int_id=c.related_odm);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_PORT_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_23079
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_23079"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_23079"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_LAYINGSEGMENT_TUBEHOLE;

	 --错误量
   update CE_LAYINGSEGMENT_TUBEHOLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where int_id=parent_id;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_LAYINGSEGMENT_TUBEHOLE');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_23080
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_23080"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_23080"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_4            varchar(3) := 4;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type in (Const_0,Const_1,Const_2,Const_4);

	 --错误量
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点
	  **/
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (case when seg_type=Const_0 and (a_object_type=Const_9 or z_object_type=Const_9) then 't'
		            when seg_type=Const_1 and (a_object_type=Const_10 or z_object_type=Const_10) then 't'
		            when seg_type=Const_2 and (a_object_type=Const_11 or z_object_type=Const_11) then 't'
		            when seg_type=Const_4 and (a_object_type=Const_12 or z_object_type=Const_12) then 't' else 'f' end)='f'
		  and seg_type in (Const_0,Const_1,Const_2,Const_4);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24014
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24014"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24014"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 4;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where (isNotNull(start_device_type) or isNotNull(end_device_type))
		  and link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where ((isNotNull(start_device_type) and not exists(select 1 from CM_PORT_FIBER t1 where t1.int_id=c.start_equipport_id))
		       or (isNotNull(end_device_type) and not exists(select 1 from CM_PORT_FIBER t1 where t1.int_id=c.end_equipport_id)))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'4''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24015
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24015"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24015"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 4;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where (isNotNull(start_device_type) or isNotNull(end_device_type))
		  and link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where ((isNotNull(start_device_type)
		         and not exists(select 1
		                          from CM_DEVICE_OPTIC t1
		                         where t1.device_type=c.start_device_type
		                           and t1.int_id=c.start_device_id))
		       or (isNotNull(end_device_type)
		           and not exists(select 1
		                            from CM_DEVICE_OPTIC t1
		                           where t1.device_type=c.end_device_type
		                             and t1.int_id=c.end_device_id)))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'4''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24017
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24017"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24017"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_3            varchar(3) := 3;
   Const_4            varchar(3) := 4;
   Const_5            varchar(3) := 5;
   Const_6            varchar(3) := 6;
   Const_7            varchar(3) := 7;
   Const_8            varchar(3) := 8;
   Const_9            varchar(3) := 9;
   Const_10           varchar(3) := 10;
   Const_11           varchar(3) := 11;
   Const_12           varchar(3) := 12;
   Const_13           varchar(3) := 13;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type is null
		   or seg_type <> Const_5;

	 --错误量
   update CM_LAYINGSEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (a_object_type not in(Const_0,Const_1,Const_2,Const_3,Const_4,Const_5,Const_6,Const_7,Const_8,
		                            Const_9,Const_10,Const_11,Const_12,Const_13,Const_14,Const_15)
		        or a_object_type is null
		        or (a_object_type=Const_0  and not exists(select 1 from CE_DEVICE_GJ t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_1  and not exists(select 1 from CE_DEVICE_GF t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_2  and not exists(select 1 from CE_DEVICE_GB t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_3  and not exists(select 1 from CE_DEVICE_JT t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_4  and not exists(select 1 from CE_DEVICE_DMT t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_5  and not exists(select 1 from CE_DEVICE_OBD t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_6  and not exists(select 1 from CE_DEVICE_ODF t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_7  and not exists(select 1 from CE_DEVICE_IDF t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_8  and not exists(select 1 from CE_DEVICE_DDF t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_9  and not exists(select 1 from CE_FACILITY_WELL t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_10 and not exists(select 1 from CE_FACILITY_POLE t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_11 and not exists(select 1 from CE_FACILITY_STONE t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_12 and not exists(select 1 from CE_FACILITY_SUPPORT t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_13 and not exists(select 1 from CE_FACILITY_UP t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_14 and not exists(select 1 from RM_AREA_SITE t where t.int_id=c.a_object_id))
		        or (a_object_type=Const_15 and not exists(select 1 from RM_AREA_RESPOINT t where t.int_id=c.a_object_id))
		        or z_object_type not in(Const_0,Const_1,Const_2,Const_3,Const_4,Const_5,Const_6,Const_7,Const_8,
		                                Const_9,Const_10,Const_11,Const_12,Const_13,Const_14,Const_15)
		        or z_object_type is null
		        or (z_object_type=Const_0  and not exists(select 1 from CE_DEVICE_GJ t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_1  and not exists(select 1 from CE_DEVICE_GF t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_2  and not exists(select 1 from CE_DEVICE_GB t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_3  and not exists(select 1 from CE_DEVICE_JT t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_4  and not exists(select 1 from CE_DEVICE_DMT t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_5  and not exists(select 1 from CE_DEVICE_OBD t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_6  and not exists(select 1 from CE_DEVICE_ODF t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_7  and not exists(select 1 from CE_DEVICE_IDF t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_8  and not exists(select 1 from CE_DEVICE_DDF t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_9  and not exists(select 1 from CE_FACILITY_WELL t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_10 and not exists(select 1 from CE_FACILITY_POLE t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_11 and not exists(select 1 from CE_FACILITY_STONE t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_12 and not exists(select 1 from CE_FACILITY_SUPPORT t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_13 and not exists(select 1 from CE_FACILITY_UP t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_14 and not exists(select 1 from RM_AREA_SITE t where t.int_id=c.z_object_id))
		        or (z_object_type=Const_15 and not exists(select 1 from RM_AREA_RESPOINT t where t.int_id=c.z_object_id))
		       )
		  and (seg_type is null or seg_type <> Const_5);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24044
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24044"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24044"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_fiberNoIsContinuousForFiberLink(c.int_id) is not null
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24045
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24045"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24045"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1
		                    from CM_PORT_FIBER cp,CE_WARE_ODM odm
		                   where odm.int_id=cp.related_odm
		                     and cp.int_id=c.start_equipport_id)
		        or not exists(select 1
		                        from CM_PORT_FIBER cp,CE_WARE_ODM odm
		                       where odm.int_id=cp.related_odm
		                         and cp.int_id=c.end_equipport_id))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
 end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24046
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24046"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24046"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1
		                    from CM_PORT_FIBER cp,CR_DEVICE_AREA cr,RM_AREA_ROOM room,RM_AREA_SITE site
		                   where site.int_id=room.related_site
		                     and room.int_id=cr.equiproom_id
		                     and cr.device_id=cp.related_device
		                     and cr.device_type=cp.related_device_type
		                     and cp.int_id=c.start_equipport_id)
		        or not exists(select 1
		                        from CM_PORT_FIBER cp,CR_DEVICE_AREA cr,RM_AREA_ROOM room,RM_AREA_SITE site
		                       where site.int_id=room.related_site
		                         and room.int_id=cr.equiproom_id
		                     	   and cr.device_id=cp.related_device
		                         and cr.device_type=cp.related_device_type
		                         and cp.int_id=c.end_equipport_id))
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24047
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24047"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24047"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --硬件类型ware_type:0,ODM;1,法兰盘
   v_waretype         varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_WARE
		where ware_type=v_waretype;

	 --错误量
   update CM_WARE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
			                 from CE_WARE_ODM e
		                  where (select count(1) from CE_WARE_FLANGE card where card.related_odm=e.int_id) in (to_number(e.row_num),to_number(e.column_num))
		                    and to_number(e.row_num)*to_number(e.column_num)=(select count(1) from CM_PORT_FIBER cp where cp.related_odm=e.int_id)
		                    and e.int_id=c.int_id)
		  and ware_type=v_waretype;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_WARE','ware_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24049
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24049"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24049"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --硬件类型ware_type:0,ODM;1,法兰盘
   v_waretype         varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_WARE
		where ware_type=v_waretype;

	 --错误量
   update CM_WARE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
			                 from CM_PORT_FIBER t
		                  where t.related_equipment=c.int_id)
		  and ware_type=v_waretype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_WARE','ware_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24050
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24050"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24050"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --硬件类型ware_type:0,ODM;1,法兰盘
   v_waretype         varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_WARE
		where ware_type=v_waretype;

	 --错误量
   update CM_WARE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
			                 from CM_PORT_FIBER t
		                  where t.related_odm=c.int_id)
		  and ware_type=v_waretype;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_WARE','ware_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24053
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24053"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24053"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --硬件类型ware_type:0,ODM;1,法兰盘
   v_waretype         varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_WARE
		where ware_type=v_waretype;

	 --错误量
   update CM_WARE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
			                 from CE_WARE_FLANGE t
		                  where t.related_odm=c.int_id)
		  and ware_type=v_waretype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_WARE','ware_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24059
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24059"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24059"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   Const_5            varchar(3) := 5;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type <> Const_5;

	 --错误量
	 --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
	 --设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点
	  **/
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
		                  where t2.int_id=t1.a_object_id
		                    and t2.device_type=t1.a_object_type
		                    and to_number(t1.a_object_type) between 1 and 8)
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.a_object_id
									      and to_number(t2.facility_Type)=(case to_number(t1.a_object_type)
									                                       when 9 then 0
									                                       when 10 then 1
									                                       when 11 then 4
									                                       when 12 then 2
									                                       when 13 then 3 end)
									      and to_number(t1.a_object_type) between 9 and 13)
		  and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.a_object_id
									      and t1.a_object_type=Const_14)
      and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.a_object_id
									      and t1.a_object_type=Const_15)
		  and seg_type <> Const_5;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type <>'  || ''''|| Const_5 ||'''' );
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24060
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24060"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24060"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --敷设段类型layingSegmentType:0管道段,1杆路(吊线)段,2直埋段,3引上段,4挂墙段,5管孔,6连接线
   Const_5            varchar(3) := 5;
   Const_14           varchar(3) := 14;
   Const_15           varchar(3) := 15;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LAYINGSEGMENT
		where seg_type <> Const_5;

	 --错误量
	 --设备实体类型deviceType:0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF
	 --设施类型facilityType：0人手井,1电杆,2撑点,3引上点,4标石
	 /**
	   敷设段端点类型pipelineEndType
	   0光交接箱,1光分纤箱,2光终端盒,3光分纤接续点,4多媒体箱,5分光器,6ODF,7综合配线架,8DDF,
	   9人手井,10电杆,11标石,12支撑点,13引上点
	   14站点,15网络资源点
	  **/
   update CM_LAYINGSEGMENT t1
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_DEVICE_OPTIC t2
		                  where t2.int_id=t1.z_object_id
		                    and t2.device_type=t1.z_object_type
		                    and to_number(t1.z_object_type) between 1 and 8)
		  and not exists(select 1
		                   from CM_FACILITY t2
									    where t2.int_id=t1.z_object_id
									      and to_number(t2.facility_Type)=(case to_number(t1.z_object_type)
									                                       when 9 then 0
									                                       when 10 then 1
									                                       when 11 then 4
									                                       when 12 then 2
									                                       when 13 then 3 end)
									      and to_number(t1.z_object_type) between 9 and 13)
		  and not exists(select 1
		                   from RM_AREA_SITE t2
									    where t2.int_id=t1.z_object_id
									      and t1.z_object_type=Const_14)
      and not exists(select 1
		                   from RM_AREA_RESPOINT t2
									    where t2.int_id=t1.z_object_id
									      and t1.z_object_type=Const_15)
		  and seg_type <> Const_5;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LAYINGSEGMENT','seg_type <>'  || ''''|| Const_5 ||'''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24063
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24063"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24063"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_3            varchar(3) := 3;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_WARE_ODM;

	 --错误量
	 --排列方式sort_type:0从上到下,1从下到上,2从左到右,3从右到左
   update CE_WARE_ODM c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (case when c.sort_type in (Const_0,Const_1) and to_number(row_num) >=0 then to_number(row_num)
		            when c.sort_type in (Const_2,Const_3) and to_number(column_num)>=0 then to_number(column_num)
		            else -1 end)
		        <> (select count(1) from CE_WARE_FLANGE t where t.related_odm=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_WARE_ODM');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24064
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24064"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24064"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
   Const_2            varchar(3) := 2;
   Const_3            varchar(3) := 3;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_WARE_ODM;

	 --错误量
	 --排列方式sort_type:0从上到下,1从下到上,2从左到右,3从右到左
   update CE_WARE_ODM c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (case when c.sort_type in (Const_0,Const_1) and to_number(column_num) >=0 then to_number(column_num)
		            when c.sort_type in (Const_2,Const_3) and to_number(row_num)>=0 then to_number(row_num)
		            else -1 end)*(select count(1) from CE_WARE_FLANGE t where t.related_odm=c.int_id)
		        <> (select count(1)
		              from CE_WARE_FLANGE t,CM_PORT_FIBER t2
		             where t2.related_equipment=t.int_id
		               and t.related_odm=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_WARE_ODM');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24065
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24065"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24065"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_0            varchar(3) := 0;
   Const_1            varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_LAYINGSEGMENT_WELLSEG;

	 --错误量
	 --管孔级别tubeholeLevel:0	主孔,1子孔
   update CE_LAYINGSEGMENT_WELLSEG c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where coalesce(to_number(c.tubehole_count),-1)
			    <>((select count(1)
			         from CE_LAYINGSEGMENT_TUBEHOLE t1
			        where t1.related_layingsegment=c.int_id
			          and t1.tubehole_level in (Const_0,Const_1))
			        - (select count(1)
			             from CE_LAYINGSEGMENT_TUBEHOLE t1
			            where exists(select 1
			                           from CE_LAYINGSEGMENT_TUBEHOLE t2
			                          where t2.parent_id=t1.int_id
			                            and t2.tubehole_level=Const_1)
			              and t1.related_layingsegment=c.int_id
			              and t1.tubehole_level=Const_0));

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_LAYINGSEGMENT_WELLSEG');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_24067
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_24067"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_24067"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (select count(1) from CE_CABLE_FIBER t where t.fibercableseg_id=c.int_id)
		        <> (select coalesce(max(to_number(t.fiber_no)),-1) from CE_CABLE_FIBER t where t.fibercableseg_id=c.int_id)
		  and cable_type=v_cabletype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_25001
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_25001"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_25001"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_FACILITY;

	 --错误量
   update CM_FACILITY c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_LAYINGSEGMENT t
		                  where to_number(t.a_object_type)=(case to_number(c.facility_Type)
		                                                    when 0 then 9
		                                                    when 1 then 10
		                                                    when 2 then 12
		                                                    when 3 then 13
		                                                    when 4 then 11 end)
		                    and t.a_object_id=c.int_id)
		  and not exists(select 1
		                   from CM_LAYINGSEGMENT t
		                  where to_number(t.z_object_type)=(case to_number(c.facility_Type)
		                                                    when 0 then 9
		                                                    when 1 then 10
		                                                    when 2 then 12
		                                                    when 3 then 13
		                                                    when 4 then 11 end)
		                    and t.z_object_id=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
    perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_FACILITY');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_25002
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_25002"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_25002"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from RM_AREA_SITE;

	 --错误量
   update RM_AREA_SITE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from RM_AREA_ROOM t
		                  where t.related_site=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'RM_AREA_SITE');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_25003
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_25003"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_25003"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from RM_AREA_ROOM;

	 --错误量
   update RM_AREA_ROOM c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from RM_AREA_RACKPOS t
		                  where t.equiproom_id=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'RM_AREA_ROOM');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_25004
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_25004"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_25004"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_DEVICE_OPTIC;

	 --错误量
   update CM_DEVICE_OPTIC c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_CABLE t
		                  where t.a_object_id=c.int_id
		                    and t.a_object_type=c.device_type)
		  and not exists(select 1
		                   from CM_CABLE t
		                  where t.z_object_id=c.int_id
		                    and t.z_object_type=c.device_type);

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_DEVICE_OPTIC');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_25005
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_25005"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_25005"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_WARE_ODM;

	 --错误量
   update CE_WARE_ODM c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CE_WARE_FLANGE t
		                  where t.related_odm=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_WARE_ODM');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_25006
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_25006"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_25006"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_WARE_FLANGE;

	 --错误量
   update CE_WARE_FLANGE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_PORT_FIBER t
		                  where t.related_equipment=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_WARE_FLANGE');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_25007
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_25007"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_25007"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_CABLE_SEGMENT;

	 --错误量
   update CE_CABLE_SEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CE_CABLE_FIBER t
		                  where t.fibercableseg_id=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_CABLE_SEGMENT');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26001
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26001"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26001"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_DEVICE_JT;

	 --错误量
   update CE_DEVICE_JT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CM_FACILITY t
		                  where t.int_id=c.up_to_facility
		                    and t.facility_Type=c.facility_Type);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_DEVICE_JT');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26002
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26002"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26002"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_CABLE_SEGMENT;

	 --错误量
   update CE_CABLE_SEGMENT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where coalesce(to_number(c.fiber_count),-1)
		       <>(select count(1) from CE_CABLE_FIBER t where t.fibercableseg_id=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_CABLE_SEGMENT');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26005
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26005"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26005"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_0            varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_LAYINGSEGMENT_WELLSEG;

	 --错误量
   update CE_LAYINGSEGMENT_WELLSEG c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CE_LAYINGSEGMENT_TUBEHOLE t
		                  where t.tubehole_level=Const_0 --管孔级别tubeholeLevel:0,主孔;1,子孔
		                    and t.related_layingsegment=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_LAYINGSEGMENT_WELLSEG');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26006
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26006"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26006"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_2            varchar(3) := 2;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_LINK_OCIRCUIT;

	 --错误量
	 --链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系;1,局向光纤与局向光缆关系;2,光路与光路路由关系
   update CE_LINK_OCIRCUIT c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CR_LINK_LINK_TRANSO r,CE_LINK_OCIRCUITROUTE t
		                  where t.int_id=r.lower_link_id
		                    and r.link_Link_Type=Const_2
		                    and r.upper_link_id=c.int_id);

	 get diagnostics v_errorAmount = row_count;


	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_LINK_OCIRCUIT');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26007
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26007"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26007"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_2            varchar(3) := 2;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_LINK_OCIRCUITROUTE;

	 --错误量
	 --链路链路关系类型linkLinkType:0,光路路由与局向光纤/硬跳关系;1,局向光纤与局向光缆关系;2,光路与光路路由关系
   update CE_LINK_OCIRCUITROUTE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CR_LINK_LINK_TRANSO r,CE_LINK_OCIRCUIT t
		                  where t.int_id=r.upper_link_id
		                    and r.link_Link_Type=Const_2
		                    and r.lower_link_id=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	--指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_LINK_OCIRCUITROUTE');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26008
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26008"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26008"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_CABLE_FIBER;

	 --错误量
   update CE_CABLE_FIBER c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CE_CABLE_SEGMENT t
		                  where t.int_id=c.fibercableseg_id);

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_CABLE_FIBER');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26011
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26011"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26011"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   Const_6            varchar(3) := 6;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CE_DEVICE_ODF;

	 --错误量
   update CE_DEVICE_ODF c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where not exists(select 1
		                   from CR_DEVICE_AREA cr,RM_AREA_ROOM room,RM_AREA_SITE site
		                  where site.int_id=room.related_site
		                    and room.int_id=cr.equiproom_id
		                    and cr.device_type=Const_6 --设备实体类型deviceType:6,ODF
		                    and cr.device_id=c.int_id)
		   or not exists(select 1
		                   from CR_DEVICE_AREA cr,RM_AREA_RACKPOS rp
		                  where rp.int_id=cr.rackposition_id
		                    and cr.device_type=Const_6 --设备实体类型deviceType:6,ODF
		                    and cr.device_id=c.int_id);

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CE_DEVICE_ODF');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26012
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26012"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26012"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (not exists(select 1 from CE_PORT_EQUIPPORT t where t.int_id=c.start_equipport_id)
		        or not exists(select 1 from CE_PORT_EQUIPPORT t where t.int_id=c.end_equipport_id)
		        or func_isOCircuitConnected(c.int_id,true) is not null)
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26013
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26013"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26013"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_isOCircuitConnected(c.int_id,true) is not null
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26014
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26014"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26014"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype         varchar(3) := 0;
   Const_1             varchar(3) := 1;
	 v_indexId	         integer;
   v_name              varchar(100);
	 v_code              varchar(100);
	 v_taskId	           integer;
	 v_collectionDate    timestamp;
	 v_province	         varchar(100);
   v_amount            integer;
	 v_errorAmount       integer;
	 v_indexValue        numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE c
		where cable_type=v_cabletype;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where (to_number(length) is null
		       or to_number(length)=0
					 or abs(to_number(length)-(select coalesce(sum(to_number(t.m_length)),0)
					                             from CR_LAYINGSEGMENT_CABLE r,CM_LAYINGSEGMENT t
					                            where t.int_id=r.layingsegment_id
					                              and t.seg_type=r.layingSegment_Type
					                              and r.layingseg_cable_type=Const_1 --敷设端与缆线关系类型layingsegCableType:1	敷设段与光缆段关系
					                              and r.cable_id=c.int_id)) > to_number(length)*0.1::numeric)
		  and cable_type=v_cabletype;

	 get diagnostics v_errorAmount = row_count;

	  --指标值
	 if v_amount <> 0 then
	    v_indexValue := (v_amount-v_errorAmount)::numeric(20,5)/v_amount;
	 else
	    v_indexValue := 0;
	 end if;

   insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,province,
	                                    amount,errorAmount,indexValue,creator,updater)
	 values(v_name,v_code,v_taskId,v_indexId,v_collectionDate,v_province,
	        v_amount,v_errorAmount,v_indexValue,'db','db');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26015
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26015"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26015"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --缆线类型cable_type:0光缆段,1纤芯
   v_cabletype        varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_CABLE
		where cable_type=v_cabletype;

	 --错误量
   update CM_CABLE c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_isCableConnected(c.int_id) is not null
		  and cable_type=v_cabletype;

	 get diagnostics v_errorAmount = row_count;

	 --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_CABLE','cable_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26016
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26016"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26016"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 1;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
          dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_isFiberLinkConnected(c.int_id,false) is not null
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'1''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for proc_dims_tno_26017
-- ----------------------------
DROP FUNCTION IF EXISTS "proc_dims_tno_26017"("p_taskid" int4, "p_indexcode" varchar);
CREATE OR REPLACE FUNCTION "proc_dims_tno_26017"("p_taskid" int4, "p_indexcode" varchar)
  RETURNS "void" AS $$
declare
   --链路类型link_type:0光路,1局向光纤,2局向光缆,3光路路由,4硬跳
   v_linktype         varchar(3) := 0;
	 v_indexId	        integer;
   v_name             varchar(100);
	 v_code             varchar(100);
	 v_taskId	          integer;
	 v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_amount           integer;
	 v_errorAmount      integer;
	 v_indexValue       numeric(6,5);
begin

	 select id,name,code
	   into v_indexId,v_name,v_code
	   from dims_idx_index
	  where code=p_indexCode;

   select id,province,startTime
	   into v_taskId,v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --总量
	 select count(1)
	   into v_amount
		 from CM_LINK_TRANSO
		where link_type=v_linktype;

	 --错误量
   update CM_LINK_TRANSO c
	    set dims_col_result=(case when dims_col_result like '%'||p_indexCode||'%' then dims_col_result
			                          when dims_col_result is null then p_indexCode
																else dims_col_result||','||p_indexCode end),
				  dims_col_rtName=(case when dims_col_rtName like '%'||v_name||'%' then dims_col_rtName
			                          when dims_col_rtName is null then '不满足规范:'||v_name
																else dims_col_rtName||','||v_name end)
		where func_isOCircuitConnected(c.int_id,false) is not null
		  and link_type=v_linktype;

	 get diagnostics v_errorAmount = row_count;

	  --指标值统计
	 perform proc_generateCommonIndexValue(p_taskid,v_indexId,'CM_LINK_TRANSO','link_type='|| '''' ||'0''');
end;
$$
  LANGUAGE plpgsql
  COST 100;

-- ----------------------------
-- Function structure for to_number
-- ----------------------------
DROP FUNCTION IF EXISTS "to_number"(anyelement);
CREATE OR REPLACE FUNCTION "to_number"(anyelement)
  RETURNS "numeric" AS $$
 declare
 begin
    return $1::numeric;
 exception when others then
    return null;
 end;
$$
  LANGUAGE plpgsql IMMUTABLE
  COST 100;

/*20191104 没有变化*/

/*20191110 集合类指标统计时过滤掉总量为0的*/
DROP FUNCTION IF EXISTS "proc_checkindexset"("p_taskid" int4);
CREATE OR REPLACE FUNCTION "proc_checkindexset"("p_taskid" int4)
  RETURNS "void" AS $$
declare
   cur                record;
begin
	 for cur in (select id from dims_idx_index where type=3 and isenable=1)
	 loop
	    perform proc_checkOneIndexSet(p_taskId,cur.id);
	 end loop;
end;
$$
  LANGUAGE plpgsql
  COST 100;


--20191218新增

--指标集合对应的存过
create or replace function proc_checkOneIndexSet(p_taskid integer,p_indexId integer) returns void as
$$
declare
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
   v_idxName          varchar(100);
	 v_idxCode          varchar(100);
	 v_count   int4;
begin

	 --task属性
	 select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;

	 --指标属性
	 select name,code
	   into v_idxName,v_idxCode
	   from dims_idx_index
	  where id=p_indexId;

	 --支持重复核查
   delete from dims_tm_taskItem_index where task_id=p_taskId and index_id=p_indexId;

   --区县的指标:regionType=3
	 insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskid,p_indexId,v_collectionDate,
	        provinceCode,prefectureCode,countyCode,3,
	        null,null,coalesce(avg(it.indexValue),0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.amount >0
	    and it.regionType=3
	    and it.task_id=p_taskid
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId
	 group by provinceCode,prefectureCode,countyCode;
	  
   --地市的指标:regionType=2
	 insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskid,p_indexId,v_collectionDate,
	        provinceCode,prefectureCode,null,2,
	        null,null,coalesce(avg(it.indexValue),0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.amount >0
	    and it.regionType=2
	    and it.task_id=p_taskid
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId
	 group by provinceCode,prefectureCode;
	 
	 --省份的指标:regionType=1
	 insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
	 select v_idxName,v_idxCode,p_taskid,p_indexId,v_collectionDate,
	        provinceCode,null,null,1,
	        null,null,coalesce(avg(it.indexValue),0),'db','db'
	   from dims_idx_IndexCarrier r,dims_tm_taskItem_index it
	  where it.amount >0
	    and it.regionType=1
	    and it.task_id=p_taskid
	    and it.index_id=r.childIndex_id
	    and r.parentIndex_id=p_indexId
	 group by provinceCode;
	
   --指标值,更新指标的区域名称
   update dims_tm_taskItem_index t
      set province=(select name from dims_tm_areaCodeConfig where code=t.provinceCode and regiontype=1),
          prefecture=(select name from dims_tm_areaCodeConfig where code=t.prefectureCode and regiontype=2),
          county=(select name from dims_tm_areaCodeConfig where code=t.countyCode and regiontype=3)
    where task_id=p_taskid
      and index_id=p_indexId;
end;
$$ language plpgsql;



--根据已标记的数据生成指标
create or replace function proc_generateCommonIndexValue(p_taskId integer,p_indexId integer,p_tableName varchar,p_condition varchar default null) returns void as
$$
declare 
   v_collectionDate   timestamp;
	 v_province	        varchar(100);
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
   
   --task属性
	 select province,startTime
	   into v_province,v_collectionDate
		 from dims_tm_task
		where id=p_taskId;
		
   --指标属性
	 select name,code 
	   into v_idxName,v_idxCode 
	   from dims_idx_index 
	  where id=p_indexId;
		
	 --支持重复核查
   delete from dims_tm_taskItem_index where task_id=p_taskId and index_id=p_indexId;
         
   --带条件?
   if p_condition is null then
      v_tabWhereSql := p_tableName;
   else
      v_tabWhereSql := p_tableName ||' t1 where '||p_condition;
   end if;
     
	 --区县的指标
	 v_selectSql := 'select province_code,prefecture_code,county_code,
		                      count(1) amount,
		                      coalesce(sum(case when dims_col_result like ''%'||v_idxCode||'%'' then 1 else 0 end),0) errorCount 
		                 from '||v_tabWhereSql||' 
		               group by province_code,prefecture_code,county_code';
	 
	 open cur for execute v_selectSql;
	 fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_amount,v_errorCount;
	 
	 while found loop
	    insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,
	                                      provinceCode,prefectureCode,countyCode,regionType,
	                                      amount,errorAmount,indexValue,creator,updater)
      values(v_idxName,v_idxCode,p_taskId,p_indexId,v_collectionDate,
             v_provinceCode,v_prefectureCode,v_countyCode,3,
             v_amount,v_errorCount,null,'db','db');
             
	    fetch cur into v_provinceCode,v_prefectureCode,v_countyCode,v_amount,v_errorCount;
	 end loop;
	 close cur;
	  
   --没有数据，就插入一条区县级别的0，0，0   
   select count(1) 
     into v_count 
     from dims_tm_taskItem_index 
    where task_id=p_taskId
      and index_id=p_indexId;
   if v_count =0 then
     insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,
                                        province,
	                                      provinceCode,prefectureCode,countyCode,regionType,
	                                      amount,errorAmount,indexValue,creator,updater)
      values(v_idxName,v_idxCode,p_taskId,p_indexId,v_collectionDate,
             null,
             null,null,null,3,
             0,0,0,'db','db');
   end if;
   
   --地市的指标:regionType=2
	 insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
   select v_idxName,v_idxCode,p_taskId,p_indexId,v_collectionDate,
          provinceCode,prefectureCode,null,2,
          sum(amount),sum(errorAmount),null,'db','db'
     from dims_tm_taskItem_index
    where task_id=p_taskId  
      and index_id=p_indexId
      and regionType=3
   group by provinceCode,prefectureCode;
	 
	 --省份的指标:regionType=1
	 insert into dims_tm_taskItem_index(name,code,task_id,index_id,collectionDate,
	                                    provinceCode,prefectureCode,countyCode,regionType,
	                                    amount,errorAmount,indexValue,creator,updater)
   select v_idxName,v_idxCode,p_taskId,p_indexId,v_collectionDate,
          provinceCode,null,null,1,
          sum(amount),sum(errorAmount),null,'db','db'
     from dims_tm_taskItem_index
    where task_id=p_taskId  
      and index_id=p_indexId
      and regionType=3
   group by provinceCode;
	
   --指标值,更新指标的区域名称
   update dims_tm_taskItem_index t
      set indexValue=(case when amount=0 then 0 else (amount-errorAmount)::numeric(20,5)/amount end),
          province=(select name from dims_tm_areaCodeConfig where code=t.provinceCode and regiontype=1),
          prefecture=(select name from dims_tm_areaCodeConfig where code=t.prefectureCode and regiontype=2),
          county=(select name from dims_tm_areaCodeConfig where code=t.countyCode and regiontype=3)
    where task_id=p_taskId
      and index_id=p_indexId;
end;
$$ language plpgsql;
