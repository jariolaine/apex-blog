prompt --application/shared_components/navigation/lists/latest_posts
begin
--   Manifest
--     LIST: Latest Posts
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.10.31'
,p_release=>'23.2.3'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(6945203882938984)
,p_name=>'Latest Posts'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                  as link_level',
'  ,v1.post_title      as link_text',
'  ,v1.post_url        as target_url',
'-- list is cached, can''t use is_current attribute.',
'  ,''NO''               as is_current',
'  ,''fa-chevron-right'' as image',
'  ,null               as image_attribute',
'  ,null               as image_alt_attribute',
'  ,null               as attribute1',
'-- Post id data attribute.',
'-- Used in dynamic action to set class for current list item.',
'  ,v1.list_attr       as attribute2',
'  ,''blog-linkList''    as attribute3',
'from blog_v_posts_last20 v1',
'where 1 = 1',
'  and v1.display_seq <= (',
'    select to_number( blog_util.get_attribute_value( ''G_LATEST_POST_ROWS'' ) )',
'    from dual',
'  )',
'order by v1.published_on desc'))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(8677319562925389)
);
wwv_flow_imp.component_end;
end;
/
