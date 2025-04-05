prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.7'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(80109302137924712)
,p_build_option_name=>'BLOG_FEATURE_MODERATE_COMMENTS_AI'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41488288430784
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable comments moderation automatically using AI'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(134299248056650290)
,p_build_option_name=>'BLOG_FEATURE_LINKS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39901462271507
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable link lists page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(134467697952354512)
,p_build_option_name=>'BLOG_FEATURE_ALLOW_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41492152062060
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable commenting to posts'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(136029188290987072)
,p_build_option_name=>'BLOG_FEATURE_RSS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41108683790438
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable "Subscribe in a Reader" link and page header link tag'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(136029345148995774)
,p_build_option_name=>'BLOG_FEATURE_CATEGORY'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41488292436304
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable categories list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(136061722810585314)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_POSTS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41110915195112
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search from posts'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(136064880177635397)
,p_build_option_name=>'BLOG_FEATURE_ARCHIVE'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable posts archives list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(136071308891821523)
,p_build_option_name=>'BLOG_FEATURE_LATEST_POSTS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable latest posts list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(136577204653609176)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41108683116626
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search from comments'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(140622254290758318)
,p_build_option_name=>'BLOG_FEATURE_TAG_CLOUD_POST_COUNT'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable tag post count in list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(140623131262815136)
,p_build_option_name=>'BLOG_FEATURE_TAG_CLOUD'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41473340513003
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable tag cloud list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(145826259194060489)
,p_build_option_name=>'BLOG_FEATURE_OCI_OBJECT_STORAGE'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41501171207825
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable Oracle cloud object storage'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(152020878643750306)
,p_build_option_name=>'BLOG_FEATURE_FILES'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable files repository page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(153078553735178020)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_FILES'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search from files'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(153078756515179491)
,p_build_option_name=>'BLOG_FEATURE_SEARCH_LINKS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41108683094882
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search from links'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(155314808107986067)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>1
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Features that have been commented out'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(155315000719981565)
,p_build_option_name=>'BLOG_FEATURE_POST_PAGINATION'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable post pagination in page 2'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(155675266349386026)
,p_build_option_name=>'BLOG_FEATURE_MODERATE_COMMENTS'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41489211600979
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable comments moderation'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(157505626766866589)
,p_build_option_name=>'BLOG_FEATURE_ABOUT'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41472644573157
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable about page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(158089734281512799)
,p_build_option_name=>'BLOG_FEATURE_LANGUAGE_AI'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41492181438815
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable comments sentiment analyze using OCI language AI'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(158909835543127564)
,p_build_option_name=>'BLOG_FEATURE_COMMENT_VERIFY'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41472699172483
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable comment verify question'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(161097532534222537)
,p_build_option_name=>'BLOG_FEATURE_SUBSCRIBE_COMMENTS'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41472629229444
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable the ability to subscribe to email notification of new comments'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(166127744543519433)
,p_build_option_name=>'Obsolete'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>41374574009241
,p_default_on_export=>'EXCLUDE'
,p_build_option_comment=>'Obsolete objects that are considered to be removed'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(166424193210882851)
,p_build_option_name=>'BLOG_FEATURE_SEARCH'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41473340512989
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable search page'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(166522583683199558)
,p_build_option_name=>'BLOG_FEATURE_ATOM'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable atom feed'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(168566369305831771)
,p_build_option_name=>'BLOG_FEATURE_SITEMAP'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable sitemap application processes'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(170012898564920121)
,p_build_option_name=>'BLOG_FEATURE_MODAL_PAGES'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable modal pages links in footer'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(188144096580028257)
,p_build_option_name=>'BLOG_FEATURE_ARCHIVE_POST_COUNT'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>1
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable post archive count in list'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(188378431102923793)
,p_build_option_name=>'BLOG_FEATURE_CATEGORY_POST_COUNT'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>41473340485852
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable/disable category post count in list'
);
wwv_flow_imp.component_end;
end;
/
