create or replace
type blog_log_msg_t
as object(
  activity_type		varchar(40 char),
  apex_session_id	number(38,0),
  user_id			number(38,0),
  related_id		number(38,0),
  search_type		varchar2(80 char),
  search_criteria	varchar2(4000 char),
  ip_address		varchar2(500 char),
  http_user_agent	varchar2(2000 char),
  http_referer		varchar2(2000 char),
  additinal_info	varchar2(4000 char)
);
/
declare
   subscriber sys.aq$_agent;
begin
  dbms_aqadm.create_queue_table(
    queue_table         => 'BLOG_LOG_QUEUE',
    queue_payload_type  => 'BLOG_LOG_MSG_T',
    multiple_consumers  => true,
    comment             => 'Blog activity log queue table'
  );
  dbms_aqadm.create_queue(
    queue_name  => 'BLOG_LOG_QUEUE',
    queue_table => 'BLOG_LOG_QUEUE',
    comment     => 'Blog activity log queue'
  );
  dbms_aqadm.start_queue('BLOG_LOG_QUEUE');

  subscriber := sys.aq$_agent('NEW_SESSION', null, null);
  dbms_aqadm.add_subscriber(
    queue_name => 'BLOG_LOG_QUEUE',
    subscriber => subscriber
  );

  subscriber := sys.aq$_agent('ARTICLE', null, null);
  dbms_aqadm.add_subscriber(
    queue_name => 'BLOG_LOG_QUEUE',
    subscriber => subscriber
  );

  subscriber := sys.aq$_agent('CATEGORY', null, null);
  dbms_aqadm.add_subscriber(
    queue_name => 'BLOG_LOG_QUEUE',
    subscriber => subscriber
  );

  subscriber := sys.aq$_agent('SEARCH', null, null);
  dbms_aqadm.add_subscriber(
    queue_name => 'BLOG_LOG_QUEUE',
    subscriber => subscriber
  );

  dbms_aq.register(
    sys.aq$_reg_info_list(
      sys.aq$_reg_info(
        'BLOG_LOG_QUEUE:NEW_SESSION',
        dbms_aq.namespace_aq,
        'plsql://blog_log_aq.new_session_dequeue',
        hextoraw('FF')
      ),
      sys.aq$_reg_info(
        'BLOG_LOG_QUEUE:ARTICLE',
        dbms_aq.namespace_aq,
        'plsql://blog_log_aq.article_access_dequeue',
        hextoraw('FF')
      ),
      sys.aq$_reg_info(
        'BLOG_LOG_QUEUE:CATEGORY',
        dbms_aq.namespace_aq,
        'plsql://blog_log_aq.category_access_dequeue',
        hextoraw('FF')
      ),
      sys.aq$_reg_info(
        'BLOG_LOG_QUEUE:SEARCH',
        dbms_aq.namespace_aq,
        'plsql://blog_log_aq.search_access_dequeue',
        hextoraw('FF')
      ),
      sys.aq$_reg_info(
        'BLOG_LOG_QUEUE:CATEGORY',
        dbms_aq.namespace_aq,
        'plsql://blog_log_aq.category_access_dequeue',
        hextoraw('FF')
      )
    ),
    4
  );

end;
/