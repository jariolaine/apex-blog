prompt --application/shared_components/logic/build_options
begin
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
end;
/
