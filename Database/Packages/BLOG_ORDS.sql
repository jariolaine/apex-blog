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
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global variables and constants
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_statuc_file_module;
--------------------------------------------------------------------------------
  procedure add_static_file_template;
--------------------------------------------------------------------------------
  procedure create_xml_module;
--------------------------------------------------------------------------------
end "BLOG_ORDS";
/


CREATE OR REPLACE package body "BLOG_ORDS" as
--------------------------------------------------------------------------------
-- Private constants and variables
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  c_owner                   constant varchar2(4000) := sys_context( 'USERENV', 'CURRENT_SCHEMA' );
  c_ords_module_name        constant varchar2(256)  := 'BLOG_APP_FILES';
  c_ords_tempate_prefix     constant varchar2(256)  := 'static';
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- none
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------- 
  procedure create_statuc_file_module as
  begin
    -- Static files module
    ords.define_module(
      p_module_name     => 'BLOG_APP_FILES'
      ,p_base_path      => '/public/files/'
      ,p_items_per_page => 25
      ,p_status          => 'PUBLISHED'
      ,p_comments       => 'Blog static content from blog_files table'
    );
  end create_statuc_file_module;
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------- 
  procedure add_static_file_template 
  as
  begin
    for c1 in(
      select 1 as rn
      from user_ords_schemas t1
      join user_ords_modules t2 on t1.id = t2.schema_id
      where 1 = 1
      and t1.parsing_schema = blog_ords.c_owner
      and t2.name = blog_ords.c_ords_module_name
    ) loop
      for c2 in(
        select distinct v1.file_path
        from blog_v_all_files v1
        where 1 = 1
        and not exists(
          select 1
          from user_ords_schemas t1
          join user_ords_modules t2 on t1.id = t2.schema_id
          join user_ords_templates t3 on t1.id = t3.schema_id
            and t2.id = t3.module_id
          where 1 = 1
          and t1.parsing_schema = blog_ords.c_owner
          and t2.name = blog_ords.c_ords_module_name
          and t3.uri_template = blog_ords.c_ords_tempate_prefix || v1.file_path || ':p_file_name'
        )
      ) loop
      
        ords.define_template(
          p_module_name     => c_ords_module_name
          ,p_pattern        => blog_ords.c_ords_tempate_prefix || c2.file_path || ':p_file_name'
          ,p_priority       => 0
          ,p_etag_type      => 'HASH'
          ,p_etag_query     => null
          ,p_comments       => 'Blog static files module (created by application)'
        );
    
        ords.define_handler(
          p_module_name     => c_ords_module_name
          ,p_pattern        => blog_ords.c_ords_tempate_prefix || c2.file_path || ':p_file_name'
          ,p_method         => 'GET'
          ,p_source_type    => 'resource/lob'
          ,p_items_per_page => 0
          ,p_mimes_allowed  => ''
          ,p_comments       => 'Blog static files handler (created by application)'
          ,p_source         =>
            'select mime_type'
            || chr(10) || '  ,blob_content'
            || chr(10) || 'from blog_v_files'
            || chr(10) || 'where 1 = 1'
            || chr(10) || 'and file_name = :p_file_name'
            || chr(10) || 'and file_path = ''' 
            || c2.file_path 
            || ''''
        );
        
      end loop;
    end loop;  
  end add_static_file_template;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure create_xml_module
  as
  begin
  
    ords.define_template(
      p_module_name     => 'BLOG_APP_XML'
      ,p_pattern        => 'feed/rss'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Template for output blog rss feed'
    );

    ords.define_handler(
      p_module_name     => 'BLOG_APP_XML'
      ,p_pattern        => 'feed/rss'
      ,p_method         => 'GET'
      ,p_source_type    => 'plsql/block'
      ,p_items_per_page => 0
      ,p_mimes_allowed  => ''
      ,p_comments       => 'GET handler for output blog rss feed'
      ,p_source         => 
        'begin' || chr(10) 
        || '  blog_xml.rss(:p_lang);' || chr(10) 
        || 'end;'
      );

    ords.define_parameter(
      p_module_name         => 'BLOG_APP_XML'
      ,p_pattern            => 'feed/rss'
      ,p_method             => 'GET'
      ,p_name               => 'p_lang'
      ,p_bind_variable_name => 'p_lang'
      ,p_source_type        => 'URI'
      ,p_param_type         => 'STRING'
      ,p_access_method      => 'IN'
      ,p_comments           => null
    );

    ords.define_template(
      p_module_name     => 'BLOG_APP_XML'
      ,p_pattern        => 'sitemap/index'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Template for output sitemap index'
    );

    ords.define_handler(
      p_module_name     => 'BLOG_APP_XML'
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
      p_module_name     => 'BLOG_APP_XML'
      ,p_pattern        => 'sitemap/main'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Template for output sitemap main (blog tab)'
    );

    ords.define_handler(
      p_module_name     => 'BLOG_APP_XML'
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
      p_module_name     => 'BLOG_APP_XML'
      ,p_pattern        => 'sitemap/posts'
      ,p_priority       => 0
      ,p_etag_type      => 'HASH'
      ,p_etag_query     => null
      ,p_comments       => 'Template for output sitemap post (blog posts)'
    );

    ords.define_handler(
      p_module_name     => 'BLOG_APP_XML'
      ,p_pattern        => 'sitemap/posts'
      ,p_method         => 'GET'
      ,p_source_type    => 'plsql/block'
      ,p_mimes_allowed  => ''
      ,p_comments       => null
      ,p_source         => 
        'begin' || chr(10) 
        || '  blog_xml.sitemap_posts;' || chr(10) 
        || 'end;'
      );
      
  end create_xml_module;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_ORDS";
/
