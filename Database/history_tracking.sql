-- history tracking
create table blog_history (
  hisotory_id         number(38,0) not null,
  table_name          varchar2(128) not null,
  column_name         varchar2(128) not null,
  action              varchar2(1) check (action in ('I','U','D')) not null,
  action_date         timestamp with local time zone not null,
  action_by           varchar2(255) not null,
  data_type           varchar2(255) not null,
  pk1                 number not null,
  tab_row_version     number(38,0) not null,
  old_vc              varchar2(4000),
  new_vc              varchar2(4000),
  old_number          number,
  new_number          number,
  old_tswltz          timestamp with local time zone,
  new_tswltz          timestamp with local time zone,
  old_clob            clob,
  new_clob            clob,
  constraint blog_history_pk primary key (history_id)
)
/

create index blog.history_idx1 on blog.history (pk1);
create index blog.history_idx2 on blog.history (table_name, column_name);

create or replace view blog.history_v as
select id,
       table_name,
       column_name,
       decode(action,'U','Update','D','Delete') action,
       action_date,
       action_by,
       pk1 table_primary_key,
       tab_row_version table_row_version,
       decode(data_type,
         'NUMBER',old_number||' > '||new_number,
         'VARCHAR2',substr(old_vc,1,50)||' > '||substr(new_vc,1,50),
         'DATE',to_char(old_date,'YYYYMMDD HH24:MI:SS')||' > '||to_char(new_date,'YYYYMMDD HH24:MI:SS'),
         'TIMESTAMP',to_char(old_ts,'YYYYMMDD HH24:MI:SS')||' > '||to_char(new_ts,'YYYYMMDD HH24:MI:SS'),
         'TIMESTAMP WITH TIMEZONE',to_char(old_tswtz,'YYYYMMDD HH24:MI:SS')||' > '||to_char(new_tswtz,'YYYYMMDD HH24:MI:SS'),
         'TIMESTAMP WITH LOCAL TIMEZONE',to_char(old_tswltz,'YYYYMMDD HH24:MI:SS')||' > '||to_char(new_tswltz,'YYYYMMDD HH24:MI:SS'),
         'BLOB','length '||sys.dbms_lob.getlength(old_blob)||' > '||' length '||sys.dbms_lob.getlength(new_blob),
         'CLOB',sys.dbms_lob.substr(old_vc,50,1)||' > '||sys.dbms_lob.substr(new_vc,50,1)
         ) change
from blog.history
/
