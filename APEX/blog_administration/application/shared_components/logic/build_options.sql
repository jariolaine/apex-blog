prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8935943081653812)
,p_build_option_name=>'Under development'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Objects whose development is ongoing'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(10006498624902877)
,p_build_option_name=>'Obsolete'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Obsolete objects that are considered to be removed'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(24687280101070827)
,p_build_option_name=>'Commented out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Features that have been commented out'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(35674953070739317)
,p_build_option_name=>'APEX Authentication'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable or disable APEX authentication from login screen'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(35675193135740905)
,p_build_option_name=>'Google Authentication'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable or disable Google authentication from login screen'
);
wwv_flow_imp.component_end;
end;
/
