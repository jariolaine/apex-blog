prompt --application/shared_components/navigation/lists/post_categories
begin
--   Manifest
--     LIST: Post Categories
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(6941496811819617)
,p_name=>'Post Categories'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                                        as link_level',
'  ,v1.category_title                        as link_text',
'  ,#OWNER#.blog_url.get_category(',
'     p_category_id => v1.category_id',
'   )                                        as target_url',
'   -- list is cached',
'   -- so we can''t use is_current attribute',
'  ,''NO''                                     as is_current',
'  ,null                                     as image',
'  ,null                                     as image_attribute',
'  ,null                                     as image_alt_attribute',
'  ,case d.post_count',
'    when ''INCLUDE'' then v1.posts_count',
'  end                                       as attribute1',
'   -- add category id to data attribute',
'   -- we can use it then in dynamic action',
'   -- to set class for current list item',
'  ,''data-blog-content-id="''',
'   || v1.category_id',
'   || ''"''                                   as attribute2',
'   ,''z-linkList''                            as attribute3',
'from #OWNER#.blog_v_categories v1',
'cross join(',
'  select',
'    apex_util.get_build_option_status(',
'       p_application_id     => :APP_ID',
'      ,p_build_option_name  => ''BLOG_FEATURE_CATEGORY_POST_COUNT''',
'    ) as post_count',
'  from dual',
') d',
'where 1 = 1',
'order by v1.display_seq',
''))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(8635355820099640)
);
wwv_flow_imp.component_end;
end;
/
