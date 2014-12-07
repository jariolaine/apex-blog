/* Grant connect privilege on api.hostip.info to APEX schema */
/* This enables IP Geolocation data lookup */
BEGIN
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(
    'api.hostip.info.xml',
    'ACL that lets users connect to api.hostip.info',
    'APEX_040200',
    TRUE, 
    'connect'
  );
  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL('api.hostip.info.xml','api.hostip.info',80,80);
  COMMIT;  
END;
/
