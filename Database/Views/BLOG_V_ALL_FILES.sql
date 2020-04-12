--------------------------------------------------------
--  DDL for View BLOG_V_ALL_FILES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_FILES" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "IS_DOWNLOAD", "FILE_PATH", "FILE_NAME", "FILE_LOCATION", "MIME_TYPE", "BLOB_CONTENT", "FILE_SIZE", "FILE_CHARSET", "FILE_DESC", "NOTES", "FILE_STATUS_CSS_CLASS", "DOWNLOAD_STATUS_CSS_CLASS") AS 
  select t1.id          as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.is_download       as is_download
  ,t1.file_path         as file_path
  ,t1.file_name         as file_name
  ,t1.file_location     as file_location
  ,t1.mime_type         as mime_type
  ,t1.blob_content      as blob_content
  ,t1.file_size         as file_size
  ,t1.file_charset      as file_charset
  ,t1.file_desc         as file_desc
  ,t1.notes             as notes
  ,case t1.is_active
  when 1
    then 'fa fa-toggle-on u-hot-text'
  when 0
    then 'fa fa-toggle-off'
  end                   as file_status_css_class
  ,case t1.is_download
  when 1
    then 'fa fa-toggle-on u-hot-text'
  when 0
    then 'fa fa-toggle-off'
  end                   as download_status_css_class
from blog_files t1
where 1 = 1
;
