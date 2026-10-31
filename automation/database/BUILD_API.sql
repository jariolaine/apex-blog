create or replace package "BUILD_API"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Build-time export helpers for APEX Blog (metadata and schema lists).
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--    Jari Laine 23.11.2022 - New function get_apex_version
--                          - New procedures export_license and export_readme
--                          - function get_get_version renamed to get_app_version
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_apex_version return varchar2;
--------------------------------------------------------------------------------
  -- Legacy helper: reports the installed database version, not a release candidate.
  function get_app_version return varchar2;
--------------------------------------------------------------------------------
  -- Exports are read-only. The release version MUST come from VERSION.txt.
  procedure export_metadata(
    p_application     in varchar2,
    p_release_version in varchar2
  );
--------------------------------------------------------------------------------
  procedure export_settings(
    p_application     in varchar2,
    p_release_version in varchar2
  );
--------------------------------------------------------------------------------
  procedure export_features;
--------------------------------------------------------------------------------
  procedure export_lovs;
--------------------------------------------------------------------------------
  procedure export_deinstall;
--------------------------------------------------------------------------------
  procedure export_foreign_keys;
--------------------------------------------------------------------------------
  procedure export_indexes;
--------------------------------------------------------------------------------
  procedure export_object_list;
--------------------------------------------------------------------------------
  procedure export_upgrade_list;
--------------------------------------------------------------------------------
  -- Legacy manual export only; release builds render an SQL template from Git.
  procedure export_postupgrade;
--------------------------------------------------------------------------------
  procedure export_view_blog_v_registry;
--------------------------------------------------------------------------------
  procedure export_settings_update;
--------------------------------------------------------------------------------
  -- Deprecated for release automation; README/LICENSE/VERSION live in Git.
  procedure export_license;
--------------------------------------------------------------------------------
  procedure export_readme;
--------------------------------------------------------------------------------
  procedure export_manifest;
--------------------------------------------------------------------------------
  procedure export_version;
--------------------------------------------------------------------------------
  procedure update_text_messages(
    p_workspace in varchar2,
    p_type      in varchar2
  );
--------------------------------------------------------------------------------
  procedure get_mime_types;
--------------------------------------------------------------------------------
end "BUILD_API";
/


create or replace package body "BUILD_API"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function quote(
    p_value in varchar2
  ) return varchar2
  as
    l_value varchar2(32700);
  begin
    if p_value is null
    then
      l_value := 'null';
    else
      l_value := replace( p_value, chr(39), chr(39)||chr(39) );
      l_value :=  q'[']' || l_value || q'[']';
    end if;
    return l_value;
  end quote;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function quote(
    p_value in number
  ) return varchar2
  as
    l_value varchar2(32700);
  begin
    if p_value is null
    then
      l_value := 'null';
    else
      l_value := blog_util.int_to_vc2( p_value );
      l_value := q'[']' || l_value || q'[']';
    end if;
    return l_value;
  end quote;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_expression(
    p_expression in varchar2
  ) return varchar2
  as
    l_value varchar2(4000);
  begin

    execute immediate
      'select ' || p_expression || ' from dual'
    into l_value
    ;

    return l_value;

  end get_expression;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Build an object list without assuming USER_DEPENDENCIES is acyclic.
  -- Installation and upgrade intentionally share the same traversal logic.
  procedure write_object_list(
    p_upgrade in pls_integer
  )
  as
  begin
    for obj in (
      with candidates as (
        select o.object_name,
               o.object_type,
               case o.object_type
                 when 'SEQUENCE' then 1
                 when 'TYPE'     then 2
                 when 'TABLE'    then 3
                 when 'PACKAGE'  then 4
                 when 'VIEW'     then 5
                 when 'TRIGGER'  then 6
                 else 999
               end as type_rank
          from user_objects o
         where o.object_name like 'BLOG%'
           and (
             (p_upgrade = 0
              and o.object_name <> 'BLOG_V_VERSION'
              and (
                o.object_type in
                  ('SEQUENCE', 'TYPE', 'TABLE', 'PACKAGE', 'VIEW', 'TRIGGER')
                or (o.object_type = 'INDEX' and o.object_name in
                      ('BLOG_POSTS_CTX', 'BLOG_COMMENTS_CTX'))
              ))
             or (p_upgrade = 1
                 and o.object_type in ('PACKAGE', 'VIEW', 'TRIGGER'))
           )
      ),
      dependencies as (
        -- Only edges between objects included in the current export.
        -- DISTINCT avoids multiplying paths through duplicate dictionary rows.
        select distinct c.object_name, c.object_type,
                        d.referenced_name, d.referenced_type
          from candidates c
          left join user_dependencies d
            on d.name = c.object_name
           and d.type = c.object_type
           and d.referenced_owner = user
           and d.referenced_name <> c.object_name
           and exists (
             select 1
               from candidates parent_obj
              where parent_obj.object_name = d.referenced_name
                and parent_obj.object_type = d.referenced_type
           )
      ),
      hierarchy_depths as (
        select object_name, object_type,
               max(level) as dependency_depth
          from dependencies
         start with referenced_name is null
       connect by nocycle prior object_name = referenced_name
                      and prior object_type = referenced_type
         group by object_name, object_type
      )
      select c.object_name, c.object_type
        from candidates c
        -- A disconnected cyclic component has no root. Keep those objects
        -- in the output even when NOCYCLE cannot reach them from a root.
        left join hierarchy_depths h
          on h.object_name = c.object_name
         and h.object_type = c.object_type
       order by c.type_rank,
                nvl(h.dependency_depth, 0),
                c.object_name
    ) loop
      dbms_output.put_line(
        case obj.object_type
          when 'INDEX' then 'Indexes/'
          else initcap(obj.object_type) || 's/'
        end || obj.object_name
      );
    end loop;
  end write_object_list;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_apex_version
  return varchar2
  as
    l_apex_version varchar2(256);
  begin

    select version_no
      into l_apex_version
    from apex_release
    ;

    return l_apex_version;

  end get_apex_version;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_app_version
  return varchar2
  as
    l_version blog_settings.attribute_value%type;
  begin
    -- Return the installed version; never synthesize a new one from SYSDATE.
    select attribute_value
      into l_version
      from blog_settings
     where attribute_name = 'G_APP_VERSION';
    return l_version;
  end get_app_version;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_metadata(
    p_application     in varchar2,
    p_release_version in varchar2
  )
  as
  begin
    if p_release_version is null or
       not regexp_like(p_release_version, '^Release [0-9]+(\.[0-9]+)+\.[0-9]{8}$') then
      raise_application_error(-20070, 'Invalid release version; expected Release x.y.z.YYYYMMDD');
    end if;
    if p_application not in ('ADMIN', 'PUBLIC') or p_application is null then
      raise_application_error(-20071, 'Unknown application: ' || p_application);
    end if;

    dbms_output.put_line( 'begin' );

    if p_application = 'ADMIN'
    then

      export_settings(
        p_application     => p_application,
        p_release_version => p_release_version
      );

    elsif p_application = 'PUBLIC'
    then

      export_features;

      export_settings(
        p_application     => p_application,
        p_release_version => p_release_version
      );

      export_lovs;

      --export_mime_types;

      dbms_output.put_line( '-- Inserting into BLOG_INIT_ITEMS' );
      dbms_output.put_line( 'blog_install.init_items_ins;' );

    end if;

    dbms_output.put_line( 'end;' );
    dbms_output.put_line( '/' );

  end export_metadata;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_settings(
    p_application     in varchar2,
    p_release_version in varchar2
  )
  as
    l_sql varchar2(32700);
  begin
    if p_application = 'PUBLIC' and
       (p_release_version is null or
        not regexp_like(p_release_version, '^Release [0-9]+(\.[0-9]+)+\.[0-9]{8}$')) then
      raise_application_error(-20070, 'Missing or invalid release version for PUBLIC metadata');
    end if;

    dbms_output.put_line( '-- Inserting into BLOG_SETTINGS' );
    for c1 in(
      select
        t1.attribute_name
      , t1.display_seq
      , t1.is_nullable
      , t1.data_type
      , t1.attribute_group_message
      , t1.int_min
      , t1.int_max
      , t1.build_option_name
      , t1.build_option_status
      , t2.value_type
      , t2.value_source
      from blog_settings t1
      left join build_settings t2 on 1 = 1
        and t1.attribute_name = t2.attribute_name
      where 1 = 1
      and t1.attribute_name not like 'PATCH%'
      and (
        ( p_application = 'ADMIN' and t1.attribute_name = 'G_ADMIN_APP_ID' )
        or
        ( p_application = 'PUBLIC' and t1.attribute_name != 'G_ADMIN_APP_ID' )
      )
      order by t1.display_seq
    ) loop
      l_sql := 'blog_install.settings_merge(';
      l_sql := l_sql  || quote( c1.attribute_name );
      l_sql := l_sql  || ',' || blog_util.int_to_vc2( c1.display_seq );
      l_sql := l_sql  || ',' || blog_util.int_to_vc2(  c1.is_nullable );
      l_sql := l_sql  || ',' || quote( c1.data_type );
      l_sql := l_sql  || ',' || quote( c1.attribute_group_message );
      l_sql := l_sql  || ',' || coalesce( blog_util.int_to_vc2( c1.int_min ), 'null' );
      l_sql := l_sql  || ',' || coalesce( blog_util.int_to_vc2( c1.int_max ), 'null' );
      l_sql := l_sql  || ',' || quote( c1.build_option_name );
      l_sql := l_sql  || ',' || quote( c1.build_option_status );
      l_sql := l_sql  || ',' ||
        case
          -- The release number is a build input, not a database side effect.
          when c1.attribute_name = 'G_APP_VERSION'
            then quote(p_release_version)
          when c1.value_type = 'STRING'
            then quote(c1.value_source)
          when c1.value_type = 'VALUE_EXPRESSION'
            then quote(get_expression(c1.value_source))
          when c1.value_type = 'COLUMN_EXPRESSION'
            then c1.value_source
          else 'null'
        end
      ;
      l_sql := l_sql  || ');';

      dbms_output.put_line( l_sql );


    end loop;

  end export_settings;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_features
  as
    l_sql varchar2(32700);
  begin

    dbms_output.put_line( '-- Inserting into BLOG_FEATURES' );
    for c1 in(
      select
        t1.build_option_name
        -- by default set these features as disabled
      , case t1.build_option_name
          -- email validation API is enabled when API key is set
          when 'BLOG_FEATURE_EMAIL_VALIDATION_API'
          then 0
          else t1.is_active
        end as is_active
      , t1.display_seq
      , t1.build_option_group
      , t1.build_option_parent
      , t1.ref_build_option_name
      , t1.ref_build_option_status
      from blog_features t1
      order by t1.display_seq
    ) loop
      l_sql := 'blog_install.features_merge(';
      l_sql := l_sql  || quote( c1.build_option_name );
      l_sql := l_sql  || ',' || blog_util.int_to_vc2( c1.is_active );
      l_sql := l_sql  || ',' || blog_util.int_to_vc2( c1.display_seq );
      l_sql := l_sql  || ',' || quote( c1.build_option_group );
      l_sql := l_sql  || ',' || quote( c1.build_option_parent );
      l_sql := l_sql  || ',' || quote( c1.ref_build_option_name );
      l_sql := l_sql  || ',' || quote( c1.ref_build_option_status );
      l_sql := l_sql  || ');';

      dbms_output.put_line( l_sql );
    end loop;

  end export_features;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_lovs
  as
    l_sql varchar2(32700);
  begin

    dbms_output.put_line( '-- Inserting into BLOG_LIST_OF_VALUES' );
    for c1 in(
      select
         t1.is_active
        ,t1.display_seq
        ,t1.lov_name
        ,t1.return_value
        ,t1.display_message
      from blog_list_of_values t1
      order by t1.lov_name
        ,t1.display_seq
    ) loop
      l_sql := 'blog_install.list_of_values_ins(';
      l_sql := l_sql  || blog_util.int_to_vc2( c1.is_active );
      l_sql := l_sql  || ',' || blog_util.int_to_vc2( c1.display_seq );
      l_sql := l_sql  || ',' || quote( c1.lov_name );
      l_sql := l_sql  || ',' || quote( c1.return_value );
      l_sql := l_sql  || ',' || quote( c1.display_message );
      l_sql := l_sql  || ');';

      dbms_output.put_line( l_sql );
    end loop;

  end export_lovs;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_deinstall
  as
  begin

    dbms_output.put_line( '-- Drop Foreign Keys' );
    -- alter table statements to drop foreign keys
    for fk in(
      select
        table_name
        ,constraint_name
      from user_constraints
      where 1 = 1
      and table_name like 'BLOG%'
      and constraint_type = 'R'
      order by constraint_name
    ) loop
      dbms_output.put_line( 'alter table '  || lower( fk.table_name ) || ' drop constraint ' || lower( fk.constraint_name ) || ';' );
    end loop;

    dbms_output.put_line( '-- Drop objects' );

    for obj in(
      select
        object_type
        ,object_name
      from user_objects
      where 1 = 1
      and object_name like 'BLOG%'
      and object_type not in( 'JOB', 'INDEX', 'PACKAGE BODY', 'TRIGGER' )
      order by object_type
        ,object_name
    ) loop
      dbms_output.put_line( 'drop ' || lower( obj.object_type ) || ' ' || lower( obj.object_name ) || ';' );
    end loop;


    dbms_output.put_line( '-- Drop text index preferences' );
    dbms_output.put_line( 'declare' );
    dbms_output.put_line( '  ctx_ddl_error exception;' );
    dbms_output.put_line( '  pragma exception_init ( ctx_ddl_error, -20000 );' );
    dbms_output.put_line( 'begin' );
    for ctx in(
      select pre_name
      from ctx_user_preferences
      where 1 = 1
      and pre_name like 'BLOG%'
      order by pre_name
    ) loop
      dbms_output.put_line( '  begin' );
      dbms_output.put_line( '    ctx_ddl.drop_preference( ''' || ctx.pre_name || ''' );' );
      dbms_output.put_line( '    exception when ctx_ddl_error then null;' );
      dbms_output.put_line( '  end;' );
    end loop;
    dbms_output.put_line( 'end;' );
    dbms_output.put_line( '/' );

  end export_deinstall;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_foreign_keys
  as
  begin

    dbms_output.put_line( '-- DDL for Foreign Keys' );
    for fk in(
      select constraint_name
      from user_constraints
      where 1 = 1
      and constraint_type = 'R'
      and constraint_name like 'BLOG%'
      order by constraint_name
    ) loop
      dbms_output.put_line( trim( dbms_metadata.get_ddl( 'REF_CONSTRAINT', fk.constraint_name ) ) );
    end loop;

  end export_foreign_keys;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_indexes
  as
  begin

    dbms_output.put_line( '-- DDL for foreign key indexes' );
    for ix in(
      -- Export each index once, regardless of its number of columns.
      -- This selects ALL normal/nonunique BLOG indexes, not only FK indexes.
      select index_name
        from user_indexes
       where index_type = 'NORMAL'
         and uniqueness = 'NONUNIQUE'
         and table_name like 'BLOG%'
       order by index_name
    ) loop
      dbms_output.put_line( trim( dbms_metadata.get_ddl( 'INDEX', ix.index_name ) ) );
    end loop;

  end export_indexes;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_object_list
  as
  begin
    write_object_list(p_upgrade => 0);
  end export_object_list;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_upgrade_list
  as
  begin
    write_object_list(p_upgrade => 1);
  end export_upgrade_list;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_postupgrade
  as
    l_app_version varchar2(256);
    l_sql         varchar2(32700);
  begin

    l_app_version := build_api.get_app_version;

    select value_source
      into l_sql
    from build_settings
    where 1 = 1
    and attribute_name = 'POSTUPDATE_SQL'
    ;

    l_sql :=
      replace( l_sql, '#APP_VERSION#', l_app_version );

    dbms_output.put_line( l_sql );

  end export_postupgrade;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_view_blog_v_registry
  as
  begin

    dbms_output.put_line( '-- DDL for View BLOG_V_REGISTRY' );
    dbms_output.put_line( 'CREATE OR REPLACE FORCE VIEW "BLOG_V_REGISTRY" ("OBJECT_TYPE", "OBJECT_NAME", "STATUS") AS' );
    for c1 in(
      select
        case when row_number() over( order by object_type ,object_name ) > 1
          then 'union all' || chr(10)
        end  ||
      'select ''' || object_type || ''' as object_type' || chr(10)
      || ', ''' || object_name || ''' as object_name' || chr(10)
      || ', coalesce( max( status ), ''NOT_EXISTS'' ) as status' || chr(10)
      || 'from user_objects' || chr(10)
      || 'where 1 = 1' || chr(10)
      || '  and object_name = ''' || object_name || '''' || chr(10)
      || '  and object_type = ''' || object_type || '''' as l_sql
      from user_objects
      where 1 = 1
      and object_name like 'BLOG%'
      and object_name != 'BLOG_V_REGISTRY'
    ) loop
      dbms_output.put_line( c1.l_sql );
    end loop;
    dbms_output.put_line( '/' );

  end export_view_blog_v_registry;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_settings_update
  as
    l_sql varchar2(32700);
  begin

    for c1 in(
      select
        t1.attribute_name
      , t1.display_seq
      , t1.is_nullable
      , t1.data_type
      , t1.attribute_group_message
      , t1.int_min
      , t1.int_max
      , t1.build_option_name
      , t1.build_option_status
      from blog_settings t1
      where 1 = 1
      order by t1.display_seq
    ) loop
      l_sql := 'blog_install.settings_merge(';
      l_sql := l_sql  || quote( c1.attribute_name );
      l_sql := l_sql  || ',' || blog_util.int_to_vc2( c1.display_seq );
      l_sql := l_sql  || ',' || blog_util.int_to_vc2(  c1.is_nullable );
      l_sql := l_sql  || ',' || quote( c1.data_type );
      l_sql := l_sql  || ',' || quote( c1.attribute_group_message );
      l_sql := l_sql  || ',' || coalesce( blog_util.int_to_vc2( c1.int_min ), 'null' );
      l_sql := l_sql  || ',' || coalesce( blog_util.int_to_vc2( c1.int_max ), 'null' );
      l_sql := l_sql  || ',' || quote( c1.build_option_name );
      l_sql := l_sql  || ',' || quote( c1.build_option_status );
      l_sql := l_sql  || ');';

      dbms_output.put_line( l_sql );

    end loop;

  end export_settings_update;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Kept for older manual consumers. The release build copies LICENSE.txt
  -- from Git; do not use this to overwrite repository files.
  procedure export_license
  as
    l_year    varchar2(4);
    l_licence varchar2(4000);
  begin

    select value_source
      into l_licence
    from build_settings
    where 1 = 1
    and attribute_name = 'LICENSE'
    ;

    l_licence :=
      replace( l_licence,'#YEAR#', to_char( sysdate, 'YYYY' ) );

    dbms_output.put_line( l_licence );

  end export_license;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  -- Legacy utility; the repository README.md is authoritative.
  procedure export_readme
  as
    l_apex_version  varchar2(256);
    l_readme        varchar2(4000);
  begin

    select value_source
      into l_readme
    from build_settings
    where 1 = 1
    and attribute_name = 'README'
    ;

    l_apex_version := get_apex_version;
    l_apex_version := substr( l_apex_version, 1, instr( l_apex_version, '.', 1, 2 ) - 1 );

    l_readme :=
      replace( l_readme, '#APEX_VERSION#', l_apex_version );

    dbms_output.put_line( l_readme );

  end export_readme;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_manifest
  as
    l_app_version varchar2(256);
    l_manifest    varchar2(4000);
  begin

    select value_source
      into l_manifest
    from build_settings
    where 1 = 1
    and attribute_name = 'MANIFEST'
    ;

    l_app_version := build_api.get_app_version;

    l_manifest :=
      replace( l_manifest, '#APP_VERSION#', l_app_version );

    dbms_output.put_line( l_manifest );

  end export_manifest;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure export_version
  as
    l_app_version varchar2(256);
  begin

    select attribute_value
    into l_app_version
    from blog_settings
    where 1 = 1
      and attribute_name = 'G_APP_VERSION'
    ;

    dbms_output.put_line( l_app_version );

  end export_version;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure update_text_messages(
    p_workspace in varchar2,
    p_type      in varchar2
  )
  as
  begin

    apex_util.set_workspace (
      p_workspace => p_workspace
    );

    for c1 in(
      select
        t1.translation_entry_id
      , case p_type
          when 'SET'   then t2.value_source
          when 'RESET'  then t3.attribute_value
        end as message_text
      from apex_application_translations t1
      join build_settings t2 on t1.translatable_message = t2.attribute_name
      join blog_settings t3 on t1.translatable_message = t3.attribute_name
      where 1 = 1
      order by 1
    ) loop
      apex_lang.update_message (
        p_id => c1.translation_entry_id
      , p_message_text => c1.message_text
      );
    end loop;

    commit;

  end update_text_messages;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure get_mime_types
  as
    l_offset        pls_integer := 1;
    l_line          varchar2(32767);

    l_total_length  pls_integer;
    l_line_length   pls_integer;

    l_response      clob;

    l_param_name    apex_application_global.vc_arr2;
    l_param_value   apex_application_global.vc_arr2;

    l_result        apex_application_global.vc_arr2;
    l_mime_type     varchar2(2000);
    l_extension     varchar2(2000);
  begin

    execute immediate 'truncate table build_mime_types';

    apex_web_service.set_request_headers(
      p_reset     => true
    , p_name_01   => 'User-Agent'
    , p_value_01  => 'Oracle Application Express (gzip)'
    , p_name_02   => 'Accept-Encoding'
    , p_value_02  => 'gzip, deflate'
    );

    l_response :=
      apex_web_service.make_rest_request(
        p_url => 'https://svn.apache.org/viewvc/httpd/httpd/trunk/docs/conf/mime.types'
      , p_http_method => 'GET'
      , p_parm_name   => apex_string.string_to_table( 'view' )
      , p_parm_value  => apex_string.string_to_table( 'co' )
      )
    ;

    l_response := replace( replace( l_response, chr(9), chr(32) ), chr(13) );

    l_total_length := dbms_lob.getlength(l_response);

    while l_offset <= l_total_length
    loop

      l_line_length := instr( l_response, chr(10), l_offset ) - l_offset;

      if l_line_length < 0
      then
        l_line_length := l_total_length + 1 - l_offset;
      end if;

      l_line := trim( substr( l_response,l_offset,l_line_length ) );

      if l_line like '#%'
      then
        dbms_output.put_line(l_line);
      else

        l_result := apex_string.string_to_table( l_line, chr(32) );

        l_mime_type := lower( l_result(1) );

        if not l_mime_type = 'application/octet-stream'
        then

          for i in 2 .. l_result.count
          loop

            if l_result(i) is not null
            then
              --dbms_output.put_line(l_extension || ' : ' || l_result(i));
              insert into build_mime_types ( mime_type, extension )
                values ( lower( l_mime_type ), lower( l_result(i) ) )
              ;
            end if;

          end loop;

        end if;

      end if;

      l_offset := l_offset + l_line_length + 1;

    end loop;

  end get_mime_types;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
begin

  dbms_metadata.set_transform_param( dbms_metadata.session_transform, 'PRETTY', true );
  dbms_metadata.set_transform_param( dbms_metadata.session_transform, 'SQLTERMINATOR', true );
  dbms_metadata.set_transform_param( dbms_metadata.session_transform, 'EMIT_SCHEMA', false );
  dbms_metadata.set_transform_param( dbms_metadata.session_transform, 'STORAGE', false );
  dbms_metadata.set_transform_param( dbms_metadata.session_transform, 'SEGMENT_ATTRIBUTES', false );

end "BUILD_API";
/
