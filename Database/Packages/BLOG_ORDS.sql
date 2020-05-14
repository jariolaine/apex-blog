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
--    Jari Laine 28.04.2020 - Added procedure create_public_xml_module
--    Jari Laine 28.04.2020 - Local constants renamed
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
  function get_file_path_prefix return varchar2;
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
-- none
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
      p_module_name     => blog_util.g_ords_module
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
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_public_files
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog static files'
    );

    ords.define_handler(
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_public_files
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
        || chr(10) || 'and v1.file_name = :name'
    );

  end add_files_template;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_rss_template
  as
  begin

    ords.define_template(
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_rss_feed
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog rss feed'
    );

    ords.define_handler(
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_rss_feed
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
        p_module_name     => blog_util.g_ords_module
        ,p_pattern        => blog_util.g_ords_sitemap_index
        ,p_priority       => 0
        ,p_etag_type      => 'HASH'
        ,p_etag_query     => null
        ,p_comments       => 'Blog sitemap index'
      );

    ords.define_handler(
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_sitemap_index
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
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_sitemap_main
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog sitemap index'
    );

    ords.define_handler(
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_sitemap_main
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
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_sitemap_posts
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Blog posts sitemap'
    );

    ords.define_handler(
      p_module_name     => blog_util.g_ords_module
      ,p_pattern        => blog_util.g_ords_sitemap_posts
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
  function get_file_path_prefix return varchar2
  as
    l_url varchar2(4000);
  begin
  
    select t1.pattern
      || t2.uri_prefix
      || blog_util.g_ords_public_files as url
    into l_url
    from user_ords_schemas t1
    join user_ords_modules t2 on t1.id = t2.schema_id
    where 1 = 1
    and t1.parsing_schema = blog_util.g_owner
    and t2.name = blog_util.g_ords_module
    ;
    return l_url;

  end get_file_path_prefix;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_ORDS";
/
