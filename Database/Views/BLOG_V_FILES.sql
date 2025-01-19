--------------------------------------------------------
--  DDL for View BLOG_V_FILES
--------------------------------------------------------
create or replace force view blog_v_files as
select
  t1.id             as file_id
, t1.row_version    as row_version
, t1.created_on     as created_on
, t1.changed_on     as changed_on
, t1.is_download    as is_download
, t1.file_name      as file_name
, t1.file_path      as file_path
, t1.mime_type      as mime_type
, t1.blob_content   as blob_content
, apex_string_util.to_display_filesize(
    p_size_in_bytes => t1.file_size
  )                 as file_size
, t1.file_charset   as file_charset
, t1.file_desc      as file_desc
, lkp.object_storage
, case lkp.object_storage
    when 'INCLUDE'
    then
      case when lkp.proxy_url is null
        then lkp.bucket_url || t1.file_path
        else lkp.proxy_url  || t1.file_path
      end
    else
      blog_url.get_file(
        p_file_path => t1.file_path
      )
  end             as file_url
from blog_files t1
cross join(
  select
      apex_application_admin.get_build_option_status(
        p_application_id    => sys_context( 'APEX$SESSION', 'APP_ID')
      , p_build_option_name => 'BLOG_FEATURE_OCI_OBJECT_STORAGE'
    )  as object_storage
    , blog_util.get_attribute_value(
        p_attribute_name => 'G_OCI_OS_BUCKET_URL'
      ) as bucket_url
    , blog_util.get_attribute_value(
        p_attribute_name => 'G_OCI_OS_PROXY_URL'
      ) as proxy_url
  from dual
) lkp
where 1 = 1
and t1.is_active = 1
with read only
/
