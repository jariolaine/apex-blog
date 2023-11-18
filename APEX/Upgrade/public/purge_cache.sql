--------------------------------------------------------
--  Purge cached regions and pages
--------------------------------------------------------
apex_util.cache_purge_by_application(
  p_application => apex_application_install.get_application_id
);