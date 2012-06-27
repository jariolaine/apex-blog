set define off
set verify off
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
 
--application/set_environmentdbswh
prompt  APPLICATION 100 - Blog Reader
--
-- Application Export:
--   Application:     100
--   Name:            Blog Reader
--   Date and Time:   12:30 Friday November 25, 2011
--   Exported By:     LAINFJAR
--   Flashback:       0
--   Export Type:     Application Export
--   Version:         4.1.0.00.32
--   Instance ID:     71400285265526
 
-- Import:
--   Using application builder
--   or
--   Using SQL*Plus as the Oracle user APEX_040100 or as the owner (parsing schema) of the application.
 
-- Application Statistics:
--   Pages:                   12
--     Items:                 37
--     Computations:           8
--     Validations:            8
--     Processes:             18
--     Regions:               37
--     Buttons:                4
--     Dynamic Actions:        0
--   Shared Components
--     Breadcrumbs:            0
--        Entries              0
--     Items:                 21
--     Computations:           3
--     Processes:             22
--     Parent Tabs:            0
--     Tab Sets:               0
--        Tabs:                0
--     NavBars:                3
--     Lists:                  1
--     Shortcuts:              2
--     Themes:                 1
--     Templates:
--        Page:                1
--        List:                1
--        Report:              2
--        Label:               8
--        Region:              3
--     Messages:               0
--     Build Options:          0
 
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_040100 or as the owner (parsing schema) of the application.
  wwv_flow_api.set_security_group_id(p_security_group_id=>nvl(wwv_flow_application_install.get_workspace_id,2680813102140258));
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'en'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2011.02.12');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := nvl(wwv_flow_application_install.get_application_id,100);
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
 
end;
/

--application/delete_application
 
begin
 
   -- Remove Application
wwv_flow_api.remove_flow(nvl(wwv_flow_application_install.get_application_id,100));
 
end;
/

 
begin
 
wwv_flow_audit.remove_audit_trail(nvl(wwv_flow_application_install.get_application_id,100));
null;
 
end;
/

--application/create_application
 
begin
 
wwv_flow_api.create_flow(
  p_id    => nvl(wwv_flow_application_install.get_application_id,100),
  p_display_id=> nvl(wwv_flow_application_install.get_application_id,100),
  p_owner => nvl(wwv_flow_application_install.get_schema,'BLOG'),
  p_name  => nvl(wwv_flow_application_install.get_application_name,'Blog Reader'),
  p_alias => nvl(wwv_flow_application_install.get_application_alias,'BLOG'),
  p_page_view_logging => 'YES',
  p_default_page_template=> 757725673583542459 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=> 757725673583542459 + wwv_flow_api.g_id_offset,
  p_default_region_template=> 758174573175603752 + wwv_flow_api.g_id_offset,
  p_error_template=> 757725673583542459 + wwv_flow_api.g_id_offset,
  p_page_protection_enabled_y_n=> 'Y',
  p_checksum_salt_last_reset => '20111125123047',
  p_max_session_length_sec=> 28800,
  p_max_session_idle_sec=> 1800,
  p_compatibility_mode=> '4.0',
  p_home_link=> 'f?p=BLOG:HOME:0',
  p_flow_language=> 'en-us',
  p_flow_language_derived_from=> 'FLOW_PRIMARY_LANGUAGE',
  p_allow_feedback_yn=> 'N',
  p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'/i/'),
  p_publish_yn=> 'N',
  p_documentation_banner=> '',
  p_authentication=> 'PLUGIN',
  p_authentication_id=> 160013139029651428 + wwv_flow_api.g_id_offset,
  p_login_url=> '',
  p_logout_url=> 'wwv_flow_custom_auth_std.logout?p_this_flow=&APP_ID.&p_next_flow_page_sess=&APP_ID.:19',
  p_application_tab_set=> 0,
  p_public_url_prefix => '',
  p_public_user=> 'APEX_PUBLIC_USER',
  p_dbauth_url_prefix => '',
  p_proxy_server=> nvl(wwv_flow_application_install.get_proxy,''),
  p_cust_authentication_process=> '',
  p_cust_authentication_page=> '',
  p_custom_auth_login_url=> '',
  p_flow_version=> 'release 1.0',
  p_flow_status=> 'AVAILABLE_W_EDIT_LINK',
  p_flow_unavailable_text=> 'This application is currently unavailable at this time.',
  p_build_status=> 'RUN_AND_BUILD',
  p_exact_substitutions_only=> 'Y',
  p_browser_cache=>'Y',
  p_browser_frame=>'A',
  p_vpd=> '',
  p_vpd_teardown_code=> '',
  p_csv_encoding=> 'Y',
  p_default_error_display_loc=> 'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_theme_id => 202,
  p_default_label_template => 757701470883894939 + wwv_flow_api.g_id_offset,
  p_default_report_template => 757701078791894939 + wwv_flow_api.g_id_offset,
  p_default_list_template => 757732855915707081 + wwv_flow_api.g_id_offset,
  p_default_menu_template => 757701870397894939 + wwv_flow_api.g_id_offset,
  p_default_button_template => 180718636594197846 + wwv_flow_api.g_id_offset,
  p_default_chart_template => 758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_form_template => 758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_wizard_template => 758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_tabform_template => 758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_menur_template => 758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_listr_template => 758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_irr_template => 758174573175603752 + wwv_flow_api.g_id_offset,
  p_substitution_string_01 => 'APPLICATION_NAME',
  p_substitution_value_01  => 'Example Blog',
  p_substitution_string_02 => 'BLOGGER_NAME',
  p_substitution_value_02  => 'Paavo Blogger',
  p_substitution_string_03 => 'BLOG_EMAIL',
  p_substitution_value_03  => 'admin@blog.com',
  p_substitution_string_04 => 'GOOGLE_API_KEY',
  p_substitution_value_04  => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  p_substitution_string_05 => 'GOOGLE_ANALYTICS_ACCOUNT_NUM',
  p_substitution_value_05  => 'UA-XXXXXXX-X',
  p_substitution_string_06 => 'WEBSITE',
  p_substitution_value_06  => 'example.blog/blog_dad',
  p_substitution_string_07 => 'BLOG_DATE_FORMAT',
  p_substitution_value_07  => 'fmDD Mon YYYY fmfx HH',
  p_last_updated_by => 'LAINFJAR',
  p_last_upd_yyyymmddhh24miss=> '20111125123047',
  p_required_roles=> wwv_flow_utilities.string_to_table2(''));
 
 
end;
/

prompt  ...authorization schemes
--
 
begin
 
null;
 
end;
/

--application/shared_components/navigation/navigation_bar
prompt  ...navigation bar entries
--
 
begin
 
wwv_flow_api.create_icon_bar_item(
  p_id => 736299750057046236 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 10,
  p_icon_image => '#IMAGE_PREFIX#blog/images/home.gif',
  p_icon_subtext=> '',
  p_icon_target=> 'f?p=&APP_ALIAS.:HOME:0',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 736300055729057350 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 10,
  p_icon_image => '#IMAGE_PREFIX#blog/images/contact.gif',
  p_icon_subtext=> '',
  p_icon_target=> 'javascript:openForm(''&ADMIN_ID.'');',
  p_icon_image_alt=> '',
  p_icon_height=> null,
  p_icon_width=> null,
  p_icon_height2=> null,
  p_icon_width2=> null,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> '9',
  p_icon_bar_disp_cond_type=> '',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
wwv_flow_api.create_icon_bar_item(
  p_id => 736206142848435390 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_icon_sequence=> 200,
  p_icon_image => '#IMAGE_PREFIX#blog/images/lock_wait.gif',
  p_icon_subtext=> '&RETURN_USER.',
  p_icon_target=> '#',
  p_icon_image_alt=> '',
  p_icon_height=> 13,
  p_icon_width=> 11,
  p_icon_height2=> 24,
  p_icon_width2=> 24,
  p_nav_entry_is_feedback_yn => 'N',
  p_icon_bar_disp_cond=> 'RETURN_USER',
  p_icon_bar_disp_cond_type=> 'ITEM_IS_NOT_NULL',
  p_begins_on_new_line=> 'NO',
  p_cell_colspan      => 1,
  p_onclick=> '',
  p_icon_bar_comment=> '');
 
 
end;
/

prompt  ...application processes
--
--application/shared_components/logic/application_processes/email_from_contact_form
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'n number;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'for i in (select email'||unistr('\000a')||
'         from blog_reg_users where id = to_number(:CUSTOMER_NUM_TO)) loop'||unistr('\000a')||
'APEX_MAIL.SEND('||unistr('\000a')||
'    p_from => trim(:P0_EMAIL_FROM),'||unistr('\000a')||
'    p_to => i.email,'||unistr('\000a')||
'    p_body => :P0_BODY,'||unistr('\000a')||
'    p_subj => :P0_SUBJECT'||unistr('\000a')||
');'||unistr('\000a')||
''||unistr('\000a')||
'n := HTMLDB_PLSQL_JOB.submit_process'||unistr('\000a')||
'('||unistr('\000a')||
'p_sql => '''||unistr('\000a')||
'begin'||unistr('\000a')||
'HTMLDB_MAIL.PUSH_QUEUE(''''localhost'''', 25);'||unistr('\000a')||
'end;'','||unistr('\000a')||
'p_when => sysdate,'||unistr('\000a')||
'p_status => ''SUBMITTED'''||unistr('\000a')||
');';

p:=p||''||unistr('\000a')||
''||unistr('\000a')||
'commit;'||unistr('\000a')||
'end loop;'||unistr('\000a')||
''||unistr('\000a')||
'END;';

wwv_flow_api.create_flow_process(
  p_id => 159165512392955595 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'email_from_contact_form',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Can not send email.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'CONTACT',
  p_process_when_type=> 'REQUEST_EQUALS_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/download_files
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'DOWNLOAD_FILE(:FILE_ID);';

wwv_flow_api.create_flow_process(
  p_id => 117076652764291438 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Download Files',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Unable download file.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'DOWNLOAD',
  p_process_when_type=> 'REQUEST_EQUALS_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/calculate_returning_user_nick_and_email_from_cookie
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
''||unistr('\000a')||
'BLOG_API.read_askcookie;'||unistr('\000a')||
':p9_nickname := BLOG_API.fetch_askcookie_val(''NICKNAME'');'||unistr('\000a')||
':p9_email := BLOG_API.fetch_askcookie_val(''EMAIL'');'||unistr('\000a')||
'if :p9_nickname is not null then'||unistr('\000a')||
'for i in (select 1 from dual where exists (select 1 from blog_messages'||unistr('\000a')||
'                                           where  session_id = to_number(BLOG_API.fetch_askcookie_val(''HASH''))'||unistr('\000a')||
'                                           ';

p:=p||'and created_by_id in (select id from blog_reg_users where '||unistr('\000a')||
'                                                                                     nick = :p9_nickname)'||unistr('\000a')||
'                                          )'||unistr('\000a')||
'          ) loop'||unistr('\000a')||
':RETURN_USER := :p9_nickname;'||unistr('\000a')||
'end loop;'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 156725792574113281 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'calculate returning user nick and email from cookie',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Can not find user.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'RETURN_USER',
  p_process_when_type=> 'ITEM_IS_NULL',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/redirect_to_0_session
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'if OWA_UTIL.get_cgi_env (''QUERY_STRING'') not like ''p=&APP_ALIAS.:%:0%'' then'||unistr('\000a')||
'owa_util.redirect_url(''f?p=&APP_ALIAS.:HOME:0'');'||unistr('\000a')||
''||unistr('\000a')||
'end if;';

wwv_flow_api.create_flow_process(
  p_id => 156895392383986621 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'redirect to 0 session',
  p_process_sql_clob=> p,
  p_process_error_message=> 'can not redirect',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '10',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/reset_p_current_page
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'if :reset_page is null then'||unistr('\000a')||
':P_CURRENT_PAGE := 1;'||unistr('\000a')||
'end if;';

wwv_flow_api.create_flow_process(
  p_id => 158926590566906833 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Reset P_CURRENT_PAGE',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/redirect_from_page_0
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'owa_util.redirect_url(''f?p=&APP_ALIAS.:HOME:0'');';

wwv_flow_api.create_flow_process(
  p_id => 159254430925966965 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'redirect from page 0',
  p_process_sql_clob=> p,
  p_process_error_message=> 'can not redirect from page 0.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '0',
  p_process_when_type=> 'CURRENT_PAGE_IN_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/clear_search
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||':P0_SEARCH := null;'||unistr('\000a')||
':p0_search_opt := null;';

wwv_flow_api.create_flow_process(
  p_id => 162118796276000437 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'clear search',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Can not clear search.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '2',
  p_process_when_type=> 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/rss_popular
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'RSS_POPULAR;';

wwv_flow_api.create_flow_process(
  p_id => 116958946568242385 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RSS_POPULAR',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/rss_recent
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'RSS_RECENT;';

wwv_flow_api.create_flow_process(
  p_id => 116974755226244801 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RSS_RECENT',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/rss_hot
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'RSS_HOT;';

wwv_flow_api.create_flow_process(
  p_id => 151559757216471769 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RSS_HOT',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/printitemhelp
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'for i in ('||unistr('\000a')||
'select ITEM_HELP_TEXT'||unistr('\000a')||
'from APEX_APPLICATION_PAGE_ITEMS'||unistr('\000a')||
'where  application_id = :app_id'||unistr('\000a')||
'and item_id = apex_application.g_x01 '||unistr('\000a')||
') loop'||unistr('\000a')||
'htp.p(i.ITEM_HELP_TEXT);'||unistr('\000a')||
'end loop;';

wwv_flow_api.create_flow_process(
  p_id => 156557679588240708 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'PRINTITEMHELP',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/logerror
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'DECLARE'||unistr('\000a')||
'n NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'SELECT blog_id.next_val'||unistr('\000a')||
'INTO n'||unistr('\000a')||
'FROM DUAL;'||unistr('\000a')||
''||unistr('\000a')||
'INSERT INTO BLOG_ERROR_LOG(err_message, defined_message,id, log_seq_id)'||unistr('\000a')||
'VALUES (APEX_APPLICATION.G_x01, APEX_APPLICATION.G_x02,n, null);'||unistr('\000a')||
'--htp.prn(''<b>''||LOG_ERROR_PKG.FORMAT_ERROR(APEX_APPLICATION.G_x01||''</b>'',NULL));'||unistr('\000a')||
'--htp.prn(''<br/><br/>''||htmldb_lang.message(''CONTACT_ADMIN'',n));'||unistr('\000a')||
'--htp.prn(sqlerrm);'||unistr('\000a')||
'--snapshot_session.take_snap';

p:=p||'(n);'||unistr('\000a')||
'htp.p(n);'||unistr('\000a')||
':ERROR := n;'||unistr('\000a')||
':ERRMSG := APEX_APPLICATION.G_x02;'||unistr('\000a')||
'END;';

wwv_flow_api.create_flow_process(
  p_id => 156712507075270271 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'LOGERROR',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/formaterror
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'owa_util.redirect_url(''f?p=BLOG:ERROR:0::::ERROR:''||APEX_APPLICATION.G_x01);';

wwv_flow_api.create_flow_process(
  p_id => 156714594681872368 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'FORMATERROR',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/hash
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'htp.p(BLOG_CUSTOM_HASH(upper(APEX_APPLICATION.G_x01),BLOG_API.g_ask_cookiename));';

wwv_flow_api.create_flow_process(
  p_id => 156715686819352646 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'HASH',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/p2_auto
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'	l_search varchar2(32676);'||unistr('\000a')||
'begin'||unistr('\000a')||
'	l_search := replace(wwv_flow.g_x01,'' '',''%'');'||unistr('\000a')||
'    '||unistr('\000a')||
'    for c1 in (select msg_subject'||unistr('\000a')||
'                 from blog_messages'||unistr('\000a')||
'                where msg_type = ''STANDARD'''||unistr('\000a')||
'                and (upper(msg_subject) like ''%''||upper(l_search)||''%'' or upper(msg_text) like ''%''||upper(l_search)||''%'') order by msg_subject)'||unistr('\000a')||
'    loop'||unistr('\000a')||
'        htp.p(c1.msg_subject);'||unistr('\000a')||
'    end lo';

p:=p||'op;'||unistr('\000a')||
'BLOG_API.write_search_log(''From Autocomplete: ''|| wwv_flow.g_x01, :p9_email );'||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 159040579052323656 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'P2_AUTO',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/checkcontact
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||':P0_EMAIL_FROM := substr(trim(:P0_EMAIL_FROM),1,100);'||unistr('\000a')||
':P0_SUBJECT := substr(trim(:P0_SUBJECT),1,100);'||unistr('\000a')||
':P0_BODY := substr(trim(:P0_BODY),1,32000);'||unistr('\000a')||
'if not check_email(:P0_EMAIL_FROM) then'||unistr('\000a')||
'htp.prn(''Email is of invalid format or empty.'');'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if :P0_SUBJECT is null then'||unistr('\000a')||
'htp.p(''<br>'');'||unistr('\000a')||
'htp.prn(''Subject should be specified.'');'||unistr('\000a')||
'end if;'||unistr('\000a')||
'if :P0_BODY is null then'||unistr('\000a')||
'htp.p(''<br>'');'||unistr('\000a')||
'htp.prn(''Message body sho';

p:=p||'uld be specified.'');'||unistr('\000a')||
'end if;';

wwv_flow_api.create_flow_process(
  p_id => 159165101179942904 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'CHECKCONTACT',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/setcustomerto
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||':CUSTOMER_NUM_TO := apex_application.g_x01;'||unistr('\000a')||
'for i in (select nick from blog_reg_users where id = :CUSTOMER_NUM_TO ) loop'||unistr('\000a')||
'  :CUSTOMER_NICK := i.nick;'||unistr('\000a')||
'  htp.p(:CUSTOMER_NICK);'||unistr('\000a')||
'END LOOP;';

wwv_flow_api.create_flow_process(
  p_id => 159165312953946333 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SETCUSTOMERTO',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/googleapi
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
':LAT := nvl(apex_application.g_x01,0);'||unistr('\000a')||
':LONG := apex_application.g_x02;'||unistr('\000a')||
':CITY := apex_application.g_x03;'||unistr('\000a')||
':REGION := apex_application.g_x04;'||unistr('\000a')||
':COUNTRY := apex_application.g_x05;'||unistr('\000a')||
':COUNTRY_CODE := apex_application.g_x06;'||unistr('\000a')||
':IP := get_client_ip;'||unistr('\000a')||
''||unistr('\000a')||
'IF nvl(:IP,''0'') not like ''192.168.%'' THEN'||unistr('\000a')||
''||unistr('\000a')||
'INSERT'||unistr('\000a')||
'INTO BLOG_ACTIVITY_LOG'||unistr('\000a')||
'  ('||unistr('\000a')||
'    TIME_STAMP,'||unistr('\000a')||
'    COOKIE_ID,'||unistr('\000a')||
'    PAGE_ID,'||unistr('\000a')||
'    SESSION_ID,'||unistr('\000a')||
'    IP_ADDRESS,'||unistr('\000a')||
' ';

p:=p||'   USER_AGENT,'||unistr('\000a')||
'    MONTH,'||unistr('\000a')||
'    LAT,'||unistr('\000a')||
'    LONGT,'||unistr('\000a')||
'    CITY,'||unistr('\000a')||
'    REGION,'||unistr('\000a')||
'    COUNTRY,'||unistr('\000a')||
'    COUNTRY_CODE'||unistr('\000a')||
'  )'||unistr('\000a')||
'  VALUES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    sysdate,'||unistr('\000a')||
'    null,'||unistr('\000a')||
'    :APP_PAGE_ID,'||unistr('\000a')||
'    :SESSION,'||unistr('\000a')||
'    :IP,'||unistr('\000a')||
'    owa_util.get_cgi_env( ''HTTP_USER_AGENT'' ),'||unistr('\000a')||
'    null,'||unistr('\000a')||
':LAT ,'||unistr('\000a')||
':LONG ,'||unistr('\000a')||
':CITY ,'||unistr('\000a')||
':REGION ,'||unistr('\000a')||
':COUNTRY ,'||unistr('\000a')||
':COUNTRY_CODE '||unistr('\000a')||
'  );'||unistr('\000a')||
''||unistr('\000a')||
'END IF;'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 159282818134442269 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'GOOGLEAPI',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/rate
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
''||unistr('\000a')||
'if APEX_APPLICATION.G_x01 is not null then'||unistr('\000a')||
'insert into blog_article_rate (Article_id, rate, clicks)'||unistr('\000a')||
'values (v(''ARTICLE''),APEX_APPLICATION.G_x01,1);'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'exception '||unistr('\000a')||
'when DUP_VAL_ON_INDEX then'||unistr('\000a')||
''||unistr('\000a')||
'update blog_article_rate'||unistr('\000a')||
'set rate = ceil((rate * clicks + APEX_APPLICATION.G_x01)/(clicks + 1))'||unistr('\000a')||
', clicks = clicks + 1'||unistr('\000a')||
'where article_id = :ARTICLE;'||unistr('\000a')||
''||unistr('\000a')||
'when others then null;'||unistr('\000a')||
''||unistr('\000a')||
'end;';

wwv_flow_api.create_flow_process(
  p_id => 161142695168565250 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RATE',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/rate_multiple
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
''||unistr('\000a')||
'if APEX_APPLICATION.G_x01 is not null then'||unistr('\000a')||
'insert into blog_article_rate (Article_id, rate, clicks)'||unistr('\000a')||
'values (APEX_APPLICATION.G_x02,APEX_APPLICATION.G_x01,1);'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'exception '||unistr('\000a')||
'when DUP_VAL_ON_INDEX then'||unistr('\000a')||
''||unistr('\000a')||
'update blog_article_rate'||unistr('\000a')||
'set rate = ceil((rate * clicks + APEX_APPLICATION.G_x01)/(clicks + 1))'||unistr('\000a')||
', clicks = clicks + 1'||unistr('\000a')||
'where article_id = APEX_APPLICATION.G_x02;'||unistr('\000a')||
''||unistr('\000a')||
'when others then null;'||unistr('\000a')||
''||unistr('\000a')||
'e';

p:=p||'nd;';

wwv_flow_api.create_flow_process(
  p_id => 165545300155528668 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RATE_MULTIPLE',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/rss
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'RSS;';

wwv_flow_api.create_flow_process(
  p_id => 169423190694008848 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'RSS',
  p_process_sql_clob=> p,
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> '',
  p_process_when_type=> '',
  p_process_comment=> '');
end;
 
null;
 
end;
/

--application/shared_components/logic/application_processes/search
 
begin
 
declare
    p varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
p:=p||'owa_util.redirect_url(''f?p=&APP_ALIAS.:SEARCH:0'');';

wwv_flow_api.create_flow_process(
  p_id => 175205194792028406 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_process_sequence=> 1,
  p_process_point => 'ON_DEMAND',
  p_process_type=> 'PLSQL',
  p_process_name=> 'SEARCH',
  p_process_sql_clob=> p,
  p_process_error_message=> 'Can not search.',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=> 'GO,P0_SEARCH',
  p_process_when_type=> 'REQUEST_IN_CONDITION',
  p_process_comment=> '');
end;
 
null;
 
end;
/

prompt  ...application items
--
--application/shared_components/logic/application_items/admin_id
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159166112654974653 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'ADMIN_ID',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/article
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 163546491747790195 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'ARTICLE',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'N',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/category
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 163746870454821938 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'CATEGORY',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'N',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/city
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159283810347477820 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'CITY',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/country
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159284219004480362 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'COUNTRY',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/country_code
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159284423506481614 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'COUNTRY_CODE',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'N',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/customer_nick
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159188632700864339 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'CUSTOMER_NICK',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/customer_num_to
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159165907459973084 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'CUSTOMER_NUM_TO',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/errmsg
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 160618286328798533 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'ERRMSG',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/file_id
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 117092533633304894 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'FILE_ID',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'N',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/fsp_after_login_url
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 736208067738435732 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'FSP_AFTER_LOGIN_URL',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> '',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/ip
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159285110074733244 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'IP',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/jsapi
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 168682567425822321 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'JSAPI',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/lat
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159283029562445519 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'LAT',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/long
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159283606191476610 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'LONG',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/p_current_page
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 158924482620705815 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'P_CURRENT_PAGE',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/p_page_count
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 158924275694703787 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'P_PAGE_COUNT',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/region
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 159284014502479070 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'REGION',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/reset_page
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 161214375411272521 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'RESET_PAGE',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/return_user
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 156736491517029764 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'RETURN_USER',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'I',
  p_item_comment=> '');
 
null;
 
end;
/

--application/shared_components/logic/application_items/v_session
 
begin
 
wwv_flow_api.create_flow_item(
  p_id=> 744254348815349152 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'V_SESSION',
  p_data_type=> 'VARCHAR',
  p_is_persistent=> 'Y',
  p_protection_level=> 'N',
  p_item_comment=> 'session');
 
null;
 
end;
/

prompt  ...application level computations
--
 
begin
 
--application/shared_components/logic/application_computations/admin_id
wwv_flow_api.create_flow_computation (
  p_id => 159166318672985825 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'ADMIN_ID',
  p_computation_point    => 'BEFORE_HEADER',
  p_computation_type => 'QUERY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'select id from blog_reg_users where lower(email) = lower(:BLOG_EMAIL)',
  p_compute_when=> 'ADMIN_ID',
  p_compute_when_type=> 'ITEM_IS_NULL',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/v_session
wwv_flow_api.create_flow_computation (
  p_id => 169577274642070435 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'V_SESSION',
  p_computation_point    => 'BEFORE_HEADER',
  p_computation_type => 'FUNCTION_BODY',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => 'IF :APP_USER IS NOT NULL AND :APP_USER NOT IN(''nobody'',''ANONYMOUS'',''APEX_PUBLIC_USER'',''HTMLDB_PUBLIC_USER'') THEN'||unistr('\000a')||
'   RETURN :SESSION;'||unistr('\000a')||
'ELSE'||unistr('\000a')||
'   RETURN 0;'||unistr('\000a')||
'END IF;',
  p_compute_when=> '',
  p_compute_when_type=> '',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
--application/shared_components/logic/application_computations/jsapi
wwv_flow_api.create_flow_computation (
  p_id => 168702482663826654 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_computation_sequence => 10,
  p_computation_item => 'JSAPI',
  p_computation_point    => 'ON_NEW_INSTANCE',
  p_computation_type => 'STATIC_ASSIGNMENT',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation => '<script type="text/javascript" src="https://www.google.com/jsapi?key=&GOOGLE_API_KEY."></script>',
  p_compute_when=> 'GOOGLE_API_KEY',
  p_compute_when_type=> 'ITEM_IS_NOT_NULL',
  p_computation_error_message=>'',
  p_computation_comment=> '',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

prompt  ...Application Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Application Parent Tabs
--
 
begin
 
null;
 
end;
/

prompt  ...Shared Lists of values
--
--application/shared_components/user_interface/lov/cat
 
begin
 
wwv_flow_api.create_list_of_values (
  p_id       => 159206825165243726 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_lov_name => 'CAT',
  p_lov_query=> 'select CATEGORY_NAME display_value, ID return_value '||unistr('\000a')||
'from BLOG_CATEGORIES'||unistr('\000a')||
'where active = ''Y'''||unistr('\000a')||
'order by 1');
 
null;
 
end;
/

prompt  ...Application Trees
--
--application/pages/page_groups
prompt  ...page groups
--
 
begin
 
wwv_flow_api.create_page_group(
  p_id=>159176110201215491 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'FILES',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>736518449096877594 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'HOME',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>159176008123214878 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'RESOURCES',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>736518753945878913 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'SEARCH',
  p_group_desc=>'');
 
wwv_flow_api.create_page_group(
  p_id=>155448691321688024 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_group_name=>'VISITORS',
  p_group_desc=>'');
 
null;
 
end;
/

 
--application/pages/page_00000
prompt  ...PAGE 0: 0
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 0
 ,p_name => '0'
 ,p_step_title => '0'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111111225620'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<div id="htmldb-confirm-dialog" class="hideMe508"><p class="fielddatabold"></p></div>'||unistr('\000a')||
'<div id="htmldb-msg-dialog" class="hideMe508"><p class="t12Messages"></p></div>'||unistr('\000a')||
'<script type="text/javascript">'||unistr('\000a')||
' $(''#htmldb-confirm-dialog'').dialog({autoOpen:false});'||unistr('\000a')||
''||unistr('\000a')||
' function htmldbConfirmDialog(pReq,pOpt){'||unistr('\000a')||
'  pOpt=$.extend({'||unistr('\000a')||
'   buttons:{'||unistr('\000a')||
'    "OK":function(){$(this).dialog(''close'');doSubmit(pReq)},'||unistr('\000a')||
'    "Cancel"';

s:=s||':function(){$(this).dialog(''close'')}'||unistr('\000a')||
'   },'||unistr('\000a')||
'   title:''Confirm Action'','||unistr('\000a')||
'   modal:true,'||unistr('\000a')||
'   message:''Do you like to perform this action?'''||unistr('\000a')||
'   },pOpt);'||unistr('\000a')||
' '||unistr('\000a')||
'  $(''#htmldb-confirm-dialog'').find(''p'').text(pOpt.message);'||unistr('\000a')||
'  '||unistr('\000a')||
'  $(''#htmldb-confirm-dialog'').dialog(''option'',pOpt).dialog(''open'');'||unistr('\000a')||
'}'||unistr('\000a')||
' $(''#htmldb-msg-dialog'').dialog({autoOpen:false});'||unistr('\000a')||
''||unistr('\000a')||
' function htmldbMsgDialog(pOpt){'||unistr('\000a')||
'  pOpt=$.extend({'||unistr('\000a')||
'   buttons:{'||unistr('\000a')||
'   ';

s:=s||' "OK":function(){$(this).dialog(''close'')}'||unistr('\000a')||
'   },'||unistr('\000a')||
'   title:''Message'','||unistr('\000a')||
'   modal:true,'||unistr('\000a')||
'   message:'''''||unistr('\000a')||
'   },pOpt);'||unistr('\000a')||
' '||unistr('\000a')||
'  $(''#htmldb-msg-dialog'').find(''p'').html(pOpt.message);'||unistr('\000a')||
'  '||unistr('\000a')||
'  $(''#htmldb-msg-dialog'').dialog(''option'',pOpt).dialog(''open'');'||unistr('\000a')||
'}'||unistr('\000a')||
'</script>';

wwv_flow_api.create_page_plug (
  p_id=> 156707786813176188 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Confirm Dialog',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 160,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_IN_CONDITION',
  p_plug_display_when_condition => '8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<script type="text/javascript">'||unistr('\000a')||
'$(function(){'||unistr('\000a')||
' try{'||unistr('\000a')||
'  animatedcollapse.toggle(''rabbit1'');animatedcollapse.toggle(''rabbit1'');'||unistr('\000a')||
' }catch(err){}'||unistr('\000a')||
'});'||unistr('\000a')||
'</script>';

wwv_flow_api.create_page_plug (
  p_id=> 158352289744691502 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'toggle div',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 180,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9,3',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_archives;';

wwv_flow_api.create_page_plug (
  p_id=> 158853201571958284 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Archives',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 757727179981673634+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 80,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<div id="tree">',
  p_plug_footer=> '</div>'||unistr('\000a')||
'<script type="text/javascript">'||unistr('\000a')||
'$(function(){'||unistr('\000a')||
' $("#tree").treeview({'||unistr('\000a')||
'  collapsed: true,'||unistr('\000a')||
'  persist: "location"'||unistr('\000a')||
' });'||unistr('\000a')||
'});'||unistr('\000a')||
'</script>'||unistr('\000a')||
'',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 159162108517774712 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Contact Form',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 320,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<div id="contactDialog" style="display:none;">'||unistr('\000a')||
'<div id="responseeDiv"></div><div id="responseeokDiv"></div>',
  p_plug_footer=> '</div>'||unistr('\000a')||
''||unistr('\000a')||
'<script type="text/javascript">'||unistr('\000a')||
'  $(function(){'||unistr('\000a')||
'    $("#contactDialog").dialog({'||unistr('\000a')||
'                autoOpen: false'||unistr('\000a')||
'                ,modal: true'||unistr('\000a')||
'		,width: 550'||unistr('\000a')||
'                ,height:500'||unistr('\000a')||
'                ,position: ''center'''||unistr('\000a')||
'                ,resizable: false'||unistr('\000a')||
'                ,title: ''Contact User: &CUSTOMER_NICK.'' '||unistr('\000a')||
'      ,open : function() {'||unistr('\000a')||
'            $(''#contactDialog'').dialog( "option" , "title" ,"Contact User: &CUSTOMER_NICK.");'||unistr('\000a')||
'      }'||unistr('\000a')||
'	});'||unistr('\000a')||
'  });'||unistr('\000a')||
'function openForm(p_cust_num){'||unistr('\000a')||
'   var ajaxRequest = new htmldb_Get(null, $v(''pFlowId''), ''APPLICATION_PROCESS=SETCUSTOMERTO'',0);'||unistr('\000a')||
'   ajaxRequest.addParam(''x01'', p_cust_num);'||unistr('\000a')||
'   var results = ajaxRequest.get();'||unistr('\000a')||
'   ajaxRequest = null;'||unistr('\000a')||
'  document.getElementById("P0_EMAIL_FROM").value = '''';'||unistr('\000a')||
'  document.getElementById("P0_SUBJECT").value = '''';'||unistr('\000a')||
'  document.getElementById("P0_BODY").value = '''';'||unistr('\000a')||
'  $("#contactDialog").dialog(''open'');'||unistr('\000a')||
'  $(''#contactDialog'').dialog( "option" , "title" ,"Contact User: " + results);'||unistr('\000a')||
'  document.getElementById("P0_EMAIL_FROM").focus();'||unistr('\000a')||
'}'||unistr('\000a')||
'function AjaxSubmitEmail(p_email,p_subject,p_body){ '||unistr('\000a')||
''||unistr('\000a')||
'   var l_email   = $x(p_email);'||unistr('\000a')||
'   var l_subject   = $x(p_subject);'||unistr('\000a')||
'   var l_body   = $x(p_body);'||unistr('\000a')||
'   $(''#responseeDiv'').hide();'||unistr('\000a')||
'   $(''#responseeokDiv'').hide();'||unistr('\000a')||
'   var ajaxRequest = new htmldb_Get(null, $v(''pFlowId''), ''APPLICATION_PROCESS=CHECKCONTACT'',0);'||unistr('\000a')||
'   ajaxRequest.add($x(l_email).id, $v(l_email));'||unistr('\000a')||
'   ajaxRequest.add($x(l_subject).id, $v(l_subject));'||unistr('\000a')||
'   ajaxRequest.add($x(l_body).id, $v(l_body));'||unistr('\000a')||
''||unistr('\000a')||
'   var results = ajaxRequest.get();'||unistr('\000a')||
''||unistr('\000a')||
'   if(results){'||unistr('\000a')||
'            $(''#responseeDiv'').fadeIn(500);'||unistr('\000a')||
'            $(''#responseeDiv'').html(results);'||unistr('\000a')||
'            $(''#responseeDiv'').fadeOut(7000);'||unistr('\000a')||
'   } else {'||unistr('\000a')||
'   doSubmit(''CONTACT'');'||unistr('\000a')||
'   $(''#responseeokDiv'').fadeIn(500);'||unistr('\000a')||
'   $(''#responseeokDiv'').html(''Email Sent'');'||unistr('\000a')||
'   $(''#responseeokDiv'').fadeOut(7000);'||unistr('\000a')||
'   };'||unistr('\000a')||
'   ajaxRequest = null;'||unistr('\000a')||
'   return;'||unistr('\000a')||
'}'||unistr('\000a')||
'</script>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<script type="text/javascript">'||unistr('\000a')||
'$(function(){'||unistr('\000a')||
' if(google.loader.ClientLocation){'||unistr('\000a')||
'  var ajaxRequest = new htmldb_Get(null,&APP_ID.,''APPLICATION_PROCESS=GOOGLEAPI'');'||unistr('\000a')||
'  ajaxRequest.addParam(''x01'', google.loader.ClientLocation.latitude);'||unistr('\000a')||
'  ajaxRequest.addParam(''x02'', google.loader.ClientLocation.longitude);'||unistr('\000a')||
'  ajaxRequest.addParam(''x03'', google.loader.ClientLocation.address.city);'||unistr('\000a')||
'  ajaxRequest.addPara';

s:=s||'m(''x04'', google.loader.ClientLocation.address.region);'||unistr('\000a')||
'  ajaxRequest.addParam(''x05'', google.loader.ClientLocation.address.country);'||unistr('\000a')||
'  ajaxRequest.addParam(''x06'', google.loader.ClientLocation.address.country_code);'||unistr('\000a')||
'  var results = ajaxRequest.get();'||unistr('\000a')||
'  ajaxRequest = null;'||unistr('\000a')||
' }'||unistr('\000a')||
'});'||unistr('\000a')||
'</script>';

wwv_flow_api.create_page_plug (
  p_id=> 159282506013438786 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Google API JS',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 460,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'EXISTS',
  p_plug_display_when_condition => 'SELECT 1'||unistr('\000a')||
'FROM dual'||unistr('\000a')||
'WHERE :LAT IS NULL'||unistr('\000a')||
'  AND :GOOGLE_API_KEY IS NOT NULL',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<script type="text/javascript">'||unistr('\000a')||
'$(function (){'||unistr('\000a')||
' try{'||unistr('\000a')||
'  animatedcollapse.toggle(''rabbit1'');'||unistr('\000a')||
' }'||unistr('\000a')||
' catch(err){}'||unistr('\000a')||
'});'||unistr('\000a')||
'</script>';

wwv_flow_api.create_page_plug (
  p_id=> 160473598270599941 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'toggle div only for READ',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 190,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_EQUALS_CONDITION',
  p_plug_display_when_condition => '3',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<script type="text/javascript">'||unistr('\000a')||
''||unistr('\000a')||
'  var _gaq = _gaq || [];'||unistr('\000a')||
'  _gaq.push([''_setAccount'', ''&GOOGLE_ANALYTICS_ACCOUNT_NUM.'']);'||unistr('\000a')||
'  _gaq.push([''_trackPageview'']);'||unistr('\000a')||
''||unistr('\000a')||
'  (function() {'||unistr('\000a')||
'    var ga = document.createElement(''script''); ga.type = ''text/javascript''; ga.async = true;'||unistr('\000a')||
'    ga.src = (''https:'' == document.location.protocol ? ''https://ssl'' : ''http://www'') + ''.google-analytics.com/ga.js'';'||unistr('\000a')||
'    var s = docum';

s:=s||'ent.getElementsByTagName(''script'')[0]; s.parentNode.insertBefore(ga, s);'||unistr('\000a')||
'  })();'||unistr('\000a')||
''||unistr('\000a')||
'</script>';

wwv_flow_api.create_page_plug (
  p_id=> 161644377262107311 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Google Analytic JS',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 470,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'ITEM_IS_NOT_NULL',
  p_plug_display_when_condition => 'GOOGLE_ANALYTICS_ACCOUNT_NUM',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'Do not delete this region. Region holds all pages items that we do not like render.';

wwv_flow_api.create_page_plug (
  p_id=> 163645190624808798 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Not Rendered Items',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 440,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'NEVER',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<a href="f?p=&APP_ALIAS.:HOME:0:APPLICATION_PROCESS=RSS"><img src="#IMAGE_PREFIX#blog/images/rss.jpg" alt="RSS Feed" /></a>';

wwv_flow_api.create_page_plug (
  p_id=> 169071570729936777 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'RSS Feed',
  p_region_name=>'',
  p_escape_on_http_output=>'Y',
  p_plug_template=> 0,
  p_plug_display_sequence=> 120,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 175195201736831765 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Search Archives',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 757727179981673634+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 70,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '<script language="JavaScript">'||unistr('\000a')||
'function move(v) {'||unistr('\000a')||
'   var ajaxRequest = new htmldb_Get(null, $v(''pFlowId''), ''APPLICATION_PROCESS=SEARCH'',0);'||unistr('\000a')||
'   ajaxRequest.addParam(''x01'', v);'||unistr('\000a')||
'   var results = ajaxRequest.get();'||unistr('\000a')||
'   ajaxRequest = null;'||unistr('\000a')||
''||unistr('\000a')||
'}'||unistr('\000a')||
'</script>'||unistr('\000a')||
'<script type="text/javascript">'||unistr('\000a')||
'function redirectsearch(e) {     '||unistr('\000a')||
'if (e.keyCode == 13) {         '||unistr('\000a')||
'redirect(''f?p=&APP_ALIAS.:SEARCH:0'')         '||unistr('\000a')||
'return false;     '||unistr('\000a')||
'} '||unistr('\000a')||
'} '||unistr('\000a')||
'</script>');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'for i in ('||unistr('\000a')||
'select ''<div class="htmltooltip">''||ITEM_HELP_TEXT||''</div>'' text'||unistr('\000a')||
'from APEX_APPLICATION_PAGE_ITEMS'||unistr('\000a')||
'where  application_id = :app_id'||unistr('\000a')||
'and page_id = :app_page_id '||unistr('\000a')||
'and condition_type is null'||unistr('\000a')||
'and item_help_text is not null'||unistr('\000a')||
'order by DISPLAY_SEQUENCE'||unistr('\000a')||
') loop'||unistr('\000a')||
'htp.p(i.TEXT);'||unistr('\000a')||
'end loop;';

wwv_flow_api.create_page_plug (
  p_id=> 175203497598981912 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'print help',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 230,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_most_hit_articles(9);';

wwv_flow_api.create_page_plug (
  p_id=> 179157294215718357 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Most Hits per Day:',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 757727179981673634+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 110,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 736244551449455607 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Slogan',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_04',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_welcome;';

wwv_flow_api.create_page_plug (
  p_id=> 736257962868083351 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Thank you for visiting!',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 757727179981673634+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 60,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_last_articles(9);';

wwv_flow_api.create_page_plug (
  p_id=> 736258146723088140 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Last Articles:',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 757727179981673634+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 90,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_popular_articles(9);';

wwv_flow_api.create_page_plug (
  p_id=> 736259354650137735 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Most Clicked Articles:',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 757727179981673634+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 100,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_05',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_categories(20);';

wwv_flow_api.create_page_plug (
  p_id=> 736260256990157336 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Categories:',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 757727179981673634+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 20,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_06',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_super;';

wwv_flow_api.create_page_plug (
  p_id=> 736260461277167977 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Super',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 30,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_06',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p style="font-size: 0.8em; color:#FFDAB9; width: 750px;">&nbsp;</p> ';

wwv_flow_api.create_page_plug (
  p_id=> 736262536914227216 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Footer text',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 450,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_08',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_header=> '<div>CSS Design adapted from: <a href="http://www.free-css-templates.com">Free Css Templates</a></div>',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_resource;';

wwv_flow_api.create_page_plug (
  p_id=> 736266258918347134 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Resource',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 40,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_06',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_favorite;';

wwv_flow_api.create_page_plug (
  p_id=> 736266447274353164 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Favorite',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 50,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_06',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => 'CURRENT_PAGE_NOT_IN_CONDITION',
  p_plug_display_when_condition => '7,8,9',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'DECLARE'||unistr('\000a')||
'  l_current_group VARCHAR2(100);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  htp.p(''<ul>'');'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT MIN(PAGE_ID) page_id,'||unistr('\000a')||
'    PAGE_GROUP'||unistr('\000a')||
'  FROM apex_application_pages'||unistr('\000a')||
'  WHERE application_id             = :APP_ID'||unistr('\000a')||
'  AND PAGE_REQUIRES_AUTHENTICATION = ''No'''||unistr('\000a')||
'  AND page_id NOT                 IN (0,101)'||unistr('\000a')||
'  AND page_group                  IS NOT NULL'||unistr('\000a')||
'  GROUP BY PAGE_GROUP'||unistr('\000a')||
'  ORDER BY page_id'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    SELECT PAGE_GR';

s:=s||'OUP'||unistr('\000a')||
'    INTO l_current_group'||unistr('\000a')||
'    FROM apex_application_pages'||unistr('\000a')||
'    WHERE application_id = :APP_ID'||unistr('\000a')||
'    AND page_id          = :APP_PAGE_ID;'||unistr('\000a')||
'    IF i.PAGE_GROUP      = l_current_group THEN'||unistr('\000a')||
'      htp.p(''<li><a class="current" href="f?p=&APP_ALIAS.:''||i.page_group||'':'' || :V_SESSION ||'' "><span>''||i.page_group||''</span></a></li>'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      htp.p(''<li><a href="f?p=&APP_ALIAS.:'' || i.page_group || ';

s:=s||''':'' || :V_SESSION || ''"><span>''||i.page_group||''</span></a></li>'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p(''</ul>'');'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_plug (
  p_id=> 736374957373176967 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 0,
  p_plug_name=> 'Tab List',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 5,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'REGION_POSITION_03',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> 'declare'||unistr('\000a')||
'l_current_group VARCHAR2(100);'||unistr('\000a')||
'begin'||unistr('\000a')||
'htp.p(''<ul>'');'||unistr('\000a')||
'for i in ('||unistr('\000a')||
'    select min(PAGE_ID) page_id, PAGE_GROUP from apex_application_pages '||unistr('\000a')||
'    where application_id = :APP_ID '||unistr('\000a')||
'    and PAGE_REQUIRES_AUTHENTICATION = ''No'''||unistr('\000a')||
'    and page_id not in (0,101)'||unistr('\000a')||
'    GROUP BY PAGE_GROUP'||unistr('\000a')||
'    order by page_id'||unistr('\000a')||
') loop'||unistr('\000a')||
''||unistr('\000a')||
'    select PAGE_GROUP '||unistr('\000a')||
'    into l_current_group'||unistr('\000a')||
'    from apex_application_pages '||unistr('\000a')||
'    where application_id = :APP_ID '||unistr('\000a')||
'    and   page_id = :APP_PAGE_ID;'||unistr('\000a')||
'--   if i.page_group != ''ARCHIVES'' then'||unistr('\000a')||
'   if i.PAGE_GROUP = l_current_group then'||unistr('\000a')||
'      htp.p(''<li><a class="current" href="f?p=&APP_ALIAS.:''||i.page_group||'':&V_SESSION."><span>''||i.page_group||''</span></a></li>'');'||unistr('\000a')||
'   else'||unistr('\000a')||
'      htp.p(''<li><a href="f?p=&APP_ALIAS.:''||i.page_group||'':&V_SESSION."><span>''||i.page_group||''</span></a></li>'');'||unistr('\000a')||
''||unistr('\000a')||
'   end if;'||unistr('\000a')||
'/*   else'||unistr('\000a')||
'   if i.PAGE_GROUP = l_current_group then'||unistr('\000a')||
'      htp.p(''<li><a class="current" href="f?p=&APP_ALIAS.:''||i.page_group||'':&V_SESSION.:CONTRACT_ALL"><span>''||i.page_group||''</span></a></li>'');'||unistr('\000a')||
'   else'||unistr('\000a')||
'      htp.p(''<li><a href="f?p=&APP_ALIAS.:''||i.page_group||'':&V_SESSION.:CONTRACT_ALL"><span>''||i.page_group||''</span></a></li>'');'||unistr('\000a')||
''||unistr('\000a')||
'   end if; */'||unistr('\000a')||
'   end if;'||unistr('\000a')||
''||unistr('\000a')||
'end loop;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'htp.p(''</ul>'');'||unistr('\000a')||
''||unistr('\000a')||
'end;');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>175207576779205148 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_branch_action=> 'f?p=&FLOW_ID.:SEARCH:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>175207284121205105+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159162624148807600 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_EMAIL_FROM',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 159162108517774712+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701664700894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159162801422810557 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_SUBJECT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 159162108517774712+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Subject',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701664700894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159163017352815074 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_BODY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 159162108517774712+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Body',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 55,
  p_cMaxlength=> 2000,
  p_cHeight=> 15,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701664700894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159163324625817160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_TBL_STOP_2',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 159162108517774712+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_STOP_AND_START_HTML_TABLE',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159163515059823944 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_SUBMITEMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 159162108517774712+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<input type="button" class="f-submit" value="Submit" onclick="javascript:AjaxSubmitEmail(''P0_EMAIL_FROM'',''P0_SUBJECT'',''P0_BODY'');" />',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701470883894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159163731336828630 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_CANCEL',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 60,
  p_item_plug_id => 159162108517774712+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'<input type="button" class="f-submit" value="Cancel" onclick="javascript:$(''#contactDialog'').dialog(''close'');" />',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701470883894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>162048792647286688 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_SEARCH_OPT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 175195201736831765+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Search Options',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_SELECT_LIST',
  p_lov=> 'STATIC2:All;ALL,Title;TITLE,Text;TEXT,Author;AUTHOR',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT-CENTER',
  p_field_template=> 757701362330894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'NONE',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>175195495621831863 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_TREE_ROOT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 163645190624808798+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> '1',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Tree Root',
  p_source=>'1',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Please enter a keyword. It will be searched in both article subject and article text.';

wwv_flow_api.create_page_item(
  p_id=>175195696818831872 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_SEARCH',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 175195201736831765+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Search',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 15,
  p_cMaxlength=> 200,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701362330894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'Y',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>175196099292831881 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 0,
  p_name=>'P0_GO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 175195201736831765+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'NO',
  p_item_default=> 'GO',
  p_prompt=>'Go',
  p_source=>'GO',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> 2000,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(180718636594197846 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 2,
  p_rowspan=> 2,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'N',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 0
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00001
prompt  ...PAGE 1: Home
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 1
 ,p_name => 'Home'
 ,p_alias => 'HOME'
 ,p_step_title => '&APPLICATION_NAME.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Application Express Tips&Tricks'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 736518449096877594 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111123174935'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_pagination(:P_PAGE_COUNT, :P_CURRENT_PAGE);';

wwv_flow_api.create_page_plug (
  p_id=> 159247715511138466 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Pagination',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_article(p_number => 5, p_page => :P_CURRENT_PAGE);';

wwv_flow_api.create_page_plug (
  p_id=> 743848952389398036 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 1,
  p_plug_name=> 'Print Article',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>177181286986923219 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_action=> 'f?p=&APP_ALIAS.:SEARCH:&APP_SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'GO,P0_SEARCH',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-TOUKO -2011 11:55 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>159164702817886625 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 1,
  p_branch_action=> 'f?p=&APP_ID.:HOME:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 04-NOV-2010 22:54 by ADMIN');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'RESET_PAGE';

wwv_flow_api.create_page_process(
  p_id     => 161214486623285162 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_FOOTER',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'Clear RESET_PAGE',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'if :request is not null and :request like ''PAGE%'' then'||unistr('\000a')||
':P_CURRENT_PAGE := replace(:REQUEST,''PAGE'','''');'||unistr('\000a')||
'else'||unistr('\000a')||
':P_CURRENT_PAGE := 1;'||unistr('\000a')||
'end if;'||unistr('\000a')||
':RESET_PAGE := 1;';

wwv_flow_api.create_page_process(
  p_id     => 161213605858054238 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'set page',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'if not apex_collection.collection_exists(''PAGINATION'') then'||unistr('\000a')||
'  APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY_B('||unistr('\000a')||
'    p_collection_name => ''PAGINATION'','||unistr('\000a')||
'    p_query           => ''select id, ceil(rownum/3)  from'||unistr('\000a')||
'(select *'||unistr('\000a')||
'    from BLOG_MESSAGES '||unistr('\000a')||
'    where msg_type = ''''STANDARD'''' and (trunc(expire_date) > trunc(sysdate) or expire_date is null)'||unistr('\000a')||
'    ORDER BY CREATED_ON DESC)'' );'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'select NVL(';

p:=p||'max(to_number(c002)),0)'||unistr('\000a')||
'into :P_PAGE_COUNT'||unistr('\000a')||
'from apex_collections'||unistr('\000a')||
'where collection_name = ''PAGINATION'';'||unistr('\000a')||
':P_CURRENT_PAGE := 1;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 158923779279638596 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 1,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'create collection',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when=>'P_PAGE_COUNT',
  p_process_when_type=>'ITEM_IS_NULL',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'begin'||unistr('\000a')||
'if not apex_collection.collection_exists(''PAGINATION'') then'||unistr('\000a')||
'  APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY_B('||unistr('\000a')||
'    p_collection_name => ''PAGINATION'','||unistr('\000a')||
'    p_query           => ''select id, ceil(rownum/3)  from'||unistr('\000a')||
'(select *'||unistr('\000a')||
'    from BLOG_MESSAGES '||unistr('\000a')||
'    where msg_type = ''''STANDARD'''' and (trunc(expire_date) > trunc(sysdate) or expire_date is null)'||unistr('\000a')||
'    ORDER BY CREATED_ON DESC)'' );'||unistr('\000a')||
'end if;'||unistr('\000a')||
''||unistr('\000a')||
'select max(c002)'||unistr('\000a')||
'into :P_PAGE_COUNT'||unistr('\000a')||
'from apex_collections'||unistr('\000a')||
'where collection_name = ''PAGINATION'';'||unistr('\000a')||
':P_CURRENT_PAGE := 1;'||unistr('\000a')||
'end;');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 1
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00002
prompt  ...PAGE 2: Search
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 2
 ,p_name => 'Search'
 ,p_alias => 'SEARCH'
 ,p_step_title => 'Search Archives'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 736518449096877594 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<style type="text/css">'||unistr('\000a')||
'.fielddata {'||unistr('\000a')||
'color:#E7E7E7;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111123174959'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_article(p_number => 40, p_search => trim(:P0_SEARCH), p_search_opt => :P0_SEARCH_OPT);'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 156605998822756254 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Archives',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 736535462781269361 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 2,
  p_plug_name=> 'Search Archives',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 758174573175603752+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>162334786807299365 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&APP_ALIAS.:SEARCH:&APP_SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'GO,P0_SEARCH',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-TOUKO -2011 12:09 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>162350091309300658 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 2,
  p_branch_action=> 'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 30,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 12-JAN-2011 14:39 by ADMIN');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'BLOG_API.write_search_log(:P0_SEARCH_OPT || '':'' || :P0_SEARCH, :P9_EMAIL );';

wwv_flow_api.create_page_process(
  p_id     => 117853632463645192 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 2,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Write search log',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_only_for_changed_rows=> 'Y',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 2
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00003
prompt  ...PAGE 3: Read Article
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 3
 ,p_name => 'Read Article'
 ,p_alias => 'READ'
 ,p_step_title => 'Read Article - &P3_ARTICLE_SUBJ.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Read Article'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 736518449096877594 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111123175008'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'IF :article IS NOT NULL THEN'||unistr('\000a')||
'  blog_gui.print_article('||unistr('\000a')||
'    p_number =>1,'||unistr('\000a')||
'    p_search => NULL,'||unistr('\000a')||
'    p_date_month => NULL,'||unistr('\000a')||
'    p_cat_id => NULL,'||unistr('\000a')||
'    p_article_id =>:article'||unistr('\000a')||
'  );'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'IF :p3_preview IS NOT NULL THEN'||unistr('\000a')||
'  blog_gui.print_article_preview('||unistr('\000a')||
'    p_number =>1,'||unistr('\000a')||
'    p_search => NULL,'||unistr('\000a')||
'    p_date_month => NULL,'||unistr('\000a')||
'    p_cat_id => NULL,'||unistr('\000a')||
'    p_article_id =>:p3_preview'||unistr('\000a')||
'  );'||unistr('\000a')||
'END IF;'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 159142923536131733 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 3,
  p_plug_name=> 'Print Article',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>177191794400010521 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_action=> 'f?p=&APP_ALIAS.:SEARCH:&APP_SESSION.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'GO,P0_SEARCH',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-TOUKO -2011 12:09 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>160617082322608087 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_branch_action=> 'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 12-JAN-2011 14:39 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>158098799421866286 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_PREVIEW',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 40,
  p_item_plug_id => 163645190624808798+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>160474685635634123 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_ARTICLE_SUBJ',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 163645190624808798+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Subj',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>163603574348804118 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 3,
  p_name=>'P3_RATE',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 50,
  p_item_plug_id => 163645190624808798+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 4000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'P3_PREVIEW';

wwv_flow_api.create_page_process(
  p_id     => 165962696802972160 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_FOOTER',
  p_process_type=> 'CLEAR_CACHE_FOR_ITEMS',
  p_process_name=> 'P3_PREVIEW',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'BEGIN'||unistr('\000a')||
'  FOR I IN'||unistr('\000a')||
'  (SELECT MSG_SUBJECT'||unistr('\000a')||
'  FROM BLOG_MESSAGES'||unistr('\000a')||
'  WHERE msg_type = ''STANDARD'''||unistr('\000a')||
'  AND id         = :article'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    :P3_ARTICLE_SUBJ := i.msg_subject;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  :P3_RATE := NULL;'||unistr('\000a')||
'  FOR I    IN'||unistr('\000a')||
'  (SELECT rate FROM BLOG_ARTICLE_RATE WHERE article_id = :ARTICLE'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    :P3_RATE := i.rate;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  FOR I IN'||unistr('\000a')||
'  (SELECT MSG_SUBJECT'||unistr('\000a')||
'  FROM BLOG_MESSAGES_PREVIEW'||unistr('\000a')||
'  WHERE msg';

p:=p||'_type = ''STANDARD'''||unistr('\000a')||
'  AND id         = :P3_PREVIEW'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    :P3_ARTICLE_SUBJ := i.msg_subject;'||unistr('\000a')||
'    :P3_RATE         := NULL;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  NULL;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 160475104466649116 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 3,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'find art subj&rate',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 3
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00004
prompt  ...PAGE 4: Read Category
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 4
 ,p_name => 'Read Category'
 ,p_alias => 'READCAT'
 ,p_step_title => 'Read Articles for Category: &P4_CAT_NAME.'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Read Articles for &CATEGORY.'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 736518449096877594 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111111221219'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'blog_gui.print_article(p_number =>100, p_search => null, p_date_month => null, '||unistr('\000a')||
'          p_cat_id => :category,p_article_id =>null);';

wwv_flow_api.create_page_plug (
  p_id=> 159145707019381401 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 4,
  p_plug_name=> 'Print Article cat',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 20,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows => 15,
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>177192004096013298 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_action=> 'f?p=&APP_ALIAS.:SEARCH:0',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'GO,P0_SEARCH',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-TOUKO -2011 12:10 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>160619078887834239 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_branch_action=> 'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 12-JAN-2011 15:16 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159252911394835777 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 4,
  p_name=>'P4_CAT_NAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 163645190624808798+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Cat Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'YES',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'select category_name'||unistr('\000a')||
'into :p4_cat_name'||unistr('\000a')||
'from blog_categories'||unistr('\000a')||
'where id = :CATEGORY;'||unistr('\000a')||
'exception when others then'||unistr('\000a')||
':p4_cat_name := null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 159253030787841370 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 4,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'cat name',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 4
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00005
prompt  ...PAGE 5: Resources
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 5
 ,p_name => 'Resources'
 ,p_alias => 'RESOURCES'
 ,p_step_title => 'Resources'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 159176008123214878 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111111221213'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'select replace(msg_text,''#WORKSPACE#'',apex_application.get_current_flow_sgid(:APP_ID)) link'||unistr('\000a')||
'from blog_messages'||unistr('\000a')||
'where msg_type in ( ''RESOURCE'')'||unistr('\000a')||
'and nvl(expire_date,sysdate) >= sysdate'||unistr('\000a')||
'order by created_on';

wwv_flow_api.create_report_region (
  p_id=> 159185429753457710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 5,
  p_name=> ' Resources',
  p_region_name=>'',
  p_template=> 758174573175603752+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'N',
  p_query_row_template=> 166359480355790001+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '150',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'no data found',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_query_row_count_max=> '500',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_light.gif',
  p_query_asc_image_attr=> ' width="13" height="12" ',
  p_query_desc_image=> 'arrow_up_gray_light.gif',
  p_query_desc_image_attr=> ' width="13" height="12" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 159185601718457712 + wwv_flow_api.g_id_offset,
  p_region_id=> 159185429753457710 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'LINK',
  p_column_display_sequence=> 1,
  p_column_heading=> ' Links to Resources',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>177187305865966486 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_branch_action=> 'f?p=&APP_ALIAS.:SEARCH:0',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'GO,P0_SEARCH',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-TOUKO -2011 12:02 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>160618902305831518 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 5,
  p_branch_action=> 'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 12-JAN-2011 15:16 by ADMIN');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 5
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00006
prompt  ...PAGE 6: Files
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 6
 ,p_name => 'Files'
 ,p_alias => 'FILES'
 ,p_step_title => 'Files'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 159176110201215491 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111116183500'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'SELECT NULL dummy,'||unistr('\000a')||
'  ''<table><tr><td style="white-space:normal;word-wrap:break-word;">'''||unistr('\000a')||
'  ||description'||unistr('\000a')||
'  ||''</td></tr></table>'' description,'||unistr('\000a')||
'  created_on,'||unistr('\000a')||
'  CASE'||unistr('\000a')||
'    WHEN external_link IS NOT NULL'||unistr('\000a')||
'    THEN ''<a target="_blank" href="'''||unistr('\000a')||
'      ||external_link'||unistr('\000a')||
'      ||''">'''||unistr('\000a')||
'      ||filename'||unistr('\000a')||
'      ||''</a>'''||unistr('\000a')||
'    ELSE ''<a href="z?p_url='''||unistr('\000a')||
'      ||APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSIO';

s:=s||'N.:DOWNLOAD:NO::FILE_ID:'''||unistr('\000a')||
'      ||id,NULL,''PUBLIC_BOOKMARK'')'||unistr('\000a')||
'      || ''&p_cat='''||unistr('\000a')||
'      ||category'||unistr('\000a')||
'      ||''&p_company='''||unistr('\000a')||
'      ||apex_application.get_current_flow_sgid(:APP_ID)'||unistr('\000a')||
'      ||''">'''||unistr('\000a')||
'      ||filename'||unistr('\000a')||
'      ||''</a>'''||unistr('\000a')||
'  END LINK,'||unistr('\000a')||
'  CASE'||unistr('\000a')||
'    WHEN doc_size < 102.4'||unistr('\000a')||
'    THEN ROUND(doc_size,1)'||unistr('\000a')||
'      ||'' b'''||unistr('\000a')||
'    WHEN doc_size < 1048576'||unistr('\000a')||
'    THEN ROUND((doc_size/1024),1)'||unistr('\000a')||
'      ||'' kb'''||unistr('\000a')||
'    ELSE ROUND((doc';

s:=s||'_size/1024/1024),1)'||unistr('\000a')||
'      ||'' mb'''||unistr('\000a')||
'  END the_size,'||unistr('\000a')||
'  id upload_id'||unistr('\000a')||
'FROM BLOG_FILES'||unistr('\000a')||
'WHERE publish = ''Y''';

wwv_flow_api.create_report_region (
  p_id=> 159181328835391143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 6,
  p_name=> 'Files',
  p_region_name=>'',
  p_template=> 758174573175603752+ wwv_flow_api.g_id_offset,
  p_display_sequence=> 10,
  p_display_column=> 1,
  p_display_point=> 'AFTER_SHOW_ITEMS',
  p_source=> s,
  p_source_type=> 'SQL_QUERY',
  p_plug_caching=> 'NOT_CACHED',
  p_header=> '<style>'||unistr('\000a')||
'#left_side img {'||unistr('\000a')||
'float:right;'||unistr('\000a')||
'padding:0;'||unistr('\000a')||
'}'||unistr('\000a')||
'</style>',
  p_customized=> '0',
  p_translate_title=> 'Y',
  p_ajax_enabled=> 'Y',
  p_query_row_template=> 166359480355790001+ wwv_flow_api.g_id_offset,
  p_query_headings_type=> 'COLON_DELMITED_LIST',
  p_query_num_rows=> '15',
  p_query_options=> 'DERIVED_REPORT_COLUMNS',
  p_query_show_nulls_as=> ' - ',
  p_query_break_cols=> '0',
  p_query_no_data_found=> 'No files found',
  p_query_num_rows_type=> 'NEXT_PREVIOUS_LINKS',
  p_query_row_count_max=> '200',
  p_pagination_display_position=> 'BOTTOM_RIGHT',
  p_break_type_flag=> 'DEFAULT_BREAK_FORMATTING',
  p_csv_output=> 'N',
  p_sort_null=> 'F',
  p_query_asc_image=> 'arrow_down_gray_light.gif',
  p_query_asc_image_attr=> 'align="absmiddle" width="10" height="9" ',
  p_query_desc_image=> 'arrow_up_gray_light.gif',
  p_query_desc_image_attr=> 'align="absmiddle" width="10" height="9" ',
  p_plug_query_strip_html=> 'Y',
  p_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 159181514060391147 + wwv_flow_api.g_id_offset,
  p_region_id=> 159181328835391143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 1,
  p_form_element_id=> null,
  p_column_alias=> 'DUMMY',
  p_column_display_sequence=> 3,
  p_column_heading=> '<br />',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 159181632438391149 + wwv_flow_api.g_id_offset,
  p_region_id=> 159181328835391143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 2,
  p_form_element_id=> null,
  p_column_alias=> 'DESCRIPTION',
  p_column_display_sequence=> 5,
  p_column_heading=> 'Description',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 159181710047391149 + wwv_flow_api.g_id_offset,
  p_region_id=> 159181328835391143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 3,
  p_form_element_id=> null,
  p_column_alias=> 'CREATED_ON',
  p_column_display_sequence=> 6,
  p_column_heading=> 'Created On',
  p_use_as_row_header=> 'N',
  p_column_format=> '&BLOG_DATE_FORMAT.',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>1,
  p_default_sort_dir=>'desc',
  p_disable_sort_column=>'N',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_lov_display_extra=> 'YES',
  p_include_in_export=> 'Y',
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 159181804217391149 + wwv_flow_api.g_id_offset,
  p_region_id=> 159181328835391143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 4,
  p_form_element_id=> null,
  p_column_alias=> 'LINK',
  p_column_display_sequence=> 1,
  p_column_heading=> 'Link',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 159181912209391149 + wwv_flow_api.g_id_offset,
  p_region_id=> 159181328835391143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 5,
  p_form_element_id=> null,
  p_column_alias=> 'THE_SIZE',
  p_column_display_sequence=> 2,
  p_column_heading=> 'Size',
  p_column_css_style=>'white-space:nowrap;',
  p_column_alignment=>'RIGHT',
  p_heading_alignment=>'LEFT',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'N',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_lov_show_nulls=> 'NO',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
declare
  s varchar2(32767) := null;
begin
s := null;
wwv_flow_api.create_report_columns (
  p_id=> 159182016431391149 + wwv_flow_api.g_id_offset,
  p_region_id=> 159181328835391143 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_query_column_id=> 6,
  p_form_element_id=> null,
  p_column_alias=> 'UPLOAD_ID',
  p_column_display_sequence=> 4,
  p_column_heading=> 'Upload Id',
  p_column_alignment=>'LEFT',
  p_heading_alignment=>'CENTER',
  p_default_sort_column_sequence=>0,
  p_disable_sort_column=>'Y',
  p_sum_column=> 'N',
  p_hidden_column=> 'Y',
  p_display_as=>'WITHOUT_MODIFICATION',
  p_is_required=> false,
  p_pk_col_source=> s,
  p_column_comment=>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>177187488334970921 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_branch_action=> 'f?p=&APP_ALIAS.:SEARCH:0',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 1,
  p_branch_condition_type=> 'REQUEST_IN_CONDITION',
  p_branch_condition=> 'GO,P0_SEARCH',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 05-TOUKO -2011 12:03 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>160618695379829457 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 6,
  p_branch_action=> 'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 12-JAN-2011 15:16 by ADMIN');
 
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 6
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00007
prompt  ...PAGE 7: Error page
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 7
 ,p_name => 'Error page'
 ,p_alias => 'ERROR'
 ,p_step_title => 'Error page'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'NO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 736518449096877594 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111111221159'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<p>The following error occured:</p>'||unistr('\000a')||
'<h3>&ERRMSG.</h3>'||unistr('\000a')||
'';

wwv_flow_api.create_page_plug (
  p_id=> 156620578594783753 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 7,
  p_plug_name=> 'Error occured',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 758174573175603752+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_display_when_condition => 'ERROR',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>156712994233389621 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 7,
  p_name=>'ERROR',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 156620578594783753+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Error',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||':ERROR := null;';

wwv_flow_api.create_page_process(
  p_id     => 160617687133656789 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 7,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_FOOTER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'clrear ERROR',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 7
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00008
prompt  ...PAGE 8: Edit Comment
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 8
 ,p_name => 'Edit Comment'
 ,p_alias => 'EDIT'
 ,p_step_title => 'Edit Comment'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Edit Comment'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 736518449096877594 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<style type="text/css">'||unistr('\000a')||
'textarea{white-space:pre;font-family: monospace; font-size: 12px;}'||unistr('\000a')||
'.fielddata{color:#E7E7E7;}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<script type="text/javascript" src="#IMAGE_PREFIX#blog/js/htmltooltip.min.js"></script>'
 ,p_javascript_code => 
'var pc = navigator.userAgent.toLowerCase();'||unistr('\000a')||
'var ie4_win = (pc.indexOf("win")!=-1) && (pc.indexOf("msie") != -1)'||unistr('\000a')||
'&& (parseInt(navigator.appVersion) >= 4);'||unistr('\000a')||
'// only builds based upon gecko later than Jan 8th support the selectionStart, selectionEnd properly'||unistr('\000a')||
'var is_gecko = pc.indexOf("gecko/") != -1 &&'||unistr('\000a')||
'parseFloat(pc.substring(pc.indexOf("gecko/") + 6, pc.indexOf("gecko/") + 14)) > 20030108;'||unistr('\000a')||
''||unistr('\000a')||
'function '||
'styleTag(tag, ta) {'||unistr('\000a')||
' var tagOpen = ''<'' + tag.toLowerCase() + ''>'';'||unistr('\000a')||
' var tagClose = ''</'' + tag.toLowerCase() + ''>'';'||unistr('\000a')||
' if (ie4_win) {'||unistr('\000a')||
'  var selected;'||unistr('\000a')||
''||unistr('\000a')||
'  if (document.selection.createRange().parentElement().tagName == ''TEXTAREA'') {'||unistr('\000a')||
'   selected = document.selection.createRange().text;'||unistr('\000a')||
'  }'||unistr('\000a')||
''||unistr('\000a')||
'  if (selected) {'||unistr('\000a')||
'   var addSpace = false;'||unistr('\000a')||
'   if (selected.charAt(selected.length-1) == '' '') {'||unistr('\000a')||
'    selected = selec'||
'ted.substring(0, selected.length-1);'||unistr('\000a')||
'    addSpace = true;'||unistr('\000a')||
'   }'||unistr('\000a')||
'   document.selection.createRange().text = tagOpen + selected + tagClose + ((addSpace)?" ":"");'||unistr('\000a')||
'  } else {'||unistr('\000a')||
'   ta.value += tagOpen + tagClose;'||unistr('\000a')||
'  }'||unistr('\000a')||
' } else if (is_gecko) {'||unistr('\000a')||
'  var selLength = ta.textLength;'||unistr('\000a')||
'  var selStart = ta.selectionStart;'||unistr('\000a')||
'  var selEnd = ta.selectionEnd;'||unistr('\000a')||
'  if (selEnd == 1 || selEnd == 2) {'||unistr('\000a')||
'   selEnd = selLength;'||unistr('\000a')||
'  }'||unistr('\000a')||
'  v'||
'ar s1 = (ta.value).substring(0, selStart);'||unistr('\000a')||
'  var s2 = (ta.value).substring(selStart, selEnd)'||unistr('\000a')||
'  var s3 = (ta.value).substring(selEnd, selLength);'||unistr('\000a')||
''||unistr('\000a')||
'  var scrollTop = ta.scrollTop;'||unistr('\000a')||
''||unistr('\000a')||
'  ta.value = s1 + tagOpen + s2 + tagClose + s3;'||unistr('\000a')||
'  var cursorPos = selStart+tagOpen.length+s2.length+tagClose.length;'||unistr('\000a')||
'  ta.selectionStart = cursorPos;'||unistr('\000a')||
'  ta.selectionEnd = cursorPos;'||unistr('\000a')||
'  ta.scrollTop = scrollTop;'||unistr('\000a')||
''||unistr('\000a')||
' } else {'||unistr('\000a')||
' '||
' ta.value += tagOpen + tagClose;'||unistr('\000a')||
' }'||unistr('\000a')||
' ta.focus();'||unistr('\000a')||
' return;'||unistr('\000a')||
'}'||unistr('\000a')||
'function SubmitComment(){'||unistr('\000a')||
' setCookie(''dbswh_blog'',''1'' + ''|'' + trim($v(''P8_EMAIL'')) + ''|'' + trim($v(''P8_FNAME'')) + ''|'' + trim($v(''P8_LNAME'')) + ''|'' + ''|'' + trim($v(''P8_NICKNAME'')) + ''|'' + ''|'' + ''|'' + ''|'' + &APP_SESSION.,365);'||unistr('\000a')||
' htmldbConfirmDialog(''NEXT'',{message:"Your comment will be updated after you press OK button."});'||unistr('\000a')||
'}'||unistr('\000a')||
'function trim(s'||
'tr, chars) {'||unistr('\000a')||
' return ltrim(rtrim(str, chars), chars);'||unistr('\000a')||
'}'||unistr('\000a')||
'function ltrim(str, chars) {'||unistr('\000a')||
' chars = chars || "\\s";'||unistr('\000a')||
' return str.replace(new RegExp("^[" + chars + "]+", "g"), "");'||unistr('\000a')||
'}'||unistr('\000a')||
'function rtrim(str, chars) {'||unistr('\000a')||
' chars = chars || "\\s";'||unistr('\000a')||
' return str.replace(new RegExp("[" + chars + "]+$", "g"), "");'||unistr('\000a')||
'}'||unistr('\000a')||
'function setCookie(c_name,value,expiredays){'||unistr('\000a')||
' var exdate=new Date();'||unistr('\000a')||
' exdate.setDate(exdate.getDate()+expi'||
'redays);'||unistr('\000a')||
' document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toUTCString());'||unistr('\000a')||
'}'
 ,p_javascript_code_onload => 
'if($(''#MESSAGE'').text()){'||unistr('\000a')||
' $(''.pb'').remove();'||unistr('\000a')||
' htmldbMsgDialog({message: $(''#MESSAGE'').html()});'||unistr('\000a')||
' $(''#MESSAGE'').remove();'||unistr('\000a')||
'}'||unistr('\000a')||
''
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111123021930'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'for i in ('||unistr('\000a')||
'select ''<div class="htmltooltip">''||ITEM_HELP_TEXT||''</div>'' text'||unistr('\000a')||
'from APEX_APPLICATION_PAGE_ITEMS'||unistr('\000a')||
'where  application_id = :app_id'||unistr('\000a')||
'and page_id = :app_page_id '||unistr('\000a')||
'and condition_type is null'||unistr('\000a')||
'and item_help_text is not null'||unistr('\000a')||
'order by DISPLAY_SEQUENCE'||unistr('\000a')||
') loop'||unistr('\000a')||
'htp.p(i.TEXT);'||unistr('\000a')||
'end loop;';

wwv_flow_api.create_page_plug (
  p_id=> 158418782422910524 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_plug_name=> 'print help',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 51,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 158419707559910534 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 8,
  p_plug_name=> 'Edit Your Comment',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 758174573175603752+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 21,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 158420277742910538 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 8,
  p_button_sequence=> 10,
  p_button_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(180718636594197846+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ALIAS.:HOME:0',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'style="margin-right:10px"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 158420493959910541 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 8,
  p_button_sequence=> 20,
  p_button_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(180718636594197846+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Submit',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:SubmitComment();',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'style="margin-right:10px"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>158430983996910590 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_branch_action=> 'f?p=&APP_ALIAS.:READ:0::::ARTICLE:&ARTICLE.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>158420493959910541+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>158431177743910591 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_branch_action=> 'f?p=&APP_ALIAS.:EDIT:0',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 07-NOV-2010 10:44 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter your email address.';

wwv_flow_api.create_page_item(
  p_id=>158420704080910542 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 178057391399363568+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Please enter your first name.';

wwv_flow_api.create_page_item(
  p_id=>158421688350910548 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_FNAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'First Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'Please enter your first name.',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Please enter your last name.';

wwv_flow_api.create_page_item(
  p_id=>158422679498910551 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_LNAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Last Name',
  p_post_element_text=>'</td></tr><tr><td>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter your comment. Use the formatting buttons to add allowed HTML tags.';

wwv_flow_api.create_page_item(
  p_id=>158425800915910561 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_COMMENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comment',
  p_post_element_text=>'"TEXT_EDIT"',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 20,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 178057391399363568+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Check this box if you want an email sent when a new comment is posted to this article.';

wwv_flow_api.create_page_item(
  p_id=>158426689624910563 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_FOLLOWUP_NOTIFY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 102,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Notification',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'STATIC:Notify me of followup comments via e-mail;YES',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_cattributes_element=>'style="border:1px solid #FFF;padding:5px"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_help_text=> h,
  p_attribute_01 => '1',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>158427181411910564 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_BUTTONS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 118,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'"FORMATTING_BUTTONS"',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701362330894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter Nickname, it will be displayed in Posted by.';

wwv_flow_api.create_page_item(
  p_id=>158427398867910565 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_NICKNAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nickname',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 178057391399363568+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => 'Enter Nickname, it will be displayed in Posted by.');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>158427882528910568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 163645190624808798+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>158431683269935905 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'COMMENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comment',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_attribute_01 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>161026985426765593 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_name=>'P8_INFO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 8,
  p_item_plug_id => 158419707559910534+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'<p>Your email address will not be published. Required fields are marked with asterisk.</p>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701362330894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 158428193570910571 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 10,
  p_computation_item=> 'P8_EMAIL',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P8_EMAIL),1,255);'||unistr('\000a')||
'',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 123820523386693956 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 20,
  p_computation_item=> 'P8_NICKNAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P8_NICKNAME),1,30);',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 123839732736696704 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 30,
  p_computation_item=> 'P8_FNAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P8_LNAME),1,30);',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 123858938970698484 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 8,
  p_computation_sequence => 40,
  p_computation_item=> 'P8_LNAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P8_FNAME),1,30);',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 158428600622910578 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'E-Mail Address validate',
  p_validation_sequence=> 10,
  p_validation => 'RETURN check_email(:P8_EMAIL) ;',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Please specify a valid e-mail address.',
  p_always_execute=>'N',
  p_validation_condition=> 'P8_EMAIL',
  p_validation_condition_type=> 'ITEM_IS_NOT_NULL',
  p_when_button_pressed=> 158420493959910541 + wwv_flow_api.g_id_offset,
  p_associated_item=> 158420704080910542 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 158429584883910580 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validate Tags in comment',
  p_validation_sequence=> 20,
  p_validation => 'return BLOG_API.validate_message(:P8_COMMENT);',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'There are mismatched HTML tags in your comment.  Please close all tags and resubmit.',
  p_always_execute=>'Y',
  p_when_button_pressed=> 158420493959910541 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 158428375180910577 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P8_COMMENT too long',
  p_validation_sequence=> 30,
  p_validation => 'LENGTH(:P8_COMMENT) <= 4000;',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Comment is too long, please make it shorter.',
  p_always_execute=>'N',
  p_when_button_pressed=> 158420493959910541 + wwv_flow_api.g_id_offset,
  p_associated_item=> 158425800915910561 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 158429989838910581 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P8_EMAIL bad email',
  p_validation_sequence=> 40,
  p_validation => 'select 1'||unistr('\000a')||
'from BLOG_BAD_EMAILS'||unistr('\000a')||
'where upper(email) = upper(:P8_EMAIL)',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'You email is in the list of bad email, comment is not possible.',
  p_always_execute=>'N',
  p_when_button_pressed=> 158420493959910541 + wwv_flow_api.g_id_offset,
  p_associated_item=> 158420704080910542 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'BEGIN'||unistr('\000a')||
'  :P8_COMMENT := trim(:P8_COMMENT);'||unistr('\000a')||
'  UPDATE BLOG_REG_USERS'||unistr('\000a')||
'  SET EMAIL     = SUBSTR(trim(:P8_EMAIL),1,255), -- EMAIL'||unistr('\000a')||
'    FNAME       = SUBSTR(trim(:P8_FNAME),1,30),  -- FNAME,'||unistr('\000a')||
'    LNAME       = SUBSTR(trim(:P8_LNAME),1,30),  -- LNAME,'||unistr('\000a')||
'    MODIFIED_ON = sysdate,'||unistr('\000a')||
'    MODIFIED_BY = :P8_ID,'||unistr('\000a')||
'    NICK        = SUBSTR(trim(:P8_NICKNAME),1,30)'||unistr('\000a')||
'  WHERE id      = :P8_ID;'||unistr('\000a')||
'  UPDATE BLOG_MESSAGES'||unistr('\000a')||
'  SET ';

p:=p||'MSG_TEXT      = BLOG_API.format_comment(:P8_COMMENT,LENGTH(:P8_COMMENT)),'||unistr('\000a')||
'    followup_notify = DECODE(:P8_FOLLOWUP_NOTIFY,''YES'',''Y'',''N''),'||unistr('\000a')||
'    MODIFIED_ON     = sysdate,'||unistr('\000a')||
'    MODIFIED_BY_ID  = :P8_ID'||unistr('\000a')||
'  WHERE id          = :COMMENT;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 158430106660910582 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'WRITECOMMENT',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>158420493959910541 + wwv_flow_api.g_id_offset,
  p_process_success_message=> 'Thank you for updating your comment.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'INSERT'||unistr('\000a')||
'INTO BLOG_REG_USERS'||unistr('\000a')||
'  ('||unistr('\000a')||
'    HTTP_USER_AGENT,'||unistr('\000a')||
'    HTTP_REFERER,'||unistr('\000a')||
'    HOST_NAME,'||unistr('\000a')||
'    FOLLOWUP_NOTIFY,'||unistr('\000a')||
'    REMOTE_ADDR,'||unistr('\000a')||
'    ID,'||unistr('\000a')||
'    EMAIL,'||unistr('\000a')||
'    FNAME,'||unistr('\000a')||
'    LNAME,'||unistr('\000a')||
'    LOCATION,'||unistr('\000a')||
'    TITLE,'||unistr('\000a')||
'    ORG,'||unistr('\000a')||
'    YEARS_EXP,'||unistr('\000a')||
'    CREATED_ON,'||unistr('\000a')||
'    CREATED_BY,'||unistr('\000a')||
'    MODIFIED_ON,'||unistr('\000a')||
'    MODIFIED_BY,'||unistr('\000a')||
'    PASSWORD,'||unistr('\000a')||
'    NICK'||unistr('\000a')||
'  )'||unistr('\000a')||
'  VALUES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    null, -- HTTP_USER_AGENT,'||unistr('\000a')||
'    null, -- HTTP_REFERER,'||unistr('\000a')||
'    null, -- HOST_NAME,'||unistr('\000a')||
'    FOLLOWUP_NOTIFY,'||unistr('\000a')||
'    REMOTE_ADDR,'||unistr('\000a')||
'    ID,'||unistr('\000a')||
'    EMAIL,'||unistr('\000a')||
'    FNAME,'||unistr('\000a')||
'    LNAME,'||unistr('\000a')||
'    LOCATION,'||unistr('\000a')||
'    title,'||unistr('\000a')||
'    null, -- org,'||unistr('\000a')||
'    null, -- years_exp,'||unistr('\000a')||
'    null, -- CREATED_ON,'||unistr('\000a')||
'    null, -- CREATED_BY,'||unistr('\000a')||
'    null, -- MODIFIED_ON,'||unistr('\000a')||
'    null, -- modified_by,'||unistr('\000a')||
'    null, --upassword,'||unistr('\000a')||
'    :P9_NICKNAME'||unistr('\000a')||
'  );'||unistr('\000a')||
''||unistr('\000a')||
'INSERT'||unistr('\000a')||
'INTO BLOG_MESSAGES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    ID,'||unistr('\000a')||
'    MSG_ID,'||unistr('\000a')||
'    MSG_TYPE,'||unistr('\000a')||
'    MSG_SUBJECT,'||unistr('\000a')||
'    MSG_TEXT,'||unistr('\000a')||
'    CATEGORY_ID,'||unistr('\000a')||
'    EXPIRE_DATE,'||unistr('\000a')||
'    VIEWED,'||unistr('\000a')||
'    RESERVED2,'||unistr('\000a')||
'    RESERVED3,'||unistr('\000a')||
'    RESERVED4,'||unistr('\000a')||
'    CREATED_ON,'||unistr('\000a')||
'    MODIFIED_ON,'||unistr('\000a')||
'    CREATED_BY_ID,'||unistr('\000a')||
'    MODIFIED_BY_ID'||unistr('\000a')||
'  )'||unistr('\000a')||
'  VALUES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    :v0,'||unistr('\000a')||
'    :v1,'||unistr('\000a')||
'    :v2,'||unistr('\000a')||
'    :v3,'||unistr('\000a')||
'    :v4,'||unistr('\000a')||
'    :v5,'||unistr('\000a')||
'    :v6,'||unistr('\000a')||
'    :v7,'||unistr('\000a')||
'    :v8,'||unistr('\000a')||
'    :v9,'||unistr('\000a')||
'    :v10,'||unistr('\000a')||
'    :v11,'||unistr('\000a')||
'    :v12,'||unistr('\000a')||
'    :v13,'||unistr('\000a')||
'    :v14'||unistr('\000a')||
'  );');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'l number;'||unistr('\000a')||
'begin'||unistr('\000a')||
'select count(1) '||unistr('\000a')||
'into l'||unistr('\000a')||
'from blog_messages'||unistr('\000a')||
'where id = :COMMENT'||unistr('\000a')||
'and exists (select 1 from apex_collections where collection_name = ''COMMENTS'' and c001 = :COMMENT);'||unistr('\000a')||
'if l = 0 then'||unistr('\000a')||
'owa_util.redirect_url(''f?p=&APP_ALIAS.:HOME:0'');'||unistr('\000a')||
'end if;'||unistr('\000a')||
'exception when others then'||unistr('\000a')||
'owa_util.redirect_url(''f?p=&APP_ALIAS.:HOME:0'');'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 158434990185562408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_process_sequence=> 1,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'redirect',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
''||unistr('\000a')||
'    for i in (select * from blog_messages where id = :COMMENT) loop'||unistr('\000a')||
'     :P8_COMMENT := i.msg_text;'||unistr('\000a')||
'      select decode(i.followup_notify,''Y'',''YES'',null) into :P8_FOLLOWUP_NOTIFY from dual;'||unistr('\000a')||
'     :ARTICLE := i.msg_id;'||unistr('\000a')||
'      for j in (select * from blog_reg_users where id = i.created_by_id) loop'||unistr('\000a')||
'        :P8_ID := j.id;'||unistr('\000a')||
'        :P8_EMAIL := j.email;'||unistr('\000a')||
'        :P8_NICKNAME := j.NICK;  '||unistr('\000a')||
'        :P';

p:=p||'8_FNAME := j.fname;'||unistr('\000a')||
'        :P8_LNAME := j.lname;        '||unistr('\000a')||
'      end loop;'||unistr('\000a')||
'    end loop;'||unistr('\000a')||
''||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 158430276716910585 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 8,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'fetch info',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 8
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00009
prompt  ...PAGE 9: Submit Comment
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 9
 ,p_name => 'Submit Comment'
 ,p_alias => 'WRITECOMMENT'
 ,p_step_title => 'Submit Comment'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Submit Comment'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 736518449096877594 + wwv_flow_api.g_id_offset
 ,p_html_page_header => 
'<style type="text/css">'||unistr('\000a')||
'textarea{white-space:pre;font-family: monospace; font-size: 12px;}'||unistr('\000a')||
'.fielddata {color:#E7E7E7;}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'<script type="text/javascript" src="#IMAGE_PREFIX#blog/js/htmltooltip.min.js"></script>'||unistr('\000a')||
''
 ,p_javascript_code => 
'var pc = navigator.userAgent.toLowerCase();'||unistr('\000a')||
'var ie4_win = (pc.indexOf("win")!=-1) && (pc.indexOf("msie") != -1)'||unistr('\000a')||
'&& (parseInt(navigator.appVersion) >= 4);'||unistr('\000a')||
'// only builds based upon gecko later than Jan 8th support the selectionStart, selectionEnd properly'||unistr('\000a')||
'var is_gecko = pc.indexOf("gecko/") != -1 &&'||unistr('\000a')||
'parseFloat(pc.substring(pc.indexOf("gecko/") + 6, pc.indexOf("gecko/") + 14)) > 20030108;'||unistr('\000a')||
''||unistr('\000a')||
'function '||
'styleTag(tag, ta) {'||unistr('\000a')||
' var tagOpen = ''<'' + tag.toLowerCase() + ''>'';'||unistr('\000a')||
' var tagClose = ''</'' + tag.toLowerCase() + ''>'';'||unistr('\000a')||
' if (ie4_win) {'||unistr('\000a')||
' var selected;'||unistr('\000a')||
''||unistr('\000a')||
'  if (document.selection.createRange().parentElement().tagName == ''TEXTAREA'') {'||unistr('\000a')||
'   selected = document.selection.createRange().text;'||unistr('\000a')||
' }'||unistr('\000a')||
''||unistr('\000a')||
'  if (selected) {'||unistr('\000a')||
'   var addSpace = false;'||unistr('\000a')||
'   if (selected.charAt(selected.length-1) == '' '') {'||unistr('\000a')||
'    selected = selecte'||
'd.substring(0, selected.length-1);'||unistr('\000a')||
'    addSpace = true;'||unistr('\000a')||
'   }'||unistr('\000a')||
'   document.selection.createRange().text = tagOpen + selected + tagClose + ((addSpace)?" ":"");'||unistr('\000a')||
'  } else {'||unistr('\000a')||
'   ta.value += tagOpen + tagClose;'||unistr('\000a')||
'  }'||unistr('\000a')||
' } else if (is_gecko) {'||unistr('\000a')||
'  var selLength = ta.textLength;'||unistr('\000a')||
'  var selStart = ta.selectionStart;'||unistr('\000a')||
'  var selEnd = ta.selectionEnd;'||unistr('\000a')||
'  if (selEnd == 1 || selEnd == 2) {'||unistr('\000a')||
'   selEnd = selLength;'||unistr('\000a')||
'  }'||unistr('\000a')||
'  var'||
' s1 = (ta.value).substring(0, selStart);'||unistr('\000a')||
'  var s2 = (ta.value).substring(selStart, selEnd)'||unistr('\000a')||
'  var s3 = (ta.value).substring(selEnd, selLength);'||unistr('\000a')||
''||unistr('\000a')||
'  var scrollTop = ta.scrollTop;'||unistr('\000a')||
''||unistr('\000a')||
'  ta.value = s1 + tagOpen + s2 + tagClose + s3;'||unistr('\000a')||
'  var cursorPos = selStart+tagOpen.length+s2.length+tagClose.length;'||unistr('\000a')||
'  ta.selectionStart = cursorPos;'||unistr('\000a')||
'  ta.selectionEnd = cursorPos;'||unistr('\000a')||
'  ta.scrollTop = scrollTop;'||unistr('\000a')||
''||unistr('\000a')||
' } else {'||unistr('\000a')||
'  t'||
'a.value += tagOpen + tagClose;'||unistr('\000a')||
' }'||unistr('\000a')||
' ta.focus();'||unistr('\000a')||
' return;'||unistr('\000a')||
'}'||unistr('\000a')||
''||unistr('\000a')||
'function trim(str, chars) {'||unistr('\000a')||
' return ltrim(rtrim(str, chars), chars);'||unistr('\000a')||
'}'||unistr('\000a')||
'function ltrim(str, chars) {'||unistr('\000a')||
' chars = chars || "\\s";'||unistr('\000a')||
' return str.replace(new RegExp("^[" + chars + "]+", "g"), "");'||unistr('\000a')||
'}'||unistr('\000a')||
'function rtrim(str, chars) {'||unistr('\000a')||
' chars = chars || "\\s";'||unistr('\000a')||
' return str.replace(new RegExp("[" + chars + "]+$", "g"), "");'||unistr('\000a')||
'}'||unistr('\000a')||
'function setCookie(c_name,value,'||
'expiredays){'||unistr('\000a')||
'var exdate=new Date();'||unistr('\000a')||
'exdate.setDate(exdate.getDate()+expiredays);'||unistr('\000a')||
'document.cookie=c_name+ "=" +escape(value)+'||unistr('\000a')||
'((expiredays==null) ? "" : ";expires="+exdate.toUTCString());'||unistr('\000a')||
'}'||unistr('\000a')||
'function SubmitComment(){'||unistr('\000a')||
' setCookie(''dbswh_blog'',''1'' + ''|'' + trim($v(''P9_EMAIL'')) + ''|'' + trim($v(''P9_FNAME'')) + ''|'' + trim($v(''P9_LNAME'')) + ''|'' + ''|'' + trim($v(''P9_NICKNAME'')) + ''|'' + ''|'' + ''|'' + ''|'' + &APP_S'||
'ESSION.,365);'||unistr('\000a')||
' htmldbConfirmDialog(''NEXT'',{message:"Your comment will be submitted after you press OK button. You will be able to modify it later in the same session. You will find Edit link if you go to Comments section of this article."});'||unistr('\000a')||
'}'
 ,p_javascript_code_onload => 
'if( $(''#MESSAGE'').text()) {'||unistr('\000a')||
' $(''.pb'').remove();'||unistr('\000a')||
' htmldbMsgDialog({message: $(''#MESSAGE'').html()});'||unistr('\000a')||
' $(''#MESSAGE'').remove();'||unistr('\000a')||
'}'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_browser_cache => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111123021917'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'for i in ('||unistr('\000a')||
'select ''<div class="htmltooltip">''||ITEM_HELP_TEXT||''</div>'' text'||unistr('\000a')||
'from APEX_APPLICATION_PAGE_ITEMS'||unistr('\000a')||
'where  application_id = :app_id'||unistr('\000a')||
'and page_id = :app_page_id '||unistr('\000a')||
'and condition_type is null'||unistr('\000a')||
'and item_help_text is not null'||unistr('\000a')||
'order by DISPLAY_SEQUENCE'||unistr('\000a')||
') loop'||unistr('\000a')||
'htp.p(i.TEXT);'||unistr('\000a')||
'end loop;';

wwv_flow_api.create_page_plug (
  p_id=> 156559475767864154 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'print help',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 51,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'BEFORE_FOOTER',
  p_plug_source=> s,
  p_plug_source_type=> 'PLSQL_PROCEDURE',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 159194015978144954 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 9,
  p_plug_name=> 'Please Enter Your Comment',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 758174573175603752+ wwv_flow_api.g_id_offset,
  p_plug_display_sequence=> 21,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'QUERY_COLUMNS',
  p_plug_query_num_rows_type => 'NEXT_PREVIOUS_LINKS',
  p_plug_query_row_count_max => 500,
  p_plug_query_show_nulls_as => ' - ',
  p_plug_display_condition_type => '',
  p_pagination_display_position=>'BOTTOM_RIGHT',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
wwv_flow_api.create_page_button(
  p_id             => 159194425163144956 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 9,
  p_button_sequence=> 10,
  p_button_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_button_name    => 'CANCEL',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(180718636594197846+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Cancel',
  p_button_position=> 'REGION_TEMPLATE_CLOSE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'f?p=&APP_ALIAS.:HOME:0',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'style="margin-right:10px"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_page_button(
  p_id             => 159194622707144961 + wwv_flow_api.g_id_offset,
  p_flow_id        => wwv_flow.g_flow_id,
  p_flow_step_id   => 9,
  p_button_sequence=> 20,
  p_button_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_button_name    => 'NEXT',
  p_button_action  => 'REDIRECT_URL',
  p_button_image   => 'template:'||to_char(180718636594197846+wwv_flow_api.g_id_offset),
  p_button_is_hot=>'N',
  p_button_image_alt=> 'Submit',
  p_button_position=> 'REGION_TEMPLATE_CREATE',
  p_button_alignment=> 'RIGHT',
  p_button_redirect_url=> 'javascript:SubmitComment();',
  p_button_execute_validations=>'Y',
  p_button_cattributes=>'style="margin-right:10px"',
  p_required_patch => null + wwv_flow_api.g_id_offset);
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>159203327626144998 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_branch_action=> 'f?p=&APP_ALIAS.:READ:0::::ARTICLE:&ARTICLE.',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_when_button_id=>159194622707144961+ wwv_flow_api.g_id_offset,
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
wwv_flow_api.create_page_branch(
  p_id=>159227008550433113 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_branch_action=> 'f?p=&APP_ALIAS.:WRITECOMMENT:0',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 20,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 07-NOV-2010 10:44 by ADMIN');
 
wwv_flow_api.create_page_branch(
  p_id=>159203529336145000 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_branch_action=> 'f?p=&APP_ALIAS.:HOME:0',
  p_branch_point=> 'BEFORE_HEADER',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_branch_condition_type=> 'NOT_EXISTS',
  p_branch_condition=> 'select 1 from blog_messages'||unistr('\000a')||
'where id = :ARTICLE',
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>158414876037785785 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_ID',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 130,
  p_item_plug_id => 163645190624808798+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Id',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_HIDDEN',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'Y',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter your email address. Please note: we do not use your email address in any kind of spam sending, we do not give it to any third parties and it is not shown anywhere.';

wwv_flow_api.create_page_item(
  p_id=>159194829116144962 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_EMAIL',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Email',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 178057391399363568+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Please enter your first name. It will not be displayed in the comment.';

wwv_flow_api.create_page_item(
  p_id=>159195810459144969 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_FNAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'First Name',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_tag_attributes  => 'Please enter your first name.',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Please enter your last name. It will not be displayed in the comment.';

wwv_flow_api.create_page_item(
  p_id=>159196829571144973 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_LNAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Last Name',
  p_post_element_text=>'</td></tr><tr><td>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 255,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter your comment. Use the formatting buttons to add allowed HTML tags.';

wwv_flow_api.create_page_item(
  p_id=>159200026945144982 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_COMMENT',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 120,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Comment',
  p_post_element_text=>'"TEXT_EDIT"',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXTAREA',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 60,
  p_cMaxlength=> 2000,
  p_cHeight=> 20,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 178057391399363568+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Check this box if you want an email sent when a new comment is posted to this article.';

wwv_flow_api.create_page_item(
  p_id=>159200908504144984 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_FOLLOWUP_NOTIFY',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 102,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Notification',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_CHECKBOX',
  p_lov=> 'STATIC:Notify me of followup comments via e-mail;YES',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_cattributes_element=>'style="border:1px solid #FFF;padding:5px;"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701556448894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_help_text=> h,
  p_attribute_01 => '1',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>159201406030144985 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_BUTTONS',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 118,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'"FORMATTING_BUTTONS"',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701362330894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
h := null;
h:=h||'Enter Nickname, it will be displayed in Posted by.';

wwv_flow_api.create_page_item(
  p_id=>159218006593648300 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_NICKNAME',
  p_data_type=> 'VARCHAR',
  p_is_required=> true,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 15,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_prompt=>'Nickname',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 178057391399363568+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'Y',
  p_help_text=> h,
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => 'Enter Nickname, it will be displayed in Posted by.');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>161026089535738376 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_name=>'P9_INFO',
  p_data_type=> 'VARCHAR',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 1,
  p_item_plug_id => 159194015978144954+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> 'YES',
  p_item_default_type=> 'STATIC_TEXT_WITH_SUBSTITUTIONS',
  p_post_element_text=>'<p>Your email address will not be published. Required fields are marked with asterisk.</p>',
  p_source_type=> 'STATIC',
  p_display_as=> 'NATIVE_DISPLAY_ONLY',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 30,
  p_cMaxlength=> 2000,
  p_cHeight=> 1,
  p_cAttributes=> 'nowrap="nowrap"',
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'ABOVE',
  p_field_alignment=> 'LEFT',
  p_field_template=> 757701362330894939+wwv_flow_api.g_id_offset,
  p_is_persistent=> 'Y',
  p_lov_display_extra=>'NO',
  p_protection_level => 'N',
  p_escape_on_http_output => 'N',
  p_attribute_01 => 'N',
  p_attribute_02 => 'VALUE',
  p_attribute_04 => 'N',
  p_show_quick_picks=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 156638000528061757 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 10,
  p_computation_item=> 'P9_EMAIL',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P9_EMAIL),1,255);',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 123650246757662894 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 20,
  p_computation_item=> 'P9_FNAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P9_FNAME),1,30);',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 123684728187667015 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 30,
  p_computation_item=> 'P9_LNAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P9_LNAME),1,30);',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_computation(
  p_id=> 123703937191669547 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 9,
  p_computation_sequence => 40,
  p_computation_item=> 'P9_NICKNAME',
  p_computation_point=> 'AFTER_SUBMIT',
  p_computation_type=> 'PLSQL_EXPRESSION',
  p_computation_processed=> 'REPLACE_EXISTING',
  p_computation=> 'substr(trim(:P9_NICKNAME),1,30);',
  p_compute_when => '',
  p_compute_when_type=>'');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 159201921669144988 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'E-Mail Address validate',
  p_validation_sequence=> 10,
  p_validation => 'RETURN check_email(:P9_EMAIL);',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'Please specify a valid e-mail address.',
  p_always_execute=>'N',
  p_validation_condition=> 'P9_EMAIL',
  p_validation_condition_type=> 'ITEM_IS_NOT_NULL',
  p_when_button_pressed=> 159194622707144961 + wwv_flow_api.g_id_offset,
  p_associated_item=> 159194829116144962 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 159202715648144991 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'Validate Tags in comment',
  p_validation_sequence=> 20,
  p_validation => 'RETURN BLOG_API.validate_message(:P9_COMMENT);',
  p_validation_type => 'FUNC_BODY_RETURNING_BOOLEAN',
  p_error_message => 'There are mismatched HTML tags in your comment.  Please close all tags and resubmit.',
  p_always_execute=>'N',
  p_when_button_pressed=> 159194622707144961 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 156546184729693840 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_COMMENT too long',
  p_validation_sequence=> 30,
  p_validation => 'LENGTH(:P9_COMMENT) <= 4000;',
  p_validation_type => 'PLSQL_EXPRESSION',
  p_error_message => 'Too long comment, please make it shorter. ',
  p_always_execute=>'N',
  p_when_button_pressed=> 159194622707144961 + wwv_flow_api.g_id_offset,
  p_associated_item=> 159200026945144982 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_IN_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_validation(
  p_id => 156546882500582731 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_tabular_form_region_id => null + wwv_flow_api.g_id_offset,
  p_validation_name => 'P9_EMAIL bad email',
  p_validation_sequence=> 40,
  p_validation => 'select 1'||unistr('\000a')||
'from BLOG_BAD_EMAILS'||unistr('\000a')||
'where upper(email) = upper(:P9_EMAIL)',
  p_validation_type => 'NOT_EXISTS',
  p_error_message => 'You email is in the list of bad email, comment is not possible.',
  p_always_execute=>'N',
  p_when_button_pressed=> 159194622707144961 + wwv_flow_api.g_id_offset,
  p_associated_item=> 159194829116144962 + wwv_flow_api.g_id_offset,
  p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION',
  p_validation_comment=> '');
 
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DECLARE'||unistr('\000a')||
'  l            NUMBER;'||unistr('\000a')||
'  l_comment_id NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  :P9_COMMENT := trim(:P9_COMMENT);'||unistr('\000a')||
'  FOR i       IN'||unistr('\000a')||
'  (SELECT id FROM blog_reg_users WHERE upper(email) = upper(:P9_EMAIL)'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l := i.id;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  IF l IS NULL THEN'||unistr('\000a')||
'    l  := blog_id.next_val;'||unistr('\000a')||
'    INSERT'||unistr('\000a')||
'    INTO BLOG_REG_USERS'||unistr('\000a')||
'      ('||unistr('\000a')||
'        HTTP_USER_AGENT,'||unistr('\000a')||
'        HTTP_REFERER,'||unistr('\000a')||
'        HOST_NAME,'||unistr('\000a')||
'        REMOTE_ADDR,'||unistr('\000a')||
'';

p:=p||'        ID,'||unistr('\000a')||
'        EMAIL,'||unistr('\000a')||
'        FNAME,'||unistr('\000a')||
'        LNAME,'||unistr('\000a')||
'        LOCATION,'||unistr('\000a')||
'        TITLE,'||unistr('\000a')||
'        ORG,'||unistr('\000a')||
'        CREATED_ON,'||unistr('\000a')||
'        CREATED_BY,'||unistr('\000a')||
'        MODIFIED_ON,'||unistr('\000a')||
'        MODIFIED_BY,'||unistr('\000a')||
'        PASSWORD,'||unistr('\000a')||
'        NICK'||unistr('\000a')||
'      )'||unistr('\000a')||
'      VALUES'||unistr('\000a')||
'      ('||unistr('\000a')||
'        owa_util.get_cgi_env( ''HTTP_USER_AGENT'' ), -- HTTP_USER_AGENT,'||unistr('\000a')||
'        owa_util.get_cgi_env( ''HTTP_REFERER'' ),    -- HTTP_REFERER,'||unistr('\000a')||
'        NULL,   ';

p:=p||'                                   -- HOST_NAME,'||unistr('\000a')||
'        owa_util.get_cgi_env( ''REMOTE_ADDR'' ),     -- REMOTE_ADDR,'||unistr('\000a')||
'        l,                                         -- ID,'||unistr('\000a')||
'        SUBSTR(trim(:P9_EMAIL),1,255),             -- EMAIL,'||unistr('\000a')||
'        SUBSTR(trim(:P9_FNAME),1,30),              -- FNAME,'||unistr('\000a')||
'        SUBSTR(trim(:P9_LNAME),1,30),              -- LNAME,'||unistr('\000a')||
'        SUBSTR(trim(:COUNTRY),1,30),       ';

p:=p||'        -- LOCATION,'||unistr('\000a')||
'        NULL,                                      -- TITLE,'||unistr('\000a')||
'        NULL,                                      -- org,'||unistr('\000a')||
'        NULL,                                      -- CREATED_ON,'||unistr('\000a')||
'        NULL,                                      -- CREATED_BY,'||unistr('\000a')||
'        NULL,                                      -- MODIFIED_ON,'||unistr('\000a')||
'        NULL,                                      -- modifi';

p:=p||'ed_by,'||unistr('\000a')||
'        NULL,                                      --upassword,'||unistr('\000a')||
'        SUBSTR(trim(:P9_NICKNAME),1,30)'||unistr('\000a')||
'      );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :P9_ID       := l;'||unistr('\000a')||
'  l_comment_id := blog_id.next_val;'||unistr('\000a')||
'  INSERT'||unistr('\000a')||
'  INTO BLOG_MESSAGES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ID,'||unistr('\000a')||
'      MSG_ID,'||unistr('\000a')||
'      MSG_TYPE,'||unistr('\000a')||
'      MSG_SUBJECT,'||unistr('\000a')||
'      MSG_TEXT,'||unistr('\000a')||
'      followup_notify,'||unistr('\000a')||
'      CATEGORY_ID,'||unistr('\000a')||
'      EXPIRE_DATE,'||unistr('\000a')||
'      VIEWED,'||unistr('\000a')||
'      rss_description,'||unistr('\000a')||
'    ';

p:=p||'  session_id,'||unistr('\000a')||
'      CREATED_ON,'||unistr('\000a')||
'      MODIFIED_ON,'||unistr('\000a')||
'      CREATED_BY_ID,'||unistr('\000a')||
'      MODIFIED_BY_ID'||unistr('\000a')||
'    )'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      l_comment_id,'||unistr('\000a')||
'      :ARTICLE,'||unistr('\000a')||
'      ''COMMENT'','||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      BLOG_API.format_comment(:P9_COMMENT,LENGTH(:P9_COMMENT)),'||unistr('\000a')||
'      DECODE(:P9_FOLLOWUP_NOTIFY,''YES'',''Y'',''N'') ,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      :SESSION,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      l,'||unistr('\000a')||
'      l'||unistr('\000a')||
'';

p:=p||'    );'||unistr('\000a')||
'  IF NOT APEX_COLLECTION.COLLECTION_EXISTS ( p_collection_name => ''COMMENTS'' ) THEN'||unistr('\000a')||
'    APEX_COLLECTION.CREATE_COLLECTION( p_collection_name => ''COMMENTS'' );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  APEX_COLLECTION.ADD_MEMBER( p_collection_name => ''COMMENTS'', p_c001 => l_comment_id);'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 159241331405789833 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'WRITECOMMENT',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>159194622707144961 + wwv_flow_api.g_id_offset,
  p_process_success_message=> 'Thank you for submitting your comment.',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'INSERT'||unistr('\000a')||
'INTO BLOG_REG_USERS'||unistr('\000a')||
'  ('||unistr('\000a')||
'    HTTP_USER_AGENT,'||unistr('\000a')||
'    HTTP_REFERER,'||unistr('\000a')||
'    HOST_NAME,'||unistr('\000a')||
'    FOLLOWUP_NOTIFY,'||unistr('\000a')||
'    REMOTE_ADDR,'||unistr('\000a')||
'    ID,'||unistr('\000a')||
'    EMAIL,'||unistr('\000a')||
'    FNAME,'||unistr('\000a')||
'    LNAME,'||unistr('\000a')||
'    LOCATION,'||unistr('\000a')||
'    TITLE,'||unistr('\000a')||
'    ORG,'||unistr('\000a')||
'    YEARS_EXP,'||unistr('\000a')||
'    CREATED_ON,'||unistr('\000a')||
'    CREATED_BY,'||unistr('\000a')||
'    MODIFIED_ON,'||unistr('\000a')||
'    MODIFIED_BY,'||unistr('\000a')||
'    PASSWORD,'||unistr('\000a')||
'    NICK'||unistr('\000a')||
'  )'||unistr('\000a')||
'  VALUES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    null, -- HTTP_USER_AGENT,'||unistr('\000a')||
'    null, -- HTTP_REFERER,'||unistr('\000a')||
'    null, -- HOST_NAME,'||unistr('\000a')||
'    FOLLOWUP_NOTIFY,'||unistr('\000a')||
'    REMOTE_ADDR,'||unistr('\000a')||
'    ID,'||unistr('\000a')||
'    EMAIL,'||unistr('\000a')||
'    FNAME,'||unistr('\000a')||
'    LNAME,'||unistr('\000a')||
'    LOCATION,'||unistr('\000a')||
'    title,'||unistr('\000a')||
'    null, -- org,'||unistr('\000a')||
'    null, -- years_exp,'||unistr('\000a')||
'    null, -- CREATED_ON,'||unistr('\000a')||
'    null, -- CREATED_BY,'||unistr('\000a')||
'    null, -- MODIFIED_ON,'||unistr('\000a')||
'    null, -- modified_by,'||unistr('\000a')||
'    null, --upassword,'||unistr('\000a')||
'    :P9_NICKNAME'||unistr('\000a')||
'  );'||unistr('\000a')||
''||unistr('\000a')||
'INSERT'||unistr('\000a')||
'INTO BLOG_MESSAGES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    ID,'||unistr('\000a')||
'    MSG_ID,'||unistr('\000a')||
'    MSG_TYPE,'||unistr('\000a')||
'    MSG_SUBJECT,'||unistr('\000a')||
'    MSG_TEXT,'||unistr('\000a')||
'    CATEGORY_ID,'||unistr('\000a')||
'    EXPIRE_DATE,'||unistr('\000a')||
'    VIEWED,'||unistr('\000a')||
'    RESERVED2,'||unistr('\000a')||
'    RESERVED3,'||unistr('\000a')||
'    RESERVED4,'||unistr('\000a')||
'    CREATED_ON,'||unistr('\000a')||
'    MODIFIED_ON,'||unistr('\000a')||
'    CREATED_BY_ID,'||unistr('\000a')||
'    MODIFIED_BY_ID'||unistr('\000a')||
'  )'||unistr('\000a')||
'  VALUES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    :v0,'||unistr('\000a')||
'    :v1,'||unistr('\000a')||
'    :v2,'||unistr('\000a')||
'    :v3,'||unistr('\000a')||
'    :v4,'||unistr('\000a')||
'    :v5,'||unistr('\000a')||
'    :v6,'||unistr('\000a')||
'    :v7,'||unistr('\000a')||
'    :v8,'||unistr('\000a')||
'    :v9,'||unistr('\000a')||
'    :v10,'||unistr('\000a')||
'    :v11,'||unistr('\000a')||
'    :v12,'||unistr('\000a')||
'    :v13,'||unistr('\000a')||
'    :v14'||unistr('\000a')||
'  );');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DECLARE'||unistr('\000a')||
'  n NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  n := APEX_PLSQL_JOB.submit_process ( p_sql => '' '||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      BLOG_API.notify('''''' || :ARTICLE || '''''','''''' || :P9_ID || '''''','''''' || :BLOG_EMAIL || '''''',''''&APP_ID.'''');'||unistr('\000a')||
'      APEX.PUSH_QUEUE(''''localhost'''', 25);'||unistr('\000a')||
'    END;'', '||unistr('\000a')||
'    p_when => sysdate,'||unistr('\000a')||
'    p_status => ''SUBMITTED'''||unistr('\000a')||
'  );'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 158410092200914534 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'notify others',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_when_button_id=>159194622707144961 + wwv_flow_api.g_id_offset,
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'DECLARE'||unistr('\000a')||
'  l_email VARCHAR2(1000) := NULL;'||unistr('\000a')||
'  l_fname VARCHAR2(1000) := NULL;'||unistr('\000a')||
'  l_lname VARCHAR2(1000) := NULL;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  BLOG_API.read_askcookie;'||unistr('\000a')||
'  l_email             := BLOG_API.fetch_askcookie_val(''EMAIL'');'||unistr('\000a')||
'  :P9_NICKNAME        := BLOG_API.fetch_askcookie_val(''NICKNAME'');'||unistr('\000a')||
'  :P9_COMMENT         := NULL;'||unistr('\000a')||
'  :P9_FOLLOWUP_NOTIFY := NULL;'||unistr('\000a')||
'  l_fname             := BLOG_API.fetch_askcookie_val(''FNAME'');'||unistr('\000a')||
'';

p:=p||'  l_lname             := BLOG_API.fetch_askcookie_val(''LNAME'');'||unistr('\000a')||
'  :P9_EMAIL           := l_email;'||unistr('\000a')||
'  :P9_FNAME           := l_fname;'||unistr('\000a')||
'  :P9_LNAME           := l_lname;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  NULL;'||unistr('\000a')||
'END;';

wwv_flow_api.create_page_process(
  p_id     => 159202803912144991 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 9,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Read Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 9
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00013
prompt  ...PAGE 13: Visitors
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 13
 ,p_name => 'Visitors'
 ,p_alias => 'VISITORS'
 ,p_step_title => 'Visitors'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title => 'Map'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_group_id => 155448691321688024 + wwv_flow_api.g_id_offset
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_help_text => 
'No help is available for this page.'
 ,p_last_updated_by => 'ADMIN'
 ,p_last_upd_yyyymmddhh24miss => '20111117042521'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s:=s||'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'||unistr('\000a')||
'    codebase="#HOST_PROTOCOL#://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"'||unistr('\000a')||
'    width="#WIDTH#"'||unistr('\000a')||
'    height="#HEIGHT#"'||unistr('\000a')||
'    id="#CHART_NAME#"'||unistr('\000a')||
'    align="top">'||unistr('\000a')||
'<param name="movie" value="#IMAGE_PREFIX#flashchart/swf/AnyChart.swf">'||unistr('\000a')||
'<param name="quality" value="high">'||unistr('\000a')||
'<param name="allowScriptAccess" value="sa';

s:=s||'meDomain">'||unistr('\000a')||
'<param name="allowNetworking" value="all">'||unistr('\000a')||
'<param name="scale" value="noscale">'||unistr('\000a')||
'<param name="wmode" value="transparent">'||unistr('\000a')||
'<param name="FlashVars" value="XMLFile=#HOST#apex_util.flash?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.:FLOW_FLASH_CHART5_R#REGION_ID#&noDataText=#FLASH_NO_DATA#&initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&waitingForDataText';

s:=s||'=#FLASH_WAITING#&templatesLoadingText=#FLASH_TEMPLATES#">'||unistr('\000a')||
''||unistr('\000a')||
'<embed src="#IMAGE_PREFIX#flashchart/swf/AnyChart.swf"'||unistr('\000a')||
'       quality="high"'||unistr('\000a')||
'       width="#WIDTH#"'||unistr('\000a')||
'       height="#HEIGHT#"'||unistr('\000a')||
'       name="#CHART_NAME#"'||unistr('\000a')||
'       scale="noscale"'||unistr('\000a')||
'       align=""'||unistr('\000a')||
'       allowScriptAccess="sameDomain" '||unistr('\000a')||
'       allowNetworking="all"'||unistr('\000a')||
'       type="application/x-shockwave-flash"'||unistr('\000a')||
'       pluginspage="#HOST_PROTOCOL#://';

s:=s||'www.macromedia.com/go/getflashplayer"'||unistr('\000a')||
'       wmode="transparent"'||unistr('\000a')||
'        FlashVars="XMLFile=#HOST#apex_util.flash?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.:FLOW_FLASH_CHART5_R#REGION_ID#&noDataText=#FLASH_NO_DATA#&initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&waitingForDataText=#FLASH_WAITING#&templatesLoadingText=#FLASH_TEMPLATES#">'||unistr('\000a')||
'</embed>'||unistr('\000a')||
'</object>'||unistr('\000a')||
'#C';

s:=s||'HART_REFRESH#';

wwv_flow_api.create_page_plug (
  p_id=> 155456501494750720 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 13,
  p_plug_name=> 'Map',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'FLASH_MAP',
  p_translate_title=> 'Y',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_customized=>'0',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1 := null;
wwv_flow_api.create_flash_chart5(
  p_id => 155456693396750752+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id => 13,
  p_region_id => 155456501494750720+wwv_flow_api.g_id_offset,
  p_default_chart_type     =>'Map',
  p_chart_title            =>'Blog Visits by Country',
  p_chart_name             =>'chart_1792918302192108',
  p_chart_width            =>700,
  p_chart_height           =>500,
  p_chart_animation        =>'Appear',
  p_display_attr           =>':H:N::X::N::V:Y:None:::::::::',
  p_dial_tick_attr         =>'',
  p_gantt_attr             =>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E',
  p_pie_attr               =>'Outside:::',
  p_map_attr               =>'Eckert1:NonOverlap:REGION_ID:Y:Y:Series::::Y:N',
  p_map_source             =>'world/world_wo_gr.amap',
  p_margins                =>':::',
  p_omit_label_interval    => null,
  p_bgtype                 =>'Trans',
  p_bgcolor1               =>'',
  p_bgcolor2               =>'',
  p_gradient_rotation      =>null,
  p_grid_bgtype            =>'Trans',
  p_grid_bgcolor1          =>'',
  p_grid_bgcolor2          =>'',
  p_grid_gradient_rotation =>null,
  p_color_scheme           =>'7',
  p_custom_colors          =>'',
  p_map_undef_color_scheme =>'1',
  p_map_undef_custom_colors =>'',
  p_x_axis_title           =>'',
  p_x_axis_min             =>null,
  p_x_axis_max             =>null,
  p_x_axis_decimal_place   =>null,
  p_x_axis_prefix          =>'',
  p_x_axis_postfix         =>'',
  p_x_axis_label_rotation  =>'',
  p_x_axis_label_font      =>'',
  p_x_axis_major_interval  =>null,
  p_x_axis_minor_interval  =>null,
  p_y_axis_title           =>'',
  p_y_axis_min             =>null,
  p_y_axis_max             =>null,
  p_y_axis_decimal_place   =>null,
  p_y_axis_prefix          =>'',
  p_y_axis_postfix         =>'',
  p_y_axis_label_rotation  =>'',
  p_y_axis_label_font      =>'',
  p_y_axis_major_interval  =>null,
  p_y_axis_minor_interval  =>null,
  p_async_update           =>'N',
  p_async_time             =>null,
  p_legend_title           =>'',
  p_legend_title_font      =>'',
  p_names_font             => null,
  p_names_rotation         => null,
  p_values_font            =>'Arial:10:#000000',
  p_values_rotation        =>null,
  p_values_prefix          =>'',
  p_values_postfix         =>'',
  p_hints_font             =>'Tahoma:10:#000000',
  p_legend_font            =>'Arial:10:#000000',
  p_grid_labels_font       =>'',
  p_chart_title_font       =>'Tahoma:14:#000000',
  p_x_axis_title_font      =>'Tahoma:14:',
  p_x_axis_title_rotation  =>'',
  p_y_axis_title_font      =>'Tahoma:14:',
  p_y_axis_title_rotation  =>'',
  p_gauge_labels_font      =>'Tahoma:10',
  p_use_chart_xml          =>'N',
  p_chart_xml              => a1);
end;
/
declare
 a1 varchar2(32767) := null;
begin
a1:=a1||'select null link, decode(country_code,''GB'',''UK'',country_code) label, count(*) value from BLOG_ACTIVITY_LOG where country_code is not null group by country_code';

wwv_flow_api.create_flash_chart5_series(
  p_id => 155456790473750758+wwv_flow_api.g_id_offset,
  p_chart_id => 155456693396750752+wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_series_seq                =>10,
  p_series_name               =>'Series 1',
  p_series_query              => a1,
  p_series_type               =>'Map',
  p_series_query_type         =>'SQL_QUERY',
  p_series_query_parse_opt    =>'PARSE_CHART_QUERY',
  p_series_query_no_data_found=>'No data found.',
  p_series_query_row_count_max=>300,
  p_action_link               =>'',
  p_show_action_link          =>'N',
  p_action_link_checksum_type =>'');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 13
--
 
begin
 
null;
end;
null;
 
end;
/

 
--application/pages/page_00019
prompt  ...PAGE 19: Login Page
--
 
begin
 
wwv_flow_api.create_page (
  p_flow_id => wwv_flow.g_flow_id
 ,p_id => 19
 ,p_name => 'Login Page'
 ,p_alias => 'LOGIN'
 ,p_step_title => 'Login Page'
 ,p_allow_duplicate_submissions => 'Y'
 ,p_step_sub_title_type => 'TEXT_WITH_SUBSTITUTIONS'
 ,p_first_item => 'AUTO_FIRST_ITEM'
 ,p_include_apex_css_js_yn => 'Y'
 ,p_autocomplete_on_off => 'OFF'
 ,p_page_is_public_y_n => 'Y'
 ,p_protection_level => 'N'
 ,p_cache_page_yn => 'N'
 ,p_cache_timeout_seconds => 21600
 ,p_cache_by_user_yn => 'N'
 ,p_page_comment => 'This page was generated by the Login Page wizard'
 ,p_last_updated_by => 'LAINFJAR'
 ,p_last_upd_yyyymmddhh24miss => '20111104075658'
  );
null;
 
end;
/

declare
  s varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
s := null;
wwv_flow_api.create_page_plug (
  p_id=> 156634990081823405 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_page_id=> 19,
  p_plug_name=> 'Login Items',
  p_region_name=>'',
  p_escape_on_http_output=>'N',
  p_plug_template=> 0,
  p_plug_display_sequence=> 10,
  p_plug_display_column=> 1,
  p_plug_display_point=> 'AFTER_SHOW_ITEMS',
  p_plug_source=> s,
  p_plug_source_type=> 'STATIC_TEXT',
  p_plug_query_row_template=> 1,
  p_plug_query_headings_type=> 'COLON_DELMITED_LIST',
  p_plug_query_row_count_max => 500,
  p_plug_display_condition_type => '',
  p_plug_caching=> 'NOT_CACHED',
  p_plug_comment=> '');
end;
/
 
begin
 
null;
 
end;
/

 
begin
 
wwv_flow_api.create_page_branch(
  p_id=>160619275901842786 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_branch_action=> 'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:::',
  p_branch_point=> 'AFTER_PROCESSING',
  p_branch_type=> 'REDIRECT_URL',
  p_branch_sequence=> 10,
  p_save_state_before_branch_yn=>'N',
  p_branch_comment=> 'Created 12-JAN-2011 15:18 by ADMIN');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>156635206226823407 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_name=>'P19_USERNAME',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 10,
  p_item_plug_id => 156634990081823405+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'User Name',
  p_display_as=> 'NATIVE_TEXT_FIELD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'N',
  p_attribute_02 => 'N',
  p_attribute_03 => 'N',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>156635399273823408 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_name=>'P19_PASSWORD',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 20,
  p_item_plug_id => 156634990081823405+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_prompt=>'Password',
  p_display_as=> 'NATIVE_PASSWORD',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> 20,
  p_cMaxlength=> 100,
  p_cHeight=> null,
  p_begin_on_new_line=> 'YES',
  p_begin_on_new_field=> 'YES',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'RIGHT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_attribute_01 => 'Y',
  p_attribute_02 => 'Y',
  p_item_comment => '');
 
 
end;
/

declare
    h varchar2(32767) := null;
begin
wwv_flow_api.create_page_item(
  p_id=>156635583996823409 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id=> 19,
  p_name=>'P19_LOGIN',
  p_data_type=> '',
  p_is_required=> false,
  p_accept_processing=> 'REPLACE_EXISTING',
  p_item_sequence=> 30,
  p_item_plug_id => 156634990081823405+wwv_flow_api.g_id_offset,
  p_use_cache_before_default=> '',
  p_item_default=> 'LOGIN',
  p_prompt=>'Login',
  p_source=>'LOGIN',
  p_source_type=> 'STATIC',
  p_display_as=> 'BUTTON',
  p_lov_display_null=> 'NO',
  p_lov_translated=> 'N',
  p_cSize=> null,
  p_cMaxlength=> null,
  p_cHeight=> null,
  p_tag_attributes  => 'template:'||to_char(180718636594197846 + wwv_flow_api.g_id_offset),
  p_begin_on_new_line=> 'NO',
  p_begin_on_new_field=> 'NO',
  p_colspan=> 1,
  p_rowspan=> 1,
  p_label_alignment=> 'LEFT',
  p_field_alignment=> 'LEFT',
  p_is_persistent=> 'Y',
  p_button_action => 'SUBMIT',
  p_button_is_hot=>'N',
  p_item_comment => '');
 
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'begin'||unistr('\000a')||
'sys.owa_util.mime_header(''text/html'', FALSE);'||unistr('\000a')||
'sys.owa_cookie.send('||unistr('\000a')||
'    name=>''LOGIN_USERNAME_COOKIE'','||unistr('\000a')||
'    value=>lower(:P19_USERNAME));'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 156636002558823411 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 10,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Set Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'wwv_flow_custom_auth_std.login('||unistr('\000a')||
'    P_UNAME       => :P19_USERNAME,'||unistr('\000a')||
'    P_PASSWORD    => :P19_PASSWORD,'||unistr('\000a')||
'    P_SESSION_ID  => v(''APP_SESSION''),'||unistr('\000a')||
'    P_FLOW_PAGE   => 999||'':250'''||unistr('\000a')||
'    );';

wwv_flow_api.create_page_process(
  p_id     => 156635776018823411 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 20,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Login',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'19';

wwv_flow_api.create_page_process(
  p_id     => 156636198353823412 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 30,
  p_process_point=> 'AFTER_SUBMIT',
  p_process_type=> 'CLEAR_CACHE_FOR_PAGES',
  p_process_name=> 'Clear',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
declare
  p varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
p:=p||'declare'||unistr('\000a')||
'    v varchar2(255) := null;'||unistr('\000a')||
'    c sys.owa_cookie.cookie;'||unistr('\000a')||
'begin'||unistr('\000a')||
'   c := sys.owa_cookie.get(''LOGIN_USERNAME_COOKIE'');'||unistr('\000a')||
'   :P19_USERNAME := c.vals(1);'||unistr('\000a')||
'exception when others then null;'||unistr('\000a')||
'end;';

wwv_flow_api.create_page_process(
  p_id     => 156636386544823413 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_flow_step_id => 19,
  p_process_sequence=> 10,
  p_process_point=> 'BEFORE_HEADER',
  p_process_type=> 'PLSQL',
  p_process_name=> 'Get Username Cookie',
  p_process_sql_clob => p, 
  p_process_error_message=> '',
  p_error_display_location=> 'ON_ERROR_PAGE',
  p_process_success_message=> '',
  p_process_is_stateful_y_n=>'N',
  p_process_comment=>'');
end;
null;
 
end;
/

 
begin
 
---------------------------------------
-- ...updatable report columns for page 19
--
 
begin
 
null;
end;
null;
 
end;
/

prompt  ...lists
--
--application/shared_components/navigation/lists/tabs
 
begin
 
wwv_flow_api.create_list (
  p_id=> 736255366705961444 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Tabs',
  p_list_type=> 'STATIC',
  p_list_query=>'',
  p_list_status=> 'PUBLIC',
  p_list_displayed=> 'BY_DEFAULT',
  p_display_row_template_id=> 757732855915707081 + wwv_flow_api.g_id_offset);
 
wwv_flow_api.create_list_item (
  p_id=> 736255841902963743 + wwv_flow_api.g_id_offset,
  p_list_id=> 736255366705961444 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>10,
  p_list_item_link_text=> '<span>HOME</span>',
  p_list_item_link_target=> 'f?p=&APP_ID.:HOME:&V_SESSION.',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
wwv_flow_api.create_list_item (
  p_id=> 736256367790990157 + wwv_flow_api.g_id_offset,
  p_list_id=> 736255366705961444 + wwv_flow_api.g_id_offset,
  p_list_item_type=> 'LINK',
  p_list_item_status=> 'PUBLIC',
  p_item_displayed=> 'BY_DEFAULT',
  p_list_item_display_sequence=>20,
  p_list_item_link_text=> '<span>ARTICLES</span>',
  p_list_item_link_target=> 'f?p=&APP_ALIAS.:ARTICLES:0',
  p_list_countclicks_y_n=> 'N',
  p_list_text_01=> '',
  p_list_item_current_type=> 'COLON_DELIMITED_PAGE_LIST',
  p_list_item_owner=> '');
 
null;
 
end;
/

--application/shared_components/navigation/breadcrumbs
prompt  ...breadcrumbs
--
prompt  ...page templates for application: 100
--
--application/shared_components/user_interface/templates/page/dkblog_no_tabs_with_side_bar
prompt  ......Page template 757725673583542459
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'||unistr('\000a')||
'<html xmlns="http://www.w3.org/1999/xhtml" lang="&BROWSER_LANGUAGE.">'||unistr('\000a')||
'<head>'||unistr('\000a')||
'<title>#TITLE#</title>'||unistr('\000a')||
'<link type="image/x-icon" href="#IMAGE_PREFIX#blog/images/favicon.ico" rel="icon" />'||unistr('\000a')||
'<link type="image/x-icon" href="#IMAGE_PREFIX#blog/images/favicon.ico" rel="shortcut icon" />'||unistr('\000a')||
''||unistr('\000a')||
'<link rel=';

c1:=c1||'"stylesheet" type="text/css" href="#IMAGE_PREFIX#blog/css/blog.min.css" />'||unistr('\000a')||
'#HEAD#'||unistr('\000a')||
''||unistr('\000a')||
'<link rel="stylesheet" type="text/css" href="#IMAGE_PREFIX#blog/css/shCore.css" />'||unistr('\000a')||
'<link rel="stylesheet" type="text/css" href="#IMAGE_PREFIX#blog/css/shThemeDefault.css" />'||unistr('\000a')||
'<link rel="stylesheet" type="text/css" href="http://jquery-star-rating-plugin.googlecode.com/svn/trunk/jquery.rating.css" />'||unistr('\000a')||
''||unistr('\000a')||
'&JSAPI.'||unistr('\000a')||
'<script t';

c1:=c1||'ype="text/javascript" src="http://jquery-star-rating-plugin.googlecode.com/svn/trunk/jquery.rating.js"></script>'||unistr('\000a')||
'<script type="text/javascript" src="#IMAGE_PREFIX#blog/js/jquery.cookie.js"></script>'||unistr('\000a')||
'<script type="text/javascript" src="#IMAGE_PREFIX#blog/js/jquery.treeview.js"></script>'||unistr('\000a')||
'<script type="text/javascript" src="#IMAGE_PREFIX#blog/js/animatedcollapse.min.js"></script>'||unistr('\000a')||
'<script type="text/j';

c1:=c1||'avascript" src="#IMAGE_PREFIX#blog/js/shCoreStaticInclude.js"></script>'||unistr('\000a')||
'<script type="text/javascript"src="#IMAGE_PREFIX#blog/js/shCore.js"></script>'||unistr('\000a')||
'<script type="text/javascript" src="#IMAGE_PREFIX#blog/js/shBrushJScript.js"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<script src="//platform.twitter.com/widgets.js" type="text/javascript"></script>'||unistr('\000a')||
''||unistr('\000a')||
'<script language="javascript">'||unistr('\000a')||
'SyntaxHighlighter.config.bloggerMode = true;'||unistr('\000a')||
'Synt';

c1:=c1||'axHighlighter.config.clipboardSwf = ''#IMAGE_PREFIX#blog/js/clipboard.swf'';'||unistr('\000a')||
'SyntaxHighlighter.all();'||unistr('\000a')||
'</script>'||unistr('\000a')||
''||unistr('\000a')||
'<style type="text/css">'||unistr('\000a')||
'.syntaxhighlighter{overflow-y: hidden !important}'||unistr('\000a')||
'</style>'||unistr('\000a')||
'</head>'||unistr('\000a')||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||' <div id="footer">#REGION_POSITION_08#</div>'||unistr('\000a')||
'</div>#FORM_CLOSE#'||unistr('\000a')||
'</body>'||unistr('\000a')||
'</html>';

c3:=c3||'<div id="topbar">'||unistr('\000a')||
' <div class="content">'||unistr('\000a')||
'  #REGION_POSITION_02#'||unistr('\000a')||
'  <div id="icons">#NAVIGATION_BAR#</div>'||unistr('\000a')||
' </div>'||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div id="top"> '||unistr('\000a')||
' <div class="content">'||unistr('\000a')||
'  <div id="menu">#REGION_POSITION_03#</div>'||unistr('\000a')||
'  <h1>#LOGO#&APPLICATION_NAME.</h1>'||unistr('\000a')||
'  <h2>#REGION_POSITION_04#</h2>'||unistr('\000a')||
' </div>   '||unistr('\000a')||
'</div>'||unistr('\000a')||
'<div class="DkBlogMessages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>'||unistr('\000a')||
'<div class="cont';

c3:=c3||'ent">'||unistr('\000a')||
' <div id="main">'||unistr('\000a')||
'  <div class="right_side">'||unistr('\000a')||
'   <div class="pad">'||unistr('\000a')||
'    #REGION_POSITION_05#'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div class="right_side">'||unistr('\000a')||
'   <div class="pad">#REGION_POSITION_06#</div>'||unistr('\000a')||
'  </div>'||unistr('\000a')||
'  <div id="left_side_a">'||unistr('\000a')||
'   <div class="intro">#REGION_POSITION_07#</div>'||unistr('\000a')||
'   <div  id="left_side">'||unistr('\000a')||
'    <div class="mpart">#BOX_BODY#</div>'||unistr('\000a')||
'   </div>'||unistr('\000a')||
'   #REGION_POSITION_01#'||unistr('\000a')||
' </div>    '||unistr('\000a')||
'</div>';

wwv_flow_api.create_template(
  p_id=> 757725673583542459 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Dkblog No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="DkBlogSuccess" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="DkBlogSuccess" style="color:red;" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '#BAR_BODY#',
  p_navbar_entry=> '<a href="#LINK#"><img src="#IMAGE#" alt="#TEXT#" title="#TEXT#"/>#TEXT#</a>'||unistr('\000a')||
''||unistr('\000a')||
'',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> 'width="100%" border="0" cellpadding="0" cellspacing="0" summary="" ',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => 202,
  p_theme_class_id => 17,
  p_error_page_template => '<pre id="defined-err-msg" style="font-weight:bold">#MESSAGE#</pre>'||unistr('\000a')||
'<br/><div class="appenderror"></div>'||unistr('\000a')||
'<br/>'||unistr('\000a')||
'<a href="#BACK_LINK#" class="free"><b>#RETURN_TO_APPLICATION#<b></a>'||unistr('\000a')||
'<script type="text/javascript">'||unistr('\000a')||
'$(function(){'||unistr('\000a')||
' var ajaxRequest = new htmldb_Get(null,&APP_ID.,"APPLICATION_PROCESS=LOGERROR",&APP_PAGE_ID.);'||unistr('\000a')||
' ajaxRequest.addParam("x01", $(".ErrorPageMessage").text());'||unistr('\000a')||
' ajaxRequest.addParam("x02", $("#defined-err-msg").text());'||unistr('\000a')||
' var ajaxResult = ajaxRequest.get();'||unistr('\000a')||
' ajaxRequest = null; '||unistr('\000a')||
' $(''.ErrorPageMessage'').remove();'||unistr('\000a')||
' window.location="f?p=&APP_ALIAS.:ERROR:0";'||unistr('\000a')||
'});'||unistr('\000a')||
'</script>'||unistr('\000a')||
'',
  p_mobile_page_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 180718636594197846
 
begin
 
wwv_flow_api.create_button_templates (
  p_id => 180718636594197846 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template_name => 'Button'
 ,p_template => 
'<input id="#BUTTON_ID#" type="button" class="f-submit" value="#LABEL#" onclick="#LINK#" #BUTTON_ATTRIBUTES#>'
 ,p_theme_class_id => 1
 ,p_theme_id => 202
  );
null;
 
end;
/

---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/h3_reports_region
prompt  ......region template 167215692682058506
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 167215692682058506 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="DkBlogReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <td><div class="intro"><div  class="pad"><h3>#TITLE#</h3></div></div></td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <td class="DkBlogButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <td>#BODY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'H3 Reports Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 202
 ,p_theme_class_id => 23
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 167215692682058506 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/h3_region
prompt  ......region template 757727179981673634
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 757727179981673634 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<h3>#TITLE#</h3>'||unistr('\000a')||
'#BODY#'
 ,p_page_plug_template_name => 'H3 Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#f7f7e7'
 ,p_theme_id => 202
 ,p_theme_class_id => 22
 ,p_plug_heading_bgcolor => '#f7f7e7'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
 ,p_template_comment => 'Red Theme'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 757727179981673634 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/h2_reports_region
prompt  ......region template 758174573175603752
 
begin
 
wwv_flow_api.create_plug_template (
  p_id => 758174573175603752 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_template => 
'<table class="DkBlogReportsRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# summary="">'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <td><div class="intro"><div  class="pad"><h2>#TITLE#</h2></div></div></td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <td class="DkBlogButtonHolder">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
' <tr>'||unistr('\000a')||
'  <td>#BODY#</td>'||unistr('\000a')||
' </tr>'||unistr('\000a')||
'</table>'||unistr('\000a')||
''
 ,p_page_plug_template_name => 'H2 Reports Region'
 ,p_render_form_items_in_table => 'Y'
 ,p_plug_table_bgcolor => '#ffffff'
 ,p_theme_id => 202
 ,p_theme_class_id => 21
 ,p_plug_heading_bgcolor => '#ffffff'
 ,p_plug_font_size => '-1'
 ,p_translate_this_template => 'N'
  );
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 758174573175603752 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/blog_tab_list
prompt  ......list template 757732855915707081
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="current" href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>757732855915707081 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Blog Tab List',
  p_theme_id  => 202,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<ul>',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 166359480355790001
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="data" #ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 166359480355790001 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#<tr><td>'||unistr('\000a')||
'<table cellpadding="0" border="0" cellspacing="0" summary="" class="DkBlogHorizontalBorder" id="report_data_#REGION_STATIC_ID#">',
  p_row_template_after_rows =>'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'<tr><td class="DkBlogBottom" colspan="99">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th #ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="DkBlogPagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="#IMAGE_PREFIX#blog/images/paginate_next.gif" alt="Next" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="#IMAGE_PREFIX#blog/images/paginate_prev.gif" alt="Previous" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img style="vertical-align:middle" src="#IMAGE_PREFIX#blog/images/paginate_next.gif" alt="Next" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img style="vertical-align:middle"" src="#IMAGE_PREFIX#blog/images/paginate_prev.gif" alt="Previous" /></a>',
  p_row_style_checked=>'#6CAAD9',
  p_theme_id  => 202,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 166359480355790001 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 757701078791894939
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td class="DkBlogData " #ALIGNMENT#>#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 757701078791894939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="">'||unistr('\000a')||
'#TOP_PAGINATION#'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="DkBlogStandard">',
  p_row_template_after_rows =>'</table></td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'#PAGINATION#'||unistr('\000a')||
'<tr><td class="DkBlogBottom" colspan="99">#EXTERNAL_LINK##CSV_LINK#</td></tr>'||unistr('\000a')||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="DkBlogHeader" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_pagination_template=>'<span class="DkBlogPagination">#TEXT#</span>',
  p_next_page_template=>'<a href="#LINK#"><img align="absmiddle" src="#IMAGE_PREFIX#blog/images/paginate_next.gif" alt="Next" /></a>',
  p_previous_page_template=>'<a href="#LINK#"><img align="absmiddle" src="#IMAGE_PREFIX#blog/images/paginate_prev.gif" alt="Previous" /></a>',
  p_next_set_template=>'<a href="#LINK#"><img align="absmiddle" src="#IMAGE_PREFIX#blog/images/paginate_next.gif" alt="Next" /></a>',
  p_previous_set_template=>'<a href="#LINK#"><img align="absmiddle" src="#IMAGE_PREFIX#blog/images/paginate_prev.gif" alt="Previous" /></a>',
  p_row_style_checked=>'#6CAAD9',
  p_theme_id  => 202,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 757701078791894939 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/required_label_with_help
prompt  ......label template 159706793744326721
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 159706793744326721 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#blog/images/required.png" alt="Required Field" /><a class="DkBlogLabelWithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/tooltip_optional_label_with_help
prompt  ......label template 178053521097606223
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 178053521097606223 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Tooltip Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><a class="DkBlogLabelWithHelp" rel="htmltooltip" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 6,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/tooltip_of_red_asterisk_required_label_with_help
prompt  ......label template 178057391399363568
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 178057391399363568 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Tooltip of Red asterisk Required Label with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#blog/images/required.png" alt="Required Field" /><a class="DkBlogLabelWithHelp"  rel="htmltooltip" >',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 7,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 757701362330894939
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 757701362330894939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="hideMe508">',
  p_template_body2=>'</span>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label
prompt  ......label template 757701470883894939
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 757701470883894939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><span class="DkBlogLabel">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_label_with_help
prompt  ......label template 757701556448894939
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 757701556448894939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><a class="DkBlogLabelWithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_label
prompt  ......label template 757701664700894939
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 757701664700894939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required Label',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#blog/images/required.png" alt="Required Field" /><span class="DkBlogLabel">',
  p_template_body2=>'</span></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/red_asterisk_required_label_with_help
prompt  ......label template 758191366163811967
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 758191366163811967 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Red asterisk Required Label with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#blog/images/required.png" alt="Required Field" /><a class="DkBlogLabelWithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_before_item=>'',
  p_after_item=>'',
  p_on_error_before_label=>'',
  p_on_error_after_label=>'',
  p_theme_id  => 202,
  p_theme_class_id => 5,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 757701870397894939
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 757701870397894939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t12BreadcrumbMenu">',
  p_current_page_option=>'#NAME#',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => 202,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 757702652855894940
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 757702652855894940 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list_gray.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link href="#IMAGE_PREFIX#blog/css/blog.min.css" rel="stylesheet" type="text/css"/>',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t12PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t12PopupBody">',
  p_theme_id  => 202,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 757702079806894939
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 757702079806894939 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<td width="100">#IDAY#</td>',
  p_month_title_format=> '<table class="t12StandardCalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td align="center" class="formRegionHeader">#IMONTH#&nbsp;#YYYY#</td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>',
  p_month_open_format=> '<table class="t12StandardCalendar" width="100%" cellpadding="0" cellspacing="0" border="0" cellspacing="0" summary="">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td align="center"  class="formRegionHeader"><table cellspacing="2" cellpadding="2" summary="">',
  p_month_close_format=> '    </table></td>'||unistr('\000a')||
'  </tr>'||unistr('\000a')||
'</table>',
  p_day_title_format=> '#DD#<br/><span style="font-weight:bold">'||unistr('\000a')||
'',
  p_day_open_format=> '<td valign="top" width="100" class="formRegionBody">'||unistr('\000a')||
'',
  p_day_close_format=> '</span>&nbsp;</td>',
  p_today_open_format=> '<td valign="top" class="formRegionBodyCurrent">',
  p_weekend_title_format=> '<div>#DD#</div><span style="font-weight:bold">'||unistr('\000a')||
'',
  p_weekend_open_format => '<td valign="top" class="formRegionBodyWE">'||unistr('\000a')||
'',
  p_weekend_close_format => '<span></td>',
  p_nonday_title_format => '<div>&nbsp;</div>',
  p_nonday_open_format => '<td valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr class="formRegionHeader">',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t12WeekCalendarHolder">'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td class="t12MonthTitle" id="test">#WTITLE#</td>'||unistr('\000a')||
'</tr>'||unistr('\000a')||
'<tr>'||unistr('\000a')||
'<td>',
  p_weekly_day_of_week_format => '<th class="t12DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="0" summary="0" class="t12WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t12Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t12Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t12NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t12Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t12DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t12DayCalendarHolder"> <tr> <td class="t12MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||unistr('\000a')||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="0" summary="0" class="t12DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t12Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t12Today">',
  p_daily_time_open_format => '<th class="t12Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_cust_month_title_format => '',
  p_cust_day_of_week_format => '',
  p_cust_month_open_format => '',
  p_cust_month_close_format => '',
  p_cust_week_title_format => '',
  p_cust_week_open_format => '',
  p_cust_week_close_format => '',
  p_cust_day_title_format => '',
  p_cust_day_open_format => '',
  p_cust_day_close_format => '',
  p_cust_today_open_format => '',
  p_cust_daily_title_format => '',
  p_cust_daily_open_format => '',
  p_cust_daily_close_format => '',
  p_cust_nonday_title_format => '',
  p_cust_nonday_open_format => '',
  p_cust_nonday_close_format => '',
  p_cust_weekend_title_format => '',
  p_cust_weekend_open_format => '',
  p_cust_weekend_close_format => '',
  p_cust_hour_open_format => '',
  p_cust_hour_close_format => '',
  p_cust_time_title_format => '',
  p_cust_time_open_format => '',
  p_cust_time_close_format => '',
  p_cust_wk_month_title_format => '',
  p_cust_wk_day_of_week_format => '',
  p_cust_wk_month_open_format => '',
  p_cust_wk_month_close_format => '',
  p_cust_wk_week_title_format => '',
  p_cust_wk_week_open_format => '',
  p_cust_wk_week_close_format => '',
  p_cust_wk_day_title_format => '',
  p_cust_wk_day_open_format => '',
  p_cust_wk_day_close_format => '',
  p_cust_wk_today_open_format => '',
  p_cust_wk_weekend_title_format => '',
  p_cust_wk_weekend_open_format => '',
  p_cust_wk_weekend_close_format => '',
  p_cust_month_day_height_pix => '',
  p_cust_month_day_height_per => '',
  p_cust_week_day_width_pix => '',
  p_cust_week_day_width_per => '',
  p_theme_id  => 202,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/dkblog
prompt  ......theme 757702777440894940
begin
wwv_flow_api.create_theme (
  p_id =>757702777440894940 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => 202,
  p_theme_name=>'DkBlog',
  p_default_page_template=>757725673583542459 + wwv_flow_api.g_id_offset,
  p_error_template=>757725673583542459 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>757725673583542459 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>757695471956894934 + wwv_flow_api.g_id_offset,
  p_default_button_template=>180718636594197846 + wwv_flow_api.g_id_offset,
  p_default_region_template=>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_irr_template=>758174573175603752 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>757701078791894939 + wwv_flow_api.g_id_offset,
  p_default_label_template=>757701470883894939 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>757701870397894939 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>757702079806894939 + wwv_flow_api.g_id_offset,
  p_default_list_template=>757732855915707081 + wwv_flow_api.g_id_offset,
  p_default_option_label=>757701556448894939 + wwv_flow_api.g_id_offset,
  p_theme_description=>'DkBlog Template'||unistr('\000a')||
'CSS StyleSheet by David Herreman'||unistr('\000a')||
'http://www.free-css-templates.com',
  p_default_required_label=>757701782132894939 + wwv_flow_api.g_id_offset);
end;
/
 
prompt  ...build options used by application 100
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/language
prompt  ...Language Maps for Application 100
--
 
begin
 
null;
 
end;
/

--application/shared_components/globalization/messages
prompt  ...messages used by application: 100
--
--application/shared_components/globalization/dyntranslations
prompt  ...dynamic translations used by application: 100
--
prompt  ...Shortcuts
--
--application/shared_components/user_interface/shortcuts/text_edit
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<script type="text/javascript">'||unistr('\000a')||
' <!--'||unistr('\000a')||
'    var textEd = $x(''#CURRENT_ITEM_NAME#'');'||unistr('\000a')||
'    var textName = ''#CURRENT_ITEM_NAME#'';'||unistr('\000a')||
' -->'||unistr('\000a')||
'</script>';

wwv_flow_api.create_shortcut (
 p_id=> 159214321299488625 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'TEXT_EDIT',
 p_shortcut_type=> 'HTML_TEXT',
 p_shortcut=> c1);
end;
null;
 
end;
/

--application/shared_components/user_interface/shortcuts/formatting_buttons
 
begin
 
declare
  c1 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<table cellpadding="2" cellspacing="0" border="0">'||unistr('\000a')||
'  <tr>'||unistr('\000a')||
'    <td><a href="#" onclick="styleTag(''b'',textEd);return false;" title="Click for bold">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#blog/images/text-bold-20x22.gif" width="20" height="22" border="0" alt="Click for bold"></a>'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'    <td><a href="#" onclick="styleTag(''i'',textEd);return false;" title="Click for italics"> '||unistr('\000a')||
'        <img src="#IMAGE_';

c1:=c1||'PREFIX#blog/images/text-italics-20x22.gif" width="20" height="22" border="0" alt="Click for italics"></a>'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'    <td><a href="#" onclick="styleTag(''u'',textEd);return false;" title="Click for underline">'||unistr('\000a')||
'      <img src="#IMAGE_PREFIX#blog/images/text-underline-20x22.gif" width="20" height="22" border="0" alt="Click for underline"></a>'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'    <td><a href="#" onclick="styleTag(''code'',te';

c1:=c1||'xtEd);return false;" title="Click for code">'||unistr('\000a')||
'        <img src="#IMAGE_PREFIX#blog/images/code.jpg" width="20" height="22" border="0" alt="Click for code"></a>'||unistr('\000a')||
'    </td>'||unistr('\000a')||
'    </tr>'||unistr('\000a')||
'</table>';

wwv_flow_api.create_shortcut (
 p_id=> 159215029395500396 + wwv_flow_api.g_id_offset,
 p_flow_id=> wwv_flow.g_flow_id,
 p_shortcut_name=> 'FORMATTING_BUTTONS',
 p_shortcut_type=> 'HTML_TEXT',
 p_shortcut=> c1);
end;
null;
 
end;
/

prompt  ...web services (9iR2 or better)
--
prompt  ...shared queries
--
prompt  ...report layouts
--
prompt  ...authentication schemes
--
--application/shared_components/security/authentication/custom_scheme
prompt  ......authentication 160013139029651428
 
begin
 
wwv_flow_api.create_authentication (
  p_id => 160013139029651428 + wwv_flow_api.g_id_offset
 ,p_flow_id => wwv_flow.g_flow_id
 ,p_name => 'CUSTOM SCHEME'
 ,p_scheme_type => 'NATIVE_CUSTOM'
 ,p_attribute_03 => 'blog_auth'
 ,p_attribute_05 => 'N'
 ,p_invalid_session_type => 'LOGIN'
 ,p_logout_url => 'f?p=&APP_ID.:19'
 ,p_use_secure_cookie_yn => 'N'
 ,p_comments => 'This custom authentication scheme is based on the username and password values stored in custom table.'
  );
null;
 
end;
/

prompt  ...plugins
--
prompt  ...load tables
--
--application/deployment/definition
prompt  ...application deployment
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
begin
s := null;
wwv_flow_api.create_install (
  p_id => 159129968175073220 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_include_in_export_yn => 'Y',
  p_welcome_message => 'This application installer will guide you through the process of creating your database objects and seed data.',
  p_configuration_message => 'You can configure the following attributes of your application.',
  p_build_options_message => 'You can choose to include the following build options.',
  p_validation_message => 'The following validations will be performed to ensure your system is compatible with this application.',
  p_install_message=> 'Please confirm that you would like to install this application''s supporting objects.',
  p_install_success_message => 'Your application''s supporting objects have been installed.',
  p_install_failure_message => 'Installation of database objects and seed data has failed.',
  p_upgrade_message => 'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.',
  p_upgrade_confirm_message => 'Please confirm that you would like to install this application''s supporting objects.',
  p_upgrade_success_message => 'Your application''s supporting objects have been installed.',
  p_upgrade_failure_message => 'Installation of database objects and seed data has failed.',
  p_deinstall_success_message => 'Deinstallation complete.',
  p_deinstall_script_clob => s,
  p_prompt_sub_string_01 => 'Y',
  p_install_prompt_01    => 'Enter APPLICATION_NAME. It is visible in the header of every page.',
  p_prompt_sub_string_02 => 'Y',
  p_install_prompt_02    => 'Enter BLOGGER_NAME. It is used in notifications about new comments.',
  p_prompt_sub_string_03 => 'Y',
  p_install_prompt_03    => 'Enter BLOG_EMAIL. This email is used to send notification emails on blog activities. Must exist in blog_reg_user table.',
  p_prompt_sub_string_04 => 'Y',
  p_install_prompt_04    => 'Enter GOOGLE_API_KEY. This is Google API key for JSAPI. Leave empty if feature is not used.',
  p_prompt_sub_string_05 => 'Y',
  p_install_prompt_05    => 'Enter GOOGLE_ANALYTICS_ACCOUNT_NUM. This is Google Analytics Account Number. Leave empty if feature is not used.',
  p_prompt_sub_string_06 => 'Y',
  p_install_prompt_06    => 'Enter WEBSITE. This is used in email sendings as a reference to the site. Should be in the form: www.example/dad_string',
  p_prompt_sub_string_07 => 'Y',
  p_install_prompt_07    => 'Enter BLOG_DATE_FORMAT.',
  p_required_free_kb => 100,
  p_required_sys_privs => 'CREATE MATERIALIZED VIEW:CREATE PROCEDURE:CREATE SEQUENCE:CREATE SYNONYM:CREATE TABLE:CREATE TRIGGER:CREATE TYPE :CREATE VIEW',
  p_deinstall_message=> '');
end;
 
 
end;
/

--application/deployment/install
prompt  ...application install scripts
--
 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE SEQUENCE BLOG_SEQ MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 200 CACHE 20 NOORDER NOCYCLE;'||unistr('\000a')||
'CREATE OR REPLACE TYPE BLOG_TABLETYPE AS TABLE OF VARCHAR2(30)'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PACKAGE "BLOG_RANDOM"'||unistr('\000a')||
'IS'||unistr('\000a')||
'FUNCTION rand'||unistr('\000a')||
'  RETURN NUMBER;'||unistr('\000a')||
'  pragma restrict_references( rand, WNDS );'||unistr('\000a')||
'END BLOG_RANDOM;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PACKAGE BODY "BLOG_RANDOM"'||unistr('\000a')||
'IS'||unistr('\000a')||
'  multiplier CONSTANT';

s:=s||' NUMBER := 22695477;'||unistr('\000a')||
'  increment  CONSTANT NUMBER := 1;'||unistr('\000a')||
'  "2^32"     CONSTANT NUMBER := 2 ** 32;'||unistr('\000a')||
'  "2^16"     CONSTANT NUMBER := 2 ** 16;'||unistr('\000a')||
'  "0x7fff"   CONSTANT NUMBER := 32767;'||unistr('\000a')||
'  Seed       NUMBER          := 1;'||unistr('\000a')||
'  --'||unistr('\000a')||
'FUNCTION rand'||unistr('\000a')||
'  RETURN NUMBER'||unistr('\000a')||
'IS'||unistr('\000a')||
'  s NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  seed := mod( multiplier * seed + increment, "2^32" );'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    RETURN bitand( seed/"2^16", "0x7fff" );'||unistr('\000a')||
'    --mhichwa'||unistr('\000a')||
'  EXCEPTIO';

s:=s||'N'||unistr('\000a')||
'  WHEN OTHERS THEN'||unistr('\000a')||
'    SELECT BLOG_SEQ.nextval'||unistr('\000a')||
'    INTO s'||unistr('\000a')||
'    FROM dual;'||unistr('\000a')||
'    RETURN s||TO_CHAR(sysdate,''HH24MISS'');'||unistr('\000a')||
'  END;'||unistr('\000a')||
'END rand;'||unistr('\000a')||
'--'||unistr('\000a')||
'END BLOG_RANDOM;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PACKAGE BLOG_ID'||unistr('\000a')||
'AS'||unistr('\000a')||
'FUNCTION curr_val'||unistr('\000a')||
'  RETURN NUMBER;'||unistr('\000a')||
'  pragma restrict_references( curr_val, wnds, rnds, wnps );'||unistr('\000a')||
'  --'||unistr('\000a')||
'FUNCTION next_val'||unistr('\000a')||
'  RETURN NUMBER;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PACKAGE BODY "BLOG_ID"'||unistr('\000a')||
'AS'||unistr('\000a')||
'  g_curr_val NUMBER ';

s:=s||'DEFAULT NULL;'||unistr('\000a')||
'FUNCTION curr_val'||unistr('\000a')||
'  RETURN NUMBER'||unistr('\000a')||
'IS'||unistr('\000a')||
'  ate_not_yet_defined EXCEPTION;'||unistr('\000a')||
'  pragma exception_init( ate_not_yet_defined, -8002 );'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF ( g_curr_val IS NULL ) THEN'||unistr('\000a')||
'    raise ate_not_yet_defined;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  RETURN g_curr_val;'||unistr('\000a')||
'END curr_val;'||unistr('\000a')||
'FUNCTION next_val'||unistr('\000a')||
'  RETURN NUMBER'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  SELECT to_number( TO_CHAR(blog_seq.nextval)'||unistr('\000a')||
'    || lpad( SUBSTR( ABS(BLOG_RANDOM.rand), 1, 5 ),5, ''0''';

s:=s||' )'||unistr('\000a')||
'    || ltrim(TO_CHAR(mod(ABS(dbms_utility.get_time),1000000),''000000'')) )'||unistr('\000a')||
'  INTO g_curr_val'||unistr('\000a')||
'  FROM dual;'||unistr('\000a')||
'  RETURN g_curr_val;'||unistr('\000a')||
'END next_val;'||unistr('\000a')||
'END blog_id;'||unistr('\000a')||
'/'||unistr('\000a')||
''||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 125399629357254427 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Sequences and Types',
  p_sequence=> 10,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_ACTIVITY_LOG'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_ACTIVITY_LOG('||unistr('\000a')||
'    TIME_STAMP   DATE NOT NULL ENABLE,'||unistr('\000a')||
'    COOKIE_ID    NUMBER,'||unistr('\000a')||
'    PAGE_ID      NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    SESSION_ID   NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    IP_ADDRESS   VARCHAR2(4000 BYTE),'||unistr('\000a')||
'    USER_AGENT   VARCHAR2(4000 BYT';

s:=s||'E),'||unistr('\000a')||
'    MONTH        NUMBER,'||unistr('\000a')||
'    LAT          VARCHAR2(200 BYTE),'||unistr('\000a')||
'    LONGT        VARCHAR2(200 BYTE),'||unistr('\000a')||
'    CITY         VARCHAR2(200 BYTE),'||unistr('\000a')||
'    REGION       VARCHAR2(200 BYTE),'||unistr('\000a')||
'    COUNTRY      VARCHAR2(200 BYTE),'||unistr('\000a')||
'    COUNTRY_CODE VARCHAR2(200 BYTE)'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE INDEX BLOG_ACTIVITY_LOG_IDX1 ON BLOG_ACTIVITY_LOG(SESSION_ID);'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_ACTIVITY_LOG_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE O';

s:=s||'N BLOG_ACTIVITY_LOG FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN :NEW.time_stamp := SYSDATE;'||unistr('\000a')||
'    :NEW.month := TO_NUMBER(TO_CHAR(SYSDATE,''MM''));'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.country := upper(:NEW.country);'||unistr('\000a')||
'  :NEW.country_code := upper(:NEW.country_code);'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLOG_ACTIVITY_LOG_TRG ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_REG_USERS'||unistr('\000a')||
'----------------------';

s:=s||'----------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_REG_USERS('||unistr('\000a')||
'    HTTP_USER_AGENT VARCHAR2(255 BYTE),'||unistr('\000a')||
'    HTTP_REFERER    VARCHAR2(255 BYTE),'||unistr('\000a')||
'    HOST_NAME       VARCHAR2(1 BYTE),'||unistr('\000a')||
'    RESERVED        VARCHAR2(1 BYTE),'||unistr('\000a')||
'    REMOTE_ADDR     VARCHAR2(30 BYTE),'||unistr('\000a')||
'    ID              NUMBER,'||unistr('\000a')||
'    EMAIL           VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    FNAME           VARCHAR2(30 BYTE),'||unistr('\000a')||
'    LNAME         ';

s:=s||'  VARCHAR2(30 BYTE),'||unistr('\000a')||
'    LOCATION        VARCHAR2(30 BYTE),'||unistr('\000a')||
'    TITLE           VARCHAR2(30 BYTE),'||unistr('\000a')||
'    ORG             VARCHAR2(30 BYTE),'||unistr('\000a')||
'    YEARS_EXP       VARCHAR2(10 BYTE),'||unistr('\000a')||
'    CREATED_ON      DATE NOT NULL ENABLE,'||unistr('\000a')||
'    CREATED_BY      VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    MODIFIED_ON     DATE,'||unistr('\000a')||
'    MODIFIED_BY     VARCHAR2(255 BYTE),'||unistr('\000a')||
'    PASSWORD        VARCHAR2(2000 BYTE),'||unistr('\000a')||
'    NICK          ';

s:=s||'  VARCHAR2(4000 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_REG_USERS_PK PRIMARY KEY (ID),'||unistr('\000a')||
'    CONSTRAINT BLOG_REG_USERS_UK1 UNIQUE (EMAIL)'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE INDEX BLOG_REG_USERS_IDX1 ON BLOG_REG_USERS(NICK);'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_REG_USERS_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_REG_USERS FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.id IS NULL THEN'||unistr('\000a')||
'      :NEW.id := blog_id.next_val;'||unistr('\000a')||
'    END';

s:=s||' IF;'||unistr('\000a')||
'    :NEW.created_on := SYSDATE;'||unistr('\000a')||
'    :NEW.created_by := NVL(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF updating THEN'||unistr('\000a')||
'    :NEW.modified_on := SYSDATE;'||unistr('\000a')||
'    :NEW.modified_by := NVL(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLOG_REG_USERS_TRG ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_ADMINISTRATORS'||unistr('\000a')||
'---------------------------------------------------';

s:=s||'-----'||unistr('\000a')||
'CREATE TABLE BLOG_ADMINISTRATORS('||unistr('\000a')||
'    ID         NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    USERID     VARCHAR2(100 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    CREATED_ON DATE NOT NULL ENABLE,'||unistr('\000a')||
'    CREATED_BY VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_ADMINISTRATORS_PK PRIMARY KEY (ID),'||unistr('\000a')||
'    CONSTRAINT BLOG_ADMINISTRATORS_UK1 UNIQUE (USERID),'||unistr('\000a')||
'    CONSTRAINT BLOG_ADMINISTRATORS_FK1 FOREIGN KEY (USERID) REFERENCES';

s:=s||' BLOG_REG_USERS (EMAIL) ON DELETE CASCADE ENABLE'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_ADMINISTRATORS_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_ADMINISTRATORS FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.id IS NULL THEN'||unistr('\000a')||
'      :NEW.id := BLOG_ID.next_val;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.created_on := SYSDATE;'||unistr('\000a')||
'   :NEW.created_by := NVL(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.userid := upper(:NEW.userid);'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'A';

s:=s||'LTER TRIGGER BLOG_ADMINISTRATORS_TRG ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_CATEGORIES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_CATEGORIES('||unistr('\000a')||
'    ID                 NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    CATEGORY_NAME      VARCHAR2(30 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    CATEGORY_PARENT_ID NUMBER,'||unistr('\000a')||
'    ACTIVE             VARCHAR2(1 BYTE),'||unistr('\000a')||
'';

s:=s||'    PAGE_ID            NUMBER,'||unistr('\000a')||
'    HTTP_LINK          VARCHAR2(100 BYTE),'||unistr('\000a')||
'    SORT_ORDER         NUMBER,'||unistr('\000a')||
'    CONSTRAINT BLOG_CATEGORIES_PK PRIMARY KEY (ID)'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_CATEGORIES_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_CATEGORIES FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.id IS NULL THEN'||unistr('\000a')||
'      :NEW.id := blog_id.next_val;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLO';

s:=s||'G_CATEGORIES_TRG ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_MESSAGES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_MESSAGES('||unistr('\000a')||
'    ID              NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    MSG_ID          NUMBER,'||unistr('\000a')||
'    MSG_TYPE        VARCHAR2(30 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    MSG_SUBJECT     VARCHAR2(3000 BYTE),'||unistr('\000a')||
'    MSG_TEXT        CLOB,'||unistr('\000a')||
'    CAT';

s:=s||'EGORY_ID     NUMBER,'||unistr('\000a')||
'    EXPIRE_DATE     DATE,'||unistr('\000a')||
'    VIEWED          NUMBER,'||unistr('\000a')||
'    RSS_DESCRIPTION VARCHAR2(200 BYTE),'||unistr('\000a')||
'    FOLLOWUP_NOTIFY VARCHAR2(1 BYTE),'||unistr('\000a')||
'    SESSION_ID      NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    CREATED_ON      DATE NOT NULL ENABLE,'||unistr('\000a')||
'    CREATED_BY_ID   NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    MODIFIED_ON     DATE,'||unistr('\000a')||
'    MODIFIED_BY_ID  NUMBER,'||unistr('\000a')||
'    CONSTRAINT BLOG_MESSAGES_PK PRIMARY KEY (ID),'||unistr('\000a')||
'    CONSTRAIN';

s:=s||'T BLOG_MESSAGES_FK1 FOREIGN KEY (MSG_ID) REFERENCES BLOG_MESSAGES (ID) ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_MESSAGES_FK2 FOREIGN KEY (CREATED_BY_ID) REFERENCES BLOG_REG_USERS (ID) ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_MESSAGES_FK3 FOREIGN KEY (MODIFIED_BY_ID) REFERENCES BLOG_REG_USERS (ID) ENABLE'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE INDEX BLOG_MESSAGES_IDX1 ON BLOG_MESSAGES (CATEGORY_ID);'||unistr('\000a')||
'CREATE INDEX BLOG_MESSAGES_IDX2 ON BLOG_MESSAGES (MSG_';

s:=s||'TYPE);'||unistr('\000a')||
'CREATE INDEX BLOG_MESSAGES_IDX3 ON BLOG_MESSAGES (CREATED_BY_ID);'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_MESSAGES_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_MESSAGES FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.id IS NULL THEN'||unistr('\000a')||
'      :NEW.id := blog_id.next_val;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    :NEW.created_on := SYSDATE;'||unistr('\000a')||
'    :NEW.session_id := v(''APP_SESSION'');'||unistr('\000a')||
'/*'||unistr('\000a')||
'    FOR c1 IN('||unistr('\000a')||
'      SELECT email'||unistr('\000a')||
'      FROM BLO';

s:=s||'G_BAD_EMAILS'||unistr('\000a')||
'      WHERE UPPER(email) IN (SELECT UPPER(email) FROM blog_reg_users WHERE id = UPPER(:NEW.created_by_id))'||unistr('\000a')||
'    )LOOP'||unistr('\000a')||
'      raise_application_error(-20001,''Invalid EMAIL. You cannot use '' || c1.email || '' anymore on this site'');'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'*/'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF updating THEN'||unistr('\000a')||
'    :NEW.modified_on := SYSDATE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLOG_MESSAGES_TRG ENABLE;'||unistr('\000a')||
'-----------------------';

s:=s||'---------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_ARTICLE_LOG$'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_ARTICLE_LOG$('||unistr('\000a')||
'    ID              NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    LOG_TYPE        VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    ARTICLE_ID      NUMBER,'||unistr('\000a')||
'    CATEGORY_ID     NUMBER,'||unistr('\000a')||
'    SEARCH_CRITERIA VARCHAR2(1000 BYTE),'||unistr('\000a')||
'    EMAIL           VARCHAR2(255 BYTE),'||unistr('\000a')||
'    ';

s:=s||'ACCESS_DATE     DATE NOT NULL ENABLE,'||unistr('\000a')||
'    REMOTE_ADDR     VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    HTTP_USER_AGENT VARCHAR2(255 BYTE),'||unistr('\000a')||
'    HTTP_REFERER    VARCHAR2(255 BYTE),'||unistr('\000a')||
'    HOST_NAME       VARCHAR2(255 BYTE),'||unistr('\000a')||
'    SESSION_ID      NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    LOCATION        VARCHAR2(2000 BYTE),'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLE_LOG$_PK PRIMARY KEY (ID),'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLE_LOG$_CHK1 CHECK (LO';

s:=s||'G_TYPE IN (''ACCESS'', ''SEARCH'', ''CATEGORY'')) ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLE_LOG$_FK1 FOREIGN KEY (ARTICLE_ID) REFERENCES BLOG_MESSAGES (ID) ON DELETE CASCADE ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLE_LOG$_FK2 FOREIGN KEY (CATEGORY_ID) REFERENCES BLOG_CATEGORIES (ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE INDEX BLOG_ARTICLE_LOG$_IDX1 ON BLOG_ARTICLE_LOG$ (LOG_TYPE);'||unistr('\000a')||
'CREATE INDEX BLOG_ARTICLE_LOG$_IDX2 ON';

s:=s||' BLOG_ARTICLE_LOG$ (ARTICLE_ID);'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_ARTICLE_LOG$_TRG before'||unistr('\000a')||
'  INSERT ON BLOG_ARTICLE_LOG$ FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF :NEW.id IS NULL THEN'||unistr('\000a')||
'    :NEW.id := BLOG_ID.next_val;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF :NEW.session_id IS NULL THEN'||unistr('\000a')||
'    :NEW.session_id  := v(''APP_SESSION_ID'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.access_date := SYSDATE;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLOG_ARTICLE_LOG$_TRG ENABLE;'||unistr('\000a')||
'-----------------------';

s:=s||'---------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_ARTICLE_RATE'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_ARTICLE_RATE('||unistr('\000a')||
'    ARTICLE_ID NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    RATE       NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    CLICKS     NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLE_RATE_PK PRIMARY KEY (ARTICLE_ID),'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLE_RATE_FK1 FOREIGN KEY (ARTICLE_ID) ';

s:=s||'REFERENCES BLOG_MESSAGES (ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
');'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_ARTICLES_HIT20'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_ARTICLES_HIT20('||unistr('\000a')||
'    ARTICLE_ID NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    SUBJECT    VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    HIT_RATIO  NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLE';

s:=s||'S_HIT20_PK PRIMARY KEY (ARTICLE_ID),'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLES_HIT20_FK1 FOREIGN KEY (ARTICLE_ID) REFERENCES BLOG_MESSAGES (ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
');'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_ARTICLES_TOP20'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_ARTICLES_TOP20('||unistr('\000a')||
'    ARTICLE_ID NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    SUBJECT    V';

s:=s||'ARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    THECOUNT   NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLES_TOP20_PK PRIMARY KEY (ARTICLE_ID),'||unistr('\000a')||
'    CONSTRAINT BLOG_ARTICLES_TOP20_FK1 FOREIGN KEY (ARTICLE_ID) REFERENCES BLOG_MESSAGES (ID) ON DELETE CASCADE ENABLE'||unistr('\000a')||
');'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_BAD_EMAILS'||unistr('\000a')||
'-------------------------------------------------';

s:=s||'-------'||unistr('\000a')||
'CREATE TABLE BLOG_BAD_EMAILS('||unistr('\000a')||
'    EMAIL VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_BAD_EMAILS_PK PRIMARY KEY (EMAIL)'||unistr('\000a')||
');'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_DATES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_DATES('||unistr('\000a')||
'    ID        NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    NAME      VARCHAR2(20 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    ';

s:=s||'PARENT_ID NUMBER,'||unistr('\000a')||
'    CONSTRAINT BLOG_DATES_PK PRIMARY KEY (ID),'||unistr('\000a')||
'    CONSTRAINT BLOG_DATES_BLOG_DATES_FK1 FOREIGN KEY (PARENT_ID) REFERENCES BLOG_DATES (ID) ENABLE'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE INDEX BLOG_DATES_IDX1 ON BLOG_DATES (PARENT_ID);'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_DUAL100'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_DUAL100('||unistr('\000a')||
'    I';

s:=s||' NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    CONSTRAINT BLOG_DUAL100_PK PRIMARY KEY (I)'||unistr('\000a')||
');'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_ERROR_LOG'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_ERROR_LOG('||unistr('\000a')||
'    ID              NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    SESSION_ID      NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    APPLICATION_ID  NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    PAGE_ID      ';

s:=s||'   NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    APP_USER        VARCHAR2(255 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    ERR_MESSAGE     VARCHAR2(4000 BYTE),'||unistr('\000a')||
'    DEFINED_MESSAGE VARCHAR2(4000 BYTE),'||unistr('\000a')||
'    ERR_DATE        DATE NOT NULL ENABLE,'||unistr('\000a')||
'    LOG_SEQ_ID      NUMBER,'||unistr('\000a')||
'    CONSTRAINT BLOG_ERROR_LOG_PK PRIMARY KEY (ID)'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_ERROR_LOG before'||unistr('\000a')||
'  INSERT ON BLOG_ERROR_LOG FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THE';

s:=s||'N'||unistr('\000a')||
'    IF :NEW.id IS NULL THEN'||unistr('\000a')||
'      :NEW.ID := blog_id.next_val;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF :NEW.log_seq_id IS NULL THEN'||unistr('\000a')||
'      :NEW.LOG_SEQ_ID := blog_id.next_val;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.SESSION_ID := v(''SESSION'');'||unistr('\000a')||
'   :NEW.APPLICATION_ID := v(''APP_ID'');'||unistr('\000a')||
'   :NEW.PAGE_ID := v(''APP_PAGE_ID'');'||unistr('\000a')||
'   :NEW.APP_USER := v(''APP_USER'');'||unistr('\000a')||
'   :NEW.ERR_DATE := SYSDATE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLOG_ERROR_LOG ENABLE;'||unistr('\000a')||
'--';

s:=s||'------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_FILES'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_FILES('||unistr('\000a')||
'    ID            NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    NAME          VARCHAR2(255 BYTE),'||unistr('\000a')||
'    FILENAME      VARCHAR2(400 BYTE) NOT NULL ENABLE,'||unistr('\000a')||
'    MIME_TYPE     VARCHAR2(48 BYTE),'||unistr('\000a')||
'    DOC_SIZE      NUMBER,'||unistr('\000a')||
'    DAD_CHARSET   VARCHAR2(128 BYTE),';

s:=s||''||unistr('\000a')||
'    CREATED_ON    DATE NOT NULL ENABLE,'||unistr('\000a')||
'    UPDATED_ON    DATE,'||unistr('\000a')||
'    CONTENT_TYPE  VARCHAR2(128 BYTE),'||unistr('\000a')||
'    BLOB_CONTENT  BLOB,'||unistr('\000a')||
'    DESCRIPTION   VARCHAR2(4000 BYTE),'||unistr('\000a')||
'    CATEGORY      VARCHAR2(400 BYTE),'||unistr('\000a')||
'    PUBLISH       VARCHAR2(1 BYTE),'||unistr('\000a')||
'    EXTERNAL_LINK VARCHAR2(2000 BYTE),'||unistr('\000a')||
'    CONSTRAINT BLOG_FILES_PK PRIMARY KEY (ID)'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_FILES_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON ';

s:=s||'BLOG_FILES FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.id IS NULL THEN'||unistr('\000a')||
'      :NEW.id := BLOG_ID.next_val;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    :NEW.created_on := SYSDATE;'||unistr('\000a')||
'    :NEW.category := :NEW.filename;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF updating THEN'||unistr('\000a')||
'    :NEW.updated_on := SYSDATE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLOG_FILES_TRG ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_FILES'||unistr('\000a')||
'------';

s:=s||'--------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_MESSAGES_PREVIEW('||unistr('\000a')||
'    ID              NUMBER NOT NULL ENABLE,'||unistr('\000a')||
'    MSG_ID          NUMBER,'||unistr('\000a')||
'    MSG_TYPE        VARCHAR2(30 BYTE),'||unistr('\000a')||
'    MSG_SUBJECT     VARCHAR2(3000 BYTE),'||unistr('\000a')||
'    MSG_TEXT        CLOB,'||unistr('\000a')||
'    CATEGORY_ID     NUMBER,'||unistr('\000a')||
'    EXPIRE_DATE     DATE,'||unistr('\000a')||
'    VIEWED          NUMBER,'||unistr('\000a')||
'    RSS_DESCRIPTION VARCHAR2(200 BYTE),'||unistr('\000a')||
'    FOLLOWUP_';

s:=s||'NOTIFY VARCHAR2(1 BYTE),'||unistr('\000a')||
'    SESSION_ID      NUMBER,'||unistr('\000a')||
'    CREATED_ON      DATE,'||unistr('\000a')||
'    MODIFIED_ON     DATE,'||unistr('\000a')||
'    CREATED_BY_ID   NUMBER,'||unistr('\000a')||
'    MODIFIED_BY_ID  NUMBER'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE OR REPLACE TRIGGER BLOG_MESSAGES_PREVIEW_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_MESSAGES_PREVIEW FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    :NEW.created_on := sysdate;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  :NEW.modified_on := sysdate;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER';

s:=s||' BLOG_MESSAGES_PREVIEW_TRG ENABLE;'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'--  DDL for Table BLOG_PARAMETERS'||unistr('\000a')||
'--------------------------------------------------------'||unistr('\000a')||
'CREATE TABLE BLOG_PARAMETERS('||unistr('\000a')||
'  PK_ID         NUMBER NOT NULL ,'||unistr('\000a')||
'  PARAM_NAME    VARCHAR2(80) NOT NULL ,'||unistr('\000a')||
'  ITEM_NAME     VARCHAR2(80) NOT NULL ,'||unistr('\000a')||
'  PARAM_VALUE   VARCHAR2(255) ,'||unistr('\000a')||
'  CREATED_ON    DATE NOT NULL ,'||unistr('\000a')||
'  CREATED';

s:=s||'_BY    VARCHAR2(255) NOT NULL ,'||unistr('\000a')||
'  CHANGED_ON    DATE ,'||unistr('\000a')||
'  CHANGED_BY    VARCHAR2(20) ,'||unistr('\000a')||
'  CONSTRAINT BLOG_PARAMETERS_PK PRIMARY KEY ( PK_ID ) ENABLE,'||unistr('\000a')||
'  CONSTRAINT BLOG_PARAMETERS_UK1 UNIQUE(PARAM_NAME),'||unistr('\000a')||
'  CONSTRAINT BLOG_PARAMETERS_UK2 UNIQUE(ITEM_NAME)'||unistr('\000a')||
');'||unistr('\000a')||
'CREATE OR REPLACE'||unistr('\000a')||
'TRIGGER BLOG_PARAMETERS_TRG before'||unistr('\000a')||
'  INSERT OR'||unistr('\000a')||
'  UPDATE ON BLOG_PARAMETERS FOR EACH row'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF inserting THEN'||unistr('\000a')||
'    IF :NEW.P';

s:=s||'K_ID IS NULL THEN'||unistr('\000a')||
'      :NEW.PK_ID := BLOG_ID.next_val;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   :NEW.created_on := SYSDATE;'||unistr('\000a')||
'   :NEW.created_by := NVL(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF updating THEN'||unistr('\000a')||
'   :NEW.changed_on := SYSDATE;'||unistr('\000a')||
'   :NEW.changed_by := NVL(v(''APP_USER''),USER);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'ALTER TRIGGER BLOG_ACTIVITY_LOG_TRG ENABLE;'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 159157485084079514 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Tables',
  p_sequence=> 20,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE OR REPLACE FORCE VIEW VW_BLOG_ARTICLE_ACCESS_LOG'||unistr('\000a')||
'AS'||unistr('\000a')||
'  SELECT id,'||unistr('\000a')||
'    ARTICLE_id,'||unistr('\000a')||
'    email,'||unistr('\000a')||
'    remote_addr,'||unistr('\000a')||
'    http_user_agent,'||unistr('\000a')||
'    http_referer,'||unistr('\000a')||
'    host_name,'||unistr('\000a')||
'    access_date,'||unistr('\000a')||
'    session_id,'||unistr('\000a')||
'    location'||unistr('\000a')||
'  FROM BLOG_ARTICLE_LOG$'||unistr('\000a')||
'  WHERE log_type = ''ACCESS'';'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE FORCE VIEW VW_BLOG_ARTICLE_SEARCH_LOG'||unistr('\000a')||
'AS'||unistr('\000a')||
'  SELECT id,'||unistr('\000a')||
'    search_criteria,'||unistr('\000a')||
'    email,'||unistr('\000a')||
'    access_date,'||unistr('\000a')||
'    remo';

s:=s||'te_addr,'||unistr('\000a')||
'    http_user_agent,'||unistr('\000a')||
'    http_referer,'||unistr('\000a')||
'    host_name,'||unistr('\000a')||
'    session_id'||unistr('\000a')||
'  FROM BLOG_ARTICLE_LOG$'||unistr('\000a')||
'  WHERE log_type = ''SEARCH'';'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE FORCE VIEW VW_BLOG_CALENDAR'||unistr('\000a')||
'AS'||unistr('\000a')||
'  SELECT id,'||unistr('\000a')||
'    name,'||unistr('\000a')||
'    name_1,'||unistr('\000a')||
'    msg_subject,'||unistr('\000a')||
'    parent_id,'||unistr('\000a')||
'    created_on'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    (SELECT b.id,'||unistr('\000a')||
'      d.name name,'||unistr('\000a')||
'      d1.name name_1,'||unistr('\000a')||
'      msg_subject,'||unistr('\000a')||
'      d.id parent_id,'||unistr('\000a')||
'      b.created_on'||unistr('\000a')||
'    FROM b';

s:=s||'log_messages b,'||unistr('\000a')||
'      blog_dates d,'||unistr('\000a')||
'      blog_dates d1'||unistr('\000a')||
'    WHERE msg_type                                      = ''STANDARD'''||unistr('\000a')||
'    AND to_number(TO_CHAR(TRUNC(created_on,''MM''),''MM'')) = d.name'||unistr('\000a')||
'    AND TO_CHAR(TRUNC(created_on,''YYYY''),''YYYY'')        = d1.name'||unistr('\000a')||
'    AND d1.id                                           = d.parent_id'||unistr('\000a')||
'    UNION'||unistr('\000a')||
'    SELECT d.id,'||unistr('\000a')||
'      d.name,'||unistr('\000a')||
'      TO_CHAR(TRUNC(created_on,''Y';

s:=s||'YYY''),''YYYY'') name_1,'||unistr('\000a')||
'      NULL msg_subject,'||unistr('\000a')||
'      NULL parent_id,'||unistr('\000a')||
'      NULL created_on'||unistr('\000a')||
'    FROM blog_messages b,'||unistr('\000a')||
'      blog_dates d'||unistr('\000a')||
'    WHERE msg_type                                = ''STANDARD'''||unistr('\000a')||
'    AND (TO_CHAR(TRUNC(created_on,''YYYY''),''YYYY'') = d.name )'||unistr('\000a')||
'    UNION'||unistr('\000a')||
'    SELECT d.id,'||unistr('\000a')||
'      d.name,'||unistr('\000a')||
'      TO_CHAR(TRUNC(created_on,''YYYY''),''YYYY'') name_1,'||unistr('\000a')||
'      NULL msg_subject,'||unistr('\000a')||
'      d1.id parent_id';

s:=s||','||unistr('\000a')||
'      NULL created_on'||unistr('\000a')||
'    FROM blog_messages b,'||unistr('\000a')||
'      blog_dates d,'||unistr('\000a')||
'      blog_dates d1'||unistr('\000a')||
'    WHERE msg_type                                      = ''STANDARD'''||unistr('\000a')||
'    AND to_number(TO_CHAR(TRUNC(created_on,''MM''),''MM'')) = d.name'||unistr('\000a')||
'    AND TO_CHAR(TRUNC(created_on,''YYYY''),''YYYY'')        = d1.name'||unistr('\000a')||
'    AND d1.id                                           = d.parent_id'||unistr('\000a')||
'    )'||unistr('\000a')||
'  ORDER BY created_on DESC ;'||unistr('\000a')||
''||unistr('\000a')||
'CREA';

s:=s||'TE OR REPLACE FORCE VIEW VW_BLOG_CATEGORY_ACCESS_LOG'||unistr('\000a')||
'AS'||unistr('\000a')||
'  SELECT id,'||unistr('\000a')||
'    category_id,'||unistr('\000a')||
'    email,'||unistr('\000a')||
'    access_date,'||unistr('\000a')||
'    session_id,'||unistr('\000a')||
'    location'||unistr('\000a')||
'  from blog_article_log$'||unistr('\000a')||
'  WHERE log_type = ''CATEGORY'' ;'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE FORCE VIEW VW_BLOG_USER_MESSAGES'||unistr('\000a')||
'AS'||unistr('\000a')||
'  SELECT a.ID,'||unistr('\000a')||
'    a.MSG_ID,'||unistr('\000a')||
'    a.MSG_TYPE,'||unistr('\000a')||
'    a.MSG_SUBJECT,'||unistr('\000a')||
'    a.MSG_TEXT,'||unistr('\000a')||
'    a.CATEGORY_ID,'||unistr('\000a')||
'    a.EXPIRE_DATE,'||unistr('\000a')||
'    a.VIEWED,'||unistr('\000a')||
'    a.RSS_DES';

s:=s||'CRIPTION,'||unistr('\000a')||
'    a.FOLLOWUP_NOTIFY,'||unistr('\000a')||
'    a.SESSION_ID,'||unistr('\000a')||
'    a.CREATED_ON,'||unistr('\000a')||
'    a.MODIFIED_ON,'||unistr('\000a')||
'    a.CREATED_BY_ID,'||unistr('\000a')||
'    a.MODIFIED_BY_ID ,'||unistr('\000a')||
'    b.nick'||unistr('\000a')||
'  FROM blog_messages a,'||unistr('\000a')||
'    blog_reg_users b'||unistr('\000a')||
'  WHERE a.created_by_id = b.id ;'||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE FORCE VIEW VW_LASTDAY_DISTINCT_VISITORS'||unistr('\000a')||
'AS'||unistr('\000a')||
'  SELECT TO_CHAR(MIN(TIME_STAMP),''DD-MON-YYYY HH24:MI:SS'') visit_time,'||unistr('\000a')||
'    IP_ADDRESS,'||unistr('\000a')||
'    LAT,'||unistr('\000a')||
'    LONGT,'||unistr('\000a')||
'    CITY,'||unistr('\000a')||
'';

s:=s||'    REGION,'||unistr('\000a')||
'    COUNTRY,'||unistr('\000a')||
'    COUNTRY_CODE'||unistr('\000a')||
'  FROM BLOG_ACTIVITY_LOG'||unistr('\000a')||
'  WHERE TRUNC(TIME_STAMP) >= TRUNC(sysdate)- 1'||unistr('\000a')||
'  GROUP BY IP_ADDRESS,'||unistr('\000a')||
'    LAT,'||unistr('\000a')||
'    LONGT,'||unistr('\000a')||
'    CITY,'||unistr('\000a')||
'    REGION,'||unistr('\000a')||
'    COUNTRY,'||unistr('\000a')||
'    COUNTRY_CODE'||unistr('\000a')||
'  ORDER BY MIN(TIME_STAMP) DESC ;'||unistr('\000a')||
''||unistr('\000a')||
''||unistr('\000a')||
'CREATE OR REPLACE FORCE VIEW BLOG_MSG'||unistr('\000a')||
'    AS'||unistr('\000a')||
'SELECT a.ID,'||unistr('\000a')||
'  a.MSG_ID,'||unistr('\000a')||
'  a.MSG_TYPE,'||unistr('\000a')||
'  a.MSG_SUBJECT,'||unistr('\000a')||
'  a.MSG_TEXT,'||unistr('\000a')||
'  a.CATEGORY_ID,'||unistr('\000a')||
'  a.EXPIRE_DATE,'||unistr('\000a')||
'  a.VI';

s:=s||'EWED,'||unistr('\000a')||
'  a.RSS_DESCRIPTION,'||unistr('\000a')||
'  a.FOLLOWUP_NOTIFY,'||unistr('\000a')||
'  a.SESSION_ID,'||unistr('\000a')||
'  a.CREATED_ON,'||unistr('\000a')||
'  a.MODIFIED_ON,'||unistr('\000a')||
'  a.CREATED_BY_ID,'||unistr('\000a')||
'  a.MODIFIED_BY_ID ,'||unistr('\000a')||
'  b.nick'||unistr('\000a')||
'FROM blog_messages a,'||unistr('\000a')||
'  blog_reg_users b'||unistr('\000a')||
'WHERE a.created_by_id = b.id;'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 125419355031290248 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Views',
  p_sequence=> 30,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace'||unistr('\000a')||
'PACKAGE "BLOG_API"'||unistr('\000a')||
'AS'||unistr('\000a')||
'  '||unistr('\000a')||
'  g_NEWNEVERREAD          CONSTANT NUMBER := 0;'||unistr('\000a')||
'  g_READNOTANSWERED       CONSTANT NUMBER := 1;'||unistr('\000a')||
'  g_READAWAITINGINFO      CONSTANT NUMBER := 2;'||unistr('\000a')||
'  g_READMOREINFOSUPPLIED  CONSTANT NUMBER := 3;'||unistr('\000a')||
'  g_ANSWEREDDONOTPUBLISH  CONSTANT NUMBER := 4;'||unistr('\000a')||
'  g_ANSWEREDPUBLISH       CONSTANT NUMBER := 5;'||unistr('\000a')||
'  g_DEFERREDANSWERLATER   CONSTANT NUMBER := 6;'||unistr('\000a')||
'  g_ask_cookieversion';

s:=s||'     CONSTANT VARCHAR2(10) := ''1'';'||unistr('\000a')||
'  g_act_cookiename        CONSTANT VARCHAR2(30) := ''activity_dbswh_blog'';'||unistr('\000a')||
'  g_ask_cookiename        CONSTANT VARCHAR2(30) := ''dbswh_blog'';'||unistr('\000a')||
'  g_act_cookieversion     CONSTANT VARCHAR2(10) := ''1'';'||unistr('\000a')||
'  g_ask_cookie_expires    CONSTANT DATE := to_date(''01012020'',''MMDDYYYY'');'||unistr('\000a')||
'  g_act_cookie_expires    CONSTANT DATE := to_date(''01012020'',''MMDDYYYY'');'||unistr('\000a')||
'  g_id              ';

s:=s||'   NUMBER  := NULL;'||unistr('\000a')||
'  g_updating_status_ts BOOLEAN := FALSE;'||unistr('\000a')||
'  g_max_message_length NUMBER  := 20000;'||unistr('\000a')||
'  g_real_update        BOOLEAN := TRUE;'||unistr('\000a')||
'  g_ask_cookie_vals apex_application_global.vc_arr2;'||unistr('\000a')||
'  g_otn_cookie_vals apex_application_global.vc_arr2;  '||unistr('\000a')||
'  g_act_cookie_vals apex_application_global.vc_arr2;'||unistr('\000a')||
'  g_ask_cookie owa_cookie.cookie;'||unistr('\000a')||
'  g_otn_cookie owa_cookie.cookie;'||unistr('\000a')||
'  g_act_cookie owa_cookie.coo';

s:=s||'kie;'||unistr('\000a')||
''||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_blog_url'||unistr('\000a')||
'  RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION is_administrator('||unistr('\000a')||
'    p_userid IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION format_message('||unistr('\000a')||
'    p_s';

s:=s||'tring IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION format_message_into_clob('||unistr('\000a')||
'    p_string IN CLOB,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80'||unistr('\000a')||
'  ) RETURN CLOB;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE format_message('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'';

s:=s||'    p_len    IN NUMBER DEFAULT 80'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_message('||unistr('\000a')||
'    p_string IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION age('||unistr('\000a')||
'    p_date IN DATE'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'---------------------------------------------------------------------';

s:=s||'-----------'||unistr('\000a')||
'  FUNCTION parse_search_string('||unistr('\000a')||
'    p_search_str IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION fetch_activity_cookie_val('||unistr('\000a')||
'    p_val_name IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION fetch_otncookie_val('||unistr('\000a')||
'    p_val_name IN VARCHAR2';

s:=s||''||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION fetch_askcookie_val('||unistr('\000a')||
'    p_val_name IN VARCHAR2'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_askcookie('||unistr('\000a')||
'    p_email     IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_fname     IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_lname     IN VARC';

s:=s||'HAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_location  IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_nickname  IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_job_title IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_org       IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_years     IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE read_otncookie;'||unistr('\000a')||
'----------------------------------------------------------';

s:=s||'----------------------'||unistr('\000a')||
'  PROCEDURE read_askcookie;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE refresh_top_articles;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_access_log('||unistr('\000a')||
'    p_article_id IN VARCHAR2,'||unistr('\000a')||
'    p_email      IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'-----------------------------------------------------------';

s:=s||'---------------------'||unistr('\000a')||
'  PROCEDURE write_search_log('||unistr('\000a')||
'    p_criteria IN VARCHAR2,'||unistr('\000a')||
'    p_email    IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE UPDATE_ADMINISTRATORS('||unistr('\000a')||
'    p_administrator_list IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE notify('||unistr('\000a')||
'    p_article_id IN NUMBER,'||unistr('\000a')||
' ';

s:=s||'   p_user_id    IN NUMBER,'||unistr('\000a')||
'    p_from       IN VARCHAR2,'||unistr('\000a')||
'    p_app_id     IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_comment_followup('||unistr('\000a')||
'    p_article_id NUMBER,'||unistr('\000a')||
'    p_comment    VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE read_activity_cookie;'||unistr('\000a')||
'------------------------';

s:=s||'--------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_activity_cookie('||unistr('\000a')||
'    p_cookie_id IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_activity_log('||unistr('\000a')||
'    p_cookie_id  IN VARCHAR2,'||unistr('\000a')||
'    p_page_id    IN VARCHAR2,'||unistr('\000a')||
'    p_session_id IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'-------------------------------------------------------';

s:=s||'-------------------------'||unistr('\000a')||
'  PROCEDURE add_bad_email('||unistr('\000a')||
'    p_email IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE remove_bad_email('||unistr('\000a')||
'    p_email IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_article('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_subject         IN VARCHAR2 DE';

s:=s||'FAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id          IN NUMBER,'||unistr('\000a')||
'    p_user_id         IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_article('||unistr('\000a')||
'    p_subject         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article      ';

s:=s||'   IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_from_submitter  IN NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id          IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE update_article_preview('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_subject         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article         IN VARCHAR2 DEFAULT ';

s:=s||'NULL,'||unistr('\000a')||
'    p_cat_id          IN NUMBER,'||unistr('\000a')||
'    p_user_id         IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE save_article_preview('||unistr('\000a')||
'    p_id OUT VARCHAR2,'||unistr('\000a')||
'    p_subject         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_from_submitter  IN NUMBER DEFAULT NU';

s:=s||'LL,'||unistr('\000a')||
'    p_cat_id          IN NUMBER'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION format_error('||unistr('\000a')||
'    l_error VARCHAR2,'||unistr('\000a')||
'    l_value NUMBER'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_fk('||unistr('\000a')||
'    p_table    VARCHAR2,'||unistr('\000a')||
'    p_pk_value NUMBER'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'------------------';

s:=s||'--------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION validate_uk('||unistr('\000a')||
'    p_table    VARCHAR2,'||unistr('\000a')||
'    p_pk_value NUMBER'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION format_message('||unistr('\000a')||
'    p_string IN CLOB,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'------------------------------------------------------------';

s:=s||'--------------------'||unistr('\000a')||
'  FUNCTION format_comment('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80'||unistr('\000a')||
'  )  RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION format_article('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'';

s:=s||'  FUNCTION format_followup('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80'||unistr('\000a')||
'  ) RETURN VARCHAR2;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  PROCEDURE write_cat_access_log('||unistr('\000a')||
'    p_cat_id IN VARCHAR2,'||unistr('\000a')||
'    p_email  IN VARCHAR2'||unistr('\000a')||
'  );'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'END BLOG_API;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PACKA';

s:=s||'GE BODY "BLOG_API"'||unistr('\000a')||
'AS'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION get_blog_url'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'  AS'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    RETURN OWA_UTIL.get_cgi_env (''REQUEST_PROTOCOL'') || ''://'''||unistr('\000a')||
'        || OWA_UTIL.get_cgi_env (''HTTP_HOST'')'||unistr('\000a')||
'        || OWA_UTIL.get_cgi_env (''SCRIPT_NAME'') '||unistr('\000a')||
'  ; ';

s:=s||' '||unistr('\000a')||
'  END;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'  FUNCTION is_administrator('||unistr('\000a')||
'    p_userid IN VARCHAR2'||unistr('\000a')||
'  ) RETURN BOOLEAN'||unistr('\000a')||
'  IS'||unistr('\000a')||
'    l_result BOOLEAN := FALSE;'||unistr('\000a')||
'  BEGIN'||unistr('\000a')||
'    FOR c1 IN'||unistr('\000a')||
'    (SELECT 1 FROM BLOG_ADMINISTRATORS a WHERE a.userid = upper(p_userid)'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      l_r';

s:=s||'esult := TRUE;'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    --'||unistr('\000a')||
'    RETURN l_result;'||unistr('\000a')||
'  END is_administrator;'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'--------------------------------------------------------------------------------'||unistr('\000a')||
'FUNCTION list_to_tbl('||unistr('\000a')||
'    p_list IN apex_application_global.vc_arr2 )'||unistr('\000a')||
'  RETURN blog_tabletype'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_returntbl blog_tabletype := blog_tabletype()';

s:=s||';'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_returntbl.extend(p_list.count);'||unistr('\000a')||
'  FOR i IN 1..p_list.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_returntbl( i ) := p_list(i);'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN l_returntbl;'||unistr('\000a')||
'END list_to_tbl;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION fetch_activity_cookie_val('||unistr('\000a')||
'    p_val_name IN VARCHAR2 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_return_value VARCHAR2(1000);'||unistr('\000a')||
'  l_val_name     VARCHAR2(100) := upper(p_val_name);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Note that the cookie must have bee';

s:=s||'n read in the'||unistr('\000a')||
'  -- same database session before this function is called'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF g_act_cookie_vals.count > 0 THEN'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- The first element in the table is the cookie version'||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF g_act_cookie_vals(1) = ''1'' THEN'||unistr('\000a')||
'      IF l_val_name         = ''COOKIE_ID'' THEN'||unistr('\000a')||
'        l_return_value     := g_act_cookie_vals(2);'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    l_return_value := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  ';

s:=s||'--'||unistr('\000a')||
'  RETURN l_return_value;'||unistr('\000a')||
'END fetch_activity_cookie_val;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION fetch_otncookie_val('||unistr('\000a')||
'    p_val_name IN VARCHAR2 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_return_value VARCHAR2(1000);'||unistr('\000a')||
'  l_val_name     VARCHAR2(100) := upper(p_val_name);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF g_otn_cookie_vals.count > 0 THEN'||unistr('\000a')||
'    IF l_val_name            = ''VERSION'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(1);'||unistr('\000a')||
'    elsif l_val_name   ';

s:=s||'      = ''GUID'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(2);'||unistr('\000a')||
'    elsif l_val_name         = ''FNAME'' THEN'||unistr('\000a')||
'      l_return_value        := wwv_flow_utilities.url_decode2(g_otn_cookie_vals(3));'||unistr('\000a')||
'    elsif l_val_name         = ''LNAME'' THEN'||unistr('\000a')||
'      l_return_value        := wwv_flow_utilities.url_decode2(g_otn_cookie_vals(4));'||unistr('\000a')||
'    elsif l_val_name         = ''USERNAME'' THEN'||unistr('\000a')||
'      l_return_value  ';

s:=s||'      := wwv_flow_utilities.url_decode2(g_otn_cookie_vals(5));'||unistr('\000a')||
'    elsif l_val_name         = ''COUNTRY'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(6);'||unistr('\000a')||
'    elsif l_val_name         = ''LANGUAGE'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(7);'||unistr('\000a')||
'    elsif l_val_name         = ''INTEREST1'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(8);'||unistr('\000a')||
'    elsif l_val_name         = ''INTER';

s:=s||'EST2'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(9);'||unistr('\000a')||
'    elsif l_val_name         = ''INTEREST3'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(10);'||unistr('\000a')||
'    elsif l_val_name         = ''INTEREST4'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(11);'||unistr('\000a')||
'    elsif l_val_name         = ''ASCII'' THEN'||unistr('\000a')||
'      l_return_value        := g_otn_cookie_vals(12);'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    l_return_va';

s:=s||'lue := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN l_return_value;'||unistr('\000a')||
'END fetch_otncookie_val;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION fetch_askcookie_val('||unistr('\000a')||
'    p_val_name IN VARCHAR2 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_return_value VARCHAR2(1000);'||unistr('\000a')||
'  l_val_name     VARCHAR2(100) := upper(p_val_name);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Note that the cookie must have been read in the'||unistr('\000a')||
'  -- same database session before this function is called'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF g_ask_cookie_va';

s:=s||'ls.count > 0 THEN'||unistr('\000a')||
'    --'||unistr('\000a')||
'    -- The first element in the table is the cookie version'||unistr('\000a')||
'    --'||unistr('\000a')||
'    IF g_ask_cookie_vals(1) = ''1'' THEN'||unistr('\000a')||
'      IF l_val_name         = ''EMAIL'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(2);'||unistr('\000a')||
'      elsif l_val_name      = ''FNAME'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(3);'||unistr('\000a')||
'      elsif l_val_name      = ''LNAME'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_';

s:=s||'cookie_vals(4);'||unistr('\000a')||
'      elsif l_val_name      = ''LOCATION'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(5);'||unistr('\000a')||
'      elsif l_val_name      = ''NICKNAME'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(6);'||unistr('\000a')||
'      elsif l_val_name      = ''JOB_TITLE'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(7);'||unistr('\000a')||
'      elsif l_val_name      = ''ORG'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(';

s:=s||'8);'||unistr('\000a')||
'      elsif l_val_name      = ''YEARS'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(9);'||unistr('\000a')||
'      elsif l_val_name      = ''HASH'' THEN'||unistr('\000a')||
'        l_return_value     := g_ask_cookie_vals(10);'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    l_return_value := NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  RETURN l_return_value;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  RETURN NULL;'||unistr('\000a')||
'END fetch_askcookie_val;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION force_wrap('||unistr('\000a')||
'    p_strin';

s:=s||'g IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_string VARCHAR2(32767);'||unistr('\000a')||
'  l_result VARCHAR2(32767);'||unistr('\000a')||
'  l_piece  VARCHAR2(32767);'||unistr('\000a')||
'  n        NUMBER;'||unistr('\000a')||
'  l_ws     VARCHAR2(25) DEFAULT '' '' || chr(9);'||unistr('\000a')||
'  l_sep    VARCHAR2(5) DEFAULT '''';'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_string := p_string || chr(10);'||unistr('\000a')||
'  -- Escape message'||unistr('\000a')||
'  -- Cut line short if > p_len characters'||unistr('\000a')||
'  -- Truncate message if > 31000 charact';

s:=s||'ers'||unistr('\000a')||
'  <<outer_loop>> FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN l_string IS NULL;'||unistr('\000a')||
'    n           := instr( l_string, chr(10) );'||unistr('\000a')||
'    l_piece     := SUBSTR( l_string, 1, n-1 );'||unistr('\000a')||
'    l_string    := SUBSTR( l_string, n   +1 );'||unistr('\000a')||
'    FOR j                               IN 1 .. 1000'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      EXIT'||unistr('\000a')||
'    WHEN l_piece IS NULL;'||unistr('\000a')||
'      n          := LENGTH(l_piece);'||unistr('\000a')||
'      IF ( n      > p_len ) THEN'||unistr('\000a')||
'        -';

s:=s||'- locate first '' '' or chr(9)'||unistr('\000a')||
'        n := instr( SUBSTR( TRANSLATE(l_piece,l_ws,rpad('' '',LENGTH(l_ws))), 1, p_len ), '' '', -1 );'||unistr('\000a')||
'        -- if no whitespace, cut line at p_len characters'||unistr('\000a')||
'        IF ( NVL(n,0) = 0 ) THEN'||unistr('\000a')||
'          n          := p_len;'||unistr('\000a')||
'        END IF;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'      l_result := l_result || l_sep || SUBSTR( l_piece, 1, n );'||unistr('\000a')||
'      l_sep    := chr(10);'||unistr('\000a')||
'      l_piece  := SUBSTR( l_p';

s:=s||'iece, n+1 );'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END LOOP outer_loop;'||unistr('\000a')||
'  RETURN l_result;'||unistr('\000a')||
'END force_wrap;'||unistr('\000a')||
'FUNCTION format_message('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_string LONG DEFAULT REPLACE( p_string || chr(32) || chr(10), chr(9), ''    '' );'||unistr('\000a')||
'  l_result LONG DEFAULT NULL;'||unistr('\000a')||
'  l_piece LONG;'||unistr('\000a')||
'  l_ws       VARCHAR2(25) DEFAULT '' '' || chr(9);'||unistr('\000a')||
'  l_sep      VARCHAR2(5) DEFA';

s:=s||'ULT NULL;'||unistr('\000a')||
'  l_endofUrl VARCHAR2(255) DEFAULT chr(10) || chr(13) || chr(9) || '' )<>'';'||unistr('\000a')||
'  n          NUMBER;'||unistr('\000a')||
'  m          NUMBER;'||unistr('\000a')||
'  l_urls owa.vc_arr;'||unistr('\000a')||
'  l_code owa.vc_arr;'||unistr('\000a')||
'type vc_tab'||unistr('\000a')||
'IS'||unistr('\000a')||
'  TABLE OF VARCHAR2(30);'||unistr('\000a')||
'  l_tags vc_tab;'||unistr('\000a')||
'  l_truncated BOOLEAN := false;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_truncated := LENGTH(l_string) >= g_max_message_length;'||unistr('\000a')||
'  wwv_flow.debug(''starting message length: ''||LENGTH(l_string));'||unistr('\000a')||
'  -- list of';

s:=s||' tags to preserve'||unistr('\000a')||
'  l_tags := vc_tab(''<b>'',''</b>'', ''<i>'',''</i>'', ''<u>'',''</u>'', ''<ul>'',''</ul>'', ''<ol>'',''</ol>'', ''<li>'',''</li>'');'||unistr('\000a')||
'  -- find and escape everything inside <code> tags'||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n          := instr( lower(l_string), ''<code>'');'||unistr('\000a')||
'    m          := instr( lower(l_string), ''</code>'', n );'||unistr('\000a')||
'    IF n        > 0 AND m = 0 AND l_truncated THEN'||unistr('\000a')||
'      m        := LENGTH(l_stri';

s:=s||'ng);'||unistr('\000a')||
'      l_string := l_string||''</code>'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n       = 0 OR m = 0;'||unistr('\000a')||
'    l_code(i) := SUBSTR( l_string, n    + LENGTH(''<code>''), (m - n) - LENGTH(''<code>''));'||unistr('\000a')||
'    l_string  := SUBSTR( l_string, 1, n - 1) || ''@$''||i||''$@'' || SUBSTR(l_string, m + LENGTH(''</code>''));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- find and replace URLs with real links (and save'||unistr('\000a')||
'  -- in array until everything else is escaped';

s:=s||')'||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n   := instr( lower(l_string), ''http://'' );'||unistr('\000a')||
'    IF n = 0 THEN'||unistr('\000a')||
'      n := instr( lower(l_string), ''https://'' );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF n = 0 THEN'||unistr('\000a')||
'      n := instr( lower(l_string), ''ftp://'' );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n   = 0;'||unistr('\000a')||
'    FOR j IN 0 .. 255'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF ( instr( l_endofUrl, SUBSTR( l_string, n+j, 1 ) ) > 0 ) THEN'||unistr('\000a')||
'        l_urls(i)                       ';

s:=s||'                  := rtrim( force_wrap(SUBSTR( l_string, n, j ), p_len), ''.''||chr(32)||chr(10) );'||unistr('\000a')||
'        l_urls(i)                                         := ''<a href="'' || l_urls(i) || ''">'' || l_urls(i) || ''</a>'';'||unistr('\000a')||
'        l_string                                          := SUBSTR( l_string, 1, n-1 ) || ''@@''||i|| ''@@'' || SUBSTR( l_string, n+j );'||unistr('\000a')||
'        EXIT;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END LO';

s:=s||'OP;'||unistr('\000a')||
'  l_result := REPLACE(REPLACE( htf.escape_sc(l_string), chr(10), ''<br />''),''   '',''&nbsp; '');'||unistr('\000a')||
'  -- add tags back in'||unistr('\000a')||
'  FOR i IN 1 .. l_tags.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_result := REPLACE( l_result, htf.escape_sc(lower(l_tags(i))),l_tags(i));'||unistr('\000a')||
'    l_result := REPLACE( l_result, htf.escape_sc(upper(l_tags(i))),l_tags(i));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- add URLs back into message'||unistr('\000a')||
'  FOR i IN 1 .. l_urls.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_r';

s:=s||'esult := REPLACE( l_result, ''@@''||i||''@@'', ''<pre>''||l_urls(i)||''</pre>'' );'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- add <code> sections back in'||unistr('\000a')||
'  FOR i IN 1 .. l_code.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF LENGTH(ltrim(l_code(i),chr(10)||'' '')) > 0 THEN'||unistr('\000a')||
'      l_result                              := REPLACE( l_result, ''@$''||i||''$@'', ''<pre>''||SUBSTR(htf.escape_sc(force_wrap(l_code(i),p_len)),1,'||unistr('\000a')||
'      ('||unistr('\000a')||
'        CASE'||unistr('\000a')||
'        WHEN LENGTH(l_resu';

s:=s||'lt) > 31000 THEN'||unistr('\000a')||
'          0'||unistr('\000a')||
'        ELSE'||unistr('\000a')||
'          31000 - LENGTH(l_result)'||unistr('\000a')||
'        END))||''</pre>'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      l_result := REPLACE( l_result, ''@$''||i||''$@'','''');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  wwv_flow.debug(''ending message length: ''||LENGTH(l_result));'||unistr('\000a')||
'  RETURN l_result;'||unistr('\000a')||
'END format_message;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION format_message('||unistr('\000a')||
'    p_string IN CLOB,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'  RETURN VARCHAR2';

s:=s||''||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_string LONG DEFAULT REPLACE( DBMS_LOB.SUBSTR(p_string,32676,1) || chr(32) || chr(10), chr(9), ''    '' );'||unistr('\000a')||
'  l_result LONG DEFAULT NULL;'||unistr('\000a')||
'  l_piece LONG;'||unistr('\000a')||
'  l_ws       VARCHAR2(25) DEFAULT '' '' || chr(9);'||unistr('\000a')||
'  l_sep      VARCHAR2(5) DEFAULT NULL;'||unistr('\000a')||
'  l_endofUrl VARCHAR2(255) DEFAULT chr(10) || chr(13) || chr(9) || '' )<>'';'||unistr('\000a')||
'  n          NUMBER;'||unistr('\000a')||
'  m          NUMBER;'||unistr('\000a')||
'  l_urls owa.vc_arr;'||unistr('\000a')||
'  l_code owa.vc_';

s:=s||'arr;'||unistr('\000a')||
'type vc_tab'||unistr('\000a')||
'IS'||unistr('\000a')||
'  TABLE OF VARCHAR2(30);'||unistr('\000a')||
'  l_tags vc_tab;'||unistr('\000a')||
'  l_truncated BOOLEAN := false;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br/>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br />'','' '');'||unistr('\000a')||
'  l_truncated := dbms_lob.getlength(l_string) >= g_max_message_length;'||unistr('\000a')||
'  wwv_flow.debug(''starting message length: ''||LENGTH(l_string));'||unistr('\000a')||
'  -- list of tags to';

s:=s||' preserve'||unistr('\000a')||
'  l_tags := vc_tab(''<b>'',''</b>'', ''<i>'',''</i>'', ''<u>'',''</u>'', ''<ul>'',''</ul>'', ''<ol>'',''</ol>'', ''<li>'',''</li>'',''<p>'',''</p>'',''<h2>'',''</h2>'',''&nbsp;'',''&rarr;'');'||unistr('\000a')||
'  -- find and escape everything inside <code> tags'||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n          := instr( lower(l_string), ''<code>'');'||unistr('\000a')||
'    m          := instr( lower(l_string), ''</code>'', n );'||unistr('\000a')||
'    IF n        > 0 AND m = 0 AND l_truncate';

s:=s||'d THEN'||unistr('\000a')||
'      m        := LENGTH(l_string);'||unistr('\000a')||
'      l_string := l_string||''</code>'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n       = 0 OR m = 0;'||unistr('\000a')||
'    l_code(i) := SUBSTR( l_string, n    + LENGTH(''<code>''), (m - n) - LENGTH(''<code>''));'||unistr('\000a')||
'    l_string  := SUBSTR( l_string, 1, n - 1) || ''@$''||i||''$@'' || SUBSTR(l_string, m + LENGTH(''</code>''));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- find and replace URLs with real links (and save'||unistr('\000a')||
'  -- in ';

s:=s||'array until everything else is escaped)'||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n   := instr( lower(l_string), ''http://'' );'||unistr('\000a')||
'    IF n = 0 THEN'||unistr('\000a')||
'      n := instr( lower(l_string), ''https://'' );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF n = 0 THEN'||unistr('\000a')||
'      n := instr( lower(l_string), ''ftp://'' );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n   = 0;'||unistr('\000a')||
'    FOR j IN 0 .. 255'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF ( instr( l_endofUrl, SUBSTR( l_string, n+j, 1 ) ) > 0 ) THEN'||unistr('\000a')||
'  ';

s:=s||'      l_urls(i)                                         := rtrim( force_wrap(SUBSTR( l_string, n, j ), p_len), ''.''||chr(32)||chr(10) );'||unistr('\000a')||
'        l_urls(i)                                         := ''<a href="'' || l_urls(i) || ''">'' || l_urls(i) || ''</a>'';'||unistr('\000a')||
'        l_string                                          := SUBSTR( l_string, 1, n-1 ) || ''@@''||i|| ''@@'' || SUBSTR( l_string, n+j );'||unistr('\000a')||
'        EXIT';

s:=s||';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  l_result := REPLACE(htf.escape_sc(l_string),''   '',''&nbsp; '');'||unistr('\000a')||
'  -- add tags back in'||unistr('\000a')||
'  FOR i IN 1 .. l_tags.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_result := REPLACE( l_result, htf.escape_sc(lower(l_tags(i))),l_tags(i));'||unistr('\000a')||
'    l_result := REPLACE( l_result, htf.escape_sc(upper(l_tags(i))),l_tags(i));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- add URLs back into message'||unistr('\000a')||
'  FOR i IN 1 .. l_urls.count'||unistr('\000a')||
'  LOO';

s:=s||'P'||unistr('\000a')||
'    l_result := REPLACE( l_result, ''@@''||i||''@@'', ''<pre>''||l_urls(i)||''</pre>'' );'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- add <code> sections back in'||unistr('\000a')||
'  FOR i IN 1 .. l_code.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF LENGTH(ltrim(l_code(i),chr(10)||'' '')) > 0 THEN'||unistr('\000a')||
'      l_result                              := REPLACE( l_result, ''@$''||i||''$@'', ''<pre>''||SUBSTR(htf.escape_sc(force_wrap(l_code(i),p_len)),1,'||unistr('\000a')||
'      ('||unistr('\000a')||
'        CASE'||unistr('\000a')||
'        WHEN LENG';

s:=s||'TH(l_result) > 31000 THEN'||unistr('\000a')||
'          0'||unistr('\000a')||
'        ELSE'||unistr('\000a')||
'          31000 - LENGTH(l_result)'||unistr('\000a')||
'        END))||''</pre>'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      l_result := REPLACE( l_result, ''@$''||i||''$@'','''');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  wwv_flow.debug(''ending message length: ''||LENGTH(l_result));'||unistr('\000a')||
'  RETURN l_result;'||unistr('\000a')||
'END format_message;'||unistr('\000a')||
'FUNCTION format_message_into_clob('||unistr('\000a')||
'    p_string IN CLOB,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'  RE';

s:=s||'TURN CLOB'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_clob CLOB;'||unistr('\000a')||
'  l_varchar VARCHAR2(32767);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  htp.p(''got here'');'||unistr('\000a')||
'  l_varchar := format_message(p_string, p_len);'||unistr('\000a')||
'  htp.p(''got here 1'');'||unistr('\000a')||
'  dbms_lob.createtemporary(l_clob, false);'||unistr('\000a')||
'  htp.p(''got here 2'');'||unistr('\000a')||
'  dbms_lob.writeappend(l_clob, LENGTH(l_varchar), l_varchar);'||unistr('\000a')||
'  htp.p(''got here 3'');'||unistr('\000a')||
'  RETURN l_clob;'||unistr('\000a')||
'END format_message_into_clob;'||unistr('\000a')||
'PROCEDURE format_message('||unistr('\000a')||
'    p_string IN VARCH';

s:=s||'AR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'AS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  htp.prn( format_message( p_string, p_len ) );'||unistr('\000a')||
'END format_message;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION validate_message('||unistr('\000a')||
'    p_string IN VARCHAR2)'||unistr('\000a')||
'  RETURN BOOLEAN'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_string LONG DEFAULT lower(REPLACE( p_string || chr(32) || chr(10), chr(9), ''    '' ));'||unistr('\000a')||
'  l_open_b_idx      NUMBER;'||unistr('\000a')||
'  l_close_b_idx     NUMBER;'||unistr('\000a')||
'  l_open_i_idx      NUMBER;'||unistr('\000a')||
'  l_close_i_idx     NUMBER;'||unistr('\000a')||
' ';

s:=s||' l_open_u_idx      NUMBER;'||unistr('\000a')||
'  l_close_u_idx     NUMBER;'||unistr('\000a')||
'  l_open_ol_idx     NUMBER;'||unistr('\000a')||
'  l_close_ol_idx    NUMBER;'||unistr('\000a')||
'  l_open_ul_idx     NUMBER;'||unistr('\000a')||
'  l_close_ul_idx    NUMBER;'||unistr('\000a')||
'  l_open_li_idx     NUMBER;'||unistr('\000a')||
'  l_close_li_idx    NUMBER;'||unistr('\000a')||
'  l_open_old_b_idx  NUMBER;'||unistr('\000a')||
'  l_close_old_b_idx NUMBER;'||unistr('\000a')||
'  l_index           NUMBER;'||unistr('\000a')||
'  l_lowest_index    NUMBER;'||unistr('\000a')||
'  l_b_count         NUMBER := 0;'||unistr('\000a')||
'  l_i_count         NUMBER := 0;';

s:=s||''||unistr('\000a')||
'  l_u_count         NUMBER := 0;'||unistr('\000a')||
'  l_ol_count        NUMBER := 0;'||unistr('\000a')||
'  l_ul_count        NUMBER := 0;'||unistr('\000a')||
'  l_li_count        NUMBER := 0;'||unistr('\000a')||
'  l_old_b_count     NUMBER := 0;'||unistr('\000a')||
'  n                 NUMBER;'||unistr('\000a')||
'  m                 NUMBER;'||unistr('\000a')||
'type vc_tab'||unistr('\000a')||
'IS'||unistr('\000a')||
'  TABLE OF VARCHAR2(30);'||unistr('\000a')||
'  l_tags vc_tab;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- find and escape everything inside <code> tags'||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n := instr( lower(l_string), ''<c';

s:=s||'ode>'');'||unistr('\000a')||
'    m := instr( lower(l_string), ''</code>'', n );'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n = 0 AND m = 0;'||unistr('\000a')||
'    IF n = 0 OR m = 0 THEN'||unistr('\000a')||
'      RETURN false;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    l_string := SUBSTR( l_string, 1, n - 1) || ''@$''||i||''$@'' || SUBSTR(l_string, m + 7);'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  l_index := 1;'||unistr('\000a')||
'  FOR i   IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_open_b_idx      :=instr(l_string,''<b>'' ,l_index);'||unistr('\000a')||
'    l_close_b_idx     :=instr(l_string,''</b>'' ,l';

s:=s||'_index);'||unistr('\000a')||
'    l_open_i_idx      :=instr(l_string,''<i>'' ,l_index);'||unistr('\000a')||
'    l_close_i_idx     :=instr(l_string,''</i>'' ,l_index);'||unistr('\000a')||
'    l_open_u_idx      :=instr(l_string,''<u>'' ,l_index);'||unistr('\000a')||
'    l_close_u_idx     :=instr(l_string,''</u>'' ,l_index);'||unistr('\000a')||
'    l_open_ol_idx     :=instr(l_string,''<ol>'' ,l_index);'||unistr('\000a')||
'    l_close_ol_idx    :=instr(l_string,''</ol>'',l_index);'||unistr('\000a')||
'    l_open_ul_idx     :=instr(l_string,''<ul>'' ,l_in';

s:=s||'dex);'||unistr('\000a')||
'    l_close_ul_idx    :=instr(l_string,''</ul>'',l_index);'||unistr('\000a')||
'    l_open_li_idx     :=instr(l_string,''<li>'' ,l_index);'||unistr('\000a')||
'    l_close_li_idx    :=instr(l_string,''</li>'',l_index);'||unistr('\000a')||
'    l_open_old_b_idx  :=instr(l_string,''#B'' ,l_index);'||unistr('\000a')||
'    l_close_old_b_idx :=instr(l_string,''#b'' ,l_index);'||unistr('\000a')||
'    l_lowest_index    := 100000;'||unistr('\000a')||
'    IF l_open_b_idx    > 0 AND l_open_b_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest';

s:=s||'_index  := l_open_b_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_close_b_idx  > 0 AND l_close_b_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_close_b_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_open_i_idx   > 0 AND l_open_i_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_open_i_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_close_i_idx  > 0 AND l_close_i_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_close_i_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_o';

s:=s||'pen_u_idx   > 0 AND l_open_u_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_open_u_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_close_u_idx  > 0 AND l_close_u_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_close_u_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_open_ol_idx  > 0 AND l_open_ol_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_open_ol_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_close_ol_idx > 0 AND l_close_ol_idx < l_lowest_in';

s:=s||'dex THEN'||unistr('\000a')||
'      l_lowest_index := l_close_ol_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_open_ul_idx  > 0 AND l_open_ul_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_open_ul_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_close_ul_idx > 0 AND l_close_ul_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_close_ul_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_open_li_idx  > 0 AND l_open_li_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_open_li_';

s:=s||'idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_close_li_idx > 0 AND l_close_li_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index := l_close_li_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_open_old_b_idx > 0 AND l_open_old_b_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index   := l_open_old_b_idx ;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_close_old_b_idx > 0 AND l_close_old_b_idx < l_lowest_index THEN'||unistr('\000a')||
'      l_lowest_index    := l_close_old_b_idx;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'   ';

s:=s||' IF l_lowest_index = 100000 THEN'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_open_b_idx THEN'||unistr('\000a')||
'      l_b_count      := l_b_count + 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_close_b_idx THEN'||unistr('\000a')||
'      l_b_count      := l_b_count - 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_open_i_idx THEN'||unistr('\000a')||
'      l_i_count      := l_i_count + 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_close_i_idx THEN'||unistr('\000a')||
'      l_i_count     ';

s:=s||' := l_i_count - 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_open_u_idx THEN'||unistr('\000a')||
'      l_u_count      := l_u_count + 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_close_u_idx THEN'||unistr('\000a')||
'      l_u_count      := l_u_count - 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_open_ol_idx THEN'||unistr('\000a')||
'      l_ol_count     := l_ol_count + 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_close_ol_idx THEN'||unistr('\000a')||
'      l_ol_count     := l_ol_count - 1;'||unistr('\000a')||
'   ';

s:=s||' END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_open_ul_idx THEN'||unistr('\000a')||
'      l_ul_count     := l_ul_count + 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_close_ul_idx THEN'||unistr('\000a')||
'      l_ul_count     := l_ul_count - 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_open_li_idx THEN'||unistr('\000a')||
'      l_li_count     := l_li_count + 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_close_li_idx THEN'||unistr('\000a')||
'      l_li_count     := l_li_count - 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_';

s:=s||'lowest_index = l_open_old_b_idx THEN'||unistr('\000a')||
'      l_old_b_count  := l_old_b_count + 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_lowest_index = l_close_old_b_idx THEN'||unistr('\000a')||
'      l_old_b_count  := l_old_b_count - 1;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_b_count < 0 THEN'||unistr('\000a')||
'      l_b_count := 0;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_i_count < 0 THEN'||unistr('\000a')||
'      l_i_count := 0;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_u_count < 0 THEN'||unistr('\000a')||
'      l_u_count := 0;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_ol_count < 0 THEN';

s:=s||''||unistr('\000a')||
'      l_ol_count := 0;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_ul_count < 0 THEN'||unistr('\000a')||
'      l_ul_count := 0;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_li_count < 0 THEN'||unistr('\000a')||
'      l_li_count := 0;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_old_b_count < 0 THEN'||unistr('\000a')||
'      l_old_b_count := 0;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    l_index := l_lowest_index + 1;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  IF l_b_count > 0 OR l_i_count > 0 OR l_u_count > 0 OR l_ol_count > 0 OR l_ul_count > 0 OR l_li_count > 0 OR l_old_b_count >';

s:=s||' 0 THEN'||unistr('\000a')||
'    RETURN false;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    RETURN true;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END validate_message;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE read_otncookie'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  g_otn_cookie            := owa_cookie.get(''ORA_UCM_INFO'');'||unistr('\000a')||
'  IF g_otn_cookie.num_vals > 0 THEN'||unistr('\000a')||
'    g_otn_cookie_vals     := apex_util.string_to_table( g_otn_cookie.vals(1), ''~'' );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END read_otncookie;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE read_askcookie'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  g_ask_cookie         ';

s:=s||'   := owa_cookie.get( g_ask_cookiename );'||unistr('\000a')||
'  IF g_ask_cookie.num_vals > 0 THEN'||unistr('\000a')||
'    g_ask_cookie_vals     := apex_util.string_to_table( utl_url.unescape(g_ask_cookie.vals(1)), ''|'' );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END read_askcookie;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE write_askcookie('||unistr('\000a')||
'    p_email     IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_fname     IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_lname     IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_location  IN VARCHAR2 DE';

s:=s||'FAULT NULL,'||unistr('\000a')||
'    p_nickname  IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_job_title IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_org       IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_years     IN VARCHAR2 DEFAULT NULL )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  owa_util.mime_header(''text/html'', FALSE);'||unistr('\000a')||
'  owa_cookie.send( name => g_ask_cookiename, value => g_ask_cookieversion || ''|'' || p_email || ''|'' || p_fname || ''|'' || p_lname || ''|'' || p_location || ''|'' || p_nickn';

s:=s||'ame || ''|'' || p_job_title || ''|'' || p_org || ''|'' || p_years || ''|'' || BLOG_CUSTOM_HASH(upper(p_email),g_ask_cookiename), expires => g_ask_cookie_expires, path => ''/'', secure => '''' );'||unistr('\000a')||
'END write_askcookie;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION age('||unistr('\000a')||
'    p_date IN DATE)'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  RETURN'||unistr('\000a')||
'  CASE'||unistr('\000a')||
'  WHEN sysdate    -p_date < 1/24 THEN'||unistr('\000a')||
'    ROUND(24      *60*(sysdate-p_date)) || '' minutes old'''||unistr('\000a')||
'  WHEN sysdate   ';

wwv_flow_api.create_install_script(
  p_id => 66361017078146335 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'BLOG_API package',
  p_sequence=> 41,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
begin
s:=s||' -p_date < 1 THEN'||unistr('\000a')||
'    ROUND(24      *(sysdate-p_date)) || '' hours old'''||unistr('\000a')||
'  WHEN sysdate    -p_date < 14 THEN'||unistr('\000a')||
'    TRUNC(sysdate -p_date) || '' days old'''||unistr('\000a')||
'  WHEN sysdate    -p_date < 60 THEN'||unistr('\000a')||
'    TRUNC((sysdate-p_date)/7) || '' weeks old'''||unistr('\000a')||
'  WHEN sysdate    -p_date < 365 THEN'||unistr('\000a')||
'    ROUND(months_between(sysdate,p_date)) || '' months old'''||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    ROUND(months_between(sysdate,p_date)/12,1) || '' years old'''||unistr('\000a')||
'  E';

s:=s||'ND;'||unistr('\000a')||
'END age;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION parse_search_string('||unistr('\000a')||
'    p_search_str IN VARCHAR2 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_temp_value   VARCHAR2(32767);'||unistr('\000a')||
'  l_temp_value2  VARCHAR2(32767);'||unistr('\000a')||
'  l_return_value VARCHAR2(32767) := NULL;'||unistr('\000a')||
'  l_start_token  NUMBER          := 1;'||unistr('\000a')||
'  l_in_token     BOOLEAN         := FALSE;'||unistr('\000a')||
'  l_num_tokens   NUMBER          := 0;'||unistr('\000a')||
'  l_quotes       NUMBER;'||unistr('\000a')||
'  l_phrases dbms_sql.varchar2s;'||unistr('\000a')||
'  n NUMBER;';

s:=s||''||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF NVL(LENGTH(p_search_str),0) = 0 THEN'||unistr('\000a')||
'    RETURN NULL;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  l_quotes        := LENGTH(p_search_str) - LENGTH(REPLACE(p_search_str,''"'', ''''));'||unistr('\000a')||
'  IF ( l_quotes    > 0 AND mod(l_quotes,2) = 0 ) THEN'||unistr('\000a')||
'    l_temp_value2 := lower(p_search_str);'||unistr('\000a')||
'    FOR i         IN 1 .. l_quotes/2'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      n             := instr( l_temp_value2, ''"'' );'||unistr('\000a')||
'      l_temp_value  := l_temp_value || SUBSTR( ';

s:=s||'l_temp_value2, 1, n-1 );'||unistr('\000a')||
'      l_temp_value2 := SUBSTR( l_temp_value2, n                   +1 );'||unistr('\000a')||
'      n             := instr( l_temp_value2, ''"'' );'||unistr('\000a')||
'      l_phrases(i)  := SUBSTR( l_temp_value2, 1, n-1 );'||unistr('\000a')||
'      l_temp_value2 := SUBSTR( l_temp_value2, n   +1 );'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    l_temp_value := l_temp_value || l_temp_value2;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    l_temp_value := lower(p_search_str);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  l_temp_va';

s:=s||'lue := trim(REPLACE( l_temp_value, ''{'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''}'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, '':'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, '';'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''"'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, '':'''','', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''('', '' ''));'||unistr('\000a')||
'  ';

s:=s||'l_temp_value := trim(REPLACE( l_temp_value, '')'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''!'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''&'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''+'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''\'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, ''-'', '' ''));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, '','', '' ''';

s:=s||'));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, '' and '', '' '' ));'||unistr('\000a')||
'  l_temp_value := trim(REPLACE( l_temp_value, '' or '', '' '' ));'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF LENGTH(l_temp_value) > 0 THEN'||unistr('\000a')||
'    l_in_token           := TRUE;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  FOR i IN 1..nvl(LENGTH(l_temp_value),0)'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF SUBSTR(l_temp_value,i,1) = '' '' THEN'||unistr('\000a')||
'      IF l_in_token             = TRUE THEN'||unistr('\000a')||
'        l_return_value         := l_return_val';

s:=s||'ue || ''{'' || SUBSTR(l_temp_value,l_start_token, i-l_start_token) || ''}'' || '' and '';'||unistr('\000a')||
'        l_in_token             := FALSE;'||unistr('\000a')||
'        l_num_tokens           := l_num_tokens + 1;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    elsif l_in_token = FALSE THEN'||unistr('\000a')||
'      l_in_token    := TRUE;'||unistr('\000a')||
'      l_start_token := i;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN l_num_tokens > 30;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  IF l_in_token     = TRUE THEN'||unistr('\000a')||
'    l_return_value := l_retur';

s:=s||'n_value || ''{'' || SUBSTR(l_temp_value,l_start_token) || ''} and '';'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  FOR i IN 1 .. NVL(l_phrases.count,0)'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF ( l_phrases(i) IS NOT NULL ) THEN'||unistr('\000a')||
'      l_return_value  := l_return_value || '' {'' || l_phrases(i) || ''} and '';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  RETURN trim( SUBSTR( l_return_value, 1, LENGTH(l_return_value)-4 ) );'||unistr('\000a')||
'END parse_search_string;'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE refresh_top_articles'||unistr('\000a')||
'IS'||unistr('\000a')||
'BE';

s:=s||'GIN'||unistr('\000a')||
'  DELETE FROM BLOG_ARTICLES_TOP20;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  INSERT INTO BLOG_ARTICLES_TOP20'||unistr('\000a')||
'    ( article_id, subject, thecount'||unistr('\000a')||
'    )'||unistr('\000a')||
'  SELECT y.*'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    (SELECT q.id,'||unistr('\000a')||
'      q.msg_subject,'||unistr('\000a')||
'      x.thecount'||unistr('\000a')||
'    FROM blog_messages q,'||unistr('\000a')||
'      (SELECT article_id,'||unistr('\000a')||
'        COUNT(*) thecount'||unistr('\000a')||
'      FROM VW_BLOG_ARTICLE_ACCESS_LOG'||unistr('\000a')||
'      GROUP BY article_id'||unistr('\000a')||
'      ) x'||unistr('\000a')||
'    WHERE q.id     = x.article_id'||unistr('\000a')||
'    AND q.msg_type';

s:=s||' = ''STANDARD'''||unistr('\000a')||
'    ORDER BY x.thecount DESC'||unistr('\000a')||
'    ) y'||unistr('\000a')||
'  WHERE rownum <= 20;'||unistr('\000a')||
'  DELETE FROM BLOG_ARTICLES_HIT20;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  INSERT INTO blog_articles_hit20'||unistr('\000a')||
'    ( article_id, subject, hit_ratio'||unistr('\000a')||
'    )'||unistr('\000a')||
'  SELECT y.*'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    (SELECT q.id,'||unistr('\000a')||
'      q.msg_subject,'||unistr('\000a')||
'      x.hit_ratio'||unistr('\000a')||
'    FROM blog_messages q,'||unistr('\000a')||
'      (SELECT article_id,'||unistr('\000a')||
'        COUNT(*)/(24*60*60*(sysdate - MIN(access_date))) hit_ratio'||unistr('\000a')||
'      FROM VW_';

s:=s||'BLOG_ARTICLE_ACCESS_LOG'||unistr('\000a')||
'      GROUP BY article_id'||unistr('\000a')||
'      ) x'||unistr('\000a')||
'    WHERE q.id     = x.article_id'||unistr('\000a')||
'    AND q.msg_type = ''STANDARD'''||unistr('\000a')||
'    ORDER BY x.hit_ratio DESC'||unistr('\000a')||
'    ) y'||unistr('\000a')||
'  WHERE rownum <= 20;'||unistr('\000a')||
'END refresh_top_articles;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE write_access_log('||unistr('\000a')||
'    p_article_id IN VARCHAR2,'||unistr('\000a')||
'    p_email      IN VARCHAR2 )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF get_client_ip NOT LIKE ''192.168%'' THEN'||unistr('\000a')||
'    INSERT'||unistr('\000a')||
'    INTO BLOG_ARTICLE_LOG$';

s:=s||''||unistr('\000a')||
'      ('||unistr('\000a')||
'        article_id,'||unistr('\000a')||
'        log_type,'||unistr('\000a')||
'        email ,'||unistr('\000a')||
'        session_id,'||unistr('\000a')||
'        remote_addr'||unistr('\000a')||
'      )'||unistr('\000a')||
'      VALUES'||unistr('\000a')||
'      ('||unistr('\000a')||
'        p_article_id,'||unistr('\000a')||
'        ''ACCESS'','||unistr('\000a')||
'        p_email ,'||unistr('\000a')||
'        v(''SESSION''),'||unistr('\000a')||
'        get_client_ip'||unistr('\000a')||
'      );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END write_access_log;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE write_cat_access_log'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_cat_id IN VARCHAR2,'||unistr('\000a')||
'    p_email  IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF get_client_i';

s:=s||'p NOT LIKE ''192.168%'' THEN'||unistr('\000a')||
'    INSERT'||unistr('\000a')||
'    INTO BLOG_ARTICLE_LOG$'||unistr('\000a')||
'      ('||unistr('\000a')||
'        category_id,'||unistr('\000a')||
'        log_type,'||unistr('\000a')||
'        email ,'||unistr('\000a')||
'        session_id,'||unistr('\000a')||
'        remote_addr'||unistr('\000a')||
'      )'||unistr('\000a')||
'      VALUES'||unistr('\000a')||
'      ('||unistr('\000a')||
'        p_cat_id,'||unistr('\000a')||
'        ''CATEGORY'','||unistr('\000a')||
'        p_email ,'||unistr('\000a')||
'        v(''SESSION''),'||unistr('\000a')||
'        get_client_ip'||unistr('\000a')||
'      );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END write_cat_access_log;'||unistr('\000a')||
'PROCEDURE write_search_log'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_criteria IN VARCHAR2,';

s:=s||''||unistr('\000a')||
'    p_email    IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_remote_addr     VARCHAR2(255) := get_client_ip;'||unistr('\000a')||
'  l_http_user_agent VARCHAR2(255) DEFAULT owa_util.get_cgi_env( ''HTTP_USER_AGENT'' );'||unistr('\000a')||
'  l_http_referer    VARCHAR2(255) DEFAULT owa_util.get_cgi_env( ''HTTP_REFERER'' );'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF get_client_ip NOT LIKE ''192.168%'' THEN'||unistr('\000a')||
'    INSERT'||unistr('\000a')||
'    INTO BLOG_ARTICLE_LOG$'||unistr('\000a')||
'      ('||unistr('\000a')||
'        log_type,'||unistr('\000a')||
'        search_criteria,'||unistr('\000a')||
'       ';

s:=s||' email,'||unistr('\000a')||
'        remote_addr,'||unistr('\000a')||
'        http_user_agent,'||unistr('\000a')||
'        http_referer ,'||unistr('\000a')||
'        session_id'||unistr('\000a')||
'      )'||unistr('\000a')||
'      VALUES'||unistr('\000a')||
'      ('||unistr('\000a')||
'        ''SEARCH'','||unistr('\000a')||
'        SUBSTR(p_criteria,1,1000),'||unistr('\000a')||
'        p_email,'||unistr('\000a')||
'        l_remote_addr,'||unistr('\000a')||
'        l_http_user_agent,'||unistr('\000a')||
'        l_http_referer ,'||unistr('\000a')||
'        v(''SESSION'')'||unistr('\000a')||
'      );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END write_search_log;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE UPDATE_ADMINISTRATORS'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_administrator_lis';

s:=s||'t IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_admintbl blog_tabletype := blog_tabletype();'||unistr('\000a')||
'  l_admin_list apex_application_global.vc_arr2;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_admin_list := apex_util.string_to_table( p_administrator_list );'||unistr('\000a')||
'  l_admintbl   := list_to_tbl( l_admin_list );'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- First, delete any of those that are not in our list'||unistr('\000a')||
'  --'||unistr('\000a')||
'  DELETE'||unistr('\000a')||
'  FROM BLOG_ADMINISTRATORS t1'||unistr('\000a')||
'  WHERE t1.userid IN'||unistr('\000a')||
'    (SELECT t2.userid FROM BLOG_A';

s:=s||'DMINISTRATORS t2'||unistr('\000a')||
'    MINUS'||unistr('\000a')||
'      (SELECT column_value'||unistr('\000a')||
'      FROM the'||unistr('\000a')||
'        (SELECT CAST (l_admintbl AS blog_tabletype ) FROM dual'||unistr('\000a')||
'        )'||unistr('\000a')||
'      )'||unistr('\000a')||
'    );'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- Now do the reverse, add any of those that are not in the table'||unistr('\000a')||
'  --'||unistr('\000a')||
'  FOR c1 IN'||unistr('\000a')||
'  (SELECT column_value'||unistr('\000a')||
'  FROM the'||unistr('\000a')||
'    (SELECT CAST (l_admintbl AS blog_tabletype) FROM dual'||unistr('\000a')||
'    )'||unistr('\000a')||
'  MINUS'||unistr('\000a')||
'  SELECT userid FROM BLOG_ADMINISTRATORS'||unistr('\000a')||
'  )'||unistr('\000a')||
'  ';

s:=s||'LOOP'||unistr('\000a')||
'    INSERT'||unistr('\000a')||
'    INTO BLOG_ADMINISTRATORS'||unistr('\000a')||
'      ('||unistr('\000a')||
'        userid'||unistr('\000a')||
'      )'||unistr('\000a')||
'      VALUES'||unistr('\000a')||
'      ('||unistr('\000a')||
'        c1.column_value'||unistr('\000a')||
'      );'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'END update_administrators;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE notify'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_article_id IN NUMBER,'||unistr('\000a')||
'    p_user_id    IN NUMBER,'||unistr('\000a')||
'    p_from       IN VARCHAR2,'||unistr('\000a')||
'    p_app_id     IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_body    VARCHAR2(32000);'||unistr('\000a')||
'  l_subj    VARCHAR2(2000);'||unistr('\000a')||
'  l_expert  VARCHA';

s:=s||'R2(100);'||unistr('\000a')||
'  l_website VARCHAR2(100);'||unistr('\000a')||
'  l_alias   VARCHAR2(100);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT substitution_value v'||unistr('\000a')||
'    FROM apex_application_substitutions'||unistr('\000a')||
'    WHERE substitution_string = ''BLOGGER_NAME'''||unistr('\000a')||
'    AND application_id        = p_app_id'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_expert := i.v;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT ALIAS v FROM apex_applications WHERE application_id = p_app_id'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_alias := i.v;'||unistr('\000a')||
'  ';

s:=s||'END LOOP;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT substitution_value v'||unistr('\000a')||
'    FROM apex_application_substitutions'||unistr('\000a')||
'    WHERE substitution_string = ''WEBSITE'''||unistr('\000a')||
'    AND application_id        = p_app_id'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_website := i.v;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  ( SELECT msg_subject FROM blog_messages m WHERE id = p_article_id'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_body := ''Hi,'||unistr('\000a')||
'You have chosen to receive follow up if new comment is posted to ''||l_e';

s:=s||'xpert||'' blog article you commented.'||unistr('\000a')||
'To follow up the article and its new comment(s), please go to http://''||l_website||''/f?p=''||l_alias||'':READ:0::::ARTICLE:''||p_article_id||'''||unistr('\000a')||
'Best regards,'||unistr('\000a')||
'''||l_expert;'||unistr('\000a')||
'    l_subj := ''Follow up on ''||l_expert||'' Blog article, new comments on article: ''|| i.msg_subject;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  ( SELECT DISTINCT u.email'||unistr('\000a')||
'    FROM blog_messages m,'||unistr('\000a')||
'      blog_reg_use';

s:=s||'rs u'||unistr('\000a')||
'    WHERE m.msg_id        = p_article_id'||unistr('\000a')||
'    AND m.created_by_id   = u.id'||unistr('\000a')||
'    AND u.id             != p_user_id'||unistr('\000a')||
'    AND m.followup_notify = ''Y'''||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    "SEND_MAIL"'||unistr('\000a')||
'    ('||unistr('\000a')||
'      p_to => i.email, p_from => p_from, p_body => l_body, p_subj => l_subj'||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT email'||unistr('\000a')||
'    FROM blog_reg_users u'||unistr('\000a')||
'    WHERE upper(email) IN'||unistr('\000a')||
'      (SELECT upper(userid) FROM BLOG_A';

s:=s||'DMINISTRATORS'||unistr('\000a')||
'      )'||unistr('\000a')||
'    AND u.id             != p_user_id'||unistr('\000a')||
'    AND upper(email) NOT IN'||unistr('\000a')||
'      (SELECT u.email'||unistr('\000a')||
'      FROM blog_messages m,'||unistr('\000a')||
'        blog_reg_users u'||unistr('\000a')||
'      WHERE m.id          = p_article_id'||unistr('\000a')||
'      AND m.created_by_id = u.id'||unistr('\000a')||
'      )'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    "SEND_MAIL"'||unistr('\000a')||
'    ('||unistr('\000a')||
'      p_to => i.email, p_from => p_from, p_body => l_body, p_subj => ''For Blog Administrators Team, ''||l_subj'||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'';

s:=s||'  END LOOP;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  ( SELECT DISTINCT u.email,'||unistr('\000a')||
'      m.msg_subject'||unistr('\000a')||
'    FROM blog_messages m,'||unistr('\000a')||
'      blog_reg_users u'||unistr('\000a')||
'    WHERE m.id          = p_article_id'||unistr('\000a')||
'    AND m.created_by_id = u.id'||unistr('\000a')||
'    AND u.id           != p_user_id'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_body := ''Hi,'||unistr('\000a')||
'New comment is received on Your article, please go to http://''||l_website||''/f?p=''||l_alias||'':READ:0::::ARTICLE:''||p_article_id||'''||unistr('\000a')||
'to check.'||unistr('\000a')||
'B';

s:=s||'est regards,'||unistr('\000a')||
'''||l_expert;'||unistr('\000a')||
'    l_subj := ''New comments on Your article: ''|| i.msg_subject;'||unistr('\000a')||
'    "SEND_MAIL" ( p_to => i.email, p_from => p_from, p_body => l_body, p_subj => l_subj);'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'END;'||unistr('\000a')||
'PROCEDURE update_article'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_subject         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article         IN VARCHAR2 DEFAULT NUL';

s:=s||'L,'||unistr('\000a')||
'    p_cat_id          IN NUMBER,'||unistr('\000a')||
'    p_user_id         IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  UPDATE BLOG_MESSAGES'||unistr('\000a')||
'  SET msg_subject   = p_subject ,'||unistr('\000a')||
'    msg_text        = p_article ,'||unistr('\000a')||
'    category_id     = p_cat_id ,'||unistr('\000a')||
'    RSS_DESCRIPTION = p_rss_description ,'||unistr('\000a')||
'    modified_by_id  = p_user_id'||unistr('\000a')||
'  WHERE id          = p_article_id;'||unistr('\000a')||
'  COMMIT;'||unistr('\000a')||
'END update_article;'||unistr('\000a')||
'PROCEDURE save_article('||unistr('\000a')||
'    p_subject         IN V';

s:=s||'ARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_from_submitter  IN NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id          IN NUMBER)'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_article CLOB;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  INSERT'||unistr('\000a')||
'  INTO BLOG_MESSAGES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ID,'||unistr('\000a')||
'      MSG_ID,'||unistr('\000a')||
'      MSG_TYPE,'||unistr('\000a')||
'      MSG_SUBJECT,'||unistr('\000a')||
'      MSG_TEXT,'||unistr('\000a')||
'      CATEGORY_ID,'||unistr('\000a')||
'      EXPIRE_DATE,'||unistr('\000a')||
'      VIEWED,'||unistr('\000a')||
'      RS';

s:=s||'S_DESCRIPTION,'||unistr('\000a')||
'      followup_notify,'||unistr('\000a')||
'      session_id,'||unistr('\000a')||
'      CREATED_ON,'||unistr('\000a')||
'      MODIFIED_ON,'||unistr('\000a')||
'      CREATED_BY_ID,'||unistr('\000a')||
'      MODIFIED_BY_ID'||unistr('\000a')||
'    )'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      ''STANDARD'','||unistr('\000a')||
'      p_subject,'||unistr('\000a')||
'      empty_clob(),'||unistr('\000a')||
'      p_cat_id,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      p_rss_description,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      v(''SESSION''),'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      p_from_submitter,'||unistr('\000a')||
'      p_from_submi';

s:=s||'tter'||unistr('\000a')||
'    )'||unistr('\000a')||
'  RETURNING msg_text'||unistr('\000a')||
'  INTO l_article;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF p_article IS NOT NULL THEN'||unistr('\000a')||
'    dbms_lob.write( l_article, LENGTH(p_article), 1, p_article );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END save_article;'||unistr('\000a')||
'PROCEDURE update_article_preview'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_article_id      IN NUMBER,'||unistr('\000a')||
'    p_subject         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p';

s:=s||'_cat_id          IN NUMBER,'||unistr('\000a')||
'    p_user_id         IN NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  UPDATE BLOG_MESSAGES_PREVIEW'||unistr('\000a')||
'  SET msg_subject   = p_subject ,'||unistr('\000a')||
'    msg_text        = p_article ,'||unistr('\000a')||
'    category_id     = p_cat_id ,'||unistr('\000a')||
'    RSS_DESCRIPTION = p_rss_description ,'||unistr('\000a')||
'    modified_by_id  = p_user_id'||unistr('\000a')||
'  WHERE id          = p_article_id;'||unistr('\000a')||
'  COMMIT;'||unistr('\000a')||
'END update_article_preview;'||unistr('\000a')||
'PROCEDURE save_article_preview('||unistr('\000a')||
'    p_id O';

s:=s||'UT VARCHAR2,'||unistr('\000a')||
'    p_subject         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_rss_description IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article         IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_from_submitter  IN NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id          IN NUMBER)'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_article CLOB;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  --'||unistr('\000a')||
'  p_id := blog_id.next_val;'||unistr('\000a')||
'  INSERT'||unistr('\000a')||
'  INTO BLOG_MESSAGES_PREVIEW'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ID,'||unistr('\000a')||
'      MSG_ID,'||unistr('\000a')||
'      MSG_TYPE,'||unistr('\000a')||
'      MSG_SUBJECT,'||unistr('\000a')||
' ';

s:=s||'     MSG_TEXT,'||unistr('\000a')||
'      CATEGORY_ID,'||unistr('\000a')||
'      EXPIRE_DATE,'||unistr('\000a')||
'      VIEWED,'||unistr('\000a')||
'      RSS_DESCRIPTION,'||unistr('\000a')||
'      followup_notify,'||unistr('\000a')||
'      session_id,'||unistr('\000a')||
'      CREATED_ON,'||unistr('\000a')||
'      MODIFIED_ON,'||unistr('\000a')||
'      CREATED_BY_ID,'||unistr('\000a')||
'      MODIFIED_BY_ID'||unistr('\000a')||
'    )'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      p_id,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      ''STANDARD'','||unistr('\000a')||
'      p_subject,'||unistr('\000a')||
'      empty_clob(),'||unistr('\000a')||
'      p_cat_id,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      p_rss_description,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      v(''SE';

s:=s||'SSION''),'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      p_from_submitter,'||unistr('\000a')||
'      p_from_submitter'||unistr('\000a')||
'    )'||unistr('\000a')||
'  RETURNING msg_text'||unistr('\000a')||
'  INTO l_article;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  IF p_article IS NOT NULL THEN'||unistr('\000a')||
'    dbms_lob.write( l_article, LENGTH(p_article), 1, p_article );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END save_article_preview;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'PROCEDURE save_comment_followup'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_article_id NUMBER,'||unistr('\000a')||
'    p_comment    VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  INSERT'||unistr('\000a')||
'  INTO BLOG_MESSAG';

s:=s||'ES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ID,'||unistr('\000a')||
'      MSG_ID,'||unistr('\000a')||
'      MSG_TYPE,'||unistr('\000a')||
'      MSG_SUBJECT,'||unistr('\000a')||
'      MSG_TEXT,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    )'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      p_article_id,'||unistr('\000a')||
'      ''COMMENT'','||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      format_followup( p_comment, LENGTH(p_comment) ),'||unistr('\000a')||
'      v(''USER_ID'')'||unistr('\000a')||
'    );'||unistr('\000a')||
'END;'||unistr('\000a')||
'PROCEDURE read_activity_cookie'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  g_act_cookie            := owa_cookie.get( g_act_cookiename );'||unistr('\000a')||
'  IF g_act_cookie.num';

s:=s||'_vals > 0 THEN'||unistr('\000a')||
'    g_act_cookie_vals     := apex_util.string_to_table( g_act_cookie.vals(1), ''|'' );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END read_activity_cookie;'||unistr('\000a')||
'PROCEDURE write_activity_cookie'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_cookie_id IN VARCHAR2 DEFAULT NULL'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_cookie_id NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF p_cookie_id IS NULL THEN'||unistr('\000a')||
'    RETURN;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      l_cookie_id := to_number(p_cookie_id);'||unistr('\000a')||
'    EXCEPTION'||unistr('\000a')||
'    WHEN OTHERS THEN'||unistr('\000a')||
'      NULL;'||unistr('\000a')||
' ';

s:=s||'   END;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  --'||unistr('\000a')||
'  owa_cookie.send( name => g_act_cookiename, value => g_act_cookieversion || ''|'' || TO_CHAR(l_cookie_id), expires => g_act_cookie_expires, path => ''/'', secure => '''' );'||unistr('\000a')||
'END write_activity_cookie;'||unistr('\000a')||
'PROCEDURE write_activity_log'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_cookie_id  IN VARCHAR2,'||unistr('\000a')||
'    p_page_id    IN VARCHAR2,'||unistr('\000a')||
'    p_session_id IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_remote_addr     VARCHAR2(4000) DEFAULT owa_util.g';

s:=s||'et_cgi_env(''HTTP_X_ORACLE_CACHE_USER''); --owa_util.get_cgi_env( ''REMOTE_ADDR'' );'||unistr('\000a')||
'  l_http_user_agent VARCHAR2(4000) DEFAULT owa_util.get_cgi_env( ''HTTP_USER_AGENT'' );'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  INSERT'||unistr('\000a')||
'  INTO BLOG_ACTIVITY_LOG'||unistr('\000a')||
'    ('||unistr('\000a')||
'      cookie_id,'||unistr('\000a')||
'      page_id,'||unistr('\000a')||
'      session_id,'||unistr('\000a')||
'      ip_address,'||unistr('\000a')||
'      user_agent'||unistr('\000a')||
'    )'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      p_cookie_id,'||unistr('\000a')||
'      p_page_id,'||unistr('\000a')||
'      p_session_id,'||unistr('\000a')||
'      l_remote_addr,'||unistr('\000a')||
'  ';

s:=s||'    l_http_user_agent'||unistr('\000a')||
'    );'||unistr('\000a')||
'END write_activity_log;'||unistr('\000a')||
'PROCEDURE add_bad_email'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_email IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  INSERT INTO BLOG_BAD_EMAILS'||unistr('\000a')||
'    (email'||unistr('\000a')||
'    ) VALUES'||unistr('\000a')||
'    (lower(p_email)'||unistr('\000a')||
'    );'||unistr('\000a')||
'END add_bad_email;'||unistr('\000a')||
'PROCEDURE remove_bad_email'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_email IN VARCHAR2'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  DELETE'||unistr('\000a')||
'  FROM BLOG_BAD_EMAILS'||unistr('\000a')||
'  WHERE email = lower(p_email);'||unistr('\000a')||
'END remove_bad_email;'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'--'||unistr('\000a')||
'FUNCTION format_err';

s:=s||'or('||unistr('\000a')||
'    l_error VARCHAR2,'||unistr('\000a')||
'    l_value NUMBER)'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_table        VARCHAR2(32000);'||unistr('\000a')||
'  L_OUTPUT_ERROR VARCHAR2(32000);'||unistr('\000a')||
'  l              VARCHAR2(32000);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF INSTR(L_ERROR,V(''OWNER''),1,2) = 0 THEN'||unistr('\000a')||
'    L_TABLE                       := NULL;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    L     := SUBSTR(L_ERROR,INSTR(L_ERROR,v(''OWNER''),1,2));'||unistr('\000a')||
'    FOR i IN 1..length(l)'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF SUBSTR(L,I,1) = '' '' THEN'||unistr('\000a')||
'  ';

s:=s||'      L             := SUBSTR(L,1,i);'||unistr('\000a')||
'        EXIT;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    L_TABLE := TRIM(REPLACE(REPLACE(LTRIM(L,V(''OWNER'')),''.'',''''),''"'',''''));'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF instr(l_error,''02292'',1)    > 0 THEN'||unistr('\000a')||
'    l_output_error              := VALIDATE_FK (L_TABLE, L_VALUE);'||unistr('\000a')||
'  elsif instr(l_error,''00001'',1) > 0 THEN'||unistr('\000a')||
'    l_output_error              := validate_uk (l_table, l_value);'||unistr('\000a')||
'  elsif instr(l_er';

s:=s||'ror,''01403'',1) > 0 THEN'||unistr('\000a')||
'    L_OUTPUT_ERROR              := HTMLDB_LANG.MESSAGE(''ERROR_NODATA'', L_TABLE);'||unistr('\000a')||
'  ELSIF INSTR(L_ERROR,''01407'',1) > 0 THEN'||unistr('\000a')||
'    L_OUTPUT_ERROR              := HTMLDB_LANG.MESSAGE(''NULL_ERROR_UPDATE'', L_TABLE);'||unistr('\000a')||
'  ELSIF INSTR(L_ERROR,''01400'',1) > 0 THEN'||unistr('\000a')||
'    l_output_error              := htmldb_lang.message(''NULL_ERROR_INSERT'', l_table);'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    l_output_error := htmldb_lan';

s:=s||'g.message(''UNEXPECTED_ERROR'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  RETURN l_output_error;'||unistr('\000a')||
'END;'||unistr('\000a')||
'FUNCTION VALIDATE_FK('||unistr('\000a')||
'    p_table    VARCHAR2,'||unistr('\000a')||
'    p_pk_value NUMBER)'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_count NUMBER;'||unistr('\000a')||
'  l_error VARCHAR2(32000);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF P_TABLE IS NULL THEN'||unistr('\000a')||
'    RETURN ''<br>'' || HTMLDB_LANG.MESSAGE(''FK_VIOLATION'', ''some of the tables'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF p_pk_value IS NULL THEN'||unistr('\000a')||
'    FOR c       IN'||unistr('\000a')||
'    (SELECT      *'||unistr('\000a')||
'    ';

s:=s||'FROM user_constraints'||unistr('\000a')||
'    WHERE TABLE_NAME     = P_TABLE'||unistr('\000a')||
'    AND constraint_type IN ( ''P'', ''U'')'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      FOR r IN'||unistr('\000a')||
'      (SELECT ucc.*'||unistr('\000a')||
'      FROM user_constraints uc,'||unistr('\000a')||
'        user_cons_columns ucc'||unistr('\000a')||
'      WHERE uc.r_constraint_name = c.constraint_name'||unistr('\000a')||
'      AND uc.constraint_name     = ucc.constraint_name'||unistr('\000a')||
'      AND uc.status              = ''ENABLED'''||unistr('\000a')||
'      AND uc.constraint_type     = ''R'''||unistr('\000a')||
'';

s:=s||'      AND uc.delete_rule         =''NO ACTION'''||unistr('\000a')||
'      )'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        l_error := l_error || ''<br>'' || htmldb_lang.message(''FK_VIOLATION'', r.table_name);'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    FOR c  IN'||unistr('\000a')||
'    (SELECT *'||unistr('\000a')||
'    FROM user_constraints'||unistr('\000a')||
'    WHERE TABLE_NAME     = P_TABLE'||unistr('\000a')||
'    AND constraint_type IN ( ''P'', ''U'')'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      FOR r IN'||unistr('\000a')||
'      (SELECT ucc.*'||unistr('\000a')||
'      FROM user_constraints u';

s:=s||'c,'||unistr('\000a')||
'        user_cons_columns ucc'||unistr('\000a')||
'      WHERE uc.r_constraint_name = c.constraint_name'||unistr('\000a')||
'      AND uc.constraint_name     = ucc.constraint_name'||unistr('\000a')||
'      AND uc.status              = ''ENABLED'''||unistr('\000a')||
'      AND uc.constraint_type     = ''R'''||unistr('\000a')||
'      AND uc.delete_rule         =''NO ACTION'''||unistr('\000a')||
'      )'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        EXECUTE immediate ''select count(*) from '' || r.table_name || '' where '' || r.column_name || ''='' || p_pk';

s:=s||'_value INTO l_count;'||unistr('\000a')||
'        IF l_count > 0 THEN'||unistr('\000a')||
'          l_error := l_error || ''<br>'' || htmldb_lang.message(''FK_VIOLATION'', r.table_name);'||unistr('\000a')||
'        END IF;'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  RETURN ltrim(l_error, ''<br>'');'||unistr('\000a')||
'END VALIDATE_FK;'||unistr('\000a')||
'FUNCTION "VALIDATE_UK"('||unistr('\000a')||
'    p_table    VARCHAR2,'||unistr('\000a')||
'    p_pk_value NUMBER)'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_count NUMBER;'||unistr('\000a')||
'  l_error VARCHAR2(32000);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF p_p';

s:=s||'k_value IS NULL THEN'||unistr('\000a')||
'    l_error     := l_error || ''<br>'' || htmldb_lang.message(''UK_VIOLATION'', p_table);'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    l_error := l_error || ''<br>'' || htmldb_lang.message(''UK_VIOLATION_VAL'', p_table, p_pk_value);'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  RETURN ltrim(l_error, ''<br>'');'||unistr('\000a')||
'END validate_uk;'||unistr('\000a')||
'FUNCTION format_comment('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_string LONG DEFA';

s:=s||'ULT REPLACE( DBMS_LOB.SUBSTR(p_string,32676,1) || chr(32) || chr(10), chr(9), ''    '' );'||unistr('\000a')||
'  l_result LONG DEFAULT NULL;'||unistr('\000a')||
'  l_piece LONG;'||unistr('\000a')||
'  l_ws       VARCHAR2(25) DEFAULT '' '' || chr(9);'||unistr('\000a')||
'  l_sep      VARCHAR2(5) DEFAULT NULL;'||unistr('\000a')||
'  l_endofUrl VARCHAR2(255) DEFAULT chr(10) || chr(13) || chr(9) || '' )<>'';'||unistr('\000a')||
'  n          NUMBER;'||unistr('\000a')||
'  m          NUMBER;'||unistr('\000a')||
'  l_urls owa.vc_arr;'||unistr('\000a')||
'  l_code owa.vc_arr;'||unistr('\000a')||
'type vc_tab'||unistr('\000a')||
'IS'||unistr('\000a')||
'  TA';

s:=s||'BLE OF VARCHAR2(30);'||unistr('\000a')||
'  l_tags vc_tab;'||unistr('\000a')||
'  l_truncated BOOLEAN := false;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br/>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br />'','' '');'||unistr('\000a')||
'  l_truncated := dbms_lob.getlength(l_string) >= g_max_message_length;'||unistr('\000a')||
'  wwv_flow.debug(''starting message length: ''||LENGTH(l_string));'||unistr('\000a')||
'  -- list of tags to preserve'||unistr('\000a')||
'  l_tags := vc';

s:=s||'_tab(''<b>'',''</b>'', ''<i>'',''</i>'', ''<u>'',''</u>'', ''<ul>'',''</ul>'', ''<ol>'',''</ol>'', ''<li>'',''</li>'',''<p>'',''</p>'',''<pre>'',''</pre>'' );'||unistr('\000a')||
'  -- find and escape everything inside <code> tags'||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n          := instr( lower(l_string), ''<code>'');'||unistr('\000a')||
'    m          := instr( lower(l_string), ''</code>'', n );'||unistr('\000a')||
'    IF n        > 0 AND m = 0 AND l_truncated THEN'||unistr('\000a')||
'      m        := LENGTH(l_strin';

s:=s||'g);'||unistr('\000a')||
'      l_string := l_string||''</code>'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n       = 0 OR m = 0;'||unistr('\000a')||
'    l_code(i) := SUBSTR( l_string, n    + LENGTH(''<code>''), (m - n) - LENGTH(''<code>''));'||unistr('\000a')||
'    l_string  := SUBSTR( l_string, 1, n - 1) || ''@$''||i||''$@'' || SUBSTR(l_string, m + LENGTH(''</code>''));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- find and replace URLs with real links (and save'||unistr('\000a')||
'  -- in array until everything else is escaped)';

s:=s||''||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n   := instr( lower(l_string), ''http://'' );'||unistr('\000a')||
'    IF n = 0 THEN'||unistr('\000a')||
'      n := instr( lower(l_string), ''https://'' );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF n = 0 THEN'||unistr('\000a')||
'      n := instr( lower(l_string), ''ftp://'' );'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n   = 0;'||unistr('\000a')||
'    FOR j IN 0 .. 255'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF ( instr( l_endofUrl, SUBSTR( l_string, n+j, 1 ) ) > 0 ) THEN'||unistr('\000a')||
'        l_urls(i)                        ';

s:=s||'                 := rtrim( force_wrap(SUBSTR( l_string, n, j ), p_len), ''.''||chr(32)||chr(10) );'||unistr('\000a')||
'        l_urls(i)                                         := ''<a href="'' || l_urls(i) || ''">'' || l_urls(i) || ''</a>'';'||unistr('\000a')||
'        l_string                                          := SUBSTR( l_string, 1, n-1 ) || ''@@''||i|| ''@@'' || SUBSTR( l_string, n+j );'||unistr('\000a')||
'        EXIT;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END LOO';

s:=s||'P;'||unistr('\000a')||
'  l_result := REPLACE(htf.escape_sc(l_string),''   '',''&nbsp; '');'||unistr('\000a')||
'  -- add tags back in'||unistr('\000a')||
'  FOR i IN 1 .. l_tags.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_result := REPLACE( l_result, htf.escape_sc(lower(l_tags(i))),l_tags(i));'||unistr('\000a')||
'    l_result := REPLACE( l_result, htf.escape_sc(upper(l_tags(i))),l_tags(i));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- add URLs back into message'||unistr('\000a')||
'  FOR i IN 1 .. l_urls.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_result := REPLACE( l_result, ''@';

s:=s||'@''||i||''@@'', ''<pre>''||l_urls(i)||''</pre>'' );'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  -- add <code> sections back in'||unistr('\000a')||
'  FOR i IN 1 .. l_code.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF LENGTH(ltrim(l_code(i),chr(10)||'' '')) > 0 THEN'||unistr('\000a')||
'      l_result                              := REPLACE( l_result, ''@$''||i||''$@'', ''<code>''||SUBSTR(htf.escape_sc(force_wrap(l_code(i),p_len)),1,'||unistr('\000a')||
'      ('||unistr('\000a')||
'        CASE'||unistr('\000a')||
'        WHEN LENGTH(l_result) > 31000 THEN'||unistr('\000a')||
'          0'||unistr('\000a')||
'';

s:=s||'        ELSE'||unistr('\000a')||
'          31000 - LENGTH(l_result)'||unistr('\000a')||
'        END))||''</code>'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      l_result := REPLACE( l_result, ''@$''||i||''$@'','''');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  wwv_flow.debug(''ending message length: ''||LENGTH(l_result));'||unistr('\000a')||
'  RETURN l_result;'||unistr('\000a')||
'END format_comment;'||unistr('\000a')||
'FUNCTION format_followup('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'    p_len    IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_string LONG DEFAULT R';

s:=s||'EPLACE( DBMS_LOB.SUBSTR(p_string,32767,1) , chr(9), ''    '' );'||unistr('\000a')||
'  l_result LONG DEFAULT NULL;'||unistr('\000a')||
'  l_piece LONG;'||unistr('\000a')||
'  l_ws       VARCHAR2(25) DEFAULT '' '' || chr(9);'||unistr('\000a')||
'  l_sep      VARCHAR2(5) DEFAULT NULL;'||unistr('\000a')||
'  l_endofUrl VARCHAR2(255) DEFAULT chr(10) || chr(13) || chr(9) || '' )<>'';'||unistr('\000a')||
'  n          NUMBER;'||unistr('\000a')||
'  m          NUMBER;'||unistr('\000a')||
'  l_urls owa.vc_arr;'||unistr('\000a')||
'  l_code owa.vc_arr;'||unistr('\000a')||
'type vc_tab'||unistr('\000a')||
'IS'||unistr('\000a')||
'  TABLE OF VARCHAR2(30);'||unistr('\000a')||
'  l_t';

s:=s||'ags vc_tab;'||unistr('\000a')||
'  l_truncated BOOLEAN := false;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br/>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br />'','' '');'||unistr('\000a')||
'  l_truncated := dbms_lob.getlength(l_string) >= g_max_message_length;'||unistr('\000a')||
'  wwv_flow.debug(''starting message length: ''||LENGTH(l_string));'||unistr('\000a')||
'  -- find and escape everything inside <code> tags'||unistr('\000a')||
'  FOR i IN 1 .. 100';

s:=s||'0'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n          := instr( lower(l_string), ''<code>'');'||unistr('\000a')||
'    m          := instr( lower(l_string), ''</code>'', n );'||unistr('\000a')||
'    IF n        > 0 AND m = 0 AND l_truncated THEN'||unistr('\000a')||
'      m        := LENGTH(l_string);'||unistr('\000a')||
'      l_string := l_string||''</code>'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n       = 0 OR m = 0;'||unistr('\000a')||
'    l_code(i) := SUBSTR( l_string, n    + LENGTH(''<code>''), (m - n) - LENGTH(''<code>''));'||unistr('\000a')||
'    l_string  :';

s:=s||'= SUBSTR( l_string, 1, n - 1) || ''@$''||i||''$@'' || SUBSTR(l_string, m + LENGTH(''</code>''));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  l_result := l_string;'||unistr('\000a')||
'  -- add <code> sections back in'||unistr('\000a')||
'  FOR i IN 1 .. l_code.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF LENGTH(ltrim(l_code(i),chr(10)||'' '')) > 0 THEN'||unistr('\000a')||
'      l_result                              := REPLACE( l_result, ''@$''||i||''$@'', ''<code>''||SUBSTR(htf.escape_sc(force_wrap(l_code(i),p_len)),1,'||unistr('\000a')||
'      ';

s:=s||'('||unistr('\000a')||
'        CASE'||unistr('\000a')||
'        WHEN LENGTH(l_result) > 31000 THEN'||unistr('\000a')||
'          0'||unistr('\000a')||
'        ELSE'||unistr('\000a')||
'          31000 - LENGTH(l_result)'||unistr('\000a')||
'        END))||''</code>'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      l_result := REPLACE( l_result, ''@$''||i||''$@'','''');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  wwv_flow.debug(''ending message length: ''||LENGTH(l_result));'||unistr('\000a')||
'  RETURN l_result;'||unistr('\000a')||
'END format_followup;'||unistr('\000a')||
'FUNCTION format_article('||unistr('\000a')||
'    p_string IN VARCHAR2,'||unistr('\000a')||
'    p_len   ';

s:=s||' IN NUMBER DEFAULT 80 )'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_string LONG DEFAULT REPLACE( DBMS_LOB.SUBSTR(p_string,32767,1) , chr(9), ''    '' );'||unistr('\000a')||
'  l_result LONG DEFAULT NULL;'||unistr('\000a')||
'  l_piece LONG;'||unistr('\000a')||
'  l_ws       VARCHAR2(25) DEFAULT '' '' || chr(9);'||unistr('\000a')||
'  l_sep      VARCHAR2(5) DEFAULT NULL;'||unistr('\000a')||
'  l_endofUrl VARCHAR2(255) DEFAULT chr(10) || chr(13) || chr(9) || '' )<>'';'||unistr('\000a')||
'  n          NUMBER;'||unistr('\000a')||
'  m          NUMBER;'||unistr('\000a')||
'  l_urls owa.vc_a';

s:=s||'rr;'||unistr('\000a')||
'  l_code owa.vc_arr;'||unistr('\000a')||
'type vc_tab'||unistr('\000a')||
'IS'||unistr('\000a')||
'  TABLE OF VARCHAR2(30);'||unistr('\000a')||
'  l_tags vc_tab;'||unistr('\000a')||
'  l_truncated BOOLEAN := false;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br/>'','' '');'||unistr('\000a')||
'  l_string    := REPLACE(l_string,''<br />'','' '');'||unistr('\000a')||
'  l_truncated := dbms_lob.getlength(l_string) >= g_max_message_length;'||unistr('\000a')||
'  wwv_flow.debug(''starting message length: ''||LENGTH(l_string));'||unistr('\000a')||
'';

s:=s||'  -- find and escape everything inside <code> tags'||unistr('\000a')||
'  FOR i IN 1 .. 1000'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    n          := instr( lower(l_string), ''<code>'');'||unistr('\000a')||
'    m          := instr( lower(l_string), ''</code>'', n );'||unistr('\000a')||
'    IF n        > 0 AND m = 0 AND l_truncated THEN'||unistr('\000a')||
'      m        := LENGTH(l_string);'||unistr('\000a')||
'      l_string := l_string||''</code>'';'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN n       = 0 OR m = 0;'||unistr('\000a')||
'    l_code(i) := SUBSTR( l_string,';

s:=s||' n    + LENGTH(''<code>''), (m - n) - LENGTH(''<code>''));'||unistr('\000a')||
'    l_string  := SUBSTR( l_string, 1, n - 1) || ''@$''||i||''$@'' || SUBSTR(l_string, m + LENGTH(''</code>''));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  l_result := l_string;'||unistr('\000a')||
'  -- add <code> sections back in'||unistr('\000a')||
'  FOR i IN 1 .. l_code.count'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF LENGTH(ltrim(l_code(i),chr(10)||'' '')) > 0 THEN'||unistr('\000a')||
'      l_result                              := REPLACE( l_result, ''@$''||i||''$@'',';

s:=s||' ''<pre class="brush:javascript">''||SUBSTR(htf.escape_sc(force_wrap(l_code(i),p_len)),1,'||unistr('\000a')||
'      ('||unistr('\000a')||
'        CASE'||unistr('\000a')||
'        WHEN LENGTH(l_result) > 31000 THEN'||unistr('\000a')||
'          0'||unistr('\000a')||
'        ELSE'||unistr('\000a')||
'          31000 - LENGTH(l_result)'||unistr('\000a')||
'        END))||''</pre>'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      l_result := REPLACE( l_result, ''@$''||i||''$@'','''');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  wwv_flow.debug(''ending message length: ''||LENGTH(l_result));'||unistr('\000a')||
'  RETURN l';

s:=s||'_result;'||unistr('\000a')||
'END format_article;'||unistr('\000a')||
'END BLOG_API;'||unistr('\000a')||
'/';

wwv_flow_api.append_to_install_script(
  p_id => 66361017078146335 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_script_clob => s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace'||unistr('\000a')||
'PACKAGE "BLOG_GUI"'||unistr('\000a')||
'AS'||unistr('\000a')||
'PROCEDURE print_article('||unistr('\000a')||
'    p_number NUMBER,'||unistr('\000a')||
'    p_search VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_date_month DATE DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id        VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article_id    VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_print_comment BOOLEAN DEFAULT true,'||unistr('\000a')||
'    p_page          NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_search_opt    VARCHAR2 DEFAULT NULL);'||unistr('\000a')||
'PROCEDURE print_article_previ';

s:=s||'ew('||unistr('\000a')||
'    p_number NUMBER,'||unistr('\000a')||
'    p_search VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_date_month DATE DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id        VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article_id    VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_print_comment BOOLEAN DEFAULT true,'||unistr('\000a')||
'    p_page          NUMBER DEFAULT NULL);'||unistr('\000a')||
'PROCEDURE print_categories('||unistr('\000a')||
'    P_NUMBER NUMBER);'||unistr('\000a')||
'PROCEDURE print_welcome;'||unistr('\000a')||
'PROCEDURE print_last_articles('||unistr('\000a')||
'    p_number NUMBER);'||unistr('\000a')||
'PROCE';

s:=s||'DURE print_pagination('||unistr('\000a')||
'    p_page_count   NUMBER DEFAULT 0,'||unistr('\000a')||
'    p_current_page NUMBER DEFAULT NULL);'||unistr('\000a')||
'PROCEDURE print_super ;'||unistr('\000a')||
'PROCEDURE print_resource ;'||unistr('\000a')||
'PROCEDURE print_favorite ;'||unistr('\000a')||
'PROCEDURE print_popular_articles('||unistr('\000a')||
'    p_number NUMBER);'||unistr('\000a')||
'PROCEDURE print_archives;'||unistr('\000a')||
'PROCEDURE print_clob('||unistr('\000a')||
'    p_clob IN CLOB );'||unistr('\000a')||
'PROCEDURE print_most_hit_articles('||unistr('\000a')||
'    p_number NUMBER);'||unistr('\000a')||
'END BLOG_GUI;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PACK';

s:=s||'AGE BODY "BLOG_GUI"'||unistr('\000a')||
'AS'||unistr('\000a')||
'PROCEDURE PRINT_WELCOME'||unistr('\000a')||
'AS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT REPLACE(msg_text,''#WORKSPACE#'',apex_application.get_current_flow_sgid(v(''APP_ID''))) msg_text'||unistr('\000a')||
'  FROM BLOG_MESSAGES'||unistr('\000a')||
'  WHERE MSG_TYPE = ''WELCOME'''||unistr('\000a')||
'  ORDER BY CREATED_ON DESC'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    HTP.p(APEX_APPLICATION.DO_SUBSTITUTIONS(I.MSG_TEXT));'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'END print_welcome;'||unistr('\000a')||
''||unistr('\000a')||
'PROCEDURE print_article('||unistr('\000a')||
'    p_number NUMBER,'||unistr('\000a')||
'    p_';

s:=s||'search VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_date_month DATE DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id        VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article_id    VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_print_comment BOOLEAN DEFAULT true,'||unistr('\000a')||
'    p_page          NUMBER DEFAULT NULL,'||unistr('\000a')||
'    p_search_opt    VARCHAR2 DEFAULT NULL)'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N            NUMBER := 0;'||unistr('\000a')||
'  ii           NUMBER := 0;'||unistr('\000a')||
'  l_edit       VARCHAR2(2000);'||unistr('\000a')||
'  rabbits      NUMBER := 0;'||unistr('\000a')||
'  l_';

s:=s||'comments   NUMBER := 0;'||unistr('\000a')||
'  v_sqlerrm    VARCHAR2(4000);'||unistr('\000a')||
'  l_rate       NUMBER;'||unistr('\000a')||
'  L_Line       NUMBER;  '||unistr('\000a')||
'BEGIN'||unistr('\000a')||
''||unistr('\000a')||
'  L_Line       := 1;'||unistr('\000a')||
'  FOR I        IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'    MSG_SUBJECT,'||unistr('\000a')||
'    REPLACE(msg_text,''#WORKSPACE#'',apex_application.get_current_flow_sgid(v(''APP_ID''))) MSG_TEXT,'||unistr('\000a')||
'    CREATED_ON,'||unistr('\000a')||
'    CREATED_BY_ID'||unistr('\000a')||
'  FROM BLOG_MESSAGES b'||unistr('\000a')||
'  WHERE msg_type                                       = ''STANDAR';

s:=s||'D'''||unistr('\000a')||
'  AND ( ( ( (instr(upper(msg_subject),upper(p_search)) > 0'||unistr('\000a')||
'  OR instr(upper(msg_text),upper(p_search))            > 0'||unistr('\000a')||
'  OR EXISTS'||unistr('\000a')||
'    (SELECT 1'||unistr('\000a')||
'    FROM blog_reg_users c'||unistr('\000a')||
'    WHERE instr(upper( fname'||unistr('\000a')||
'      ||'''''||unistr('\000a')||
'      ||lname), upper(p_search)) > 0'||unistr('\000a')||
'    AND b.created_by_id          = c.id'||unistr('\000a')||
'    ) )'||unistr('\000a')||
'  AND p_search_opt                                = ''ALL'' )'||unistr('\000a')||
'  OR ( (instr(upper(msg_subject),upper(p_s';

s:=s||'earch)) > 0 )'||unistr('\000a')||
'  AND p_search_opt                                = ''TITLE'' )'||unistr('\000a')||
'  OR ( ( instr(upper(msg_text),upper(p_search))   > 0 )'||unistr('\000a')||
'  AND p_search_opt                                = ''TEXT'' )'||unistr('\000a')||
'  OR ( ( EXISTS'||unistr('\000a')||
'    (SELECT 1'||unistr('\000a')||
'    FROM blog_reg_users c'||unistr('\000a')||
'    WHERE instr(upper( fname'||unistr('\000a')||
'      ||'''''||unistr('\000a')||
'      ||lname), upper(p_search)) > 0'||unistr('\000a')||
'    AND b.created_by_id          = c.id'||unistr('\000a')||
'    ) )'||unistr('\000a')||
'  AND p_search_opt        ';

s:=s||'= ''AUTHOR'' ) )'||unistr('\000a')||
'  OR p_search            IS NULL'||unistr('\000a')||
'  OR p_search_opt        IS NULL )'||unistr('\000a')||
'  AND (id                 = p_article_id'||unistr('\000a')||
'  OR p_article_id        IS NULL)'||unistr('\000a')||
'  AND (category_id        = p_cat_id'||unistr('\000a')||
'  OR p_cat_id            IS NULL)'||unistr('\000a')||
'  AND (TRUNC(Expire_Date) > TRUNC(Sysdate)'||unistr('\000a')||
'  OR Expire_Date         IS NULL)'||unistr('\000a')||
'  AND (EXISTS'||unistr('\000a')||
'    (SELECT c001'||unistr('\000a')||
'    FROM Apex_Collections'||unistr('\000a')||
'    WHERE Collection_Name = ''PAGINATI';

s:=s||'ON'''||unistr('\000a')||
'    AND C001              = TO_CHAR(Id)'||unistr('\000a')||
'    AND C002              = P_Page'||unistr('\000a')||
'    )'||unistr('\000a')||
'  OR p_page IS NULL)'||unistr('\000a')||
'  ORDER BY CREATED_ON DESC'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    N      := N + 1;'||unistr('\000a')||
'    l_line := 2;'||unistr('\000a')||
'    IF N    > P_Number THEN'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    '||unistr('\000a')||
'    htp.p(''<h2><a href="f?p=''||v(''APP_ALIAS'')||'':READ:0::::ARTICLE:''||i.id||''"><span style="font:bold 20px verdana,Arial,Sans-Serif;">''||i.msg_subject||''</span><';

s:=s||'/a></h2>'');'||unistr('\000a')||
'    FOR u IN'||unistr('\000a')||
'    (SELECT fname'||unistr('\000a')||
'      ||''.'''||unistr('\000a')||
'      ||lname,'||unistr('\000a')||
'      nick u ,'||unistr('\000a')||
'      id'||unistr('\000a')||
'    FROM blog_reg_users'||unistr('\000a')||
'    WHERE id = i.created_by_id'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      HTP.p(''<h3>Posted on ''||TO_CHAR(i.created_on, ''Month DD, YYYY HH:MIPM'')||'' by <span style="color:#D0EB55">''||u.u||''</span></h3>'');'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
''||unistr('\000a')||
'    print_clob(i.msg_text);'||unistr('\000a')||
'    htp.p(''<script>'||unistr('\000a')||
'      $(function(){'||unistr('\000a')||
'        $(".auto';

s:=s||'-submit-star'' || i.id || ''").rating({'||unistr('\000a')||
'          callback: function(value, link){'||unistr('\000a')||
'            var ajaxRequest = new htmldb_Get(null, $v("pFlowId"),"APPLICATION_PROCESS=RATE_MULTIPLE",0);'||unistr('\000a')||
'            ajaxRequest.addParam("x01", value);'||unistr('\000a')||
'            ajaxRequest.addParam("x02", '' || i.id || '');'||unistr('\000a')||
'            var results = ajaxRequest.get();'||unistr('\000a')||
'            ajaxRequest = null;'||unistr('\000a')||
'            $(".auto-submit-star';

s:=s||''' || i.id || ''").rating("disable");'||unistr('\000a')||
'          }'||unistr('\000a')||
'        });'||unistr('\000a')||
'      });'||unistr('\000a')||
'      </script>'''||unistr('\000a')||
'    );'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      SELECT rate'||unistr('\000a')||
'      INTO l_rate'||unistr('\000a')||
'      FROM blog_article_rate'||unistr('\000a')||
'      WHERE article_id = i.id ;'||unistr('\000a')||
'    EXCEPTION'||unistr('\000a')||
'    WHEN OTHERS THEN'||unistr('\000a')||
'      l_rate := NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'    '||unistr('\000a')||
'    htp.prn(''<div class="Clear">'');'||unistr('\000a')||
'    '||unistr('\000a')||
'    /*'||unistr('\000a')||
'    htp.prn('''||unistr('\000a')||
'      <div class="Clear">'||unistr('\000a')||
'      <a href="https://twitter.com/share';

s:=s||'" '||unistr('\000a')||
'      class="twitter-share-button"'||unistr('\000a')||
'      data-url="'' || blog_api.get_blog_url || ''f?p='' || v(''APP_ALIAS'') || '':READ:0::::ARTICLE:'' || i.id || ''"'||unistr('\000a')||
'      data-via="DbSWH"'||unistr('\000a')||
'      data-text="'' || i.msg_subject || ''"'||unistr('\000a')||
'      >Tweet</a>'||unistr('\000a')||
'    '');'||unistr('\000a')||
'    */'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF p_article_id IS NOT NULL THEN'||unistr('\000a')||
'      htp.prn(''<a href="https://twitter.com/share" class="twitter-share-button" data-via="dbswh">Tweet</a>'||unistr('\000a')||
'      ';

s:=s||'<script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>'||unistr('\000a')||
'        <g:plusone annotation="inline"></g:plusone>'||unistr('\000a')||
'        <script type="text/javascript">'||unistr('\000a')||
'          (function() {'||unistr('\000a')||
'            var po = document.createElement("script"); po.type = "text/javascript"; po.async = true;'||unistr('\000a')||
'            po.src = "https://apis.google.com/js/plusone.js";'||unistr('\000a')||
'            var s = document.getElements';

s:=s||'ByTagName("script")[0]; s.parentNode.insertBefore(po, s);'||unistr('\000a')||
'          })();'||unistr('\000a')||
'        </script>'||unistr('\000a')||
'      '');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
''||unistr('\000a')||
'    htp.prn(''<p>Please rate this article so that we can improve the content (red stars show the current rate):</p>'');'||unistr('\000a')||
'    '||unistr('\000a')||
'    FOR v IN'||unistr('\000a')||
'    (SELECT APEX_ITEM.RADIOGROUP (n,lvl,l_rate,NULL,''class="auto-submit-star'''||unistr('\000a')||
'      ||i.id'||unistr('\000a')||
'      ||''"'') a'||unistr('\000a')||
'    FROM'||unistr('\000a')||
'      ( SELECT level lvl FROM dual';

s:=s||' CONNECT BY level <= 5'||unistr('\000a')||
'      ) r'||unistr('\000a')||
'    ORDER BY lvl'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      htp.prn(v.a);'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    '||unistr('\000a')||
'    htp.prn(''</div>'');'||unistr('\000a')||
'    '||unistr('\000a')||
'    SELECT COUNT(*)'||unistr('\000a')||
'    INTO L_COMMENTS'||unistr('\000a')||
'    FROM BLOG_MESSAGES'||unistr('\000a')||
'    WHERE MSG_ID  = I.ID'||unistr('\000a')||
'    AND msg_type  = ''COMMENT'';'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF l_comments > 0 THEN'||unistr('\000a')||
'      rabbits    := rabbits + 1;'||unistr('\000a')||
'      htp.p(''<div class="date"><h3>'||unistr('\000a')||
'        <a href="javascript:animatedcollapse.tog';

s:=s||'gle(''''rabbit'' || rabbits || '''''')">Comments (''||L_COMMENTS||'')</a>'||unistr('\000a')||
'        </h3></div><div id="rabbit'' || rabbits || ''" class="rabits">'||unistr('\000a')||
'      '');'||unistr('\000a')||
'    ELSIF p_print_comment THEN'||unistr('\000a')||
'      htp.p(''<div class="date"><h3>'||unistr('\000a')||
'        <a href="f?p=''||v(''APP_ALIAS'')||'':WRITECOMMENT:0::::ARTICLE:'' || i.id || ''">Post first comment</a>'||unistr('\000a')||
'        </h3></div>'||unistr('\000a')||
'      '');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    '||unistr('\000a')||
'    ii    := 0;'||unistr('\000a')||
'    FOR j IN'||unistr('\000a')||
'    (';

s:=s||'SELECT id,'||unistr('\000a')||
'      REPLACE(REPLACE(msg_text,''<code>'',''<pre class="brush:javascript">''),''</code>'',''</pre>'') msg_text,'||unistr('\000a')||
'      created_on,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    FROM blog_messages'||unistr('\000a')||
'    WHERE msg_id = i.id'||unistr('\000a')||
'    AND msg_type = ''COMMENT'''||unistr('\000a')||
'    ORDER BY CREATED_ON'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      FOR u IN'||unistr('\000a')||
'      (SELECT fname'||unistr('\000a')||
'        ||''.'''||unistr('\000a')||
'        ||lname,'||unistr('\000a')||
'        nick u ,'||unistr('\000a')||
'        id'||unistr('\000a')||
'      FROM blog_reg_users'||unistr('\000a')||
'      WHERE ';

s:=s||'id = j.created_by_id'||unistr('\000a')||
'      )'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        l_edit := NULL;'||unistr('\000a')||
'        FOR uu IN'||unistr('\000a')||
'        (SELECT c001'||unistr('\000a')||
'        FROM apex_collections'||unistr('\000a')||
'        WHERE collection_name = ''COMMENTS'''||unistr('\000a')||
'        AND c001              = TO_CHAR(j.id)'||unistr('\000a')||
'        )'||unistr('\000a')||
'        LOOP'||unistr('\000a')||
'          l_edit :=''&nbsp;&nbsp;<a href="f?p=''||v(''APP_ALIAS'')||'':EDIT:0::::COMMENT:''||j.id||''"><b>Edit</b></a>'';'||unistr('\000a')||
'        END LOOP;'||unistr('\000a')||
'        htp.p(''<p style';

s:=s||'="margin:5px;">Posted on ''||TO_CHAR(j.created_on,''Month DD, YYYY HH:MIPM'')||'' by <span style="color:#D0EB55">'' ||u.u||''</span>''||l_edit||''</p>'');'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'      htp.p(j.msg_text);'||unistr('\000a')||
'      ii    := ii + 1;'||unistr('\000a')||
'      IF ii != l_comments THEN'||unistr('\000a')||
'        htp.p(''<hr>'');'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    IF l_comments > 0 AND p_print_comment THEN'||unistr('\000a')||
'      htp.p(''<div class="reply"><h3>'||unistr('\000a')||
'        <a href="f?p=''||';

s:=s||'v(''APP_ALIAS'')||'':WRITECOMMENT:0::::ARTICLE:''||i.id||''">Post comment</a>'||unistr('\000a')||
'        </h3></div>'||unistr('\000a')||
'      '');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_comments > 0 THEN'||unistr('\000a')||
'      htp.p(''</div>'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  IF rabbits > 0 THEN'||unistr('\000a')||
'    HTP.P(''<script type="text/javascript">'');'||unistr('\000a')||
'    FOR i IN 1..rabbits'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      htp.p(''animatedcollapse.addDiv(''''rabbit''||i||'''''', ''''fade=0,hide=1'''')'');'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    htp.p('''||unistr('\000a')||
'      ';

s:=s||'animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted'||unistr('\000a')||
'      //$: Access to jQuery'||unistr('\000a')||
'      //divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID'||unistr('\000a')||
'      //state: "block" or "none", depending on state'||unistr('\000a')||
'      };'||unistr('\000a')||
'      animatedcollapse.init()'||unistr('\000a')||
'      </script>'||unistr('\000a')||
'    '');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF n = 0 THEN'||unistr('\000a')||
'    htp.p(''<h3>Nothing found, pleas';

s:=s||'e search again.</h3>'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  '||unistr('\000a')||
'  IF p_article_id IS NOT NULL THEN'||unistr('\000a')||
'    BLOG_API.write_access_log( p_article_id, v(''P9_EMAIL''));'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF p_cat_id IS NOT NULL THEN'||unistr('\000a')||
'    BLOG_API.write_cat_access_log( p_cat_id, v(''P9_EMAIL''));'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  v_sqlerrm := sqlerrm;'||unistr('\000a')||
'  INSERT'||unistr('\000a')||
'  INTO BLOG_ERROR_LOG'||unistr('\000a')||
'    ('||unistr('\000a')||
'      Err_Message,'||unistr('\000a')||
'      Defined_Message,'||unistr('\000a')||
'      Id,'||unistr('\000a')||
'      Log_Seq_I';

s:=s||'d'||unistr('\000a')||
'    )'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      v_sqlerrm'||unistr('\000a')||
'      ||'' '''||unistr('\000a')||
'      ||l_line'||unistr('\000a')||
'      ||''page'''||unistr('\000a')||
'      ||p_page,'||unistr('\000a')||
'      ''Error in blog_gui.print_article'','||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL'||unistr('\000a')||
'    );'||unistr('\000a')||
'  htp.p(''<h3>Some error occured, please try again later.</h3>'');'||unistr('\000a')||
'  '||unistr('\000a')||
'END print_article;'||unistr('\000a')||
'PROCEDURE PRINT_CATEGORIES'||unistr('\000a')||
'  ('||unistr('\000a')||
'    P_NUMBER NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'IS'||unistr('\000a')||
'  N NUMBER := 0;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  htp.p(''        <ul>'');'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      catego';

s:=s||'ry_name'||unistr('\000a')||
'    FROM blog_categories b'||unistr('\000a')||
'    WHERE EXISTS'||unistr('\000a')||
'      (SELECT 1 FROM blog_messages WHERE category_id = b.id'||unistr('\000a')||
'      )'||unistr('\000a')||
'    ORDER BY CATEGORY_NAME'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    N   := N + 1;'||unistr('\000a')||
'    IF N > P_NUMBER THEN'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    htp.p( ''<li><a class="current" href="f?p=''||v(''APP_ALIAS'')||'':READCAT:0::::CATEGORY:''||i.id||''">''||i.category_name||''</a></li>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p(''      </ul>'');'||unistr('\000a')||
'END;'||unistr('\000a')||
'';

s:=s||'PROCEDURE PRINT_last_ARTICLEs'||unistr('\000a')||
'  ('||unistr('\000a')||
'    P_NUMBER NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N          NUMBER := 0;'||unistr('\000a')||
'  l_comments NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  htp.p(''<ul>'');'||unistr('\000a')||
'  FOR I IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      MSG_SUBJECT,'||unistr('\000a')||
'      MSG_TEXT,'||unistr('\000a')||
'      CREATED_ON,'||unistr('\000a')||
'      CREATED_BY_ID'||unistr('\000a')||
'    FROM BLOG_MESSAGES'||unistr('\000a')||
'    WHERE MSG_TYPE          = ''STANDARD'''||unistr('\000a')||
'    AND (TRUNC(expire_date) < TRUNC(sysdate)'||unistr('\000a')||
'    OR expire_date         IS NULL)'||unistr('\000a')||
'    ORDER BY CREATED_ON DE';

s:=s||'SC'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    N   := N + 1;'||unistr('\000a')||
'    IF N > P_NUMBER THEN'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    HTP.P(''<li><a href="f?p=''||v(''APP_ALIAS'')||'':READ:0::::ARTICLE:''||i.id||''">''||APEX_APPLICATION.DO_SUBSTITUTIONS(I.MSG_SUBJECT)||''</a></li>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p(''    </ul>'');'||unistr('\000a')||
'END print_last_articles;'||unistr('\000a')||
'PROCEDURE print_popular_articles'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_number NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N          NUMBER := 0;'||unistr('\000a')||
'  l_comments NUMBER;'||unistr('\000a')||
'BEG';

s:=s||'IN'||unistr('\000a')||
'  htp.p(''<ul>'');'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      msg_subject,'||unistr('\000a')||
'      msg_text,'||unistr('\000a')||
'      created_on,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    FROM blog_messages m,'||unistr('\000a')||
'      BLOG_ARTICLES_TOP20 t'||unistr('\000a')||
'    WHERE MSG_TYPE          = ''STANDARD'''||unistr('\000a')||
'    AND m.id                = t.article_id'||unistr('\000a')||
'    AND (TRUNC(expire_date) < TRUNC(sysdate)'||unistr('\000a')||
'    OR expire_date         IS NULL)'||unistr('\000a')||
'    ORDER BY thecount DESC'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    N   := N + 1;'||unistr('\000a')||
'    IF ';

s:=s||'N > P_NUMBER THEN'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    HTP.P(''<li><a href="f?p=''||v(''APP_ALIAS'')||'':READ:0::::ARTICLE:''||i.id||''">''||APEX_APPLICATION.DO_SUBSTITUTIONS(I.MSG_SUBJECT)||''</a></li>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p(''    </ul>'');'||unistr('\000a')||
'END print_popular_articles;'||unistr('\000a')||
'PROCEDURE print_most_hit_articles'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_number NUMBER'||unistr('\000a')||
'  )'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N          NUMBER := 0;'||unistr('\000a')||
'  l_comments NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  htp.p(''<ul>'');'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (S';

s:=s||'ELECT id,'||unistr('\000a')||
'      msg_subject,'||unistr('\000a')||
'      msg_text,'||unistr('\000a')||
'      created_on,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    FROM blog_messages m,'||unistr('\000a')||
'      blog_articles_hit20 t'||unistr('\000a')||
'    WHERE MSG_TYPE          = ''STANDARD'''||unistr('\000a')||
'    AND m.id                = t.article_id'||unistr('\000a')||
'    AND (TRUNC(expire_date) < TRUNC(sysdate)'||unistr('\000a')||
'    OR expire_date         IS NULL)'||unistr('\000a')||
'    ORDER BY hit_ratio DESC'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    N   := N + 1;'||unistr('\000a')||
'    IF N > P_NUMBER THEN'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    ';

s:=s||'END IF;'||unistr('\000a')||
'    HTP.P(''<li><a href="f?p=''||v(''APP_ALIAS'')||'':READ:0::::ARTICLE:''||i.id||''">''||APEX_APPLICATION.DO_SUBSTITUTIONS(I.MSG_SUBJECT)||''</a></li>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p(''    </ul>'');'||unistr('\000a')||
'END print_most_hit_articles;'||unistr('\000a')||
'PROCEDURE PRINT_super'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N          NUMBER := 0;'||unistr('\000a')||
'  l_comments NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      msg_subject,'||unistr('\000a')||
'      REPLACE(msg_text,''#WORKSPACE#'',apex_application.get_cur';

s:=s||'rent_flow_sgid(v(''APP_ID''))) msg_text,'||unistr('\000a')||
'      created_on,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    FROM'||unistr('\000a')||
'      (SELECT id,'||unistr('\000a')||
'        msg_subject,'||unistr('\000a')||
'        msg_text,'||unistr('\000a')||
'        created_on,'||unistr('\000a')||
'        created_by_id'||unistr('\000a')||
'      FROM blog_messages'||unistr('\000a')||
'      WHERE MSG_TYPE          = ''SUPER'''||unistr('\000a')||
'      AND (TRUNC(expire_date) < TRUNC(sysdate)'||unistr('\000a')||
'      OR expire_date         IS NULL)'||unistr('\000a')||
'      ORDER BY dbms_random.value'||unistr('\000a')||
'      )'||unistr('\000a')||
'    WHERE Rownum = 1'||unistr('\000a')||
'  )';

s:=s||''||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    Htp.P'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ''<h3>''||Apex_Application.Do_Substitutions(I.Msg_Subject)||''</h3>'''||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    HTP.P(''<p>''||APEX_APPLICATION.DO_SUBSTITUTIONS(I.MSG_TEXT)||''</p>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'END print_super;'||unistr('\000a')||
'PROCEDURE PRINT_resource'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N          NUMBER := 0;'||unistr('\000a')||
'  l_comments NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      msg_subject,'||unistr('\000a')||
'      REPLACE(msg_text,''#WORKSPACE#'',apex_application.get_current';

s:=s||'_flow_sgid(v(''APP_ID''))) msg_text,'||unistr('\000a')||
'      created_on,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    FROM'||unistr('\000a')||
'      (SELECT id,'||unistr('\000a')||
'        msg_subject,'||unistr('\000a')||
'        msg_text,'||unistr('\000a')||
'        created_on,'||unistr('\000a')||
'        created_by_id'||unistr('\000a')||
'      FROM blog_messages'||unistr('\000a')||
'      WHERE MSG_TYPE          = ''RESOURCE'''||unistr('\000a')||
'      AND (TRUNC(expire_date) < TRUNC(sysdate)'||unistr('\000a')||
'      OR expire_date         IS NULL)'||unistr('\000a')||
'      ORDER BY dbms_random.value'||unistr('\000a')||
'      )'||unistr('\000a')||
'    WHERE rownum = 1'||unistr('\000a')||
'  )'||unistr('\000a')||
'';

s:=s||'  LOOP'||unistr('\000a')||
'    htp.p'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ''<h3>''||apex_application.do_substitutions(i.msg_subject)||''</h3>'''||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    HTP.P(''<p>''||APEX_APPLICATION.DO_SUBSTITUTIONS(I.MSG_TEXT)||''</p>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'END print_resource;'||unistr('\000a')||
'PROCEDURE PRINT_favorite'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N          NUMBER := 0;'||unistr('\000a')||
'  l_comments NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR I IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      msg_subject,'||unistr('\000a')||
'      msg_text,'||unistr('\000a')||
'      created_on,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    FROM'||unistr('\000a')||
'';

s:=s||'      (SELECT id,'||unistr('\000a')||
'        msg_subject,'||unistr('\000a')||
'        msg_text,'||unistr('\000a')||
'        created_on,'||unistr('\000a')||
'        created_by_id'||unistr('\000a')||
'      FROM blog_messages'||unistr('\000a')||
'      WHERE MSG_TYPE          = ''FAVORITE'''||unistr('\000a')||
'      AND (TRUNC(expire_date) < TRUNC(sysdate)'||unistr('\000a')||
'      OR expire_date         IS NULL)'||unistr('\000a')||
'      ORDER BY dbms_random.value'||unistr('\000a')||
'      )'||unistr('\000a')||
'    WHERE rownum = 1'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    htp.p'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ''<h3>''||apex_application.do_substitutions(i.msg_subje';

s:=s||'ct)||''</h3>'''||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    HTP.P(''<p>''||APEX_APPLICATION.DO_SUBSTITUTIONS(I.MSG_TEXT)||''</p>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'END print_favorite;'||unistr('\000a')||
'PROCEDURE print_archives'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  htp.p(''<ul id="tree" class="jst">'');'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      name'||unistr('\000a')||
'    FROM vw_blog_calendar'||unistr('\000a')||
'    WHERE parent_id IS NULL'||unistr('\000a')||
'    ORDER BY name DESC'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    htp.p'||unistr('\000a')||
'    ('||unistr('\000a')||
'      ''<li id ="''||i.id||''" ><span class="folder"><a href';

s:=s||'="#">''||i.name||''</a></span><ul>'''||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'    FOR J IN'||unistr('\000a')||
'    (SELECT Id,'||unistr('\000a')||
'        (SELECT Month_Display FROM Wwv_Flow_Months_Month WHERE Month_Value = Name'||unistr('\000a')||
'        ) Name,'||unistr('\000a')||
'        Name N'||unistr('\000a')||
'      FROM vw_blog_calendar'||unistr('\000a')||
'      WHERE parent_id = i.id'||unistr('\000a')||
'      ORDER BY to_number(n) DESC'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      htp.p'||unistr('\000a')||
'      ('||unistr('\000a')||
'        ''<li id ="''||j.id||''"><span class="folder"><a href="#">''||j.name||''</a></span><';

s:=s||'ul>'''||unistr('\000a')||
'      )'||unistr('\000a')||
'      ;'||unistr('\000a')||
'      FOR k IN'||unistr('\000a')||
'      (SELECT id,'||unistr('\000a')||
'          msg_subject'||unistr('\000a')||
'        FROM vw_blog_calendar'||unistr('\000a')||
'        WHERE parent_id = j.id'||unistr('\000a')||
'        ORDER BY created_on DESC'||unistr('\000a')||
'      )'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        htp.p'||unistr('\000a')||
'        ('||unistr('\000a')||
'          ''<li id ="''||k.id||''"><span class="file"><a href="f?p=''||v(''APP_ALIAS'')||'':READ:0::::ARTICLE:''||k.id||''">''||k.msg_subject||''</a></span></li>'''||unistr('\000a')||
'        )'||unistr('\000a')||
'        ;'||unistr('\000a')||
'      END LOOP;';

s:=s||''||unistr('\000a')||
'      htp.p(''</ul>'');'||unistr('\000a')||
'      htp.p(''</li>'');'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    htp.p(''</ul>'');'||unistr('\000a')||
'    htp.p(''</li>'');'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p(''</ul>'');'||unistr('\000a')||
'END;'||unistr('\000a')||
'PROCEDURE print_clob'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_clob IN CLOB'||unistr('\000a')||
'  )'||unistr('\000a')||
'AS'||unistr('\000a')||
'  l_offset NUMBER DEFAULT 1;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    EXIT'||unistr('\000a')||
'  WHEN l_offset > dbms_lob.getlength(p_clob);'||unistr('\000a')||
'    htp.prn( dbms_lob.substr( p_clob, 255, l_offset ) );'||unistr('\000a')||
'    l_offset := l_offset + 255;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'END;'||unistr('\000a')||
'PROCEDURE pr';

s:=s||'int_pagination'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_page_count   NUMBER DEFAULT 0,'||unistr('\000a')||
'    p_current_page NUMBER DEFAULT NULL'||unistr('\000a')||
'  )'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N  NUMBER := 0;'||unistr('\000a')||
'  v  VARCHAR2(100);'||unistr('\000a')||
'  v1 VARCHAR2(100);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF NOT apex_collection.collection_exists(''PAGES'') THEN'||unistr('\000a')||
'    APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY_B( p_collection_name => ''PAGES'', p_query => ''select * from ('||unistr('\000a')||
'select distinct c002  from apex_collections where collection_name =';

s:=s||' ''''PAGINATION'''' order by to_number(c002)'||unistr('\000a')||
')'' );'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    APEX_COLLECTION.delete_COLLECTION( p_collection_name => ''PAGES'');'||unistr('\000a')||
'    APEX_COLLECTION.CREATE_COLLECTION_FROM_QUERY_B( p_collection_name => ''PAGES'', p_query => ''select * from ('||unistr('\000a')||
'select distinct c002  from apex_collections where collection_name = ''''PAGINATION'''' order by to_number(c002)'||unistr('\000a')||
')'' );'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF p_current_page = 1 THEN'||unistr('\000a')||
'    FOR i    ';

s:=s||'      IN 1..p_page_count'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF i = 1 OR i = p_page_count OR (i BETWEEN p_current_page AND p_current_page + 3) THEN'||unistr('\000a')||
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE'||unistr('\000a')||
'        ('||unistr('\000a')||
'          p_collection_name => ''PAGES'', p_seq => i, p_attr_number => ''2'', p_attr_value => ''YES'''||unistr('\000a')||
'        )'||unistr('\000a')||
'        ;'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE ( p_collection_name => ''PAGES'', p_seq =>';

s:=s||' i, p_attr_number => ''2'', p_attr_value => ''NO'');'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  elsif p_current_page = 2 THEN'||unistr('\000a')||
'    FOR i             IN 1..p_page_count'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF i = 1 OR i = p_page_count OR (i BETWEEN p_current_page AND p_current_page + 2) THEN'||unistr('\000a')||
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE'||unistr('\000a')||
'        ('||unistr('\000a')||
'          p_collection_name => ''PAGES'', p_seq => i, p_attr_number => ''2'', p_attr_value => ';

s:=s||'''YES'''||unistr('\000a')||
'        )'||unistr('\000a')||
'        ;'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE ( p_collection_name => ''PAGES'', p_seq => i, p_attr_number => ''2'', p_attr_value => ''NO'');'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  elsif p_current_page = p_page_count THEN'||unistr('\000a')||
'    FOR i             IN 1..p_page_count'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF i = 1 OR i = p_page_count OR (i BETWEEN p_current_page -3 AND p_current_page ) THEN'||unistr('\000a')||
'        APEX';

s:=s||'_COLLECTION.UPDATE_MEMBER_ATTRIBUTE'||unistr('\000a')||
'        ('||unistr('\000a')||
'          p_collection_name => ''PAGES'', p_seq => i, p_attr_number => ''2'', p_attr_value => ''YES'''||unistr('\000a')||
'        )'||unistr('\000a')||
'        ;'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE ( p_collection_name => ''PAGES'', p_seq => i, p_attr_number => ''2'', p_attr_value => ''NO'');'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    FOR i IN 1..p_page_count'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      IF i = 1 OR';

s:=s||' i = p_page_count OR (i BETWEEN p_current_page - 1 AND p_current_page + 2) THEN'||unistr('\000a')||
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE'||unistr('\000a')||
'        ('||unistr('\000a')||
'          p_collection_name => ''PAGES'', p_seq => i, p_attr_number => ''2'', p_attr_value => ''YES'''||unistr('\000a')||
'        )'||unistr('\000a')||
'        ;'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE ( p_collection_name => ''PAGES'', p_seq => i, p_attr_number => ''2'', p_attr_value => ''NO'')';

s:=s||';'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT DISTINCT 1'||unistr('\000a')||
'    FROM apex_collections'||unistr('\000a')||
'    WHERE collection_name = ''PAGES'''||unistr('\000a')||
'    AND c001             <=p_current_page'||unistr('\000a')||
'    AND c002              = ''NO'''||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE'||unistr('\000a')||
'    ('||unistr('\000a')||
'      p_collection_name => ''PAGES'', p_seq => 1, p_attr_number => ''3'', p_attr_value => ''YES'''||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (';

s:=s||'SELECT DISTINCT 1'||unistr('\000a')||
'    FROM apex_collections'||unistr('\000a')||
'    WHERE collection_name = ''PAGES'''||unistr('\000a')||
'    AND c001             >=p_current_page'||unistr('\000a')||
'    AND c002              = ''NO'''||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    APEX_COLLECTION.UPDATE_MEMBER_ATTRIBUTE'||unistr('\000a')||
'    ('||unistr('\000a')||
'      p_collection_name => ''PAGES'', p_seq => p_page_count, p_attr_number => ''3'', p_attr_value => ''YES'''||unistr('\000a')||
'    )'||unistr('\000a')||
'    ;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p(''<ul class="pagination">'||unistr('\000a')||
''');'||unistr('\000a')||
'  FOR i  IN'||unistr('\000a')||
'  (SELEC';

s:=s||'T *'||unistr('\000a')||
'    FROM apex_collections'||unistr('\000a')||
'    WHERE collection_name = ''PAGES'''||unistr('\000a')||
'    ORDER BY to_number(c001)'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    IF 1 = i.c001 AND NVL(i.c003,''NO'') = ''YES'' THEN'||unistr('\000a')||
'      v := ''<span style="display:inline;font-size:18px;color: rgb(208, 235, 85);">...</span>'';'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      v := NULL;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF p_page_count = i.c001 AND NVL(i.c003,''NO'') = ''YES'' THEN'||unistr('\000a')||
'      v1 := ''<span style="display:inline;font-';

s:=s||'size:18px;color: rgb(208, 235, 85);">...</span>'';'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      v1 := NULL;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF p_current_page = i.c001 THEN'||unistr('\000a')||
'      htp.p( ''<li>''||v1||''<a style="display:inline;" class="currentpage" href="#" >''||i.c001||''</a>''||v||''</li>'');'||unistr('\000a')||
'    elsif i.c002 = ''YES'' AND p_current_page != i.c001 THEN'||unistr('\000a')||
'      htp.p( ''<li>''||v1||''<a style="display: inline;" href="javascript:doSubmit(''''PAGE''||i.c001||'''''')';

s:=s||';" >''||i.c001||''</a>''||v||''</li>'');'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      htp.p( ''<li style="display:none;"><a style="display:none;" href="#" >''||i.c001||''</a></li>'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  htp.p('''||unistr('\000a')||
'</ul>'');'||unistr('\000a')||
'END;'||unistr('\000a')||
''||unistr('\000a')||
'PROCEDURE print_article_preview'||unistr('\000a')||
'  ('||unistr('\000a')||
'    p_number NUMBER,'||unistr('\000a')||
'    p_search VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_date_month DATE DEFAULT NULL,'||unistr('\000a')||
'    p_cat_id        VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_article_id    VARCHAR2 DEFAU';

s:=s||'LT NULL,'||unistr('\000a')||
'    p_print_comment BOOLEAN DEFAULT true,'||unistr('\000a')||
'    p_page          NUMBER DEFAULT NULL'||unistr('\000a')||
'  )'||unistr('\000a')||
'AS'||unistr('\000a')||
'  N            NUMBER := 0;'||unistr('\000a')||
'  ii           NUMBER := 0;'||unistr('\000a')||
'  l_edit       VARCHAR2(2000);'||unistr('\000a')||
'  rabbits      NUMBER := 0;'||unistr('\000a')||
'  l_comments   NUMBER := 0;'||unistr('\000a')||
'  v_sqlerrm    VARCHAR2(4000);'||unistr('\000a')||
'  l_rate       NUMBER;'||unistr('\000a')||
'  L_Line       NUMBER;'||unistr('\000a')||
'  l_page       NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  '||unistr('\000a')||
'  l_page       := p_page;'||unistr('\000a')||
'  L_Line       := 1;'||unistr('\000a')||
'  F';

s:=s||'OR I        IN'||unistr('\000a')||
'  (SELECT id,'||unistr('\000a')||
'      MSG_SUBJECT,'||unistr('\000a')||
'      REPLACE(msg_text,''#WORKSPACE#'',apex_application.get_current_flow_sgid(v(''APP_ID''))) MSG_TEXT,'||unistr('\000a')||
'      CREATED_ON,'||unistr('\000a')||
'      CREATED_BY_ID'||unistr('\000a')||
'    FROM BLOG_MESSAGES_PREVIEW'||unistr('\000a')||
'    WHERE msg_type                                 = ''STANDARD'''||unistr('\000a')||
'    AND (instr(upper(msg_subject),upper(p_search)) > 0'||unistr('\000a')||
'    OR instr(upper(msg_text),upper(p_search))      > 0'||unistr('\000a')||
'    OR p_';

s:=s||'search                                   IS NULL )'||unistr('\000a')||
'    AND (id                                        = p_article_id'||unistr('\000a')||
'    OR p_article_id                               IS NULL)'||unistr('\000a')||
'    AND (category_id                               = p_cat_id'||unistr('\000a')||
'    OR p_cat_id                                   IS NULL)'||unistr('\000a')||
'    AND (TRUNC(Expire_Date)                        > TRUNC(Sysdate)'||unistr('\000a')||
'    OR Expire_Date                 ';

s:=s||'               IS NULL)'||unistr('\000a')||
'    AND (EXISTS'||unistr('\000a')||
'      (SELECT c001'||unistr('\000a')||
'      FROM Apex_Collections'||unistr('\000a')||
'      WHERE Collection_Name = ''PAGINATION'''||unistr('\000a')||
'      AND C001              = TO_CHAR(Id)'||unistr('\000a')||
'      AND C002              = P_Page'||unistr('\000a')||
'      )'||unistr('\000a')||
'    OR p_page IS NULL)'||unistr('\000a')||
'    ORDER BY CREATED_ON DESC'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    N      := N + 1;'||unistr('\000a')||
'    l_line := 2;'||unistr('\000a')||
'    IF N    > P_Number THEN'||unistr('\000a')||
'      EXIT;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    --htp.p(''<h2>''||apex_appli';

s:=s||'cation.do_substitutions(i.msg_subject)||''</h2>'');'||unistr('\000a')||
'    htp.p(''<h2><a href="f?p=''||v(''APP_ALIAS'')||'':READ:0::::ARTICLE:''||i.id||''"><span style="font:bold 20px verdana,Arial,Sans-Serif;">''||i.msg_subject||''</span></a></h2>'');'||unistr('\000a')||
'    FOR u IN'||unistr('\000a')||
'    (SELECT fname'||unistr('\000a')||
'        ||''.'''||unistr('\000a')||
'        ||lname,'||unistr('\000a')||
'        nick u ,'||unistr('\000a')||
'        id'||unistr('\000a')||
'      FROM blog_reg_users'||unistr('\000a')||
'      WHERE id = i.created_by_id'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      HTP.p'||unistr('\000a')||
' ';

s:=s||'     ('||unistr('\000a')||
'        ''<h3>Posted on ''||TO_CHAR(i.created_on, ''Month DD, YYYY HH:MIPM'')||'' by <span style="color:#D0EB55">''||u.u||''</span></h3>'''||unistr('\000a')||
'      )'||unistr('\000a')||
'      ;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    -- htp.p(apex_application.do_substitutions(i.msg_text));'||unistr('\000a')||
'    --HTP.P(I.MSG_TEXT);'||unistr('\000a')||
'    print_clob(i.msg_text);'||unistr('\000a')||
'    htp.p(''<script type="text/javascript">'||unistr('\000a')||
'      $(function(){'||unistr('\000a')||
'        $(''''.auto-submit-star''||i.id||'''''').rating({'||unistr('\000a')||
'   ';

s:=s||'       callback: function(value, link){'||unistr('\000a')||
'            var ajaxRequest = new htmldb_Get(null, $v(''''pFlowId''''), ''''APPLICATION_PROCESS=RATE_MULTIPLE'''',0);'||unistr('\000a')||
'            ajaxRequest.addParam(''''x01'''', value);'||unistr('\000a')||
'            ajaxRequest.addParam(''''x02'''', ''||i.id||'');'||unistr('\000a')||
'            var results = ajaxRequest.get();'||unistr('\000a')||
'            ajaxRequest = null;'||unistr('\000a')||
'            $(''''.auto-submit-star''||i.id||'''''').rating(''''disable'''');'||unistr('\000a')||
'';

s:=s||'          }'||unistr('\000a')||
'        });'||unistr('\000a')||
'      });'||unistr('\000a')||
'      </script>'||unistr('\000a')||
'    '');'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      SELECT rate'||unistr('\000a')||
'      INTO l_rate'||unistr('\000a')||
'      FROM blog_article_rate'||unistr('\000a')||
'      WHERE article_id = i.id ;'||unistr('\000a')||
'    EXCEPTION'||unistr('\000a')||
'    WHEN OTHERS THEN'||unistr('\000a')||
'      l_rate := NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
''||unistr('\000a')||
'    htp.p(''<div class="Clear"><p>Please rate this article so that we can improve the content (red stars show the current rate):</p>'');'||unistr('\000a')||
'    '||unistr('\000a')||
'    FOR v IN'||unistr('\000a')||
'    (SELECT APE';

s:=s||'X_ITEM.RADIOGROUP (n,lvl,l_rate,NULL,''class="auto-submit-star'''||unistr('\000a')||
'      ||i.id'||unistr('\000a')||
'      ||''"'') a'||unistr('\000a')||
'    FROM'||unistr('\000a')||
'      ( SELECT level lvl FROM dual CONNECT BY level <= 5'||unistr('\000a')||
'      ) r'||unistr('\000a')||
'    ORDER BY lvl'||unistr('\000a')||
'    )'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      htp.p(v.a);'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    htp.p(''</div>'');'||unistr('\000a')||
'    SELECT COUNT(*)'||unistr('\000a')||
'    INTO L_COMMENTS'||unistr('\000a')||
'    FROM BLOG_MESSAGES_PREVIEW'||unistr('\000a')||
'    WHERE MSG_ID  = I.ID'||unistr('\000a')||
'    AND msg_type  = ''COMMENT'';'||unistr('\000a')||
'    '||unistr('\000a')||
'    IF l_comment';

s:=s||'s > 0 THEN'||unistr('\000a')||
'      rabbits    := rabbits + 1;'||unistr('\000a')||
'      htp.p(''<div class="date"><h3>'||unistr('\000a')||
'        <a href="javascript:animatedcollapse.toggle(''''rabbit''||rabbits||'''''')">Comments (''||L_COMMENTS||'')</a>'||unistr('\000a')||
'        </h3></div>'||unistr('\000a')||
'        <div id="rabbit'' || rabbits || ''" class="rabits">'||unistr('\000a')||
'      '');'||unistr('\000a')||
'    ELSIF p_print_comment THEN'||unistr('\000a')||
'      htp.p(''<div class="date"><h3>'||unistr('\000a')||
'        <a href="f?p=''||v(''APP_ALIAS'')||'':WRITECOMMENT:';

s:=s||'0::::ARTICLE:''||i.id||''">Post first comment</a>'||unistr('\000a')||
'        </h3></div>'||unistr('\000a')||
'      '');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    '||unistr('\000a')||
'    ii    := 0;'||unistr('\000a')||
'    '||unistr('\000a')||
'    FOR j IN'||unistr('\000a')||
'    (SELECT id,'||unistr('\000a')||
'      REPLACE(REPLACE(msg_text,''<code>'',''<pre class="brush:javascript">''),''</code>'',''</pre>'') msg_text,'||unistr('\000a')||
'      created_on,'||unistr('\000a')||
'      created_by_id'||unistr('\000a')||
'    FROM BLOG_MESSAGES_PREVIEW'||unistr('\000a')||
'    WHERE msg_id = i.id'||unistr('\000a')||
'    AND msg_type = ''COMMENT'''||unistr('\000a')||
'    ORDER BY CREATED_ON'||unistr('\000a')||
'    )';

s:=s||''||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      FOR u IN'||unistr('\000a')||
'      (SELECT fname'||unistr('\000a')||
'        ||''.'''||unistr('\000a')||
'        ||lname,'||unistr('\000a')||
'        nick u ,'||unistr('\000a')||
'        id'||unistr('\000a')||
'      FROM blog_reg_users'||unistr('\000a')||
'      WHERE id = j.created_by_id'||unistr('\000a')||
'      )'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        l_edit := NULL;'||unistr('\000a')||
'        FOR uu IN'||unistr('\000a')||
'        (SELECT c001'||unistr('\000a')||
'        FROM apex_collections'||unistr('\000a')||
'        WHERE collection_name = ''COMMENTS'''||unistr('\000a')||
'        AND c001              = TO_CHAR(j.id)'||unistr('\000a')||
'        )'||unistr('\000a')||
'        LOOP'||unistr('\000a')||
'          l_e';

s:=s||'dit :=''&nbsp;&nbsp;<a href="f?p=''||v(''APP_ALIAS'')||'':EDIT:0::::COMMENT:''||j.id||''"><b>Edit</b></a>'';'||unistr('\000a')||
'        END LOOP;'||unistr('\000a')||
'        htp.p(''<p style="margin:5px;">Posted on ''||TO_CHAR(j.created_on,''Month DD, YYYY HH:MIPM'')||'' by <span style="color:#D0EB55">'' ||u.u||''</span>''||l_edit||''</p>'');'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'      htp.p(j.msg_text);'||unistr('\000a')||
'      ii    := ii + 1;'||unistr('\000a')||
'      IF ii != l_comments THEN'||unistr('\000a')||
'        htp.p(''<h';

s:=s||'r>'');'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    IF l_comments > 0 AND p_print_comment THEN'||unistr('\000a')||
'      htp.p(''<div class="reply">'||unistr('\000a')||
'<h3>'||unistr('\000a')||
'<a href="f?p=''||v(''APP_ALIAS'')||'':WRITECOMMENT:0::::ARTICLE:''||i.id||''">Post comment</a>'||unistr('\000a')||
'</h3>'||unistr('\000a')||
'</div>'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'    IF l_comments > 0 THEN'||unistr('\000a')||
'      htp.p(''    </div>'');'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  IF rabbits > 0 THEN'||unistr('\000a')||
'    HTP.P(''<script type="text/javascript">'');'||unistr('\000a')||
'    FOR i IN 1..ra';

s:=s||'bbits'||unistr('\000a')||
'    LOOP'||unistr('\000a')||
'      htp.p(''animatedcollapse.addDiv(''''rabbit''||i||'''''', ''''fade=0,hide=1'''')'');'||unistr('\000a')||
'    END LOOP;'||unistr('\000a')||
'    htp.p('''||unistr('\000a')||
'      animatedcollapse.ontoggle=function($, divobj, state){};'||unistr('\000a')||
'      animatedcollapse.init()'||unistr('\000a')||
'      </script>'||unistr('\000a')||
'    '');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF n = 0 THEN'||unistr('\000a')||
'    htp.p(''<h3>Nothing found, please search again.</h3>'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'EXCEPTION'||unistr('\000a')||
'WHEN OTHERS THEN'||unistr('\000a')||
'  v_sqlerrm := sqlerrm;'||unistr('\000a')||
'  INSERT'||unistr('\000a')||
'  INTO BLO';

s:=s||'G_ERROR_LOG'||unistr('\000a')||
'    ('||unistr('\000a')||
'      Err_Message,'||unistr('\000a')||
'      Defined_Message,'||unistr('\000a')||
'      Id,'||unistr('\000a')||
'      Log_Seq_Id'||unistr('\000a')||
'    )'||unistr('\000a')||
'    VALUES'||unistr('\000a')||
'    ('||unistr('\000a')||
'      v_sqlerrm'||unistr('\000a')||
'      ||'' '''||unistr('\000a')||
'      ||l_line'||unistr('\000a')||
'      ||''page'''||unistr('\000a')||
'      ||p_page,'||unistr('\000a')||
'      ''Error in blog_gui.print_article'','||unistr('\000a')||
'      NULL,'||unistr('\000a')||
'      NULL'||unistr('\000a')||
'    );'||unistr('\000a')||
'  htp.p(''<h3>Some error occured, please try again later.</h3>'');'||unistr('\000a')||
'END print_article_preview;'||unistr('\000a')||
'END BLOG_GUI;'||unistr('\000a')||
'/';

wwv_flow_api.create_install_script(
  p_id => 66404101064160644 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'BLOG_GUI package',
  p_sequence=> 42,
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace'||unistr('\000a')||
'PROCEDURE "DOWNLOAD_FILE"('||unistr('\000a')||
'    p_file IN NUMBER)'||unistr('\000a')||
'AS'||unistr('\000a')||
'  v_mime      VARCHAR2(48);'||unistr('\000a')||
'  v_length    NUMBER;'||unistr('\000a')||
'  v_file_name VARCHAR2(2000);'||unistr('\000a')||
'  Lob_loc BLOB;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  SELECT mime_type,'||unistr('\000a')||
'    blob_content,'||unistr('\000a')||
'    FILENAME,'||unistr('\000a')||
'    dbms_lob.getlength(blob_content)'||unistr('\000a')||
'  INTO v_mime,'||unistr('\000a')||
'    lob_loc,'||unistr('\000a')||
'    v_file_name,'||unistr('\000a')||
'    v_length'||unistr('\000a')||
'  FROM BLOG_FILES'||unistr('\000a')||
'  WHERE id = p_file'||unistr('\000a')||
'      AND publish = ''Y'';'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- set up H';

s:=s||'TTP header'||unistr('\000a')||
'  --'||unistr('\000a')||
'  -- use an NVL around the mime type and'||unistr('\000a')||
'  -- if it is a null set it to application/octect'||unistr('\000a')||
'  -- application/octect may launch a download window from windows'||unistr('\000a')||
'  owa_util.mime_header( NVL(v_mime,''application/octet''), FALSE );'||unistr('\000a')||
'  -- set the size so the browser knows how much to download'||unistr('\000a')||
'  htp.p(''Content-length: '' || v_length);'||unistr('\000a')||
'  IF v_mime != ''text/html'' THEN'||unistr('\000a')||
'    -- the filename will be ';

s:=s||'used by the browser if the users does a save as'||unistr('\000a')||
'    htp.p(''Content-Disposition: attachment; filename="'' || v_file_name || ''"'');'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  -- close the headers'||unistr('\000a')||
'  owa_util.http_header_close;'||unistr('\000a')||
'  -- download the BLOB'||unistr('\000a')||
'  wpg_docload.download_file( Lob_loc );'||unistr('\000a')||
'END DOWNLOAD_FILE;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PROCEDURE "GET_GEOCODE_HOSTIP"'||unistr('\000a')||
'IS'||unistr('\000a')||
'  t_ apex_application_global.vc_arr2;'||unistr('\000a')||
'  l_lat   VARCHAR2(200);'||unistr('\000a')||
'  l_longt ';

s:=s||'VARCHAR2(200);'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR a IN'||unistr('\000a')||
'  (SELECT rowid,'||unistr('\000a')||
'    IP_ADDRESS,'||unistr('\000a')||
'    LAT,'||unistr('\000a')||
'    LONGT,'||unistr('\000a')||
'    CITY,'||unistr('\000a')||
'    REGION,'||unistr('\000a')||
'    COUNTRY,'||unistr('\000a')||
'    COUNTRY_CODE'||unistr('\000a')||
'  FROM BLOG_ACTIVITY_LOG'||unistr('\000a')||
'  WHERE ip_address IS NOT NULL'||unistr('\000a')||
'  AND country_code IS NULL'||unistr('\000a')||
'  AND time_stamp    > sysdate - 1.01'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_lat   := NULL;'||unistr('\000a')||
'    l_longt := NULL;'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'      FOR i IN'||unistr('\000a')||
'      (SELECT EXTRACTVALUE(VALUE(t), ''/*/name'') city,'||unistr('\000a')||
'        EXT';

s:=s||'RACTVALUE(VALUE(t), ''/*/countryName'') country,'||unistr('\000a')||
'        EXTRACTVALUE(VALUE(t), ''/*/ipLocation/pointProperty/Point/coordinates'') geocode'||unistr('\000a')||
'      FROM'||unistr('\000a')||
'        (SELECT REPLACE(httpuritype (''http://api.hostip.info/?ip='''||unistr('\000a')||
'          ||a.ip_address ).getClob (),''gml:'') mydata'||unistr('\000a')||
'        FROM dual'||unistr('\000a')||
'        ) c,'||unistr('\000a')||
'        TABLE(xmlsequence(xmltype.createxml(c.mydata).extract(''HostipLookupResultSet/featureMember/Host';

s:=s||'ip''))) t'||unistr('\000a')||
'      )'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        BEGIN'||unistr('\000a')||
'          t_      := apex_util.string_to_table(i.geocode,'','');'||unistr('\000a')||
'          l_lat   := t_(2);'||unistr('\000a')||
'          l_longt := t_(1);'||unistr('\000a')||
'        EXCEPTION'||unistr('\000a')||
'        WHEN OTHERS THEN'||unistr('\000a')||
'          NULL;'||unistr('\000a')||
'        END;'||unistr('\000a')||
'        UPDATE BLOG_ACTIVITY_LOG'||unistr('\000a')||
'        SET lat     = l_lat ,'||unistr('\000a')||
'          longt     = l_longt ,'||unistr('\000a')||
'          city      = i.city ,'||unistr('\000a')||
'          country   = i.country'||unistr('\000a')||
'        W';

s:=s||'HERE rowid = a.rowid;'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'    EXCEPTION'||unistr('\000a')||
'    WHEN OTHERS THEN'||unistr('\000a')||
'      NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  COMMIT;'||unistr('\000a')||
'  FOR a IN'||unistr('\000a')||
'  (SELECT rowid,'||unistr('\000a')||
'    remote_addr ip_address'||unistr('\000a')||
'  FROM BLOG_ARTICLE_LOG$'||unistr('\000a')||
'  WHERE remote_addr IS NOT NULL'||unistr('\000a')||
'  AND location      IS NULL'||unistr('\000a')||
'  AND access_date    > sysdate - 1.01'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP --dbms_output.put_line(a.ip_address);'||unistr('\000a')||
'    l_lat   := NULL;'||unistr('\000a')||
'    l_longt := NULL;'||unistr('\000a')||
'    BEGIN'||unistr('\000a')||
'     ';

s:=s||' FOR i IN'||unistr('\000a')||
'      (SELECT EXTRACTVALUE(VALUE(t), ''/*/name'') city,'||unistr('\000a')||
'        EXTRACTVALUE(VALUE(t), ''/*/countryName'') country,'||unistr('\000a')||
'        EXTRACTVALUE(VALUE(t), ''/*/ipLocation/pointProperty/Point/coordinates'') geocode'||unistr('\000a')||
'      FROM'||unistr('\000a')||
'        (SELECT REPLACE(httpuritype (''http://api.hostip.info/?ip='''||unistr('\000a')||
'          ||a.ip_address ).getClob (),''gml:'') mydata'||unistr('\000a')||
'        FROM dual'||unistr('\000a')||
'        ) c,'||unistr('\000a')||
'        TABLE(xmlsequence(xm';

s:=s||'ltype.createxml(c.mydata).extract(''HostipLookupResultSet/featureMember/Hostip''))) t'||unistr('\000a')||
'      )'||unistr('\000a')||
'      LOOP'||unistr('\000a')||
'        BEGIN'||unistr('\000a')||
'          t_      := apex_util.string_to_table(i.geocode,'','');'||unistr('\000a')||
'          l_lat   := t_(2); --dbms_output.put_line(l_lat);'||unistr('\000a')||
'          l_longt := t_(1); --dbms_output.put_line(l_longt);'||unistr('\000a')||
'        EXCEPTION'||unistr('\000a')||
'        WHEN OTHERS THEN'||unistr('\000a')||
'          NULL;'||unistr('\000a')||
'        END;'||unistr('\000a')||
'        UPDATE BLOG_ARTICLE_';

s:=s||'LOG$'||unistr('\000a')||
'        SET location = i.country -- currently only country'||unistr('\000a')||
'        WHERE rowid  = a.rowid;'||unistr('\000a')||
'      END LOOP;'||unistr('\000a')||
'    EXCEPTION'||unistr('\000a')||
'    WHEN OTHERS THEN'||unistr('\000a')||
'      NULL;'||unistr('\000a')||
'    END;'||unistr('\000a')||
'  END LOOP;'||unistr('\000a')||
'  COMMIT;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PROCEDURE "RSS"'||unistr('\000a')||
'  /*'||unistr('\000a')||
'  grant execute on blog.rss to public;'||unistr('\000a')||
'  create public synonym rss for BLOG.RSS;'||unistr('\000a')||
'  */'||unistr('\000a')||
'IS'||unistr('\000a')||
'  -- customizable parameters'||unistr('\000a')||
'  l_title       VARCHAR2(255) := ''DbSWH Goodie';

s:=s||'s on Oracle Application Express and Oracle Database, Linux, jQuery and etc'';'||unistr('\000a')||
'  l_link        VARCHAR2(255) := ''http://dbswh.webhop.net/dbswh/f?p=BLOG:HOME:0'';'||unistr('\000a')||
'  l_sublink     VARCHAR2(255) := ''http://dbswh.webhop.net/dbswh/'';'||unistr('\000a')||
'  l_description VARCHAR2(255) := ''This is a feed for DbSWH Blog most recent articles'';'||unistr('\000a')||
'  l_language    VARCHAR2(255) := ''en'';'||unistr('\000a')||
'  -- end customizable parameters'||unistr('\000a')||
'  l_version VAR';

s:=s||'CHAR2(10) := ''2.0'';'||unistr('\000a')||
'  l_clob CLOB;'||unistr('\000a')||
'  l_idx pls_integer     := 1;'||unistr('\000a')||
'  l_len pls_integer     := 255;'||unistr('\000a')||
'  l_defrows pls_integer := 10;'||unistr('\000a')||
'  l_maxrows pls_integer := 50;'||unistr('\000a')||
'  l_desclen pls_integer := 250;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT xmlelement( "rss",'||unistr('\000a')||
'    -- Begin XML Header Block'||unistr('\000a')||
'    xmlattributes( l_version AS "version"), xmlelement( "channel", xmlforest( l_title AS "title", l_link AS "link", l_description AS ';

s:=s||'"description", l_language AS "language"),'||unistr('\000a')||
'    -- End XML Header Block'||unistr('\000a')||
'    -- Begin List of Individual Articles or Items'||unistr('\000a')||
'    xmlagg( xmlelement( "item", xmlelement("title", x.title), xmlelement("link", x.link), xmlelement("description", x.description), xmlelement("author", x.nick), xmlelement("pubDate", TO_CHAR(x.updated_on,''Dy, DD Mon RRRR hh24:mi:ss'')), xmlelement("guid", XMLATTRIBUTES(''false'' AS';

s:=s||' "isPermaLink"),x.id'||unistr('\000a')||
'    ||TO_CHAR(x.updated_on,''JHH24MISS'')) ) )'||unistr('\000a')||
'    -- End List of Individual Articles or Items'||unistr('\000a')||
'    ) ) AS result'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    ( -- Actual Database Query that populates the list of Items'||unistr('\000a')||
'    SELECT id,'||unistr('\000a')||
'      msg_subject title,'||unistr('\000a')||
'      l_sublink'||unistr('\000a')||
'      ||''f?p=BLOG:READ:0::::ARTICLE:'''||unistr('\000a')||
'      ||id LINK,'||unistr('\000a')||
'      rss_description description,'||unistr('\000a')||
'      created_on updated_on,'||unistr('\000a')||
'      nick'||unistr('\000a')||
'    FROM bl';

s:=s||'og_msg b'||unistr('\000a')||
'    WHERE msg_type           = ''STANDARD'''||unistr('\000a')||
'    AND ( TRUNC(expire_date) > TRUNC(sysdate)'||unistr('\000a')||
'    OR expire_date          IS NULL)'||unistr('\000a')||
'    ORDER BY created_on DESC'||unistr('\000a')||
'    ) x'||unistr('\000a')||
'  WHERE rownum < (l_maxrows+1)'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_clob := xmltype.extract(i.result,''/'').getclobval;'||unistr('\000a')||
'    EXIT;'||unistr('\000a')||
'  END LOOP; --i'||unistr('\000a')||
'  --- OUTPUT RESULTS'||unistr('\000a')||
'  owa_util.mime_header(''application/xml'', false);'||unistr('\000a')||
'  owa_util.http_header_close;'||unistr('\000a')||
'  FO';

s:=s||'R i IN 1..ceil(dbms_lob.getlength(l_clob)/l_len)'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    htp.prn(SUBSTR(l_clob,l_idx,l_len));'||unistr('\000a')||
'    l_idx := l_idx + l_len;'||unistr('\000a')||
'  END LOOP; --i'||unistr('\000a')||
'END rss;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PROCEDURE "RSS_HOT"'||unistr('\000a')||
'  /*'||unistr('\000a')||
'  grant execute on blog.rss to public;'||unistr('\000a')||
'  create public synonym rss for BLOG.RSS;'||unistr('\000a')||
'  */'||unistr('\000a')||
'IS'||unistr('\000a')||
'  -- customizable parameters'||unistr('\000a')||
'  l_title       VARCHAR2(255) := ''DbSWH Goodies on Oracle Application Express and Oracl';

s:=s||'e Database, Linux, jQuery and etc'';'||unistr('\000a')||
'  l_link        VARCHAR2(255) := ''http://dbswh.webhop.net/dbswh/f?p=BLOG:HOME:0'';'||unistr('\000a')||
'  l_sublink     VARCHAR2(255) := ''http://dbswh.webhop.net/dbswh/'';'||unistr('\000a')||
'  l_description VARCHAR2(255) := ''This is a feed for DbSWH Blog hot articles (most comments)'';'||unistr('\000a')||
'  l_language    VARCHAR2(255) := ''en'';'||unistr('\000a')||
'  -- end customizable parameters'||unistr('\000a')||
'  l_version VARCHAR2(10) := ''2.0'';'||unistr('\000a')||
'  l_clob CLOB';

s:=s||';'||unistr('\000a')||
'  l_idx pls_integer     := 1;'||unistr('\000a')||
'  l_len pls_integer     := 255;'||unistr('\000a')||
'  l_defrows pls_integer := 10;'||unistr('\000a')||
'  l_maxrows pls_integer := 30;'||unistr('\000a')||
'  l_desclen pls_integer := 250;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT xmlelement( "rss",'||unistr('\000a')||
'    -- Begin XML Header Block'||unistr('\000a')||
'    xmlattributes( l_version AS "version"), xmlelement( "channel", xmlforest( l_title AS "title", l_link AS "link", l_description AS "description", l_language AS "lan';

s:=s||'guage"),'||unistr('\000a')||
'    -- End XML Header Block'||unistr('\000a')||
'    -- Begin List of Individual Articles or Items'||unistr('\000a')||
'    xmlagg( xmlelement( "item", xmlelement("title", x.title), xmlelement("link", x.link), xmlelement("description", x.description), xmlelement("author", x.nick), xmlelement("pubDate", TO_CHAR(x.updated_on,''Dy, DD Mon RRRR hh24:mi:ss'')), xmlelement("guid", XMLATTRIBUTES(''false'' AS "isPermaLink"),x.id'||unistr('\000a')||
'    ||TO_CHA';

s:=s||'R(x.updated_on,''JHH24MISS'')) ) )'||unistr('\000a')||
'    -- End List of Individual Articles or Items'||unistr('\000a')||
'    ) ) AS result'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    ( -- Actual Database Query that populates the list of Items'||unistr('\000a')||
'    SELECT b.id,'||unistr('\000a')||
'      b.msg_subject title,'||unistr('\000a')||
'      ''http://dbswh.webhop.net/dbswh/f?p=BLOG:READ:0::::ARTICLE:'''||unistr('\000a')||
'      ||b.id LINK,'||unistr('\000a')||
'      b.rss_description description,'||unistr('\000a')||
'      b.created_on updated_on,'||unistr('\000a')||
'      COUNT(c.id) count_c,'||unistr('\000a')||
'      ';

s:=s||'b.nick'||unistr('\000a')||
'    FROM blog_msg b,'||unistr('\000a')||
'      blog_msg c'||unistr('\000a')||
'    WHERE b.msg_type          = ''STANDARD'''||unistr('\000a')||
'    AND c.msg_id              = b.id'||unistr('\000a')||
'    AND (TRUNC(b.expire_date) > TRUNC(sysdate)'||unistr('\000a')||
'    OR b.expire_date         IS NULL)'||unistr('\000a')||
'    GROUP BY b.id,'||unistr('\000a')||
'      b.msg_subject,'||unistr('\000a')||
'      l_sublink'||unistr('\000a')||
'      ||''f?p=BLOG:READ:0::::ARTICLE:'''||unistr('\000a')||
'      ||b.id,'||unistr('\000a')||
'      b.rss_description,'||unistr('\000a')||
'      b.created_on,'||unistr('\000a')||
'      b.nick'||unistr('\000a')||
'    ORDER BY COUNT(c.id)';

s:=s||' DESC'||unistr('\000a')||
'    ) x'||unistr('\000a')||
'  WHERE rownum < (l_maxrows+1)'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_clob := xmltype.extract(i.result,''/'').getclobval;'||unistr('\000a')||
'    EXIT;'||unistr('\000a')||
'  END LOOP; --i'||unistr('\000a')||
'  --- OUTPUT RESULTS'||unistr('\000a')||
'  owa_util.mime_header(''application/xml'', false);'||unistr('\000a')||
'  owa_util.http_header_close;'||unistr('\000a')||
'  FOR i IN 1..ceil(dbms_lob.getlength(l_clob)/l_len)'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    htp.prn(SUBSTR(l_clob,l_idx,l_len));'||unistr('\000a')||
'    l_idx := l_idx + l_len;'||unistr('\000a')||
'  END LOOP; --i'||unistr('\000a')||
'END rss_hot;'||unistr('\000a')||
'/'||unistr('\000a')||
'c';

s:=s||'reate or replace'||unistr('\000a')||
'PROCEDURE "RSS_POPULAR"'||unistr('\000a')||
'  /*'||unistr('\000a')||
'  grant execute on blog.rss to public;'||unistr('\000a')||
'  create public synonym rss for BLOG.RSS;'||unistr('\000a')||
'  */'||unistr('\000a')||
'IS'||unistr('\000a')||
'  -- customizable parameters'||unistr('\000a')||
'  l_title       VARCHAR2(255) := ''DbSWH Goodies on Oracle Application Express and Oracle Database, Linux, jQuery and etc'';'||unistr('\000a')||
'  l_link        VARCHAR2(255) := ''http://dbswh.webhop.net/dbswh/f?p=BLOG:HOME:0'';'||unistr('\000a')||
'  l_sublink     VARCHAR2(255) :';

s:=s||'= ''http://dbswh.webhop.net/dbswh/'';'||unistr('\000a')||
'  l_description VARCHAR2(255) := ''This is a feed for DbSWH Blog by popularity (number of clicks)'';'||unistr('\000a')||
'  l_language    VARCHAR2(255) := ''en'';'||unistr('\000a')||
'  -- end customizable parameters'||unistr('\000a')||
'  l_version VARCHAR2(10) := ''2.0'';'||unistr('\000a')||
'  l_clob CLOB;'||unistr('\000a')||
'  l_idx pls_integer     := 1;'||unistr('\000a')||
'  l_len pls_integer     := 255;'||unistr('\000a')||
'  l_defrows pls_integer := 10;'||unistr('\000a')||
'  l_maxrows pls_integer := 20;'||unistr('\000a')||
'  l_desclen pls_int';

s:=s||'eger := 250;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT xmlelement( "rss",'||unistr('\000a')||
'    -- Begin XML Header Block'||unistr('\000a')||
'    xmlattributes( l_version AS "version"), xmlelement( "channel", xmlforest( l_title AS "title", l_link AS "link", l_description AS "description", l_language AS "language"),'||unistr('\000a')||
'    -- End XML Header Block'||unistr('\000a')||
'    -- Begin List of Individual Articles or Items'||unistr('\000a')||
'    xmlagg( xmlelement( "item", xmlelement("title", x.titl';

s:=s||'e), xmlelement("link", x.link), xmlelement("description", x.description), xmlelement("author", x.nick), xmlelement("pubDate", TO_CHAR(x.updated_on,''Dy, DD Mon RRRR hh24:mi:ss'')), xmlelement("guid", XMLATTRIBUTES(''false'' AS "isPermaLink"),x.id'||unistr('\000a')||
'    ||TO_CHAR(x.updated_on,''JHH24MISS'')) ) )'||unistr('\000a')||
'    -- End List of Individual Articles or Items'||unistr('\000a')||
'    ) ) AS result'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    ( -- Actual Database Query that pop';

s:=s||'ulates the list of Items'||unistr('\000a')||
'    SELECT id,'||unistr('\000a')||
'      msg_subject title,'||unistr('\000a')||
'      l_sublink'||unistr('\000a')||
'      ||''f?p=BLOG:READ:0::::ARTICLE:'''||unistr('\000a')||
'      ||id LINK,'||unistr('\000a')||
'      rss_description description,'||unistr('\000a')||
'      created_on updated_on,'||unistr('\000a')||
'      nick'||unistr('\000a')||
'    FROM blog_msg b,'||unistr('\000a')||
'      BLOG_ARTICLES_TOP20 a'||unistr('\000a')||
'    WHERE msg_type          = ''STANDARD'''||unistr('\000a')||
'    AND b.id                = a.article_id (+)'||unistr('\000a')||
'    AND (TRUNC(expire_date) > TRUNC(sysdate)'||unistr('\000a')||
'    OR ';

s:=s||'expire_date         IS NULL)'||unistr('\000a')||
'    ORDER BY NVL(thecount,0) DESC'||unistr('\000a')||
'    ) x'||unistr('\000a')||
'  WHERE rownum < (l_maxrows+1)'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_clob := xmltype.extract(i.result,''/'').getclobval;'||unistr('\000a')||
'    EXIT;'||unistr('\000a')||
'  END LOOP; --i'||unistr('\000a')||
'  --- OUTPUT RESULTS'||unistr('\000a')||
'  owa_util.mime_header(''application/xml'', false);'||unistr('\000a')||
'  owa_util.http_header_close;'||unistr('\000a')||
'  FOR i IN 1..ceil(dbms_lob.getlength(l_clob)/l_len)'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    htp.prn(SUBSTR(l_clob,l_idx,l_len));'||unistr('\000a')||
'   ';

s:=s||' l_idx := l_idx + l_len;'||unistr('\000a')||
'  END LOOP; --i'||unistr('\000a')||
'END rss_popular;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PROCEDURE "RSS_RECENT"'||unistr('\000a')||
'  /*'||unistr('\000a')||
'  grant execute on blog.rss to public;'||unistr('\000a')||
'  create public synonym rss for BLOG.RSS;'||unistr('\000a')||
'  */'||unistr('\000a')||
'IS'||unistr('\000a')||
'  -- customizable parameters'||unistr('\000a')||
'  l_title       VARCHAR2(255) := ''DbSWH Goodies on Oracle Application Express and Oracle Database, Linux, jQuery and etc'';'||unistr('\000a')||
'  l_link        VARCHAR2(255) := ''http://dbswh.webhop';

s:=s||'.net/dbswh/f?p=BLOG:HOME:0'';'||unistr('\000a')||
'  l_sublink     VARCHAR2(255) := ''http://dbswh.webhop.net/dbswh/'';'||unistr('\000a')||
'  l_description VARCHAR2(255) := ''This is a feed for DbSWH Blog most recent articles'';'||unistr('\000a')||
'  l_language    VARCHAR2(255) := ''en'';'||unistr('\000a')||
'  -- end customizable parameters'||unistr('\000a')||
'  l_version VARCHAR2(10) := ''2.0'';'||unistr('\000a')||
'  l_clob CLOB;'||unistr('\000a')||
'  l_idx pls_integer     := 1;'||unistr('\000a')||
'  l_len pls_integer     := 255;'||unistr('\000a')||
'  l_defrows pls_integer := 10;'||unistr('\000a')||
'  ';

s:=s||'l_maxrows pls_integer := 30;'||unistr('\000a')||
'  l_desclen pls_integer := 250;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  FOR i IN'||unistr('\000a')||
'  (SELECT xmlelement( "rss",'||unistr('\000a')||
'    -- Begin XML Header Block'||unistr('\000a')||
'    xmlattributes( l_version AS "version"), xmlelement( "channel", xmlforest( l_title AS "title", l_link AS "link", l_description AS "description", l_language AS "language"),'||unistr('\000a')||
'    -- End XML Header Block'||unistr('\000a')||
'    -- Begin List of Individual Articles or Items'||unistr('\000a')||
'    xmlagg';

s:=s||'( xmlelement( "item", xmlelement("title", x.title), xmlelement("link", x.link), xmlelement("description", x.description), xmlelement("author", x.nick), xmlelement("pubDate", TO_CHAR(x.updated_on,''Dy, DD Mon RRRR hh24:mi:ss'')), xmlelement("guid", XMLATTRIBUTES(''false'' AS "isPermaLink"),x.id'||unistr('\000a')||
'    ||TO_CHAR(x.updated_on,''JHH24MISS'')) ) )'||unistr('\000a')||
'    -- End List of Individual Articles or Items'||unistr('\000a')||
'    ) ) AS resul';

s:=s||'t'||unistr('\000a')||
'  FROM'||unistr('\000a')||
'    ( -- Actual Database Query that populates the list of Items'||unistr('\000a')||
'    SELECT id,'||unistr('\000a')||
'      msg_subject title,'||unistr('\000a')||
'      l_sublink'||unistr('\000a')||
'      ||''f?p=BLOG:READ:0::::ARTICLE:'''||unistr('\000a')||
'      ||id LINK,'||unistr('\000a')||
'      rss_description description,'||unistr('\000a')||
'      created_on updated_on,'||unistr('\000a')||
'      nick'||unistr('\000a')||
'    FROM blog_msg b'||unistr('\000a')||
'    WHERE msg_type           = ''STANDARD'''||unistr('\000a')||
'    AND ( TRUNC(expire_date) > TRUNC(sysdate)'||unistr('\000a')||
'    OR expire_date          IS NU';

s:=s||'LL)'||unistr('\000a')||
'    ORDER BY created_on DESC'||unistr('\000a')||
'    ) x'||unistr('\000a')||
'  WHERE rownum < (l_maxrows+1)'||unistr('\000a')||
'  )'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    l_clob := xmltype.extract(i.result,''/'').getclobval;'||unistr('\000a')||
'    EXIT;'||unistr('\000a')||
'  END LOOP; --i'||unistr('\000a')||
'  --- OUTPUT RESULTS'||unistr('\000a')||
'  owa_util.mime_header(''application/xml'', false);'||unistr('\000a')||
'  owa_util.http_header_close;'||unistr('\000a')||
'  FOR i IN 1..ceil(dbms_lob.getlength(l_clob)/l_len)'||unistr('\000a')||
'  LOOP'||unistr('\000a')||
'    htp.prn(SUBSTR(l_clob,l_idx,l_len));'||unistr('\000a')||
'    l_idx := l_idx + l_len;'||unistr('\000a')||
'  END';

s:=s||' LOOP; --i'||unistr('\000a')||
'END rss_recent;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'PROCEDURE "SEND_MAIL"('||unistr('\000a')||
'    p_to        IN VARCHAR2,'||unistr('\000a')||
'    p_from      IN VARCHAR2,'||unistr('\000a')||
'    p_body      IN VARCHAR2,'||unistr('\000a')||
'    p_body_html IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_subj      IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_cc        IN VARCHAR2 DEFAULT NULL,'||unistr('\000a')||
'    p_bcc       IN VARCHAR2 DEFAULT NULL)'||unistr('\000a')||
'AS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  APEX_MAIL.SEND( p_to , p_from , p_body , p_body_html , p_subj , ';

s:=s||'p_cc , p_bcc );'||unistr('\000a')||
'END SEND_MAIL;'||unistr('\000a')||
'/';

wwv_flow_api.create_install_script(
  p_id => 125458740317323895 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Procedures',
  p_sequence=> 50,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'create or replace'||unistr('\000a')||
'FUNCTION "BLOG_CUSTOM_HASH"('||unistr('\000a')||
'    p_username IN VARCHAR2,'||unistr('\000a')||
'    p_password IN VARCHAR2)'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_password VARCHAR2(4000);'||unistr('\000a')||
'  l_salt     VARCHAR2(4000) := ''EVQELZY27PVLWPHMRN8B0CRRMAXBR8'';'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- This function should be wrapped, as the hash algorhythm is exposed here.'||unistr('\000a')||
'  -- You can change the value of l_salt or the method of which to call the'||unistr('\000a')||
'  -- DBMS_OBFUSCATOIN t';

s:=s||'oolkit, but you much reset all of your passwords'||unistr('\000a')||
'  -- if you choose to do this.'||unistr('\000a')||
'  l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5 (input_string => p_password || SUBSTR(l_salt,10,13) || p_username || SUBSTR(l_salt, 4,10)));'||unistr('\000a')||
'  RETURN l_password;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'FUNCTION "CHECK_EMAIL"('||unistr('\000a')||
'    l_email IN VARCHAR2)'||unistr('\000a')||
'  RETURN BOOLEAN'||unistr('\000a')||
'IS'||unistr('\000a')||
'  l_dot_pos    NUMBER;'||unistr('\000a')||
'  l_at_pos     NUMBER;'||unistr('\000a')||
' ';

s:=s||' l_str_length NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  IF l_email IS NULL THEN'||unistr('\000a')||
'    RETURN false;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  l_dot_pos     := instr(l_email ,''.'');'||unistr('\000a')||
'  l_at_pos      := instr(l_email ,''@'');'||unistr('\000a')||
'  l_str_length  := LENGTH(l_email);'||unistr('\000a')||
'  IF ((l_dot_pos = 0) OR (l_at_pos = 0) OR (l_dot_pos = l_at_pos + 1) OR (l_at_pos = 1) OR (l_at_pos = l_str_length) OR (l_dot_pos = l_str_length)) THEN'||unistr('\000a')||
'    RETURN false;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  IF instr(SUBSTR(l_e';

s:=s||'mail ,l_at_pos) ,''.'') = 0 THEN'||unistr('\000a')||
'    RETURN false;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'  RETURN true;'||unistr('\000a')||
'END check_email;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'FUNCTION "GET_CLIENT_IP"'||unistr('\000a')||
'  RETURN VARCHAR2'||unistr('\000a')||
'IS'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  RETURN owa_util.get_cgi_env(''REMOTE_ADDR'');'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'create or replace'||unistr('\000a')||
'FUNCTION "BLOG_AUTH"('||unistr('\000a')||
'    p_username IN VARCHAR2,'||unistr('\000a')||
'    p_password IN VARCHAR2)'||unistr('\000a')||
'  RETURN BOOLEAN'||unistr('\000a')||
'IS'||unistr('\000a')||
'  AUTH_SUCCESS            CONSTANT INTEGER      := 0;'||unistr('\000a')||
'  AUTH_UNKNOWN';

s:=s||'_USER       CONSTANT INTEGER      := 1;'||unistr('\000a')||
'  AUTH_ACCOUNT_LOCKED     CONSTANT INTEGER      := 2;'||unistr('\000a')||
'  AUTH_ACCOUNT_EXPIRED    CONSTANT INTEGER      := 3;'||unistr('\000a')||
'  AUTH_PASSWORD_INCORRECT CONSTANT INTEGER      := 4;'||unistr('\000a')||
'  AUTH_PASSWORD_FIRST_USE CONSTANT INTEGER      := 5;'||unistr('\000a')||
'  AUTH_ATTEMPTS_EXCEEDED  CONSTANT INTEGER      := 6;'||unistr('\000a')||
'  AUTH_INTERNAL_ERROR     CONSTANT INTEGER      := 7;'||unistr('\000a')||
'  '||unistr('\000a')||
'  l_password        VARCHAR2(4000';

s:=s||');'||unistr('\000a')||
'  l_stored_password VARCHAR2(4000);'||unistr('\000a')||
'  l_expires_on      DATE;'||unistr('\000a')||
'  l_count           NUMBER;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  -- First, check to see if the user is in the user table'||unistr('\000a')||
'  SELECT COUNT(1)'||unistr('\000a')||
'  INTO l_count'||unistr('\000a')||
'  FROM blog_reg_users'||unistr('\000a')||
'  WHERE upper(email) = upper(p_username);'||unistr('\000a')||
'    '||unistr('\000a')||
'  IF l_count > 0 THEN'||unistr('\000a')||
'    -- First, we fetch the stored hashed password & expire date'||unistr('\000a')||
'    SELECT password,'||unistr('\000a')||
'      sysdate + 1'||unistr('\000a')||
'    INTO l_store';

s:=s||'d_password,'||unistr('\000a')||
'      l_expires_on'||unistr('\000a')||
'    FROM blog_reg_users'||unistr('\000a')||
'    WHERE upper(email) = upper(p_username);'||unistr('\000a')||
'    -- Next, we check to see if the user''s account is expired'||unistr('\000a')||
'    -- If it is, return FALSE'||unistr('\000a')||
'    IF l_expires_on > sysdate OR l_expires_on IS NULL THEN'||unistr('\000a')||
'      -- If the account is not expired, we have to apply the custom hash'||unistr('\000a')||
'      -- function to the password'||unistr('\000a')||
'      l_password := blog_custom_hash(p_user';

s:=s||'name, p_password);'||unistr('\000a')||
'      -- Finally, we compare them to see if they are the same and return'||unistr('\000a')||
'      -- either TRUE or FALSE'||unistr('\000a')||
'      IF l_password = l_stored_password THEN'||unistr('\000a')||
'        APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_SUCCESS);'||unistr('\000a')||
'        RETURN TRUE;'||unistr('\000a')||
'      ELSE'||unistr('\000a')||
'        APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_PASSWORD_INCORRECT);'||unistr('\000a')||
'        RETURN FALSE;'||unistr('\000a')||
'      END IF;'||unistr('\000a')||
'    ELSE'||unistr('\000a')||
'      APEX_UTIL.SET_AUTHENT';

s:=s||'ICATION_RESULT(AUTH_ACCOUNT_EXPIRED);'||unistr('\000a')||
'      RETURN FALSE;'||unistr('\000a')||
'    END IF;'||unistr('\000a')||
'  ELSE'||unistr('\000a')||
'    APEX_UTIL.SET_AUTHENTICATION_RESULT(AUTH_UNKNOWN_USER);'||unistr('\000a')||
'    RETURN false;'||unistr('\000a')||
'  END IF;'||unistr('\000a')||
'END;'||unistr('\000a')||
'/'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 125478426250329299 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Functions',
  p_sequence=> 60,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'CREATE MATERIALIZED VIEW BLOG_STATS_SUMMARY BUILD IMMEDIATE USING INDEX REFRESH COMPLETE ON DEMAND START WITH SYSDATE + 0 NEXT (SYSDATE+1/24) USING DEFAULT LOCAL ROLLBACK SEGMENT DISABLE QUERY REWRITE'||unistr('\000a')||
'AS'||unistr('\000a')||
'  SELECT ''New Articles'' what,'||unistr('\000a')||
'    MIN(COUNT(      *)) min_cnt,'||unistr('\000a')||
'    MAX(COUNT(      *)) max_cnt,'||unistr('\000a')||
'    ROUND(AVG(COUNT(*)),0) avg_cnt,'||unistr('\000a')||
'    SUM(COUNT(      *)) sum_cnt'||unistr('\000a')||
'  FROM blog_messages'||unistr('\000a')||
'  WHERE msg';

s:=s||'_type  = ''STANDARD'''||unistr('\000a')||
'  AND created_on >= SYSDATE - 28'||unistr('\000a')||
'  GROUP BY TRUNC(created_on)'||unistr('\000a')||
'  UNION ALL'||unistr('\000a')||
'  SELECT ''Comments'' what,'||unistr('\000a')||
'    MIN(COUNT(      *)),'||unistr('\000a')||
'    MAX(COUNT(      *)),'||unistr('\000a')||
'    ROUND(AVG(COUNT(*)),0),'||unistr('\000a')||
'    SUM(COUNT(      *))'||unistr('\000a')||
'  FROM blog_messages'||unistr('\000a')||
'  WHERE msg_type  = ''COMMENT'''||unistr('\000a')||
'  AND created_on >= SYSDATE - 28'||unistr('\000a')||
'  GROUP BY TRUNC(created_on)'||unistr('\000a')||
'  UNION ALL'||unistr('\000a')||
'  SELECT ''Files'' what,'||unistr('\000a')||
'    MIN(COUNT(      *)),'||unistr('\000a')||
'    M';

s:=s||'AX(COUNT(      *)),'||unistr('\000a')||
'    ROUND(AVG(COUNT(*)),0),'||unistr('\000a')||
'    SUM(COUNT(      *))'||unistr('\000a')||
'  FROM BLOG_FILES'||unistr('\000a')||
'  WHERE created_on >= SYSDATE - 28'||unistr('\000a')||
'  GROUP BY TRUNC(created_on);';

wwv_flow_api.create_install_script(
  p_id => 125498843743372122 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Materialized Views',
  p_sequence=> 70,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'DECLARE'||unistr('\000a')||
'  jobno NUMERIC;'||unistr('\000a')||
'BEGIN'||unistr('\000a')||
'  dbms_job.submit(jobno, ''BLOG_API.refresh_top_articles;'', sysdate, ''trunc(sysdate,''''hh'''')+1/24'');'||unistr('\000a')||
'  dbms_job.submit(jobno, ''get_geocode_hostip;'', sysdate, ''sysdate+1'');'||unistr('\000a')||
'END;'||unistr('\000a')||
'/';

wwv_flow_api.create_install_script(
  p_id => 151644950823583535 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Jobs',
  p_sequence=> 80,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'REM INSERTING into BLOG_DUAL100'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (1);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (2);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (3);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (4);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (5);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (6);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (7);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (8);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (9);';

s:=s||''||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (10);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (11);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (12);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (13);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (14);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (15);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (16);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (17);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (18);'||unistr('\000a')||
'Insert into BLOG_DUAL';

s:=s||'100 (I) values (19);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (20);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (21);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (22);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (23);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (24);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (25);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (26);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (27);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (28);'||unistr('\000a')||
'I';

s:=s||'nsert into BLOG_DUAL100 (I) values (29);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (30);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (31);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (32);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (33);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (34);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (35);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (36);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (37);'||unistr('\000a')||
'Insert into BLOG_DUAL10';

s:=s||'0 (I) values (38);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (39);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (40);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (41);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (42);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (43);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (44);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (45);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (46);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (47);'||unistr('\000a')||
'Ins';

s:=s||'ert into BLOG_DUAL100 (I) values (48);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (49);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (50);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (51);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (52);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (53);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (54);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (55);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (56);'||unistr('\000a')||
'Insert into BLOG_DUAL100 ';

s:=s||'(I) values (57);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (58);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (59);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (60);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (61);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (62);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (63);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (64);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (65);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (66);'||unistr('\000a')||
'Inser';

s:=s||'t into BLOG_DUAL100 (I) values (67);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (68);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (69);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (70);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (71);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (72);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (73);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (74);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (75);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I';

s:=s||') values (76);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (77);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (78);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (79);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (80);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (81);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (82);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (83);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (84);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (85);'||unistr('\000a')||
'Insert ';

s:=s||'into BLOG_DUAL100 (I) values (86);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (87);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (88);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (89);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (90);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (91);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (92);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (93);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (94);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) ';

s:=s||'values (95);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (96);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (97);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (98);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (99);'||unistr('\000a')||
'Insert into BLOG_DUAL100 (I) values (100);'||unistr('\000a')||
'REM INSERTING into BLOG_DATES'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (225,''2020'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (226,''12'',225);'||unistr('\000a')||
'Insert into';

s:=s||' BLOG_DATES (ID,NAME,PARENT_ID) values (227,''11'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (228,''10'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (229,''9'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (230,''8'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (231,''7'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (232,''6'',225);'||unistr('\000a')||
'Insert into BLOG_DA';

s:=s||'TES (ID,NAME,PARENT_ID) values (233,''5'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (234,''4'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (235,''3'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (236,''2'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (237,''1'',225);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (238,''2019'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (I';

s:=s||'D,NAME,PARENT_ID) values (239,''12'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (240,''11'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (241,''10'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (242,''9'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (243,''8'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (244,''7'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,';

s:=s||'PARENT_ID) values (245,''6'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (246,''5'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (247,''4'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (248,''3'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (249,''2'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (250,''1'',238);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID)';

s:=s||' values (251,''2018'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (252,''12'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (253,''11'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (254,''10'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (255,''9'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (256,''8'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) va';

s:=s||'lues (257,''7'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (258,''6'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (259,''5'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (260,''4'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (261,''3'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (262,''2'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (263,';

s:=s||'''1'',251);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (264,''2017'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (265,''12'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (266,''11'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (267,''10'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (268,''9'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (269,''8''';

s:=s||',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (270,''7'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (271,''6'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (272,''5'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (273,''4'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (274,''3'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (275,''2'',264);'||unistr('\000a')||
'Ins';

s:=s||'ert into BLOG_DATES (ID,NAME,PARENT_ID) values (276,''1'',264);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (277,''2016'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (278,''12'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (279,''11'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (280,''10'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (281,''9'',277);'||unistr('\000a')||
'Insert';

s:=s||' into BLOG_DATES (ID,NAME,PARENT_ID) values (282,''8'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (283,''7'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (284,''6'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (285,''5'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (286,''4'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (287,''3'',277);'||unistr('\000a')||
'Insert into BLOG';

s:=s||'_DATES (ID,NAME,PARENT_ID) values (288,''2'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (289,''1'',277);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (290,''2015'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (291,''12'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (292,''11'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (293,''10'',290);'||unistr('\000a')||
'Insert into BLOG_DA';

s:=s||'TES (ID,NAME,PARENT_ID) values (294,''9'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (295,''8'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (296,''7'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (297,''6'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (298,''5'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (299,''4'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NA';

s:=s||'ME,PARENT_ID) values (300,''3'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (301,''2'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (302,''1'',290);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (303,''2014'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (304,''12'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (305,''11'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,P';

s:=s||'ARENT_ID) values (306,''10'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (307,''9'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (308,''8'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (309,''7'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (310,''6'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (311,''5'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID)';

s:=s||' values (312,''4'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (313,''3'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (314,''2'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (315,''1'',303);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (316,''2013'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (317,''12'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) valu';

s:=s||'es (318,''11'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (319,''10'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (320,''9'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (321,''8'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (322,''7'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (323,''6'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (324,';

s:=s||'''5'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (325,''4'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (326,''3'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (327,''2'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (328,''1'',316);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (329,''2012'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (330,''12'',3';

s:=s||'29);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (331,''11'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (332,''10'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (333,''9'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (334,''8'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (335,''7'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (336,''6'',329);'||unistr('\000a')||
'Ins';

s:=s||'ert into BLOG_DATES (ID,NAME,PARENT_ID) values (337,''5'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (338,''4'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (339,''3'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (340,''2'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (341,''1'',329);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (342,''2011'',null);'||unistr('\000a')||
'Insert in';

s:=s||'to BLOG_DATES (ID,NAME,PARENT_ID) values (343,''12'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (344,''11'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (345,''10'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (346,''9'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (347,''8'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (348,''7'',342);'||unistr('\000a')||
'Insert into BLOG';

s:=s||'_DATES (ID,NAME,PARENT_ID) values (349,''6'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (350,''5'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (351,''4'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (352,''3'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (353,''2'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (354,''1'',342);'||unistr('\000a')||
'Insert into BLOG_DATES (ID';

s:=s||',NAME,PARENT_ID) values (355,''2010'',null);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (356,''12'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (357,''11'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (358,''10'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (359,''9'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (360,''8'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NA';

s:=s||'ME,PARENT_ID) values (361,''7'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (362,''6'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (363,''5'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (364,''4'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (365,''3'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_ID) values (366,''2'',355);'||unistr('\000a')||
'Insert into BLOG_DATES (ID,NAME,PARENT_';

s:=s||'ID) values (367,''1'',355);'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 151672477143591061 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Metadata',
  p_sequence=> 110,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

 
begin
 
declare
    s varchar2(32767) := null;
    l_clob clob;
    l_length number := 1;
begin
s:=s||'INSERT INTO BLOG_BAD_EMAILS (email) VALUES(''jaakko.spammer@blockme.not'');'||unistr('\000a')||
'REM INSERTING into BLOG_CATEGORIES'||unistr('\000a')||
'Insert into BLOG_CATEGORIES (CATEGORY_NAME) values (''General'');'||unistr('\000a')||
'Insert into BLOG_CATEGORIES (CATEGORY_NAME) values (''Food'');'||unistr('\000a')||
'Insert into BLOG_CATEGORIES (CATEGORY_NAME) values (''Photography'');'||unistr('\000a')||
'Insert into BLOG_CATEGORIES (CATEGORY_NAME) values (''Traveling'');'||unistr('\000a')||
'Insert into BLOG_CATEGORIES (CAT';

s:=s||'EGORY_NAME) values (''Nature'');'||unistr('\000a')||
'REM INSERTING into BLOG_REG_USERS'||unistr('\000a')||
'Insert into BLOG_REG_USERS (REMOTE_ADDR,ID,EMAIL,CREATED_ON,CREATED_BY,PASSWORD,NICK) values (''127.0.0.1'',1,''ADMIN@BLOG.COM'',sysdate,''INSTALL'',BLOG_CUSTOM_HASH(''ADMIN@BLOG.COM'',''blog''),''Generic Admin'');'||unistr('\000a')||
'REM INSERTING into BLOG_ADMINISTRATORS'||unistr('\000a')||
'Insert into BLOG_ADMINISTRATORS (ID,USERID,CREATED_ON) values (1,''ADMIN@BLOG.COM'',sysdate);'||unistr('\000a')||
'R';

s:=s||'EM INSERTING into BLOG_MESSAGES'||unistr('\000a')||
'Insert into BLOG_MESSAGES (MSG_TYPE,MSG_SUBJECT,MSG_TEXT,CREATED_BY_ID) values (''RESOURCE'',''Ask Tom'',''<p>'||unistr('\000a')||
'    <a href="http://asktom.oracle.com/" target="_blank" title="Ask Tom">Ask Tom</a><br />'||unistr('\000a')||
'    One of the most comprehensive web sites on Oracle database in general including Oracle Application Express.</p>'||unistr('\000a')||
''',1);'||unistr('\000a')||
'Insert into BLOG_MESSAGES (MSG_TYPE,MSG_SUBJECT,MS';

s:=s||'G_TEXT,CREATED_BY_ID) values (''RESOURCE'',''Free CSS Templates'',''<p>'||unistr('\000a')||
'    Find a never before seen collection of <a href="http://www.free-css-templates.com/">Free CSS Templates</a>, one of the biggest in the entire web!</p>'||unistr('\000a')||
''',1);'||unistr('\000a')||
'Insert into BLOG_MESSAGES (MSG_TYPE,MSG_SUBJECT,MSG_TEXT,CREATED_BY_ID) values (''FAVORITE'',''Oracle Apex'',''<p>'||unistr('\000a')||
'    <a href="http://apex.oracle.com/" title="Oracle Application';

s:=s||' Express">Oracle Application Express</a> (Oracle APEX), formerly called HTML DB, is a rapid web application development tool for the Oracle database. Using only a web browser and limited programming experience, you can develop and deploy professional applications that are both fast and secure.</p>'||unistr('\000a')||
''',1);'||unistr('\000a')||
'Insert into BLOG_MESSAGES (MSG_TYPE,MSG_SUBJECT,MSG_TEXT,CREATED_BY_ID) values (''SUPER'',''DbSWH ';

s:=s||'Blog'',''<p>'||unistr('\000a')||
'    <a href="http://dbswh.webhop.net/dbswh/f?p=BLOG:HOME:0">DbSWH Goodies</a> on Oracle Application Express, Oracle Database, jQuery, Linux and etc.</p>'||unistr('\000a')||
''',1);'||unistr('\000a')||
'Insert into BLOG_MESSAGES (MSG_TYPE,MSG_SUBJECT,MSG_TEXT,CREATED_BY_ID) values (''WELCOME'',''Welcome'',''<p>'||unistr('\000a')||
'    <strong>Welcome to &APPLICATION_NAME..</strong></p>'||unistr('\000a')||
''',1);'||unistr('\000a')||
'Insert into BLOG_MESSAGES (MSG_TYPE,MSG_SUBJECT,MSG_TEXT,CATEGO';

s:=s||'RY_ID,RSS_DESCRIPTION,CREATED_BY_ID) values (''STANDARD'',''Get started on blogging'',''<p>'||unistr('\000a')||
'    Get started on blogging using Apex blogging platform.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'    &nbsp;</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'    This is Early Adopter version of DbSWH Apex blogging platform.</p>'||unistr('\000a')||
'<p>'||unistr('\000a')||
'    Submit comments and feature requests on <a href="http://dbswh.webhop.net/dbswh/f?p=BLOG:HOME:0">DbSWH site</a>.</p>'||unistr('\000a')||
'    '',(SELECT ID FROM BLOG_CATEGO';

s:=s||'RIES WHERE CATEGORY_NAME = ''General''),''Get started on blogging using Apex blogging platform.'',1);'||unistr('\000a')||
'';

wwv_flow_api.create_install_script(
  p_id => 151692160305595682 + wwv_flow_api.g_id_offset,
  p_flow_id => wwv_flow.g_flow_id,
  p_install_id=> 159129968175073220 + wwv_flow_api.g_id_offset,
  p_name => 'Sample data',
  p_sequence=> 120,
  p_script_type=> 'INSTALL',
  p_script_clob=> s);
end;
 
 
end;
/

--application/deployment/checks
prompt  ...application deployment checks
--
 
begin
 
null;
 
end;
/

--application/deployment/buildoptions
prompt  ...application deployment build options
--
 
begin
 
null;
 
end;
/

--application/end_environment
commit;
commit;
begin 
execute immediate 'begin dbms_session.set_nls( param => ''NLS_NUMERIC_CHARACTERS'', value => '''''''' || replace(wwv_flow_api.g_nls_numeric_chars,'''''''','''''''''''') || ''''''''); end;';
end;
/
set verify on
set feedback on
prompt  ...done
