--------------------------------------------------------
--  DDL for View BLOG_V_FILES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_FILES" ("FILE_ID", "ROW_VERSION", "CREATED_ON", "CHANGED_ON", "IS_DOWNLOAD", "FILE_NAME", "MIME_TYPE", "BLOB_CONTENT", "FILE_SIZE", "FILE_CHARSET", "FILE_DESC", "FILE_URL") AS
select
   t1.id            as file_id
  ,t1.row_version   as row_version
  ,t1.created_on    as created_on
  ,t1.changed_on    as changed_on
  ,t1.is_download   as is_download
  ,t1.file_name     as file_name
  ,t1.mime_type     as mime_type
  ,t1.blob_content  as blob_content
  ,apex_string_util.to_display_filesize(
    p_size_in_bytes => t1.file_size
  )                 as file_size
  ,t1.file_charset  as file_charset
  ,t1.file_desc     as file_desc
  ,apex_page.get_url(
     p_page     => '1003'
    ,p_session  => null
    ,p_request  => 'application_process=download'
    ,p_items    => 'P1003_FILE_NAME'
    ,p_values   => t1.file_name
  )                 as file_url
from blog_files t1
where 1 = 1
and t1.is_active = 1
with read only
/
