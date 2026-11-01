create or replace package "BUILD_API"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Build-time metadata export helpers for APEX Blog.
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 26.04.2019 - Created
--    Jari Laine 23.11.2022 - New function get_apex_version
--                          - New procedures export_license and export_readme
--                          - function get_get_version renamed to get_app_version
--    Jari Laine 01.11.2026 - Refactored for automation
--
--------------------------------------------------------------------------------
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
-- Global procedures and functions
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
