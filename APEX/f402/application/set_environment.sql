prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
end;
/
 
prompt APPLICATION 402 - Blog Administration
--
-- Application Export:
--   Application:     402
--   Name:            Blog Administration
--   Exported By:     BLOG_040000
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     29
--       Items:                   62
--       Computations:             7
--       Validations:              9
--       Processes:               45
--       Regions:                 66
--       Buttons:                 68
--       Dynamic Actions:         32
--     Shared Components:
--       Logic:
--         Items:                  9
--         Processes:              2
--         Computations:           5
--         Build Options:          4
--       Navigation:
--         Lists:                  4
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--           Page:                 9
--           Region:              16
--           Label:                7
--           List:                12
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               3
--           Report:              11
--         LOVs:                   9
--         Shortcuts:              2
--       Globalization:
--         Messages:              61
--       Reports:
--       E-Mail:
--         Templates:              1
--     Supporting Objects:  Excluded
--   Version:         19.2.0.00.18
--   Instance ID:     9502710254078678
--

