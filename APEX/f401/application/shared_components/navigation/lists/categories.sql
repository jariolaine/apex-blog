prompt --application/shared_components/navigation/lists/categories
begin
--   Manifest
--     LIST: Categories
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(6941496811819617)
,p_name=>'Categories'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                    as link_level',
'  ,v1.category_title    as link_text',
'  ,blog_url.get_category(',
'     p_category_id => v1.category_id',
'   )                    as target_url',
'   -- list is cached so we can''t use is_current attribute',
'  ,''NO''                 as is_current',
'  ,null                 as image',
'  ,null                 as image_attribute',
'  ,null                 as image_alt_attribute',
'  ,null                 as attribute1',
'   -- add category id to data attribute',
'   -- we can use it in dynamic action to set current list item',
'  ,''data-blog-content-id="''',
'   || v1.category_id',
'   || ''"''               as attribute2',
'from #OWNER#.blog_v_categories v1',
'where 1 = 1',
'order by v1.display_seq',
''))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(8635355820099640)
);
wwv_flow_api.component_end;
end;
/
