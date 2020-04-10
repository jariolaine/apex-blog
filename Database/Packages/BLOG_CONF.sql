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
--
--  TO DO: (search from body TODO#x)
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

-------------------------------------------------------------------------------- 
  -- Called from: admin app pages 20011
  -- not ready
  procedure update_feature_config(
    p_app_id        in number
  );
--------------------------------------------------------------------------------
  procedure purge_region_cache(
    p_app_id        in number,
    p_static_id     in varchar2 default null,
    p_build_option  in varchar2 default null
  );
--------------------------------------------------------------------------------
  -- Called from: procedure blog_conf.purge_post_preview_job
  -- not ready
  procedure purge_post_preview;
--------------------------------------------------------------------------------
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
  procedure update_feature_config(
    p_app_id in number
  ) as
  begin

    -- set build option status
    for i in 1..apex_application.g_f01.count
    loop

      -- loop all build options and update those where status is changed
      for c1 in(
        select build_option_id
          ,build_option_name
        from apex_application_build_options
        where 1 = 1
        and application_id = p_app_id
        and build_option_name like 'BLOG\_FEATURE\_%' escape '\'
        and build_option_id = to_number( apex_application.g_f01( i ) )
        and build_option_status != apex_application.g_f02( i )
      ) loop
        -- set new build option status
        apex_util.set_build_option_status(
           p_application_id => p_app_id
          ,p_id => c1.build_option_id
          ,p_build_status => upper( apex_application.g_f02( i ) )
        );

        -- purge region cache
        blog_conf.purge_region_cache(
           p_app_id       => p_app_id
          ,p_build_option => c1.build_option_name
        );

      end loop;

    end loop;

  end update_feature_config;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  procedure purge_region_cache(
    p_app_id        in number,
    p_static_id     in varchar2 default null,
    p_build_option  in varchar2 default null
  )
  as
  begin

    -- if build option affects region, check if region is cache
    for c1 in(      
      select page_id
        ,region_id
      from apex_application_page_regions
      where 1 = 1
      and application_id  = p_app_id
      and region_caching != 'Not Cached'
      and ( 
        build_option = p_build_option
        or
        p_build_option is null
      )
      and (
        static_id = p_static_id
        or
        p_static_id is null
      )
    ) loop
      -- clear region cache
      apex_region.purge_cache(
         p_application_id => p_app_id
        ,p_page_id        => c1.page_id
        ,p_region_id      => c1.region_id
      );
    end loop;

  end purge_region_cache;
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
  
    l_job_name := 'BLOG_PURGE_POST_PREVIEW_JOB';
    
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
        ,job_action      => 'blog_cm.purge_post_preview'
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
