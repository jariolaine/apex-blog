prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(20741295540297154)
,p_welcome_message=>'This application installer will guide you through the process of creating meta data necessary to run the APEX Blog application.'
,p_license_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>The MIT License (MIT)',
'',
'Copyright (c) 2021, 2023, Jari Laine',
'',
'Permission is hereby granted, free of charge, to any person obtaining a copy of',
'this software and associated documentation files (the "Software"), to deal in',
'the Software without restriction, including without limitation the rights to',
'use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of',
'the Software, and to permit persons to whom the Software is furnished to do so,',
'subject to the following conditions:',
'',
'The above copyright notice and this permission notice shall be included in all',
'copies or substantial portions of the Software.',
'',
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR',
'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS',
'FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR',
'COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER',
'IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN',
'CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
'</pre>'))
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_install_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Blog supporting objects have been installed successfully.',
'',
'For login to Blog Administration Area, you must create APEX workspace user group "Bloggers" and assign APEX user to this group.'))
,p_install_failure_message=>'Installation of meta data has failed.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_get_version_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from user_views',
'where 1 = 1',
'and view_name = ''BLOG_V_VERSION'''))
,p_deinstall_success_message=>'Deinstallation complete.'
,p_required_free_kb=>200
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE TYPE :CREATE VIEW'
);
wwv_flow_imp.component_end;
end;
/
