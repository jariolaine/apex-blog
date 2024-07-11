prompt --application/deployment/install/upgrade_patch_22_2_20230304
begin
--   Manifest
--     INSTALL: UPGRADE-Patch 22.2.20230304
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.0'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(31992677792885680)
,p_install_id=>wwv_flow_imp.id(20741295540297154)
,p_name=>'Patch 22.2.20230304'
,p_sequence=>20
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from blog_v_version',
'where 1 = 1',
'and application_date < 20230304'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--  Patch 22.2.20230304',
'--------------------------------------------------------',
'--  Alter table BLOG_POST',
'--------------------------------------------------------',
'alter table blog_posts add post_txt_search char( 1 byte );',
'--------------------------------------------------------',
'--  Update table BLOG_POST',
'--------------------------------------------------------',
'alter trigger blog_posts_trg disable;',
'',
'update blog_posts',
'  set post_txt_search = ''X''',
';',
'',
'begin',
'',
'  for c1 in(',
'    select t1.id',
'      ,t1.published_on + numtodsinterval(',
'        ( row_number() over( partition by t1.published_on order by t1.id ) - 1 ) / 1000000',
'        ,''second''',
'      ) as new_published_on',
'    from blog_posts t1',
'    where 1 = 1',
'    and exists(',
'      select 1',
'      from blog_posts x1',
'      where 1 = 1',
'        and x1.published_on = t1.published_on',
'      group by x1.published_on',
'      having count(1) > 1',
'    )',
'  ) loop',
'',
'    update blog_posts t1',
'      set published_on = c1.new_published_on',
'    where 1 = 1',
'      and t1.id = c1.id',
'      and t1.published_on != c1.new_published_on',
'    ;',
'',
'  end loop;',
'',
'end;',
'/',
'',
'alter trigger blog_posts_trg enable;',
'--------------------------------------------------------',
'--  Alter table BLOG_POST',
'--------------------------------------------------------',
'alter table blog_posts add constraint blog_posts_uk1 unique( published_on );',
'alter table blog_posts modify post_txt_search not null;',
'--------------------------------------------------------',
'--  Insert patch version info to BLOG_SETTINGS',
'--------------------------------------------------------',
'insert into blog_settings(display_seq,is_nullable,attribute_name,data_type,attribute_group_message,attribute_value)',
'  values(10,0,''PATCH_20230304'',''STRING'',''INTERNAL'',''Patch 22.2.20230304'')',
';',
''))
);
wwv_flow_imp.component_end;
end;
/
