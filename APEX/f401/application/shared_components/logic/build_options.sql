prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(6905258727754156)
,p_build_option_name=>'BLOG_FEATURE_LINKS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide link lists page'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(7073708623458378)
,p_build_option_name=>'BLOG_FEATURE_ALLOW_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow/disallow commenting to posts'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(7122597691878829)
,p_build_option_name=>'Not Ready'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Objects need development'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8635198962090938)
,p_build_option_name=>'BLOG_FEATURE_RSS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide "Subscribe in a Reader" link and page header link tag'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8635355820099640)
,p_build_option_name=>'BLOG_FEATURE_CATEGORY'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide categories list and page'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8667733481689180)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_POSTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow/disallow search from posts'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8670890848739263)
,p_build_option_name=>'BLOG_FEATURE_ARCHIVE'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide posts archives list and page'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(8677319562925389)
,p_build_option_name=>'BLOG_FEATURE_LATEST_POSTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide latest posts list'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(24626889314854172)
,p_build_option_name=>'BLOG_FEATURE_FILES'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/Hide files repository page'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(25684564406281886)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_FILES'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow/disallow search from files'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(25684767186283357)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_LINKS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow/disallow search from links'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(27920818779089933)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Commented out objects'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(27921011391085431)
,p_build_option_name=>'BLOG_FEATURE_POST_PAGINATION'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Single post pagination'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(28281277020489892)
,p_build_option_name=>'BLOG_FEATURE_MODERATE_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable comments need moderated'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(30111637437970455)
,p_build_option_name=>'BLOG_FEATURE_ABOUT'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/hide about page'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(33703543205326403)
,p_build_option_name=>'BLOG_FEATURE_SUBSCRIBE_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable / disable the ability to subscribe to email notification of new comments'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(41172379976935637)
,p_build_option_name=>'BLOG_FEATURE_SITEMAP'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable sitemap application processes'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(41177796042194178)
,p_build_option_name=>'BLOG_FEATURE_SITEMAPINDEX'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable sitemapindex application process'
);
wwv_flow_api.create_build_option(
 p_id=>wwv_flow_api.id(42618909236023987)
,p_build_option_name=>'BLOG_FEATURE_FOOTER_LINKS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show/Hide footer links'
);
wwv_flow_api.component_end;
end;
/
