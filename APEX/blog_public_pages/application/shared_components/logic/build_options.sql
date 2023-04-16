prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(6905258727754156)
,p_build_option_name=>'BLOG_FEATURE_LINKS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable link lists page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(7073708623458378)
,p_build_option_name=>'BLOG_FEATURE_ALLOW_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable commenting to posts'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8635198962090938)
,p_build_option_name=>'BLOG_FEATURE_RSS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable "Subscribe in a Reader" link and page header link tag'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8635355820099640)
,p_build_option_name=>'BLOG_FEATURE_CATEGORY'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable categories list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8667733481689180)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_POSTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search from posts'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8670890848739263)
,p_build_option_name=>'BLOG_FEATURE_ARCHIVE'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable posts archives list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(8677319562925389)
,p_build_option_name=>'BLOG_FEATURE_LATEST_POSTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable latest posts list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(13228264961862184)
,p_build_option_name=>'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable tag post count in list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(13229141933919002)
,p_build_option_name=>'BLOG_FEATURE_TAG_CLOUD'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable tag cloud list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(24626889314854172)
,p_build_option_name=>'BLOG_FEATURE_FILES'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable files repository page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(25684564406281886)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_FILES'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search from files'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(25684767186283357)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_LINKS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search from links'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(27920818779089933)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Features that have been commented out'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(27921011391085431)
,p_build_option_name=>'BLOG_FEATURE_POST_PAGINATION'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable post pagination in page 2'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(28281277020489892)
,p_build_option_name=>'BLOG_FEATURE_MODERATE_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable comments moderation'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(30111637437970455)
,p_build_option_name=>'BLOG_FEATURE_ABOUT'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable about page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(33703543205326403)
,p_build_option_name=>'BLOG_FEATURE_SUBSCRIBE_COMMENTS'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable the ability to subscribe to email notification of new comments'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(38733755214623299)
,p_build_option_name=>'Obsolete'
,p_build_option_status=>'EXCLUDE'
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(39030203881986717)
,p_build_option_name=>'BLOG_FEATURE_SEARCH'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(41172379976935637)
,p_build_option_name=>'BLOG_FEATURE_SITEMAP'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable sitemap application processes'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(42618909236023987)
,p_build_option_name=>'BLOG_FEATURE_MODAL_PAGES'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable modal pages links in footer'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(60750107251132123)
,p_build_option_name=>'BLOG_FEATURE_ARCHIVE_POST_COUNT'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable post archive count in list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(60984441774027659)
,p_build_option_name=>'BLOG_FEATURE_CATEGORY_POST_COUNT'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable category post count in list'
);
wwv_flow_imp.component_end;
end;
/
