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
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_module(
    p_base_path in varchar2 default null
  );
--------------------------------------------------------------------------------
  procedure add_files_template;
--------------------------------------------------------------------------------
  procedure create_rss_template;
--------------------------------------------------------------------------------
  procedure create_sitemap_templates;
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

    l_base_path :=
      case when p_base_path is null
      then sys.dbms_random.string('l', 12)
      else p_base_path
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
  procedure add_files_template
  as
  begin

    ords.define_template(
      p_module_name     => c_module_name
      ,p_pattern        => 'files/:p_file_name'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog static files'
    );

    ords.define_handler(
      p_module_name     => c_module_name
      ,p_pattern        => 'files/:p_file_name'
      ,p_method         => 'GET'
      ,p_source_type    => 'resource/lob'
      ,p_items_per_page => 0
      ,p_mimes_allowed  => ''
      ,p_comments       => 'Blog static files'
      ,p_source         =>
        'select v1.mime_type'
        || chr(10) || '  ,v1.blob_content'
        || chr(10) || 'from blog_v_files v1'
        || chr(10) || 'where 1 = 1'
        || chr(10) || 'and v1.is_download = 0'
        || chr(10) || 'and v1.file_name = :p_file_name'
    );

  end add_files_template;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_rss_template
  as
  begin

    ords.define_template(
      p_module_name     => c_module_name
      ,p_pattern        => 'feed/rss'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog rss feed'
    );

    ords.define_handler(
      p_module_name     => c_module_name
      ,p_pattern        => 'feed/rss'
      ,p_method         => 'GET'
      ,p_source_type    => 'plsql/block'
      ,p_items_per_page => 0
      ,p_mimes_allowed  => ''
      ,p_comments       => 'Blog rss feed'
      ,p_source         =>
        'begin' || chr(10)
        || '  blog_xml.rss(:p_lang);' || chr(10)
        || 'end;'
    );

  end create_rss_template;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_sitemap_templates
  as
  begin

    ords.define_template(
      p_module_name     => c_module_name
      ,p_pattern        => 'sitemap/index'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog sitemap index'
    );

    ords.define_handler(
      p_module_name     => c_module_name
      ,p_pattern        => 'sitemap/index'
      ,p_method         => 'GET'
      ,p_source_type    => 'plsql/block'
      ,p_mimes_allowed  => ''
      ,p_comments       => null
      ,p_source         =>
        'begin' || chr(10)
        || '  blog_xml.sitemap_index;' || chr(10)
        || 'end;'
    );

    ords.define_template(
      p_module_name     => c_module_name
      ,p_pattern        => 'sitemap/main'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog sitemap index'
    );

    ords.define_handler(
      p_module_name     => c_module_name
      ,p_pattern        => 'sitemap/main'
      ,p_method         => 'GET'
      ,p_source_type    => 'plsql/block'
      ,p_mimes_allowed  => ''
      ,p_comments       => null
      ,p_source         =>
        'begin' || chr(10)
        || '  blog_xml.sitemap_main;' || chr(10)
        || 'end;'
    );

    ords.define_template(
      p_module_name     => c_module_name
      ,p_pattern        => 'sitemap/posts'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog posts sitemap'
    );

    ords.define_handler(
      p_module_name     => c_module_name
      ,p_pattern        => 'sitemap/posts'
      ,p_method         => 'GET'
      ,p_source_type    => 'plsql/block'
      ,p_mimes_allowed  => ''
      ,p_comments       => 'Blog posts sitemap'
      ,p_source         =>
        'begin' || chr(10)
        || '  blog_xml.sitemap_posts;' || chr(10)
        || 'end;'
      );

  end create_sitemap_templates;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function get_module_path(
    p_canonical     in varchar2 default 'NO'
  ) return varchar2
  as
    l_url   varchar2(4000);
    c_owner constant varchar2(4000) := sys_context( 'USERENV', 'CURRENT_SCHEMA' );
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
