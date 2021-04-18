prompt --application/shared_components/navigation/lists/public_application_links
begin
--   Manifest
--     LIST: Public Application Links
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(43181213072992711)
,p_name=>'Public Application Links'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with q1 as(',
'  select 1          as display_seq',
'    ,apex_lang.message(',
'      ''BLOG_PUB_APP_LINK_HOME''',
'    )                 as list_label',
'    ,blog_url.get_tab(',
'       p_app_id       => attribute_value',
'      ,p_app_page_id  => ''home''',
'      ,p_canonical    => ''YES''',
'    )                 as list_link',
'    ,''fa-home''        as list_icon',
'  from blog_settings',
'  where 1 = 1',
'  and attribute_name = ''G_PUB_APP_ID''',
'  union all',
'  select 2            as display_seq',
'    ,apex_lang.message(',
'      ''BLOG_PUB_APP_LINK_SITEMAP''',
'    )                 as list_label',
'    ,attribute_value  as list_link',
'    ,''fa-sitemap''     as list_icon',
'  from blog_settings',
'  where 1 = 1',
'  and attribute_name = ''G_SITEMAP_URL''',
'  and apex_util.get_build_option_status(',
'       p_application_id     => :G_PUB_APP_ID',
'      ,p_build_option_name  => ''BLOG_FEATURE_SITEMAP''',
'    ) = ''INCLUDE''',
'  union all',
'  select 3            as display_seq',
'    ,apex_lang.message(',
'      ''BLOG_PUB_APP_LINK_RSS''',
'    )                 as list_label',
'    ,attribute_value  as list_link',
'    ,''fa-rss''         as list_icon',
'  from blog_settings',
'  where 1 = 1',
'  and attribute_name = ''G_RSS_URL''',
'  and apex_util.get_build_option_status(',
'       p_application_id     => :G_PUB_APP_ID',
'      ,p_build_option_name  => ''BLOG_FEATURE_RSS''',
'    ) = ''INCLUDE''',
')',
'select null as link_level',
'  ,q1.list_label',
'  ,q1.list_link',
'  ,''N'' is_current',
'  ,q1.list_icon as list_image',
'  ,null as image_attribute',
'  ,null as image_alt_attribute',
'  ,q1.list_link as attribute1',
'  ,null as attribute2',
'  ,''target="_blank"'' as attribute3',
'from q1',
'order by q1.display_seq',
''))
,p_list_status=>'PUBLIC'
);
wwv_flow_api.component_end;
end;
/
