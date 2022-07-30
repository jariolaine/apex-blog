prompt --application/deployment/install/upgrade_patch_21_2_20220612
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 21.2.20220612
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(19618626116182717)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 21.2.20220612'
,p_sequence=>50
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20220612'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 21.2.20220612',
'--------------------------------------------------------',
'-- Drop obsolete columns',
'--------------------------------------------------------',
'alter table blog_features drop column help_message;',
'alter table blog_settings drop column post_expression;',
'alter table blog_list_of_values drop column notes;',
'alter table blog_subscribers_email drop column notes;',
'-------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20220612'',''STRING'',''INTERNAL'',''Patch 21.2.20220612'')',
';',
''))
);
wwv_flow_imp.component_end;
end;
/
