prompt --application/shared_components/navigation/lists/latest_posts
begin
--   Manifest
--     LIST: Latest Posts
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6945203882938984)
,p_name=>'Latest Posts'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                          as link_level',
'  ,v1.post_title              as link_text',
'  ,#OWNER#.blog_url.get_post(',
'    p_post_id => v1.post_id',
'  )                           as target_url',
'-- list is cached so we can''t use is_current attribute',
'  ,''NO''                       as is_current',
'  ,null                       as image',
'  ,null                       as image_attribute',
'  ,null                       as image_alt_attribute',
'  ,null                       as attribute1',
'   -- add post id to data attribute',
'   -- we can use it then in dynamic action to set class for current list item',
'  ,''data-blog-content-id="''',
'    || v1.post_id',
'    || ''"''                    as attribute2',
'  ,''z-linkList''               as attribute3',
'from #OWNER#.blog_v_posts_last20 v1',
'where 1 = 1',
'-- Use function to get max row count. Region is cached',
'and v1.display_seq <= (',
'  select #OWNER#.blog_util.get_attribute_value( ''G_LATEST_POST_ROWS'' )',
'  from dual',
')',
'order by v1.published_on desc'))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(8677319562925389)
);
wwv_flow_api.component_end;
end;
/
