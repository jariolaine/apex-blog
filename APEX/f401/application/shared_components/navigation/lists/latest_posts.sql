prompt --application/shared_components/navigation/lists/latest_posts
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6945203882938984)
,p_name=>'Latest Posts'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                    as link_level',
'  ,v1.post_title        as link_text',
'  ,blog_url.get_post( ',
'     p_post_id => v1.post_id',
'   )                    as target_url',
'   -- list is cached so we can''t use is_current attribute',
'  ,''NO''                 as is_current',
'  ,null                 as image',
'  ,null                 as image_attribute',
'  ,null                 as image_alt_attribute',
'  ,null                 as attribute1',
'   -- add post id to data attribute',
'   -- we can use it in dynamic action to set current list item',
'  ,''data-blog-content-id="''',
'   || v1.post_id',
'   || ''"''               as attribute2',
'from #OWNER#.blog_v_posts_last20 v1',
'where 1 = 1',
'and v1.display_seq <= :G_LATEST_POSTS',
'order by v1.published_on desc',
''))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(8677319562925389)
);
end;
/
