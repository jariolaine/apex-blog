prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>44877464361218557
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(85903179208625536)
,p_build_option_name=>'BLOG_FEATURE_POST_SPEECH'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41475186520023
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable speech recognition in post page'
,p_updated_on=>wwv_flow_imp.dz('20240908140854Z')
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(91382065723485903)
,p_build_option_name=>'Under development'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Objects whose development is ongoing'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(92452621266734968)
,p_build_option_name=>'Obsolete'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Obsolete objects that are considered to be removed'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(102874015592702141)
,p_build_option_name=>'BLOG_FEATURE_OCI_OBJECT_STORAGE'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>42197561138254
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable Oracle cloud object storage'
,p_updated_on=>wwv_flow_imp.dz('20250414163203Z')
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(107133402742902918)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41374558180611
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Features that have been commented out'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(113146485644291563)
,p_build_option_name=>'BLOG_FEATURE_LANGUAGE_AI'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>42197559842309
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable comments sentiment analyze using OCI language AI'
,p_updated_on=>wwv_flow_imp.dz('20250414161322Z')
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(114745945789071814)
,p_build_option_name=>'BLOG_FEATURE_GENERATIVE_AI'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>42196881007332
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable generative AI.'
,p_updated_on=>wwv_flow_imp.dz('20250407102125Z')
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(118121075712571408)
,p_build_option_name=>'BLOG_AUTHENTICATION_APEX'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41493621973899
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable or disable APEX authentication from login screen'
,p_updated_on=>wwv_flow_imp.dz('20250201044515Z')
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(118121315777572996)
,p_build_option_name=>'BLOG_AUTHENTICATION_GOOGLE'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41493622012408
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable or disable Google authentication from login screen. Google authentication requires client id and client secret is set to credential Blog Google OAuth2. For authorization, users need to be created to workspace and assigned to Bloggers group.'
,p_updated_on=>wwv_flow_imp.dz('20250201044541Z')
);
wwv_flow_imp.component_end;
end;
/
