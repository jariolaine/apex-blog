CREATE OR REPLACE package "BLOG_CONF"
authid definer
as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  DESCRIPTION
--    Configure application features
--
--  MODIFIED (DD.MM.YYYY)
--    Jari Laine 23.04.2019 - Created
--    Jari Laine 26.04.2019 - Procedure purge_region_cache
--    Jari Laine 18.04.2020 - Removed obsoleted procedures update_feature_config and purge_region_cache
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
  function is_integer(
    p_value in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function is_url(
    p_value in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  function is_date_format(
    p_value in varchar2
  ) return varchar2;
--------------------------------------------------------------------------------
  -- Called from: procedure blog_conf.purge_post_preview_job
  -- not ready
  procedure purge_post_preview;
---------------------------- ----------------------------------------------------
  procedure purge_post_preview_job(
    p_drop_job    in boolean default false
  );
--------------------------------------------------------------------------------
end "BLOG_CONF";
/


CREATE OR REPLACE package body "BLOG_CONF" as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables and constants
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private procedures and functions
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Global functions and procedures
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_integer(
    p_value in varchar2
  ) return varchar2
  as
    l_result varchar2(4000);
  begin

    l_result := apex_lang.message('BLOG_VALIDATION_ERR_IS_INTEGER');

    if round( to_number( p_value ) ) between 1 and 100
    then
      l_result := null;
    end if;

    return l_result;

  exception when invalid_number
  or value_error
  then
    return l_result;
  end is_integer;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_url(
    p_value in varchar2
  ) return varchar2
  as
    l_result varchar2(4000);
  begin

    if not regexp_like(p_value, '^https?\:\/\/.*$')
    then
      l_result := apex_lang.message('BLOG_VALIDATION_ERR_IS_URL');
    end if;

    return l_result;

  end is_url;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  function is_date_format(
    p_value in varchar2
  ) return varchar2
  as
    l_result            varchar2(4000);
    invalid_date_format exception;
    pragma              exception_init(invalid_date_format, -1821);
  begin

    l_result := apex_lang.message('BLOG_VALIDATION_ERR_IS_DATE_FORMAT');

    if to_char( systimestamp, p_value) = to_char( systimestamp, p_value )
    then
      l_result := null;
    end if;

    return l_result;

  exception when invalid_date_format
  then
    return l_result;
  end is_date_format;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure purge_post_preview
  as
  begin

    -- Delete from blog_post_preview rows where session is expired
    delete from blog_post_preview p
    where not exists (
      select 1
      from apex_workspace_sessions s
      where 1 = 1
      and s.apex_session_id = p.id
    );
  end purge_post_preview;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure purge_post_preview_job(
    p_drop_job in boolean default false
  )
  as
    l_job_name      varchar2(255);
    job_not_exists  exception;
    pragma          exception_init(job_not_exists, -27475);
  begin

    l_job_name := 'BLOG_JOB_PURGE_POST_PREVIEW';

    begin
      sys.dbms_scheduler.drop_job(
        job_name => l_job_name
      );
    exception when job_not_exists then
      null;
    end;

    if not p_drop_job then
      sys.dbms_scheduler.create_job(
         job_name        => l_job_name
        ,job_type        => 'STORED_PROCEDURE'
        ,job_action      => 'blog_conf.purge_post_preview'
        ,start_date      => trunc(localtimestamp, 'HH')
        ,repeat_interval => 'FREQ=DAILY'
        ,enabled         => true
        ,comments        => 'Purge expired sessions posts previews'
      );
    end if;

  end purge_post_preview_job;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end "BLOG_CONF";
/
