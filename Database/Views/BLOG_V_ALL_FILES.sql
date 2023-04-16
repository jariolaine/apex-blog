--------------------------------------------------------
--  DDL for View BLOG_V_ALL_FILES
--------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "BLOG_V_ALL_FILES" ("ID", "ROW_VERSION", "CREATED_ON", "CREATED_BY", "CHANGED_ON", "CHANGED_BY", "IS_ACTIVE", "IS_DOWNLOAD", "FILE_NAME", "MIME_TYPE", "BLOB_CONTENT", "FILE_SIZE", "FILE_CHARSET", "FILE_DESC", "NOTES", "FILE_SIZE_DISPLAY", "FILE_STATUS_ICON", "FILE_TYPE_ICON") AS
select
   t1.id                as id
  ,t1.row_version       as row_version
  ,t1.created_on        as created_on
  ,lower(t1.created_by) as created_by
  ,t1.changed_on        as changed_on
  ,lower(t1.changed_by) as changed_by
  ,t1.is_active         as is_active
  ,t1.is_download       as is_download
  ,t1.file_name         as file_name
  ,t1.mime_type         as mime_type
  ,t1.blob_content      as blob_content
  ,t1.file_size         as file_size
  ,t1.file_charset      as file_charset
  ,t1.file_desc         as file_desc
  ,t1.notes             as notes
  ,apex_string_util.to_display_filesize(
    p_size_in_bytes => t1.file_size
  )                     as file_size_display
  ,case t1.is_active
    when 1
    then 'fa-check-circle u-success-text'
    else 'fa-minus-circle u-danger-text'
   end                  as file_status_icon
  ,case t1.is_download
    when 1
    then 'fa-check'
    else 'fa-minus'
   end                  as file_type_icon
from blog_files t1
where 1 = 1
/
