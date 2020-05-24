CREATE OR REPLACE package "BLOG_ORDS"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Procedure and functions for ORDS
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 09.01.2020 - Created
--    Jari Laine 28.03.2020 - Added procedure create_public_xml_module
--                            Local constants renamed
--    Jari Laine 09.04.2020 - Package reorganized and removed e.g.
--                            procedures create_public_xml_module and create_public_files_module
--    Jari Laine 17.05.2020 - Add get_ords_service function.
--                            Originaly function was in blog_xml package
--    Jari Laine 18.05.2020 - Add private constant c_module_name
--                            Removed function get_file_path_prefix
--                            Removed ORDS specific constants from package blog_util
--                            Removed function get_ords_service
--                            Added function get_module_path
--    Jari Laine 24.04.2020 - Combined all template creation to one procedure because
--                            templates metadata is stored to blog_ords_tempates
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_module(
    p_base_path in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure create_templates(
    p_app_id in number
  );
--------------------------------------------------------------------------------
  function get_module_path(
    p_canonical     in varchar2 default 'NO'
  ) return varchar2;
--------------------------------------------------------------------------------
end "BLOG_ORDS";
/


CREATE OR REPLACE package body "BLOG_ORDS"
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_owner       constant varchar2(4000) := sys_context( 'USERENV', 'CURRENT_SCHEMA' );
  c_module_name constant varchar2(256)  := 'BLOG_PUBLIC_FILES';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_module(
    p_base_path in varchar2 default null
  )
  as
    l_base_path varchar2(256);
  begin

    begin
      -- query ORDS metadata to get resource url
      select t2.uri_prefix as url
      into l_base_path
      from user_ords_schemas t1
      join user_ords_modules t2
        on t1.id = t2.schema_id
      where 1 = 1
        and t1.parsing_schema = c_owner
        and t2.name = c_module_name
      ;
    exception when no_data_found then
      l_base_path := null;
    end;

    l_base_path :=
      case when p_base_path is not null
      then p_base_path
      else
        case when l_base_path is not null
        then l_base_path
        else sys.dbms_random.string('l', 6)
        end
      end
    ;
    -- Static files module
    ords.define_module(
      p_module_name     => c_module_name
      ,p_base_path      => l_base_path
      ,p_items_per_page => 25
      ,p_status         => 'PUBLISHED'
      ,p_comments       => 'Blog static content from blog_files table and dynamic XML'
    );
  end create_module;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_templates(
    p_app_id in number
  )
  as
  begin

    for c1 in(
      select uri_template
       ,http_method
       ,source_type
       ,handler_source
       ,notes
      from blog_ords_templates t1
      where 1 = 1
      and is_active = 1
      and not exists(
        select 1
        from apex_application_build_options bo
        where 1 = 1
        and bo.application_id = p_app_id
        and bo.build_option_status = 'Exclude'
        and bo.build_option_name = t1.build_option
      )
    ) loop

      ords.define_template(
        p_module_name     => c_module_name
        ,p_pattern        => c1.uri_template
        ,p_priority       => 0
        ,p_etag_type      => 'HASH'
        ,p_etag_query     => null
        ,p_comments       => c1.notes
      );

      ords.define_handler(
        p_module_name     => c_module_name
        ,p_pattern        => c1.uri_template
        ,p_method         => c1.http_method
        ,p_source_type    => c1.source_type
        ,p_mimes_allowed  => null
        ,p_comments       => c1.notes
        ,p_source         => c1.handler_source
      );

    end loop;

  end create_templates;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_module_path(
    p_canonical     in varchar2 default 'NO'
  ) return varchar2
  as
    l_url   varchar2(4000);
  begin

    begin
      -- query ORDS metadata to get resource url
      select t1.pattern || t2.uri_prefix as url
      into l_url
      from user_ords_schemas t1
      join user_ords_modules t2
        on t1.id = t2.schema_id
      where 1 = 1
        and t1.parsing_schema = c_owner
        and t2.name = c_module_name
      ;
    exception when no_data_found then
      raise_application_error( -20001,  'Configuration not exists.' );
      l_url := null;
    end;

    if p_canonical = 'YES'
    then
      l_url := blog_util.get_attribute_value( 'CANONICAL_URL' )
        || l_url
      ;
    end if;

    return l_url;

  end get_module_path;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_ORDS";
/
