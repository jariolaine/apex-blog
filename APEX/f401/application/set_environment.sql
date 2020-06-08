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
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
end;
/
 
prompt APPLICATION 401 - Blog Public Pages
--
-- Application Export:
--   Application:     401
--   Name:            Blog Public Pages
--   Exported By:     BLOG_040000
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     12
--       Items:                   30
--       Computations:             5
--       Validations:              1
--       Processes:               14
--       Regions:                 28
--       Buttons:                  6
--       Dynamic Actions:          9
--     Shared Components:
--       Logic:
--         Items:                  6
--         Processes:              2
--         Build Options:         16
--       Navigation:
--         Lists:                  6
--       Security:
--         Authentication:         2
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
--           Report:              13
--         LOVs:                   1
--         Shortcuts:             11
--         Plug-ins:               1
--       Globalization:
--         Messages:              11
--       Reports:
--       E-Mail:
--         Templates:              1
--     Supporting Objects:  Excluded
--   Version:         19.2.0.00.18
--   Instance ID:     9502710254078678
--

