prompt --application/shared_components/web_sources/abstract_email_validation_api
begin
--   Manifest
--     WEB SOURCE: Abstract email validation API
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_web_source_module(
 p_id=>wwv_flow_api.id(37429250721418891)
,p_name=>'Abstract email validation API'
,p_static_id=>'ABSTRACT_EMAIL_VALIDATION_API'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_api.id(37423660597418881)
,p_remote_server_id=>wwv_flow_api.id(37422434064399125)
,p_url_path_prefix=>'v1/'
,p_credential_id=>wwv_flow_api.id(37422157706388629)
,p_module_comment=>'Abstract email validation API (https://www.abstractapi.com/)'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(37429839722418904)
,p_web_src_module_id=>wwv_flow_api.id(37429250721418891)
,p_name=>'email'
,p_param_type=>'QUERY_STRING'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(37430564172438044)
,p_web_src_module_id=>wwv_flow_api.id(37429250721418891)
,p_name=>'User-Agent'
,p_param_type=>'HEADER'
,p_value=>'Oracle Application Express (gzip)'
,p_is_static=>true
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(37430811489439859)
,p_web_src_module_id=>wwv_flow_api.id(37429250721418891)
,p_name=>'Accept-Encoding'
,p_param_type=>'HEADER'
,p_value=>'gzip, deflate'
,p_is_static=>true
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(37432177074490919)
,p_web_src_module_id=>wwv_flow_api.id(37429250721418891)
,p_name=>'Accept'
,p_param_type=>'HEADER'
,p_value=>'application/json'
,p_is_static=>true
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(37464066974199161)
,p_web_src_module_id=>wwv_flow_api.id(37429250721418891)
,p_name=>'response'
,p_param_type=>'BODY'
,p_is_required=>false
,p_direction=>'OUT'
);
wwv_flow_api.create_web_source_param(
 p_id=>wwv_flow_api.id(37499001098237524)
,p_web_src_module_id=>wwv_flow_api.id(37429250721418891)
,p_name=>'auto_correct'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'false'
);
wwv_flow_api.create_web_source_operation(
 p_id=>wwv_flow_api.id(37429496710418902)
,p_web_src_module_id=>wwv_flow_api.id(37429250721418891)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_allow_fetch_all_rows=>false
,p_invalidate_when=>'FREQ=DAILY;BYHOUR=0;BYMINUTE=0;BYSECOND=0'
);
wwv_flow_api.component_end;
end;
/
