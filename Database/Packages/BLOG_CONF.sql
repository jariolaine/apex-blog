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
end "BLOG_CONF";
/


CREATE OR REPLACE package body "BLOG_CONF" as
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Private variables
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
end "BLOG_CONF";
/
