prompt --application/shared_components/navigation/lists/post_tags
begin
--   Manifest
--     LIST: Post Tags
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
 p_id=>wwv_flow_imp.id(13220237658425595)
,p_name=>'Post Tags'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'   1                                    as link_level',
'  ,v1.tag                               as link_text',
'  ,#OWNER#.blog_url.get_tag(',
'     p_tag_id => v1.tag_id',
'   )                                    as target_url',
'  ,''NO''                                 as is_current',
'  ,null                                 as image',
'  ,null                                 as image_attribute',
'  ,null                                 as image_alt_attribute',
'  ,case d.post_count',
'    when ''INCLUDE'' then v1.posts_count',
'  end                                   as attribute1',
'  ,width_bucket(',
'     v1.posts_count',
'    ,min( v1.posts_count ) over()',
'    ,max( v1.posts_count ) over() + 1',
'    ,8',
'  )                                     as attribute2',
'from #OWNER#.blog_v_tags v1',
'cross join(',
'  select',
'    apex_util.get_build_option_status(',
'       p_application_id     => :APP_ID',
'      ,p_build_option_name  => ''BLOG_FEATURE_TAG_CLOUD_POST_COUNT''',
'    ) as post_count',
'  from dual',
') d',
'where 1 = 1',
'order by v1.tag'))
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_imp.id(13229141933919002)
);
wwv_flow_imp.component_end;
end;
/
