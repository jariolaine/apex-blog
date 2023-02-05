prompt --application/deployment/buildoptions
begin
--   Manifest
--     INSTALL BUILD OPTIONS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_build_option(
 p_id=>wwv_flow_imp.id(19465075295102163)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_build_opt_id=>wwv_flow_imp.id(35674953070739317)
);
wwv_flow_imp_shared.create_install_build_option(
 p_id=>wwv_flow_imp.id(19465233808102163)
,p_install_id=>wwv_flow_imp.id(31706870664802069)
,p_build_opt_id=>wwv_flow_imp.id(35675193135740905)
);
wwv_flow_imp.component_end;
end;
/