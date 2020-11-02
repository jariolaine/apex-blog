prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 402
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8935943081653812)
,p_build_option_name=>'Not Ready'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Not ready features'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(10006498624902877)
,p_build_option_name=>'Obsolete'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Obsolete objects that should be removed'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(24687280101070827)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Features that are commented out for now.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(24687510906079791)
,p_build_option_name=>'Need Review'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_build_option_comment=>'Objects that need to reviewed and changed in future.'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(35674953070739317)
,p_build_option_name=>'APEX Authentication'
,p_build_option_status=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable or disable APEX authentication from login screen'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(35675193135740905)
,p_build_option_name=>'Google Authentication'
,p_build_option_status=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable or disable Google authentication from login screen'
);
wwv_flow_api.component_end;
end;
/
