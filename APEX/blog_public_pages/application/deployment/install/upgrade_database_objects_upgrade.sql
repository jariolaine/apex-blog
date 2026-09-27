prompt --application/deployment/install/upgrade_database_objects_upgrade
begin
--   Manifest
--     INSTALL: UPGRADE-Database objects upgrade
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '-- Database objects upgrade'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or rep';
wwv_flow_imp.g_varchar2_table(2) := 'lace package "BLOG_CTX"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3) := '-------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(4) := '-------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    This package contains procedures for Oracle Text operations, includi';
wwv_flow_imp.g_varchar2_table(5) := 'ng'||wwv_flow.LF||
'--    the generation of text datastores for posts and comments.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  =======';
wwv_flow_imp.g_varchar2_table(6) := '====================================================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY ';
wwv_flow_imp.g_varchar2_table(7) := '   DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(8) := '  22.06.2020   Jari Laine     Created package.'||wwv_flow.LF||
'--  30.04.2022   Jari Laine     Updated procedure ge';
wwv_flow_imp.g_varchar2_table(9) := 'nerate_post_datastore to utilize XML functions.'||wwv_flow.LF||
'--  02.05.2022   Jari Laine     Improved function g';
wwv_flow_imp.g_varchar2_table(10) := 'et_post_search to enhance text search query handling.'||wwv_flow.LF||
'--  25.11.2022   Jari Laine     Updated proce';
wwv_flow_imp.g_varchar2_table(11) := 'dure generate_post_datastore to remove HTML tags from post body.'||wwv_flow.LF||
'--  17.07.2024   Jari Laine     Re';
wwv_flow_imp.g_varchar2_table(12) := 'moved obsolete function get_post_search.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(13) := '--------------------------'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(14) := '--------'||wwv_flow.LF||
'  procedure generate_post_datastore('||wwv_flow.LF||
'    rid   in rowid,'||wwv_flow.LF||
'    tlob  in out nocopy clob'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(15) := ' );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure g';
wwv_flow_imp.g_varchar2_table(16) := 'enerate_comment_datastore('||wwv_flow.LF||
'    rid   in rowid,'||wwv_flow.LF||
'    tlob  in out nocopy clob'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(17) := '-----------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_CTX";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or rep';
wwv_flow_imp.g_varchar2_table(18) := 'lace package "BLOG_INSTALL"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(19) := '-----------------------------'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(20) := '-----------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    Procedures and functions for application install'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE';
wwv_flow_imp.g_varchar2_table(21) := ' LOG'||wwv_flow.LF||
'--  ============================================================================'||wwv_flow.LF||
'--  DATE    ';
wwv_flow_imp.g_varchar2_table(22) := '     MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  -----------------------------------';
wwv_flow_imp.g_varchar2_table(23) := '-------------'||wwv_flow.LF||
'--  10.05.2025   Jari Laine     Created package.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(24) := '-------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(25) := '-------------------------------'||wwv_flow.LF||
'  procedure settings_merge('||wwv_flow.LF||
'    p_attribute_name          in varch';
wwv_flow_imp.g_varchar2_table(26) := 'ar2,'||wwv_flow.LF||
'    p_display_seq             in number,'||wwv_flow.LF||
'    p_is_nullable             in number,'||wwv_flow.LF||
'    p_data';
wwv_flow_imp.g_varchar2_table(27) := '_type               in varchar2,'||wwv_flow.LF||
'    p_attribute_group_message in varchar2,'||wwv_flow.LF||
'    p_int_min         ';
wwv_flow_imp.g_varchar2_table(28) := '        in number   default null,'||wwv_flow.LF||
'    p_int_max                 in number   default null,'||wwv_flow.LF||
'    p_bu';
wwv_flow_imp.g_varchar2_table(29) := 'ild_option_name       in varchar2 default null,'||wwv_flow.LF||
'    p_build_option_status     in varchar2 default n';
wwv_flow_imp.g_varchar2_table(30) := 'ull,'||wwv_flow.LF||
'    p_attribute_value         in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(31) := '------------------------------------------------'||wwv_flow.LF||
'  procedure features_merge('||wwv_flow.LF||
'    p_build_option_na';
wwv_flow_imp.g_varchar2_table(32) := 'me       in varchar2,'||wwv_flow.LF||
'    p_is_active               in number,'||wwv_flow.LF||
'    p_display_seq             in nu';
wwv_flow_imp.g_varchar2_table(33) := 'mber,'||wwv_flow.LF||
'    p_build_option_group      in varchar2,'||wwv_flow.LF||
'    p_build_option_parent     in varchar2 default';
wwv_flow_imp.g_varchar2_table(34) := ' null,'||wwv_flow.LF||
'    p_ref_build_option_name   in varchar2 default null,'||wwv_flow.LF||
'    p_ref_build_option_status in va';
wwv_flow_imp.g_varchar2_table(35) := 'rchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(36) := '-------'||wwv_flow.LF||
'  procedure list_of_values_ins('||wwv_flow.LF||
'    p_is_active               in number,'||wwv_flow.LF||
'    p_display_se';
wwv_flow_imp.g_varchar2_table(37) := 'q             in number,'||wwv_flow.LF||
'    p_lov_name                in varchar2,'||wwv_flow.LF||
'    p_return_value            ';
wwv_flow_imp.g_varchar2_table(38) := 'in varchar2,'||wwv_flow.LF||
'    p_display_message         in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(39) := '-------------------------------------------'||wwv_flow.LF||
'  procedure init_items_ins;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(40) := '------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_INSTALL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace pa';
wwv_flow_imp.g_varchar2_table(41) := 'ckage "BLOG_MIME"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(42) := '-------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(43) := '-'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    Procedures and functions for file mime type'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CREDITS:'||wwv_flow.LF||
'--    http';
wwv_flow_imp.g_varchar2_table(44) := 's://asktom.oracle.com/pls/apex/asktom.search?tag=mime-type-using-blob-data'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(45) := '============================================================================'||wwv_flow.LF||
'--  DATE         MODIF';
wwv_flow_imp.g_varchar2_table(46) := 'IED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ---------------------------------------------';
wwv_flow_imp.g_varchar2_table(47) := '---'||wwv_flow.LF||
'--  21.07.2025   Jari Laine     Created package.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(48) := '---------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(49) := '---------------------'||wwv_flow.LF||
'  g_default_mime constant varchar2(100) := ''application/octet-stream'';'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(50) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_mime_typ';
wwv_flow_imp.g_varchar2_table(51) := 'e('||wwv_flow.LF||
'    p_file_name varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(52) := '--------------------------------'||wwv_flow.LF||
'end "BLOG_MIME";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_FILE"'||wwv_flow.LF||
'authid';
wwv_flow_imp.g_varchar2_table(53) := ' definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(54) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--   ';
wwv_flow_imp.g_varchar2_table(55) := ' This package provides procedures and functions for managing files in the'||wwv_flow.LF||
'--    admin application''s';
wwv_flow_imp.g_varchar2_table(56) := ' file repository. It includes operations for formatting'||wwv_flow.LF||
'--    file paths, uploading, replacing, sel';
wwv_flow_imp.g_varchar2_table(57) := 'ecting, deleting, and downloading files.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ==================================';
wwv_flow_imp.g_varchar2_table(58) := '=========================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -------';
wwv_flow_imp.g_varchar2_table(59) := '----  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  21.07.2024   Jari Laine  ';
wwv_flow_imp.g_varchar2_table(60) := '   Created package.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(61) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function ';
wwv_flow_imp.g_varchar2_table(62) := 'get_zip_name return varchar2;'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(63) := '-----------'||wwv_flow.LF||
'  function format_file_path('||wwv_flow.LF||
'    p_file_name         in varchar2,'||wwv_flow.LF||
'    p_dir          ';
wwv_flow_imp.g_varchar2_table(64) := '     in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(65) := '--------------------'||wwv_flow.LF||
'  function get_file_desc('||wwv_flow.LF||
'    p_file_path         in varchar2'||wwv_flow.LF||
'  ) return var';
wwv_flow_imp.g_varchar2_table(66) := 'char2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedur';
wwv_flow_imp.g_varchar2_table(67) := 'e upload_file('||wwv_flow.LF||
'    p_file_names        in varchar2,'||wwv_flow.LF||
'    p_dir               in varchar2,'||wwv_flow.LF||
'    p_co';
wwv_flow_imp.g_varchar2_table(68) := 'llection_name   in varchar2,'||wwv_flow.LF||
'    p_extract           in varchar2 default ''N'','||wwv_flow.LF||
'    p_overwrite_file';
wwv_flow_imp.g_varchar2_table(69) := '    in varchar2 default ''N'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(70) := '---------------'||wwv_flow.LF||
'  procedure replace_file('||wwv_flow.LF||
'    p_collection_name   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(71) := '-------------------------------------------------------------------'||wwv_flow.LF||
'  procedure file_select_collect';
wwv_flow_imp.g_varchar2_table(72) := 'ion('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_seq_id            in number,'||wwv_flow.LF||
'    p_id            ';
wwv_flow_imp.g_varchar2_table(73) := '    in number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(74) := '-'||wwv_flow.LF||
'  procedure delete_selected_files('||wwv_flow.LF||
'    p_collection_name   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(75) := '--------------------------------------------------------------'||wwv_flow.LF||
'  procedure download_selected_files(';
wwv_flow_imp.g_varchar2_table(76) := ''||wwv_flow.LF||
'    p_collection_name   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(77) := '-------------------------'||wwv_flow.LF||
'end "BLOG_FILE";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_UTIL"'||wwv_flow.LF||
'authid define';
wwv_flow_imp.g_varchar2_table(78) := 'r'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(79) := '---------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    Provi';
wwv_flow_imp.g_varchar2_table(80) := 'des utility procedures and functions for the public and administrative'||wwv_flow.LF||
'--    blog applications. Thi';
wwv_flow_imp.g_varchar2_table(81) := 's includes error handling, string manipulation,'||wwv_flow.LF||
'--    file operations, and support for application ';
wwv_flow_imp.g_varchar2_table(82) := 'processes.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ================================================================';
wwv_flow_imp.g_varchar2_table(83) := '============'||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ---------';
wwv_flow_imp.g_varchar2_table(84) := '---------------------------------------'||wwv_flow.LF||
'--  22.04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  28.03';
wwv_flow_imp.g_varchar2_table(85) := '.2020   Jari Laine     Added alternate signature for get_year_month.'||wwv_flow.LF||
'--  15.04.2020   Jari Laine   ';
wwv_flow_imp.g_varchar2_table(86) := '  Added function validate_comment.'||wwv_flow.LF||
'--  26.04.2020   Jari Laine     Replaced validate_comment with A';
wwv_flow_imp.g_varchar2_table(87) := 'PEX_UTIL.SAVEKEY_VC2.'||wwv_flow.LF||
'--                              Removed redundant custom functions.'||wwv_flow.LF||
'--  08.0';
wwv_flow_imp.g_varchar2_table(88) := '5.2020   Jari Laine     Marked get_year_month functions as obsolete.'||wwv_flow.LF||
'--  10.05.2020   Jari Laine   ';
wwv_flow_imp.g_varchar2_table(89) := '  Added procedures new_comment_notify, subscribe,'||wwv_flow.LF||
'--                              and unsubscribe f';
wwv_flow_imp.g_varchar2_table(90) := 'or comment replies.'||wwv_flow.LF||
'--  11.05.2020   Jari Laine     Moved comment-related logic to BLOG_COMM packag';
wwv_flow_imp.g_varchar2_table(91) := 'e.'||wwv_flow.LF||
'--  17.05.2020   Jari Laine     Added out parameters p_older_title and p_newer_title to get_post';
wwv_flow_imp.g_varchar2_table(92) := '_pagination.'||wwv_flow.LF||
'--                              Replaced materialized view BLOG_ITEMS_INIT with a view';
wwv_flow_imp.g_varchar2_table(93) := '.'||wwv_flow.LF||
'--                              Removed obsolete function get_item_init_value.'||wwv_flow.LF||
'--  18.05.2020   ';
wwv_flow_imp.g_varchar2_table(94) := 'Jari Laine     Moved ORDS-specific global constants.'||wwv_flow.LF||
'--  19.05.2020   Jari Laine     Enhanced APEX ';
wwv_flow_imp.g_varchar2_table(95) := 'debug logging and exception handling.'||wwv_flow.LF||
'--                              Modified get_post_pagination ';
wwv_flow_imp.g_varchar2_table(96) := 'to raise ORA-20901.'||wwv_flow.LF||
'--                              Removed global constants.'||wwv_flow.LF||
'--  23.05.2020   Jar';
wwv_flow_imp.g_varchar2_table(97) := 'i Laine     Removed dependency on ORDS.'||wwv_flow.LF||
'--  05.11.2020   Jari Laine     Added procedure render_dyna';
wwv_flow_imp.g_varchar2_table(98) := 'mic_content.'||wwv_flow.LF||
'--  18.12.2021   Jari Laine     Added procedure redirect_search.'||wwv_flow.LF||
'--  24.03.2022   Jar';
wwv_flow_imp.g_varchar2_table(99) := 'i Laine     Added parameter names to APEX_DEBUG calls.'||wwv_flow.LF||
'--  25.03.2022   Jari Laine     Improved com';
wwv_flow_imp.g_varchar2_table(100) := 'ments and renamed variables for clarity.'||wwv_flow.LF||
'--                              Removed obsolete procedure';
wwv_flow_imp.g_varchar2_table(101) := ' check_archive_exists.'||wwv_flow.LF||
'--  19.04.2022   Jari Laine     Enhanced download_file procedures.'||wwv_flow.LF||
'--  26.0';
wwv_flow_imp.g_varchar2_table(102) := '4.2022   Jari Laine     Added parameter p_escape to function get_tag.'||wwv_flow.LF||
'--  03.08.2022   Jari Laine  ';
wwv_flow_imp.g_varchar2_table(103) := '   Updated render_dynamic_content to use APEX_UTIL.PRN.'||wwv_flow.LF||
'--  16.11.2022   Jari Laine     Removed obs';
wwv_flow_imp.g_varchar2_table(104) := 'olete function get_post_title.'||wwv_flow.LF||
'--  21.11.2022   Jari Laine     Added DETERMINISTIC clause to functi';
wwv_flow_imp.g_varchar2_table(105) := 'on int_to_vc2.'||wwv_flow.LF||
'--  23.11.2022   Jari Laine     Improved exception handling in procedures.'||wwv_flow.LF||
'--      ';
wwv_flow_imp.g_varchar2_table(106) := '                        Renamed get_post_pagination to get_post_details.'||wwv_flow.LF||
'--  24.11.2022   Jari Lain';
wwv_flow_imp.g_varchar2_table(107) := 'e     Removed obsolete parameter p_escape.'||wwv_flow.LF||
'--  29.11.2022   Jari Laine     Added procedure raise_ht';
wwv_flow_imp.g_varchar2_table(108) := 'tp_error.'||wwv_flow.LF||
'--                              Moved next/previous post logic to BLOG_V_POSTS view.'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(109) := ' 15.01.2023   Jari Laine     Removed procedure render_dynamic_content.'||wwv_flow.LF||
'--  19.01.2023   Jari Laine ';
wwv_flow_imp.g_varchar2_table(110) := '    Renamed get_post_details parameters.'||wwv_flow.LF||
'--                              Added global constants: g_';
wwv_flow_imp.g_varchar2_table(111) := 'nls_date_lang, g_iso_8601_date and g_rfc_2822_date.'||wwv_flow.LF||
'--  08.04.2023   Jari Laine     Modified redire';
wwv_flow_imp.g_varchar2_table(112) := 'ct_search to accept p_page_id.'||wwv_flow.LF||
'--  05.09.2023   Jari Laine     Removed use of BLOG_T_POST type in g';
wwv_flow_imp.g_varchar2_table(113) := 'et_post_details.'||wwv_flow.LF||
'--  01.04.2024   Jari Laine     Added new global constants and variables.'||wwv_flow.LF||
'--     ';
wwv_flow_imp.g_varchar2_table(114) := '                         Minor changes to download_file.'||wwv_flow.LF||
'--  10.04.2024   Jari Laine     Updated in';
wwv_flow_imp.g_varchar2_table(115) := 'itialize_items procedure.'||wwv_flow.LF||
'--  20.07.2024   Jari Laine     Added RESULT_CACHE for function get_attri';
wwv_flow_imp.g_varchar2_table(116) := 'bute_value.'||wwv_flow.LF||
'--  25.08.2024   Jari Laine     Added new function remove_whitespace.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(117) := '--------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(118) := '--------------------------------------------------'||wwv_flow.LF||
'  g_nls_date_lang constant varchar2(40) := ''NLS_';
wwv_flow_imp.g_varchar2_table(119) := 'DATE_LANGUAGE = ENGLISH'';'||wwv_flow.LF||
'  g_iso_8601_date constant varchar2(40) := ''YYYY-MM-DD"T"HH24:MI:SS"Z"'';';
wwv_flow_imp.g_varchar2_table(120) := ''||wwv_flow.LF||
'  g_rfc_2822_date constant varchar2(40) := ''Dy, DD Mon YYYY HH24:MI:SS "GMT"'';'||wwv_flow.LF||
''||wwv_flow.LF||
'  g_mime_rss     ';
wwv_flow_imp.g_varchar2_table(121) := ' constant varchar2(40) := ''application/rss+xml'';'||wwv_flow.LF||
'  g_mime_atom     constant varchar2(40) := ''applic';
wwv_flow_imp.g_varchar2_table(122) := 'ation/atom+xml'';'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(123) := '-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'--  inside package blog_cm and blog_comm'||wwv_flow.LF||
'  function remove_';
wwv_flow_imp.g_varchar2_table(124) := 'whitespace('||wwv_flow.LF||
'    p_string            in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(125) := '----------------------------------------------------'||wwv_flow.LF||
'  procedure raise_http_error('||wwv_flow.LF||
'    p_error_cod';
wwv_flow_imp.g_varchar2_table(126) := 'e      in number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(127) := '----'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public and admin application definition Error Handling Function'||wwv_flow.LF||
'  functi';
wwv_flow_imp.g_varchar2_table(128) := 'on apex_error_handler('||wwv_flow.LF||
'    p_error           in apex_error.t_error'||wwv_flow.LF||
'  ) return apex_error.t_error_r';
wwv_flow_imp.g_varchar2_table(129) := 'esult;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called ';
wwv_flow_imp.g_varchar2_table(130) := 'from:'||wwv_flow.LF||
'--  inside package and from other packages'||wwv_flow.LF||
'  function int_to_vc2('||wwv_flow.LF||
'    p_value           in ';
wwv_flow_imp.g_varchar2_table(131) := 'number'||wwv_flow.LF||
'  ) return varchar2 deterministic;'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(132) := '------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  other packages, public and admin application'||wwv_flow.LF||
'  funct';
wwv_flow_imp.g_varchar2_table(133) := 'ion get_attribute_value('||wwv_flow.LF||
'    p_attribute_name  in varchar2'||wwv_flow.LF||
'  ) return varchar2 result_cache;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(134) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  p';
wwv_flow_imp.g_varchar2_table(135) := 'ublic and admin application process Initialize Items'||wwv_flow.LF||
'  procedure initialize_items('||wwv_flow.LF||
'    p_app_id   ';
wwv_flow_imp.g_varchar2_table(136) := '       in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(137) := '------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 2'||wwv_flow.LF||
'  procedure get_post_details('||wwv_flow.LF||
'    p_post_id        ';
wwv_flow_imp.g_varchar2_table(138) := ' in varchar2,'||wwv_flow.LF||
'    p_post_title      out nocopy varchar2,'||wwv_flow.LF||
'    p_post_desc       out nocopy varchar2';
wwv_flow_imp.g_varchar2_table(139) := ','||wwv_flow.LF||
'    p_post_category   out nocopy varchar2,'||wwv_flow.LF||
'    p_post_author     out nocopy varchar2,'||wwv_flow.LF||
'    p_pos';
wwv_flow_imp.g_varchar2_table(140) := 't_published  out nocopy varchar2,'||wwv_flow.LF||
'    p_post_modified   out nocopy varchar2,'||wwv_flow.LF||
'    p_next_post_id   ';
wwv_flow_imp.g_varchar2_table(141) := ' out nocopy varchar2,'||wwv_flow.LF||
'    p_next_post_title out nocopy varchar2,'||wwv_flow.LF||
'    p_prev_post_id    out nocopy ';
wwv_flow_imp.g_varchar2_table(142) := 'varchar2,'||wwv_flow.LF||
'    p_prev_post_title out nocopy varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(143) := '----------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 14 Pre-Rendering Comp';
wwv_flow_imp.g_varchar2_table(144) := 'utations'||wwv_flow.LF||
'  function get_category_title('||wwv_flow.LF||
'    p_category_id     in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(145) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(146) := '  public app page 6 Pre-Rendering Computations'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id          in varcha';
wwv_flow_imp.g_varchar2_table(147) := 'r2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(148) := '------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  inside package and package BLOG_XML'||wwv_flow.LF||
'  procedure download_file('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(149) := 'blob_content    in out nocopy blob,'||wwv_flow.LF||
'    p_mime_type       in varchar2,'||wwv_flow.LF||
'    p_header_names    in ap';
wwv_flow_imp.g_varchar2_table(150) := 'ex_t_varchar2,'||wwv_flow.LF||
'    p_header_values   in apex_t_varchar2,'||wwv_flow.LF||
'    p_charset         in varchar2 default';
wwv_flow_imp.g_varchar2_table(151) := ' null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Ca';
wwv_flow_imp.g_varchar2_table(152) := 'lled from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process "download"'||wwv_flow.LF||
'  procedure download_file('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(153) := '   p_file_path       in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(154) := '--------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app application process Redirect to search page'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(155) := ' procedure redirect_search('||wwv_flow.LF||
'    p_value           in varchar2,'||wwv_flow.LF||
'    p_app_id          in varchar2 d';
wwv_flow_imp.g_varchar2_table(156) := 'efault null,'||wwv_flow.LF||
'    p_page_id         in varchar2 default ''SEARCH'','||wwv_flow.LF||
'    p_session         in varchar2';
wwv_flow_imp.g_varchar2_table(157) := ' default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(158) := '-'||wwv_flow.LF||
'end "BLOG_UTIL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_ADMIN"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(159) := '----------------------------------------------------------------'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(160) := '----------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    This package contains procedu';
wwv_flow_imp.g_varchar2_table(161) := 'res and functions for the Admin application,'||wwv_flow.LF||
'--    including operations content handling, and utili';
wwv_flow_imp.g_varchar2_table(162) := 'ty functions.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  =============================================================';
wwv_flow_imp.g_varchar2_table(163) := '==============='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ------';
wwv_flow_imp.g_varchar2_table(164) := '------------------------------------------'||wwv_flow.LF||
'--  26.04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  10';
wwv_flow_imp.g_varchar2_table(165) := '.01.2020   Jari Laine     Added procedures:'||wwv_flow.LF||
'--                                - merge_files'||wwv_flow.LF||
'--    ';
wwv_flow_imp.g_varchar2_table(166) := '                            - file_upload'||wwv_flow.LF||
'--  12.01.2020   Jari Laine     Added function prepare_fi';
wwv_flow_imp.g_varchar2_table(167) := 'le_path.'||wwv_flow.LF||
'--  09.04.2020   Jari Laine     Updated procedures for case-insensitive tag handling.'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(168) := ' 09.05.2020   Jari Laine     Changed input parameters from NUMBER to VARCHAR2.'||wwv_flow.LF||
'--                  ';
wwv_flow_imp.g_varchar2_table(169) := '            Added functions:'||wwv_flow.LF||
'--                                - get_comment_post_id'||wwv_flow.LF||
'--           ';
wwv_flow_imp.g_varchar2_table(170) := '                     - is_email'||wwv_flow.LF||
'--  10.05.2020   Jari Laine     Added procedure send_reply_notify t';
wwv_flow_imp.g_varchar2_table(171) := 'o notify replies.'||wwv_flow.LF||
'--  12.05.2020   Jari Laine     Removed function prepare_file_path.'||wwv_flow.LF||
'--  17.05.20';
wwv_flow_imp.g_varchar2_table(172) := '20   Jari Laine     Removed parameter `p_err_mesg` from function get_first_paragraph.'||wwv_flow.LF||
'--  19.05.202';
wwv_flow_imp.g_varchar2_table(173) := '0   Jari Laine     Removed obsolete function get_post_title.'||wwv_flow.LF||
'--  24.05.2020   Jari Laine     Added ';
wwv_flow_imp.g_varchar2_table(174) := 'procedures:'||wwv_flow.LF||
'--                                - run_settings_post_expression'||wwv_flow.LF||
'--                   ';
wwv_flow_imp.g_varchar2_table(175) := '             - run_feature_post_expression'||wwv_flow.LF||
'--                                - update_feature'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(176) := '22.06.2020   Jari Laine     Fixed bug in function is_integer.'||wwv_flow.LF||
'--                              Added';
wwv_flow_imp.g_varchar2_table(177) := ' parameters `p_min` and `p_max` to function is_integer.'||wwv_flow.LF||
'--  30.09.2020   Jari Laine     Added proce';
wwv_flow_imp.g_varchar2_table(178) := 'dure google_post_authentication.'||wwv_flow.LF||
'--  28.11.2020   Jari Laine     Renamed google_post_authentication';
wwv_flow_imp.g_varchar2_table(179) := ' to post_authentication.'||wwv_flow.LF||
'--                              Removed obsolete function get_comment_post';
wwv_flow_imp.g_varchar2_table(180) := '_id.'||wwv_flow.LF||
'--  28.02.2021   Jari Laine     Added function get_footer_link_seq.'||wwv_flow.LF||
'--  23.05.2021   Jari Lai';
wwv_flow_imp.g_varchar2_table(181) := 'ne     Updated package to remove ORDS dependency.'||wwv_flow.LF||
'--  21.03.2021   Jari Laine     Updated procedure';
wwv_flow_imp.g_varchar2_table(182) := ' get_blogger_details:'||wwv_flow.LF||
'--                                - Fetch authorization group name from BLOG_';
wwv_flow_imp.g_varchar2_table(183) := 'SETTINGS table.'||wwv_flow.LF||
'--                              Enhanced function remove_whitespace by adding TRIM.';
wwv_flow_imp.g_varchar2_table(184) := ''||wwv_flow.LF||
'--                              Updated add_category and add_tag to use remove_whitespace.'||wwv_flow.LF||
'--  11';
wwv_flow_imp.g_varchar2_table(185) := '.04.2021   Jari Laine     Moved send_reply_notify to package BLOG_COMM.'||wwv_flow.LF||
'--  13.04.2021   Jari Laine';
wwv_flow_imp.g_varchar2_table(186) := '     Renamed function get_footer_link_seq to get_modal_page_seq.'||wwv_flow.LF||
'--                              Re';
wwv_flow_imp.g_varchar2_table(187) := 'moved procedure run_feature_post_expression.'||wwv_flow.LF||
'--                              Updated procedure post';
wwv_flow_imp.g_varchar2_table(188) := '_authentication.'||wwv_flow.LF||
'--  18.04.2021   Jari Laine     Moved function is_email to package BLOG_COMM.'||wwv_flow.LF||
'-- ';
wwv_flow_imp.g_varchar2_table(189) := ' 05.01.2022   Jari Laine     Removed unused parameters/variables from:'||wwv_flow.LF||
'--                          ';
wwv_flow_imp.g_varchar2_table(190) := '      - post_authentication'||wwv_flow.LF||
'--                                - update_feature'||wwv_flow.LF||
'--                 ';
wwv_flow_imp.g_varchar2_table(191) := '               - get_blogger_details'||wwv_flow.LF||
'--                                - add_blogger'||wwv_flow.LF||
'--  27.03.202';
wwv_flow_imp.g_varchar2_table(192) := '2   Jari Laine     Fixed bug in get_first_paragraph for nested elements.'||wwv_flow.LF||
'--                        ';
wwv_flow_imp.g_varchar2_table(193) := '      Removed obsolete procedures:'||wwv_flow.LF||
'--                                - remove_unused_tags'||wwv_flow.LF||
'--      ';
wwv_flow_imp.g_varchar2_table(194) := '                          - purge_post_preview'||wwv_flow.LF||
'--                                - purge_post_previ';
wwv_flow_imp.g_varchar2_table(195) := 'ew_job'||wwv_flow.LF||
'--                                - save_post_preview'||wwv_flow.LF||
'--  13.04.2022   Jari Laine     Fixed';
wwv_flow_imp.g_varchar2_table(196) := ' error message handling in functions:'||wwv_flow.LF||
'--                                - is_integer'||wwv_flow.LF||
'--           ';
wwv_flow_imp.g_varchar2_table(197) := '                     - is_url'||wwv_flow.LF||
'--                                - is_date_format'||wwv_flow.LF||
'--  01.05.2022   ';
wwv_flow_imp.g_varchar2_table(198) := 'Jari Laine     Simplified logic in function request_to_post_status.'||wwv_flow.LF||
'--  07.05.2022   Jari Laine    ';
wwv_flow_imp.g_varchar2_table(199) := ' Added procedures:'||wwv_flow.LF||
'--                                - remove_unused_tags'||wwv_flow.LF||
'--                      ';
wwv_flow_imp.g_varchar2_table(200) := '          - remove_unused_categories'||wwv_flow.LF||
'--                              Changed add_tag from private t';
wwv_flow_imp.g_varchar2_table(201) := 'o public.'||wwv_flow.LF||
'--                              Removed obsolete functions:'||wwv_flow.LF||
'--                          ';
wwv_flow_imp.g_varchar2_table(202) := '      - get_post_tags'||wwv_flow.LF||
'--                                - get_category_title'||wwv_flow.LF||
'--                   ';
wwv_flow_imp.g_varchar2_table(203) := '           Added procedures:'||wwv_flow.LF||
'--                                - resequence_link_groups'||wwv_flow.LF||
'--        ';
wwv_flow_imp.g_varchar2_table(204) := '                        - resequence_links'||wwv_flow.LF||
'--                                - resequence_categorie';
wwv_flow_imp.g_varchar2_table(205) := 's'||wwv_flow.LF||
'--                                - resequence_tags'||wwv_flow.LF||
'--  09.05.2022   Jari Laine     Removed obso';
wwv_flow_imp.g_varchar2_table(206) := 'lete procedure run_settings_post_expression.'||wwv_flow.LF||
'--  08.03.2023   Jari Laine     Updated function is_da';
wwv_flow_imp.g_varchar2_table(207) := 'te_format to validate as DATE instead of TIMESTAMP.'||wwv_flow.LF||
'--  03.04.2023   Jari Laine     Converted funct';
wwv_flow_imp.g_varchar2_table(208) := 'ion file_upload to procedure with OUT parameter.'||wwv_flow.LF||
'--  28.05.2023   Jari Laine     Added function req';
wwv_flow_imp.g_varchar2_table(209) := 'uest_to_post_success_message.'||wwv_flow.LF||
'--  01.06.2023   Jari Laine     Removed procedure file_upload.'||wwv_flow.LF||
'--   ';
wwv_flow_imp.g_varchar2_table(210) := '                           Added function file_exists.'||wwv_flow.LF||
'--                              Updated proc';
wwv_flow_imp.g_varchar2_table(211) := 'edure merge_files.'||wwv_flow.LF||
'--  30.07.2023   Jari Laine     Updated procedure post_authentication:'||wwv_flow.LF||
'--      ';
wwv_flow_imp.g_varchar2_table(212) := '                          - Check if workspace user is locked.'||wwv_flow.LF||
'--                                - ';
wwv_flow_imp.g_varchar2_table(213) := 'Replaced apex_util.set_build_option_status with'||wwv_flow.LF||
'--                                  apex_applicatio';
wwv_flow_imp.g_varchar2_table(214) := 'n_admin.set_build_option_status.'||wwv_flow.LF||
'--  10.03.2024   Jari Laine     Bug fix in post_authentication to ';
wwv_flow_imp.g_varchar2_table(215) := 'check only the current workspace.'||wwv_flow.LF||
'--  08.04.2024   Jari Laine     Removed functions:'||wwv_flow.LF||
'--           ';
wwv_flow_imp.g_varchar2_table(216) := '                     - request_to_post_success_message'||wwv_flow.LF||
'--                                - request_';
wwv_flow_imp.g_varchar2_table(217) := 'to_link_success_message'||wwv_flow.LF||
'--  11.04.2024   Jari Laine     Added procedure resequence_dynamic_content.';
wwv_flow_imp.g_varchar2_table(218) := ''||wwv_flow.LF||
'--  21.07.2024   Jari Laine     Added procedures:'||wwv_flow.LF||
'--                                - update_feat';
wwv_flow_imp.g_varchar2_table(219) := 'ure (accepts build option name as parameter)'||wwv_flow.LF||
'--                                - set_attribute_valu';
wwv_flow_imp.g_varchar2_table(220) := 'e'||wwv_flow.LF||
'--                              Moved file repository-related procedures/functions to BLOG_FILE p';
wwv_flow_imp.g_varchar2_table(221) := 'ackage.'||wwv_flow.LF||
'--                              Removed procedure update_text_messages.'||wwv_flow.LF||
'--  25.08.2024   J';
wwv_flow_imp.g_varchar2_table(222) := 'ari Laine     Moved function remove_whitespace to package BLOG_UTIL.'||wwv_flow.LF||
'--  30.06.2025   Jari Laine   ';
wwv_flow_imp.g_varchar2_table(223) := '  Changes to procedure update_feature'||wwv_flow.LF||
'--  02.07.2025   Jari Laine     Package renamed BLOG_CM -> BL';
wwv_flow_imp.g_varchar2_table(224) := 'OG_ADMIN'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(225) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  a';
wwv_flow_imp.g_varchar2_table(226) := 'dmin app application authentication scheme Google'||wwv_flow.LF||
'  procedure post_authentication;'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(227) := '-----------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app ap';
wwv_flow_imp.g_varchar2_table(228) := 'plication processes'||wwv_flow.LF||
'  procedure get_blogger_details('||wwv_flow.LF||
'    p_app_id            in varchar2,'||wwv_flow.LF||
'    p_u';
wwv_flow_imp.g_varchar2_table(229) := 'sername          in varchar2,'||wwv_flow.LF||
'    p_user_id           out nocopy number,'||wwv_flow.LF||
'    p_name              o';
wwv_flow_imp.g_varchar2_table(230) := 'ut nocopy varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(231) := '------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 14'||wwv_flow.LF||
'  function get_category_seq return varchar2;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(232) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  adm';
wwv_flow_imp.g_varchar2_table(233) := 'in app page 52'||wwv_flow.LF||
'  function get_link_grp_seq return varchar2;'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(234) := '------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 81'||wwv_flow.LF||
'  function get_m';
wwv_flow_imp.g_varchar2_table(235) := 'odal_page_seq return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(236) := '------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 51'||wwv_flow.LF||
'  function get_link_seq('||wwv_flow.LF||
'    p_link_group_id ';
wwv_flow_imp.g_varchar2_table(237) := '    in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(238) := '-------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'  function request_to_post_status('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(239) := ' p_request           in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(240) := '------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'  function get_first_p';
wwv_flow_imp.g_varchar2_table(241) := 'aragraph('||wwv_flow.LF||
'    p_body_html         in clob'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(242) := '----------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12 Processing pr';
wwv_flow_imp.g_varchar2_table(243) := 'ocess "Process Category"'||wwv_flow.LF||
'  procedure add_category('||wwv_flow.LF||
'    p_category_title    in varchar2,'||wwv_flow.LF||
'    p_cat';
wwv_flow_imp.g_varchar2_table(244) := 'egory_id       out nocopy number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(245) := '--------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 14'||wwv_flow.LF||
'  procedure remove_unused_categories;';
wwv_flow_imp.g_varchar2_table(246) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(247) := '--  admin app page 16 and inside this package'||wwv_flow.LF||
'  procedure add_tag('||wwv_flow.LF||
'    p_tag               in varc';
wwv_flow_imp.g_varchar2_table(248) := 'har2,'||wwv_flow.LF||
'    p_tag_id            out nocopy number'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(249) := '------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 12'||wwv_flow.LF||
'  procedure add_post_t';
wwv_flow_imp.g_varchar2_table(250) := 'ags('||wwv_flow.LF||
'    p_post_id           in varchar2,'||wwv_flow.LF||
'    p_tags              in varchar2,'||wwv_flow.LF||
'    p_sep         ';
wwv_flow_imp.g_varchar2_table(251) := '      in varchar2 default '','''||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(252) := '-----------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 15'||wwv_flow.LF||
'  procedure remove_unused_tags;'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(253) := '------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin';
wwv_flow_imp.g_varchar2_table(254) := ' app page 20012 validation "Is Integer"'||wwv_flow.LF||
'  function is_integer('||wwv_flow.LF||
'    p_value             in varchar2';
wwv_flow_imp.g_varchar2_table(255) := ','||wwv_flow.LF||
'    p_min               in number,'||wwv_flow.LF||
'    p_max               in number,'||wwv_flow.LF||
'    p_err_mesg          i';
wwv_flow_imp.g_varchar2_table(256) := 'n varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(257) := '--------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 20012 validation "Is URL"'||wwv_flow.LF||
'  function is_url('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(258) := '   p_value             in varchar2,'||wwv_flow.LF||
'    p_err_mesg          in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(259) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  a';
wwv_flow_imp.g_varchar2_table(260) := 'dmin app page 20012 validation "Is date format"'||wwv_flow.LF||
'  function is_date_format('||wwv_flow.LF||
'    p_value            ';
wwv_flow_imp.g_varchar2_table(261) := ' in varchar2,'||wwv_flow.LF||
'    p_err_mesg          in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(262) := '------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 20011 Pr';
wwv_flow_imp.g_varchar2_table(263) := 'ocessing process "Features - Save Interactive Grid Data"'||wwv_flow.LF||
'  procedure update_feature('||wwv_flow.LF||
'    p_app_id ';
wwv_flow_imp.g_varchar2_table(264) := '           in number,'||wwv_flow.LF||
'    p_build_option_id   in number,'||wwv_flow.LF||
'    p_build_status      in varchar2'||wwv_flow.LF||
'  );';
wwv_flow_imp.g_varchar2_table(265) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:';
wwv_flow_imp.g_varchar2_table(266) := ''||wwv_flow.LF||
'--  admin app page 20017 and 20018'||wwv_flow.LF||
'--  package blog_ai and blog_oci_os'||wwv_flow.LF||
'  procedure update_feature';
wwv_flow_imp.g_varchar2_table(267) := '('||wwv_flow.LF||
'    p_build_option_name in varchar2,'||wwv_flow.LF||
'    p_build_status      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(268) := '----------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app pag';
wwv_flow_imp.g_varchar2_table(269) := 'e 14'||wwv_flow.LF||
'  procedure resequence_categories;'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(270) := '----------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 16'||wwv_flow.LF||
'  procedure resequence_tags('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(271) := 'post_id           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(272) := '-----------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app page 50'||wwv_flow.LF||
'  procedure resequence_link_groups;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(273) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  a';
wwv_flow_imp.g_varchar2_table(274) := 'dmin app page 50'||wwv_flow.LF||
'  procedure resequence_links('||wwv_flow.LF||
'    p_link_group_id     in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(275) := '------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin';
wwv_flow_imp.g_varchar2_table(276) := ' app page 80'||wwv_flow.LF||
'  procedure resequence_dynamic_content;'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(277) := '-----------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--'||wwv_flow.LF||
'  procedure set_attribute_value('||wwv_flow.LF||
'    p_at';
wwv_flow_imp.g_varchar2_table(278) := 'tribute_list    in apex_t_varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(279) := '----------------------'||wwv_flow.LF||
'end "BLOG_ADMIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_PLUGIN"'||wwv_flow.LF||
'authid define';
wwv_flow_imp.g_varchar2_table(280) := 'r'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------';
wwv_flow_imp.g_varchar2_table(281) := '---------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    This ';
wwv_flow_imp.g_varchar2_table(282) := 'package contains procedures for rendering, validating, and handling AJAX requests for APEX plugins.';
wwv_flow_imp.g_varchar2_table(283) := ''||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ===========================================================================';
wwv_flow_imp.g_varchar2_table(284) := '='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  --------------------';
wwv_flow_imp.g_varchar2_table(285) := '----------------------------'||wwv_flow.LF||
'--  22.04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  03.01.2020   Jar';
wwv_flow_imp.g_varchar2_table(286) := 'i Laine     Added comments to package specification.'||wwv_flow.LF||
'--  13.04.2022   Jari Laine     Bug fix in val';
wwv_flow_imp.g_varchar2_table(287) := 'idate_math_question_field.'||wwv_flow.LF||
'--                              Improved error message handling.'||wwv_flow.LF||
'--  07';
wwv_flow_imp.g_varchar2_table(288) := '.05.2023   Jari Laine     Minor changes to enhance code readability.'||wwv_flow.LF||
'--  17.07.2024   Jari Laine   ';
wwv_flow_imp.g_varchar2_table(289) := '  Removed deprecated apex_plugin.get_input_name_for_page_item usage.'||wwv_flow.LF||
'--                            ';
wwv_flow_imp.g_varchar2_table(290) := '  Modified render procedure to pass label ID to JavaScript during load.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(291) := '---------------------------------------------------------'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(292) := '---------------------------------------'||wwv_flow.LF||
'  procedure render_math_question_field('||wwv_flow.LF||
'    p_item    in  ';
wwv_flow_imp.g_varchar2_table(293) := '          apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in            apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in  ';
wwv_flow_imp.g_varchar2_table(294) := '          apex_plugin.t_item_render_param,'||wwv_flow.LF||
'    p_result  in out nocopy apex_plugin.t_item_render_re';
wwv_flow_imp.g_varchar2_table(295) := 'sult'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  proc';
wwv_flow_imp.g_varchar2_table(296) := 'edure ajax_math_question_field('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in  ';
wwv_flow_imp.g_varchar2_table(297) := '          apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in            apex_plugin.t_item_ajax_param,'||wwv_flow.LF||
'    p_r';
wwv_flow_imp.g_varchar2_table(298) := 'esult  in out nocopy apex_plugin.t_item_ajax_result'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(299) := '---------------------------------------'||wwv_flow.LF||
'  procedure validate_math_question_field('||wwv_flow.LF||
'    p_item    in';
wwv_flow_imp.g_varchar2_table(300) := '            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in            apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in';
wwv_flow_imp.g_varchar2_table(301) := '            apex_plugin.t_item_validation_param,'||wwv_flow.LF||
'    p_result  in out nocopy apex_plugin.t_item_val';
wwv_flow_imp.g_varchar2_table(302) := 'idation_result'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(303) := '--'||wwv_flow.LF||
'end "BLOG_PLUGIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_URL"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(304) := '-----------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(305) := '-----------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    This package contains funct';
wwv_flow_imp.g_varchar2_table(306) := 'ions to generate various types of URLs'||wwv_flow.LF||
'--    for the blog application. The URLs support different c';
wwv_flow_imp.g_varchar2_table(307) := 'ontent types,'||wwv_flow.LF||
'--    such as posts, categories, archives, tags, and dynamic pages,'||wwv_flow.LF||
'--    while offe';
wwv_flow_imp.g_varchar2_table(308) := 'ring flexibility with canonical options and APEX integrations.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ============';
wwv_flow_imp.g_varchar2_table(309) := '================================================================'||wwv_flow.LF||
'--  DATE         MODIFIED BY    DE';
wwv_flow_imp.g_varchar2_table(310) := 'SCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  22.';
wwv_flow_imp.g_varchar2_table(311) := '04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  09.05.2020   Jari Laine     Changed number input/outp';
wwv_flow_imp.g_varchar2_table(312) := 'ut parameters to VARCHAR2 for APEX usage.'||wwv_flow.LF||
'--                              Added canonical URL param';
wwv_flow_imp.g_varchar2_table(313) := 'eter to functions.'||wwv_flow.LF||
'--                              Created additional signatures for APEX usage.'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(314) := '-  10.05.2020   Jari Laine     Added new function get_unsubscribe.'||wwv_flow.LF||
'--  19.05.2020   Jari Laine     ';
wwv_flow_imp.g_varchar2_table(315) := 'Hardcoded page and item names.'||wwv_flow.LF||
'--                              Removed global constants from BLOG_U';
wwv_flow_imp.g_varchar2_table(316) := 'TIL package.'||wwv_flow.LF||
'--  23.05.2020   Jari Laine     Removed default value for get_tab parameter p_app_page';
wwv_flow_imp.g_varchar2_table(317) := '_id.'||wwv_flow.LF||
'--  13.11.2021   Jari Laine     Added functions get_sitemap_index, get_rss, and get_rss_xsl.'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(318) := '--  18.12.2021   Jari Laine     Moved procedure redirect_search to BLOG_UTIL.'||wwv_flow.LF||
'--  14.03.2022   Jari';
wwv_flow_imp.g_varchar2_table(319) := ' Laine     Added new function get_canonical_host.'||wwv_flow.LF||
'--  24.11.2022   Jari Laine     Added new functio';
wwv_flow_imp.g_varchar2_table(320) := 'n get_dynamic_page.'||wwv_flow.LF||
'--                              Removed unused parameters from functions.'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(321) := '                            Hardcoded values moved to package private constants.'||wwv_flow.LF||
'--  18.11.2023   J';
wwv_flow_imp.g_varchar2_table(322) := 'ari Laine     Added new function get_atom.'||wwv_flow.LF||
'--  01.04.2024   Jari Laine     Changed private constant';
wwv_flow_imp.g_varchar2_table(323) := 's to a JSON object.'||wwv_flow.LF||
'--  23.07.2024   Jari Laine     Added new function get_file.'||wwv_flow.LF||
'--  01.02.2025   ';
wwv_flow_imp.g_varchar2_table(324) := 'Jari Laine     Added new procedure set_canonical_host and package initialization code.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(325) := '------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(326) := '------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--'||wwv_flow.LF||
'  function get_canonica';
wwv_flow_imp.g_varchar2_table(327) := 'l_host return varchar2;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(328) := '-----'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_xml'||wwv_flow.LF||
'  function get_tab('||wwv_flow.LF||
'    p_page            ';
wwv_flow_imp.g_varchar2_table(329) := 'in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_canonical       in varchar2 def';
wwv_flow_imp.g_varchar2_table(330) := 'ault ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(331) := '-------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_comm, blog_xml'||wwv_flow.LF||
'-- view blog_v_posts'||wwv_flow.LF||
'  function ge';
wwv_flow_imp.g_varchar2_table(332) := 't_post('||wwv_flow.LF||
'    p_post_id         in number,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_ca';
wwv_flow_imp.g_varchar2_table(333) := 'nonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(334) := '------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_url'||wwv_flow.LF||
'  func';
wwv_flow_imp.g_varchar2_table(335) := 'tion get_post('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,';
wwv_flow_imp.g_varchar2_table(336) := ''||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(337) := '---------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- package blog_xml and view b';
wwv_flow_imp.g_varchar2_table(338) := 'log_v_categories'||wwv_flow.LF||
'  function get_category('||wwv_flow.LF||
'    p_category_id     in number,'||wwv_flow.LF||
'    p_canonical       ';
wwv_flow_imp.g_varchar2_table(339) := 'in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(340) := '----------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_url'||wwv_flow.LF||
'  function get_categ';
wwv_flow_imp.g_varchar2_table(341) := 'ory('||wwv_flow.LF||
'    p_category_id     in varchar2,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return';
wwv_flow_imp.g_varchar2_table(342) := ' varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Cal';
wwv_flow_imp.g_varchar2_table(343) := 'led from:'||wwv_flow.LF||
'-- package blog_xml and view blog_v_archive_year'||wwv_flow.LF||
'  function get_archive('||wwv_flow.LF||
'    p_archive_';
wwv_flow_imp.g_varchar2_table(344) := 'id      in number,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(345) := '----------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages';
wwv_flow_imp.g_varchar2_table(346) := ' blog_html, blog_url'||wwv_flow.LF||
'  function get_archive('||wwv_flow.LF||
'    p_archive_id      in varchar2,'||wwv_flow.LF||
'    p_canonical  ';
wwv_flow_imp.g_varchar2_table(347) := '     in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(348) := '---------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- package blog_xml and view blog_v_post_tags'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(349) := ' function get_tag('||wwv_flow.LF||
'    p_tag_id          in number,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO''';
wwv_flow_imp.g_varchar2_table(350) := ''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(351) := '----'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_html, blog_url'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id          i';
wwv_flow_imp.g_varchar2_table(352) := 'n varchar2,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(353) := '---------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- view blog_v_dyn';
wwv_flow_imp.g_varchar2_table(354) := 'amic_content'||wwv_flow.LF||
'  function get_dynamic_page('||wwv_flow.LF||
'    p_content_id      in number'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(355) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(356) := ' packages blog_url, blog_xml'||wwv_flow.LF||
'  function get_process('||wwv_flow.LF||
'    p_application     in varchar2 default nul';
wwv_flow_imp.g_varchar2_table(357) := 'l,'||wwv_flow.LF||
'    p_process         in varchar2 default null,'||wwv_flow.LF||
'    p_items           in varchar2 default null,';
wwv_flow_imp.g_varchar2_table(358) := ''||wwv_flow.LF||
'    p_values          in varchar2 default null,'||wwv_flow.LF||
'    p_canonical       in varchar2 default ''YES'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(359) := '  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(360) := '--'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- package blog_comm'||wwv_flow.LF||
'  function get_unsubscribe('||wwv_flow.LF||
'    p_application     in var';
wwv_flow_imp.g_varchar2_table(361) := 'char2,'||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_subscription_id in number'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(362) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(363) := ' packages blog_html, blog_xml'||wwv_flow.LF||
'-- Blog Administration > Lists > Public Application Links'||wwv_flow.LF||
'  function';
wwv_flow_imp.g_varchar2_table(364) := ' get_rss('||wwv_flow.LF||
'    p_application     in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(365) := '-------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_htm';
wwv_flow_imp.g_varchar2_table(366) := 'l, blog_xml'||wwv_flow.LF||
'-- Blog Administration > Lists > Public Application Links'||wwv_flow.LF||
'  function get_atom('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(367) := 'application     in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(368) := '--------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-- packages blog_xml'||wwv_flow.LF||
'  function get_';
wwv_flow_imp.g_varchar2_table(369) := 'rss_xsl('||wwv_flow.LF||
'    p_application     in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(370) := '------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  Blog Administrati';
wwv_flow_imp.g_varchar2_table(371) := 'on > Lists > Public Application Links'||wwv_flow.LF||
'  function get_sitemap_index('||wwv_flow.LF||
'    p_application     in varch';
wwv_flow_imp.g_varchar2_table(372) := 'ar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(373) := '--------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  Blog Administration abd Public Application'||wwv_flow.LF||
'  function ge';
wwv_flow_imp.g_varchar2_table(374) := 't_file('||wwv_flow.LF||
'    p_file_path       in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(375) := 'canonical       in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(376) := '--------------------------------------------'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(377) := '--------------------------'||wwv_flow.LF||
'end "BLOG_URL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_COMMENT"'||wwv_flow.LF||
'authid def';
wwv_flow_imp.g_varchar2_table(378) := 'iner'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(379) := '------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    Thi';
wwv_flow_imp.g_varchar2_table(380) := 's package provides procedures and functions for managing post comments,'||wwv_flow.LF||
'--    including functionali';
wwv_flow_imp.g_varchar2_table(381) := 'ty for replying, flagging, email validation, and HTML content processing.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  =';
wwv_flow_imp.g_varchar2_table(382) := '==========================================================================='||wwv_flow.LF||
'--  DATE         MODIFI';
wwv_flow_imp.g_varchar2_table(383) := 'ED BY    DESCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ----------------------------------------------';
wwv_flow_imp.g_varchar2_table(384) := '--'||wwv_flow.LF||
'--  11.05.2020   Jari Laine     Created package.'||wwv_flow.LF||
'--  11.04.2021   Jari Laine     Added new proc';
wwv_flow_imp.g_varchar2_table(385) := 'edure:'||wwv_flow.LF||
'--                                - reply_notify'||wwv_flow.LF||
'--                              Added new ';
wwv_flow_imp.g_varchar2_table(386) := 'functions:'||wwv_flow.LF||
'--                                - validate_email'||wwv_flow.LF||
'--                                - ';
wwv_flow_imp.g_varchar2_table(387) := 'is_email_verified'||wwv_flow.LF||
'--  18.04.2021   Jari Laine     Added new function is_email.'||wwv_flow.LF||
'--  30.10.2021   Ja';
wwv_flow_imp.g_varchar2_table(388) := 'ri Laine     Removed obsolete functions:'||wwv_flow.LF||
'--                                - validate_email'||wwv_flow.LF||
'--    ';
wwv_flow_imp.g_varchar2_table(389) := '                            - is_email_verified'||wwv_flow.LF||
'--  13.04.2022   Jari Laine     Enhanced flagging f';
wwv_flow_imp.g_varchar2_table(390) := 'unctionality:'||wwv_flow.LF||
'--                                - Procedure flag_comment: Supports adding multiple ';
wwv_flow_imp.g_varchar2_table(391) := 'flags.'||wwv_flow.LF||
'--                                - Procedure unflag_comment: Supports removing multiple fla';
wwv_flow_imp.g_varchar2_table(392) := 'gs.'||wwv_flow.LF||
'--  27.11.2022   Jari Laine     Updated procedure build_code_tab:'||wwv_flow.LF||
'--                          ';
wwv_flow_imp.g_varchar2_table(393) := '      - Removed leading and trailing line breaks from posted code.'||wwv_flow.LF||
'--  15.08.2024   Jari Laine     ';
wwv_flow_imp.g_varchar2_table(394) := 'Modified and renamed procedure:'||wwv_flow.LF||
'--                                - remove_anchor to remove_html_ta';
wwv_flow_imp.g_varchar2_table(395) := 'gs'||wwv_flow.LF||
'--                              Added new functions:'||wwv_flow.LF||
'--                                - plain_';
wwv_flow_imp.g_varchar2_table(396) := 'text'||wwv_flow.LF||
'--                                - short_text'||wwv_flow.LF||
'--                              Updated proced';
wwv_flow_imp.g_varchar2_table(397) := 'ure:'||wwv_flow.LF||
'--                                - build_comment_html'||wwv_flow.LF||
'--  02.07.2025   Jari Laine     Packag';
wwv_flow_imp.g_varchar2_table(398) := 'e renamed BLOG_COMM -> BLOG_COMMENTS'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  ======================================================';
wwv_flow_imp.g_varchar2_table(399) := '======================'||wwv_flow.LF||
'--  TO DO:'||wwv_flow.LF||
'--  ============================================================';
wwv_flow_imp.g_varchar2_table(400) := '================'||wwv_flow.LF||
'--  #1 Improve HTML validation for comment content.'||wwv_flow.LF||
'--  #2 Enhance email validati';
wwv_flow_imp.g_varchar2_table(401) := 'on logic to handle edge cases.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(402) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(403) := '  -- Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  --  admin app pages 62'||wwv_flow.LF||
'  function plain_text('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(404) := ' p_string          in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(405) := '----------------------------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --'||wwv_flow.LF||
'  function short_text('||wwv_flow.LF||
'    p_string   ';
wwv_flow_imp.g_varchar2_table(406) := '       in varchar2,'||wwv_flow.LF||
'    p_plain_text      in boolean default true,'||wwv_flow.LF||
'    p_str_length      in number';
wwv_flow_imp.g_varchar2_table(407) := ' default 100'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(408) := '----------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  function format_comment('||wwv_flow.LF||
'    p_c';
wwv_flow_imp.g_varchar2_table(409) := 'omment         in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(410) := '------------------------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  function validate_c';
wwv_flow_imp.g_varchar2_table(411) := 'omment('||wwv_flow.LF||
'    p_comment         in varchar2,'||wwv_flow.LF||
'    p_max_length      in number default 4000'||wwv_flow.LF||
'  ) retur';
wwv_flow_imp.g_varchar2_table(412) := 'n varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  -- ';
wwv_flow_imp.g_varchar2_table(413) := 'Called from:'||wwv_flow.LF||
'  --  public app page 1001'||wwv_flow.LF||
'  --  admin app page 20012'||wwv_flow.LF||
'  function is_email('||wwv_flow.LF||
'    p_em';
wwv_flow_imp.g_varchar2_table(414) := 'ail           in varchar2,'||wwv_flow.LF||
'    p_err_mesg        in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(415) := '-----------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app p';
wwv_flow_imp.g_varchar2_table(416) := 'age 1001'||wwv_flow.LF||
'--  admin app pages 61'||wwv_flow.LF||
'  procedure flag_comment('||wwv_flow.LF||
'    p_comment_id      in varchar2,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(417) := ' p_flags           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(418) := '------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  admin app pages 61'||wwv_flow.LF||
'  procedure unflag_comment('||wwv_flow.LF||
'    p_comm';
wwv_flow_imp.g_varchar2_table(419) := 'ent_id      in varchar2,'||wwv_flow.LF||
'    p_flags           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(420) := '-----------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1001'||wwv_flow.LF||
'  proced';
wwv_flow_imp.g_varchar2_table(421) := 'ure new_comment_notify('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(422) := ' p_email_template  in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(423) := '------------------'||wwv_flow.LF||
'  -- Called from:'||wwv_flow.LF||
'  --  admin app pages 62'||wwv_flow.LF||
'  procedure reply_notify('||wwv_flow.LF||
'    p_ap';
wwv_flow_imp.g_varchar2_table(424) := 'p_id          in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(425) := '    p_email_template  in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(426) := '---------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1001'||wwv_flow.LF||
'  procedure subscribe('||wwv_flow.LF||
'    p_post';
wwv_flow_imp.g_varchar2_table(427) := '_id         in varchar2,'||wwv_flow.LF||
'    p_email           in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(428) := '-----------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 2'||wwv_flow.LF||
'  procedure';
wwv_flow_imp.g_varchar2_table(429) := ' unsubscribe('||wwv_flow.LF||
'    p_subscription_id in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(430) := '------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1001'||wwv_flow.LF||
'  procedure auto_ap';
wwv_flow_imp.g_varchar2_table(431) := 'prove('||wwv_flow.LF||
'    p_comment_id      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(432) := '-----------------------------'||wwv_flow.LF||
'end "BLOG_COMMENT";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_HTML"'||wwv_flow.LF||
'authid';
wwv_flow_imp.g_varchar2_table(433) := ' definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(434) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(435) := '  This package contains functions and procedures for generating and returning'||wwv_flow.LF||
'--    HTML code, incl';
wwv_flow_imp.g_varchar2_table(436) := 'uding canonical links, meta tags, RSS/Atom links, and buttons.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ============';
wwv_flow_imp.g_varchar2_table(437) := '================================================================'||wwv_flow.LF||
'--  DATE         MODIFIED BY    DE';
wwv_flow_imp.g_varchar2_table(438) := 'SCRIPTION'||wwv_flow.LF||
'--  -----------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  22.';
wwv_flow_imp.g_varchar2_table(439) := '04.2019   Jari Laine     Created package.'||wwv_flow.LF||
'--  29.04.2020   Jari Laine     Added function get_robots';
wwv_flow_imp.g_varchar2_table(440) := '_noindex_meta.'||wwv_flow.LF||
'--                              Updated canonical link functions to return'||wwv_flow.LF||
'--      ';
wwv_flow_imp.g_varchar2_table(441) := '                        robots noindex meta tag if canonical link generation fails.'||wwv_flow.LF||
'--             ';
wwv_flow_imp.g_varchar2_table(442) := '                 Added apex_debug to meta and canonical link functions.'||wwv_flow.LF||
'--  10.05.2020   Jari Laine';
wwv_flow_imp.g_varchar2_table(443) := '     Integrated blog_url functions for parameter p_canonical.'||wwv_flow.LF||
'--  19.05.2020   Jari Laine     Remov';
wwv_flow_imp.g_varchar2_table(444) := 'ed obsolete function get_search_button.'||wwv_flow.LF||
'--  06.07.2020   Jari Laine     Added parameter p_rss_url t';
wwv_flow_imp.g_varchar2_table(445) := 'o functions get_rss_link and get_rss_anchor.'||wwv_flow.LF||
'--                              Removed p_build_option';
wwv_flow_imp.g_varchar2_table(446) := '_status parameter from get_rss_link.'||wwv_flow.LF||
'--  13.11.2021   Jari Laine     Modified get_rss_anchor and ge';
wwv_flow_imp.g_varchar2_table(447) := 't_rss_link.'||wwv_flow.LF||
'--                              Removed obsolete functions.'||wwv_flow.LF||
'--  27.03.2022   Jari Lain';
wwv_flow_imp.g_varchar2_table(448) := 'e     Added parameters p_build_option and p_message to get_rss_link.'||wwv_flow.LF||
'--                            ';
wwv_flow_imp.g_varchar2_table(449) := '  Added p_message to get_rss_anchor.'||wwv_flow.LF||
'--  27.04.2022   Jari Laine     Removed obsolete functions get';
wwv_flow_imp.g_varchar2_table(450) := '_tag_anchor and get_post_tags.'||wwv_flow.LF||
'--  16.11.2022   Jari Laine     Removed obsolete functions get_post_';
wwv_flow_imp.g_varchar2_table(451) := 'description_meta and get_description_meta.'||wwv_flow.LF||
'--  25.11.2022   Jari Laine     Removed unused parameter';
wwv_flow_imp.g_varchar2_table(452) := 's.'||wwv_flow.LF||
'--  30.07.2023   Jari Laine     Replaced apex_util.get_build_option_status with'||wwv_flow.LF||
'--             ';
wwv_flow_imp.g_varchar2_table(453) := '                 apex_application_admin.get_build_option_status.'||wwv_flow.LF||
'--  18.11.2023   Jari Laine     Ad';
wwv_flow_imp.g_varchar2_table(454) := 'ded new function get_atom_link.'||wwv_flow.LF||
'--  01.04.2024   Jari Laine     Converted canonical link functions ';
wwv_flow_imp.g_varchar2_table(455) := 'to procedures:'||wwv_flow.LF||
'--                              - get_tab_canonical_link -> set_tab_canonical_link'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(456) := '--                              - get_post_canonical_link -> set_post_canonical_link'||wwv_flow.LF||
'--            ';
wwv_flow_imp.g_varchar2_table(457) := '                  - get_category_canonical_link -> set_category_canonical_link'||wwv_flow.LF||
'--                  ';
wwv_flow_imp.g_varchar2_table(458) := '            - get_archive_canonical_link -> set_archive_canonical_link'||wwv_flow.LF||
'--                          ';
wwv_flow_imp.g_varchar2_table(459) := '    - get_tag_canonical_link -> set_tag_canonical_link.'||wwv_flow.LF||
'--  10.04.2024   Jari Laine     Added funct';
wwv_flow_imp.g_varchar2_table(460) := 'ion get_page_canonical_link.'||wwv_flow.LF||
'--                              Renamed procedures for canonical links';
wwv_flow_imp.g_varchar2_table(461) := ' as listed above.'||wwv_flow.LF||
'--                              Updated get_rss_link and get_atom_link.'||wwv_flow.LF||
'--  18.0';
wwv_flow_imp.g_varchar2_table(462) := '4.2024   Jari Laine     Added new function get_button.'||wwv_flow.LF||
'--  01.02.2025   Jari Laine     Removed func';
wwv_flow_imp.g_varchar2_table(463) := 'tion get_page_canonical_link.'||wwv_flow.LF||
'--'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(464) := '---------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(465) := ' function get_robots_noindex_meta return varchar2;'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(466) := '--------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_CANONICAL_LINK_TAB'||wwv_flow.LF||
'  f';
wwv_flow_imp.g_varchar2_table(467) := 'unction set_tab_canonical_link('||wwv_flow.LF||
'    p_page            in varchar2,'||wwv_flow.LF||
'    p_url             out nocop';
wwv_flow_imp.g_varchar2_table(468) := 'y varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(469) := '--------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_CANONICAL_LINK_POST'||wwv_flow.LF||
'  function set_post_';
wwv_flow_imp.g_varchar2_table(470) := 'canonical_link('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_url             out nocopy varchar2'||wwv_flow.LF||
'  ) ';
wwv_flow_imp.g_varchar2_table(471) := 'return varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(472) := '-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_CANONICAL_LINK_CATEGORY'||wwv_flow.LF||
'  function set_category_canonica';
wwv_flow_imp.g_varchar2_table(473) := 'l_link('||wwv_flow.LF||
'    p_category_id     in varchar2,'||wwv_flow.LF||
'    p_url             out nocopy varchar2'||wwv_flow.LF||
'  ) return v';
wwv_flow_imp.g_varchar2_table(474) := 'archar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Calle';
wwv_flow_imp.g_varchar2_table(475) := 'd from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_CANONICAL_LINK_ARCHIVE'||wwv_flow.LF||
'  function set_archive_canonical_link('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(476) := '   p_archive_id      in varchar2,'||wwv_flow.LF||
'    p_url             out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(477) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(478) := '-  pub app shortcut BLOG_CANONICAL_LINK_TAG'||wwv_flow.LF||
'  function set_tag_canonical_link('||wwv_flow.LF||
'    p_tag_id       ';
wwv_flow_imp.g_varchar2_table(479) := '   in varchar2,'||wwv_flow.LF||
'    p_url             out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(480) := '--------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcu';
wwv_flow_imp.g_varchar2_table(481) := 't BLOG_RSS_ANCHOR'||wwv_flow.LF||
'  function get_rss_anchor('||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_message    ';
wwv_flow_imp.g_varchar2_table(482) := '     in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(483) := '--------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_RSS_LINK'||wwv_flow.LF||
'  function get_rss_link(';
wwv_flow_imp.g_varchar2_table(484) := ''||wwv_flow.LF||
'    p_app_id          in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_message         in va';
wwv_flow_imp.g_varchar2_table(485) := 'rchar2,'||wwv_flow.LF||
'    p_build_option    in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(486) := '----------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub app shortcut BLOG_ATOM_LINK';
wwv_flow_imp.g_varchar2_table(487) := ''||wwv_flow.LF||
'  function get_atom_link('||wwv_flow.LF||
'    p_app_id          in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,';
wwv_flow_imp.g_varchar2_table(488) := ''||wwv_flow.LF||
'    p_message         in varchar2,'||wwv_flow.LF||
'    p_build_option    in varchar2'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(489) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_button('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(490) := '    p_app_id          in varchar2,'||wwv_flow.LF||
'    p_title           in varchar2,'||wwv_flow.LF||
'    p_action          in var';
wwv_flow_imp.g_varchar2_table(491) := 'char2,'||wwv_flow.LF||
'    p_icon_classes    in varchar2,'||wwv_flow.LF||
'    p_button_classes  in varchar2 default null,'||wwv_flow.LF||
'    p_b';
wwv_flow_imp.g_varchar2_table(492) := 'uild_option    in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2;'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(493) := '-------------------------------------------'||wwv_flow.LF||
'  procedure prn_html('||wwv_flow.LF||
'    p_markdown      in apex_appl';
wwv_flow_imp.g_varchar2_table(494) := 'ication_global.vc_arr2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(495) := '----------'||wwv_flow.LF||
'end "BLOG_HTML";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_OCI_OS"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(496) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(497) := '--------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    Procedure and func';
wwv_flow_imp.g_varchar2_table(498) := 'tions for Oracle cloud object storage'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CREDITS:'||wwv_flow.LF||
'--    https://blogs.oracle.com/oraclemagazi';
wwv_flow_imp.g_varchar2_table(499) := 'ne/post/better-file-storage-in-oracle-cloud'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ===============================';
wwv_flow_imp.g_varchar2_table(500) := '============================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTION'||wwv_flow.LF||
'--  ----';
wwv_flow_imp.g_varchar2_table(501) := '-------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  21.07.2025   Jari Lain';
wwv_flow_imp.g_varchar2_table(502) := 'e     Created package.'||wwv_flow.LF||
'--  30.06.2025   Jari Laine     New function get_param_value'||wwv_flow.LF||
'--            ';
wwv_flow_imp.g_varchar2_table(503) := '                  Changes to procedure set_object_storage'||wwv_flow.LF||
'--'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(504) := '-------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(505) := '-------------------------'||wwv_flow.LF||
'  function get_param_value('||wwv_flow.LF||
'    p_param_name        in varchar2'||wwv_flow.LF||
'  ) ret';
wwv_flow_imp.g_varchar2_table(506) := 'urn varchar2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  p';
wwv_flow_imp.g_varchar2_table(507) := 'rocedure set_object_storage('||wwv_flow.LF||
'    p_bucket_name       in varchar2,'||wwv_flow.LF||
'    p_base_url          in varch';
wwv_flow_imp.g_varchar2_table(508) := 'ar2,'||wwv_flow.LF||
'    p_build_status      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(509) := '-----------------------------'||wwv_flow.LF||
'  procedure upload_object('||wwv_flow.LF||
'    p_file_names        in varchar2,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(510) := ' p_dir               in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_cache_control     in ';
wwv_flow_imp.g_varchar2_table(511) := 'varchar2 default null,'||wwv_flow.LF||
'    p_extract           in varchar2 default ''N'','||wwv_flow.LF||
'    p_overwrite_file    in';
wwv_flow_imp.g_varchar2_table(512) := ' varchar2 default ''N'','||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(513) := '------------------------------------------------------------'||wwv_flow.LF||
'  procedure file_sync('||wwv_flow.LF||
'    p_action  ';
wwv_flow_imp.g_varchar2_table(514) := '          in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 de';
wwv_flow_imp.g_varchar2_table(515) := 'fault null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(516) := '  procedure replace_object('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varcha';
wwv_flow_imp.g_varchar2_table(517) := 'r2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(518) := '---'||wwv_flow.LF||
'  procedure download_selected_objects('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_requ';
wwv_flow_imp.g_varchar2_table(519) := 'est_id in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(520) := '-------------------'||wwv_flow.LF||
'  procedure rename_object('||wwv_flow.LF||
'    p_old_file_path     in varchar2,'||wwv_flow.LF||
'    p_old_if_';
wwv_flow_imp.g_varchar2_table(521) := 'match      in varchar2,'||wwv_flow.LF||
'    p_new_file_path     in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 d';
wwv_flow_imp.g_varchar2_table(522) := 'efault null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(523) := ''||wwv_flow.LF||
'  procedure delete_object('||wwv_flow.LF||
'    p_file_path         in varchar2,'||wwv_flow.LF||
'    p_if_match          in varcha';
wwv_flow_imp.g_varchar2_table(524) := 'r2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(525) := '-----------------------------------------'||wwv_flow.LF||
'  procedure delete_selected_objects('||wwv_flow.LF||
'    p_collection_na';
wwv_flow_imp.g_varchar2_table(526) := 'me   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(527) := '-------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_OCI_OS";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace pa';
wwv_flow_imp.g_varchar2_table(528) := 'ckage "BLOG_XML"'||wwv_flow.LF||
'authid definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(529) := '------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(530) := ''||wwv_flow.LF||
'--  DESCRIPTION:'||wwv_flow.LF||
'--    Provides procedures and functions to generate and output RSS feeds, Atom f';
wwv_flow_imp.g_varchar2_table(531) := 'eeds,'||wwv_flow.LF||
'--    and various sitemap components (index, main, posts, categories, archives, and tags).'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(532) := '-'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ============================================================================';
wwv_flow_imp.g_varchar2_table(533) := ''||wwv_flow.LF||
'--    DATE        AUTHOR        DESCRIPTION'||wwv_flow.LF||
'--    ----------  ------------  ----------------------';
wwv_flow_imp.g_varchar2_table(534) := '--------------------------'||wwv_flow.LF||
'--    07.05.2019  Jari Laine    Created package.'||wwv_flow.LF||
'--    08.01.2020  Jari';
wwv_flow_imp.g_varchar2_table(535) := ' Laine    Removed categories sitemap.'||wwv_flow.LF||
'--                              Modified to use ORDS and blog';
wwv_flow_imp.g_varchar2_table(536) := ' version 4.'||wwv_flow.LF||
'--    09.04.2020  Jari Laine    Updated to utilize blog_url function parameter p_canoni';
wwv_flow_imp.g_varchar2_table(537) := 'cal.'||wwv_flow.LF||
'--    17.05.2020  Jari Laine    Removed private function get_app_alias and constant c_pub_app_';
wwv_flow_imp.g_varchar2_table(538) := 'id.'||wwv_flow.LF||
'--                              Moved private function get_ords_service to the blog_ords packag';
wwv_flow_imp.g_varchar2_table(539) := 'e.'||wwv_flow.LF||
'--    23.05.2020  Jari Laine    Changed sitemap_main to use the blog_pages table.'||wwv_flow.LF||
'--           ';
wwv_flow_imp.g_varchar2_table(540) := '                   Removed ORDS dependency.'||wwv_flow.LF||
'--                              Added procedures:'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(541) := '                              sitemap_categories'||wwv_flow.LF||
'--                                sitemap_archives';
wwv_flow_imp.g_varchar2_table(542) := ''||wwv_flow.LF||
'--                                sitemap_tags'||wwv_flow.LF||
'--    30.10.2021  Jari Laine    Modified sitemap_m';
wwv_flow_imp.g_varchar2_table(543) := 'ain to use the apex_application_pages view.'||wwv_flow.LF||
'--    13.11.2021  Jari Laine    Changes to the rss proc';
wwv_flow_imp.g_varchar2_table(544) := 'edure.'||wwv_flow.LF||
'--    30.12.2021  Jari Laine    Modified rss_xsl; CSS file name moved to application setting';
wwv_flow_imp.g_varchar2_table(545) := 's.'||wwv_flow.LF||
'--    05.01.2021  Jari Laine    Added parameter p_css_file to rss_xsl.'||wwv_flow.LF||
'--    13.03.2022  Jari L';
wwv_flow_imp.g_varchar2_table(546) := 'aine    Added parameter p_process_name to sitemap_index.'||wwv_flow.LF||
'--                              Removed bu';
wwv_flow_imp.g_varchar2_table(547) := 'ild option check from XML query in sitemap_index.'||wwv_flow.LF||
'--    19.04.2022  Jari Laine    Updates related t';
wwv_flow_imp.g_varchar2_table(548) := 'o blog_util.download_file.'||wwv_flow.LF||
'--    26.04.2022  Jari Laine    Added <lastmod> element to XML output fo';
wwv_flow_imp.g_varchar2_table(549) := 'r:'||wwv_flow.LF||
'--                                sitemap_categories'||wwv_flow.LF||
'--                                sitemap_';
wwv_flow_imp.g_varchar2_table(550) := 'archives'||wwv_flow.LF||
'--                                sitemap_tags'||wwv_flow.LF||
'--    28.04.2020  Jari Laine    Changes to';
wwv_flow_imp.g_varchar2_table(551) := ' rss_xsl.'||wwv_flow.LF||
'--    29.11.2022  Jari Laine    Removed parameter p_lang from rss.'||wwv_flow.LF||
'--                   ';
wwv_flow_imp.g_varchar2_table(552) := '           Added exception handler to raise HTTP errors in relevant procedures.'||wwv_flow.LF||
'--                 ';
wwv_flow_imp.g_varchar2_table(553) := '             Minor refinements.'||wwv_flow.LF||
'--    19.01.2023  Jari Laine    Removed parameter p_ws_images from ';
wwv_flow_imp.g_varchar2_table(554) := 'rss_xsl.'||wwv_flow.LF||
'--                              Removed parameter p_page_group from sitemap_main.'||wwv_flow.LF||
'--     ';
wwv_flow_imp.g_varchar2_table(555) := '                         Replaced private constants with global ones from blog_util:'||wwv_flow.LF||
'--            ';
wwv_flow_imp.g_varchar2_table(556) := '                    g_nls_date_lang'||wwv_flow.LF||
'--                                g_iso_8601_date'||wwv_flow.LF||
'--          ';
wwv_flow_imp.g_varchar2_table(557) := '                      g_rfc_2822_date'||wwv_flow.LF||
'--    30.07.2023  Jari Laine    Replaced apex_util.get_build_';
wwv_flow_imp.g_varchar2_table(558) := 'option_status with apex_application_admin.get_build_option_status.'||wwv_flow.LF||
'--    12.11.2023  Jari Laine    ';
wwv_flow_imp.g_varchar2_table(559) := 'Updates to rss and rss_xsl.'||wwv_flow.LF||
'--    13.11.2023  Jari Laine    Added a new procedure: atom.'||wwv_flow.LF||
'--    10.';
wwv_flow_imp.g_varchar2_table(560) := '03.2024  Jari Laine    Enhanced rss_xsl to handle application file absolute URLs.'||wwv_flow.LF||
'--    01.04.2024 ';
wwv_flow_imp.g_varchar2_table(561) := ' Jari Laine    Added parameter p_page_group to sitemap_main.'||wwv_flow.LF||
'--                              Update';
wwv_flow_imp.g_varchar2_table(562) := 'd package constants.'||wwv_flow.LF||
'--                              Introduced new constant: c_headers'||wwv_flow.LF||
'--'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(563) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(564) := '--------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 ';
wwv_flow_imp.g_varchar2_table(565) := 'Ajax Callback process "rss.xml"'||wwv_flow.LF||
'  procedure rss('||wwv_flow.LF||
'    p_app_name      in varchar2,'||wwv_flow.LF||
'    p_app_desc ';
wwv_flow_imp.g_varchar2_table(566) := '     in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(567) := '----'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process "atom.xml"'||wwv_flow.LF||
'  procedure atom(';
wwv_flow_imp.g_varchar2_table(568) := ''||wwv_flow.LF||
'    p_app_name      in varchar2,'||wwv_flow.LF||
'    p_app_desc      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(569) := '------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Aj';
wwv_flow_imp.g_varchar2_table(570) := 'ax Callback process "rss.xsl"'||wwv_flow.LF||
'  procedure rss_xsl('||wwv_flow.LF||
'    p_css_file      in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(571) := '------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  publi';
wwv_flow_imp.g_varchar2_table(572) := 'c app page 1003 Ajax Callback process "sitemap-index.xml"'||wwv_flow.LF||
'  procedure sitemap_index('||wwv_flow.LF||
'    p_app_id ';
wwv_flow_imp.g_varchar2_table(573) := '       in varchar2,'||wwv_flow.LF||
'    p_app_page_id   in varchar2,'||wwv_flow.LF||
'    p_process_name  in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(574) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  pub';
wwv_flow_imp.g_varchar2_table(575) := 'lic app page 1003 Ajax Callback process "sitemap-main.xml"'||wwv_flow.LF||
'  procedure sitemap_main('||wwv_flow.LF||
'    p_app_id ';
wwv_flow_imp.g_varchar2_table(576) := '       in varchar2,'||wwv_flow.LF||
'    p_page_group    in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(577) := '----------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback pr';
wwv_flow_imp.g_varchar2_table(578) := 'ocess "sitemap-posts.xml"'||wwv_flow.LF||
'  procedure sitemap_posts;'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(579) := '-----------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback process';
wwv_flow_imp.g_varchar2_table(580) := ' "sitemap-categories.xml"'||wwv_flow.LF||
'  procedure sitemap_categories;'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(581) := '----------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback pr';
wwv_flow_imp.g_varchar2_table(582) := 'ocess "sitemap-archives.xml"'||wwv_flow.LF||
'  procedure sitemap_archives;'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(583) := '-----------------------------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  public app page 1003 Ajax Callback p';
wwv_flow_imp.g_varchar2_table(584) := 'rocess "sitemap-tags.xml"'||wwv_flow.LF||
'  procedure sitemap_tags;'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(585) := '----------------------------------'||wwv_flow.LF||
'end "BLOG_XML";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package "BLOG_AI"'||wwv_flow.LF||
'authid ';
wwv_flow_imp.g_varchar2_table(586) := 'definer'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(587) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'--  DESCRIPTION'||wwv_flow.LF||
'--    ';
wwv_flow_imp.g_varchar2_table(588) := 'Procedures and functions for AI-related functionalities'||wwv_flow.LF||
'--'||wwv_flow.LF||
'--  CHANGE LOG'||wwv_flow.LF||
'--  ===================';
wwv_flow_imp.g_varchar2_table(589) := '========================================================='||wwv_flow.LF||
'--  DATE         MODIFIED BY    DESCRIPTI';
wwv_flow_imp.g_varchar2_table(590) := 'ON'||wwv_flow.LF||
'--  -----------  -------------  ------------------------------------------------'||wwv_flow.LF||
'--  15.08.2025';
wwv_flow_imp.g_varchar2_table(591) := '   Jari Laine     Created package.'||wwv_flow.LF||
'--  30.06.2025   Jari Laine     New function get_param_value'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(592) := '                              Changes to procedures:'||wwv_flow.LF||
'--                                - set_gen_ai';
wwv_flow_imp.g_varchar2_table(593) := ''||wwv_flow.LF||
'--                                - init_params'||wwv_flow.LF||
'--'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(594) := '-----------------------------------'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(595) := '-----------------'||wwv_flow.LF||
'  function get_param_value('||wwv_flow.LF||
'    p_param_name      in varchar2'||wwv_flow.LF||
'  ) return varcha';
wwv_flow_imp.g_varchar2_table(596) := 'r2;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure s';
wwv_flow_imp.g_varchar2_table(597) := 'et_lang_ai('||wwv_flow.LF||
'    p_compartment_id  in varchar2,'||wwv_flow.LF||
'    p_base_url        in varchar2,'||wwv_flow.LF||
'    p_build_sta';
wwv_flow_imp.g_varchar2_table(598) := 'tus    in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(599) := '------'||wwv_flow.LF||
'  procedure set_gen_ai('||wwv_flow.LF||
'    p_build_status    in varchar2,'||wwv_flow.LF||
'    p_api_key         in varcha';
wwv_flow_imp.g_varchar2_table(600) := 'r2,'||wwv_flow.LF||
'    p_base_url        in varchar2,'||wwv_flow.LF||
'    p_ai_model_name   in varchar2,'||wwv_flow.LF||
'    p_ai_http_headers i';
wwv_flow_imp.g_varchar2_table(601) := 'n varchar2,'||wwv_flow.LF||
'    p_ai_attributes   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(602) := '----------------------------------'||wwv_flow.LF||
'  procedure gen_ai_chat('||wwv_flow.LF||
'    p_post            in varchar2,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(603) := '  p_system_prompt   in varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(604) := '-------------------'||wwv_flow.LF||
'-- Called from:'||wwv_flow.LF||
'--  Public app page 1001 and admin app 62'||wwv_flow.LF||
'  procedure merge_s';
wwv_flow_imp.g_varchar2_table(605) := 'entiment('||wwv_flow.LF||
'    p_language        in varchar2,'||wwv_flow.LF||
'    p_documents       in clob'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(606) := '----------------------------------------------------------------'||wwv_flow.LF||
'  procedure get_lang_code('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(607) := 'documents       in clob,'||wwv_flow.LF||
'    p_lang_code       out nocopy varchar2'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(608) := '-------------------------------------------------------'||wwv_flow.LF||
'  procedure get_translation('||wwv_flow.LF||
'    p_documen';
wwv_flow_imp.g_varchar2_table(609) := 'ts       in clob,'||wwv_flow.LF||
'    p_translation     out nocopy clob'||wwv_flow.LF||
'  );'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(610) := '--------------------------------------------'||wwv_flow.LF||
'end "BLOG_AI";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(611) := '---------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_DYNAMIC_CONTENT'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(612) := '------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_dynamic_content as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.';
wwv_flow_imp.g_varchar2_table(613) := 'id                as id'||wwv_flow.LF||
'  ,t1.row_version       as row_version'||wwv_flow.LF||
'  ,t1.created_on        as created_';
wwv_flow_imp.g_varchar2_table(614) := 'on'||wwv_flow.LF||
'  ,lower(t1.created_by) as created_by'||wwv_flow.LF||
'  ,t1.changed_on        as changed_on'||wwv_flow.LF||
'  ,lower(t1.change';
wwv_flow_imp.g_varchar2_table(615) := 'd_by) as changed_by'||wwv_flow.LF||
'  ,t1.is_active         as is_active'||wwv_flow.LF||
'  ,t1.content_type      as content_type'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(616) := '  ,t1.display_seq       as display_seq'||wwv_flow.LF||
'  ,t1.show_changed_on   as show_changed_on'||wwv_flow.LF||
'  ,t1.content_de';
wwv_flow_imp.g_varchar2_table(617) := 'sc      as content_desc'||wwv_flow.LF||
'  ,t1.content_html      as content_html'||wwv_flow.LF||
'from blog_dynamic_content t1'||wwv_flow.LF||
'wher';
wwv_flow_imp.g_varchar2_table(618) := 'e 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_FI';
wwv_flow_imp.g_varchar2_table(619) := 'LES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_a';
wwv_flow_imp.g_varchar2_table(620) := 'll_files as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id                         as id'||wwv_flow.LF||
', t1.row_version                as row_v';
wwv_flow_imp.g_varchar2_table(621) := 'ersion'||wwv_flow.LF||
', t1.created_on                 as created_on'||wwv_flow.LF||
', lower(t1.created_by)          as created_by';
wwv_flow_imp.g_varchar2_table(622) := ''||wwv_flow.LF||
', t1.changed_on                 as changed_on'||wwv_flow.LF||
', lower(t1.changed_by)          as changed_by'||wwv_flow.LF||
', t1';
wwv_flow_imp.g_varchar2_table(623) := '.is_active                  as is_active'||wwv_flow.LF||
', t1.is_download                as is_download'||wwv_flow.LF||
', t1.file_';
wwv_flow_imp.g_varchar2_table(624) := 'path                  as file_path'||wwv_flow.LF||
', t1.file_dir                   as file_dir'||wwv_flow.LF||
', t1.file_name     ';
wwv_flow_imp.g_varchar2_table(625) := '             as file_name'||wwv_flow.LF||
', t1.mime_type                  as mime_type'||wwv_flow.LF||
', t1.blob_content          ';
wwv_flow_imp.g_varchar2_table(626) := '     as blob_content'||wwv_flow.LF||
', t1.file_size                  as file_size'||wwv_flow.LF||
', t1.file_charset               ';
wwv_flow_imp.g_varchar2_table(627) := 'as file_charset'||wwv_flow.LF||
', t1.file_desc                  as file_desc'||wwv_flow.LF||
', t1.notes                      as no';
wwv_flow_imp.g_varchar2_table(628) := 'tes'||wwv_flow.LF||
', t1.etag                       as etag'||wwv_flow.LF||
', t1.md5                        as md5'||wwv_flow.LF||
', t1.apex$row_';
wwv_flow_imp.g_varchar2_table(629) := 'sync_timestamp'||wwv_flow.LF||
', cast('||wwv_flow.LF||
'    t1.apex$row_sync_timestamp  as timestamp with local time zone'||wwv_flow.LF||
'  )     ';
wwv_flow_imp.g_varchar2_table(630) := '                        as sync_timestamp'||wwv_flow.LF||
', apex_string_util.to_display_filesize('||wwv_flow.LF||
'    p_size_in_by';
wwv_flow_imp.g_varchar2_table(631) := 'tes => t1.file_size'||wwv_flow.LF||
'  )                             as file_size_display'||wwv_flow.LF||
', dbms_lob.getlength('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(632) := '  lob_loc => coalesce( blob_content, empty_blob() )'||wwv_flow.LF||
'  )                             as local_size'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(633) := ', case lkp.object_storage'||wwv_flow.LF||
'    when ''INCLUDE'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      case when lkp.proxy_url is null'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(634) := '    then lkp.bucket_url'||wwv_flow.LF||
'        else lkp.proxy_url'||wwv_flow.LF||
'      end || t1.file_path'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      blog';
wwv_flow_imp.g_varchar2_table(635) := '_url.get_file('||wwv_flow.LF||
'        p_application => lkp.pub_app_id'||wwv_flow.LF||
'      , p_file_path   => t1.file_path'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(636) := '  )'||wwv_flow.LF||
'  end                           as file_url'||wwv_flow.LF||
'from blog_files t1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'      a';
wwv_flow_imp.g_varchar2_table(637) := 'pex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_application_id    => sys_context( ''APEX$SE';
wwv_flow_imp.g_varchar2_table(638) := 'SSION'', ''APP_ID'')'||wwv_flow.LF||
'      , p_build_option_name => ''BLOG_FEATURE_OCI_OBJECT_STORAGE'''||wwv_flow.LF||
'      ) as obje';
wwv_flow_imp.g_varchar2_table(639) := 'ct_storage'||wwv_flow.LF||
'    , blog_util.get_attribute_value('||wwv_flow.LF||
'        p_attribute_name    => ''G_OCI_OS_BUCKET_UR';
wwv_flow_imp.g_varchar2_table(640) := 'L'''||wwv_flow.LF||
'      ) as bucket_url'||wwv_flow.LF||
'    , blog_util.get_attribute_value('||wwv_flow.LF||
'        p_attribute_name    => ''G_O';
wwv_flow_imp.g_varchar2_table(641) := 'CI_OS_PROXY_URL'''||wwv_flow.LF||
'      ) as proxy_url'||wwv_flow.LF||
'    , blog_util.get_attribute_value('||wwv_flow.LF||
'        p_attribute_na';
wwv_flow_imp.g_varchar2_table(642) := 'me    => ''G_PUB_APP_ID'''||wwv_flow.LF||
'      ) as pub_app_id'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') lkp'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(643) := '----------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_LINKS'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(644) := '---------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_links as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id';
wwv_flow_imp.g_varchar2_table(645) := '                   as id'||wwv_flow.LF||
', t1.row_version          as row_version'||wwv_flow.LF||
', t1.created_on           as cre';
wwv_flow_imp.g_varchar2_table(646) := 'ated_on'||wwv_flow.LF||
', lower( t1.created_by )  as created_by'||wwv_flow.LF||
', t1.changed_on           as changed_on'||wwv_flow.LF||
', lower( ';
wwv_flow_imp.g_varchar2_table(647) := 't1.changed_by )  as changed_by'||wwv_flow.LF||
', t2.id                   as link_group_id'||wwv_flow.LF||
', t1.is_active          ';
wwv_flow_imp.g_varchar2_table(648) := '  as is_active'||wwv_flow.LF||
', t2.is_active            as link_group_is_active'||wwv_flow.LF||
', t1.display_seq          as disp';
wwv_flow_imp.g_varchar2_table(649) := 'lay_seq'||wwv_flow.LF||
', t2.display_seq          as link_group_display_seq'||wwv_flow.LF||
', t1.title                as title'||wwv_flow.LF||
', ';
wwv_flow_imp.g_varchar2_table(650) := 't2.title                as link_group_title'||wwv_flow.LF||
', t1.link_desc            as link_desc'||wwv_flow.LF||
', t1.notes     ';
wwv_flow_imp.g_varchar2_table(651) := '           as notes'||wwv_flow.LF||
', t1.link_url             as link_url'||wwv_flow.LF||
', case t2.is_active'||wwv_flow.LF||
'    when 1 then'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(652) := '    case t1.is_active'||wwv_flow.LF||
'        when 1'||wwv_flow.LF||
'        then ''ENABLED'''||wwv_flow.LF||
'        else ''DISABLED'''||wwv_flow.LF||
'        end';
wwv_flow_imp.g_varchar2_table(653) := ''||wwv_flow.LF||
'    else ''GROUP_DISABLED'''||wwv_flow.LF||
'  end                     as link_status_code'||wwv_flow.LF||
', t1.is_active'||wwv_flow.LF||
'  * t2.is';
wwv_flow_imp.g_varchar2_table(654) := '_active          as link_is_active'||wwv_flow.LF||
'from blog_links t1'||wwv_flow.LF||
'join blog_link_groups t2'||wwv_flow.LF||
'  on t1.link_group';
wwv_flow_imp.g_varchar2_table(655) := '_id = t2.id'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for V';
wwv_flow_imp.g_varchar2_table(656) := 'iew BLOG_V_ALL_LINK_GROUPS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or repl';
wwv_flow_imp.g_varchar2_table(657) := 'ace force view blog_v_all_link_groups as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id                  as id'||wwv_flow.LF||
'  ,t1.row_version';
wwv_flow_imp.g_varchar2_table(658) := '         as row_version'||wwv_flow.LF||
'  ,t1.created_on          as created_on'||wwv_flow.LF||
'  ,lower( t1.created_by ) as creat';
wwv_flow_imp.g_varchar2_table(659) := 'ed_by'||wwv_flow.LF||
'  ,t1.changed_on          as changed_on'||wwv_flow.LF||
'  ,lower (t1.changed_by ) as changed_by'||wwv_flow.LF||
'  ,t1.is_ac';
wwv_flow_imp.g_varchar2_table(660) := 'tive           as is_active'||wwv_flow.LF||
'  ,t1.display_seq         as display_seq'||wwv_flow.LF||
'  ,t1.title               as ';
wwv_flow_imp.g_varchar2_table(661) := 'title'||wwv_flow.LF||
'  ,t1.title_unique        as title_unique'||wwv_flow.LF||
'  ,t1.notes               as notes'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    sele';
wwv_flow_imp.g_varchar2_table(662) := 'ct'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_links lkp'||wwv_flow.LF||
'    where lkp.link_group_id = t1.id'||wwv_flow.LF||
'  )        ';
wwv_flow_imp.g_varchar2_table(663) := '               as link_count'||wwv_flow.LF||
'from blog_link_groups t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(664) := '----------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_POST_TAGS'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(665) := '-------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_post_tags as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id   ';
wwv_flow_imp.g_varchar2_table(666) := '                     as id'||wwv_flow.LF||
'  ,t1.row_version               as row_version'||wwv_flow.LF||
'  ,t1.created_on        ';
wwv_flow_imp.g_varchar2_table(667) := '        as created_on'||wwv_flow.LF||
'  ,lower(t1.created_by)         as created_by'||wwv_flow.LF||
'  ,t1.changed_on              ';
wwv_flow_imp.g_varchar2_table(668) := '  as changed_on'||wwv_flow.LF||
'  ,lower(t1.changed_by)         as changed_by'||wwv_flow.LF||
'  ,t1.is_active                 as i';
wwv_flow_imp.g_varchar2_table(669) := 's_active'||wwv_flow.LF||
'  ,t1.post_id                   as post_id'||wwv_flow.LF||
'  ,t1.tag_id                    as tag_id'||wwv_flow.LF||
'  ,';
wwv_flow_imp.g_varchar2_table(670) := 't1.display_seq               as display_seq'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select lkp.tag'||wwv_flow.LF||
'    from blog_tags lkp'||wwv_flow.LF||
'    w';
wwv_flow_imp.g_varchar2_table(671) := 'here 1 = 1'||wwv_flow.LF||
'    and lkp.id = t1.tag_id'||wwv_flow.LF||
'  )                             as tag'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select lkp';
wwv_flow_imp.g_varchar2_table(672) := '.is_active'||wwv_flow.LF||
'    from blog_tags lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and lkp.id = t1.tag_id'||wwv_flow.LF||
'  )                ';
wwv_flow_imp.g_varchar2_table(673) := '             as tag_is_active'||wwv_flow.LF||
'from blog_post_tags t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(674) := '---------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_TAGS'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(675) := '-------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_tags as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id               ';
wwv_flow_imp.g_varchar2_table(676) := '  as id'||wwv_flow.LF||
', t1.row_version        as row_version'||wwv_flow.LF||
', t1.created_on         as created_on'||wwv_flow.LF||
', lower(t1.c';
wwv_flow_imp.g_varchar2_table(677) := 'reated_by)  as created_by'||wwv_flow.LF||
', t1.changed_on         as changed_on'||wwv_flow.LF||
', lower(t1.changed_by)  as changed';
wwv_flow_imp.g_varchar2_table(678) := '_by'||wwv_flow.LF||
', t1.is_active          as is_active'||wwv_flow.LF||
', t1.tag                as tag'||wwv_flow.LF||
', t1.tag_unique         a';
wwv_flow_imp.g_varchar2_table(679) := 's tag_unique'||wwv_flow.LF||
', t1.notes              as notes'||wwv_flow.LF||
', case t1.is_active'||wwv_flow.LF||
'    when 1'||wwv_flow.LF||
'      then c.txt_en';
wwv_flow_imp.g_varchar2_table(680) := 'abled'||wwv_flow.LF||
'      else c.txt_disabled'||wwv_flow.LF||
'  end                   as tag_status_text'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select count(';
wwv_flow_imp.g_varchar2_table(681) := '1)'||wwv_flow.LF||
'    from blog_post_tags lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and lkp.tag_id = t1.id'||wwv_flow.LF||
'   )                  ';
wwv_flow_imp.g_varchar2_table(682) := '  as posts_count'||wwv_flow.LF||
', case'||wwv_flow.LF||
'    when exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_post_tags lkp'||wwv_flow.LF||
'      whe';
wwv_flow_imp.g_varchar2_table(683) := 're 1 = 1'||wwv_flow.LF||
'      and lkp.tag_id = t1.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    then ''U'''||wwv_flow.LF||
'    else ''UD'''||wwv_flow.LF||
'  end                   ';
wwv_flow_imp.g_varchar2_table(684) := 'as allowed_row_operation'||wwv_flow.LF||
'from blog_tags t1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'    apex_lang.get_message( ''BLOG';
wwv_flow_imp.g_varchar2_table(685) := '_TXT_ENABLED'' )   as txt_enabled'||wwv_flow.LF||
'  , apex_lang.get_message( ''BLOG_TXT_DISABLED'' )  as txt_disabled';
wwv_flow_imp.g_varchar2_table(686) := ''||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') c'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL';
wwv_flow_imp.g_varchar2_table(687) := ' for View BLOG_V_BLOGGERS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or repla';
wwv_flow_imp.g_varchar2_table(688) := 'ce force view blog_v_bloggers as'||wwv_flow.LF||
'select t1.id        as blogger_id'||wwv_flow.LF||
'  ,t1.display_seq   as display_';
wwv_flow_imp.g_varchar2_table(689) := 'seq'||wwv_flow.LF||
'  ,t1.blogger_name  as blogger_name'||wwv_flow.LF||
'  ,t1.blogger_desc  as blogger_desc'||wwv_flow.LF||
'from blog_bloggers t1';
wwv_flow_imp.g_varchar2_table(690) := ''||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and t1.show_desc = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(691) := '------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_DYNAMIC_CONTENT'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(692) := '-----------'||wwv_flow.LF||
'create or replace force view blog_v_dynamic_content as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id              a';
wwv_flow_imp.g_varchar2_table(693) := 's content_id'||wwv_flow.LF||
'  ,t1.content_type    as content_type'||wwv_flow.LF||
'  ,t1.changed_on      as changed_on'||wwv_flow.LF||
'  ,t1.disp';
wwv_flow_imp.g_varchar2_table(694) := 'lay_seq     as display_seq'||wwv_flow.LF||
'  ,t1.show_changed_on as show_changed_on'||wwv_flow.LF||
'  ,t1.content_desc    as conte';
wwv_flow_imp.g_varchar2_table(695) := 'nt_desc'||wwv_flow.LF||
'  ,t1.content_html    as content_html'||wwv_flow.LF||
'  ,blog_url.get_dynamic_page('||wwv_flow.LF||
'    p_content_id => t';
wwv_flow_imp.g_varchar2_table(696) := '1.id'||wwv_flow.LF||
'  )                   as content_url'||wwv_flow.LF||
'from blog_dynamic_content t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and t1.is_act';
wwv_flow_imp.g_varchar2_table(697) := 'ive = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Vi';
wwv_flow_imp.g_varchar2_table(698) := 'ew BLOG_V_FEATURES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace forc';
wwv_flow_imp.g_varchar2_table(699) := 'e view blog_v_features as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id                       as id'||wwv_flow.LF||
', v1.application_id         ';
wwv_flow_imp.g_varchar2_table(700) := '  as application_id'||wwv_flow.LF||
', v1.build_option_id          as build_option_id'||wwv_flow.LF||
', v1.last_updated_on         ';
wwv_flow_imp.g_varchar2_table(701) := ' as last_updated_on'||wwv_flow.LF||
', lower( v1.last_updated_by ) as last_updated_by'||wwv_flow.LF||
', t1.display_seq             ';
wwv_flow_imp.g_varchar2_table(702) := ' as display_seq'||wwv_flow.LF||
', t1.build_option_name        as build_option_name'||wwv_flow.LF||
', v1.build_option_status      a';
wwv_flow_imp.g_varchar2_table(703) := 's build_option_status'||wwv_flow.LF||
', t1.build_option_parent      as build_option_parent'||wwv_flow.LF||
', level                ';
wwv_flow_imp.g_varchar2_table(704) := '       as build_option_level'||wwv_flow.LF||
', case when connect_by_isleaf = 0'||wwv_flow.LF||
'    then ''Y'''||wwv_flow.LF||
'    else ''N'''||wwv_flow.LF||
'  end  ';
wwv_flow_imp.g_varchar2_table(705) := '                       as is_parent'||wwv_flow.LF||
', apex_lang.get_message('||wwv_flow.LF||
'    p_name => t1.build_option_name'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(706) := ' )                           as feature_desc'||wwv_flow.LF||
', regexp_replace('||wwv_flow.LF||
'    t1.build_option_name'||wwv_flow.LF||
'  , ''^(BL';
wwv_flow_imp.g_varchar2_table(707) := 'OG)'''||wwv_flow.LF||
'  , ''\1_HELP'''||wwv_flow.LF||
'  )                           as help_message'||wwv_flow.LF||
'-- HTML in query because IG remo';
wwv_flow_imp.g_varchar2_table(708) := 'ves HTML from column HTM expression in control break column'||wwv_flow.LF||
'-- Contrel break is soretd and attribut';
wwv_flow_imp.g_varchar2_table(709) := 'e data-sort-order gives correct sort order'||wwv_flow.LF||
', apex_string.format('||wwv_flow.LF||
'    p_message => ''<span data-sort';
wwv_flow_imp.g_varchar2_table(710) := '-order="%s" class="u-bold">%s</span>'''||wwv_flow.LF||
'  , p0 => lpad( min( t1.display_seq ) over( partition by t1.b';
wwv_flow_imp.g_varchar2_table(711) := 'uild_option_group ), 6, ''0'' )'||wwv_flow.LF||
'  , p1 =>'||wwv_flow.LF||
'      apex_lang.get_message('||wwv_flow.LF||
'        p_name => t1.build_o';
wwv_flow_imp.g_varchar2_table(712) := 'ption_group'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  )                           as feature_group_html'||wwv_flow.LF||
', t1.build_option_group  ';
wwv_flow_imp.g_varchar2_table(713) := '     as feature_group'||wwv_flow.LF||
'from blog_features t1'||wwv_flow.LF||
'join apex_application_build_options v1'||wwv_flow.LF||
'  on t1.build_';
wwv_flow_imp.g_varchar2_table(714) := 'option_name = v1.build_option_name'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and t1.build_option_group != ''INTERNAL'''||wwv_flow.LF||
'  and t1';
wwv_flow_imp.g_varchar2_table(715) := '.is_active = 1'||wwv_flow.LF||
'  and case'||wwv_flow.LF||
'    when t1.ref_build_option_name is null'||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    when apex_app';
wwv_flow_imp.g_varchar2_table(716) := 'lication_admin.get_build_option_status('||wwv_flow.LF||
'      p_application_id    => sys_context( ''APEX$SESSION'', ''';
wwv_flow_imp.g_varchar2_table(717) := 'APP_ID'' )'||wwv_flow.LF||
'    , p_build_option_name => t1.ref_build_option_name'||wwv_flow.LF||
'    ) = t1.ref_build_option_status';
wwv_flow_imp.g_varchar2_table(718) := ''||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    else 0'||wwv_flow.LF||
'  end = 1'||wwv_flow.LF||
'start with t1.build_option_parent is null'||wwv_flow.LF||
'connect by prior t1.';
wwv_flow_imp.g_varchar2_table(719) := 'build_option_name = t1.build_option_parent'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(720) := '-------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_FILES'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(721) := '--------'||wwv_flow.LF||
'create or replace force view blog_v_files as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id             as file_id'||wwv_flow.LF||
', t1';
wwv_flow_imp.g_varchar2_table(722) := '.row_version    as row_version'||wwv_flow.LF||
', t1.created_on     as created_on'||wwv_flow.LF||
', t1.changed_on     as changed_on';
wwv_flow_imp.g_varchar2_table(723) := ''||wwv_flow.LF||
', t1.is_download    as is_download'||wwv_flow.LF||
', t1.file_name      as file_name'||wwv_flow.LF||
', t1.file_path      as file_';
wwv_flow_imp.g_varchar2_table(724) := 'path'||wwv_flow.LF||
', t1.mime_type      as mime_type'||wwv_flow.LF||
', t1.blob_content   as blob_content'||wwv_flow.LF||
', apex_string_util.to_d';
wwv_flow_imp.g_varchar2_table(725) := 'isplay_filesize('||wwv_flow.LF||
'    p_size_in_bytes => t1.file_size'||wwv_flow.LF||
'  )                 as file_size'||wwv_flow.LF||
', t1.file_c';
wwv_flow_imp.g_varchar2_table(726) := 'harset   as file_charset'||wwv_flow.LF||
', t1.file_desc      as file_desc'||wwv_flow.LF||
', lkp.object_storage'||wwv_flow.LF||
', case lkp.object_';
wwv_flow_imp.g_varchar2_table(727) := 'storage'||wwv_flow.LF||
'    when ''INCLUDE'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      case when lkp.proxy_url is null'||wwv_flow.LF||
'        then lkp.bucke';
wwv_flow_imp.g_varchar2_table(728) := 't_url || t1.file_path'||wwv_flow.LF||
'        else lkp.proxy_url  || t1.file_path'||wwv_flow.LF||
'      end'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      blog_';
wwv_flow_imp.g_varchar2_table(729) := 'url.get_file('||wwv_flow.LF||
'        p_file_path => t1.file_path'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  end             as file_url'||wwv_flow.LF||
'from blo';
wwv_flow_imp.g_varchar2_table(730) := 'g_files t1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'      apex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_';
wwv_flow_imp.g_varchar2_table(731) := 'application_id    => sys_context( ''APEX$SESSION'', ''APP_ID'')'||wwv_flow.LF||
'      , p_build_option_name => ''BLOG_FE';
wwv_flow_imp.g_varchar2_table(732) := 'ATURE_OCI_OBJECT_STORAGE'''||wwv_flow.LF||
'    )  as object_storage'||wwv_flow.LF||
'    , blog_util.get_attribute_value('||wwv_flow.LF||
'        p';
wwv_flow_imp.g_varchar2_table(733) := '_attribute_name => ''G_OCI_OS_BUCKET_URL'''||wwv_flow.LF||
'      ) as bucket_url'||wwv_flow.LF||
'    , blog_util.get_attribute_value';
wwv_flow_imp.g_varchar2_table(734) := '('||wwv_flow.LF||
'        p_attribute_name => ''G_OCI_OS_PROXY_URL'''||wwv_flow.LF||
'      ) as proxy_url'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') lkp'||wwv_flow.LF||
'where';
wwv_flow_imp.g_varchar2_table(735) := ' 1 = 1'||wwv_flow.LF||
'and t1.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(736) := '-----'||wwv_flow.LF||
'--  DDL for View BLOG_V_INIT_ITEMS'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(737) := ''||wwv_flow.LF||
'create or replace force view blog_v_init_items as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  i.application_id  as application_id'||wwv_flow.LF||
',';
wwv_flow_imp.g_varchar2_table(738) := ' i.item_name       as item_name'||wwv_flow.LF||
', s.attribute_value as attribute_value'||wwv_flow.LF||
', v( i.item_name )  as sess';
wwv_flow_imp.g_varchar2_table(739) := 'ion_value'||wwv_flow.LF||
'from blog_init_items i'||wwv_flow.LF||
'join blog_settings s'||wwv_flow.LF||
'  on i.item_name = s.attribute_name'||wwv_flow.LF||
'where ';
wwv_flow_imp.g_varchar2_table(740) := '1 = 1'||wwv_flow.LF||
'and i.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(741) := '---'||wwv_flow.LF||
'--  DDL for View BLOG_V_LINKS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create';
wwv_flow_imp.g_varchar2_table(742) := ' or replace force view blog_v_links as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id             as link_id'||wwv_flow.LF||
', t2.id             ';
wwv_flow_imp.g_varchar2_table(743) := 'as group_id'||wwv_flow.LF||
', t2.title          as group_title'||wwv_flow.LF||
', t2.display_seq    as group_display_seq'||wwv_flow.LF||
', t1.disp';
wwv_flow_imp.g_varchar2_table(744) := 'lay_seq    as display_seq'||wwv_flow.LF||
', t1.title          as link_title'||wwv_flow.LF||
', t1.link_desc      as link_desc'||wwv_flow.LF||
', t1';
wwv_flow_imp.g_varchar2_table(745) := '.link_url       as link_url'||wwv_flow.LF||
', t1.external_link'||wwv_flow.LF||
'  + t1.target_blank as link_attr_code'||wwv_flow.LF||
', case t1.ex';
wwv_flow_imp.g_varchar2_table(746) := 'ternal_link + t1.target_blank'||wwv_flow.LF||
'    when 2'||wwv_flow.LF||
'    then ''target="_blank" rel="external"'''||wwv_flow.LF||
'    when 1'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(747) := '  then'||wwv_flow.LF||
'      case t1.external_link'||wwv_flow.LF||
'      when 1'||wwv_flow.LF||
'      then ''rel="external"'''||wwv_flow.LF||
'      else ''target="';
wwv_flow_imp.g_varchar2_table(748) := '_blank"'''||wwv_flow.LF||
'    end'||wwv_flow.LF||
'  end as link_attr'||wwv_flow.LF||
'from blog_links t1'||wwv_flow.LF||
'join blog_link_groups t2'||wwv_flow.LF||
'  on t1.link_gr';
wwv_flow_imp.g_varchar2_table(749) := 'oup_id = t2.id'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and t1.is_active = 1'||wwv_flow.LF||
'  and t2.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(750) := '----------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_LOV'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(751) := '---------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_lov as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.lo';
wwv_flow_imp.g_varchar2_table(752) := 'v_name                                 as lov_name'||wwv_flow.LF||
', t1.display_seq                              as';
wwv_flow_imp.g_varchar2_table(753) := ' display_seq'||wwv_flow.LF||
', t1.return_value                             as return_value'||wwv_flow.LF||
', t1.display_message   ';
wwv_flow_imp.g_varchar2_table(754) := '                       as display_message'||wwv_flow.LF||
', apex_lang.get_message( t1.display_message ) as display_';
wwv_flow_imp.g_varchar2_table(755) := 'value'||wwv_flow.LF||
'from blog_list_of_values t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and t1.is_active = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(756) := '----------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_POSTS_TAGS'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(757) := '----------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_post_tags as'||wwv_flow.LF||
'with q1 ';
wwv_flow_imp.g_varchar2_table(758) := 'as('||wwv_flow.LF||
'  select --+ inline'||wwv_flow.LF||
'     t2.post_id     as post_id'||wwv_flow.LF||
'    ,t2.tag_id      as tag_id'||wwv_flow.LF||
'    ,t2.dis';
wwv_flow_imp.g_varchar2_table(759) := 'play_seq as display_seq'||wwv_flow.LF||
'    ,t1.tag         as tag'||wwv_flow.LF||
'    ,greatest('||wwv_flow.LF||
'       t1.changed_on'||wwv_flow.LF||
'      ,t2';
wwv_flow_imp.g_varchar2_table(760) := '.changed_on'||wwv_flow.LF||
'    )               as changed_on'||wwv_flow.LF||
'  -- Generate tag URL'||wwv_flow.LF||
'    ,blog_url.get_tag('||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(761) := ' p_tag_id => t1.id'||wwv_flow.LF||
'    )               as tag_url'||wwv_flow.LF||
'  -- Generate HTML for tags used in APEX reports';
wwv_flow_imp.g_varchar2_table(762) := ''||wwv_flow.LF||
'    ,xmlelement( "span"'||wwv_flow.LF||
'      ,xmlattributes('||wwv_flow.LF||
'        ''t-Icon fa fa-tag''  as "class"'||wwv_flow.LF||
'        ,''';
wwv_flow_imp.g_varchar2_table(763) := 'true''             as "aria-hidden"'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    )               as tag_icon'||wwv_flow.LF||
'    ,xmlelement( "span';
wwv_flow_imp.g_varchar2_table(764) := '"'||wwv_flow.LF||
'      ,xmlattributes('||wwv_flow.LF||
'        ''t-Button-label''    as "class"'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      ,t1.tag'||wwv_flow.LF||
'    )     ';
wwv_flow_imp.g_varchar2_table(765) := '          as tag_label'||wwv_flow.LF||
'  -- Tag CSS class'||wwv_flow.LF||
'    ,''t-Button t-Button--icon t-Button--large t-Button--';
wwv_flow_imp.g_varchar2_table(766) := 'noUI t-Button--iconLeft'' as tag_class'||wwv_flow.LF||
'  from blog_tags t1'||wwv_flow.LF||
'  join blog_post_tags t2 on t1.id = t2.t';
wwv_flow_imp.g_varchar2_table(767) := 'ag_id'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
'    and t1.is_active = 1'||wwv_flow.LF||
'    and t2.is_active = 1'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   q1.post_id  ';
wwv_flow_imp.g_varchar2_table(768) := '                       as post_id'||wwv_flow.LF||
'  ,q1.tag_id                          as tag_id'||wwv_flow.LF||
'  ,q1.display_se';
wwv_flow_imp.g_varchar2_table(769) := 'q                     as display_seq'||wwv_flow.LF||
'  ,q1.tag                             as tag'||wwv_flow.LF||
'  ,q1.changed_on';
wwv_flow_imp.g_varchar2_table(770) := '                      as changed_on'||wwv_flow.LF||
'  ,q1.tag_url                         as tag_url'||wwv_flow.LF||
'-- Generate H';
wwv_flow_imp.g_varchar2_table(771) := 'TML for tags used in APEX reports'||wwv_flow.LF||
'  ,xmlelement( "a"'||wwv_flow.LF||
'    ,xmlattributes('||wwv_flow.LF||
'      q1.tag_url        ';
wwv_flow_imp.g_varchar2_table(772) := '    as "href"'||wwv_flow.LF||
'      ,''blog-search--tags''  as "class"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,q1.tag'||wwv_flow.LF||
'  )                      ';
wwv_flow_imp.g_varchar2_table(773) := '             as tag_html1'||wwv_flow.LF||
'  ,xmlelement( "a"'||wwv_flow.LF||
'    ,xmlattributes('||wwv_flow.LF||
'       q1.tag_url       as "href';
wwv_flow_imp.g_varchar2_table(774) := '"'||wwv_flow.LF||
'      ,q1.tag_class     as "class"'||wwv_flow.LF||
'      ,''tag''            as "rel"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,q1.tag_icon'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(775) := '  ,q1.tag_label'||wwv_flow.LF||
'  )                                   as tag_html2'||wwv_flow.LF||
'  ,xmlelement( "span"'||wwv_flow.LF||
'    ,xml';
wwv_flow_imp.g_varchar2_table(776) := 'attributes('||wwv_flow.LF||
'      q1.tag_class      as "class"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,q1.tag_icon'||wwv_flow.LF||
'    ,q1.tag_label'||wwv_flow.LF||
'  )    ';
wwv_flow_imp.g_varchar2_table(777) := '                                as tag_html3'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(778) := '------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_VERSION'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(779) := '---------------------'||wwv_flow.LF||
'create or replace force view blog_v_version as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  attribute_value    ';
wwv_flow_imp.g_varchar2_table(780) := '                         as application_version'||wwv_flow.LF||
'  ,to_number( substr( attribute_value, -8 ) ) as ap';
wwv_flow_imp.g_varchar2_table(781) := 'plication_date'||wwv_flow.LF||
'from blog_settings'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'and attribute_name = ''G_APP_VERSION'''||wwv_flow.LF||
'with read onl';
wwv_flow_imp.g_varchar2_table(782) := 'y'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_CATEGORI';
wwv_flow_imp.g_varchar2_table(783) := 'ES'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_al';
wwv_flow_imp.g_varchar2_table(784) := 'l_categories as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id                as id'||wwv_flow.LF||
'  ,t1.row_version       as row_version'||wwv_flow.LF||
'  ,t';
wwv_flow_imp.g_varchar2_table(785) := '1.created_on        as created_on'||wwv_flow.LF||
'  ,lower(t1.created_by) as created_by'||wwv_flow.LF||
'  ,t1.changed_on        as';
wwv_flow_imp.g_varchar2_table(786) := ' changed_on'||wwv_flow.LF||
'  ,lower(t1.changed_by) as changed_by'||wwv_flow.LF||
'  ,t1.is_active         as is_active'||wwv_flow.LF||
'  ,t1.disp';
wwv_flow_imp.g_varchar2_table(787) := 'lay_seq       as display_seq'||wwv_flow.LF||
'  ,t1.title             as title'||wwv_flow.LF||
'  ,t1.title_unique      as title_uni';
wwv_flow_imp.g_varchar2_table(788) := 'que'||wwv_flow.LF||
'  ,t1.notes             as notes'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select lkp.display_value'||wwv_flow.LF||
'    from blog_v_lov lkp'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(789) := '    where lkp.lov_name = ''IS_ACTIVE'''||wwv_flow.LF||
'      and to_number( lkp.return_value ) = t1.is_active'||wwv_flow.LF||
'  )   ';
wwv_flow_imp.g_varchar2_table(790) := '                  as category_status_text'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select count(1)'||wwv_flow.LF||
'    from blog_posts lkp'||wwv_flow.LF||
'    w';
wwv_flow_imp.g_varchar2_table(791) := 'here lkp.category_id = t1.id'||wwv_flow.LF||
'   )                    as posts_count'||wwv_flow.LF||
'  ,case'||wwv_flow.LF||
'    when exists('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(792) := '   select 1'||wwv_flow.LF||
'      from blog_posts lkp'||wwv_flow.LF||
'      where lkp.category_id = t1.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    then ''U'''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(793) := '  else ''UD'''||wwv_flow.LF||
'  end                   as allowed_row_operation'||wwv_flow.LF||
'from blog_categories t1'||wwv_flow.LF||
'where 1 = 1';
wwv_flow_imp.g_varchar2_table(794) := ''||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_COMMENTS'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(795) := '--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_co';
wwv_flow_imp.g_varchar2_table(796) := 'mments as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'  select --+ inline'||wwv_flow.LF||
'    t1.id'||wwv_flow.LF||
'  , t1.row_version'||wwv_flow.LF||
'  , t1.created_on'||wwv_flow.LF||
'  , t';
wwv_flow_imp.g_varchar2_table(797) := '1.created_by'||wwv_flow.LF||
'  , t1.changed_on'||wwv_flow.LF||
'  , t1.changed_by'||wwv_flow.LF||
'  , t1.is_active'||wwv_flow.LF||
'  , t1.post_id'||wwv_flow.LF||
'  , t1.parent_';
wwv_flow_imp.g_varchar2_table(798) := 'id'||wwv_flow.LF||
'  , t1.body_html'||wwv_flow.LF||
'  , t1.comment_preview'||wwv_flow.LF||
'  , t1.comment_by'||wwv_flow.LF||
'  , t1.ctx_search'||wwv_flow.LF||
'  , t1.rowid as ';
wwv_flow_imp.g_varchar2_table(799) := 'ctx_rid'||wwv_flow.LF||
'  , t2.sentiment_json'||wwv_flow.LF||
'  , t2.sentiment_json.documentSentiment as sentiment'||wwv_flow.LF||
'  , t2.sentime';
wwv_flow_imp.g_varchar2_table(800) := 'nt_json.documentScores.Positive.number()  * 100 as positive_pct'||wwv_flow.LF||
'  , t2.sentiment_json.documentScore';
wwv_flow_imp.g_varchar2_table(801) := 's.Neutral.number()   * 100 as neutral_pct'||wwv_flow.LF||
'  , t2.sentiment_json.documentScores.Negative.number()  *';
wwv_flow_imp.g_varchar2_table(802) := ' 100 as negative_pct'||wwv_flow.LF||
'  , t2.sentiment_json.documentScores.Mixed.number()     * 100 as mixed_pct'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(803) := ', case'||wwv_flow.LF||
'      when ('||wwv_flow.LF||
'        select count(1)'||wwv_flow.LF||
'        from blog_comment_flags f11'||wwv_flow.LF||
'        where f1';
wwv_flow_imp.g_varchar2_table(804) := '1.flag = ''MODERATE'''||wwv_flow.LF||
'          and f11.comment_id = t1.id'||wwv_flow.LF||
'      ) > 0'||wwv_flow.LF||
'        then ''MODERATE'''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(805) := '   when t1.is_active = 1'||wwv_flow.LF||
'        then ''ENABLED'''||wwv_flow.LF||
'        else ''DISABLED'''||wwv_flow.LF||
'    end as comment_status';
wwv_flow_imp.g_varchar2_table(806) := '_code'||wwv_flow.LF||
'  , case'||wwv_flow.LF||
'      when ('||wwv_flow.LF||
'        select count(1)'||wwv_flow.LF||
'        from blog_comment_flags f12'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(807) := ' where f12.flag = ''NEW'''||wwv_flow.LF||
'          and f12.comment_id = t1.id'||wwv_flow.LF||
'      ) > 0'||wwv_flow.LF||
'        then ''NEW'''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(808) := '  when ('||wwv_flow.LF||
'        select count(1)'||wwv_flow.LF||
'        from blog_comment_flags f13'||wwv_flow.LF||
'        where f13.flag = ''UN';
wwv_flow_imp.g_varchar2_table(809) := 'READ'''||wwv_flow.LF||
'          and f13.comment_id = t1.id'||wwv_flow.LF||
'      ) > 0'||wwv_flow.LF||
'        then ''UNREAD'''||wwv_flow.LF||
'      when t1.paren';
wwv_flow_imp.g_varchar2_table(810) := 't_id is not null'||wwv_flow.LF||
'        then ''REPLY'''||wwv_flow.LF||
'        else ''READ'''||wwv_flow.LF||
'    end as comment_flag_code'||wwv_flow.LF||
'  from bl';
wwv_flow_imp.g_varchar2_table(811) := 'og_comments t1'||wwv_flow.LF||
'  left join blog_comment_sentiments t2 on t1.id = t2.comment_id'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  q1.id ';
wwv_flow_imp.g_varchar2_table(812) := '                  as id'||wwv_flow.LF||
', q1.row_version          as row_version'||wwv_flow.LF||
', q1.created_on           as crea';
wwv_flow_imp.g_varchar2_table(813) := 'ted_on'||wwv_flow.LF||
', lower( q1.created_by )  as created_by'||wwv_flow.LF||
', q1.changed_on           as changed_on'||wwv_flow.LF||
', lower( q';
wwv_flow_imp.g_varchar2_table(814) := '1.changed_by )  as changed_by'||wwv_flow.LF||
', q1.is_active            as is_active'||wwv_flow.LF||
', q1.post_id              as ';
wwv_flow_imp.g_varchar2_table(815) := 'post_id'||wwv_flow.LF||
', q1.parent_id            as parent_id'||wwv_flow.LF||
', q1.body_html            as body_html'||wwv_flow.LF||
', q1.commen';
wwv_flow_imp.g_varchar2_table(816) := 't_preview      as comment_preview'||wwv_flow.LF||
', q1.comment_by           as comment_by'||wwv_flow.LF||
', q1.ctx_search         ';
wwv_flow_imp.g_varchar2_table(817) := '  as ctx_search'||wwv_flow.LF||
', q1.ctx_rid              as ctx_rid'||wwv_flow.LF||
', q1.comment_status_code  as comment_status_c';
wwv_flow_imp.g_varchar2_table(818) := 'ode'||wwv_flow.LF||
', q1.comment_flag_code    as comment_flag_code'||wwv_flow.LF||
', q1.sentiment_json       as sentiment_json'||wwv_flow.LF||
', ';
wwv_flow_imp.g_varchar2_table(819) := 'q1.sentiment            as sentiment'||wwv_flow.LF||
', q1.positive_pct         as sentiment_positive_pct'||wwv_flow.LF||
', q1.neut';
wwv_flow_imp.g_varchar2_table(820) := 'ral_pct          as sentiment_neutral_pct'||wwv_flow.LF||
', q1.negative_pct         as sentiment_negative_pct'||wwv_flow.LF||
', q1';
wwv_flow_imp.g_varchar2_table(821) := '.mixed_pct            as sentiment_mixed_pct'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select lkp.title'||wwv_flow.LF||
'    from blog_posts lkp'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(822) := '  where 1 = 1'||wwv_flow.LF||
'      and lkp.id = q1.post_id'||wwv_flow.LF||
'  )                       as post_title'||wwv_flow.LF||
', case'||wwv_flow.LF||
'    w';
wwv_flow_imp.g_varchar2_table(823) := 'hen q1.comment_flag_code in( ''NEW'', ''UNREAD'' )'||wwv_flow.LF||
'      then ''true'''||wwv_flow.LF||
'      else ''false'''||wwv_flow.LF||
'  end        ';
wwv_flow_imp.g_varchar2_table(824) := '             as data_unread'||wwv_flow.LF||
'-- lov return value fetch in view query because IR detail view'||wwv_flow.LF||
', ('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(825) := '  select'||wwv_flow.LF||
'      lov1.display_value'||wwv_flow.LF||
'    from blog_v_lov lov1'||wwv_flow.LF||
'    where lov1.lov_name = ''COMMENT_STA';
wwv_flow_imp.g_varchar2_table(826) := 'TUS'''||wwv_flow.LF||
'      and lov1.return_value = q1.comment_status_code'||wwv_flow.LF||
'  )                       as comment_sta';
wwv_flow_imp.g_varchar2_table(827) := 'tus_text'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      lov2.display_value'||wwv_flow.LF||
'    from blog_v_lov lov2'||wwv_flow.LF||
'    where lov2.lov_na';
wwv_flow_imp.g_varchar2_table(828) := 'me = ''COMMENT_FLAG'''||wwv_flow.LF||
'      and lov2.return_value = q1.comment_flag_code'||wwv_flow.LF||
'  )                       a';
wwv_flow_imp.g_varchar2_table(829) := 's comment_flag_text'||wwv_flow.LF||
'-- class names in view query for reusability'||wwv_flow.LF||
', case q1.comment_status_code'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(830) := '  when ''MODERATE'''||wwv_flow.LF||
'      then ''fa-exclamation-circle u-warning-text'''||wwv_flow.LF||
'    when ''ENABLED'''||wwv_flow.LF||
'      then';
wwv_flow_imp.g_varchar2_table(831) := ' ''fa-check-circle u-success-text'''||wwv_flow.LF||
'      else ''fa-minus-circle u-danger-text'''||wwv_flow.LF||
'  end                ';
wwv_flow_imp.g_varchar2_table(832) := '     as comment_status_icon'||wwv_flow.LF||
', case q1.comment_flag_code'||wwv_flow.LF||
'    when ''REPLY'''||wwv_flow.LF||
'      then ''fa-send-o'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(833) := '    when ''NEW'''||wwv_flow.LF||
'      then ''fa-envelope-arrow-down'''||wwv_flow.LF||
'    when ''UNREAD'''||wwv_flow.LF||
'      then ''fa-envelope-o'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(834) := '      else ''fa-envelope-open-o'''||wwv_flow.LF||
'  end                     as comment_flag_icon'||wwv_flow.LF||
', case q1.sentiment';
wwv_flow_imp.g_varchar2_table(835) := ''||wwv_flow.LF||
'    when ''Mixed'''||wwv_flow.LF||
'      then ''fa-emoji-astonished u-info-text'''||wwv_flow.LF||
'    when ''Negative'''||wwv_flow.LF||
'      then ''f';
wwv_flow_imp.g_varchar2_table(836) := 'a-emoji-angry u-danger-text'''||wwv_flow.LF||
'    when ''Neutral'''||wwv_flow.LF||
'      then ''fa-emoji-neutral u-normal-text'''||wwv_flow.LF||
'    w';
wwv_flow_imp.g_varchar2_table(837) := 'hen ''Positive'''||wwv_flow.LF||
'      then ''fa-emoji-pleased u-success-text'''||wwv_flow.LF||
'      else ''fa-no-icon'''||wwv_flow.LF||
'  end        ';
wwv_flow_imp.g_varchar2_table(838) := '             as sentiment_icon'||wwv_flow.LF||
', xmlserialize( content'||wwv_flow.LF||
'    xmlforest('||wwv_flow.LF||
'      q1.comment_by as "com';
wwv_flow_imp.g_varchar2_table(839) := 'mented_by"'||wwv_flow.LF||
'    , apex_escape.striphtml('||wwv_flow.LF||
'        p_string => q1.body_html'||wwv_flow.LF||
'      )             as "';
wwv_flow_imp.g_varchar2_table(840) := 'comment"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as ctx_datastore'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(841) := '------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_ALL_POSTS'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(842) := '-----------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_all_posts as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(843) := '  select --+ inline'||wwv_flow.LF||
'     t1.id              as id'||wwv_flow.LF||
'    ,t1.category_id     as category_id'||wwv_flow.LF||
'    ,t1.';
wwv_flow_imp.g_varchar2_table(844) := 'blogger_id      as blogger_id'||wwv_flow.LF||
'    ,t1.row_version     as row_version'||wwv_flow.LF||
'    ,t1.created_on      as cr';
wwv_flow_imp.g_varchar2_table(845) := 'eated_on'||wwv_flow.LF||
'    ,t1.created_by      as created_by'||wwv_flow.LF||
'    ,t1.changed_on      as changed_on'||wwv_flow.LF||
'    ,t1.chan';
wwv_flow_imp.g_varchar2_table(846) := 'ged_by      as changed_by'||wwv_flow.LF||
'    ,t3.blogger_name    as blogger_name'||wwv_flow.LF||
'    ,t3.email           as blogg';
wwv_flow_imp.g_varchar2_table(847) := 'er_email'||wwv_flow.LF||
'    ,t2.title           as category_title'||wwv_flow.LF||
'    ,t1.title           as title'||wwv_flow.LF||
'    ,t1.post_';
wwv_flow_imp.g_varchar2_table(848) := 'desc       as post_desc'||wwv_flow.LF||
'    ,t1.first_paragraph as first_paragraph'||wwv_flow.LF||
'    ,t1.body_html       as body';
wwv_flow_imp.g_varchar2_table(849) := '_html'||wwv_flow.LF||
'    ,t1.body_length     as body_length'||wwv_flow.LF||
'    ,t1.published_on    as published_on'||wwv_flow.LF||
'    ,t1.note';
wwv_flow_imp.g_varchar2_table(850) := 's           as notes'||wwv_flow.LF||
'    ,t1.ctx_search      as ctx_search'||wwv_flow.LF||
'    ,t1.rowid           as ctx_rid'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(851) := ' ,case t1.is_active * t2.is_active * t3.is_active'||wwv_flow.LF||
'      when 1'||wwv_flow.LF||
'      then t1.published_on'||wwv_flow.LF||
'     en';
wwv_flow_imp.g_varchar2_table(852) := 'd                as published_display'||wwv_flow.LF||
'    ,case'||wwv_flow.LF||
'      when t3.is_active = 0'||wwv_flow.LF||
'        then ''BLOGGER';
wwv_flow_imp.g_varchar2_table(853) := '_DISABLED'''||wwv_flow.LF||
'      when t2.is_active = 0'||wwv_flow.LF||
'        then ''CATEGORY_DISABLED'''||wwv_flow.LF||
'      when t1.is_active =';
wwv_flow_imp.g_varchar2_table(854) := ' 0'||wwv_flow.LF||
'        then ''DRAFT'''||wwv_flow.LF||
'      when t1.published_on > localtimestamp'||wwv_flow.LF||
'        then ''SCHEDULED'''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(855) := '     else ''PUBLISHED'''||wwv_flow.LF||
'    end                 as post_status_code'||wwv_flow.LF||
'  from blog_posts t1'||wwv_flow.LF||
'  join blo';
wwv_flow_imp.g_varchar2_table(856) := 'g_categories t2'||wwv_flow.LF||
'    on t1.category_id = t2.id'||wwv_flow.LF||
'  join blog_bloggers t3'||wwv_flow.LF||
'    on t1.blogger_id = t3.i';
wwv_flow_imp.g_varchar2_table(857) := 'd'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   q1.id                  as id'||wwv_flow.LF||
'  ,q1.category_id         as category_';
wwv_flow_imp.g_varchar2_table(858) := 'id'||wwv_flow.LF||
'  ,q1.blogger_id          as blogger_id'||wwv_flow.LF||
'  ,q1.row_version         as row_version'||wwv_flow.LF||
'  ,q1.created';
wwv_flow_imp.g_varchar2_table(859) := '_on          as created_on'||wwv_flow.LF||
'  ,lower( q1.created_by ) as created_by'||wwv_flow.LF||
'  ,q1.changed_on          as ch';
wwv_flow_imp.g_varchar2_table(860) := 'anged_on'||wwv_flow.LF||
'  ,lower( q1.changed_by ) as changed_by'||wwv_flow.LF||
'  ,q1.blogger_name        as blogger_name'||wwv_flow.LF||
'  ,q1.';
wwv_flow_imp.g_varchar2_table(861) := 'blogger_email       as blogger_email'||wwv_flow.LF||
'  ,q1.category_title      as category_title'||wwv_flow.LF||
'  ,q1.title      ';
wwv_flow_imp.g_varchar2_table(862) := '         as title'||wwv_flow.LF||
'  ,q1.post_desc           as post_desc'||wwv_flow.LF||
'  ,q1.first_paragraph     as first_paragr';
wwv_flow_imp.g_varchar2_table(863) := 'aph'||wwv_flow.LF||
'  ,q1.body_html           as body_html'||wwv_flow.LF||
'  ,q1.body_length         as body_length'||wwv_flow.LF||
'  ,q1.publish';
wwv_flow_imp.g_varchar2_table(864) := 'ed_on        as published_on'||wwv_flow.LF||
'  ,q1.notes               as notes'||wwv_flow.LF||
'  ,q1.published_display   as publi';
wwv_flow_imp.g_varchar2_table(865) := 'shed_display'||wwv_flow.LF||
'  ,q1.post_status_code    as post_status_code'||wwv_flow.LF||
'  ,q1.ctx_search          as ctx_search';
wwv_flow_imp.g_varchar2_table(866) := ''||wwv_flow.LF||
'  ,q1.ctx_rid             as ctx_rid'||wwv_flow.LF||
'  ,case q1.post_status_code'||wwv_flow.LF||
'    when ''BLOGGER_DISABLED'' the';
wwv_flow_imp.g_varchar2_table(867) := 'n ''fa-stop-circle u-danger-text'''||wwv_flow.LF||
'    when ''CATEGORY_DISABLED''then ''fa-minus-circle u-danger-text'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(868) := '    when ''DRAFT''            then ''fa-pause-circle u-warning-text'''||wwv_flow.LF||
'    when ''SCHEDULED''        then ';
wwv_flow_imp.g_varchar2_table(869) := '''fa-clock-o u-info-text'''||wwv_flow.LF||
'    when ''PUBLISHED''        then ''fa-check-circle u-success-text'''||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(870) := '                     else ''fa-question-circle'''||wwv_flow.LF||
'  end                     as post_status_icon'||wwv_flow.LF||
'-- Wo';
wwv_flow_imp.g_varchar2_table(871) := 'rkaround for IR detail view'||wwv_flow.LF||
'  ,to_char('||wwv_flow.LF||
'     q1.published_on'||wwv_flow.LF||
'    ,('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        blog_u';
wwv_flow_imp.g_varchar2_table(872) := 'til.get_attribute_value( ''P0_BLOG_POST_DATE_FORMAT'' )'||wwv_flow.LF||
'       from dual'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                 ';
wwv_flow_imp.g_varchar2_table(873) := '      as detail_view_published'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'     select'||wwv_flow.LF||
'      listagg( tags.tag_id, '':'' )  within group( ';
wwv_flow_imp.g_varchar2_table(874) := 'order by tags.display_seq ) as tag_ids'||wwv_flow.LF||
'     from blog_v_all_post_tags tags'||wwv_flow.LF||
'     where 1 = 1'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(875) := 'and tags.post_id = q1.id'||wwv_flow.LF||
'   )                      as tag_id'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      listagg( tags';
wwv_flow_imp.g_varchar2_table(876) := '.tag, '', '' )  within group( order by tags.display_seq ) as tags'||wwv_flow.LF||
'    from blog_v_all_post_tags tags';
wwv_flow_imp.g_varchar2_table(877) := ''||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and tags.post_id = q1.id'||wwv_flow.LF||
'    and tags.is_active * tags.tag_is_active = 1'||wwv_flow.LF||
'  )';
wwv_flow_imp.g_varchar2_table(878) := '                       as visible_tags'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      listagg( tags.tag, '', '' )  within gr';
wwv_flow_imp.g_varchar2_table(879) := 'oup( order by tags.display_seq ) as tags'||wwv_flow.LF||
'    from blog_v_all_post_tags tags'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    a';
wwv_flow_imp.g_varchar2_table(880) := 'nd tags.post_id = q1.id'||wwv_flow.LF||
'    and tags.is_active * tags.tag_is_active = 0'||wwv_flow.LF||
'  )                       ';
wwv_flow_imp.g_varchar2_table(881) := 'as hidden_tags'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1';
wwv_flow_imp.g_varchar2_table(882) := ''||wwv_flow.LF||
'    and co.post_id  = q1.id'||wwv_flow.LF||
'  )                       as comments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      cou';
wwv_flow_imp.g_varchar2_table(883) := 'nt(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and co.is_active = 1'||wwv_flow.LF||
'    and co.post_';
wwv_flow_imp.g_varchar2_table(884) := 'id  = q1.id'||wwv_flow.LF||
'  )                       as published_comments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) a';
wwv_flow_imp.g_varchar2_table(885) := 's cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and co.post_id  = q1.id'||wwv_flow.LF||
'    and exists('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(886) := '   select 1'||wwv_flow.LF||
'      from blog_comment_flags x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.flag in( ''NEW'', ''UNRE';
wwv_flow_imp.g_varchar2_table(887) := 'AD'' )'||wwv_flow.LF||
'      and x1.comment_id = co.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as unread_comments_cnt'||wwv_flow.LF||
'  ,';
wwv_flow_imp.g_varchar2_table(888) := '('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and co.post_id';
wwv_flow_imp.g_varchar2_table(889) := '  = q1.id'||wwv_flow.LF||
'    and exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_comment_flags x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(890) := '   and x1.flag = ''MODERATE'''||wwv_flow.LF||
'      and x1.comment_id = co.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as mo';
wwv_flow_imp.g_varchar2_table(891) := 'derate_comments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      count(1) as cnt'||wwv_flow.LF||
'    from blog_comments co'||wwv_flow.LF||
'    where 1';
wwv_flow_imp.g_varchar2_table(892) := ' = 1'||wwv_flow.LF||
'    and co.post_id  = q1.id'||wwv_flow.LF||
'    and co.is_active = 0'||wwv_flow.LF||
'    and not exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(893) := '    from blog_comment_flags x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.flag = ''MODERATE'''||wwv_flow.LF||
'      and x1.comm';
wwv_flow_imp.g_varchar2_table(894) := 'ent_id = co.id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as disabled_comments_cnt'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      l';
wwv_flow_imp.g_varchar2_table(895) := 'ov.display_value'||wwv_flow.LF||
'    from blog_v_lov lov'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lov.lov_name = ''POST_STATUS'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(896) := '      and lov.return_value = q1.post_status_code'||wwv_flow.LF||
'  )                       as post_status_txt'||wwv_flow.LF||
'-- P';
wwv_flow_imp.g_varchar2_table(897) := 'ost tags for admin app page 11 IR detail view'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      xmlserialize('||wwv_flow.LF||
'        conten';
wwv_flow_imp.g_varchar2_table(898) := 't xmlagg( lkp1.tag_html3 order by lkp1.display_seq )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    from blog_v_post_tags lkp1'||wwv_flow.LF||
'    w';
wwv_flow_imp.g_varchar2_table(899) := 'here 1 = 1'||wwv_flow.LF||
'      and lkp1.post_id = q1.id'||wwv_flow.LF||
'  )                       as tags_html'||wwv_flow.LF||
'  ,apex_escape.s';
wwv_flow_imp.g_varchar2_table(900) := 'triphtml('||wwv_flow.LF||
'    p_string => q1.first_paragraph'||wwv_flow.LF||
'  )                       as search_desc'||wwv_flow.LF||
'-- XML for ';
wwv_flow_imp.g_varchar2_table(901) := 'text index user datastore'||wwv_flow.LF||
'  ,xmlserialize( content'||wwv_flow.LF||
'    xmlforest('||wwv_flow.LF||
'      q1.blogger_name     as "a';
wwv_flow_imp.g_varchar2_table(902) := 'uthor"'||wwv_flow.LF||
'      ,q1.title           as "title"'||wwv_flow.LF||
'      ,q1.category_title  as "category"'||wwv_flow.LF||
'      ,q1.pos';
wwv_flow_imp.g_varchar2_table(903) := 't_desc       as "description"'||wwv_flow.LF||
'      --,q1.notes           as "notes"'||wwv_flow.LF||
'      ,apex_escape.striphtml(';
wwv_flow_imp.g_varchar2_table(904) := ''||wwv_flow.LF||
'        p_string => q1.body_html'||wwv_flow.LF||
'      )                   as "post"'||wwv_flow.LF||
'      ,('||wwv_flow.LF||
'        select'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(905) := '         xmlagg( xmlforest( tags.tag as "tag" ) )'||wwv_flow.LF||
'        from blog_v_all_post_tags tags'||wwv_flow.LF||
'        w';
wwv_flow_imp.g_varchar2_table(906) := 'here 1 = 1'||wwv_flow.LF||
'        and tags.post_id = q1.id'||wwv_flow.LF||
'        and tags.is_active * tags.tag_is_active = 1'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(907) := '     )                   as "tags"'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  )                       as ctx_datastore'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'wher';
wwv_flow_imp.g_varchar2_table(908) := 'e 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_FORM_P';
wwv_flow_imp.g_varchar2_table(909) := 'OSTS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_';
wwv_flow_imp.g_varchar2_table(910) := 'form_posts as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id               as id'||wwv_flow.LF||
'  ,t1.row_version     as row_version'||wwv_flow.LF||
'  ,t1.blog';
wwv_flow_imp.g_varchar2_table(911) := 'ger_id      as blogger_id'||wwv_flow.LF||
'  ,t1.category_id     as category_id'||wwv_flow.LF||
'  ,t1.first_paragraph as first_para';
wwv_flow_imp.g_varchar2_table(912) := 'graph'||wwv_flow.LF||
'  ,t1.is_active       as is_active'||wwv_flow.LF||
'  ,t1.post_desc       as post_desc'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select lkp.';
wwv_flow_imp.g_varchar2_table(913) := 'title'||wwv_flow.LF||
'    from blog_categories lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp.id = t1.category_id'||wwv_flow.LF||
'  )        ';
wwv_flow_imp.g_varchar2_table(914) := '           as category_title'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      listagg( lkp.tag, '','' )'||wwv_flow.LF||
'        within group(';
wwv_flow_imp.g_varchar2_table(915) := ' order by lkp.display_seq )'||wwv_flow.LF||
'    from blog_v_all_post_tags lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp.post_';
wwv_flow_imp.g_varchar2_table(916) := 'id = t1.id'||wwv_flow.LF||
'  )                   as tags'||wwv_flow.LF||
'  ,t1.published_on    as published_on'||wwv_flow.LF||
'  ,t1.title       ';
wwv_flow_imp.g_varchar2_table(917) := '    as title'||wwv_flow.LF||
'  ,t1.body_html       as body_html'||wwv_flow.LF||
'  ,t1.notes           as notes'||wwv_flow.LF||
'from blog_posts t1';
wwv_flow_imp.g_varchar2_table(918) := ''||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_';
wwv_flow_imp.g_varchar2_table(919) := 'POSTS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v';
wwv_flow_imp.g_varchar2_table(920) := '_posts as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'  select --+ inline'||wwv_flow.LF||
'     t1.id              as post_id'||wwv_flow.LF||
'    ,t3.id         ';
wwv_flow_imp.g_varchar2_table(921) := '     as category_id'||wwv_flow.LF||
'    ,t2.id              as blogger_id'||wwv_flow.LF||
'    ,t2.blogger_name    as blogger_name';
wwv_flow_imp.g_varchar2_table(922) := ''||wwv_flow.LF||
'    ,t1.title           as post_title'||wwv_flow.LF||
'    ,t3.title           as category_title'||wwv_flow.LF||
'    ,t1.post_desc';
wwv_flow_imp.g_varchar2_table(923) := '       as post_desc'||wwv_flow.LF||
'    ,t1.first_paragraph as first_paragraph'||wwv_flow.LF||
'    ,t1.body_html       as body_htm';
wwv_flow_imp.g_varchar2_table(924) := 'l'||wwv_flow.LF||
'    ,t1.published_on    as published_on'||wwv_flow.LF||
'    ,t1.ctx_search      as ctx_search'||wwv_flow.LF||
'    ,t1.changed_o';
wwv_flow_imp.g_varchar2_table(925) := 'n      as changed_on'||wwv_flow.LF||
'    ,t1.archive_year    as archive_year'||wwv_flow.LF||
'    ,t3.display_seq     as category_s';
wwv_flow_imp.g_varchar2_table(926) := 'eq'||wwv_flow.LF||
'  from blog_posts t1'||wwv_flow.LF||
'  join blog_bloggers t2'||wwv_flow.LF||
'    on t1.blogger_id  = t2.id'||wwv_flow.LF||
'  join blog_catego';
wwv_flow_imp.g_varchar2_table(927) := 'ries t3'||wwv_flow.LF||
'    on t1.category_id = t3.id'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
'    and t1.is_active = 1'||wwv_flow.LF||
'    and t2.is_activ';
wwv_flow_imp.g_varchar2_table(928) := 'e = 1'||wwv_flow.LF||
'    and t3.is_active = 1'||wwv_flow.LF||
'    and t1.published_on <= current_timestamp'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   q1.post';
wwv_flow_imp.g_varchar2_table(929) := '_id         as post_id'||wwv_flow.LF||
'  ,q1.category_id     as category_id'||wwv_flow.LF||
'  ,q1.blogger_id      as blogger_id'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(930) := ' ,q1.blogger_name    as blogger_name'||wwv_flow.LF||
'  ,q1.post_title      as post_title'||wwv_flow.LF||
'  ,q1.category_title  as ';
wwv_flow_imp.g_varchar2_table(931) := 'category_title'||wwv_flow.LF||
'  ,q1.post_desc       as post_desc'||wwv_flow.LF||
'  ,q1.first_paragraph as first_paragraph'||wwv_flow.LF||
'  ,q1.';
wwv_flow_imp.g_varchar2_table(932) := 'body_html       as body_html'||wwv_flow.LF||
'  ,q1.published_on    as published_on'||wwv_flow.LF||
'  ,q1.ctx_search      as ctx_se';
wwv_flow_imp.g_varchar2_table(933) := 'arch'||wwv_flow.LF||
'  ,q1.changed_on      as changed_on'||wwv_flow.LF||
'  ,q1.archive_year    as archive_year'||wwv_flow.LF||
'  ,q1.category_seq';
wwv_flow_imp.g_varchar2_table(934) := '    as category_seq'||wwv_flow.LF||
'-- Generate post URL'||wwv_flow.LF||
'  ,blog_url.get_post('||wwv_flow.LF||
'    p_post_id => q1.post_id'||wwv_flow.LF||
'  )  ';
wwv_flow_imp.g_varchar2_table(935) := '                 as post_url'||wwv_flow.LF||
'-- Generate category URL'||wwv_flow.LF||
'  ,blog_url.get_category('||wwv_flow.LF||
'    p_category_id';
wwv_flow_imp.g_varchar2_table(936) := ' => q1.category_id'||wwv_flow.LF||
'  )                   as category_url'||wwv_flow.LF||
'-- Aggregate tag HTML for post'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(937) := ' select'||wwv_flow.LF||
'      xmlserialize('||wwv_flow.LF||
'        content xmlagg( lkp_tag.tag_html1 order by lkp_tag.display_seq';
wwv_flow_imp.g_varchar2_table(938) := ' ) as varchar2(4000)'||wwv_flow.LF||
'      ) as tags_html'||wwv_flow.LF||
'    from blog_v_post_tags lkp_tag'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(939) := '  and lkp_tag.post_id = q1.post_id'||wwv_flow.LF||
'  )                   as tags_html1'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      xml';
wwv_flow_imp.g_varchar2_table(940) := 'serialize('||wwv_flow.LF||
'        content xmlagg( lkp_tag.tag_html2 order by lkp_tag.display_seq )'||wwv_flow.LF||
'      ) as tag';
wwv_flow_imp.g_varchar2_table(941) := 's_html'||wwv_flow.LF||
'    from blog_v_post_tags lkp_tag'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp_tag.post_id = q1.post_id'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(942) := '  )                   as tags_html2'||wwv_flow.LF||
'-- Fetch next post id and title'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      json_o';
wwv_flow_imp.g_varchar2_table(943) := 'bject('||wwv_flow.LF||
'         ''post_id''    : lkp_next.post_id'||wwv_flow.LF||
'        ,''post_title'' : lkp_next.post_title'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(944) := ' ) as post'||wwv_flow.LF||
'    from q1 lkp_next'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp_next.published_on > q1.published_on';
wwv_flow_imp.g_varchar2_table(945) := ''||wwv_flow.LF||
'    order by lkp_next.published_on asc'||wwv_flow.LF||
'    fetch first 1 rows only'||wwv_flow.LF||
'  )                   as next';
wwv_flow_imp.g_varchar2_table(946) := '_post'||wwv_flow.LF||
'-- Fetch previous post id and title'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      json_object('||wwv_flow.LF||
'         ''post_id''';
wwv_flow_imp.g_varchar2_table(947) := '    : lkp_prev.post_id'||wwv_flow.LF||
'        ,''post_title'' : lkp_prev.post_title'||wwv_flow.LF||
'      ) as post'||wwv_flow.LF||
'    from q1 lk';
wwv_flow_imp.g_varchar2_table(948) := 'p_prev'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp_prev.published_on < q1.published_on'||wwv_flow.LF||
'    order by lkp_prev.pu';
wwv_flow_imp.g_varchar2_table(949) := 'blished_on desc'||wwv_flow.LF||
'    fetch first 1 rows only'||wwv_flow.LF||
'  )                   as prev_post'||wwv_flow.LF||
'from q1'||wwv_flow.LF||
'where 1 =';
wwv_flow_imp.g_varchar2_table(950) := ' 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BL';
wwv_flow_imp.g_varchar2_table(951) := 'OG_V_SETTINGS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force vie';
wwv_flow_imp.g_varchar2_table(952) := 'w blog_v_settings as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id                       as id'||wwv_flow.LF||
', t1.row_version              as ';
wwv_flow_imp.g_varchar2_table(953) := 'row_version'||wwv_flow.LF||
', t1.changed_on               as changed_on'||wwv_flow.LF||
', lower(t1.changed_by)        as changed_b';
wwv_flow_imp.g_varchar2_table(954) := 'y'||wwv_flow.LF||
', t1.is_nullable              as is_nullable'||wwv_flow.LF||
', t1.display_seq              as display_seq'||wwv_flow.LF||
', t1.';
wwv_flow_imp.g_varchar2_table(955) := 'attribute_name           as attribute_name'||wwv_flow.LF||
', apex_lang.get_message('||wwv_flow.LF||
'    p_name => t1.attribute_mes';
wwv_flow_imp.g_varchar2_table(956) := 'sage'||wwv_flow.LF||
'  )                           as attribute_desc'||wwv_flow.LF||
', t1.attribute_value          as attribute_va';
wwv_flow_imp.g_varchar2_table(957) := 'lue'||wwv_flow.LF||
', t1.data_type                as data_type'||wwv_flow.LF||
', t1.int_min                  as int_min'||wwv_flow.LF||
', t1.int_';
wwv_flow_imp.g_varchar2_table(958) := 'max                  as int_max'||wwv_flow.LF||
', t1.help_message             as help_message'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select lov.';
wwv_flow_imp.g_varchar2_table(959) := 'display_value'||wwv_flow.LF||
'    from blog_v_lov lov'||wwv_flow.LF||
'    where lov.lov_name = ''YES_NO'''||wwv_flow.LF||
'    and to_number( lov.re';
wwv_flow_imp.g_varchar2_table(960) := 'turn_value ) = ( t1.is_nullable - 1 ) * -1'||wwv_flow.LF||
'  )                           as value_required'||wwv_flow.LF||
'-- HTML';
wwv_flow_imp.g_varchar2_table(961) := ' in query because IG removes HTML from column HTM expression in control break column'||wwv_flow.LF||
'-- Control bre';
wwv_flow_imp.g_varchar2_table(962) := 'ak is sorted and attribute data-sort-order gives correct order'||wwv_flow.LF||
', apex_string.format('||wwv_flow.LF||
'    p_message';
wwv_flow_imp.g_varchar2_table(963) := ' => ''<span data-sort-order="%s" class="u-bold">%s</span>'''||wwv_flow.LF||
'  , p0 => lpad( min( t1.display_seq ) ove';
wwv_flow_imp.g_varchar2_table(964) := 'r( partition by t1.attribute_group_message ), 5, ''0'' )'||wwv_flow.LF||
'  , p1 =>'||wwv_flow.LF||
'      apex_lang.get_message('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(965) := '     p_name => t1.attribute_group_message'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'  )                           as attribute_group';
wwv_flow_imp.g_varchar2_table(966) := '_html'||wwv_flow.LF||
', t1.attribute_group_message  as attribute_group'||wwv_flow.LF||
'from blog_settings t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and c';
wwv_flow_imp.g_varchar2_table(967) := 'ase'||wwv_flow.LF||
'    when t1.build_option_name is null'||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    when apex_application_admin.get_build_op';
wwv_flow_imp.g_varchar2_table(968) := 'tion_status('||wwv_flow.LF||
'      p_application_id    => sys_context( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'    , p_build_op';
wwv_flow_imp.g_varchar2_table(969) := 'tion_name => t1.build_option_name'||wwv_flow.LF||
'    ) = t1.build_option_status'||wwv_flow.LF||
'    then 1'||wwv_flow.LF||
'    else 0'||wwv_flow.LF||
'  end = 1';
wwv_flow_imp.g_varchar2_table(970) := ''||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG';
wwv_flow_imp.g_varchar2_table(971) := '_V_ARCHIVE_YEAR'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force v';
wwv_flow_imp.g_varchar2_table(972) := 'iew blog_v_archive_year as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   v1.archive_year      as archive_year'||wwv_flow.LF||
'  ,count(1)            ';
wwv_flow_imp.g_varchar2_table(973) := ' as post_count'||wwv_flow.LF||
'  ,max( v1.changed_on ) as changed_on'||wwv_flow.LF||
'  ,blog_url.get_archive('||wwv_flow.LF||
'    p_archive_id =>';
wwv_flow_imp.g_varchar2_table(974) := ' v1.archive_year'||wwv_flow.LF||
'  )                     as archive_url'||wwv_flow.LF||
'  ,feat.show_post_count as show_post_count';
wwv_flow_imp.g_varchar2_table(975) := ''||wwv_flow.LF||
'  ,case feat.show_post_count'||wwv_flow.LF||
'    when ''INCLUDE'' then count(1)'||wwv_flow.LF||
'  end                   as list_ba';
wwv_flow_imp.g_varchar2_table(976) := 'dge'||wwv_flow.LF||
'  ,apex_string.format('||wwv_flow.LF||
'    p_message => ''data-item-id="%s"'''||wwv_flow.LF||
'    ,p0 => v1.archive_year'||wwv_flow.LF||
'  )  ';
wwv_flow_imp.g_varchar2_table(977) := '                   as list_attr'||wwv_flow.LF||
'from blog_v_posts v1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'    apex_application_a';
wwv_flow_imp.g_varchar2_table(978) := 'dmin.get_build_option_status('||wwv_flow.LF||
'       p_application_id     => sys_context( ''APEX$SESSION'', ''APP_ID'' ';
wwv_flow_imp.g_varchar2_table(979) := ')'||wwv_flow.LF||
'      ,p_build_option_name  => ''BLOG_FEATURE_ARCHIVE_POST_COUNT'''||wwv_flow.LF||
'    ) as show_post_count'||wwv_flow.LF||
'  fro';
wwv_flow_imp.g_varchar2_table(980) := 'm dual'||wwv_flow.LF||
') feat'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'group by v1.archive_year'||wwv_flow.LF||
'  ,feat.show_post_count'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(981) := '-------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_CATEGORIES'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(982) := '-------------------------------------------------'||wwv_flow.LF||
'create or replace force view blog_v_categories as';
wwv_flow_imp.g_varchar2_table(983) := ''||wwv_flow.LF||
'select'||wwv_flow.LF||
'   v1.category_id       as category_id'||wwv_flow.LF||
'  ,v1.category_title    as category_title'||wwv_flow.LF||
'  ,v1.c';
wwv_flow_imp.g_varchar2_table(984) := 'ategory_seq      as display_seq'||wwv_flow.LF||
'  ,count(1)             as posts_count'||wwv_flow.LF||
'-- if category is changed, ';
wwv_flow_imp.g_varchar2_table(985) := 'trigger tickles text index and post changes'||wwv_flow.LF||
'  ,max( v1.changed_on ) as changed_on'||wwv_flow.LF||
'  ,blog_url.get_';
wwv_flow_imp.g_varchar2_table(986) := 'category('||wwv_flow.LF||
'    p_category_id => v1.category_id'||wwv_flow.LF||
'  )                     as category_url'||wwv_flow.LF||
'  ,feat.sho';
wwv_flow_imp.g_varchar2_table(987) := 'w_post_count as show_post_count'||wwv_flow.LF||
'  ,case feat.show_post_count'||wwv_flow.LF||
'    when ''INCLUDE'' then count(1)'||wwv_flow.LF||
'  e';
wwv_flow_imp.g_varchar2_table(988) := 'nd                   as list_badge'||wwv_flow.LF||
'  ,apex_string.format('||wwv_flow.LF||
'    p_message => ''data-item-id="%s"'''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(989) := '  ,p0 => v1.category_id'||wwv_flow.LF||
'  )                     as list_attr'||wwv_flow.LF||
'from blog_v_posts v1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(990) := 'select'||wwv_flow.LF||
'    apex_application_admin.get_build_option_status('||wwv_flow.LF||
'       p_application_id     => sys_cont';
wwv_flow_imp.g_varchar2_table(991) := 'ext( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'      ,p_build_option_name  => ''BLOG_FEATURE_CATEGORY_POST_COUNT'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(992) := '    ) as show_post_count'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') feat'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'group by v1.category_id'||wwv_flow.LF||
'  ,v1.category_';
wwv_flow_imp.g_varchar2_table(993) := 'title'||wwv_flow.LF||
'  ,v1.category_seq'||wwv_flow.LF||
'  ,feat.show_post_count'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(994) := '---------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_COMMENTS'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(995) := '-------------------'||wwv_flow.LF||
'create or replace force view blog_v_comments as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'   t1.id          as c';
wwv_flow_imp.g_varchar2_table(996) := 'omment_id'||wwv_flow.LF||
'  ,t1.post_id     as post_id'||wwv_flow.LF||
'  ,t1.parent_id   as parent_id'||wwv_flow.LF||
'  ,t1.created_on  as create';
wwv_flow_imp.g_varchar2_table(997) := 'd_on'||wwv_flow.LF||
'  ,t1.comment_by  as comment_by'||wwv_flow.LF||
'  ,('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      post_title'||wwv_flow.LF||
'    from blog_v_posts lkp';
wwv_flow_imp.g_varchar2_table(998) := ''||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and lkp.post_id = t1.post_id'||wwv_flow.LF||
'  )               as post_title'||wwv_flow.LF||
'-- Generate po';
wwv_flow_imp.g_varchar2_table(999) := 'st URL'||wwv_flow.LF||
'  ,blog_url.get_post('||wwv_flow.LF||
'    p_post_id => t1.post_id'||wwv_flow.LF||
'  )               as post_url'||wwv_flow.LF||
'  ,t1.bod';
wwv_flow_imp.g_varchar2_table(1000) := 'y_html   as comment_body'||wwv_flow.LF||
'  ,t1.ctx_search  as ctx_search'||wwv_flow.LF||
'  ,apex_string.get_initials('||wwv_flow.LF||
'    p_str =';
wwv_flow_imp.g_varchar2_table(1001) := '> t1.comment_by'||wwv_flow.LF||
'  )               as user_icon'||wwv_flow.LF||
'  ,apex_string.format('||wwv_flow.LF||
'     p_message => ''u-color-';
wwv_flow_imp.g_varchar2_table(1002) := '%s'''||wwv_flow.LF||
'    ,p0 => ora_hash( lower( t1.comment_by ), 44 ) + 1'||wwv_flow.LF||
'  )               as icon_modifier'||wwv_flow.LF||
'from';
wwv_flow_imp.g_varchar2_table(1003) := ' blog_comments t1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and t1.is_active = 1'||wwv_flow.LF||
'  and not exists('||wwv_flow.LF||
'    select 1'||wwv_flow.LF||
'    from bl';
wwv_flow_imp.g_varchar2_table(1004) := 'og_comment_flags x1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and x1.comment_id = t1.id'||wwv_flow.LF||
'      and x1.flag = ''MODERATE';
wwv_flow_imp.g_varchar2_table(1005) := ''''||wwv_flow.LF||
'  )'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Vie';
wwv_flow_imp.g_varchar2_table(1006) := 'w BLOG_V_FORM_COMMENTS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace ';
wwv_flow_imp.g_varchar2_table(1007) := 'force view blog_v_form_comments as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  t1.id'||wwv_flow.LF||
', t1.row_version'||wwv_flow.LF||
', t1.is_active'||wwv_flow.LF||
', t1.post_id';
wwv_flow_imp.g_varchar2_table(1008) := ''||wwv_flow.LF||
', t1.parent_id'||wwv_flow.LF||
', t1.body_html'||wwv_flow.LF||
', t1.comment_by'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      lkp.sentiment_json.document';
wwv_flow_imp.g_varchar2_table(1009) := 'Sentiment'||wwv_flow.LF||
'    from blog_comment_sentiments lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp.comment_id = t1.id'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1010) := '  ) as sentiment'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select lkp.title'||wwv_flow.LF||
'    from blog_posts lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp';
wwv_flow_imp.g_varchar2_table(1011) := '.id = t1.post_id'||wwv_flow.LF||
'  ) as post_title'||wwv_flow.LF||
', ('||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      lkp.comment_status_code'||wwv_flow.LF||
'    from blog_v';
wwv_flow_imp.g_varchar2_table(1012) := '_all_comments lkp'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and lkp.id = t1.id'||wwv_flow.LF||
'  ) as comment_status_code'||wwv_flow.LF||
'from blog_';
wwv_flow_imp.g_varchar2_table(1013) := 'comments t1'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for View BLOG_V_PO';
wwv_flow_imp.g_varchar2_table(1014) := 'STS_LAST20'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force view b';
wwv_flow_imp.g_varchar2_table(1015) := 'log_v_posts_last20 as'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  rownum             as display_seq'||wwv_flow.LF||
', q1.post_id         as post_id';
wwv_flow_imp.g_varchar2_table(1016) := ''||wwv_flow.LF||
', q1.published_on    as published_on'||wwv_flow.LF||
', q1.blogger_name    as blogger_name'||wwv_flow.LF||
', q1.post_title      as';
wwv_flow_imp.g_varchar2_table(1017) := ' post_title'||wwv_flow.LF||
', q1.post_desc       as post_desc'||wwv_flow.LF||
', q1.category_title  as category_title'||wwv_flow.LF||
', q1.post_ur';
wwv_flow_imp.g_varchar2_table(1018) := 'l        as post_url'||wwv_flow.LF||
', q1.body_html       as body_html'||wwv_flow.LF||
', q1.absolute_url    as absolute_url'||wwv_flow.LF||
', ape';
wwv_flow_imp.g_varchar2_table(1019) := 'x_string.format('||wwv_flow.LF||
'    p_message => ''data-item-id="%s"'''||wwv_flow.LF||
'    ,p0 => q1.post_id'||wwv_flow.LF||
'  )                  ';
wwv_flow_imp.g_varchar2_table(1020) := ' as list_attr'||wwv_flow.LF||
'from ('||wwv_flow.LF||
'  select --+ first_rows(20)'||wwv_flow.LF||
'    v1.post_id'||wwv_flow.LF||
'  , v1.published_on'||wwv_flow.LF||
'  , v1.blog';
wwv_flow_imp.g_varchar2_table(1021) := 'ger_name'||wwv_flow.LF||
'  , v1.post_title'||wwv_flow.LF||
'  , v1.post_desc'||wwv_flow.LF||
'  , v1.category_title'||wwv_flow.LF||
'  , v1.post_url'||wwv_flow.LF||
'  , v1.body_h';
wwv_flow_imp.g_varchar2_table(1022) := 'tml'||wwv_flow.LF||
'  , blog_url.get_post('||wwv_flow.LF||
'      p_post_id     => v1.post_id'||wwv_flow.LF||
'    , p_canonical  => ''YES'''||wwv_flow.LF||
'    ) a';
wwv_flow_imp.g_varchar2_table(1023) := 's absolute_url'||wwv_flow.LF||
'  from blog_v_posts v1'||wwv_flow.LF||
'  order by v1.published_on desc'||wwv_flow.LF||
') q1'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'  and ro';
wwv_flow_imp.g_varchar2_table(1024) := 'wnum <= 20'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for';
wwv_flow_imp.g_varchar2_table(1025) := ' View BLOG_V_TAGS'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or replace force';
wwv_flow_imp.g_varchar2_table(1026) := ' view blog_v_tags as'||wwv_flow.LF||
'with q1 as('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'    v1.tag_id'||wwv_flow.LF||
'  , v1.tag'||wwv_flow.LF||
'  , v1.tag_url'||wwv_flow.LF||
'  -- if tag ';
wwv_flow_imp.g_varchar2_table(1027) := 'is changed, trigger tickles text index and post changes'||wwv_flow.LF||
'  , max( v2.changed_on ) as changed_on'||wwv_flow.LF||
'  ,';
wwv_flow_imp.g_varchar2_table(1028) := ' count( 1 ) as posts_count'||wwv_flow.LF||
'  from blog_v_post_tags v1'||wwv_flow.LF||
'  join blog_v_posts v2 on v1.post_id = v2.po';
wwv_flow_imp.g_varchar2_table(1029) := 'st_id'||wwv_flow.LF||
'  group by'||wwv_flow.LF||
'    v1.tag_id'||wwv_flow.LF||
'  , v1.tag'||wwv_flow.LF||
'  , v1.tag_url'||wwv_flow.LF||
')'||wwv_flow.LF||
'select'||wwv_flow.LF||
'  q1.tag_id             as ';
wwv_flow_imp.g_varchar2_table(1030) := 'tag_id'||wwv_flow.LF||
', q1.tag                as tag'||wwv_flow.LF||
', q1.tag_url            as tag_url'||wwv_flow.LF||
', q1.posts_count        ';
wwv_flow_imp.g_varchar2_table(1031) := 'as posts_count'||wwv_flow.LF||
', q1.changed_on         as changed_on'||wwv_flow.LF||
', width_bucket('||wwv_flow.LF||
'    q1.posts_count'||wwv_flow.LF||
'  , min(';
wwv_flow_imp.g_varchar2_table(1032) := ' q1.posts_count ) over()'||wwv_flow.LF||
'  , max( q1.posts_count ) over()'||wwv_flow.LF||
'  , 7'||wwv_flow.LF||
'  )                     as tag_bu';
wwv_flow_imp.g_varchar2_table(1033) := 'cket'||wwv_flow.LF||
', feat.show_post_count  as show_post_count'||wwv_flow.LF||
', case feat.show_post_count'||wwv_flow.LF||
'    when ''INCLUDE'' th';
wwv_flow_imp.g_varchar2_table(1034) := 'en q1.posts_count'||wwv_flow.LF||
'  end                   as list_badge'||wwv_flow.LF||
'-- Get feature tag post count status'||wwv_flow.LF||
'from';
wwv_flow_imp.g_varchar2_table(1035) := ' q1'||wwv_flow.LF||
'cross join('||wwv_flow.LF||
'  select'||wwv_flow.LF||
'    apex_application_admin.get_build_option_status('||wwv_flow.LF||
'      p_application';
wwv_flow_imp.g_varchar2_table(1036) := '_id     => sys_context( ''APEX$SESSION'', ''APP_ID'' )'||wwv_flow.LF||
'    , p_build_option_name  => ''BLOG_FEATURE_TAG_';
wwv_flow_imp.g_varchar2_table(1037) := 'CLOUD_POST_COUNT'''||wwv_flow.LF||
'    ) as show_post_count'||wwv_flow.LF||
'  from dual'||wwv_flow.LF||
') feat'||wwv_flow.LF||
'where 1 = 1'||wwv_flow.LF||
'with read only'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(1038) := '------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_BLOGGERS_TRG'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(1039) := '---------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_BLO';
wwv_flow_imp.g_varchar2_table(1040) := 'GGERS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_bloggers'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1041) := '    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( ';
wwv_flow_imp.g_varchar2_table(1042) := ':new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :';
wwv_flow_imp.g_varchar2_table(1043) := 'new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER''';
wwv_flow_imp.g_varchar2_table(1044) := ' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1045) := '    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.ch';
wwv_flow_imp.g_varchar2_table(1046) := 'anged_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_';
wwv_flow_imp.g_varchar2_table(1047) := 'USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )';
wwv_flow_imp.g_varchar2_table(1048) := ''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG';
wwv_flow_imp.g_varchar2_table(1049) := '_CATEGORIES_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITION';
wwv_flow_imp.g_varchar2_table(1050) := 'ABLE TRIGGER "BLOG_CATEGORIES_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_categories'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begi';
wwv_flow_imp.g_varchar2_table(1051) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.';
wwv_flow_imp.g_varchar2_table(1052) := 'row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on';
wwv_flow_imp.g_varchar2_table(1053) := ', localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ';
wwv_flow_imp.g_varchar2_table(1054) := '''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''US';
wwv_flow_imp.g_varchar2_table(1055) := 'ERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + ';
wwv_flow_imp.g_varchar2_table(1056) := '1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_cont';
wwv_flow_imp.g_varchar2_table(1057) := 'ext( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''U';
wwv_flow_imp.g_varchar2_table(1058) := 'SERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1059) := ''||wwv_flow.LF||
'--  DDL for Trigger BLOG_COMMENTS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'C';
wwv_flow_imp.g_varchar2_table(1060) := 'REATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENTS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_comments';
wwv_flow_imp.g_varchar2_table(1061) := ''||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.n';
wwv_flow_imp.g_varchar2_table(1062) := 'extval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coale';
wwv_flow_imp.g_varchar2_table(1063) := 'sce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1064) := '      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1065) := '   ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version :=';
wwv_flow_imp.g_varchar2_table(1066) := ' :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coal';
wwv_flow_imp.g_varchar2_table(1067) := 'esce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1068) := '    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- Generate comment preview'||wwv_flow.LF||
'  :new.comment';
wwv_flow_imp.g_varchar2_table(1069) := '_preview := blog_comment.short_text( :new.body_html );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- tickle text index'||wwv_flow.LF||
'  :new.ctx_search ';
wwv_flow_imp.g_varchar2_table(1070) := ':= ''X'';'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BL';
wwv_flow_imp.g_varchar2_table(1071) := 'OG_COMMENT_FLAGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE TR';
wwv_flow_imp.g_varchar2_table(1072) := 'IGGER "BLOG_COMMENT_FLAGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_comment_flags'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin';
wwv_flow_imp.g_varchar2_table(1073) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.r';
wwv_flow_imp.g_varchar2_table(1074) := 'ow_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on,';
wwv_flow_imp.g_varchar2_table(1075) := ' localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''';
wwv_flow_imp.g_varchar2_table(1076) := 'APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USE';
wwv_flow_imp.g_varchar2_table(1077) := 'RENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1';
wwv_flow_imp.g_varchar2_table(1078) := ';'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_conte';
wwv_flow_imp.g_varchar2_table(1079) := 'xt( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''US';
wwv_flow_imp.g_varchar2_table(1080) := 'ERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1081) := ''||wwv_flow.LF||
'--  DDL for Trigger BLOG_COMMENTS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CR';
wwv_flow_imp.g_varchar2_table(1082) := 'EATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENT_SENTIMENTS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog';
wwv_flow_imp.g_varchar2_table(1083) := '_comment_sentiments'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( ';
wwv_flow_imp.g_varchar2_table(1084) := ':new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.cr';
wwv_flow_imp.g_varchar2_table(1085) := 'eated_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1086) := '  :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ';
wwv_flow_imp.g_varchar2_table(1087) := '''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1088) := ':new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new';
wwv_flow_imp.g_varchar2_table(1089) := '.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV';
wwv_flow_imp.g_varchar2_table(1090) := ''', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(1091) := '---------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_COMMENT_SUBSCRIBERS_TRG'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(1092) := '-----------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_COMMENT';
wwv_flow_imp.g_varchar2_table(1093) := '_SUBSCRIBERS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_comment_subscribers'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  i';
wwv_flow_imp.g_varchar2_table(1094) := 'f inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_vers';
wwv_flow_imp.g_varchar2_table(1095) := 'ion  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localt';
wwv_flow_imp.g_varchar2_table(1096) := 'imestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SE';
wwv_flow_imp.g_varchar2_table(1097) := 'SSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ';
wwv_flow_imp.g_varchar2_table(1098) := '''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  en';
wwv_flow_imp.g_varchar2_table(1099) := 'd if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''AP';
wwv_flow_imp.g_varchar2_table(1100) := 'EX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'',';
wwv_flow_imp.g_varchar2_table(1101) := ' ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DD';
wwv_flow_imp.g_varchar2_table(1102) := 'L for Trigger BLOG_DYNAMIC_CONTENT_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CR';
wwv_flow_imp.g_varchar2_table(1103) := 'EATE OR REPLACE EDITIONABLE TRIGGER "BLOG_DYNAMIC_CONTENT_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_dy';
wwv_flow_imp.g_varchar2_table(1104) := 'namic_content'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.i';
wwv_flow_imp.g_varchar2_table(1105) := 'd, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_';
wwv_flow_imp.g_varchar2_table(1106) := 'on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new';
wwv_flow_imp.g_varchar2_table(1107) := '.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY';
wwv_flow_imp.g_varchar2_table(1108) := '_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.r';
wwv_flow_imp.g_varchar2_table(1109) := 'ow_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.chang';
wwv_flow_imp.g_varchar2_table(1110) := 'ed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PR';
wwv_flow_imp.g_varchar2_table(1111) := 'OXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(1112) := '---------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_FEATURES_TRG'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(1113) := '------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FEATURES_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'i';
wwv_flow_imp.g_varchar2_table(1114) := 'nsert or'||wwv_flow.LF||
'update on blog_features'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id          ';
wwv_flow_imp.g_varchar2_table(1115) := ' := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 )';
wwv_flow_imp.g_varchar2_table(1116) := ';'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := c';
wwv_flow_imp.g_varchar2_table(1117) := 'oalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_contex';
wwv_flow_imp.g_varchar2_table(1118) := 't( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updat';
wwv_flow_imp.g_varchar2_table(1119) := 'ing then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtime';
wwv_flow_imp.g_varchar2_table(1120) := 'stamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_con';
wwv_flow_imp.g_varchar2_table(1121) := 'text( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(1122) := '-----------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_FILES_TRG'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(1123) := '-----------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_FILES_T';
wwv_flow_imp.g_varchar2_table(1124) := 'RG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_files'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
''||wwv_flow.LF||
'    :new';
wwv_flow_imp.g_varchar2_table(1125) := '.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row';
wwv_flow_imp.g_varchar2_table(1126) := '_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.crea';
wwv_flow_imp.g_varchar2_table(1127) := 'ted_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1128) := '  ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1129) := ''||wwv_flow.LF||
'    :new.is_active    := coalesce( :new.is_active, 1 );'||wwv_flow.LF||
'    :new.is_download  := coalesce( :new.i';
wwv_flow_imp.g_varchar2_table(1130) := 's_download, 0 );'||wwv_flow.LF||
''||wwv_flow.LF||
'    :new.mime_type    := coalesce( :new.mime_type, blog_mime.get_mime_type( :new';
wwv_flow_imp.g_varchar2_table(1131) := '.file_name ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1132) := ''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESS';
wwv_flow_imp.g_varchar2_table(1133) := 'ION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSI';
wwv_flow_imp.g_varchar2_table(1134) := 'ON_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.file_size := coalesce( :new.file_size, coalesce( sys.dbms_lob.getlength( ';
wwv_flow_imp.g_varchar2_table(1135) := ':new.blob_content ), 0 ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(1136) := '  DDL for Trigger BLOG_INIT_ITEMS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CRE';
wwv_flow_imp.g_varchar2_table(1137) := 'ATE OR REPLACE EDITIONABLE TRIGGER "BLOG_INIT_ITEMS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_init_ite';
wwv_flow_imp.g_varchar2_table(1138) := 'ms'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq';
wwv_flow_imp.g_varchar2_table(1139) := '.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coa';
wwv_flow_imp.g_varchar2_table(1140) := 'lesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by';
wwv_flow_imp.g_varchar2_table(1141) := ''||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1142) := '     ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version ';
wwv_flow_imp.g_varchar2_table(1143) := ':= :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := co';
wwv_flow_imp.g_varchar2_table(1144) := 'alesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )';
wwv_flow_imp.g_varchar2_table(1145) := ''||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(1146) := '----------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_LINKS_TRG'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(1147) := '----------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINKS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update ';
wwv_flow_imp.g_varchar2_table(1148) := 'on blog_links'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.i';
wwv_flow_imp.g_varchar2_table(1149) := 'd, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_';
wwv_flow_imp.g_varchar2_table(1150) := 'on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new';
wwv_flow_imp.g_varchar2_table(1151) := '.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY';
wwv_flow_imp.g_varchar2_table(1152) := '_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.r';
wwv_flow_imp.g_varchar2_table(1153) := 'ow_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.chang';
wwv_flow_imp.g_varchar2_table(1154) := 'ed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PR';
wwv_flow_imp.g_varchar2_table(1155) := 'OXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(1156) := '---------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_LINK_GROUPS_TRG'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(1157) := '---------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_LINK_GROUPS_TRG"'||wwv_flow.LF||
'bef';
wwv_flow_imp.g_varchar2_table(1158) := 'ore'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_link_groups'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id ';
wwv_flow_imp.g_varchar2_table(1159) := '          := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_ver';
wwv_flow_imp.g_varchar2_table(1160) := 'sion, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_';
wwv_flow_imp.g_varchar2_table(1161) := 'by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,s';
wwv_flow_imp.g_varchar2_table(1162) := 'ys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  el';
wwv_flow_imp.g_varchar2_table(1163) := 'sif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := ';
wwv_flow_imp.g_varchar2_table(1164) := 'localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1165) := ' ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end';
wwv_flow_imp.g_varchar2_table(1166) := ';'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_LIST_OF_VAL';
wwv_flow_imp.g_varchar2_table(1167) := 'UES_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRI';
wwv_flow_imp.g_varchar2_table(1168) := 'GGER "BLOG_LIST_OF_VALUES_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_list_of_values'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begi';
wwv_flow_imp.g_varchar2_table(1169) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.';
wwv_flow_imp.g_varchar2_table(1170) := 'row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on';
wwv_flow_imp.g_varchar2_table(1171) := ', localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ';
wwv_flow_imp.g_varchar2_table(1172) := '''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''US';
wwv_flow_imp.g_varchar2_table(1173) := 'ERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + ';
wwv_flow_imp.g_varchar2_table(1174) := '1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_cont';
wwv_flow_imp.g_varchar2_table(1175) := 'ext( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''U';
wwv_flow_imp.g_varchar2_table(1176) := 'SERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1177) := ''||wwv_flow.LF||
'--  DDL for Trigger BLOG_POSTS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREA';
wwv_flow_imp.g_varchar2_table(1178) := 'TE OR REPLACE EDITIONABLE TRIGGER "BLOG_POSTS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_posts'||wwv_flow.LF||
'for eac';
wwv_flow_imp.g_varchar2_table(1179) := 'h row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce('||wwv_flow.LF||
'        :new.id'||wwv_flow.LF||
'      , to';
wwv_flow_imp.g_varchar2_table(1180) := '_number( to_char( sys_extract_utc( localtimestamp ), ''YYYYMMDDHH24MISSFF6'' ) )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    :new.row';
wwv_flow_imp.g_varchar2_table(1181) := '_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, l';
wwv_flow_imp.g_varchar2_table(1182) := 'ocaltimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''AP';
wwv_flow_imp.g_varchar2_table(1183) := 'EX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERE';
wwv_flow_imp.g_varchar2_table(1184) := 'NV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;';
wwv_flow_imp.g_varchar2_table(1185) := ''||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context';
wwv_flow_imp.g_varchar2_table(1186) := '( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USER';
wwv_flow_imp.g_varchar2_table(1187) := 'ENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- tickle text index'||wwv_flow.LF||
'  :new.ctx_search   := ''X'';'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(1188) := '----------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_POST_TAGS_TRG'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(1189) := '--------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST';
wwv_flow_imp.g_varchar2_table(1190) := '_TAGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_post_tags'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then';
wwv_flow_imp.g_varchar2_table(1191) := ''||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce(';
wwv_flow_imp.g_varchar2_table(1192) := ' :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1193) := ':new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER';
wwv_flow_imp.g_varchar2_table(1194) := ''' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )';
wwv_flow_imp.g_varchar2_table(1195) := ''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.c';
wwv_flow_imp.g_varchar2_table(1196) := 'hanged_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP';
wwv_flow_imp.g_varchar2_table(1197) := '_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )';
wwv_flow_imp.g_varchar2_table(1198) := ''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLO';
wwv_flow_imp.g_varchar2_table(1199) := 'G_POST_UDS_CATEGORIES_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLA';
wwv_flow_imp.g_varchar2_table(1200) := 'CE EDITIONABLE TRIGGER "BLOG_POST_UDS_CATEGORIES_TRG"'||wwv_flow.LF||
'after'||wwv_flow.LF||
'update on blog_categories'||wwv_flow.LF||
'for each ro';
wwv_flow_imp.g_varchar2_table(1201) := 'w'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'-- if category is changed, update blog_posts table text index column'||wwv_flow.LF||
'  update blog_post';
wwv_flow_imp.g_varchar2_table(1202) := 's t1'||wwv_flow.LF||
'    set ctx_search = ctx_search'||wwv_flow.LF||
'  where 1 = 1'||wwv_flow.LF||
'    and :new.title_unique != :old.title_unique';
wwv_flow_imp.g_varchar2_table(1203) := ''||wwv_flow.LF||
'    and t1.category_id = :new.id'||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1204) := '--------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_POST_UDS_POST_TAGS_TRG'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(1205) := '---------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_POST_UDS_POST_TAGS_TRG"'||wwv_flow.LF||
'for'||wwv_flow.LF||
'insert or';
wwv_flow_imp.g_varchar2_table(1206) := ''||wwv_flow.LF||
'update or'||wwv_flow.LF||
'delete on blog_post_tags'||wwv_flow.LF||
'compound trigger'||wwv_flow.LF||
''||wwv_flow.LF||
'  t_post_id apex_t_number;'||wwv_flow.LF||
''||wwv_flow.LF||
'  after eac';
wwv_flow_imp.g_varchar2_table(1207) := 'h row is'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if tag is removed from post, save post id for after statement handling'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1208) := '    if deleting'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.push( t_post_id, :old.post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(1209) := '- if updating or inserting post tag, update blog_posts table text index column'||wwv_flow.LF||
'      update blog_po';
wwv_flow_imp.g_varchar2_table(1210) := 'sts t1'||wwv_flow.LF||
'        set ctx_search = ctx_search'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and t1.id = :new.post_id'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1211) := '    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end after each row;'||wwv_flow.LF||
''||wwv_flow.LF||
'  after statement is'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- handle remo';
wwv_flow_imp.g_varchar2_table(1212) := 'ved tags and update blog_posts table text index column'||wwv_flow.LF||
'    update blog_posts t1'||wwv_flow.LF||
'      set ctx_sear';
wwv_flow_imp.g_varchar2_table(1213) := 'ch = ctx_search'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'        select 1'||wwv_flow.LF||
'        from table( t_post_id';
wwv_flow_imp.g_varchar2_table(1214) := ' ) x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.column_value = t1.id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end after sta';
wwv_flow_imp.g_varchar2_table(1215) := 'tement;'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BL';
wwv_flow_imp.g_varchar2_table(1216) := 'OG_POST_UDS_TAGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE ED';
wwv_flow_imp.g_varchar2_table(1217) := 'ITIONABLE TRIGGER "BLOG_POST_UDS_TAGS_TRG"'||wwv_flow.LF||
'after'||wwv_flow.LF||
'update on blog_tags'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if ';
wwv_flow_imp.g_varchar2_table(1218) := ':new.tag_unique != :old.tag_unique'||wwv_flow.LF||
'  or :new.is_active != :old.is_active'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- if tag is ';
wwv_flow_imp.g_varchar2_table(1219) := 'changed, update blog_posts table text index column'||wwv_flow.LF||
'    update blog_posts t1'||wwv_flow.LF||
'      set ctx_search =';
wwv_flow_imp.g_varchar2_table(1220) := ' ctx_search'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_post_tags x1'||wwv_flow.LF||
'      w';
wwv_flow_imp.g_varchar2_table(1221) := 'here 1 = 1'||wwv_flow.LF||
'        and x1.post_id = t1.id'||wwv_flow.LF||
'        and x1.tag_id  = :new.id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  en';
wwv_flow_imp.g_varchar2_table(1222) := 'd if;'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG';
wwv_flow_imp.g_varchar2_table(1223) := '_SETTINGS_TRG'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONAB';
wwv_flow_imp.g_varchar2_table(1224) := 'LE TRIGGER "BLOG_SETTINGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on blog_settings'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1225) := ' if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_ve';
wwv_flow_imp.g_varchar2_table(1226) := 'rsion  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.created_on   := coalesce( :new.created_on, loca';
wwv_flow_imp.g_varchar2_table(1227) := 'ltimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$';
wwv_flow_imp.g_varchar2_table(1228) := 'SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV''';
wwv_flow_imp.g_varchar2_table(1229) := ', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1230) := 'end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''';
wwv_flow_imp.g_varchar2_table(1231) := 'APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV';
wwv_flow_imp.g_varchar2_table(1232) := ''', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  ';
wwv_flow_imp.g_varchar2_table(1233) := 'DDL for Trigger BLOG_SUBSCRIBERS_EMAIL_TRG'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1234) := ''||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_SUBSCRIBERS_EMAIL_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'insert or'||wwv_flow.LF||
'update on b';
wwv_flow_imp.g_varchar2_table(1235) := 'log_subscribers_email'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := coalesce';
wwv_flow_imp.g_varchar2_table(1236) := '( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
'    :new.';
wwv_flow_imp.g_varchar2_table(1237) := 'created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coalesce('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1238) := '    :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV''';
wwv_flow_imp.g_varchar2_table(1239) := ', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating then'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1240) := '  :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestamp;'||wwv_flow.LF||
'  :n';
wwv_flow_imp.g_varchar2_table(1241) := 'ew.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERE';
wwv_flow_imp.g_varchar2_table(1242) := 'NV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(1243) := '-----------------------------------------'||wwv_flow.LF||
'--  DDL for Trigger BLOG_TAGS_TRG'||wwv_flow.LF||
'----------------------';
wwv_flow_imp.g_varchar2_table(1244) := '----------------------------------'||wwv_flow.LF||
'CREATE OR REPLACE EDITIONABLE TRIGGER "BLOG_TAGS_TRG"'||wwv_flow.LF||
'before'||wwv_flow.LF||
'i';
wwv_flow_imp.g_varchar2_table(1245) := 'nsert or'||wwv_flow.LF||
'update on blog_tags'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  if inserting then'||wwv_flow.LF||
'    :new.id           := ';
wwv_flow_imp.g_varchar2_table(1246) := 'coalesce( :new.id, blog_seq.nextval );'||wwv_flow.LF||
'    :new.row_version  := coalesce( :new.row_version, 1 );'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1247) := '   :new.created_on   := coalesce( :new.created_on, localtimestamp );'||wwv_flow.LF||
'    :new.created_by   := coale';
wwv_flow_imp.g_varchar2_table(1248) := 'sce('||wwv_flow.LF||
'      :new.created_by'||wwv_flow.LF||
'      ,sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''';
wwv_flow_imp.g_varchar2_table(1249) := 'USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'      ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  elsif updating ';
wwv_flow_imp.g_varchar2_table(1250) := 'then'||wwv_flow.LF||
'    :new.row_version := :old.row_version + 1;'||wwv_flow.LF||
'  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  :new.changed_on := localtimestam';
wwv_flow_imp.g_varchar2_table(1251) := 'p;'||wwv_flow.LF||
'  :new.changed_by := coalesce('||wwv_flow.LF||
'     sys_context( ''APEX$SESSION'', ''APP_USER'' )'||wwv_flow.LF||
'    ,sys_context';
wwv_flow_imp.g_varchar2_table(1252) := '( ''USERENV'', ''PROXY_USER'' )'||wwv_flow.LF||
'    ,sys_context( ''USERENV'', ''SESSION_USER'' )'||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create ';
wwv_flow_imp.g_varchar2_table(1253) := 'or replace package body "BLOG_CTX"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1254) := '--------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1255) := '--'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1256) := '--------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1257) := '--'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(1258) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedures a';
wwv_flow_imp.g_varchar2_table(1259) := 'nd functions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(1260) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(1261) := '-------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(1262) := '-------------------------------------------------'||wwv_flow.LF||
'-- Global procedures and functions'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(1263) := '-------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(1264) := '-------------------------------------------------'||wwv_flow.LF||
'  procedure generate_post_datastore('||wwv_flow.LF||
'    rid   i';
wwv_flow_imp.g_varchar2_table(1265) := 'n rowid,'||wwv_flow.LF||
'    tlob  in out nocopy clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      ctx_datastore'||wwv_flow.LF||
'    i';
wwv_flow_imp.g_varchar2_table(1266) := 'nto tlob'||wwv_flow.LF||
'    from blog_v_all_posts v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and v1.ctx_rid = rid'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ';
wwv_flow_imp.g_varchar2_table(1267) := 'generate_post_datastore;'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1268) := '------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedur';
wwv_flow_imp.g_varchar2_table(1269) := 'e generate_comment_datastore('||wwv_flow.LF||
'    rid   in rowid,'||wwv_flow.LF||
'    tlob  in out nocopy clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin';
wwv_flow_imp.g_varchar2_table(1270) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      ctx_datastore'||wwv_flow.LF||
'    into tlob'||wwv_flow.LF||
'    from blog_v_all_comments v1'||wwv_flow.LF||
'    where 1 = 1';
wwv_flow_imp.g_varchar2_table(1271) := ''||wwv_flow.LF||
'      and v1.ctx_rid = rid'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end generate_comment_datastore;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(1272) := '------------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(1273) := '------------------------------------'||wwv_flow.LF||
'end "BLOG_CTX";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_INSTA';
wwv_flow_imp.g_varchar2_table(1274) := 'LL"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(1275) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- Private constants and va';
wwv_flow_imp.g_varchar2_table(1276) := 'riables'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(1277) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(1278) := '--------------------------------------------------------------'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(1279) := '--------------------------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(1280) := '---------------------------------------------------------------'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(1281) := '---------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(1282) := '------------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1283) := '------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(1284) := '------------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1285) := '------------------'||wwv_flow.LF||
'  procedure settings_merge('||wwv_flow.LF||
'    p_attribute_name          in varchar2,'||wwv_flow.LF||
'    p_d';
wwv_flow_imp.g_varchar2_table(1286) := 'isplay_seq             in number,'||wwv_flow.LF||
'    p_is_nullable             in number,'||wwv_flow.LF||
'    p_data_type        ';
wwv_flow_imp.g_varchar2_table(1287) := '       in varchar2,'||wwv_flow.LF||
'    p_attribute_group_message in varchar2,'||wwv_flow.LF||
'    p_int_min                 in nu';
wwv_flow_imp.g_varchar2_table(1288) := 'mber   default null,'||wwv_flow.LF||
'    p_int_max                 in number   default null,'||wwv_flow.LF||
'    p_build_option_na';
wwv_flow_imp.g_varchar2_table(1289) := 'me       in varchar2 default null,'||wwv_flow.LF||
'    p_build_option_status     in varchar2 default null,'||wwv_flow.LF||
'    p_a';
wwv_flow_imp.g_varchar2_table(1290) := 'ttribute_value         in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    merge into blog_settings';
wwv_flow_imp.g_varchar2_table(1291) := ''||wwv_flow.LF||
'    using dual'||wwv_flow.LF||
'    on( attribute_name = p_attribute_name )'||wwv_flow.LF||
'    when not matched then'||wwv_flow.LF||
'      inser';
wwv_flow_imp.g_varchar2_table(1292) := 't ( attribute_name, display_seq, is_nullable, data_type, attribute_group_message, int_min, int_max, ';
wwv_flow_imp.g_varchar2_table(1293) := 'build_option_name, build_option_status, attribute_value )'||wwv_flow.LF||
'        values( p_attribute_name, p_displ';
wwv_flow_imp.g_varchar2_table(1294) := 'ay_seq, p_is_nullable, p_data_type, p_attribute_group_message, p_int_min, p_int_max, p_build_option_';
wwv_flow_imp.g_varchar2_table(1295) := 'name, p_build_option_status, p_attribute_value )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set'||wwv_flow.LF||
'        d';
wwv_flow_imp.g_varchar2_table(1296) := 'isplay_seq = p_display_seq'||wwv_flow.LF||
'      , is_nullable = p_is_nullable'||wwv_flow.LF||
'      , data_type = p_data_type'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1297) := '    , attribute_group_message = p_attribute_group_message'||wwv_flow.LF||
'      , int_min = p_int_min'||wwv_flow.LF||
'      , int_';
wwv_flow_imp.g_varchar2_table(1298) := 'max = p_int_max'||wwv_flow.LF||
'      , build_option_name = p_build_option_name'||wwv_flow.LF||
'      , build_option_status = p_bu';
wwv_flow_imp.g_varchar2_table(1299) := 'ild_option_status'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end settings_merge;'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1300) := '-------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1301) := '-------------'||wwv_flow.LF||
'  procedure features_merge('||wwv_flow.LF||
'    p_build_option_name       in varchar2,'||wwv_flow.LF||
'    p_is_act';
wwv_flow_imp.g_varchar2_table(1302) := 'ive               in number,'||wwv_flow.LF||
'    p_display_seq             in number,'||wwv_flow.LF||
'    p_build_option_group    ';
wwv_flow_imp.g_varchar2_table(1303) := '  in varchar2,'||wwv_flow.LF||
'    p_build_option_parent     in varchar2 default null,'||wwv_flow.LF||
'    p_ref_build_option_name';
wwv_flow_imp.g_varchar2_table(1304) := '   in varchar2 default null,'||wwv_flow.LF||
'    p_ref_build_option_status in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  b';
wwv_flow_imp.g_varchar2_table(1305) := 'egin'||wwv_flow.LF||
''||wwv_flow.LF||
'    merge into blog_features'||wwv_flow.LF||
'    using dual'||wwv_flow.LF||
'    on( build_option_name = p_build_option_nam';
wwv_flow_imp.g_varchar2_table(1306) := 'e )'||wwv_flow.LF||
'    when not matched then'||wwv_flow.LF||
'      insert ( build_option_name, is_active, display_seq, build_opti';
wwv_flow_imp.g_varchar2_table(1307) := 'on_group, build_option_parent, ref_build_option_name, ref_build_option_status )'||wwv_flow.LF||
'        values( p_b';
wwv_flow_imp.g_varchar2_table(1308) := 'uild_option_name, p_is_active, p_display_seq, p_build_option_group, p_build_option_parent, p_ref_bui';
wwv_flow_imp.g_varchar2_table(1309) := 'ld_option_name, p_ref_build_option_status )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set'||wwv_flow.LF||
'        is_act';
wwv_flow_imp.g_varchar2_table(1310) := 'ive = p_is_active'||wwv_flow.LF||
'      , display_seq = p_display_seq'||wwv_flow.LF||
'      , build_option_group = p_build_option_';
wwv_flow_imp.g_varchar2_table(1311) := 'group'||wwv_flow.LF||
'      , build_option_parent = p_build_option_parent'||wwv_flow.LF||
'      , ref_build_option_name = p_ref_bu';
wwv_flow_imp.g_varchar2_table(1312) := 'ild_option_name'||wwv_flow.LF||
'      , ref_build_option_status = p_ref_build_option_status'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end feature';
wwv_flow_imp.g_varchar2_table(1313) := 's_merge;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(1314) := '------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure list_of_values';
wwv_flow_imp.g_varchar2_table(1315) := '_ins('||wwv_flow.LF||
'    p_is_active       in number,'||wwv_flow.LF||
'    p_display_seq     in number,'||wwv_flow.LF||
'    p_lov_name        in ';
wwv_flow_imp.g_varchar2_table(1316) := 'varchar2,'||wwv_flow.LF||
'    p_return_value    in varchar2,'||wwv_flow.LF||
'    p_display_message in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin';
wwv_flow_imp.g_varchar2_table(1317) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    insert into blog_list_of_values( is_active, display_seq, lov_name, return_value, display_mes';
wwv_flow_imp.g_varchar2_table(1318) := 'sage )'||wwv_flow.LF||
'      values( p_is_active, p_display_seq, p_lov_name, p_return_value, p_display_message )'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1319) := '   ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end list_of_values_ins;'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1320) := '---------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1321) := ' procedure init_items_ins'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    insert into blog_init_items(is_active, application_i';
wwv_flow_imp.g_varchar2_table(1322) := 'd, item_name)'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      1                 as is_active'||wwv_flow.LF||
'    , ai.application_id as applicat';
wwv_flow_imp.g_varchar2_table(1323) := 'ion_id'||wwv_flow.LF||
'    , ai.item_name      as item_name'||wwv_flow.LF||
'    from apex_application_items ai'||wwv_flow.LF||
'    join blog_sett';
wwv_flow_imp.g_varchar2_table(1324) := 'ings s'||wwv_flow.LF||
'      on ai.item_name = s.attribute_name'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'        select';
wwv_flow_imp.g_varchar2_table(1325) := ' 1'||wwv_flow.LF||
'        from blog_settings x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.attribute_name in( ''G_ADMIN';
wwv_flow_imp.g_varchar2_table(1326) := '_APP_ID'', ''G_PUB_APP_ID'' )'||wwv_flow.LF||
'          and to_number( x1.attribute_value ) = ai.application_id'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(1327) := ' )'||wwv_flow.LF||
'    union all'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      1                 as is_active'||wwv_flow.LF||
'    , pi.application_id as appl';
wwv_flow_imp.g_varchar2_table(1328) := 'ication_id'||wwv_flow.LF||
'    , pi.item_name      as item_name'||wwv_flow.LF||
'    from apex_application_page_items pi'||wwv_flow.LF||
'    join ';
wwv_flow_imp.g_varchar2_table(1329) := 'blog_settings s'||wwv_flow.LF||
'      on pi.item_name = s.attribute_name'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(1330) := '   select 1'||wwv_flow.LF||
'        from blog_settings x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.attribute_name in(';
wwv_flow_imp.g_varchar2_table(1331) := ' ''G_ADMIN_APP_ID'', ''G_PUB_APP_ID'' )'||wwv_flow.LF||
'          and to_number( x1.attribute_value ) = pi.application_';
wwv_flow_imp.g_varchar2_table(1332) := 'id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    order by 2, 3'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end init_items_ins;'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(1333) := '--------------------------------------------'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1334) := '--------------------------'||wwv_flow.LF||
'end "BLOG_INSTALL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_MIME"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1335) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(1336) := '--------------------------------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1337) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(1338) := '--------------------------------------------------------------'||wwv_flow.LF||
'  type str_t is table of varchar2( 2';
wwv_flow_imp.g_varchar2_table(1339) := '56 ) index by varchar2( 20 );'||wwv_flow.LF||
'  mime_t str_t;'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1340) := '----------------------------'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1341) := '----------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1342) := '-----------------------------'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1343) := '-----------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1344) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Global proc';
wwv_flow_imp.g_varchar2_table(1345) := 'edures and functions'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1346) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get';
wwv_flow_imp.g_varchar2_table(1347) := '_mime_type('||wwv_flow.LF||
'    p_file_name in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_mime_type	varchar2(2000);';
wwv_flow_imp.g_varchar2_table(1348) := ''||wwv_flow.LF||
'    l_extension varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_extension := lower( apex_string_util.get_file_ex';
wwv_flow_imp.g_varchar2_table(1349) := 'tension( ''.'' || p_file_name ) );'||wwv_flow.LF||
'    l_mime_type := g_default_mime;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if mime_t.exists( l_exte';
wwv_flow_imp.g_varchar2_table(1350) := 'nsion )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_mime_type := lower( mime_t( l_extension ) );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l';
wwv_flow_imp.g_varchar2_table(1351) := '_mime_type;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_mime_type;'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1352) := '-----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1353) := ''||wwv_flow.LF||
'-- Package initialization'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1354) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1355) := ''||wwv_flow.LF||
'  mime_t(''ez'') := ''application/andrew-inset'';'||wwv_flow.LF||
'  mime_t(''aw'') := ''application/applixware'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1356) := 't(''atom'') := ''application/atom+xml'';'||wwv_flow.LF||
'  mime_t(''atomcat'') := ''application/atomcat+xml'';'||wwv_flow.LF||
'  mime_t(''a';
wwv_flow_imp.g_varchar2_table(1357) := 'tomsvc'') := ''application/atomsvc+xml'';'||wwv_flow.LF||
'  mime_t(''ccxml'') := ''application/ccxml+xml'';'||wwv_flow.LF||
'  mime_t(''cdm';
wwv_flow_imp.g_varchar2_table(1358) := 'ia'') := ''application/cdmi-capability'';'||wwv_flow.LF||
'  mime_t(''cdmic'') := ''application/cdmi-container'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1359) := '(''cdmid'') := ''application/cdmi-domain'';'||wwv_flow.LF||
'  mime_t(''cdmio'') := ''application/cdmi-object'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1360) := 'cdmiq'') := ''application/cdmi-queue'';'||wwv_flow.LF||
'  mime_t(''cu'') := ''application/cu-seeme'';'||wwv_flow.LF||
'  mime_t(''davmount''';
wwv_flow_imp.g_varchar2_table(1361) := ') := ''application/davmount+xml'';'||wwv_flow.LF||
'  mime_t(''dbk'') := ''application/docbook+xml'';'||wwv_flow.LF||
'  mime_t(''dssc'') :=';
wwv_flow_imp.g_varchar2_table(1362) := ' ''application/dssc+der'';'||wwv_flow.LF||
'  mime_t(''xdssc'') := ''application/dssc+xml'';'||wwv_flow.LF||
'  mime_t(''ecma'') := ''applica';
wwv_flow_imp.g_varchar2_table(1363) := 'tion/ecmascript'';'||wwv_flow.LF||
'  mime_t(''emma'') := ''application/emma+xml'';'||wwv_flow.LF||
'  mime_t(''epub'') := ''application/epu';
wwv_flow_imp.g_varchar2_table(1364) := 'b+zip'';'||wwv_flow.LF||
'  mime_t(''exi'') := ''application/exi'';'||wwv_flow.LF||
'  mime_t(''pfr'') := ''application/font-tdpfr'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1365) := '_t(''gml'') := ''application/gml+xml'';'||wwv_flow.LF||
'  mime_t(''gpx'') := ''application/gpx+xml'';'||wwv_flow.LF||
'  mime_t(''gxf'') := ''';
wwv_flow_imp.g_varchar2_table(1366) := 'application/gxf'';'||wwv_flow.LF||
'  mime_t(''stk'') := ''application/hyperstudio'';'||wwv_flow.LF||
'  mime_t(''ink'') := ''application/in';
wwv_flow_imp.g_varchar2_table(1367) := 'kml+xml'';'||wwv_flow.LF||
'  mime_t(''inkml'') := ''application/inkml+xml'';'||wwv_flow.LF||
'  mime_t(''ipfix'') := ''application/ipfix'';';
wwv_flow_imp.g_varchar2_table(1368) := ''||wwv_flow.LF||
'  mime_t(''jar'') := ''application/java-archive'';'||wwv_flow.LF||
'  mime_t(''ser'') := ''application/java-serialized-obj';
wwv_flow_imp.g_varchar2_table(1369) := 'ect'';'||wwv_flow.LF||
'  mime_t(''class'') := ''application/java-vm'';'||wwv_flow.LF||
'  mime_t(''json'') := ''application/json'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1370) := 't(''jsonml'') := ''application/jsonml+json'';'||wwv_flow.LF||
'  mime_t(''lostxml'') := ''application/lost+xml'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1371) := '''hqx'') := ''application/mac-binhex40'';'||wwv_flow.LF||
'  mime_t(''cpt'') := ''application/mac-compactpro'';'||wwv_flow.LF||
'  mime_t(''m';
wwv_flow_imp.g_varchar2_table(1372) := 'ads'') := ''application/mads+xml'';'||wwv_flow.LF||
'  mime_t(''mrc'') := ''application/marc'';'||wwv_flow.LF||
'  mime_t(''mrcx'') := ''appli';
wwv_flow_imp.g_varchar2_table(1373) := 'cation/marcxml+xml'';'||wwv_flow.LF||
'  mime_t(''ma'') := ''application/mathematica'';'||wwv_flow.LF||
'  mime_t(''nb'') := ''application/m';
wwv_flow_imp.g_varchar2_table(1374) := 'athematica'';'||wwv_flow.LF||
'  mime_t(''mb'') := ''application/mathematica'';'||wwv_flow.LF||
'  mime_t(''mathml'') := ''application/mathm';
wwv_flow_imp.g_varchar2_table(1375) := 'l+xml'';'||wwv_flow.LF||
'  mime_t(''mbox'') := ''application/mbox'';'||wwv_flow.LF||
'  mime_t(''mscml'') := ''application/mediaservercontr';
wwv_flow_imp.g_varchar2_table(1376) := 'ol+xml'';'||wwv_flow.LF||
'  mime_t(''metalink'') := ''application/metalink+xml'';'||wwv_flow.LF||
'  mime_t(''meta4'') := ''application/met';
wwv_flow_imp.g_varchar2_table(1377) := 'alink4+xml'';'||wwv_flow.LF||
'  mime_t(''mets'') := ''application/mets+xml'';'||wwv_flow.LF||
'  mime_t(''mods'') := ''application/mods+xml';
wwv_flow_imp.g_varchar2_table(1378) := ''';'||wwv_flow.LF||
'  mime_t(''m21'') := ''application/mp21'';'||wwv_flow.LF||
'  mime_t(''mp21'') := ''application/mp21'';'||wwv_flow.LF||
'  mime_t(''mp4s''';
wwv_flow_imp.g_varchar2_table(1379) := ') := ''application/mp4'';'||wwv_flow.LF||
'  mime_t(''doc'') := ''application/msword'';'||wwv_flow.LF||
'  mime_t(''dot'') := ''application/m';
wwv_flow_imp.g_varchar2_table(1380) := 'sword'';'||wwv_flow.LF||
'  mime_t(''mxf'') := ''application/mxf'';'||wwv_flow.LF||
'  mime_t(''oda'') := ''application/oda'';'||wwv_flow.LF||
'  mime_t(''opf';
wwv_flow_imp.g_varchar2_table(1381) := ''') := ''application/oebps-package+xml'';'||wwv_flow.LF||
'  mime_t(''ogx'') := ''application/ogg'';'||wwv_flow.LF||
'  mime_t(''omdoc'') := ';
wwv_flow_imp.g_varchar2_table(1382) := '''application/omdoc+xml'';'||wwv_flow.LF||
'  mime_t(''onetoc'') := ''application/onenote'';'||wwv_flow.LF||
'  mime_t(''onetoc2'') := ''appl';
wwv_flow_imp.g_varchar2_table(1383) := 'ication/onenote'';'||wwv_flow.LF||
'  mime_t(''onetmp'') := ''application/onenote'';'||wwv_flow.LF||
'  mime_t(''onepkg'') := ''application/';
wwv_flow_imp.g_varchar2_table(1384) := 'onenote'';'||wwv_flow.LF||
'  mime_t(''oxps'') := ''application/oxps'';'||wwv_flow.LF||
'  mime_t(''xer'') := ''application/patch-ops-error+';
wwv_flow_imp.g_varchar2_table(1385) := 'xml'';'||wwv_flow.LF||
'  mime_t(''pdf'') := ''application/pdf'';'||wwv_flow.LF||
'  mime_t(''pgp'') := ''application/pgp-encrypted'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1386) := 'e_t(''asc'') := ''application/pgp-signature'';'||wwv_flow.LF||
'  mime_t(''sig'') := ''application/pgp-signature'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1387) := 't(''prf'') := ''application/pics-rules'';'||wwv_flow.LF||
'  mime_t(''p10'') := ''application/pkcs10'';'||wwv_flow.LF||
'  mime_t(''p7m'') := ';
wwv_flow_imp.g_varchar2_table(1388) := '''application/pkcs7-mime'';'||wwv_flow.LF||
'  mime_t(''p7c'') := ''application/pkcs7-mime'';'||wwv_flow.LF||
'  mime_t(''p7s'') := ''applica';
wwv_flow_imp.g_varchar2_table(1389) := 'tion/pkcs7-signature'';'||wwv_flow.LF||
'  mime_t(''p8'') := ''application/pkcs8'';'||wwv_flow.LF||
'  mime_t(''ac'') := ''application/pkix-';
wwv_flow_imp.g_varchar2_table(1390) := 'attr-cert'';'||wwv_flow.LF||
'  mime_t(''cer'') := ''application/pkix-cert'';'||wwv_flow.LF||
'  mime_t(''crl'') := ''application/pkix-crl'';';
wwv_flow_imp.g_varchar2_table(1391) := ''||wwv_flow.LF||
'  mime_t(''pkipath'') := ''application/pkix-pkipath'';'||wwv_flow.LF||
'  mime_t(''pki'') := ''application/pkixcmp'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1392) := 'ime_t(''pls'') := ''application/pls+xml'';'||wwv_flow.LF||
'  mime_t(''ai'') := ''application/postscript'';'||wwv_flow.LF||
'  mime_t(''eps'')';
wwv_flow_imp.g_varchar2_table(1393) := ' := ''application/postscript'';'||wwv_flow.LF||
'  mime_t(''ps'') := ''application/postscript'';'||wwv_flow.LF||
'  mime_t(''cww'') := ''appl';
wwv_flow_imp.g_varchar2_table(1394) := 'ication/prs.cww'';'||wwv_flow.LF||
'  mime_t(''pskcxml'') := ''application/pskc+xml'';'||wwv_flow.LF||
'  mime_t(''rdf'') := ''application/r';
wwv_flow_imp.g_varchar2_table(1395) := 'df+xml'';'||wwv_flow.LF||
'  mime_t(''rif'') := ''application/reginfo+xml'';'||wwv_flow.LF||
'  mime_t(''rnc'') := ''application/relax-ng-co';
wwv_flow_imp.g_varchar2_table(1396) := 'mpact-syntax'';'||wwv_flow.LF||
'  mime_t(''rl'') := ''application/resource-lists+xml'';'||wwv_flow.LF||
'  mime_t(''rld'') := ''application';
wwv_flow_imp.g_varchar2_table(1397) := '/resource-lists-diff+xml'';'||wwv_flow.LF||
'  mime_t(''rs'') := ''application/rls-services+xml'';'||wwv_flow.LF||
'  mime_t(''gbr'') := ''a';
wwv_flow_imp.g_varchar2_table(1398) := 'pplication/rpki-ghostbusters'';'||wwv_flow.LF||
'  mime_t(''mft'') := ''application/rpki-manifest'';'||wwv_flow.LF||
'  mime_t(''roa'') := ';
wwv_flow_imp.g_varchar2_table(1399) := '''application/rpki-roa'';'||wwv_flow.LF||
'  mime_t(''rsd'') := ''application/rsd+xml'';'||wwv_flow.LF||
'  mime_t(''rss'') := ''application/';
wwv_flow_imp.g_varchar2_table(1400) := 'rss+xml'';'||wwv_flow.LF||
'  mime_t(''rtf'') := ''application/rtf'';'||wwv_flow.LF||
'  mime_t(''sbml'') := ''application/sbml+xml'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1401) := 'e_t(''scq'') := ''application/scvp-cv-request'';'||wwv_flow.LF||
'  mime_t(''scs'') := ''application/scvp-cv-response'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1402) := 'mime_t(''spq'') := ''application/scvp-vp-request'';'||wwv_flow.LF||
'  mime_t(''spp'') := ''application/scvp-vp-response'';';
wwv_flow_imp.g_varchar2_table(1403) := ''||wwv_flow.LF||
'  mime_t(''sdp'') := ''application/sdp'';'||wwv_flow.LF||
'  mime_t(''setpay'') := ''application/set-payment-initiation'';';
wwv_flow_imp.g_varchar2_table(1404) := ''||wwv_flow.LF||
'  mime_t(''setreg'') := ''application/set-registration-initiation'';'||wwv_flow.LF||
'  mime_t(''shf'') := ''application/s';
wwv_flow_imp.g_varchar2_table(1405) := 'hf+xml'';'||wwv_flow.LF||
'  mime_t(''smi'') := ''application/smil+xml'';'||wwv_flow.LF||
'  mime_t(''smil'') := ''application/smil+xml'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1406) := ' mime_t(''rq'') := ''application/sparql-query'';'||wwv_flow.LF||
'  mime_t(''srx'') := ''application/sparql-results+xml'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1407) := '  mime_t(''gram'') := ''application/srgs'';'||wwv_flow.LF||
'  mime_t(''grxml'') := ''application/srgs+xml'';'||wwv_flow.LF||
'  mime_t(''sru';
wwv_flow_imp.g_varchar2_table(1408) := ''') := ''application/sru+xml'';'||wwv_flow.LF||
'  mime_t(''ssdl'') := ''application/ssdl+xml'';'||wwv_flow.LF||
'  mime_t(''ssml'') := ''appl';
wwv_flow_imp.g_varchar2_table(1409) := 'ication/ssml+xml'';'||wwv_flow.LF||
'  mime_t(''tei'') := ''application/tei+xml'';'||wwv_flow.LF||
'  mime_t(''teicorpus'') := ''application';
wwv_flow_imp.g_varchar2_table(1410) := '/tei+xml'';'||wwv_flow.LF||
'  mime_t(''tfi'') := ''application/thraud+xml'';'||wwv_flow.LF||
'  mime_t(''tsd'') := ''application/timestampe';
wwv_flow_imp.g_varchar2_table(1411) := 'd-data'';'||wwv_flow.LF||
'  mime_t(''plb'') := ''application/vnd.3gpp.pic-bw-large'';'||wwv_flow.LF||
'  mime_t(''psb'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1412) := 'nd.3gpp.pic-bw-small'';'||wwv_flow.LF||
'  mime_t(''pvb'') := ''application/vnd.3gpp.pic-bw-var'';'||wwv_flow.LF||
'  mime_t(''tcap'') := ''';
wwv_flow_imp.g_varchar2_table(1413) := 'application/vnd.3gpp2.tcap'';'||wwv_flow.LF||
'  mime_t(''pwn'') := ''application/vnd.3m.post-it-notes'';'||wwv_flow.LF||
'  mime_t(''aso''';
wwv_flow_imp.g_varchar2_table(1414) := ') := ''application/vnd.accpac.simply.aso'';'||wwv_flow.LF||
'  mime_t(''imp'') := ''application/vnd.accpac.simply.imp'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1415) := '  mime_t(''acu'') := ''application/vnd.acucobol'';'||wwv_flow.LF||
'  mime_t(''atc'') := ''application/vnd.acucorp'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1416) := 'e_t(''acutc'') := ''application/vnd.acucorp'';'||wwv_flow.LF||
'  mime_t(''air'') := ''application/vnd.adobe.air-applicatio';
wwv_flow_imp.g_varchar2_table(1417) := 'n-installer-package+zip'';'||wwv_flow.LF||
'  mime_t(''fcdt'') := ''application/vnd.adobe.formscentral.fcdt'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1418) := '''fxp'') := ''application/vnd.adobe.fxp'';'||wwv_flow.LF||
'  mime_t(''fxpl'') := ''application/vnd.adobe.fxp'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1419) := 'xdp'') := ''application/vnd.adobe.xdp+xml'';'||wwv_flow.LF||
'  mime_t(''xfdf'') := ''application/vnd.adobe.xfdf'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1420) := '_t(''ahead'') := ''application/vnd.ahead.space'';'||wwv_flow.LF||
'  mime_t(''azf'') := ''application/vnd.airzip.filesecure';
wwv_flow_imp.g_varchar2_table(1421) := '.azf'';'||wwv_flow.LF||
'  mime_t(''azs'') := ''application/vnd.airzip.filesecure.azs'';'||wwv_flow.LF||
'  mime_t(''azw'') := ''application';
wwv_flow_imp.g_varchar2_table(1422) := '/vnd.amazon.ebook'';'||wwv_flow.LF||
'  mime_t(''acc'') := ''application/vnd.americandynamics.acc'';'||wwv_flow.LF||
'  mime_t(''ami'') := ';
wwv_flow_imp.g_varchar2_table(1423) := '''application/vnd.amiga.ami'';'||wwv_flow.LF||
'  mime_t(''apk'') := ''application/vnd.android.package-archive'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1424) := 't(''cii'') := ''application/vnd.anser-web-certificate-issue-initiation'';'||wwv_flow.LF||
'  mime_t(''fti'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1425) := 'on/vnd.anser-web-funds-transfer-initiation'';'||wwv_flow.LF||
'  mime_t(''atx'') := ''application/vnd.antix.game-compone';
wwv_flow_imp.g_varchar2_table(1426) := 'nt'';'||wwv_flow.LF||
'  mime_t(''mpkg'') := ''application/vnd.apple.installer+xml'';'||wwv_flow.LF||
'  mime_t(''m3u8'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1427) := 'nd.apple.mpegurl'';'||wwv_flow.LF||
'  mime_t(''swi'') := ''application/vnd.aristanetworks.swi'';'||wwv_flow.LF||
'  mime_t(''iota'') := ''a';
wwv_flow_imp.g_varchar2_table(1428) := 'pplication/vnd.astraea-software.iota'';'||wwv_flow.LF||
'  mime_t(''aep'') := ''application/vnd.audiograph'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1429) := 'mpm'') := ''application/vnd.blueice.multipass'';'||wwv_flow.LF||
'  mime_t(''bmi'') := ''application/vnd.bmi'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1430) := 'rep'') := ''application/vnd.businessobjects'';'||wwv_flow.LF||
'  mime_t(''cdxml'') := ''application/vnd.chemdraw+xml'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1431) := ' mime_t(''mmd'') := ''application/vnd.chipnuts.karaoke-mmd'';'||wwv_flow.LF||
'  mime_t(''cdy'') := ''application/vnd.cinde';
wwv_flow_imp.g_varchar2_table(1432) := 'rella'';'||wwv_flow.LF||
'  mime_t(''cla'') := ''application/vnd.claymore'';'||wwv_flow.LF||
'  mime_t(''rp9'') := ''application/vnd.cloanto';
wwv_flow_imp.g_varchar2_table(1433) := '.rp9'';'||wwv_flow.LF||
'  mime_t(''c4g'') := ''application/vnd.clonk.c4group'';'||wwv_flow.LF||
'  mime_t(''c4d'') := ''application/vnd.clo';
wwv_flow_imp.g_varchar2_table(1434) := 'nk.c4group'';'||wwv_flow.LF||
'  mime_t(''c4f'') := ''application/vnd.clonk.c4group'';'||wwv_flow.LF||
'  mime_t(''c4p'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1435) := 'nd.clonk.c4group'';'||wwv_flow.LF||
'  mime_t(''c4u'') := ''application/vnd.clonk.c4group'';'||wwv_flow.LF||
'  mime_t(''c11amc'') := ''appl';
wwv_flow_imp.g_varchar2_table(1436) := 'ication/vnd.cluetrust.cartomobile-config'';'||wwv_flow.LF||
'  mime_t(''c11amz'') := ''application/vnd.cluetrust.cartomo';
wwv_flow_imp.g_varchar2_table(1437) := 'bile-config-pkg'';'||wwv_flow.LF||
'  mime_t(''csp'') := ''application/vnd.commonspace'';'||wwv_flow.LF||
'  mime_t(''cdbcmsg'') := ''applic';
wwv_flow_imp.g_varchar2_table(1438) := 'ation/vnd.contact.cmsg'';'||wwv_flow.LF||
'  mime_t(''cmc'') := ''application/vnd.cosmocaller'';'||wwv_flow.LF||
'  mime_t(''clkx'') := ''ap';
wwv_flow_imp.g_varchar2_table(1439) := 'plication/vnd.crick.clicker'';'||wwv_flow.LF||
'  mime_t(''clkk'') := ''application/vnd.crick.clicker.keyboard'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1440) := '_t(''clkp'') := ''application/vnd.crick.clicker.palette'';'||wwv_flow.LF||
'  mime_t(''clkt'') := ''application/vnd.crick.c';
wwv_flow_imp.g_varchar2_table(1441) := 'licker.template'';'||wwv_flow.LF||
'  mime_t(''clkw'') := ''application/vnd.crick.clicker.wordbank'';'||wwv_flow.LF||
'  mime_t(''wbs'') :=';
wwv_flow_imp.g_varchar2_table(1442) := ' ''application/vnd.criticaltools.wbs+xml'';'||wwv_flow.LF||
'  mime_t(''pml'') := ''application/vnd.ctc-posml'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1443) := '(''ppd'') := ''application/vnd.cups-ppd'';'||wwv_flow.LF||
'  mime_t(''car'') := ''application/vnd.curl.car'';'||wwv_flow.LF||
'  mime_t(''pc';
wwv_flow_imp.g_varchar2_table(1444) := 'url'') := ''application/vnd.curl.pcurl'';'||wwv_flow.LF||
'  mime_t(''dart'') := ''application/vnd.dart'';'||wwv_flow.LF||
'  mime_t(''rdz'')';
wwv_flow_imp.g_varchar2_table(1445) := ' := ''application/vnd.data-vision.rdz'';'||wwv_flow.LF||
'  mime_t(''uvf'') := ''application/vnd.dece.data'';'||wwv_flow.LF||
'  mime_t(''u';
wwv_flow_imp.g_varchar2_table(1446) := 'vvf'') := ''application/vnd.dece.data'';'||wwv_flow.LF||
'  mime_t(''uvd'') := ''application/vnd.dece.data'';'||wwv_flow.LF||
'  mime_t(''uv';
wwv_flow_imp.g_varchar2_table(1447) := 'vd'') := ''application/vnd.dece.data'';'||wwv_flow.LF||
'  mime_t(''uvt'') := ''application/vnd.dece.ttml+xml'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1448) := '''uvvt'') := ''application/vnd.dece.ttml+xml'';'||wwv_flow.LF||
'  mime_t(''uvx'') := ''application/vnd.dece.unspecified'';';
wwv_flow_imp.g_varchar2_table(1449) := ''||wwv_flow.LF||
'  mime_t(''uvvx'') := ''application/vnd.dece.unspecified'';'||wwv_flow.LF||
'  mime_t(''uvz'') := ''application/vnd.dece.z';
wwv_flow_imp.g_varchar2_table(1450) := 'ip'';'||wwv_flow.LF||
'  mime_t(''uvvz'') := ''application/vnd.dece.zip'';'||wwv_flow.LF||
'  mime_t(''fe_launch'') := ''application/vnd.den';
wwv_flow_imp.g_varchar2_table(1451) := 'ovo.fcselayout-link'';'||wwv_flow.LF||
'  mime_t(''dna'') := ''application/vnd.dna'';'||wwv_flow.LF||
'  mime_t(''mlp'') := ''application/vn';
wwv_flow_imp.g_varchar2_table(1452) := 'd.dolby.mlp'';'||wwv_flow.LF||
'  mime_t(''dpg'') := ''application/vnd.dpgraph'';'||wwv_flow.LF||
'  mime_t(''dfac'') := ''application/vnd.d';
wwv_flow_imp.g_varchar2_table(1453) := 'reamfactory'';'||wwv_flow.LF||
'  mime_t(''kpxx'') := ''application/vnd.ds-keypoint'';'||wwv_flow.LF||
'  mime_t(''ait'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1454) := 'nd.dvb.ait'';'||wwv_flow.LF||
'  mime_t(''svc'') := ''application/vnd.dvb.service'';'||wwv_flow.LF||
'  mime_t(''geo'') := ''application/vnd';
wwv_flow_imp.g_varchar2_table(1455) := '.dynageo'';'||wwv_flow.LF||
'  mime_t(''mag'') := ''application/vnd.ecowin.chart'';'||wwv_flow.LF||
'  mime_t(''nml'') := ''application/vnd.';
wwv_flow_imp.g_varchar2_table(1456) := 'enliven'';'||wwv_flow.LF||
'  mime_t(''esf'') := ''application/vnd.epson.esf'';'||wwv_flow.LF||
'  mime_t(''msf'') := ''application/vnd.epso';
wwv_flow_imp.g_varchar2_table(1457) := 'n.msf'';'||wwv_flow.LF||
'  mime_t(''qam'') := ''application/vnd.epson.quickanime'';'||wwv_flow.LF||
'  mime_t(''slt'') := ''application/vnd';
wwv_flow_imp.g_varchar2_table(1458) := '.epson.salt'';'||wwv_flow.LF||
'  mime_t(''ssf'') := ''application/vnd.epson.ssf'';'||wwv_flow.LF||
'  mime_t(''es3'') := ''application/vnd.';
wwv_flow_imp.g_varchar2_table(1459) := 'eszigno3+xml'';'||wwv_flow.LF||
'  mime_t(''et3'') := ''application/vnd.eszigno3+xml'';'||wwv_flow.LF||
'  mime_t(''ez2'') := ''application/';
wwv_flow_imp.g_varchar2_table(1460) := 'vnd.ezpix-album'';'||wwv_flow.LF||
'  mime_t(''ez3'') := ''application/vnd.ezpix-package'';'||wwv_flow.LF||
'  mime_t(''fdf'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1461) := 'ion/vnd.fdf'';'||wwv_flow.LF||
'  mime_t(''mseed'') := ''application/vnd.fdsn.mseed'';'||wwv_flow.LF||
'  mime_t(''seed'') := ''application/';
wwv_flow_imp.g_varchar2_table(1462) := 'vnd.fdsn.seed'';'||wwv_flow.LF||
'  mime_t(''dataless'') := ''application/vnd.fdsn.seed'';'||wwv_flow.LF||
'  mime_t(''gph'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1463) := 'on/vnd.flographit'';'||wwv_flow.LF||
'  mime_t(''ftc'') := ''application/vnd.fluxtime.clip'';'||wwv_flow.LF||
'  mime_t(''fm'') := ''applica';
wwv_flow_imp.g_varchar2_table(1464) := 'tion/vnd.framemaker'';'||wwv_flow.LF||
'  mime_t(''frame'') := ''application/vnd.framemaker'';'||wwv_flow.LF||
'  mime_t(''maker'') := ''app';
wwv_flow_imp.g_varchar2_table(1465) := 'lication/vnd.framemaker'';'||wwv_flow.LF||
'  mime_t(''book'') := ''application/vnd.framemaker'';'||wwv_flow.LF||
'  mime_t(''fnc'') := ''ap';
wwv_flow_imp.g_varchar2_table(1466) := 'plication/vnd.frogans.fnc'';'||wwv_flow.LF||
'  mime_t(''ltf'') := ''application/vnd.frogans.ltf'';'||wwv_flow.LF||
'  mime_t(''fsc'') := ''';
wwv_flow_imp.g_varchar2_table(1467) := 'application/vnd.fsc.weblaunch'';'||wwv_flow.LF||
'  mime_t(''oas'') := ''application/vnd.fujitsu.oasys'';'||wwv_flow.LF||
'  mime_t(''oa2''';
wwv_flow_imp.g_varchar2_table(1468) := ') := ''application/vnd.fujitsu.oasys2'';'||wwv_flow.LF||
'  mime_t(''oa3'') := ''application/vnd.fujitsu.oasys3'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1469) := '_t(''fg5'') := ''application/vnd.fujitsu.oasysgp'';'||wwv_flow.LF||
'  mime_t(''bh2'') := ''application/vnd.fujitsu.oasyspr';
wwv_flow_imp.g_varchar2_table(1470) := 's'';'||wwv_flow.LF||
'  mime_t(''ddd'') := ''application/vnd.fujixerox.ddd'';'||wwv_flow.LF||
'  mime_t(''xdw'') := ''application/vnd.fujixe';
wwv_flow_imp.g_varchar2_table(1471) := 'rox.docuworks'';'||wwv_flow.LF||
'  mime_t(''xbd'') := ''application/vnd.fujixerox.docuworks.binder'';'||wwv_flow.LF||
'  mime_t(''fzs'') :';
wwv_flow_imp.g_varchar2_table(1472) := '= ''application/vnd.fuzzysheet'';'||wwv_flow.LF||
'  mime_t(''txd'') := ''application/vnd.genomatix.tuxedo'';'||wwv_flow.LF||
'  mime_t(''g';
wwv_flow_imp.g_varchar2_table(1473) := 'gb'') := ''application/vnd.geogebra.file'';'||wwv_flow.LF||
'  mime_t(''ggs'') := ''application/vnd.geogebra.slides'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1474) := 'ime_t(''ggt'') := ''application/vnd.geogebra.tool'';'||wwv_flow.LF||
'  mime_t(''gex'') := ''application/vnd.geometry-explo';
wwv_flow_imp.g_varchar2_table(1475) := 'rer'';'||wwv_flow.LF||
'  mime_t(''gre'') := ''application/vnd.geometry-explorer'';'||wwv_flow.LF||
'  mime_t(''gxt'') := ''application/vnd.';
wwv_flow_imp.g_varchar2_table(1476) := 'geonext'';'||wwv_flow.LF||
'  mime_t(''g2w'') := ''application/vnd.geoplan'';'||wwv_flow.LF||
'  mime_t(''g3w'') := ''application/vnd.geospa';
wwv_flow_imp.g_varchar2_table(1477) := 'ce'';'||wwv_flow.LF||
'  mime_t(''gmx'') := ''application/vnd.gmx'';'||wwv_flow.LF||
'  mime_t(''kml'') := ''application/vnd.google-earth.km';
wwv_flow_imp.g_varchar2_table(1478) := 'l+xml'';'||wwv_flow.LF||
'  mime_t(''kmz'') := ''application/vnd.google-earth.kmz'';'||wwv_flow.LF||
'  mime_t(''gqf'') := ''application/vnd';
wwv_flow_imp.g_varchar2_table(1479) := '.grafeq'';'||wwv_flow.LF||
'  mime_t(''gqs'') := ''application/vnd.grafeq'';'||wwv_flow.LF||
'  mime_t(''gac'') := ''application/vnd.groove-';
wwv_flow_imp.g_varchar2_table(1480) := 'account'';'||wwv_flow.LF||
'  mime_t(''ghf'') := ''application/vnd.groove-help'';'||wwv_flow.LF||
'  mime_t(''gim'') := ''application/vnd.gr';
wwv_flow_imp.g_varchar2_table(1481) := 'oove-identity-message'';'||wwv_flow.LF||
'  mime_t(''grv'') := ''application/vnd.groove-injector'';'||wwv_flow.LF||
'  mime_t(''gtm'') := ''';
wwv_flow_imp.g_varchar2_table(1482) := 'application/vnd.groove-tool-message'';'||wwv_flow.LF||
'  mime_t(''tpl'') := ''application/vnd.groove-tool-template'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1483) := ' mime_t(''vcg'') := ''application/vnd.groove-vcard'';'||wwv_flow.LF||
'  mime_t(''hal'') := ''application/vnd.hal+xml'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1484) := 'mime_t(''zmm'') := ''application/vnd.handheld-entertainment+xml'';'||wwv_flow.LF||
'  mime_t(''hbci'') := ''application/vnd';
wwv_flow_imp.g_varchar2_table(1485) := '.hbci'';'||wwv_flow.LF||
'  mime_t(''les'') := ''application/vnd.hhe.lesson-player'';'||wwv_flow.LF||
'  mime_t(''hpgl'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1486) := 'nd.hp-hpgl'';'||wwv_flow.LF||
'  mime_t(''hpid'') := ''application/vnd.hp-hpid'';'||wwv_flow.LF||
'  mime_t(''hps'') := ''application/vnd.hp';
wwv_flow_imp.g_varchar2_table(1487) := '-hps'';'||wwv_flow.LF||
'  mime_t(''jlt'') := ''application/vnd.hp-jlyt'';'||wwv_flow.LF||
'  mime_t(''pcl'') := ''application/vnd.hp-pcl'';';
wwv_flow_imp.g_varchar2_table(1488) := ''||wwv_flow.LF||
'  mime_t(''pclxl'') := ''application/vnd.hp-pclxl'';'||wwv_flow.LF||
'  mime_t(''sfd-hdstx'') := ''application/vnd.hydrost';
wwv_flow_imp.g_varchar2_table(1489) := 'atix.sof-data'';'||wwv_flow.LF||
'  mime_t(''mpy'') := ''application/vnd.ibm.minipay'';'||wwv_flow.LF||
'  mime_t(''afp'') := ''application/';
wwv_flow_imp.g_varchar2_table(1490) := 'vnd.ibm.modcap'';'||wwv_flow.LF||
'  mime_t(''listafp'') := ''application/vnd.ibm.modcap'';'||wwv_flow.LF||
'  mime_t(''list3820'') := ''app';
wwv_flow_imp.g_varchar2_table(1491) := 'lication/vnd.ibm.modcap'';'||wwv_flow.LF||
'  mime_t(''irm'') := ''application/vnd.ibm.rights-management'';'||wwv_flow.LF||
'  mime_t(''sc';
wwv_flow_imp.g_varchar2_table(1492) := ''') := ''application/vnd.ibm.secure-container'';'||wwv_flow.LF||
'  mime_t(''icc'') := ''application/vnd.iccprofile'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1493) := 'ime_t(''icm'') := ''application/vnd.iccprofile'';'||wwv_flow.LF||
'  mime_t(''igl'') := ''application/vnd.igloader'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1494) := 'e_t(''ivp'') := ''application/vnd.immervision-ivp'';'||wwv_flow.LF||
'  mime_t(''ivu'') := ''application/vnd.immervision-iv';
wwv_flow_imp.g_varchar2_table(1495) := 'u'';'||wwv_flow.LF||
'  mime_t(''igm'') := ''application/vnd.insors.igm'';'||wwv_flow.LF||
'  mime_t(''xpw'') := ''application/vnd.intercon.';
wwv_flow_imp.g_varchar2_table(1496) := 'formnet'';'||wwv_flow.LF||
'  mime_t(''xpx'') := ''application/vnd.intercon.formnet'';'||wwv_flow.LF||
'  mime_t(''i2g'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1497) := 'nd.intergeo'';'||wwv_flow.LF||
'  mime_t(''qbo'') := ''application/vnd.intu.qbo'';'||wwv_flow.LF||
'  mime_t(''qfx'') := ''application/vnd.i';
wwv_flow_imp.g_varchar2_table(1498) := 'ntu.qfx'';'||wwv_flow.LF||
'  mime_t(''rcprofile'') := ''application/vnd.ipunplugged.rcprofile'';'||wwv_flow.LF||
'  mime_t(''irp'') := ''ap';
wwv_flow_imp.g_varchar2_table(1499) := 'plication/vnd.irepository.package+xml'';'||wwv_flow.LF||
'  mime_t(''xpr'') := ''application/vnd.is-xpr'';'||wwv_flow.LF||
'  mime_t(''fcs';
wwv_flow_imp.g_varchar2_table(1500) := ''') := ''application/vnd.isac.fcs'';'||wwv_flow.LF||
'  mime_t(''jam'') := ''application/vnd.jam'';'||wwv_flow.LF||
'  mime_t(''rms'') := ''ap';
null;
end;
/
begin
wwv_flow_imp.g_varchar2_table(1501) := 'plication/vnd.jcp.javame.midlet-rms'';'||wwv_flow.LF||
'  mime_t(''jisp'') := ''application/vnd.jisp'';'||wwv_flow.LF||
'  mime_t(''joda'')';
wwv_flow_imp.g_varchar2_table(1502) := ' := ''application/vnd.joost.joda-archive'';'||wwv_flow.LF||
'  mime_t(''ktz'') := ''application/vnd.kahootz'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1503) := 'ktr'') := ''application/vnd.kahootz'';'||wwv_flow.LF||
'  mime_t(''karbon'') := ''application/vnd.kde.karbon'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1504) := 'chrt'') := ''application/vnd.kde.kchart'';'||wwv_flow.LF||
'  mime_t(''kfo'') := ''application/vnd.kde.kformula'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1505) := 't(''flw'') := ''application/vnd.kde.kivio'';'||wwv_flow.LF||
'  mime_t(''kon'') := ''application/vnd.kde.kontour'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1506) := 't(''kpr'') := ''application/vnd.kde.kpresenter'';'||wwv_flow.LF||
'  mime_t(''kpt'') := ''application/vnd.kde.kpresenter'';';
wwv_flow_imp.g_varchar2_table(1507) := ''||wwv_flow.LF||
'  mime_t(''ksp'') := ''application/vnd.kde.kspread'';'||wwv_flow.LF||
'  mime_t(''kwd'') := ''application/vnd.kde.kword'';';
wwv_flow_imp.g_varchar2_table(1508) := ''||wwv_flow.LF||
'  mime_t(''kwt'') := ''application/vnd.kde.kword'';'||wwv_flow.LF||
'  mime_t(''htke'') := ''application/vnd.kenameaapp'';';
wwv_flow_imp.g_varchar2_table(1509) := ''||wwv_flow.LF||
'  mime_t(''kia'') := ''application/vnd.kidspiration'';'||wwv_flow.LF||
'  mime_t(''kne'') := ''application/vnd.kinar'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1510) := 'mime_t(''knp'') := ''application/vnd.kinar'';'||wwv_flow.LF||
'  mime_t(''skp'') := ''application/vnd.koan'';'||wwv_flow.LF||
'  mime_t(''skd';
wwv_flow_imp.g_varchar2_table(1511) := ''') := ''application/vnd.koan'';'||wwv_flow.LF||
'  mime_t(''skt'') := ''application/vnd.koan'';'||wwv_flow.LF||
'  mime_t(''skm'') := ''appli';
wwv_flow_imp.g_varchar2_table(1512) := 'cation/vnd.koan'';'||wwv_flow.LF||
'  mime_t(''sse'') := ''application/vnd.kodak-descriptor'';'||wwv_flow.LF||
'  mime_t(''lasxml'') := ''ap';
wwv_flow_imp.g_varchar2_table(1513) := 'plication/vnd.las.las+xml'';'||wwv_flow.LF||
'  mime_t(''lbd'') := ''application/vnd.llamagraphics.life-balance.desktop''';
wwv_flow_imp.g_varchar2_table(1514) := ';'||wwv_flow.LF||
'  mime_t(''lbe'') := ''application/vnd.llamagraphics.life-balance.exchange+xml'';'||wwv_flow.LF||
'  mime_t(''123'') :=';
wwv_flow_imp.g_varchar2_table(1515) := ' ''application/vnd.lotus-1-2-3'';'||wwv_flow.LF||
'  mime_t(''apr'') := ''application/vnd.lotus-approach'';'||wwv_flow.LF||
'  mime_t(''pre';
wwv_flow_imp.g_varchar2_table(1516) := ''') := ''application/vnd.lotus-freelance'';'||wwv_flow.LF||
'  mime_t(''nsf'') := ''application/vnd.lotus-notes'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1517) := 't(''org'') := ''application/vnd.lotus-organizer'';'||wwv_flow.LF||
'  mime_t(''scm'') := ''application/vnd.lotus-screencam''';
wwv_flow_imp.g_varchar2_table(1518) := ';'||wwv_flow.LF||
'  mime_t(''lwp'') := ''application/vnd.lotus-wordpro'';'||wwv_flow.LF||
'  mime_t(''portpkg'') := ''application/vnd.macp';
wwv_flow_imp.g_varchar2_table(1519) := 'orts.portpkg'';'||wwv_flow.LF||
'  mime_t(''mcd'') := ''application/vnd.mcd'';'||wwv_flow.LF||
'  mime_t(''mc1'') := ''application/vnd.medca';
wwv_flow_imp.g_varchar2_table(1520) := 'lcdata'';'||wwv_flow.LF||
'  mime_t(''cdkey'') := ''application/vnd.mediastation.cdkey'';'||wwv_flow.LF||
'  mime_t(''mwf'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1521) := 'n/vnd.mfer'';'||wwv_flow.LF||
'  mime_t(''mfm'') := ''application/vnd.mfmp'';'||wwv_flow.LF||
'  mime_t(''flo'') := ''application/vnd.microg';
wwv_flow_imp.g_varchar2_table(1522) := 'rafx.flo'';'||wwv_flow.LF||
'  mime_t(''igx'') := ''application/vnd.micrografx.igx'';'||wwv_flow.LF||
'  mime_t(''mif'') := ''application/vn';
wwv_flow_imp.g_varchar2_table(1523) := 'd.mif'';'||wwv_flow.LF||
'  mime_t(''daf'') := ''application/vnd.mobius.daf'';'||wwv_flow.LF||
'  mime_t(''dis'') := ''application/vnd.mobiu';
wwv_flow_imp.g_varchar2_table(1524) := 's.dis'';'||wwv_flow.LF||
'  mime_t(''mbk'') := ''application/vnd.mobius.mbk'';'||wwv_flow.LF||
'  mime_t(''mqy'') := ''application/vnd.mobiu';
wwv_flow_imp.g_varchar2_table(1525) := 's.mqy'';'||wwv_flow.LF||
'  mime_t(''msl'') := ''application/vnd.mobius.msl'';'||wwv_flow.LF||
'  mime_t(''plc'') := ''application/vnd.mobiu';
wwv_flow_imp.g_varchar2_table(1526) := 's.plc'';'||wwv_flow.LF||
'  mime_t(''txf'') := ''application/vnd.mobius.txf'';'||wwv_flow.LF||
'  mime_t(''mpn'') := ''application/vnd.mophu';
wwv_flow_imp.g_varchar2_table(1527) := 'n.application'';'||wwv_flow.LF||
'  mime_t(''mpc'') := ''application/vnd.mophun.certificate'';'||wwv_flow.LF||
'  mime_t(''xul'') := ''appli';
wwv_flow_imp.g_varchar2_table(1528) := 'cation/vnd.mozilla.xul+xml'';'||wwv_flow.LF||
'  mime_t(''cil'') := ''application/vnd.ms-artgalry'';'||wwv_flow.LF||
'  mime_t(''cab'') := ';
wwv_flow_imp.g_varchar2_table(1529) := '''application/vnd.ms-cab-compressed'';'||wwv_flow.LF||
'  mime_t(''xls'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlm''';
wwv_flow_imp.g_varchar2_table(1530) := ') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xla'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlc'') :=';
wwv_flow_imp.g_varchar2_table(1531) := ' ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlt'') := ''application/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlw'') := ''ap';
wwv_flow_imp.g_varchar2_table(1532) := 'plication/vnd.ms-excel'';'||wwv_flow.LF||
'  mime_t(''xlam'') := ''application/vnd.ms-excel.addin.macroenabled.12'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1533) := 'ime_t(''xlsb'') := ''application/vnd.ms-excel.sheet.binary.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''xlsm'') := ''appl';
wwv_flow_imp.g_varchar2_table(1534) := 'ication/vnd.ms-excel.sheet.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''xltm'') := ''application/vnd.ms-excel.template';
wwv_flow_imp.g_varchar2_table(1535) := '.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''eot'') := ''application/vnd.ms-fontobject'';'||wwv_flow.LF||
'  mime_t(''chm'') := ''applica';
wwv_flow_imp.g_varchar2_table(1536) := 'tion/vnd.ms-htmlhelp'';'||wwv_flow.LF||
'  mime_t(''ims'') := ''application/vnd.ms-ims'';'||wwv_flow.LF||
'  mime_t(''lrm'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1537) := 'n/vnd.ms-lrm'';'||wwv_flow.LF||
'  mime_t(''thmx'') := ''application/vnd.ms-officetheme'';'||wwv_flow.LF||
'  mime_t(''cat'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1538) := 'on/vnd.ms-pki.seccat'';'||wwv_flow.LF||
'  mime_t(''stl'') := ''application/vnd.ms-pki.stl'';'||wwv_flow.LF||
'  mime_t(''ppt'') := ''applic';
wwv_flow_imp.g_varchar2_table(1539) := 'ation/vnd.ms-powerpoint'';'||wwv_flow.LF||
'  mime_t(''pps'') := ''application/vnd.ms-powerpoint'';'||wwv_flow.LF||
'  mime_t(''pot'') := ''';
wwv_flow_imp.g_varchar2_table(1540) := 'application/vnd.ms-powerpoint'';'||wwv_flow.LF||
'  mime_t(''ppam'') := ''application/vnd.ms-powerpoint.addin.macroenabl';
wwv_flow_imp.g_varchar2_table(1541) := 'ed.12'';'||wwv_flow.LF||
'  mime_t(''pptm'') := ''application/vnd.ms-powerpoint.presentation.macroenabled.12'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1542) := '(''sldm'') := ''application/vnd.ms-powerpoint.slide.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''ppsm'') := ''application';
wwv_flow_imp.g_varchar2_table(1543) := '/vnd.ms-powerpoint.slideshow.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''wav'') := ''audio/x-wav'';'||wwv_flow.LF||
'  mime_t(''xm'') :=';
wwv_flow_imp.g_varchar2_table(1544) := ' ''audio/xm'';'||wwv_flow.LF||
'  mime_t(''cdx'') := ''chemical/x-cdx'';'||wwv_flow.LF||
'  mime_t(''cif'') := ''chemical/x-cif'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1545) := 'cmdf'') := ''chemical/x-cmdf'';'||wwv_flow.LF||
'  mime_t(''cml'') := ''chemical/x-cml'';'||wwv_flow.LF||
'  mime_t(''csml'') := ''chemical/x-';
wwv_flow_imp.g_varchar2_table(1546) := 'csml'';'||wwv_flow.LF||
'  mime_t(''xyz'') := ''chemical/x-xyz'';'||wwv_flow.LF||
'  mime_t(''ttc'') := ''font/collection'';'||wwv_flow.LF||
'  mime_t(''otf'')';
wwv_flow_imp.g_varchar2_table(1547) := ' := ''font/otf'';'||wwv_flow.LF||
'  mime_t(''ttf'') := ''font/ttf'';'||wwv_flow.LF||
'  mime_t(''woff'') := ''font/woff'';'||wwv_flow.LF||
'  mime_t(''woff2'')';
wwv_flow_imp.g_varchar2_table(1548) := ' := ''font/woff2'';'||wwv_flow.LF||
'  mime_t(''avif'') := ''image/avif'';'||wwv_flow.LF||
'  mime_t(''bmp'') := ''image/bmp'';'||wwv_flow.LF||
'  mime_t(''cgm';
wwv_flow_imp.g_varchar2_table(1549) := ''') := ''image/cgm'';'||wwv_flow.LF||
'  mime_t(''g3'') := ''image/g3fax'';'||wwv_flow.LF||
'  mime_t(''gif'') := ''image/gif'';'||wwv_flow.LF||
'  mime_t(''ief';
wwv_flow_imp.g_varchar2_table(1550) := ''') := ''image/ief'';'||wwv_flow.LF||
'  mime_t(''jpeg'') := ''image/jpeg'';'||wwv_flow.LF||
'  mime_t(''jpg'') := ''image/jpeg'';'||wwv_flow.LF||
'  mime_t(''j';
wwv_flow_imp.g_varchar2_table(1551) := 'pe'') := ''image/jpeg'';'||wwv_flow.LF||
'  mime_t(''ktx'') := ''image/ktx'';'||wwv_flow.LF||
'  mime_t(''png'') := ''image/png'';'||wwv_flow.LF||
'  mime_t(''b';
wwv_flow_imp.g_varchar2_table(1552) := 'tif'') := ''image/prs.btif'';'||wwv_flow.LF||
'  mime_t(''sgi'') := ''image/sgi'';'||wwv_flow.LF||
'  mime_t(''svg'') := ''image/svg+xml'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1553) := 'mime_t(''svgz'') := ''image/svg+xml'';'||wwv_flow.LF||
'  mime_t(''tiff'') := ''image/tiff'';'||wwv_flow.LF||
'  mime_t(''tif'') := ''image/tif';
wwv_flow_imp.g_varchar2_table(1554) := 'f'';'||wwv_flow.LF||
'  mime_t(''psd'') := ''image/vnd.adobe.photoshop'';'||wwv_flow.LF||
'  mime_t(''uvi'') := ''image/vnd.dece.graphic'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1555) := '  mime_t(''uvvi'') := ''image/vnd.dece.graphic'';'||wwv_flow.LF||
'  mime_t(''uvg'') := ''image/vnd.dece.graphic'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1556) := 't(''uvvg'') := ''image/vnd.dece.graphic'';'||wwv_flow.LF||
'  mime_t(''djvu'') := ''image/vnd.djvu'';'||wwv_flow.LF||
'  mime_t(''djv'') := ''i';
wwv_flow_imp.g_varchar2_table(1557) := 'mage/vnd.djvu'';'||wwv_flow.LF||
'  mime_t(''sub'') := ''image/vnd.dvb.subtitle'';'||wwv_flow.LF||
'  mime_t(''dwg'') := ''image/vnd.dwg'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1558) := '  mime_t(''dxf'') := ''image/vnd.dxf'';'||wwv_flow.LF||
'  mime_t(''fbs'') := ''image/vnd.fastbidsheet'';'||wwv_flow.LF||
'  mime_t(''fpx'') :';
wwv_flow_imp.g_varchar2_table(1559) := '= ''image/vnd.fpx'';'||wwv_flow.LF||
'  mime_t(''fst'') := ''image/vnd.fst'';'||wwv_flow.LF||
'  mime_t(''mmr'') := ''image/vnd.fujixerox.edm';
wwv_flow_imp.g_varchar2_table(1560) := 'ics-mmr'';'||wwv_flow.LF||
'  mime_t(''rlc'') := ''image/vnd.fujixerox.edmics-rlc'';'||wwv_flow.LF||
'  mime_t(''mdi'') := ''image/vnd.ms-mo';
wwv_flow_imp.g_varchar2_table(1561) := 'di'';'||wwv_flow.LF||
'  mime_t(''wdp'') := ''image/vnd.ms-photo'';'||wwv_flow.LF||
'  mime_t(''npx'') := ''image/vnd.net-fpx'';'||wwv_flow.LF||
'  mime_t(''w';
wwv_flow_imp.g_varchar2_table(1562) := 'bmp'') := ''image/vnd.wap.wbmp'';'||wwv_flow.LF||
'  mime_t(''xif'') := ''image/vnd.xiff'';'||wwv_flow.LF||
'  mime_t(''webp'') := ''image/web';
wwv_flow_imp.g_varchar2_table(1563) := 'p'';'||wwv_flow.LF||
'  mime_t(''3ds'') := ''image/x-3ds'';'||wwv_flow.LF||
'  mime_t(''ras'') := ''image/x-cmu-raster'';'||wwv_flow.LF||
'  mime_t(''cmx'') :=';
wwv_flow_imp.g_varchar2_table(1564) := ' ''image/x-cmx'';'||wwv_flow.LF||
'  mime_t(''fh'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mime_t(''fhc'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1565) := 'me_t(''fh4'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mime_t(''fh5'') := ''image/x-freehand'';'||wwv_flow.LF||
'  mime_t(''fh7'') := ''imag';
wwv_flow_imp.g_varchar2_table(1566) := 'e/x-freehand'';'||wwv_flow.LF||
'  mime_t(''ico'') := ''image/x-icon'';'||wwv_flow.LF||
'  mime_t(''sid'') := ''image/x-mrsid-image'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1567) := 'e_t(''pcx'') := ''image/x-pcx'';'||wwv_flow.LF||
'  mime_t(''pic'') := ''image/x-pict'';'||wwv_flow.LF||
'  mime_t(''pct'') := ''image/x-pict'';';
wwv_flow_imp.g_varchar2_table(1568) := ''||wwv_flow.LF||
'  mime_t(''pnm'') := ''image/x-portable-anymap'';'||wwv_flow.LF||
'  mime_t(''pbm'') := ''image/x-portable-bitmap'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1569) := 'me_t(''pgm'') := ''image/x-portable-graymap'';'||wwv_flow.LF||
'  mime_t(''ppm'') := ''image/x-portable-pixmap'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1570) := '''rgb'') := ''image/x-rgb'';'||wwv_flow.LF||
'  mime_t(''tga'') := ''image/x-tga'';'||wwv_flow.LF||
'  mime_t(''xbm'') := ''image/x-xbitmap'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1571) := '  mime_t(''xpm'') := ''image/x-xpixmap'';'||wwv_flow.LF||
'  mime_t(''xwd'') := ''image/x-xwindowdump'';'||wwv_flow.LF||
'  mime_t(''eml'') :=';
wwv_flow_imp.g_varchar2_table(1572) := ' ''message/rfc822'';'||wwv_flow.LF||
'  mime_t(''mime'') := ''message/rfc822'';'||wwv_flow.LF||
'  mime_t(''igs'') := ''model/iges'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1573) := 't(''iges'') := ''model/iges'';'||wwv_flow.LF||
'  mime_t(''msh'') := ''model/mesh'';'||wwv_flow.LF||
'  mime_t(''mesh'') := ''model/mesh'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1574) := 'ime_t(''silo'') := ''model/mesh'';'||wwv_flow.LF||
'  mime_t(''dae'') := ''model/vnd.collada+xml'';'||wwv_flow.LF||
'  mime_t(''dwf'') := ''mod';
wwv_flow_imp.g_varchar2_table(1575) := 'el/vnd.dwf'';'||wwv_flow.LF||
'  mime_t(''gdl'') := ''model/vnd.gdl'';'||wwv_flow.LF||
'  mime_t(''gtw'') := ''model/vnd.gtw'';'||wwv_flow.LF||
'  mime_t(''vt';
wwv_flow_imp.g_varchar2_table(1576) := 'u'') := ''model/vnd.vtu'';'||wwv_flow.LF||
'  mime_t(''wrl'') := ''model/vrml'';'||wwv_flow.LF||
'  mime_t(''vrml'') := ''model/vrml'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1577) := '_t(''x3db'') := ''model/x3d+binary'';'||wwv_flow.LF||
'  mime_t(''x3dbz'') := ''model/x3d+binary'';'||wwv_flow.LF||
'  mime_t(''x3dv'') := ''mo';
wwv_flow_imp.g_varchar2_table(1578) := 'del/x3d+vrml'';'||wwv_flow.LF||
'  mime_t(''x3dvz'') := ''model/x3d+vrml'';'||wwv_flow.LF||
'  mime_t(''x3d'') := ''model/x3d+xml'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1579) := 't(''x3dz'') := ''model/x3d+xml'';'||wwv_flow.LF||
'  mime_t(''appcache'') := ''text/cache-manifest'';'||wwv_flow.LF||
'  mime_t(''ics'') := ''t';
wwv_flow_imp.g_varchar2_table(1580) := 'ext/calendar'';'||wwv_flow.LF||
'  mime_t(''ifb'') := ''text/calendar'';'||wwv_flow.LF||
'  mime_t(''css'') := ''text/css'';'||wwv_flow.LF||
'  mime_t(''csv'')';
wwv_flow_imp.g_varchar2_table(1581) := ' := ''text/csv'';'||wwv_flow.LF||
'  mime_t(''html'') := ''text/html'';'||wwv_flow.LF||
'  mime_t(''htm'') := ''text/html'';'||wwv_flow.LF||
'  mime_t(''js'') :';
wwv_flow_imp.g_varchar2_table(1582) := '= ''text/javascript'';'||wwv_flow.LF||
'  mime_t(''mjs'') := ''text/javascript'';'||wwv_flow.LF||
'  mime_t(''n3'') := ''text/n3'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1583) := '''txt'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''text'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''conf'') := ''text/plain'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1584) := 'e_t(''def'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''list'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''log'') := ''text/plain'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1585) := 'mime_t(''in'') := ''text/plain'';'||wwv_flow.LF||
'  mime_t(''dsc'') := ''text/prs.lines.tag'';'||wwv_flow.LF||
'  mime_t(''rtx'') := ''text/ri';
wwv_flow_imp.g_varchar2_table(1586) := 'chtext'';'||wwv_flow.LF||
'  mime_t(''sgml'') := ''text/sgml'';'||wwv_flow.LF||
'  mime_t(''sgm'') := ''text/sgml'';'||wwv_flow.LF||
'  mime_t(''tsv'') := ''tex';
wwv_flow_imp.g_varchar2_table(1587) := 't/tab-separated-values'';'||wwv_flow.LF||
'  mime_t(''t'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''tr'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1588) := '''roff'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''man'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''me'') := ''text/troff'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1589) := 't(''ms'') := ''text/troff'';'||wwv_flow.LF||
'  mime_t(''ttl'') := ''text/turtle'';'||wwv_flow.LF||
'  mime_t(''uri'') := ''text/uri-list'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1590) := 'mime_t(''uris'') := ''text/uri-list'';'||wwv_flow.LF||
'  mime_t(''urls'') := ''text/uri-list'';'||wwv_flow.LF||
'  mime_t(''vcard'') := ''text';
wwv_flow_imp.g_varchar2_table(1591) := '/vcard'';'||wwv_flow.LF||
'  mime_t(''curl'') := ''text/vnd.curl'';'||wwv_flow.LF||
'  mime_t(''dcurl'') := ''text/vnd.curl.dcurl'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1592) := 't(''mcurl'') := ''text/vnd.curl.mcurl'';'||wwv_flow.LF||
'  mime_t(''scurl'') := ''text/vnd.curl.scurl'';'||wwv_flow.LF||
'  mime_t(''sub'') :';
wwv_flow_imp.g_varchar2_table(1593) := '= ''text/vnd.dvb.subtitle'';'||wwv_flow.LF||
'  mime_t(''fly'') := ''text/vnd.fly'';'||wwv_flow.LF||
'  mime_t(''flx'') := ''text/vnd.fmi.fle';
wwv_flow_imp.g_varchar2_table(1594) := 'xstor'';'||wwv_flow.LF||
'  mime_t(''gv'') := ''text/vnd.graphviz'';'||wwv_flow.LF||
'  mime_t(''3dml'') := ''text/vnd.in3d.3dml'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1595) := '(''spot'') := ''text/vnd.in3d.spot'';'||wwv_flow.LF||
'  mime_t(''jad'') := ''text/vnd.sun.j2me.app-descriptor'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1596) := '''wml'') := ''text/vnd.wap.wml'';'||wwv_flow.LF||
'  mime_t(''wmls'') := ''text/vnd.wap.wmlscript'';'||wwv_flow.LF||
'  mime_t(''s'') := ''text';
wwv_flow_imp.g_varchar2_table(1597) := '/x-asm'';'||wwv_flow.LF||
'  mime_t(''asm'') := ''text/x-asm'';'||wwv_flow.LF||
'  mime_t(''c'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''cc'') := ''text/x-';
wwv_flow_imp.g_varchar2_table(1598) := 'c'';'||wwv_flow.LF||
'  mime_t(''cxx'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''cpp'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''h'') := ''text/x-c'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1599) := ' mime_t(''hh'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''dic'') := ''text/x-c'';'||wwv_flow.LF||
'  mime_t(''f'') := ''text/x-fortran'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1600) := 'mime_t(''for'') := ''text/x-fortran'';'||wwv_flow.LF||
'  mime_t(''f77'') := ''text/x-fortran'';'||wwv_flow.LF||
'  mime_t(''f90'') := ''text/x';
wwv_flow_imp.g_varchar2_table(1601) := '-fortran'';'||wwv_flow.LF||
'  mime_t(''java'') := ''text/x-java-source'';'||wwv_flow.LF||
'  mime_t(''nfo'') := ''text/x-nfo'';'||wwv_flow.LF||
'  mime_t(''o';
wwv_flow_imp.g_varchar2_table(1602) := 'pml'') := ''text/x-opml'';'||wwv_flow.LF||
'  mime_t(''p'') := ''text/x-pascal'';'||wwv_flow.LF||
'  mime_t(''pas'') := ''text/x-pascal'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1603) := 'ime_t(''etx'') := ''text/x-setext'';'||wwv_flow.LF||
'  mime_t(''sfv'') := ''text/x-sfv'';'||wwv_flow.LF||
'  mime_t(''uu'') := ''text/x-uuenco';
wwv_flow_imp.g_varchar2_table(1604) := 'de'';'||wwv_flow.LF||
'  mime_t(''vcs'') := ''text/x-vcalendar'';'||wwv_flow.LF||
'  mime_t(''vcf'') := ''text/x-vcard'';'||wwv_flow.LF||
'  mime_t(''3gp'') :=';
wwv_flow_imp.g_varchar2_table(1605) := ' ''video/3gpp'';'||wwv_flow.LF||
'  mime_t(''3g2'') := ''video/3gpp2'';'||wwv_flow.LF||
'  mime_t(''h261'') := ''video/h261'';'||wwv_flow.LF||
'  mime_t(''h263';
wwv_flow_imp.g_varchar2_table(1606) := ''') := ''video/h263'';'||wwv_flow.LF||
'  mime_t(''h264'') := ''video/h264'';'||wwv_flow.LF||
'  mime_t(''jpgv'') := ''video/jpeg'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1607) := '''jpm'') := ''video/jpm'';'||wwv_flow.LF||
'  mime_t(''jpgm'') := ''video/jpm'';'||wwv_flow.LF||
'  mime_t(''mj2'') := ''video/mj2'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1608) := '''mjp2'') := ''video/mj2'';'||wwv_flow.LF||
'  mime_t(''ts'') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t(''m2t'') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1609) := '(''m2ts'') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t(''mts'') := ''video/mp2t'';'||wwv_flow.LF||
'  mime_t(''mp4'') := ''video/mp4'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1610) := '_t(''mp4v'') := ''video/mp4'';'||wwv_flow.LF||
'  mime_t(''mpg4'') := ''video/mp4'';'||wwv_flow.LF||
'  mime_t(''mpeg'') := ''video/mpeg'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1611) := 'ime_t(''mpg'') := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''mpe'') := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''m1v'') := ''video/mpeg'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1612) := ' mime_t(''m2v'') := ''video/mpeg'';'||wwv_flow.LF||
'  mime_t(''ogv'') := ''video/ogg'';'||wwv_flow.LF||
'  mime_t(''qt'') := ''video/quicktime';
wwv_flow_imp.g_varchar2_table(1613) := ''';'||wwv_flow.LF||
'  mime_t(''mov'') := ''video/quicktime'';'||wwv_flow.LF||
'  mime_t(''uvh'') := ''video/vnd.dece.hd'';'||wwv_flow.LF||
'  mime_t(''uvvh'')';
wwv_flow_imp.g_varchar2_table(1614) := ' := ''video/vnd.dece.hd'';'||wwv_flow.LF||
'  mime_t(''uvm'') := ''video/vnd.dece.mobile'';'||wwv_flow.LF||
'  mime_t(''uvvm'') := ''video/vn';
wwv_flow_imp.g_varchar2_table(1615) := 'd.dece.mobile'';'||wwv_flow.LF||
'  mime_t(''uvp'') := ''video/vnd.dece.pd'';'||wwv_flow.LF||
'  mime_t(''uvvp'') := ''video/vnd.dece.pd'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1616) := '  mime_t(''uvs'') := ''video/vnd.dece.sd'';'||wwv_flow.LF||
'  mime_t(''uvvs'') := ''video/vnd.dece.sd'';'||wwv_flow.LF||
'  mime_t(''uvv'') :';
wwv_flow_imp.g_varchar2_table(1617) := '= ''video/vnd.dece.video'';'||wwv_flow.LF||
'  mime_t(''uvvv'') := ''video/vnd.dece.video'';'||wwv_flow.LF||
'  mime_t(''dvb'') := ''video/vn';
wwv_flow_imp.g_varchar2_table(1618) := 'd.dvb.file'';'||wwv_flow.LF||
'  mime_t(''fvt'') := ''video/vnd.fvt'';'||wwv_flow.LF||
'  mime_t(''mxu'') := ''video/vnd.mpegurl'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1619) := '(''m4u'') := ''video/vnd.mpegurl'';'||wwv_flow.LF||
'  mime_t(''pyv'') := ''video/vnd.ms-playready.media.pyv'';'||wwv_flow.LF||
'  mime_t(''u';
wwv_flow_imp.g_varchar2_table(1620) := 'vu'') := ''video/vnd.uvvu.mp4'';'||wwv_flow.LF||
'  mime_t(''uvvu'') := ''video/vnd.uvvu.mp4'';'||wwv_flow.LF||
'  mime_t(''viv'') := ''video/';
wwv_flow_imp.g_varchar2_table(1621) := 'vnd.vivo'';'||wwv_flow.LF||
'  mime_t(''webm'') := ''video/webm'';'||wwv_flow.LF||
'  mime_t(''f4v'') := ''video/x-f4v'';'||wwv_flow.LF||
'  mime_t(''fli'') :=';
wwv_flow_imp.g_varchar2_table(1622) := ' ''video/x-fli'';'||wwv_flow.LF||
'  mime_t(''flv'') := ''video/x-flv'';'||wwv_flow.LF||
'  mime_t(''m4v'') := ''video/x-m4v'';'||wwv_flow.LF||
'  mime_t(''mkv';
wwv_flow_imp.g_varchar2_table(1623) := ''') := ''video/x-matroska'';'||wwv_flow.LF||
'  mime_t(''mk3d'') := ''video/x-matroska'';'||wwv_flow.LF||
'  mime_t(''mks'') := ''video/x-matr';
wwv_flow_imp.g_varchar2_table(1624) := 'oska'';'||wwv_flow.LF||
'  mime_t(''mng'') := ''video/x-mng'';'||wwv_flow.LF||
'  mime_t(''asf'') := ''video/x-ms-asf'';'||wwv_flow.LF||
'  mime_t(''asx'') := ';
wwv_flow_imp.g_varchar2_table(1625) := '''video/x-ms-asf'';'||wwv_flow.LF||
'  mime_t(''vob'') := ''video/x-ms-vob'';'||wwv_flow.LF||
'  mime_t(''wm'') := ''video/x-ms-wm'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1626) := 't(''wmv'') := ''video/x-ms-wmv'';'||wwv_flow.LF||
'  mime_t(''wmx'') := ''video/x-ms-wmx'';'||wwv_flow.LF||
'  mime_t(''wvx'') := ''video/x-ms-';
wwv_flow_imp.g_varchar2_table(1627) := 'wvx'';'||wwv_flow.LF||
'  mime_t(''avi'') := ''video/x-msvideo'';'||wwv_flow.LF||
'  mime_t(''movie'') := ''video/x-sgi-movie'';'||wwv_flow.LF||
'  mime_t(''s';
wwv_flow_imp.g_varchar2_table(1628) := 'mv'') := ''video/x-smv'';'||wwv_flow.LF||
'  mime_t(''ice'') := ''x-conference/x-cooltalk'';'||wwv_flow.LF||
'  mime_t(''potm'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1629) := 'ion/vnd.ms-powerpoint.template.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''mpp'') := ''application/vnd.ms-project'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1630) := '  mime_t(''mpt'') := ''application/vnd.ms-project'';'||wwv_flow.LF||
'  mime_t(''docm'') := ''application/vnd.ms-word.docum';
wwv_flow_imp.g_varchar2_table(1631) := 'ent.macroenabled.12'';'||wwv_flow.LF||
'  mime_t(''dotm'') := ''application/vnd.ms-word.template.macroenabled.12'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1632) := 'me_t(''wps'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mime_t(''wks'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1633) := '(''wcm'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mime_t(''wdb'') := ''application/vnd.ms-works'';'||wwv_flow.LF||
'  mime_t(''wp';
wwv_flow_imp.g_varchar2_table(1634) := 'l'') := ''application/vnd.ms-wpl'';'||wwv_flow.LF||
'  mime_t(''xps'') := ''application/vnd.ms-xpsdocument'';'||wwv_flow.LF||
'  mime_t(''ms';
wwv_flow_imp.g_varchar2_table(1635) := 'eq'') := ''application/vnd.mseq'';'||wwv_flow.LF||
'  mime_t(''mus'') := ''application/vnd.musician'';'||wwv_flow.LF||
'  mime_t(''msty'') :=';
wwv_flow_imp.g_varchar2_table(1636) := ' ''application/vnd.muvee.style'';'||wwv_flow.LF||
'  mime_t(''taglet'') := ''application/vnd.mynfc'';'||wwv_flow.LF||
'  mime_t(''nlu'') := ';
wwv_flow_imp.g_varchar2_table(1637) := '''application/vnd.neurolanguage.nlu'';'||wwv_flow.LF||
'  mime_t(''ntf'') := ''application/vnd.nitf'';'||wwv_flow.LF||
'  mime_t(''nitf'') :';
wwv_flow_imp.g_varchar2_table(1638) := '= ''application/vnd.nitf'';'||wwv_flow.LF||
'  mime_t(''nnd'') := ''application/vnd.noblenet-directory'';'||wwv_flow.LF||
'  mime_t(''nns'')';
wwv_flow_imp.g_varchar2_table(1639) := ' := ''application/vnd.noblenet-sealer'';'||wwv_flow.LF||
'  mime_t(''nnw'') := ''application/vnd.noblenet-web'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1640) := '(''ngdat'') := ''application/vnd.nokia.n-gage.data'';'||wwv_flow.LF||
'  mime_t(''n-gage'') := ''application/vnd.nokia.n-ga';
wwv_flow_imp.g_varchar2_table(1641) := 'ge.symbian.install'';'||wwv_flow.LF||
'  mime_t(''rpst'') := ''application/vnd.nokia.radio-preset'';'||wwv_flow.LF||
'  mime_t(''rpss'') :=';
wwv_flow_imp.g_varchar2_table(1642) := ' ''application/vnd.nokia.radio-presets'';'||wwv_flow.LF||
'  mime_t(''edm'') := ''application/vnd.novadigm.edm'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1643) := 't(''edx'') := ''application/vnd.novadigm.edx'';'||wwv_flow.LF||
'  mime_t(''ext'') := ''application/vnd.novadigm.ext'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1644) := 'ime_t(''odc'') := ''application/vnd.oasis.opendocument.chart'';'||wwv_flow.LF||
'  mime_t(''otc'') := ''application/vnd.oas';
wwv_flow_imp.g_varchar2_table(1645) := 'is.opendocument.chart-template'';'||wwv_flow.LF||
'  mime_t(''odb'') := ''application/vnd.oasis.opendocument.database'';';
wwv_flow_imp.g_varchar2_table(1646) := ''||wwv_flow.LF||
'  mime_t(''odf'') := ''application/vnd.oasis.opendocument.formula'';'||wwv_flow.LF||
'  mime_t(''odft'') := ''application/';
wwv_flow_imp.g_varchar2_table(1647) := 'vnd.oasis.opendocument.formula-template'';'||wwv_flow.LF||
'  mime_t(''odg'') := ''application/vnd.oasis.opendocument.gr';
wwv_flow_imp.g_varchar2_table(1648) := 'aphics'';'||wwv_flow.LF||
'  mime_t(''otg'') := ''application/vnd.oasis.opendocument.graphics-template'';'||wwv_flow.LF||
'  mime_t(''odi''';
wwv_flow_imp.g_varchar2_table(1649) := ') := ''application/vnd.oasis.opendocument.image'';'||wwv_flow.LF||
'  mime_t(''oti'') := ''application/vnd.oasis.opendocu';
wwv_flow_imp.g_varchar2_table(1650) := 'ment.image-template'';'||wwv_flow.LF||
'  mime_t(''odp'') := ''application/vnd.oasis.opendocument.presentation'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1651) := '_t(''otp'') := ''application/vnd.oasis.opendocument.presentation-template'';'||wwv_flow.LF||
'  mime_t(''ods'') := ''applic';
wwv_flow_imp.g_varchar2_table(1652) := 'ation/vnd.oasis.opendocument.spreadsheet'';'||wwv_flow.LF||
'  mime_t(''ots'') := ''application/vnd.oasis.opendocument.s';
wwv_flow_imp.g_varchar2_table(1653) := 'preadsheet-template'';'||wwv_flow.LF||
'  mime_t(''odt'') := ''application/vnd.oasis.opendocument.text'';'||wwv_flow.LF||
'  mime_t(''odm''';
wwv_flow_imp.g_varchar2_table(1654) := ') := ''application/vnd.oasis.opendocument.text-master'';'||wwv_flow.LF||
'  mime_t(''ott'') := ''application/vnd.oasis.op';
wwv_flow_imp.g_varchar2_table(1655) := 'endocument.text-template'';'||wwv_flow.LF||
'  mime_t(''oth'') := ''application/vnd.oasis.opendocument.text-web'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1656) := 'e_t(''xo'') := ''application/vnd.olpc-sugar'';'||wwv_flow.LF||
'  mime_t(''dd2'') := ''application/vnd.oma.dd2+xml'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1657) := 'e_t(''oxt'') := ''application/vnd.openofficeorg.extension'';'||wwv_flow.LF||
'  mime_t(''pptx'') := ''application/vnd.openx';
wwv_flow_imp.g_varchar2_table(1658) := 'mlformats-officedocument.presentationml.presentation'';'||wwv_flow.LF||
'  mime_t(''sldx'') := ''application/vnd.openxml';
wwv_flow_imp.g_varchar2_table(1659) := 'formats-officedocument.presentationml.slide'';'||wwv_flow.LF||
'  mime_t(''ppsx'') := ''application/vnd.openxmlformats-o';
wwv_flow_imp.g_varchar2_table(1660) := 'fficedocument.presentationml.slideshow'';'||wwv_flow.LF||
'  mime_t(''potx'') := ''application/vnd.openxmlformats-office';
wwv_flow_imp.g_varchar2_table(1661) := 'document.presentationml.template'';'||wwv_flow.LF||
'  mime_t(''xlsx'') := ''application/vnd.openxmlformats-officedocume';
wwv_flow_imp.g_varchar2_table(1662) := 'nt.spreadsheetml.sheet'';'||wwv_flow.LF||
'  mime_t(''xltx'') := ''application/vnd.openxmlformats-officedocument.spreads';
wwv_flow_imp.g_varchar2_table(1663) := 'heetml.template'';'||wwv_flow.LF||
'  mime_t(''docx'') := ''application/vnd.openxmlformats-officedocument.wordprocessing';
wwv_flow_imp.g_varchar2_table(1664) := 'ml.document'';'||wwv_flow.LF||
'  mime_t(''dotx'') := ''application/vnd.openxmlformats-officedocument.wordprocessingml.t';
wwv_flow_imp.g_varchar2_table(1665) := 'emplate'';'||wwv_flow.LF||
'  mime_t(''mgp'') := ''application/vnd.osgeo.mapguide.package'';'||wwv_flow.LF||
'  mime_t(''dp'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1666) := 'ion/vnd.osgi.dp'';'||wwv_flow.LF||
'  mime_t(''esa'') := ''application/vnd.osgi.subsystem'';'||wwv_flow.LF||
'  mime_t(''pdb'') := ''applica';
wwv_flow_imp.g_varchar2_table(1667) := 'tion/vnd.palm'';'||wwv_flow.LF||
'  mime_t(''pqa'') := ''application/vnd.palm'';'||wwv_flow.LF||
'  mime_t(''oprc'') := ''application/vnd.pa';
wwv_flow_imp.g_varchar2_table(1668) := 'lm'';'||wwv_flow.LF||
'  mime_t(''paw'') := ''application/vnd.pawaafile'';'||wwv_flow.LF||
'  mime_t(''str'') := ''application/vnd.pg.format';
wwv_flow_imp.g_varchar2_table(1669) := ''';'||wwv_flow.LF||
'  mime_t(''ei6'') := ''application/vnd.pg.osasli'';'||wwv_flow.LF||
'  mime_t(''efif'') := ''application/vnd.picsel'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1670) := '  mime_t(''wg'') := ''application/vnd.pmi.widget'';'||wwv_flow.LF||
'  mime_t(''plf'') := ''application/vnd.pocketlearn'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1671) := '  mime_t(''pbd'') := ''application/vnd.powerbuilder6'';'||wwv_flow.LF||
'  mime_t(''box'') := ''application/vnd.previewsyst';
wwv_flow_imp.g_varchar2_table(1672) := 'ems.box'';'||wwv_flow.LF||
'  mime_t(''mgz'') := ''application/vnd.proteus.magazine'';'||wwv_flow.LF||
'  mime_t(''qps'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1673) := 'nd.publishare-delta-tree'';'||wwv_flow.LF||
'  mime_t(''ptid'') := ''application/vnd.pvi.ptid1'';'||wwv_flow.LF||
'  mime_t(''qxd'') := ''ap';
wwv_flow_imp.g_varchar2_table(1674) := 'plication/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''qxt'') := ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1675) := '(''qwd'') := ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''qwt'') := ''application/vnd.quark.quarkxpre';
wwv_flow_imp.g_varchar2_table(1676) := 'ss'';'||wwv_flow.LF||
'  mime_t(''qxl'') := ''application/vnd.quark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''qxb'') := ''application/vnd.q';
wwv_flow_imp.g_varchar2_table(1677) := 'uark.quarkxpress'';'||wwv_flow.LF||
'  mime_t(''bed'') := ''application/vnd.realvnc.bed'';'||wwv_flow.LF||
'  mime_t(''mxl'') := ''applicati';
wwv_flow_imp.g_varchar2_table(1678) := 'on/vnd.recordare.musicxml'';'||wwv_flow.LF||
'  mime_t(''musicxml'') := ''application/vnd.recordare.musicxml+xml'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1679) := 'me_t(''cryptonote'') := ''application/vnd.rig.cryptonote'';'||wwv_flow.LF||
'  mime_t(''cod'') := ''application/vnd.rim.cod';
wwv_flow_imp.g_varchar2_table(1680) := ''';'||wwv_flow.LF||
'  mime_t(''rm'') := ''application/vnd.rn-realmedia'';'||wwv_flow.LF||
'  mime_t(''rmvb'') := ''application/vnd.rn-realm';
wwv_flow_imp.g_varchar2_table(1681) := 'edia-vbr'';'||wwv_flow.LF||
'  mime_t(''link66'') := ''application/vnd.route66.link66+xml'';'||wwv_flow.LF||
'  mime_t(''st'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1682) := 'ion/vnd.sailingtracker.track'';'||wwv_flow.LF||
'  mime_t(''see'') := ''application/vnd.seemail'';'||wwv_flow.LF||
'  mime_t(''sema'') := ''';
wwv_flow_imp.g_varchar2_table(1683) := 'application/vnd.sema'';'||wwv_flow.LF||
'  mime_t(''semd'') := ''application/vnd.semd'';'||wwv_flow.LF||
'  mime_t(''semf'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1684) := 'n/vnd.semf'';'||wwv_flow.LF||
'  mime_t(''ifm'') := ''application/vnd.shana.informed.formdata'';'||wwv_flow.LF||
'  mime_t(''itp'') := ''app';
wwv_flow_imp.g_varchar2_table(1685) := 'lication/vnd.shana.informed.formtemplate'';'||wwv_flow.LF||
'  mime_t(''iif'') := ''application/vnd.shana.informed.inter';
wwv_flow_imp.g_varchar2_table(1686) := 'change'';'||wwv_flow.LF||
'  mime_t(''ipk'') := ''application/vnd.shana.informed.package'';'||wwv_flow.LF||
'  mime_t(''twd'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1687) := 'ion/vnd.simtech-mindmapper'';'||wwv_flow.LF||
'  mime_t(''twds'') := ''application/vnd.simtech-mindmapper'';'||wwv_flow.LF||
'  mime_t(''m';
wwv_flow_imp.g_varchar2_table(1688) := 'mf'') := ''application/vnd.smaf'';'||wwv_flow.LF||
'  mime_t(''teacher'') := ''application/vnd.smart.teacher'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1689) := 'sdkm'') := ''application/vnd.solent.sdkm+xml'';'||wwv_flow.LF||
'  mime_t(''sdkd'') := ''application/vnd.solent.sdkm+xml'';';
wwv_flow_imp.g_varchar2_table(1690) := ''||wwv_flow.LF||
'  mime_t(''dxp'') := ''application/vnd.spotfire.dxp'';'||wwv_flow.LF||
'  mime_t(''sfs'') := ''application/vnd.spotfire.s';
wwv_flow_imp.g_varchar2_table(1691) := 'fs'';'||wwv_flow.LF||
'  mime_t(''sdc'') := ''application/vnd.stardivision.calc'';'||wwv_flow.LF||
'  mime_t(''sda'') := ''application/vnd.s';
wwv_flow_imp.g_varchar2_table(1692) := 'tardivision.draw'';'||wwv_flow.LF||
'  mime_t(''sdd'') := ''application/vnd.stardivision.impress'';'||wwv_flow.LF||
'  mime_t(''smf'') := ''';
wwv_flow_imp.g_varchar2_table(1693) := 'application/vnd.stardivision.math'';'||wwv_flow.LF||
'  mime_t(''sdw'') := ''application/vnd.stardivision.writer'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1694) := 'me_t(''vor'') := ''application/vnd.stardivision.writer'';'||wwv_flow.LF||
'  mime_t(''sgl'') := ''application/vnd.stardivis';
wwv_flow_imp.g_varchar2_table(1695) := 'ion.writer-global'';'||wwv_flow.LF||
'  mime_t(''smzip'') := ''application/vnd.stepmania.package'';'||wwv_flow.LF||
'  mime_t(''sm'') := ''a';
wwv_flow_imp.g_varchar2_table(1696) := 'pplication/vnd.stepmania.stepchart'';'||wwv_flow.LF||
'  mime_t(''sxc'') := ''application/vnd.sun.xml.calc'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1697) := 'stc'') := ''application/vnd.sun.xml.calc.template'';'||wwv_flow.LF||
'  mime_t(''sxd'') := ''application/vnd.sun.xml.draw''';
wwv_flow_imp.g_varchar2_table(1698) := ';'||wwv_flow.LF||
'  mime_t(''std'') := ''application/vnd.sun.xml.draw.template'';'||wwv_flow.LF||
'  mime_t(''sxi'') := ''application/vnd.';
wwv_flow_imp.g_varchar2_table(1699) := 'sun.xml.impress'';'||wwv_flow.LF||
'  mime_t(''sti'') := ''application/vnd.sun.xml.impress.template'';'||wwv_flow.LF||
'  mime_t(''sxm'') :';
wwv_flow_imp.g_varchar2_table(1700) := '= ''application/vnd.sun.xml.math'';'||wwv_flow.LF||
'  mime_t(''sxw'') := ''application/vnd.sun.xml.writer'';'||wwv_flow.LF||
'  mime_t(''s';
wwv_flow_imp.g_varchar2_table(1701) := 'xg'') := ''application/vnd.sun.xml.writer.global'';'||wwv_flow.LF||
'  mime_t(''stw'') := ''application/vnd.sun.xml.writer';
wwv_flow_imp.g_varchar2_table(1702) := '.template'';'||wwv_flow.LF||
'  mime_t(''sus'') := ''application/vnd.sus-calendar'';'||wwv_flow.LF||
'  mime_t(''susp'') := ''application/vn';
wwv_flow_imp.g_varchar2_table(1703) := 'd.sus-calendar'';'||wwv_flow.LF||
'  mime_t(''svd'') := ''application/vnd.svd'';'||wwv_flow.LF||
'  mime_t(''sis'') := ''application/vnd.sym';
wwv_flow_imp.g_varchar2_table(1704) := 'bian.install'';'||wwv_flow.LF||
'  mime_t(''sisx'') := ''application/vnd.symbian.install'';'||wwv_flow.LF||
'  mime_t(''xsm'') := ''applicat';
wwv_flow_imp.g_varchar2_table(1705) := 'ion/vnd.syncml+xml'';'||wwv_flow.LF||
'  mime_t(''bdm'') := ''application/vnd.syncml.dm+wbxml'';'||wwv_flow.LF||
'  mime_t(''xdm'') := ''app';
wwv_flow_imp.g_varchar2_table(1706) := 'lication/vnd.syncml.dm+xml'';'||wwv_flow.LF||
'  mime_t(''tao'') := ''application/vnd.tao.intent-module-archive'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1707) := 'e_t(''pcap'') := ''application/vnd.tcpdump.pcap'';'||wwv_flow.LF||
'  mime_t(''cap'') := ''application/vnd.tcpdump.pcap'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1708) := '  mime_t(''dmp'') := ''application/vnd.tcpdump.pcap'';'||wwv_flow.LF||
'  mime_t(''tmo'') := ''application/vnd.tmobile-live';
wwv_flow_imp.g_varchar2_table(1709) := 'tv'';'||wwv_flow.LF||
'  mime_t(''tpt'') := ''application/vnd.trid.tpt'';'||wwv_flow.LF||
'  mime_t(''mxs'') := ''application/vnd.triscape.m';
wwv_flow_imp.g_varchar2_table(1710) := 'xs'';'||wwv_flow.LF||
'  mime_t(''tra'') := ''application/vnd.trueapp'';'||wwv_flow.LF||
'  mime_t(''ufd'') := ''application/vnd.ufdl'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1711) := 'ime_t(''ufdl'') := ''application/vnd.ufdl'';'||wwv_flow.LF||
'  mime_t(''utz'') := ''application/vnd.uiq.theme'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1712) := '''umj'') := ''application/vnd.umajin'';'||wwv_flow.LF||
'  mime_t(''unityweb'') := ''application/vnd.unity'';'||wwv_flow.LF||
'  mime_t(''uom';
wwv_flow_imp.g_varchar2_table(1713) := 'l'') := ''application/vnd.uoml+xml'';'||wwv_flow.LF||
'  mime_t(''vcx'') := ''application/vnd.vcx'';'||wwv_flow.LF||
'  mime_t(''vsd'') := ''a';
wwv_flow_imp.g_varchar2_table(1714) := 'pplication/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vst'') := ''application/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vss'') := ''application';
wwv_flow_imp.g_varchar2_table(1715) := '/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vsw'') := ''application/vnd.visio'';'||wwv_flow.LF||
'  mime_t(''vis'') := ''application/vnd.visio';
wwv_flow_imp.g_varchar2_table(1716) := 'nary'';'||wwv_flow.LF||
'  mime_t(''vsf'') := ''application/vnd.vsf'';'||wwv_flow.LF||
'  mime_t(''wbxml'') := ''application/vnd.wap.wbxml'';';
wwv_flow_imp.g_varchar2_table(1717) := ''||wwv_flow.LF||
'  mime_t(''wmlc'') := ''application/vnd.wap.wmlc'';'||wwv_flow.LF||
'  mime_t(''wmlsc'') := ''application/vnd.wap.wmlscri';
wwv_flow_imp.g_varchar2_table(1718) := 'ptc'';'||wwv_flow.LF||
'  mime_t(''wtb'') := ''application/vnd.webturbo'';'||wwv_flow.LF||
'  mime_t(''nbp'') := ''application/vnd.wolfram.p';
wwv_flow_imp.g_varchar2_table(1719) := 'layer'';'||wwv_flow.LF||
'  mime_t(''wpd'') := ''application/vnd.wordperfect'';'||wwv_flow.LF||
'  mime_t(''wqd'') := ''application/vnd.wqd''';
wwv_flow_imp.g_varchar2_table(1720) := ';'||wwv_flow.LF||
'  mime_t(''stf'') := ''application/vnd.wt.stf'';'||wwv_flow.LF||
'  mime_t(''xar'') := ''application/vnd.xara'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1721) := 't(''xfdl'') := ''application/vnd.xfdl'';'||wwv_flow.LF||
'  mime_t(''hvd'') := ''application/vnd.yamaha.hv-dic'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1722) := '''hvs'') := ''application/vnd.yamaha.hv-script'';'||wwv_flow.LF||
'  mime_t(''hvp'') := ''application/vnd.yamaha.hv-voice'';';
wwv_flow_imp.g_varchar2_table(1723) := ''||wwv_flow.LF||
'  mime_t(''osf'') := ''application/vnd.yamaha.openscoreformat'';'||wwv_flow.LF||
'  mime_t(''osfpvg'') := ''application/v';
wwv_flow_imp.g_varchar2_table(1724) := 'nd.yamaha.openscoreformat.osfpvg+xml'';'||wwv_flow.LF||
'  mime_t(''saf'') := ''application/vnd.yamaha.smaf-audio'';'||wwv_flow.LF||
'  m';
wwv_flow_imp.g_varchar2_table(1725) := 'ime_t(''spf'') := ''application/vnd.yamaha.smaf-phrase'';'||wwv_flow.LF||
'  mime_t(''cmp'') := ''application/vnd.yellowriv';
wwv_flow_imp.g_varchar2_table(1726) := 'er-custom-menu'';'||wwv_flow.LF||
'  mime_t(''zir'') := ''application/vnd.zul'';'||wwv_flow.LF||
'  mime_t(''zirz'') := ''application/vnd.zu';
wwv_flow_imp.g_varchar2_table(1727) := 'l'';'||wwv_flow.LF||
'  mime_t(''zaz'') := ''application/vnd.zzazz.deck+xml'';'||wwv_flow.LF||
'  mime_t(''vxml'') := ''application/voicexml';
wwv_flow_imp.g_varchar2_table(1728) := '+xml'';'||wwv_flow.LF||
'  mime_t(''wasm'') := ''application/wasm'';'||wwv_flow.LF||
'  mime_t(''wgt'') := ''application/widget'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1729) := '''hlp'') := ''application/winhlp'';'||wwv_flow.LF||
'  mime_t(''wsdl'') := ''application/wsdl+xml'';'||wwv_flow.LF||
'  mime_t(''wspolicy'') :';
wwv_flow_imp.g_varchar2_table(1730) := '= ''application/wspolicy+xml'';'||wwv_flow.LF||
'  mime_t(''7z'') := ''application/x-7z-compressed'';'||wwv_flow.LF||
'  mime_t(''abw'') := ';
wwv_flow_imp.g_varchar2_table(1731) := '''application/x-abiword'';'||wwv_flow.LF||
'  mime_t(''ace'') := ''application/x-ace-compressed'';'||wwv_flow.LF||
'  mime_t(''dmg'') := ''ap';
wwv_flow_imp.g_varchar2_table(1732) := 'plication/x-apple-diskimage'';'||wwv_flow.LF||
'  mime_t(''aab'') := ''application/x-authorware-bin'';'||wwv_flow.LF||
'  mime_t(''x32'') :';
wwv_flow_imp.g_varchar2_table(1733) := '= ''application/x-authorware-bin'';'||wwv_flow.LF||
'  mime_t(''u32'') := ''application/x-authorware-bin'';'||wwv_flow.LF||
'  mime_t(''vox';
wwv_flow_imp.g_varchar2_table(1734) := ''') := ''application/x-authorware-bin'';'||wwv_flow.LF||
'  mime_t(''aam'') := ''application/x-authorware-map'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1735) := '''aas'') := ''application/x-authorware-seg'';'||wwv_flow.LF||
'  mime_t(''bcpio'') := ''application/x-bcpio'';'||wwv_flow.LF||
'  mime_t(''to';
wwv_flow_imp.g_varchar2_table(1736) := 'rrent'') := ''application/x-bittorrent'';'||wwv_flow.LF||
'  mime_t(''blb'') := ''application/x-blorb'';'||wwv_flow.LF||
'  mime_t(''blorb'')';
wwv_flow_imp.g_varchar2_table(1737) := ' := ''application/x-blorb'';'||wwv_flow.LF||
'  mime_t(''bz'') := ''application/x-bzip'';'||wwv_flow.LF||
'  mime_t(''bz2'') := ''application';
wwv_flow_imp.g_varchar2_table(1738) := '/x-bzip2'';'||wwv_flow.LF||
'  mime_t(''boz'') := ''application/x-bzip2'';'||wwv_flow.LF||
'  mime_t(''cbr'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1739) := 'me_t(''cba'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mime_t(''cbt'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mime_t(''cbz'') := ''ap';
wwv_flow_imp.g_varchar2_table(1740) := 'plication/x-cbr'';'||wwv_flow.LF||
'  mime_t(''cb7'') := ''application/x-cbr'';'||wwv_flow.LF||
'  mime_t(''vcd'') := ''application/x-cdlink';
wwv_flow_imp.g_varchar2_table(1741) := ''';'||wwv_flow.LF||
'  mime_t(''cfs'') := ''application/x-cfs-compressed'';'||wwv_flow.LF||
'  mime_t(''chat'') := ''application/x-chat'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1742) := ' mime_t(''pgn'') := ''application/x-chess-pgn'';'||wwv_flow.LF||
'  mime_t(''nsc'') := ''application/x-conference'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1743) := '_t(''cpio'') := ''application/x-cpio'';'||wwv_flow.LF||
'  mime_t(''csh'') := ''application/x-csh'';'||wwv_flow.LF||
'  mime_t(''deb'') := ''ap';
wwv_flow_imp.g_varchar2_table(1744) := 'plication/x-debian-package'';'||wwv_flow.LF||
'  mime_t(''udeb'') := ''application/x-debian-package'';'||wwv_flow.LF||
'  mime_t(''dgc'') :';
wwv_flow_imp.g_varchar2_table(1745) := '= ''application/x-dgc-compressed'';'||wwv_flow.LF||
'  mime_t(''dir'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''dcr'') := ';
wwv_flow_imp.g_varchar2_table(1746) := '''application/x-director'';'||wwv_flow.LF||
'  mime_t(''dxr'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''cst'') := ''applica';
wwv_flow_imp.g_varchar2_table(1747) := 'tion/x-director'';'||wwv_flow.LF||
'  mime_t(''cct'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''cxt'') := ''application/x-d';
wwv_flow_imp.g_varchar2_table(1748) := 'irector'';'||wwv_flow.LF||
'  mime_t(''w3d'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''fgd'') := ''application/x-director''';
wwv_flow_imp.g_varchar2_table(1749) := ';'||wwv_flow.LF||
'  mime_t(''swa'') := ''application/x-director'';'||wwv_flow.LF||
'  mime_t(''wad'') := ''application/x-doom'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1750) := '''ncx'') := ''application/x-dtbncx+xml'';'||wwv_flow.LF||
'  mime_t(''dtb'') := ''application/x-dtbook+xml'';'||wwv_flow.LF||
'  mime_t(''res';
wwv_flow_imp.g_varchar2_table(1751) := ''') := ''application/x-dtbresource+xml'';'||wwv_flow.LF||
'  mime_t(''dvi'') := ''application/x-dvi'';'||wwv_flow.LF||
'  mime_t(''evy'') := ';
wwv_flow_imp.g_varchar2_table(1752) := '''application/x-envoy'';'||wwv_flow.LF||
'  mime_t(''eva'') := ''application/x-eva'';'||wwv_flow.LF||
'  mime_t(''bdf'') := ''application/x-f';
wwv_flow_imp.g_varchar2_table(1753) := 'ont-bdf'';'||wwv_flow.LF||
'  mime_t(''gsf'') := ''application/x-font-ghostscript'';'||wwv_flow.LF||
'  mime_t(''psf'') := ''application/x-f';
wwv_flow_imp.g_varchar2_table(1754) := 'ont-linux-psf'';'||wwv_flow.LF||
'  mime_t(''pcf'') := ''application/x-font-pcf'';'||wwv_flow.LF||
'  mime_t(''snf'') := ''application/x-fon';
wwv_flow_imp.g_varchar2_table(1755) := 't-snf'';'||wwv_flow.LF||
'  mime_t(''pfa'') := ''application/x-font-type1'';'||wwv_flow.LF||
'  mime_t(''pfb'') := ''application/x-font-type';
wwv_flow_imp.g_varchar2_table(1756) := '1'';'||wwv_flow.LF||
'  mime_t(''pfm'') := ''application/x-font-type1'';'||wwv_flow.LF||
'  mime_t(''afm'') := ''application/x-font-type1'';';
wwv_flow_imp.g_varchar2_table(1757) := ''||wwv_flow.LF||
'  mime_t(''arc'') := ''application/x-freearc'';'||wwv_flow.LF||
'  mime_t(''spl'') := ''application/x-futuresplash'';'||wwv_flow.LF||
'  mi';
wwv_flow_imp.g_varchar2_table(1758) := 'me_t(''gca'') := ''application/x-gca-compressed'';'||wwv_flow.LF||
'  mime_t(''ulx'') := ''application/x-glulx'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1759) := '''gnumeric'') := ''application/x-gnumeric'';'||wwv_flow.LF||
'  mime_t(''gramps'') := ''application/x-gramps-xml'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1760) := 't(''gtar'') := ''application/x-gtar'';'||wwv_flow.LF||
'  mime_t(''hdf'') := ''application/x-hdf'';'||wwv_flow.LF||
'  mime_t(''install'') := ';
wwv_flow_imp.g_varchar2_table(1761) := '''application/x-install-instructions'';'||wwv_flow.LF||
'  mime_t(''iso'') := ''application/x-iso9660-image'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1762) := 'jnlp'') := ''application/x-java-jnlp-file'';'||wwv_flow.LF||
'  mime_t(''latex'') := ''application/x-latex'';'||wwv_flow.LF||
'  mime_t(''lz';
wwv_flow_imp.g_varchar2_table(1763) := 'h'') := ''application/x-lzh-compressed'';'||wwv_flow.LF||
'  mime_t(''lha'') := ''application/x-lzh-compressed'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1764) := '(''mie'') := ''application/x-mie'';'||wwv_flow.LF||
'  mime_t(''prc'') := ''application/x-mobipocket-ebook'';'||wwv_flow.LF||
'  mime_t(''mob';
wwv_flow_imp.g_varchar2_table(1765) := 'i'') := ''application/x-mobipocket-ebook'';'||wwv_flow.LF||
'  mime_t(''application'') := ''application/x-ms-application'';';
wwv_flow_imp.g_varchar2_table(1766) := ''||wwv_flow.LF||
'  mime_t(''lnk'') := ''application/x-ms-shortcut'';'||wwv_flow.LF||
'  mime_t(''wmd'') := ''application/x-ms-wmd'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1767) := 'e_t(''wmz'') := ''application/x-ms-wmz'';'||wwv_flow.LF||
'  mime_t(''xbap'') := ''application/x-ms-xbap'';'||wwv_flow.LF||
'  mime_t(''mdb'')';
wwv_flow_imp.g_varchar2_table(1768) := ' := ''application/x-msaccess'';'||wwv_flow.LF||
'  mime_t(''obd'') := ''application/x-msbinder'';'||wwv_flow.LF||
'  mime_t(''crd'') := ''app';
wwv_flow_imp.g_varchar2_table(1769) := 'lication/x-mscardfile'';'||wwv_flow.LF||
'  mime_t(''clp'') := ''application/x-msclip'';'||wwv_flow.LF||
'  mime_t(''exe'') := ''application';
wwv_flow_imp.g_varchar2_table(1770) := '/x-msdownload'';'||wwv_flow.LF||
'  mime_t(''dll'') := ''application/x-msdownload'';'||wwv_flow.LF||
'  mime_t(''com'') := ''application/x-m';
wwv_flow_imp.g_varchar2_table(1771) := 'sdownload'';'||wwv_flow.LF||
'  mime_t(''bat'') := ''application/x-msdownload'';'||wwv_flow.LF||
'  mime_t(''msi'') := ''application/x-msdow';
wwv_flow_imp.g_varchar2_table(1772) := 'nload'';'||wwv_flow.LF||
'  mime_t(''mvb'') := ''application/x-msmediaview'';'||wwv_flow.LF||
'  mime_t(''m13'') := ''application/x-msmediav';
wwv_flow_imp.g_varchar2_table(1773) := 'iew'';'||wwv_flow.LF||
'  mime_t(''m14'') := ''application/x-msmediaview'';'||wwv_flow.LF||
'  mime_t(''wmf'') := ''application/x-msmetafile';
wwv_flow_imp.g_varchar2_table(1774) := ''';'||wwv_flow.LF||
'  mime_t(''wmz'') := ''application/x-msmetafile'';'||wwv_flow.LF||
'  mime_t(''emf'') := ''application/x-msmetafile'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1775) := '  mime_t(''emz'') := ''application/x-msmetafile'';'||wwv_flow.LF||
'  mime_t(''mny'') := ''application/x-msmoney'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1776) := 't(''pub'') := ''application/x-mspublisher'';'||wwv_flow.LF||
'  mime_t(''scd'') := ''application/x-msschedule'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1777) := 'trm'') := ''application/x-msterminal'';'||wwv_flow.LF||
'  mime_t(''wri'') := ''application/x-mswrite'';'||wwv_flow.LF||
'  mime_t(''nc'') :=';
wwv_flow_imp.g_varchar2_table(1778) := ' ''application/x-netcdf'';'||wwv_flow.LF||
'  mime_t(''cdf'') := ''application/x-netcdf'';'||wwv_flow.LF||
'  mime_t(''nzb'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1779) := 'n/x-nzb'';'||wwv_flow.LF||
'  mime_t(''p12'') := ''application/x-pkcs12'';'||wwv_flow.LF||
'  mime_t(''pfx'') := ''application/x-pkcs12'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1780) := ' mime_t(''p7b'') := ''application/x-pkcs7-certificates'';'||wwv_flow.LF||
'  mime_t(''spc'') := ''application/x-pkcs7-certi';
wwv_flow_imp.g_varchar2_table(1781) := 'ficates'';'||wwv_flow.LF||
'  mime_t(''p7r'') := ''application/x-pkcs7-certreqresp'';'||wwv_flow.LF||
'  mime_t(''rar'') := ''application/x-';
wwv_flow_imp.g_varchar2_table(1782) := 'rar-compressed'';'||wwv_flow.LF||
'  mime_t(''ris'') := ''application/x-research-info-systems'';'||wwv_flow.LF||
'  mime_t(''sh'') := ''appl';
wwv_flow_imp.g_varchar2_table(1783) := 'ication/x-sh'';'||wwv_flow.LF||
'  mime_t(''shar'') := ''application/x-shar'';'||wwv_flow.LF||
'  mime_t(''swf'') := ''application/x-shockwa';
wwv_flow_imp.g_varchar2_table(1784) := 've-flash'';'||wwv_flow.LF||
'  mime_t(''xap'') := ''application/x-silverlight-app'';'||wwv_flow.LF||
'  mime_t(''sql'') := ''application/x-s';
wwv_flow_imp.g_varchar2_table(1785) := 'ql'';'||wwv_flow.LF||
'  mime_t(''sit'') := ''application/x-stuffit'';'||wwv_flow.LF||
'  mime_t(''sitx'') := ''application/x-stuffitx'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1786) := 'mime_t(''srt'') := ''application/x-subrip'';'||wwv_flow.LF||
'  mime_t(''sv4cpio'') := ''application/x-sv4cpio'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1787) := '''sv4crc'') := ''application/x-sv4crc'';'||wwv_flow.LF||
'  mime_t(''t3'') := ''application/x-t3vm-image'';'||wwv_flow.LF||
'  mime_t(''gam'')';
wwv_flow_imp.g_varchar2_table(1788) := ' := ''application/x-tads'';'||wwv_flow.LF||
'  mime_t(''tar'') := ''application/x-tar'';'||wwv_flow.LF||
'  mime_t(''tcl'') := ''application/';
wwv_flow_imp.g_varchar2_table(1789) := 'x-tcl'';'||wwv_flow.LF||
'  mime_t(''tex'') := ''application/x-tex'';'||wwv_flow.LF||
'  mime_t(''tfm'') := ''application/x-tex-tfm'';'||wwv_flow.LF||
'  mim';
wwv_flow_imp.g_varchar2_table(1790) := 'e_t(''texinfo'') := ''application/x-texinfo'';'||wwv_flow.LF||
'  mime_t(''texi'') := ''application/x-texinfo'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1791) := 'obj'') := ''application/x-tgif'';'||wwv_flow.LF||
'  mime_t(''ustar'') := ''application/x-ustar'';'||wwv_flow.LF||
'  mime_t(''src'') := ''app';
wwv_flow_imp.g_varchar2_table(1792) := 'lication/x-wais-source'';'||wwv_flow.LF||
'  mime_t(''der'') := ''application/x-x509-ca-cert'';'||wwv_flow.LF||
'  mime_t(''crt'') := ''appl';
wwv_flow_imp.g_varchar2_table(1793) := 'ication/x-x509-ca-cert'';'||wwv_flow.LF||
'  mime_t(''fig'') := ''application/x-xfig'';'||wwv_flow.LF||
'  mime_t(''xlf'') := ''application/';
wwv_flow_imp.g_varchar2_table(1794) := 'x-xliff+xml'';'||wwv_flow.LF||
'  mime_t(''xpi'') := ''application/x-xpinstall'';'||wwv_flow.LF||
'  mime_t(''xz'') := ''application/x-xz'';';
wwv_flow_imp.g_varchar2_table(1795) := ''||wwv_flow.LF||
'  mime_t(''z1'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z2'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1796) := '''z3'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z4'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z5'') := ''';
wwv_flow_imp.g_varchar2_table(1797) := 'application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z6'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z7'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1798) := 'n/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''z8'') := ''application/x-zmachine'';'||wwv_flow.LF||
'  mime_t(''xaml'') := ''application/xaml+x';
wwv_flow_imp.g_varchar2_table(1799) := 'ml'';'||wwv_flow.LF||
'  mime_t(''xdf'') := ''application/xcap-diff+xml'';'||wwv_flow.LF||
'  mime_t(''xenc'') := ''application/xenc+xml'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1800) := '  mime_t(''xhtml'') := ''application/xhtml+xml'';'||wwv_flow.LF||
'  mime_t(''xht'') := ''application/xhtml+xml'';'||wwv_flow.LF||
'  mime_t';
wwv_flow_imp.g_varchar2_table(1801) := '(''xml'') := ''application/xml'';'||wwv_flow.LF||
'  mime_t(''xsl'') := ''application/xml'';'||wwv_flow.LF||
'  mime_t(''dtd'') := ''applicatio';
wwv_flow_imp.g_varchar2_table(1802) := 'n/xml-dtd'';'||wwv_flow.LF||
'  mime_t(''xop'') := ''application/xop+xml'';'||wwv_flow.LF||
'  mime_t(''xpl'') := ''application/xproc+xml'';';
wwv_flow_imp.g_varchar2_table(1803) := ''||wwv_flow.LF||
'  mime_t(''xslt'') := ''application/xslt+xml'';'||wwv_flow.LF||
'  mime_t(''xspf'') := ''application/xspf+xml'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1804) := '''mxml'') := ''application/xv+xml'';'||wwv_flow.LF||
'  mime_t(''xhvml'') := ''application/xv+xml'';'||wwv_flow.LF||
'  mime_t(''xvml'') := ''a';
wwv_flow_imp.g_varchar2_table(1805) := 'pplication/xv+xml'';'||wwv_flow.LF||
'  mime_t(''xvm'') := ''application/xv+xml'';'||wwv_flow.LF||
'  mime_t(''yang'') := ''application/yang';
wwv_flow_imp.g_varchar2_table(1806) := ''';'||wwv_flow.LF||
'  mime_t(''yin'') := ''application/yin+xml'';'||wwv_flow.LF||
'  mime_t(''zip'') := ''application/zip'';'||wwv_flow.LF||
'  mime_t(''adp''';
wwv_flow_imp.g_varchar2_table(1807) := ') := ''audio/adpcm'';'||wwv_flow.LF||
'  mime_t(''au'') := ''audio/basic'';'||wwv_flow.LF||
'  mime_t(''snd'') := ''audio/basic'';'||wwv_flow.LF||
'  mime_t(''';
wwv_flow_imp.g_varchar2_table(1808) := 'mid'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_t(''midi'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_t(''kar'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_';
wwv_flow_imp.g_varchar2_table(1809) := 't(''rmi'') := ''audio/midi'';'||wwv_flow.LF||
'  mime_t(''m4a'') := ''audio/mp4'';'||wwv_flow.LF||
'  mime_t(''mp4a'') := ''audio/mp4'';'||wwv_flow.LF||
'  mime';
wwv_flow_imp.g_varchar2_table(1810) := '_t(''mpga'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''mp2'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''mp2a'') := ''audio/mpeg'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1811) := 'mime_t(''mp3'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''m2a'') := ''audio/mpeg'';'||wwv_flow.LF||
'  mime_t(''m3a'') := ''audio/mpeg'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1812) := '  mime_t(''oga'') := ''audio/ogg'';'||wwv_flow.LF||
'  mime_t(''ogg'') := ''audio/ogg'';'||wwv_flow.LF||
'  mime_t(''spx'') := ''audio/ogg'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1813) := ' mime_t(''opus'') := ''audio/ogg'';'||wwv_flow.LF||
'  mime_t(''s3m'') := ''audio/s3m'';'||wwv_flow.LF||
'  mime_t(''sil'') := ''audio/silk'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1814) := '  mime_t(''uva'') := ''audio/vnd.dece.audio'';'||wwv_flow.LF||
'  mime_t(''uvva'') := ''audio/vnd.dece.audio'';'||wwv_flow.LF||
'  mime_t(''e';
wwv_flow_imp.g_varchar2_table(1815) := 'ol'') := ''audio/vnd.digital-winds'';'||wwv_flow.LF||
'  mime_t(''dra'') := ''audio/vnd.dra'';'||wwv_flow.LF||
'  mime_t(''dts'') := ''audio/v';
wwv_flow_imp.g_varchar2_table(1816) := 'nd.dts'';'||wwv_flow.LF||
'  mime_t(''dtshd'') := ''audio/vnd.dts.hd'';'||wwv_flow.LF||
'  mime_t(''lvp'') := ''audio/vnd.lucent.voice'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1817) := 'mime_t(''pya'') := ''audio/vnd.ms-playready.media.pya'';'||wwv_flow.LF||
'  mime_t(''ecelp4800'') := ''audio/vnd.nuera.ecel';
wwv_flow_imp.g_varchar2_table(1818) := 'p4800'';'||wwv_flow.LF||
'  mime_t(''ecelp7470'') := ''audio/vnd.nuera.ecelp7470'';'||wwv_flow.LF||
'  mime_t(''ecelp9600'') := ''audio/vnd.';
wwv_flow_imp.g_varchar2_table(1819) := 'nuera.ecelp9600'';'||wwv_flow.LF||
'  mime_t(''rip'') := ''audio/vnd.rip'';'||wwv_flow.LF||
'  mime_t(''weba'') := ''audio/webm'';'||wwv_flow.LF||
'  mime_t(';
wwv_flow_imp.g_varchar2_table(1820) := '''aac'') := ''audio/x-aac'';'||wwv_flow.LF||
'  mime_t(''aif'') := ''audio/x-aiff'';'||wwv_flow.LF||
'  mime_t(''aiff'') := ''audio/x-aiff'';'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1821) := ' mime_t(''aifc'') := ''audio/x-aiff'';'||wwv_flow.LF||
'  mime_t(''caf'') := ''audio/x-caf'';'||wwv_flow.LF||
'  mime_t(''flac'') := ''audio/x-';
wwv_flow_imp.g_varchar2_table(1822) := 'flac'';'||wwv_flow.LF||
'  mime_t(''mka'') := ''audio/x-matroska'';'||wwv_flow.LF||
'  mime_t(''m3u'') := ''audio/x-mpegurl'';'||wwv_flow.LF||
'  mime_t(''wax';
wwv_flow_imp.g_varchar2_table(1823) := ''') := ''audio/x-ms-wax'';'||wwv_flow.LF||
'  mime_t(''wma'') := ''audio/x-ms-wma'';'||wwv_flow.LF||
'  mime_t(''ram'') := ''audio/x-pn-realau';
wwv_flow_imp.g_varchar2_table(1824) := 'dio'';'||wwv_flow.LF||
'  mime_t(''ra'') := ''audio/x-pn-realaudio'';'||wwv_flow.LF||
'  mime_t(''rmp'') := ''audio/x-pn-realaudio-plugin'';';
wwv_flow_imp.g_varchar2_table(1825) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(1826) := '-----------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_MIME";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or re';
wwv_flow_imp.g_varchar2_table(1827) := 'place package body "BLOG_FILE"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1828) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1829) := '-- Private constants and variables'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1830) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1831) := '-- none'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(1832) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedures and f';
wwv_flow_imp.g_varchar2_table(1833) := 'unctions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(1834) := '------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure upload_to_data';
wwv_flow_imp.g_varchar2_table(1835) := 'base('||wwv_flow.LF||
'    p_file_name             in varchar2,'||wwv_flow.LF||
'    p_dir                   in varchar2,'||wwv_flow.LF||
'    p_mim';
wwv_flow_imp.g_varchar2_table(1836) := 'e_type             in varchar2,'||wwv_flow.LF||
'    p_file_size             in integer,'||wwv_flow.LF||
'    p_overwrite_file      ';
wwv_flow_imp.g_varchar2_table(1837) := '  in varchar2,'||wwv_flow.LF||
'    p_collection_name       in varchar2,'||wwv_flow.LF||
'    p_blob_content          in blob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1838) := '  as'||wwv_flow.LF||
'    l_file_path varchar2(2000);'||wwv_flow.LF||
'    l_file_desc varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.i';
wwv_flow_imp.g_varchar2_table(1839) := 'nfo( ''File name to upload: %s'', p_file_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- format file path'||wwv_flow.LF||
'    l_file_path := format';
wwv_flow_imp.g_varchar2_table(1840) := '_file_path( p_file_name, p_dir );'||wwv_flow.LF||
''||wwv_flow.LF||
'    case p_overwrite_file'||wwv_flow.LF||
'    when ''N'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      begi';
wwv_flow_imp.g_varchar2_table(1841) := 'n'||wwv_flow.LF||
'        insert into blog_files( file_path, file_size, mime_type, blob_content )'||wwv_flow.LF||
'          values';
wwv_flow_imp.g_varchar2_table(1842) := '( l_file_path, p_file_size, p_mime_type, p_blob_content )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- if file exists hand';
wwv_flow_imp.g_varchar2_table(1843) := 'le exception'||wwv_flow.LF||
'      exception when dup_val_on_index'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- create collection for st';
wwv_flow_imp.g_varchar2_table(1844) := 'oring file temporaly'||wwv_flow.LF||
'        -- we prompt user to confirm file overwrite'||wwv_flow.LF||
'        -- and show file ';
wwv_flow_imp.g_varchar2_table(1845) := 'information e.g. name and possible description from collection'||wwv_flow.LF||
'        -- then if user confirms, we';
wwv_flow_imp.g_varchar2_table(1846) := ' can overwrite file using data stored in collection'||wwv_flow.LF||
'        if not apex_collection.collection_exist';
wwv_flow_imp.g_varchar2_table(1847) := 's( p_collection_name )'||wwv_flow.LF||
'        then'||wwv_flow.LF||
'          apex_collection.create_collection( p_collection_name';
wwv_flow_imp.g_varchar2_table(1848) := ' );'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file_desc := get_file_desc( l_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- store fil';
wwv_flow_imp.g_varchar2_table(1849) := 'e lob and other info to collection'||wwv_flow.LF||
'        apex_collection.add_member('||wwv_flow.LF||
'          p_collection_name';
wwv_flow_imp.g_varchar2_table(1850) := ' => p_collection_name'||wwv_flow.LF||
'        , p_c001            => l_file_path'||wwv_flow.LF||
'        , p_c002            => l_';
wwv_flow_imp.g_varchar2_table(1851) := 'file_desc'||wwv_flow.LF||
'        , p_c003            => p_mime_type'||wwv_flow.LF||
'        , p_n001            => p_file_size'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1852) := '       , p_blob001         => p_blob_content'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    when ''Y'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1853) := '    -- merge file info to blog_files'||wwv_flow.LF||
'      merge into blog_files t1'||wwv_flow.LF||
'      using dual on ( t1.file_';
wwv_flow_imp.g_varchar2_table(1854) := 'path = l_file_path )'||wwv_flow.LF||
'      when not matched then'||wwv_flow.LF||
'        insert( file_path, file_size, mime_type, ';
wwv_flow_imp.g_varchar2_table(1855) := 'blob_content )'||wwv_flow.LF||
'          values( l_file_path, p_file_size, p_mime_type, p_blob_content )'||wwv_flow.LF||
'      whe';
wwv_flow_imp.g_varchar2_table(1856) := 'n matched then'||wwv_flow.LF||
'        update set'||wwv_flow.LF||
'          file_size     = p_file_size'||wwv_flow.LF||
'        , mime_type     =';
wwv_flow_imp.g_varchar2_table(1857) := ' p_mime_type'||wwv_flow.LF||
'        , blob_content  = p_blob_content'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end case;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_to_';
wwv_flow_imp.g_varchar2_table(1858) := 'database;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(1859) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and p';
wwv_flow_imp.g_varchar2_table(1860) := 'rocedures'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(1861) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_zip_name r';
wwv_flow_imp.g_varchar2_table(1862) := 'eturn varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_message => ''%s.zip''';
wwv_flow_imp.g_varchar2_table(1863) := ''||wwv_flow.LF||
'      , p0 =>'||wwv_flow.LF||
'          apex_string_util.get_slug('||wwv_flow.LF||
'            p_string => lower( ''blog_files'' )';
wwv_flow_imp.g_varchar2_table(1864) := ''||wwv_flow.LF||
'          , p_hash_length => 6'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'  end get_zip_name;'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(1865) := '---------------------------------------------------------------'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(1866) := '---------------------------------------------'||wwv_flow.LF||
'  function format_file_path('||wwv_flow.LF||
'    p_file_name in varc';
wwv_flow_imp.g_varchar2_table(1867) := 'har2,'||wwv_flow.LF||
'    p_dir       in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_path varchar2(2000);'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1868) := 'l_dir       varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Formating file name %s, dir %s'', p_fil';
wwv_flow_imp.g_varchar2_table(1869) := 'e_name, p_dir );'||wwv_flow.LF||
'    -- format file path'||wwv_flow.LF||
'    l_dir := utl_url.escape( trim( trim( both ''/'' from p_';
wwv_flow_imp.g_varchar2_table(1870) := 'dir ) ) );'||wwv_flow.LF||
'    l_file_path := utl_url.escape( trim( regexp_replace( p_file_name, ''\s+'', ''_'' ) ) );';
wwv_flow_imp.g_varchar2_table(1871) := ''||wwv_flow.LF||
'    l_file_path :='||wwv_flow.LF||
'      case when l_dir is null'||wwv_flow.LF||
'        then l_file_path'||wwv_flow.LF||
'        else l_dir || ';
wwv_flow_imp.g_varchar2_table(1872) := '''/'' || l_file_path'||wwv_flow.LF||
'      end'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Formated file path: %s'', l_file_path )';
wwv_flow_imp.g_varchar2_table(1873) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_file_path;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end format_file_path;'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(1874) := '-------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1875) := '-------------------'||wwv_flow.LF||
'  function get_file_desc('||wwv_flow.LF||
'    p_file_path in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1876) := 'as'||wwv_flow.LF||
'    l_file_desc varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'    -- fetch file description from databa';
wwv_flow_imp.g_varchar2_table(1877) := 'se'||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1.file_desc'||wwv_flow.LF||
'      into l_file_desc'||wwv_flow.LF||
'      from blog_files t1'||wwv_flow.LF||
'      wher';
wwv_flow_imp.g_varchar2_table(1878) := 'e 1 = 1'||wwv_flow.LF||
'      and t1.file_path = p_file_path'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    exception when no_data_found'||wwv_flow.LF||
'    then';
wwv_flow_imp.g_varchar2_table(1879) := ''||wwv_flow.LF||
'      l_file_desc := null;'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_file_desc;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_file_desc;'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(1880) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(1881) := '-----------------------------------------------------'||wwv_flow.LF||
'  procedure upload_file('||wwv_flow.LF||
'    p_file_names   ';
wwv_flow_imp.g_varchar2_table(1882) := '     in varchar2,'||wwv_flow.LF||
'    p_dir               in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(1883) := '_extract           in varchar2 default ''N'','||wwv_flow.LF||
'    p_overwrite_file    in varchar2 default ''N'''||wwv_flow.LF||
'  )'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1884) := ' as'||wwv_flow.LF||
'    l_file_names    apex_t_varchar2;'||wwv_flow.LF||
'    l_file_name     varchar2(500);'||wwv_flow.LF||
'    l_mime_type     v';
wwv_flow_imp.g_varchar2_table(1885) := 'archar2(500);'||wwv_flow.LF||
'    l_file_size     integer;'||wwv_flow.LF||
'    l_zip_dir       apex_zip.t_dir_entries;'||wwv_flow.LF||
'    l_zip_';
wwv_flow_imp.g_varchar2_table(1886) := 'file_path varchar2(32767);'||wwv_flow.LF||
'    l_unzipped      blob := empty_blob();'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_collec';
wwv_flow_imp.g_varchar2_table(1887) := 'tion.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.delete_collection( p_co';
wwv_flow_imp.g_varchar2_table(1888) := 'llection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get file names'||wwv_flow.LF||
'    l_file_names :='||wwv_flow.LF||
'      apex_string.split';
wwv_flow_imp.g_varchar2_table(1889) := '('||wwv_flow.LF||
'        p_str => p_file_names'||wwv_flow.LF||
'      , p_sep => '':'''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- loop file'||wwv_flow.LF||
'    for ';
wwv_flow_imp.g_varchar2_table(1890) := 'c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        files.filename'||wwv_flow.LF||
'      , files.mime_type'||wwv_flow.LF||
'      , files.blob_content'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1891) := '     from apex_application_temp_files files'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'        select 1';
wwv_flow_imp.g_varchar2_table(1892) := ''||wwv_flow.LF||
'        from table( l_file_names ) x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and x1.column_value = files.n';
wwv_flow_imp.g_varchar2_table(1893) := 'ame'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Processing file %s : %s'''||wwv_flow.LF||
'      , c1.filename'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1894) := '     , c1.mime_type'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_extract = ''Y'''||wwv_flow.LF||
'      and c1.mime_type = ''application/zip';
wwv_flow_imp.g_varchar2_table(1895) := ''''||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_dir :='||wwv_flow.LF||
'          apex_zip.get_dir_entries('||wwv_flow.LF||
'            p_zipped_blo';
wwv_flow_imp.g_varchar2_table(1896) := 'b => c1.blob_content'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_file_path := l_zip_dir.first;'||wwv_flow.LF||
''||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(1897) := '   while l_zip_file_path is not null'||wwv_flow.LF||
'        loop'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_unzipped :='||wwv_flow.LF||
'            apex_zip.';
wwv_flow_imp.g_varchar2_table(1898) := 'get_file_content('||wwv_flow.LF||
'              p_zipped_blob => c1.blob_content'||wwv_flow.LF||
'            , p_dir_entry   => l_';
wwv_flow_imp.g_varchar2_table(1899) := 'zip_dir( l_zip_file_path )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          ;'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_mime_type := blog_mime.get_mim';
wwv_flow_imp.g_varchar2_table(1900) := 'e_type( l_zip_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_file_size := dbms_lob.getlength( l_unzipped );'||wwv_flow.LF||
''||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(1901) := '  upload_to_database('||wwv_flow.LF||
'            p_file_name         => l_zip_file_path'||wwv_flow.LF||
'          , p_dir        ';
wwv_flow_imp.g_varchar2_table(1902) := '       => p_dir'||wwv_flow.LF||
'          , p_mime_type         => l_mime_type'||wwv_flow.LF||
'          , p_file_size         => ';
wwv_flow_imp.g_varchar2_table(1903) := 'l_file_size'||wwv_flow.LF||
'          , p_overwrite_file    => p_overwrite_file'||wwv_flow.LF||
'          , p_collection_name   =>';
wwv_flow_imp.g_varchar2_table(1904) := ' p_collection_name'||wwv_flow.LF||
'          , p_blob_content      => l_unzipped'||wwv_flow.LF||
'          );'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_zip_f';
wwv_flow_imp.g_varchar2_table(1905) := 'ile_path := l_zip_dir.next( l_zip_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'        end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file_';
wwv_flow_imp.g_varchar2_table(1906) := 'size := dbms_lob.getlength( c1.blob_content );'||wwv_flow.LF||
''||wwv_flow.LF||
'        upload_to_database('||wwv_flow.LF||
'          p_file_name';
wwv_flow_imp.g_varchar2_table(1907) := '         => c1.filename'||wwv_flow.LF||
'        , p_dir               => p_dir'||wwv_flow.LF||
'        , p_mime_type         => c1';
wwv_flow_imp.g_varchar2_table(1908) := '.mime_type'||wwv_flow.LF||
'        , p_file_size         => l_file_size'||wwv_flow.LF||
'        , p_overwrite_file    => p_overwri';
wwv_flow_imp.g_varchar2_table(1909) := 'te_file'||wwv_flow.LF||
'        , p_collection_name   => p_collection_name'||wwv_flow.LF||
'        , p_blob_content      => c1.blo';
wwv_flow_imp.g_varchar2_table(1910) := 'b_content'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_file;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(1911) := '-----------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(1912) := '-----------------------------------------'||wwv_flow.LF||
'  procedure replace_file('||wwv_flow.LF||
'    p_collection_name in varch';
wwv_flow_imp.g_varchar2_table(1913) := 'ar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        c001    as file_path'||wwv_flow.LF||
'      , c002 ';
wwv_flow_imp.g_varchar2_table(1914) := '   as file_desc'||wwv_flow.LF||
'      , c003    as mime_type'||wwv_flow.LF||
'      , n001    as file_size'||wwv_flow.LF||
'      , blob001 as blob';
wwv_flow_imp.g_varchar2_table(1915) := '_content'||wwv_flow.LF||
'      from apex_collections'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and collection_name = p_collection';
wwv_flow_imp.g_varchar2_table(1916) := '_name'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      upload_to_database('||wwv_flow.LF||
'        p_file_name         => c1.file_path'||wwv_flow.LF||
'      ,';
wwv_flow_imp.g_varchar2_table(1917) := ' p_dir               => null'||wwv_flow.LF||
'      , p_mime_type         => c1.mime_type'||wwv_flow.LF||
'      , p_file_size      ';
wwv_flow_imp.g_varchar2_table(1918) := '   => c1.file_size'||wwv_flow.LF||
'      , p_overwrite_file    => ''Y'''||wwv_flow.LF||
'      , p_collection_name   => p_collection_';
wwv_flow_imp.g_varchar2_table(1919) := 'name'||wwv_flow.LF||
'      , p_blob_content      => c1.blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_colle';
wwv_flow_imp.g_varchar2_table(1920) := 'ction.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.delete_collection( p_c';
wwv_flow_imp.g_varchar2_table(1921) := 'ollection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end replace_file;'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(1922) := '-----------------------------------'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1923) := '-----------------'||wwv_flow.LF||
'  procedure file_select_collection('||wwv_flow.LF||
'    p_collection_name in varchar2,'||wwv_flow.LF||
'    p_se';
wwv_flow_imp.g_varchar2_table(1924) := 'q_id          in number,'||wwv_flow.LF||
'    p_id              in number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_seq number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1925) := '    -- create collection if not exists'||wwv_flow.LF||
'    if not apex_collection.collection_exists( p_collection_n';
wwv_flow_imp.g_varchar2_table(1926) := 'ame )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.create_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(1927) := '- if no seq_id from Ajax call, save file id/name to collection'||wwv_flow.LF||
'    if trim( p_seq_id ) is null'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1928) := ' then'||wwv_flow.LF||
'      l_seq := apex_collection.add_member('||wwv_flow.LF||
'        p_collection_name => p_collection_name'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1929) := '     , p_n001 => p_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    -- if seq_id exists, delete row from collection'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(1930) := '  apex_collection.delete_member('||wwv_flow.LF||
'        p_collection_name => p_collection_name'||wwv_flow.LF||
'      , p_seq => p';
wwv_flow_imp.g_varchar2_table(1931) := '_seq_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- write header for the output'||wwv_flow.LF||
'    apex_plugin_util.print_jso';
wwv_flow_imp.g_varchar2_table(1932) := 'n_http_header;'||wwv_flow.LF||
'    -- write seq_id to output'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_json.write('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1933) := '   p_name        => ''seq'''||wwv_flow.LF||
'    , p_value       => l_seq'||wwv_flow.LF||
'    , p_write_null  => true'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    ap';
wwv_flow_imp.g_varchar2_table(1934) := 'ex_json.close_all;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    -- if error happens'||wwv_flow.LF||
'    -- write header ';
wwv_flow_imp.g_varchar2_table(1935) := 'for the output'||wwv_flow.LF||
'    apex_debug.error( ''Select file failed: %s'', sqlerrm );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_plugin_util.p';
wwv_flow_imp.g_varchar2_table(1936) := 'rint_json_http_header;'||wwv_flow.LF||
'    -- write error message to output'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_j';
wwv_flow_imp.g_varchar2_table(1937) := 'son.write('||wwv_flow.LF||
'      p_name  => ''status'''||wwv_flow.LF||
'    , p_value => apex_lang.get_message( ''BLOG_GENERIC_ERROR'' ';
wwv_flow_imp.g_varchar2_table(1938) := ')'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_json.close_all;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end file_select_collection;'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(1939) := '--------------------------------------------------'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1940) := '--------------------------------'||wwv_flow.LF||
'  procedure delete_selected_files('||wwv_flow.LF||
'    p_collection_name in varch';
wwv_flow_imp.g_varchar2_table(1941) := 'ar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- delete selected files'||wwv_flow.LF||
'    delete'||wwv_flow.LF||
'    from blog_files t1'||wwv_flow.LF||
'    whe';
wwv_flow_imp.g_varchar2_table(1942) := 're 1 = 1'||wwv_flow.LF||
'      and exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'        from apex_collections x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1943) := '          and x1.collection_name = p_collection_name'||wwv_flow.LF||
'          and x1.n001 = t1.id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;';
wwv_flow_imp.g_varchar2_table(1944) := ''||wwv_flow.LF||
'    -- truncate collection'||wwv_flow.LF||
'    apex_collection.truncate_collection( p_collection_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ';
wwv_flow_imp.g_varchar2_table(1945) := 'delete_selected_files;'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1946) := '----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure ';
wwv_flow_imp.g_varchar2_table(1947) := 'download_selected_files('||wwv_flow.LF||
'    p_collection_name in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_cnt      pls_inte';
wwv_flow_imp.g_varchar2_table(1948) := 'ger := 0;'||wwv_flow.LF||
'    l_file_name     varchar2(256);'||wwv_flow.LF||
'    l_content_type  varchar2(256);'||wwv_flow.LF||
'    l_blob_conten';
wwv_flow_imp.g_varchar2_table(1949) := 't  blob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- fetch selected files'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1.file_path'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1950) := '      , t1.file_name'||wwv_flow.LF||
'      , t1.mime_type'||wwv_flow.LF||
'      , t1.blob_content'||wwv_flow.LF||
'      , count(1) over() as num_';
wwv_flow_imp.g_varchar2_table(1951) := 'rows'||wwv_flow.LF||
'      from blog_v_all_files t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and exists('||wwv_flow.LF||
'          select 1'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(1952) := '        from apex_collections x1'||wwv_flow.LF||
'          where 1 = 1'||wwv_flow.LF||
'            and x1.collection_name = p_coll';
wwv_flow_imp.g_varchar2_table(1953) := 'ection_name'||wwv_flow.LF||
'            and x1.n001 = t1.id'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    )loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_file_cnt := c1.num_row';
wwv_flow_imp.g_varchar2_table(1954) := 's;'||wwv_flow.LF||
''||wwv_flow.LF||
'      if l_file_cnt = 1'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        l_file_name     := c1.file_name;'||wwv_flow.LF||
'        l_conte';
wwv_flow_imp.g_varchar2_table(1955) := 'nt_type  := c1.mime_type;'||wwv_flow.LF||
'        l_blob_content  := c1.blob_content;'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        -- add f';
wwv_flow_imp.g_varchar2_table(1956) := 'ile to zip'||wwv_flow.LF||
'        apex_zip.add_file('||wwv_flow.LF||
'          p_zipped_blob => l_blob_content'||wwv_flow.LF||
'        , p_file_';
wwv_flow_imp.g_varchar2_table(1957) := 'name   => c1.file_path'||wwv_flow.LF||
'        , p_content     => c1.blob_content'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1958) := ' end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if l_file_cnt = 0'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- TO DO: raise error here'||wwv_flow.LF||
'      null;'||wwv_flow.LF||
'    el';
wwv_flow_imp.g_varchar2_table(1959) := 'sif l_file_cnt > 1'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get zip name'||wwv_flow.LF||
'      l_file_name := get_zip_name;'||wwv_flow.LF||
'      -- ';
wwv_flow_imp.g_varchar2_table(1960) := 'set content type'||wwv_flow.LF||
'      l_content_type := ''application/zip'';'||wwv_flow.LF||
'      -- close zip'||wwv_flow.LF||
'      apex_zip.fin';
wwv_flow_imp.g_varchar2_table(1961) := 'ish('||wwv_flow.LF||
'        p_zipped_blob => l_blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- download file/zip'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1962) := '    apex_http.download('||wwv_flow.LF||
'      p_blob          => l_blob_content'||wwv_flow.LF||
'    , p_content_type  => l_content';
wwv_flow_imp.g_varchar2_table(1963) := '_type'||wwv_flow.LF||
'    , p_filename      => l_file_name'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end download_selected_files;'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(1964) := '-------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(1965) := '-------------------------------------------------'||wwv_flow.LF||
'end "BLOG_FILE";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package bo';
wwv_flow_imp.g_varchar2_table(1966) := 'dy "BLOG_UTIL"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1967) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private const';
wwv_flow_imp.g_varchar2_table(1968) := 'ants and variables'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1969) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(1970) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(1971) := '-------------------------------------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(1972) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(1973) := '--------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(1974) := '-----------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1975) := '-----------------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(1976) := '-----------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1977) := '-----------------------------'||wwv_flow.LF||
'  function remove_whitespace('||wwv_flow.LF||
'    p_string  in varchar2'||wwv_flow.LF||
'  ) return ';
wwv_flow_imp.g_varchar2_table(1978) := 'varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- remove whitespace characters from string'||wwv_flow.LF||
'    return trim( regexp_re';
wwv_flow_imp.g_varchar2_table(1979) := 'place( p_string, ''\s+'', '' '' ) );'||wwv_flow.LF||
'  end remove_whitespace;'||wwv_flow.LF||
'----------------------------------------';
wwv_flow_imp.g_varchar2_table(1980) := '----------------------------------------'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(1981) := '----------------------'||wwv_flow.LF||
'  procedure raise_http_error('||wwv_flow.LF||
'    p_error_code  in number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  beg';
wwv_flow_imp.g_varchar2_table(1982) := 'in'||wwv_flow.LF||
'    -- output HTTP status'||wwv_flow.LF||
'    owa_util.status_line( p_error_code );'||wwv_flow.LF||
'    -- stop APEX'||wwv_flow.LF||
'    apex';
wwv_flow_imp.g_varchar2_table(1983) := '_application.stop_apex_engine;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
'  end raise_http_erro';
wwv_flow_imp.g_varchar2_table(1984) := 'r;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(1985) := '------------------------------------------------------------------'||wwv_flow.LF||
'  function apex_error_handler('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(1986) := '    p_error in apex_error.t_error'||wwv_flow.LF||
'  ) return apex_error.t_error_result'||wwv_flow.LF||
'  as'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_genereric_err';
wwv_flow_imp.g_varchar2_table(1987) := 'or constant varchar2(255) := ''BLOG_GENERIC_ERROR'';'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_result          apex_error.t_error_resul';
wwv_flow_imp.g_varchar2_table(1988) := 't;'||wwv_flow.LF||
'    l_reference_id    pls_integer;'||wwv_flow.LF||
'    l_constraint_name varchar2(255);'||wwv_flow.LF||
'    l_err_mesg        ';
wwv_flow_imp.g_varchar2_table(1989) := 'varchar2(32700);'||wwv_flow.LF||
''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- This function must be used to ensure initialization is compati';
wwv_flow_imp.g_varchar2_table(1990) := 'ble'||wwv_flow.LF||
'    -- with future changes to t_error_result.'||wwv_flow.LF||
'    l_result :='||wwv_flow.LF||
'      apex_error.init_error_res';
wwv_flow_imp.g_varchar2_table(1991) := 'ult('||wwv_flow.LF||
'        p_error => p_error'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- If it''s an internal error raised by APEX, l';
wwv_flow_imp.g_varchar2_table(1992) := 'ike an invalid statement or'||wwv_flow.LF||
'    -- code which can''t be executed, the error text might contain secur';
wwv_flow_imp.g_varchar2_table(1993) := 'ity sensitive'||wwv_flow.LF||
'    -- information. To avoid this security problem we can rewrite the error to'||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(1994) := '- a generic error message and log the original error message for further'||wwv_flow.LF||
'    -- investigation by th';
wwv_flow_imp.g_varchar2_table(1995) := 'e help desk.'||wwv_flow.LF||
'    if p_error.is_internal_error'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      if not p_error.is_common_runtime_err';
wwv_flow_imp.g_varchar2_table(1996) := 'or'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- Change the message to the generic error message which doesn''t expose'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(1997) := '     -- any sensitive information.'||wwv_flow.LF||
'        l_result.message :='||wwv_flow.LF||
'          apex_lang.get_message('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(1998) := '           p_name => l_genereric_error'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'        l_result.additional_info := ';
wwv_flow_imp.g_varchar2_table(1999) := 'null;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- If it''s a constraint violation like'||wwv_flow.LF||
'      --'||wwv_flow.LF||
'      --  ';
wwv_flow_imp.g_varchar2_table(2000) := ' -) ORA-02292 ORA-02291 ORA-02290 ORA-02091 ORA-00001: unique constraint violated'||wwv_flow.LF||
'      --   -) : t';
wwv_flow_imp.g_varchar2_table(2001) := 'ransaction rolled back (-> can hide a deferred constraint)'||wwv_flow.LF||
'      --   -) : check constraint violate';
wwv_flow_imp.g_varchar2_table(2002) := 'd'||wwv_flow.LF||
'      --   -) : integrity constraint violated - parent key not found'||wwv_flow.LF||
'      --   -) : integrity c';
wwv_flow_imp.g_varchar2_table(2003) := 'onstraint violated - child record found'||wwv_flow.LF||
'      --'||wwv_flow.LF||
'      -- we try to get a friendly error message f';
wwv_flow_imp.g_varchar2_table(2004) := 'rom our constraint lookup configuration.'||wwv_flow.LF||
'      -- If we don''t find the constraint in our lookup tab';
wwv_flow_imp.g_varchar2_table(2005) := 'le we fallback to'||wwv_flow.LF||
'      -- the original ORA error message.'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_error.ora_sqlcode in (-1, ';
wwv_flow_imp.g_varchar2_table(2006) := '-2091, -2290, -2291, -2292)'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        l_constraint_name :='||wwv_flow.LF||
'          apex_error.extract_';
wwv_flow_imp.g_varchar2_table(2007) := 'constraint_name('||wwv_flow.LF||
'            p_error => p_error'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'        l_err_mesg :='||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2008) := '       apex_lang.get_message('||wwv_flow.LF||
'            p_name => l_constraint_name'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2009) := '    -- not every constraint has to be in our lookup table'||wwv_flow.LF||
'        if not l_err_mesg = l_constraint_';
wwv_flow_imp.g_varchar2_table(2010) := 'name'||wwv_flow.LF||
'        then'||wwv_flow.LF||
'          l_result.message := l_err_mesg;'||wwv_flow.LF||
'          l_result.additional_info :=';
wwv_flow_imp.g_varchar2_table(2011) := ' null;'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- If an ORA error has been raised, for example a ra';
wwv_flow_imp.g_varchar2_table(2012) := 'ise_application_error(-20xxx, ''...'')'||wwv_flow.LF||
'      -- in a table trigger or in a PL/SQL package called by a';
wwv_flow_imp.g_varchar2_table(2013) := ' process and we'||wwv_flow.LF||
'      -- haven''t found the error in our lookup table, then we just want to see'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2014) := '   -- the actual error text and not the full error stack with all the ORA error numbers.'||wwv_flow.LF||
'      if p';
wwv_flow_imp.g_varchar2_table(2015) := '_error.ora_sqlcode is not null'||wwv_flow.LF||
'      and l_result.message = p_error.message'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        l_';
wwv_flow_imp.g_varchar2_table(2016) := 'result.message :='||wwv_flow.LF||
'          apex_error.get_first_ora_error_text('||wwv_flow.LF||
'            p_error => p_error'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2017) := '         )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'        l_result.additional_info := null;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- If no as';
wwv_flow_imp.g_varchar2_table(2018) := 'sociated page item/tabular form column has been set, we can use'||wwv_flow.LF||
'      -- apex_error.auto_set_associ';
wwv_flow_imp.g_varchar2_table(2019) := 'ated_item to automatically guess the affected'||wwv_flow.LF||
'      -- error field by examine the ORA error for con';
wwv_flow_imp.g_varchar2_table(2020) := 'straint names or column names.'||wwv_flow.LF||
'      if l_result.page_item_name is null'||wwv_flow.LF||
'      and l_result.column_';
wwv_flow_imp.g_varchar2_table(2021) := 'alias is null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_error.auto_set_associated_item('||wwv_flow.LF||
'          p_error => p_erro';
wwv_flow_imp.g_varchar2_table(2022) := 'r'||wwv_flow.LF||
'        , p_error_result => l_result'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_re';
wwv_flow_imp.g_varchar2_table(2023) := 'sult;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end apex_error_handler;'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2024) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2025) := '  function int_to_vc2('||wwv_flow.LF||
'    p_value in number'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- convert nu';
wwv_flow_imp.g_varchar2_table(2026) := 'mber to string without decimals'||wwv_flow.LF||
'    return to_char( p_value,  ''fm9999999999999999999999999999999999';
wwv_flow_imp.g_varchar2_table(2027) := '9999'' );'||wwv_flow.LF||
'  end int_to_vc2;'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2028) := '---------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  funct';
wwv_flow_imp.g_varchar2_table(2029) := 'ion get_attribute_value('||wwv_flow.LF||
'    p_attribute_name in varchar2'||wwv_flow.LF||
'  ) return varchar2 result_cache'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2030) := '    l_value blog_settings.attribute_value%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if para';
wwv_flow_imp.g_varchar2_table(2031) := 'meter p_attribute_name is null'||wwv_flow.LF||
'    if p_attribute_name is null then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2032) := '  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch and return value from settings table'||wwv_flow.LF||
'    select attribute_value'||wwv_flow.LF||
'    into';
wwv_flow_imp.g_varchar2_table(2033) := ' l_value'||wwv_flow.LF||
'    from blog_settings'||wwv_flow.LF||
'    where attribute_name = p_attribute_name'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_deb';
wwv_flow_imp.g_varchar2_table(2034) := 'ug.info('||wwv_flow.LF||
'      p_message => ''Fetch attribute %s return: %s'''||wwv_flow.LF||
'    , p0 => p_attribute_name'||wwv_flow.LF||
'    , p1';
wwv_flow_imp.g_varchar2_table(2035) := ' => l_value'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return attribute value'||wwv_flow.LF||
'    return l_value;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- Handle error cases';
wwv_flow_imp.g_varchar2_table(2036) := ''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''Error: %s %s( %s';
wwv_flow_imp.g_varchar2_table(2037) := ' => %s )'''||wwv_flow.LF||
'      ,p0 => sqlerrm'||wwv_flow.LF||
'      ,p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.s';
wwv_flow_imp.g_varchar2_table(2038) := 'ubprogram(1))'||wwv_flow.LF||
'      ,p2 => ''p_attribute_name'''||wwv_flow.LF||
'      ,p3 => coalesce( p_attribute_name, ''(null)'' )';
wwv_flow_imp.g_varchar2_table(2039) := ''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_attribute_value;'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2040) := '-------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2041) := '-------------'||wwv_flow.LF||
'  procedure initialize_items('||wwv_flow.LF||
'    p_app_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_app_id blog';
wwv_flow_imp.g_varchar2_table(2042) := '_v_init_items.application_id%type;'||wwv_flow.LF||
''||wwv_flow.LF||
'    type item_value_r is record('||wwv_flow.LF||
'      item_name   blog_v_ini';
wwv_flow_imp.g_varchar2_table(2043) := 't_items.item_name%type,'||wwv_flow.LF||
'      item_value  blog_v_init_items.attribute_value%type'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    typ';
wwv_flow_imp.g_varchar2_table(2044) := 'e items_t is table of item_value_r;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_init_items items_t;'||wwv_flow.LF||
''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.enter(';
wwv_flow_imp.g_varchar2_table(2045) := ''||wwv_flow.LF||
'      p_routine_name  => ''blog_util.initialize_items'''||wwv_flow.LF||
'    , p_name01        => ''p_app_id'''||wwv_flow.LF||
'    , ';
wwv_flow_imp.g_varchar2_table(2046) := 'p_value01       => p_app_id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if parameter p_app_id_name i';
wwv_flow_imp.g_varchar2_table(2047) := 's null'||wwv_flow.LF||
'    if p_app_id is null then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver appli';
wwv_flow_imp.g_varchar2_table(2048) := 'cation id string to number'||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch items and values ';
wwv_flow_imp.g_varchar2_table(2049) := 'that session state need to be set'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      v1.item_name'||wwv_flow.LF||
'    , v1.attribute_value'||wwv_flow.LF||
'    bul';
wwv_flow_imp.g_varchar2_table(2050) := 'k collect into l_init_items'||wwv_flow.LF||
'    from blog_v_init_items v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and v1.applicatio';
wwv_flow_imp.g_varchar2_table(2051) := 'n_id = l_app_id'||wwv_flow.LF||
'      and ('||wwv_flow.LF||
'        v1.attribute_value != v1.session_value'||wwv_flow.LF||
'        or( v1.attribu';
wwv_flow_imp.g_varchar2_table(2052) := 'te_value is null and v1.session_value is not null )'||wwv_flow.LF||
'        or( v1.attribute_value is not null and ';
wwv_flow_imp.g_varchar2_table(2053) := 'v1.session_value is null )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_init_items.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2054) := '-- set item session state. do not commit.'||wwv_flow.LF||
'      apex_util.set_session_state('||wwv_flow.LF||
'        p_name    => ';
wwv_flow_imp.g_varchar2_table(2055) := 'l_init_items(i).item_name'||wwv_flow.LF||
'      , p_value   => l_init_items(i).item_value'||wwv_flow.LF||
'      , p_commit  => fal';
wwv_flow_imp.g_varchar2_table(2056) := 'se'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p';
wwv_flow_imp.g_varchar2_table(2057) := '_message => ''Error: %s. %s( %s => %s )'''||wwv_flow.LF||
'      ,p0 => sqlerrm'||wwv_flow.LF||
'      ,p1 => utl_call_stack.concatena';
wwv_flow_imp.g_varchar2_table(2058) := 'te_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p2 => ''p_app_id'''||wwv_flow.LF||
'      ,p3 => coalesce( p_app_i';
wwv_flow_imp.g_varchar2_table(2059) := 'd, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end initialize_items;'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(2060) := '--------------------------------------------'||wwv_flow.LF||
'------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2061) := '--------------------------'||wwv_flow.LF||
'  procedure get_post_details('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(2062) := '_post_title      out nocopy varchar2,'||wwv_flow.LF||
'    p_post_desc       out nocopy varchar2,'||wwv_flow.LF||
'    p_post_catego';
wwv_flow_imp.g_varchar2_table(2063) := 'ry   out nocopy varchar2,'||wwv_flow.LF||
'    p_post_author     out nocopy varchar2,'||wwv_flow.LF||
'    p_post_published  out noc';
wwv_flow_imp.g_varchar2_table(2064) := 'opy varchar2,'||wwv_flow.LF||
'    p_post_modified   out nocopy varchar2,'||wwv_flow.LF||
'    p_next_post_id    out nocopy varchar2';
wwv_flow_imp.g_varchar2_table(2065) := ','||wwv_flow.LF||
'    p_next_post_title out nocopy varchar2,'||wwv_flow.LF||
'    p_prev_post_id    out nocopy varchar2,'||wwv_flow.LF||
'    p_pre';
wwv_flow_imp.g_varchar2_table(2066) := 'v_post_title out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_next_post_id  number;'||wwv_flow.LF||
'    l_prev_post_id  number';
wwv_flow_imp.g_varchar2_table(2067) := ';'||wwv_flow.LF||
'    l_post_id       blog_v_posts.post_id%type;'||wwv_flow.LF||
'    l_published_on  blog_v_posts.published_on%typ';
wwv_flow_imp.g_varchar2_table(2068) := 'e;'||wwv_flow.LF||
'    l_changed_on    blog_v_posts.changed_on%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error i';
wwv_flow_imp.g_varchar2_table(2069) := 'f parameter p_post_id is null'||wwv_flow.LF||
'    if p_post_id is null then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if';
wwv_flow_imp.g_varchar2_table(2070) := ';'||wwv_flow.LF||
'    -- conver post id string to number'||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
'    -- fetch po';
wwv_flow_imp.g_varchar2_table(2071) := 'st title and description by post id'||wwv_flow.LF||
'    -- also fetch prev and next post id and title'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2072) := '      v1.post_title'||wwv_flow.LF||
'    , v1.post_desc'||wwv_flow.LF||
'    , v1.category_title'||wwv_flow.LF||
'    , v1.blogger_name'||wwv_flow.LF||
'    , v1.pu';
wwv_flow_imp.g_varchar2_table(2073) := 'blished_on'||wwv_flow.LF||
'    , v1.changed_on'||wwv_flow.LF||
'    , v1.next_post.post_id'||wwv_flow.LF||
'    , v1.next_post.post_title'||wwv_flow.LF||
'    , v1';
wwv_flow_imp.g_varchar2_table(2074) := '.prev_post.post_id'||wwv_flow.LF||
'    , v1.prev_post.post_title'||wwv_flow.LF||
'    into p_post_title'||wwv_flow.LF||
'    , p_post_desc'||wwv_flow.LF||
'    , p';
wwv_flow_imp.g_varchar2_table(2075) := '_post_category'||wwv_flow.LF||
'    , p_post_author'||wwv_flow.LF||
'    , l_published_on'||wwv_flow.LF||
'    , l_changed_on'||wwv_flow.LF||
'    , l_next_post_id';
wwv_flow_imp.g_varchar2_table(2076) := ''||wwv_flow.LF||
'    , p_next_post_title'||wwv_flow.LF||
'    , l_prev_post_id'||wwv_flow.LF||
'    , p_prev_post_title'||wwv_flow.LF||
'    from blog_v_posts v1'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2077) := '   where 1 = 1'||wwv_flow.LF||
'      and post_id = l_post_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    p_next_post_id := int_to_vc2( l_next_pos';
wwv_flow_imp.g_varchar2_table(2078) := 't_id );'||wwv_flow.LF||
'    p_prev_post_id := int_to_vc2( l_prev_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Get post published and modifi';
wwv_flow_imp.g_varchar2_table(2079) := 'ed UTC time'||wwv_flow.LF||
'    p_post_published :='||wwv_flow.LF||
'      to_char('||wwv_flow.LF||
'        sys_extract_utc( l_published_on )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2080) := '   , g_iso_8601_date'||wwv_flow.LF||
'      , g_nls_date_lang'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    p_post_modified :='||wwv_flow.LF||
'      to_char';
wwv_flow_imp.g_varchar2_table(2081) := '('||wwv_flow.LF||
'        sys_extract_utc( l_changed_on )'||wwv_flow.LF||
'      , g_iso_8601_date'||wwv_flow.LF||
'      , g_nls_date_lang'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2082) := ')'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p';
wwv_flow_imp.g_varchar2_table(2083) := '_message => ''Error: %s %s( %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenate_';
wwv_flow_imp.g_varchar2_table(2084) := 'subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_post_id'''||wwv_flow.LF||
'    , p3 => coalesce( p_post_id, ';
wwv_flow_imp.g_varchar2_table(2085) := '''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    raise_http_error( 404 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_';
wwv_flow_imp.g_varchar2_table(2086) := 'post_details;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(2087) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_catego';
wwv_flow_imp.g_varchar2_table(2088) := 'ry_title('||wwv_flow.LF||
'    p_category_id in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_category_id   blog_v_cate';
wwv_flow_imp.g_varchar2_table(2089) := 'gories.category_id%type;'||wwv_flow.LF||
'    l_category_name blog_v_categories.category_title%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2090) := ' -- raise no data found error if parameter p_category_id is null'||wwv_flow.LF||
'    if p_category_id is null then';
wwv_flow_imp.g_varchar2_table(2091) := ''||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver category id string to number'||wwv_flow.LF||
'    l_catego';
wwv_flow_imp.g_varchar2_table(2092) := 'ry_id := to_number( p_category_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch category name'||wwv_flow.LF||
'    select v1.category_title'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2093) := '  into l_category_name'||wwv_flow.LF||
'    from blog_v_categories v1'||wwv_flow.LF||
'    where v1.category_id = l_category_id'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2094) := ' ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return category name'||wwv_flow.LF||
'    return l_category_name;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2095) := ' when others then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_message => ''Error: %s %s( %s => %s, %s => %s )''';
wwv_flow_imp.g_varchar2_table(2096) := ''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1)';
wwv_flow_imp.g_varchar2_table(2097) := ')'||wwv_flow.LF||
'    , p2 => ''p_category_id'''||wwv_flow.LF||
'    , p3 => coalesce( p_category_id, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- sh';
wwv_flow_imp.g_varchar2_table(2098) := 'ow http error'||wwv_flow.LF||
'    raise_http_error( 404 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_category_title;'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(2099) := '------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(2100) := '------------------------------------------------'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id in varchar2'||wwv_flow.LF||
'  )';
wwv_flow_imp.g_varchar2_table(2101) := ' return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_tag_id    blog_v_tags.tag_id%type;'||wwv_flow.LF||
'    l_tag_name  blog_v_tags.tag%ty';
wwv_flow_imp.g_varchar2_table(2102) := 'pe;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- raise no data found error if parameter p_tag_id is null'||wwv_flow.LF||
'    if p_tag_id is n';
wwv_flow_imp.g_varchar2_table(2103) := 'ull then'||wwv_flow.LF||
'      raise no_data_found;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver tag id string to number'||wwv_flow.LF||
'    l_ta';
wwv_flow_imp.g_varchar2_table(2104) := 'g_id := to_number( p_tag_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch tag name'||wwv_flow.LF||
'    select t1.tag'||wwv_flow.LF||
'    into l_tag_name'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2105) := ' from blog_v_tags t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and t1.tag_id = l_tag_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return category';
wwv_flow_imp.g_varchar2_table(2106) := ' name'||wwv_flow.LF||
'    return l_tag_name;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_';
wwv_flow_imp.g_varchar2_table(2107) := 'debug.error('||wwv_flow.LF||
'      p_message => ''Error: %s %s( %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_ca';
wwv_flow_imp.g_varchar2_table(2108) := 'll_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_tag_id'''||wwv_flow.LF||
'    , p3 => c';
wwv_flow_imp.g_varchar2_table(2109) := 'oalesce( p_tag_id, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    raise_http_error( 404 );'||wwv_flow.LF||
'    r';
wwv_flow_imp.g_varchar2_table(2110) := 'aise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_tag;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2111) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure';
wwv_flow_imp.g_varchar2_table(2112) := ' download_file('||wwv_flow.LF||
'    p_blob_content    in out nocopy blob,'||wwv_flow.LF||
'    p_mime_type       in varchar2,'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2113) := 'p_header_names    in apex_t_varchar2,'||wwv_flow.LF||
'    p_header_values   in apex_t_varchar2,'||wwv_flow.LF||
'    p_charset     ';
wwv_flow_imp.g_varchar2_table(2114) := '    in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- init HTTP buffer'||wwv_flow.LF||
'    sys.htp.flush;'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2115) := ' --sys.htp.init;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- open HTTP header'||wwv_flow.LF||
'    sys.owa_util.mime_header('||wwv_flow.LF||
'      ccontent_type => c';
wwv_flow_imp.g_varchar2_table(2116) := 'oalesce( p_mime_type, blog_mime.g_default_mime )'||wwv_flow.LF||
'    , bclose_header => false'||wwv_flow.LF||
'    , ccharset      ';
wwv_flow_imp.g_varchar2_table(2117) := '=> p_charset'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info('||wwv_flow.LF||
'      p_message => ''Set response headers'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2118) := '   -- set response headers'||wwv_flow.LF||
'    for i in 1 .. p_header_names.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.inf';
wwv_flow_imp.g_varchar2_table(2119) := 'o('||wwv_flow.LF||
'        p_message => ''Header name: %s , header value: %s'''||wwv_flow.LF||
'      , p0 => p_header_names(i)'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2120) := '  , p1 => p_header_values(i)'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_header_values(i) is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2121) := '   -- output HTTP header'||wwv_flow.LF||
'        sys.htp.p('||wwv_flow.LF||
'          apex_string.format('||wwv_flow.LF||
'            p_message =';
wwv_flow_imp.g_varchar2_table(2122) := '> ''%s: %s'''||wwv_flow.LF||
'          , p0 => trim( p_header_names(i) )'||wwv_flow.LF||
'          , p1 => trim( p_header_values(i) ';
wwv_flow_imp.g_varchar2_table(2123) := ')'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        apex_debug.info('||wwv_flow.LF||
'          p_message => ''Header %s ';
wwv_flow_imp.g_varchar2_table(2124) := 'value is null. Header not set'''||wwv_flow.LF||
'        , p0 => p_header_names(i)'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2125) := 'end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- close HTTP header'||wwv_flow.LF||
'    sys.owa_util.http_header_close;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- output file'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2126) := '  sys.wpg_docload.download_file( p_blob_content );'||wwv_flow.LF||
''||wwv_flow.LF||
'    begin'||wwv_flow.LF||
'      apex_application.stop_apex_en';
wwv_flow_imp.g_varchar2_table(2127) := 'gine;'||wwv_flow.LF||
'    exception'||wwv_flow.LF||
'    when apex_application.e_stop_apex_engine'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      null;'||wwv_flow.LF||
'    end;';
wwv_flow_imp.g_varchar2_table(2128) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_message ';
wwv_flow_imp.g_varchar2_table(2129) := '=> ''%s Error: %s'''||wwv_flow.LF||
'    , p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2130) := '    , p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2131) := ' end download_file;'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2132) := '-'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure dow';
wwv_flow_imp.g_varchar2_table(2133) := 'nload_file('||wwv_flow.LF||
'    p_file_path in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_last_modified varchar2(256);'||wwv_flow.LF||
'    l_file_';
wwv_flow_imp.g_varchar2_table(2134) := 't        blog_v_files%rowtype;'||wwv_flow.LF||
'    l_header_names  apex_t_varchar2;'||wwv_flow.LF||
'    l_header_values apex_t_var';
wwv_flow_imp.g_varchar2_table(2135) := 'char2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch file'||wwv_flow.LF||
'    select *'||wwv_flow.LF||
'    into l_file_t'||wwv_flow.LF||
'    from blog_v_files t1'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2136) := ' where 1 = 1'||wwv_flow.LF||
'      and t1.file_path = p_file_path'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_last_modified :='||wwv_flow.LF||
'      to_char(';
wwv_flow_imp.g_varchar2_table(2137) := ''||wwv_flow.LF||
'        sys_extract_utc( l_file_t.changed_on )'||wwv_flow.LF||
'      , g_rfc_2822_date'||wwv_flow.LF||
'      , g_nls_date_lang'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2138) := '     )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info('||wwv_flow.LF||
'      p_message => ''File name: %s, file size: %s, mime type: ';
wwv_flow_imp.g_varchar2_table(2139) := '%s, charset: %s, last modified: %s'''||wwv_flow.LF||
'    , p0 => l_file_t.file_name'||wwv_flow.LF||
'    , p1 => l_file_t.file_size';
wwv_flow_imp.g_varchar2_table(2140) := ''||wwv_flow.LF||
'    , p2 => l_file_t.mime_type'||wwv_flow.LF||
'    , p3 => l_file_t.file_charset'||wwv_flow.LF||
'    , p4 => l_last_modified'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2141) := ' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Compare request If-Modified-Since header to Last-Modified'||wwv_flow.LF||
'    -- If values are equal ';
wwv_flow_imp.g_varchar2_table(2142) := 'then set status header and exit from procedure'||wwv_flow.LF||
'    if sys.owa_util.get_cgi_env( ''HTTP_IF_MODIFIED_S';
wwv_flow_imp.g_varchar2_table(2143) := 'INCE'' ) = l_last_modified'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      sys.owa_util.status_line( 304 );'||wwv_flow.LF||
'      apex_debug.info(';
wwv_flow_imp.g_varchar2_table(2144) := ''||wwv_flow.LF||
'        p_message => ''File not sent. If-Modified-Since: %s'''||wwv_flow.LF||
'      , p0 => l_last_modified'||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(2145) := ';'||wwv_flow.LF||
'      return;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Add Last-Modified header'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_tab';
wwv_flow_imp.g_varchar2_table(2146) := 'le => l_header_names'||wwv_flow.LF||
'    , p_value => ''Last-Modified'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table';
wwv_flow_imp.g_varchar2_table(2147) := ' => l_header_values'||wwv_flow.LF||
'    , p_value => l_last_modified'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Add Cache-Control header'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2148) := '  apex_string.push('||wwv_flow.LF||
'      p_table => l_header_names'||wwv_flow.LF||
'    , p_value => ''Cache-Control'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2149) := '  apex_string.push('||wwv_flow.LF||
'      p_table => l_header_values'||wwv_flow.LF||
'    , p_value =>'||wwv_flow.LF||
'        apex_string.format(';
wwv_flow_imp.g_varchar2_table(2150) := ''||wwv_flow.LF||
'          p_message => ''max-age=%s'''||wwv_flow.LF||
'        , p0 =>'||wwv_flow.LF||
'            case l_file_t.is_download'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2151) := '         when 1'||wwv_flow.LF||
'              then get_attribute_value( ''G_MAX_AGE_DOWNLOAD'' )'||wwv_flow.LF||
'              else ';
wwv_flow_imp.g_varchar2_table(2152) := 'get_attribute_value( ''G_MAX_AGE_FILE'' )'||wwv_flow.LF||
'            end'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- add Content-Di';
wwv_flow_imp.g_varchar2_table(2153) := 'sposition header'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_names'||wwv_flow.LF||
'    , p_value => ''Content-';
wwv_flow_imp.g_varchar2_table(2154) := 'Disposition'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_string.push('||wwv_flow.LF||
'      p_table => l_header_values'||wwv_flow.LF||
'    , p_value =>'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2155) := '     apex_string.format('||wwv_flow.LF||
'            p_message => ''%s filename="%s"'''||wwv_flow.LF||
'          , p0 =>'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(2156) := '    case l_file_t.is_download'||wwv_flow.LF||
'                when 1'||wwv_flow.LF||
'                then ''attachment;'''||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(2157) := '     end'||wwv_flow.LF||
'          , p1 => l_file_t.file_name'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- download file'||wwv_flow.LF||
'    downl';
wwv_flow_imp.g_varchar2_table(2158) := 'oad_file('||wwv_flow.LF||
'      p_blob_content  => l_file_t.blob_content'||wwv_flow.LF||
'    , p_mime_type     => l_file_t.mime_ty';
wwv_flow_imp.g_varchar2_table(2159) := 'pe'||wwv_flow.LF||
'    , p_header_names  => l_header_names'||wwv_flow.LF||
'    , p_header_values => l_header_values'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -';
wwv_flow_imp.g_varchar2_table(2160) := '- handle errors'||wwv_flow.LF||
'  exception when no_data_found'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'      p_message =>';
wwv_flow_imp.g_varchar2_table(2161) := ' ''Error: %s %s( %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenate_subprogram(';
wwv_flow_imp.g_varchar2_table(2162) := 'utl_call_stack.subprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_file_path'''||wwv_flow.LF||
'    , p3 => coalesce( p_file_path, ''(null)';
wwv_flow_imp.g_varchar2_table(2163) := ''' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    raise_http_error( 404 );'||wwv_flow.LF||
''||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2164) := ' p_message => ''Error: %s %s( %s => %s )'''||wwv_flow.LF||
'    , p0 => sqlerrm'||wwv_flow.LF||
'    , p1 => utl_call_stack.concatenat';
wwv_flow_imp.g_varchar2_table(2165) := 'e_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'    , p2 => ''p_file_path'''||wwv_flow.LF||
'    , p3 => coalesce( p_file_';
wwv_flow_imp.g_varchar2_table(2166) := 'path, ''(null)'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end download_file;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2167) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2168) := '--------------------------------------------------------'||wwv_flow.LF||
'  procedure redirect_search('||wwv_flow.LF||
'    p_value ';
wwv_flow_imp.g_varchar2_table(2169) := '  in varchar2,'||wwv_flow.LF||
'    p_app_id  in varchar2 default null,'||wwv_flow.LF||
'    p_page_id in varchar2 default ''SEARCH'',';
wwv_flow_imp.g_varchar2_table(2170) := ''||wwv_flow.LF||
'    p_session in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- Get search page URL and redirec';
wwv_flow_imp.g_varchar2_table(2171) := 't'||wwv_flow.LF||
'    apex_util.redirect_url('||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_application => p_app_id'||wwv_flow.LF||
'      ,';
wwv_flow_imp.g_varchar2_table(2172) := ' p_page        => p_page_id'||wwv_flow.LF||
'      , p_session     => p_session'||wwv_flow.LF||
'      , p_items       => ''P4_SEARCH';
wwv_flow_imp.g_varchar2_table(2173) := ''''||wwv_flow.LF||
'      , p_values      => p_value'||wwv_flow.LF||
'      , p_plain_url   => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  end redirect_';
wwv_flow_imp.g_varchar2_table(2174) := 'search;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(2175) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_UTIL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create';
wwv_flow_imp.g_varchar2_table(2176) := ' or replace package body "BLOG_ADMIN"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2177) := '-----------------------'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2178) := '-----'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2179) := '-----------------------'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2180) := '-----'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(2181) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedure';
wwv_flow_imp.g_varchar2_table(2182) := 's and functions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(2183) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'  function next_seq';
wwv_flow_imp.g_varchar2_table(2184) := '('||wwv_flow.LF||
'    p_max in number'||wwv_flow.LF||
'  ) return number'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return ceil( coalesce( p_max + 1, 1 ) ';
wwv_flow_imp.g_varchar2_table(2185) := '/ 10 ) * 10;'||wwv_flow.LF||
'  end next_seq;'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2186) := '-----------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  pro';
wwv_flow_imp.g_varchar2_table(2187) := 'cedure add_tag_to_post('||wwv_flow.LF||
'    p_post_id     in number,'||wwv_flow.LF||
'    p_tag_id      in number,'||wwv_flow.LF||
'    p_display_s';
wwv_flow_imp.g_varchar2_table(2188) := 'eq in number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- merge tag'||wwv_flow.LF||
'    merge into blog_post_tags t1'||wwv_flow.LF||
'    using du';
wwv_flow_imp.g_varchar2_table(2189) := 'al on ('||wwv_flow.LF||
'      t1.post_id  = p_post_id'||wwv_flow.LF||
'      and t1.tag_id  = p_tag_id'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    when matched the';
wwv_flow_imp.g_varchar2_table(2190) := 'n'||wwv_flow.LF||
'    -- update display sequence if it changed'||wwv_flow.LF||
'      update'||wwv_flow.LF||
'        set t1.display_seq = p_displa';
wwv_flow_imp.g_varchar2_table(2191) := 'y_seq'||wwv_flow.LF||
'      where t1.display_seq != p_display_seq'||wwv_flow.LF||
'    -- insert post id, tag id and display sequen';
wwv_flow_imp.g_varchar2_table(2192) := 'cy to table'||wwv_flow.LF||
'    when not matched then'||wwv_flow.LF||
'      insert'||wwv_flow.LF||
'        ( is_active, post_id, tag_id, display_';
wwv_flow_imp.g_varchar2_table(2193) := 'seq )'||wwv_flow.LF||
'      values'||wwv_flow.LF||
'        ( 1, p_post_id, p_tag_id, p_display_seq )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end add_tag_to_po';
wwv_flow_imp.g_varchar2_table(2194) := 'st;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(2195) := '-------------------------------------------------------------------'||wwv_flow.LF||
'  procedure cleanup_post_tags(';
wwv_flow_imp.g_varchar2_table(2196) := ''||wwv_flow.LF||
'    p_post_id in number,'||wwv_flow.LF||
'    p_tag_tab in apex_t_number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- delete relat';
wwv_flow_imp.g_varchar2_table(2197) := 'ionship from tags that aren''t belong to post anymore'||wwv_flow.LF||
'    delete'||wwv_flow.LF||
'    from blog_post_tags t1'||wwv_flow.LF||
'    wh';
wwv_flow_imp.g_varchar2_table(2198) := 'ere 1 = 1'||wwv_flow.LF||
'    and post_id = p_post_id'||wwv_flow.LF||
'    and not exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from table( p_tag';
wwv_flow_imp.g_varchar2_table(2199) := '_tab ) x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.column_value = t1.tag_id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end cleanup_post_ta';
wwv_flow_imp.g_varchar2_table(2200) := 'gs;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(2201) := '-------------------------------------------------------------------'||wwv_flow.LF||
'  procedure add_blogger('||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(2202) := '_app_id    in varchar2,'||wwv_flow.LF||
'    p_username  in varchar2,'||wwv_flow.LF||
'    p_user_id   out nocopy number,'||wwv_flow.LF||
'    p_nam';
wwv_flow_imp.g_varchar2_table(2203) := 'e      out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_max     blog_bloggers.display_seq%type;'||wwv_flow.LF||
'    l_email   ';
wwv_flow_imp.g_varchar2_table(2204) := 'blog_bloggers.email%type;'||wwv_flow.LF||
'    l_app_id  apex_applications.application_id%type;'||wwv_flow.LF||
'    l_authz   apex_';
wwv_flow_imp.g_varchar2_table(2205) := 'applications.authorization_scheme%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- convert application id string to number'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2206) := '    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch application authorization scheme name.'||wwv_flow.LF||
'    s';
wwv_flow_imp.g_varchar2_table(2207) := 'elect authorization_scheme'||wwv_flow.LF||
'    into l_authz'||wwv_flow.LF||
'    from apex_applications'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and a';
wwv_flow_imp.g_varchar2_table(2208) := 'pplication_id = l_app_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Check is user in group: %s.'', l_authz );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2209) := ''||wwv_flow.LF||
'    -- verify user is authorized'||wwv_flow.LF||
'    if apex_authorization.is_authorized( l_authz )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2210) := '     -- if user is authorized add user to blog_bloggers table'||wwv_flow.LF||
'      apex_debug.info( ''User %s is au';
wwv_flow_imp.g_varchar2_table(2211) := 'thorized and added to bloggers.'', p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- fetch next display_seq'||wwv_flow.LF||
'      select'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2212) := '      max( t1.display_seq ) as display_seq'||wwv_flow.LF||
'      into l_max'||wwv_flow.LF||
'      from blog_bloggers t1'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2213) := ''||wwv_flow.LF||
'      l_max := next_seq( l_max );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get APEX user email'||wwv_flow.LF||
'      l_email := apex_util.get_';
wwv_flow_imp.g_varchar2_table(2214) := 'email( p_username => p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get APEX user first and last name for blogger name'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2215) := '     p_name := apex_string.format('||wwv_flow.LF||
'        p_message  => ''%s %s'''||wwv_flow.LF||
'      , p0 => apex_util.get_first';
wwv_flow_imp.g_varchar2_table(2216) := '_name( p_username => p_username )'||wwv_flow.LF||
'      , p1 => apex_util.get_last_name( p_username => p_username )';
wwv_flow_imp.g_varchar2_table(2217) := ''||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- add new blogger'||wwv_flow.LF||
'      insert into blog_bloggers'||wwv_flow.LF||
'        ( is_active, publis';
wwv_flow_imp.g_varchar2_table(2218) := 'h_desc, display_seq, apex_username, blogger_name, email )'||wwv_flow.LF||
'      values'||wwv_flow.LF||
'        ( 1, 0, l_max, p_us';
wwv_flow_imp.g_varchar2_table(2219) := 'ername, p_name, l_email )'||wwv_flow.LF||
'      returning id into p_user_id'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_debug.';
wwv_flow_imp.g_varchar2_table(2220) := 'info( ''User %s is not authorized.'', p_username );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end add_blogger;'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(2221) := '------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(2222) := '------------------------------------------------'||wwv_flow.LF||
'  procedure set_attribute_value('||wwv_flow.LF||
'    p_attribute_';
wwv_flow_imp.g_varchar2_table(2223) := 'name  in varchar2,'||wwv_flow.LF||
'    p_attribute_value in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''S';
wwv_flow_imp.g_varchar2_table(2224) := 'et parameter %s: %s'', p_attribute_name, p_attribute_value );'||wwv_flow.LF||
''||wwv_flow.LF||
'    update blog_settings'||wwv_flow.LF||
'      set ';
wwv_flow_imp.g_varchar2_table(2225) := 'attribute_value = p_attribute_value'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and attribute_name = p_attribute_name'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2226) := '     and ('||wwv_flow.LF||
'        attribute_value != p_attribute_value'||wwv_flow.LF||
'        or( attribute_value is null and p_';
wwv_flow_imp.g_varchar2_table(2227) := 'attribute_value is not null )'||wwv_flow.LF||
'        or( attribute_value is not null and p_attribute_value is null';
wwv_flow_imp.g_varchar2_table(2228) := ' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_attribute_value;'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2229) := '------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2230) := '------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2231) := '------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2232) := '------------'||wwv_flow.LF||
'  procedure post_authentication'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_group_names apex_t_varchar2;'||wwv_flow.LF||
'    l_user_';
wwv_flow_imp.g_varchar2_table(2233) := 'name   apex_workspace_apex_users.user_name%type;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_user_name := sys_context( ''APEX$S';
wwv_flow_imp.g_varchar2_table(2234) := 'ESSION'', ''APP_USER'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- collect user groups to PL/SQL table'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select d';
wwv_flow_imp.g_varchar2_table(2235) := 'istinct'||wwv_flow.LF||
'        g.group_name'||wwv_flow.LF||
'      from apex_workspace_groups g'||wwv_flow.LF||
'      left join apex_workspace_gr';
wwv_flow_imp.g_varchar2_table(2236) := 'oup_groups gg on g.group_name = gg.grantee_name'||wwv_flow.LF||
'      left join apex_workspace_group_users gu on g.';
wwv_flow_imp.g_varchar2_table(2237) := 'group_name = gu.group_name'||wwv_flow.LF||
'        and gu.user_name = l_user_name'||wwv_flow.LF||
'      left join apex_workspace_a';
wwv_flow_imp.g_varchar2_table(2238) := 'pex_users u on gu.user_name = u.user_name'||wwv_flow.LF||
'        and u.account_locked  = ''No'''||wwv_flow.LF||
'        and u.user_';
wwv_flow_imp.g_varchar2_table(2239) := 'name = l_user_name'||wwv_flow.LF||
'        start with u.user_name = l_user_name'||wwv_flow.LF||
'      connect by nocycle prior gg.';
wwv_flow_imp.g_varchar2_table(2240) := 'group_name = g.group_name'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
'      apex_string.push( l_group_names, c1.group_name );'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2241) := 'end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Enable user groups'||wwv_flow.LF||
'    apex_authorization.enable_dynamic_groups ('||wwv_flow.LF||
'      p_grou';
wwv_flow_imp.g_varchar2_table(2242) := 'p_names => l_group_names'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    apex_debug.error( ''Unhan';
wwv_flow_imp.g_varchar2_table(2243) := 'dled post authentication procedure error: %s: '', sqlerrm );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
'  end post_authentication;';
wwv_flow_imp.g_varchar2_table(2244) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(2245) := '---------------------------------------------------------------'||wwv_flow.LF||
'  procedure get_blogger_details('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2246) := '   p_app_id      in varchar2,'||wwv_flow.LF||
'    p_username    in varchar2,'||wwv_flow.LF||
'    p_user_id     out nocopy number,';
wwv_flow_imp.g_varchar2_table(2247) := ''||wwv_flow.LF||
'    p_name        out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Fetch user id an';
wwv_flow_imp.g_varchar2_table(2248) := 'd name for username: %s'', p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch user id and name'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      id'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2249) := ', blogger_name'||wwv_flow.LF||
'    into p_user_id, p_name'||wwv_flow.LF||
'    from blog_bloggers'||wwv_flow.LF||
'    where apex_username = p_user';
wwv_flow_imp.g_varchar2_table(2250) := 'name'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- if user not found, try add user'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when no_data_found'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2251) := '  apex_debug.info( ''User %s not found from bloggers.'', p_username );'||wwv_flow.LF||
''||wwv_flow.LF||
'    add_blogger('||wwv_flow.LF||
'      p_ap';
wwv_flow_imp.g_varchar2_table(2252) := 'p_id    => p_app_id'||wwv_flow.LF||
'    , p_username  => p_username'||wwv_flow.LF||
'    , p_user_id   => p_user_id'||wwv_flow.LF||
'    , p_name  ';
wwv_flow_imp.g_varchar2_table(2253) := '    => p_name'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_blogger_details;'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2254) := '---------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2255) := '---------------'||wwv_flow.LF||
'  function get_category_seq'||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_max_seq   blog_v_all_ca';
wwv_flow_imp.g_varchar2_table(2256) := 'tegories.display_seq%type;'||wwv_flow.LF||
'    l_next_seq  varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch max category dis';
wwv_flow_imp.g_varchar2_table(2257) := 'play sequence'||wwv_flow.LF||
'    select max( v1.display_seq ) as display_seq'||wwv_flow.LF||
'    into l_max_seq'||wwv_flow.LF||
'    from blog_v_';
wwv_flow_imp.g_varchar2_table(2258) := 'all_categories v1'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- get next category display sequence'||wwv_flow.LF||
'    l_next_seq := blog_util.int';
wwv_flow_imp.g_varchar2_table(2259) := '_to_vc2( next_seq( l_max_seq ) );'||wwv_flow.LF||
'    -- return next category display sequence'||wwv_flow.LF||
'    return l_next_s';
wwv_flow_imp.g_varchar2_table(2260) := 'eq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_category_seq;'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2261) := '------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  fu';
wwv_flow_imp.g_varchar2_table(2262) := 'nction get_link_grp_seq'||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_max_seq   blog_v_all_link_groups.display_seq';
wwv_flow_imp.g_varchar2_table(2263) := '%type;'||wwv_flow.LF||
'    l_next_seq  varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch max link group display sequence'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2264) := ' select max( v1.display_seq ) as display_seq'||wwv_flow.LF||
'    into l_max_seq'||wwv_flow.LF||
'    from blog_v_all_link_groups v1';
wwv_flow_imp.g_varchar2_table(2265) := ''||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- get next link group display sequence'||wwv_flow.LF||
'    l_next_seq := blog_util.int_to_vc2( next_s';
wwv_flow_imp.g_varchar2_table(2266) := 'eq( l_max_seq ) );'||wwv_flow.LF||
'    -- return next link group display sequence'||wwv_flow.LF||
'    return l_next_seq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ';
wwv_flow_imp.g_varchar2_table(2267) := 'get_link_grp_seq;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2268) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_mo';
wwv_flow_imp.g_varchar2_table(2269) := 'dal_page_seq'||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_max_seq   blog_v_all_dynamic_content.display_seq%type;';
wwv_flow_imp.g_varchar2_table(2270) := ''||wwv_flow.LF||
'    l_next_seq  varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch max link group display sequence'||wwv_flow.LF||
'    select';
wwv_flow_imp.g_varchar2_table(2271) := ' max( v1.display_seq ) as display_seq'||wwv_flow.LF||
'    into l_max_seq'||wwv_flow.LF||
'    from blog_v_all_dynamic_content v1'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2272) := '   ;'||wwv_flow.LF||
'    -- get next link group display sequence'||wwv_flow.LF||
'    l_next_seq := blog_util.int_to_vc2( next_seq(';
wwv_flow_imp.g_varchar2_table(2273) := ' l_max_seq ) );'||wwv_flow.LF||
'    -- return next link group display sequence'||wwv_flow.LF||
'    return l_next_seq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get';
wwv_flow_imp.g_varchar2_table(2274) := '_modal_page_seq;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2275) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_lin';
wwv_flow_imp.g_varchar2_table(2276) := 'k_seq('||wwv_flow.LF||
'    p_link_group_id in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_link_group_id number;'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2277) := ' l_max_seq       blog_v_all_links.display_seq%type;'||wwv_flow.LF||
'    l_next_seq      varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2278) := '    -- conver link group id string to number'||wwv_flow.LF||
'    l_link_group_id := to_number( p_link_group_id );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2279) := ''||wwv_flow.LF||
'    -- fetch max link display sequence'||wwv_flow.LF||
'    select max( v1.display_seq ) as display_seq'||wwv_flow.LF||
'    into ';
wwv_flow_imp.g_varchar2_table(2280) := 'l_max_seq'||wwv_flow.LF||
'    from blog_v_all_links v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and link_group_id = l_link_group_id'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2281) := '   ;'||wwv_flow.LF||
'    -- get next link display sequence'||wwv_flow.LF||
'    l_next_seq := blog_util.int_to_vc2( next_seq( l_max';
wwv_flow_imp.g_varchar2_table(2282) := '_seq ) );'||wwv_flow.LF||
'    -- return next link display sequence'||wwv_flow.LF||
'    return l_next_seq;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_link_seq;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2283) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(2284) := '--------------------------------------------------------------'||wwv_flow.LF||
'  function request_to_post_status('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2285) := '    p_request in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- conver APEX request to post ';
wwv_flow_imp.g_varchar2_table(2286) := 'status (blog_posts.is_active)'||wwv_flow.LF||
'    return case p_request'||wwv_flow.LF||
'      when ''CREATE'''||wwv_flow.LF||
'      then ''1'''||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2287) := ' when ''SAVE'''||wwv_flow.LF||
'      then ''1'''||wwv_flow.LF||
'      when ''SAVE_AND_PUBLISH'''||wwv_flow.LF||
'      then ''1'''||wwv_flow.LF||
'      else ''0'''||wwv_flow.LF||
'    end';
wwv_flow_imp.g_varchar2_table(2288) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'  end request_to_post_status;'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2289) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2290) := '  function get_first_paragraph('||wwv_flow.LF||
'    p_body_html in clob'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_first_p  ';
wwv_flow_imp.g_varchar2_table(2291) := '     clob;'||wwv_flow.LF||
'    l_first_p_start number;'||wwv_flow.LF||
'    l_first_p_end   number;'||wwv_flow.LF||
'    l_length        number;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2292) := '   l_next_p        number;'||wwv_flow.LF||
'    l_cnt           number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cnt := 1;'||wwv_flow.LF||
'    l_next_p :=';
wwv_flow_imp.g_varchar2_table(2293) := ' 1;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get first opening and closing tag positions'||wwv_flow.LF||
'    l_first_p_start := instr( p_body_html';
wwv_flow_imp.g_varchar2_table(2294) := ', ''<p>'' );'||wwv_flow.LF||
'    l_first_p_end   := instr( p_body_html, ''</p>'', l_first_p_start ) + 4;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- chec';
wwv_flow_imp.g_varchar2_table(2295) := 'k if there nested tags'||wwv_flow.LF||
'    while l_next_p > 0'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      l_cnt := l_cnt + 1;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get ';
wwv_flow_imp.g_varchar2_table(2296) := 'string length between opening and closing tag'||wwv_flow.LF||
'      l_length  := l_first_p_end - l_first_p_start;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2297) := '      -- select contect between opening and closing tag'||wwv_flow.LF||
'      l_first_p := substr( p_body_html, l_f';
wwv_flow_imp.g_varchar2_table(2298) := 'irst_p_start, l_length );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- check if there is more opening tags inside selection'||wwv_flow.LF||
'      l_';
wwv_flow_imp.g_varchar2_table(2299) := 'next_p := instr( l_first_p, ''<p'', 1, l_cnt );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if l_next_p > 0'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- if an';
wwv_flow_imp.g_varchar2_table(2300) := 'other opening tag found, find next closing tag'||wwv_flow.LF||
'        l_first_p_end := instr( p_body_html, ''</p>'',';
wwv_flow_imp.g_varchar2_table(2301) := ' 1, l_cnt ) + 4;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_first_p := null;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'    -- post must h';
wwv_flow_imp.g_varchar2_table(2302) := 'ave at least one paragraph'||wwv_flow.LF||
'    if l_first_p_start > 0 and l_first_p_end > 0 then'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_length ';
wwv_flow_imp.g_varchar2_table(2303) := ':= l_first_p_end - l_first_p_start;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- get first paragraph'||wwv_flow.LF||
'      l_first_p := substr( p_bo';
wwv_flow_imp.g_varchar2_table(2304) := 'dy_html, l_first_p_start, l_length );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- remove whitespace'||wwv_flow.LF||
'      l_first_p := blog_util.re';
wwv_flow_imp.g_varchar2_table(2305) := 'move_whitespace( l_first_p );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_first_p;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_first_paragraph;';
wwv_flow_imp.g_varchar2_table(2306) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(2307) := '---------------------------------------------------------------'||wwv_flow.LF||
'  procedure add_category('||wwv_flow.LF||
'    p_ca';
wwv_flow_imp.g_varchar2_table(2308) := 'tegory_title  in varchar2,'||wwv_flow.LF||
'    p_category_id out nocopy number'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_next_seq      numb';
wwv_flow_imp.g_varchar2_table(2309) := 'er;'||wwv_flow.LF||
'    l_title         varchar2(512);'||wwv_flow.LF||
'    l_title_unique  varchar2(512);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- remov';
wwv_flow_imp.g_varchar2_table(2310) := 'e whitespace from category title'||wwv_flow.LF||
'    l_title := blog_util.remove_whitespace( p_category_title );'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2311) := '   l_title_unique := upper( l_title );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check if category already exists and fetch id'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2312) := 'begin'||wwv_flow.LF||
'      select v1.id'||wwv_flow.LF||
'      into p_category_id'||wwv_flow.LF||
'      from blog_v_all_categories v1'||wwv_flow.LF||
'      wher';
wwv_flow_imp.g_varchar2_table(2313) := 'e 1 = 1'||wwv_flow.LF||
'      and v1.title_unique = l_title_unique'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    -- if category not exists insert a';
wwv_flow_imp.g_varchar2_table(2314) := 'nd return id'||wwv_flow.LF||
'    exception'||wwv_flow.LF||
'    when no_data_found'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- get next sequence value'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2315) := '   l_next_seq := get_category_seq;'||wwv_flow.LF||
'      -- insert category and return id for out parameter.'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2316) := ' insert into blog_categories'||wwv_flow.LF||
'        ( is_active, display_seq, title )'||wwv_flow.LF||
'      values'||wwv_flow.LF||
'        ( 1, ';
wwv_flow_imp.g_varchar2_table(2317) := 'l_next_seq, l_title )'||wwv_flow.LF||
'      returning id into p_category_id'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end;'||wwv_flow.LF||
'  -- fetch category';
wwv_flow_imp.g_varchar2_table(2318) := ' id if it was inserted in other session but not commited'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when dup_val_on_index'||wwv_flow.LF||
'  th';
wwv_flow_imp.g_varchar2_table(2319) := 'en'||wwv_flow.LF||
'    select v1.id'||wwv_flow.LF||
'    into p_category_id'||wwv_flow.LF||
'    from blog_v_all_categories v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2320) := '    and v1.title_unique = l_title_unique'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'  end add_category;'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(2321) := '--------------------------------------------------'||wwv_flow.LF||
'------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2322) := '--------------------------------'||wwv_flow.LF||
'  procedure remove_unused_categories'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- cleanu';
wwv_flow_imp.g_varchar2_table(2323) := 'p categories that aren''t linked to any post'||wwv_flow.LF||
'    delete from blog_categories t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2324) := '  and not exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'      from blog_posts x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.categor';
wwv_flow_imp.g_varchar2_table(2325) := 'y_id = t1.id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end remove_unused_categories;'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(2326) := '-------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2327) := '-------------------'||wwv_flow.LF||
'  procedure add_tag('||wwv_flow.LF||
'    p_tag     in varchar2,'||wwv_flow.LF||
'    p_tag_id  out nocopy numb';
wwv_flow_imp.g_varchar2_table(2328) := 'er'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_value varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    p_tag_id  := null;'||wwv_flow.LF||
'    l_value   := blog_';
wwv_flow_imp.g_varchar2_table(2329) := 'util.remove_whitespace( p_tag );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if tag is not null then fetch id'||wwv_flow.LF||
'    if l_value is not n';
wwv_flow_imp.g_varchar2_table(2330) := 'ull then'||wwv_flow.LF||
''||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        select id'||wwv_flow.LF||
'        into p_tag_id'||wwv_flow.LF||
'        from blog_v_all_tags'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2331) := '     where 1 = 1'||wwv_flow.LF||
'        and tag_unique = upper( l_value )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      -- if tag not exists i';
wwv_flow_imp.g_varchar2_table(2332) := 'nsert and return id'||wwv_flow.LF||
'      exception when no_data_found then'||wwv_flow.LF||
'        insert into blog_tags'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2333) := '   ( is_active, tag )'||wwv_flow.LF||
'        values'||wwv_flow.LF||
'          ( 1, l_value )'||wwv_flow.LF||
'        returning id into p_tag_id';
wwv_flow_imp.g_varchar2_table(2334) := ''||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end add_tag;'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(2335) := '-------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2336) := '-------------------'||wwv_flow.LF||
'  procedure add_post_tags('||wwv_flow.LF||
'    p_post_id in varchar2,'||wwv_flow.LF||
'    p_tags    in varcha';
wwv_flow_imp.g_varchar2_table(2337) := 'r2,'||wwv_flow.LF||
'    p_sep     in varchar2 default '','''||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_post_id     number;'||wwv_flow.LF||
'    l_tag_id      ';
wwv_flow_imp.g_varchar2_table(2338) := 'number;'||wwv_flow.LF||
'    l_display_seq number;'||wwv_flow.LF||
'    l_tag_tab     apex_t_varchar2;'||wwv_flow.LF||
'    l_tag_id_tab  apex_t_num';
wwv_flow_imp.g_varchar2_table(2339) := 'ber;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- split tags string to table and l';
wwv_flow_imp.g_varchar2_table(2340) := 'oop all values'||wwv_flow.LF||
'    l_tag_tab := apex_string.split('||wwv_flow.LF||
'      p_str => p_tags'||wwv_flow.LF||
'    , p_sep => p_sep'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2341) := '  );'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_tag_tab.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- add tag to repository and return id';
wwv_flow_imp.g_varchar2_table(2342) := ''||wwv_flow.LF||
'      add_tag('||wwv_flow.LF||
'        p_tag     => l_tag_tab(i)'||wwv_flow.LF||
'      , p_tag_id  => l_tag_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2343) := ' -- if the tag has been added or is already in the repository'||wwv_flow.LF||
'      -- create relationships to post';
wwv_flow_imp.g_varchar2_table(2344) := ''||wwv_flow.LF||
'      if l_tag_id is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- collect tag id to table.'||wwv_flow.LF||
'        -- table';
wwv_flow_imp.g_varchar2_table(2345) := ' is used at end of procedure'||wwv_flow.LF||
'        -- for checking relationships that should be removed'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2346) := 'apex_string.push( l_tag_id_tab, l_tag_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- get table record count for tag display seq';
wwv_flow_imp.g_varchar2_table(2347) := 'uence'||wwv_flow.LF||
'        l_display_seq:= l_tag_id_tab.count * 10;'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- add tag relationships to post';
wwv_flow_imp.g_varchar2_table(2348) := ''||wwv_flow.LF||
'        add_tag_to_post('||wwv_flow.LF||
'          p_post_id     => l_post_id'||wwv_flow.LF||
'        , p_tag_id      => l_tag_id';
wwv_flow_imp.g_varchar2_table(2349) := ''||wwv_flow.LF||
'        , p_display_seq => l_display_seq'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- d';
wwv_flow_imp.g_varchar2_table(2350) := 'elete removed tags relationships'||wwv_flow.LF||
'    cleanup_post_tags('||wwv_flow.LF||
'      p_post_id => l_post_id'||wwv_flow.LF||
'    , p_tag_';
wwv_flow_imp.g_varchar2_table(2351) := 'tab => l_tag_id_tab'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end add_post_tags;'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2352) := '---------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2353) := '---------------'||wwv_flow.LF||
'  procedure remove_unused_tags'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- cleanup tags that aren''t link';
wwv_flow_imp.g_varchar2_table(2354) := 'ed to any post'||wwv_flow.LF||
'    delete from blog_tags t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'    and not exists('||wwv_flow.LF||
'      select 1'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2355) := '      from blog_post_tags x1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and x1.tag_id = t1.id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'  end remove_u';
wwv_flow_imp.g_varchar2_table(2356) := 'nused_tags;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(2357) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'  function is_integer(';
wwv_flow_imp.g_varchar2_table(2358) := ''||wwv_flow.LF||
'    p_value     in varchar2,'||wwv_flow.LF||
'    p_min       in number,'||wwv_flow.LF||
'    p_max       in number,'||wwv_flow.LF||
'    p_err_mes';
wwv_flow_imp.g_varchar2_table(2359) := 'g  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_value     number;'||wwv_flow.LF||
'    l_err_mesg  varchar2(32700);';
wwv_flow_imp.g_varchar2_table(2360) := ''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_value is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- prepare validation error message for e';
wwv_flow_imp.g_varchar2_table(2361) := 'xception handler'||wwv_flow.LF||
'      l_err_mesg := apex_lang.get_message('||wwv_flow.LF||
'        p_name    => p_err_mesg'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2362) := ' , p_params  =>'||wwv_flow.LF||
'          apex_t_varchar2('||wwv_flow.LF||
'            ''min'''||wwv_flow.LF||
'          , p_min'||wwv_flow.LF||
'          , ''max''';
wwv_flow_imp.g_varchar2_table(2363) := ''||wwv_flow.LF||
'          , p_max'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_value := to_number( p_value );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- check';
wwv_flow_imp.g_varchar2_table(2364) := ' value is integer and between range'||wwv_flow.LF||
'      if round( l_value ) = l_value'||wwv_flow.LF||
'      and l_value between ';
wwv_flow_imp.g_varchar2_table(2365) := 'p_min and p_max'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- if validation passes, clear error meassage'||wwv_flow.LF||
'        l_err_me';
wwv_flow_imp.g_varchar2_table(2366) := 'sg := null;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when invalid_n';
wwv_flow_imp.g_varchar2_table(2367) := 'umber'||wwv_flow.LF||
'  or value_error'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    -- return error message'||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
'  end is_integ';
wwv_flow_imp.g_varchar2_table(2368) := 'er;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(2369) := '-------------------------------------------------------------------'||wwv_flow.LF||
'  function is_url('||wwv_flow.LF||
'    p_value';
wwv_flow_imp.g_varchar2_table(2370) := '     in varchar2,'||wwv_flow.LF||
'    p_err_mesg  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_err_mesg varchar2(3';
wwv_flow_imp.g_varchar2_table(2371) := '2700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if not regexp_like(p_value, ''^https?\:\/\/.*$'')'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- if valida';
wwv_flow_imp.g_varchar2_table(2372) := 'tion fails prepare error message'||wwv_flow.LF||
'      l_err_mesg := p_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_err';
wwv_flow_imp.g_varchar2_table(2373) := '_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end is_url;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2374) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function ';
wwv_flow_imp.g_varchar2_table(2375) := 'is_date_format('||wwv_flow.LF||
'    p_value     in varchar2,'||wwv_flow.LF||
'    p_err_mesg  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  a';
wwv_flow_imp.g_varchar2_table(2376) := 's'||wwv_flow.LF||
'    l_err_mesg          varchar2(32700);'||wwv_flow.LF||
'    invalid_date_format exception;'||wwv_flow.LF||
'    pragma         ';
wwv_flow_imp.g_varchar2_table(2377) := '     exception_init(invalid_date_format, -1821);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepare validation error message';
wwv_flow_imp.g_varchar2_table(2378) := ''||wwv_flow.LF||
'    l_err_mesg := p_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- try convert timestamp to string'||wwv_flow.LF||
'    if to_char( sysdate, ';
wwv_flow_imp.g_varchar2_table(2379) := 'p_value ) is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- if validation passes, clear error meassage'||wwv_flow.LF||
'      l_err_me';
wwv_flow_imp.g_varchar2_table(2380) := 'sg := null;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when invalid_date_format'||wwv_flow.LF||
'  the';
wwv_flow_imp.g_varchar2_table(2381) := 'n'||wwv_flow.LF||
'    -- return error message'||wwv_flow.LF||
'    return l_err_mesg;'||wwv_flow.LF||
'  end is_date_format;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(2382) := '-----------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(2383) := '-----------------------------------------'||wwv_flow.LF||
'  procedure update_feature('||wwv_flow.LF||
'    p_app_id          in num';
wwv_flow_imp.g_varchar2_table(2384) := 'ber,'||wwv_flow.LF||
'    p_build_option_id in number,'||wwv_flow.LF||
'    p_build_status    in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_build_st';
wwv_flow_imp.g_varchar2_table(2385) := 'atus apex_application_admin.t_build_option_status;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_build_status := upper( p_build_';
wwv_flow_imp.g_varchar2_table(2386) := 'status );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update build option value'||wwv_flow.LF||
'    if'||wwv_flow.LF||
'      apex_application_admin.get_build_option';
wwv_flow_imp.g_varchar2_table(2387) := '_status('||wwv_flow.LF||
'        p_application_id  => p_app_id'||wwv_flow.LF||
'      , p_id              => p_build_option_id'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2388) := '   ) != l_build_status'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_application_admin.set_build_option_status('||wwv_flow.LF||
'        p';
wwv_flow_imp.g_varchar2_table(2389) := '_application_id  => p_app_id'||wwv_flow.LF||
'      , p_id              => p_build_option_id'||wwv_flow.LF||
'      , p_build_status';
wwv_flow_imp.g_varchar2_table(2390) := '    => l_build_status'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end update_feature;'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(2391) := '-----------------------------------------------------'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(2392) := '-----------------------------------'||wwv_flow.LF||
'  procedure update_feature('||wwv_flow.LF||
'    p_build_option_name in varchar';
wwv_flow_imp.g_varchar2_table(2393) := '2,'||wwv_flow.LF||
'    p_build_status      in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- get build option id by build opt';
wwv_flow_imp.g_varchar2_table(2394) := 'ion name for both applications'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1.application_id'||wwv_flow.LF||
'      , t1.';
wwv_flow_imp.g_varchar2_table(2395) := 'build_option_id'||wwv_flow.LF||
'      from apex_application_build_options t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and t1.bui';
wwv_flow_imp.g_varchar2_table(2396) := 'ld_option_name  = p_build_option_name'||wwv_flow.LF||
'        and exists('||wwv_flow.LF||
'          select 1'||wwv_flow.LF||
'          from blog_';
wwv_flow_imp.g_varchar2_table(2397) := 'settings x1'||wwv_flow.LF||
'          where 1 = 1'||wwv_flow.LF||
'            and x1.attribute_name in( ''G_PUB_APP_ID'', ''G_ADMIN_A';
wwv_flow_imp.g_varchar2_table(2398) := 'PP_ID'' )'||wwv_flow.LF||
'            and to_number( x1.attribute_value ) = t1.application_id'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    ) loop';
wwv_flow_imp.g_varchar2_table(2399) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'      -- update build option value'||wwv_flow.LF||
'      update_feature('||wwv_flow.LF||
'        p_app_id          => c1.appli';
wwv_flow_imp.g_varchar2_table(2400) := 'cation_id'||wwv_flow.LF||
'      , p_build_option_id => c1.build_option_id'||wwv_flow.LF||
'      , p_build_status    => p_build_sta';
wwv_flow_imp.g_varchar2_table(2401) := 'tus'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end update_feature;'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(2402) := '-------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2403) := '-------------------'||wwv_flow.LF||
'  procedure resequence_categories'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update categories di';
wwv_flow_imp.g_varchar2_table(2404) := 'splay_seq if it different than new'||wwv_flow.LF||
'    merge into blog_categories t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2405) := '      id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          order by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 as ';
wwv_flow_imp.g_varchar2_table(2406) := 'new_display_seq'||wwv_flow.LF||
'      from blog_categories'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2407) := '    when matched then'||wwv_flow.LF||
'      update set t1.display_seq = v1.new_display_seq'||wwv_flow.LF||
'        where t1.displa';
wwv_flow_imp.g_varchar2_table(2408) := 'y_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end resequence_categories;'||wwv_flow.LF||
'--------------------------------';
wwv_flow_imp.g_varchar2_table(2409) := '------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2410) := '------------------------------'||wwv_flow.LF||
'  procedure resequence_tags('||wwv_flow.LF||
'    p_post_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2411) := '    l_post_id number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update post tag';
wwv_flow_imp.g_varchar2_table(2412) := 's display_seq if it different than new'||wwv_flow.LF||
'    merge into blog_post_tags t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select';
wwv_flow_imp.g_varchar2_table(2413) := ''||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          order by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 ';
wwv_flow_imp.g_varchar2_table(2414) := 'as new_display_seq'||wwv_flow.LF||
'      from blog_post_tags'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and post_id = l_post_id'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2415) := ' ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set t1.display_seq = v1.new_dis';
wwv_flow_imp.g_varchar2_table(2416) := 'play_seq'||wwv_flow.LF||
'        where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end resequence_tags;'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(2417) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(2418) := '---------------------------------------------------------'||wwv_flow.LF||
'  procedure resequence_link_groups'||wwv_flow.LF||
'  as';
wwv_flow_imp.g_varchar2_table(2419) := ''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update link groups display_seq if it different than new'||wwv_flow.LF||
'    merge into blog_link';
wwv_flow_imp.g_varchar2_table(2420) := '_groups t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          order by di';
wwv_flow_imp.g_varchar2_table(2421) := 'splay_seq, created_on'||wwv_flow.LF||
'        ) * 10 as new_display_seq'||wwv_flow.LF||
'      from blog_link_groups'||wwv_flow.LF||
'      where 1';
wwv_flow_imp.g_varchar2_table(2422) := ' = 1'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set t1.display_seq = v';
wwv_flow_imp.g_varchar2_table(2423) := '1.new_display_seq'||wwv_flow.LF||
'        where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end resequence_lin';
wwv_flow_imp.g_varchar2_table(2424) := 'k_groups;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(2425) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure resequence_li';
wwv_flow_imp.g_varchar2_table(2426) := 'nks('||wwv_flow.LF||
'    p_link_group_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_link_group_id number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- con';
wwv_flow_imp.g_varchar2_table(2427) := 'vert link group id to number'||wwv_flow.LF||
'    l_link_group_id := to_number( p_link_group_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- update ';
wwv_flow_imp.g_varchar2_table(2428) := 'links display_seq if it different than new'||wwv_flow.LF||
'    merge into blog_links t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select';
wwv_flow_imp.g_varchar2_table(2429) := ''||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          order by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 ';
wwv_flow_imp.g_varchar2_table(2430) := 'as new_display_seq'||wwv_flow.LF||
'      from blog_links'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      and link_group_id = l_link_group';
wwv_flow_imp.g_varchar2_table(2431) := '_id'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set t1.display_seq = v1';
wwv_flow_imp.g_varchar2_table(2432) := '.new_display_seq'||wwv_flow.LF||
'        where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end resequence_link';
wwv_flow_imp.g_varchar2_table(2433) := 's;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------';
wwv_flow_imp.g_varchar2_table(2434) := '------------------------------------------------------------------'||wwv_flow.LF||
'  procedure resequence_dynamic_c';
wwv_flow_imp.g_varchar2_table(2435) := 'ontent'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- Update dynamic content seq if it different than new'||wwv_flow.LF||
'    merge into bl';
wwv_flow_imp.g_varchar2_table(2436) := 'og_dynamic_content t1'||wwv_flow.LF||
'    using ('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        id'||wwv_flow.LF||
'      , row_number() over('||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(2437) := 'order by display_seq, created_on'||wwv_flow.LF||
'        ) * 10 as new_display_seq'||wwv_flow.LF||
'      from blog_dynamic_content';
wwv_flow_imp.g_varchar2_table(2438) := ''||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'    ) v1'||wwv_flow.LF||
'    on ( t1.id = v1.id )'||wwv_flow.LF||
'    when matched then'||wwv_flow.LF||
'      update set t1.';
wwv_flow_imp.g_varchar2_table(2439) := 'display_seq = v1.new_display_seq'||wwv_flow.LF||
'        where t1.display_seq != v1.new_display_seq'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'  end r';
wwv_flow_imp.g_varchar2_table(2440) := 'esequence_dynamic_content;'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2441) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  proced';
wwv_flow_imp.g_varchar2_table(2442) := 'ure set_attribute_value('||wwv_flow.LF||
'    p_attribute_list in apex_t_varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_values  json_obj';
wwv_flow_imp.g_varchar2_table(2443) := 'ect_t;'||wwv_flow.LF||
'    l_keys    json_key_list;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_values :='||wwv_flow.LF||
'      json_object_t.parse('||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2444) := '  apex_string.plist_to_json_clob( p_attribute_list )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_keys := l_values.get_k';
wwv_flow_imp.g_varchar2_table(2445) := 'eys;'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_keys.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      set_attribute_value('||wwv_flow.LF||
'        p_attribute_';
wwv_flow_imp.g_varchar2_table(2446) := 'name  => l_keys(i)'||wwv_flow.LF||
'      , p_attribute_value => l_values.get_string( l_keys(i) )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    e';
wwv_flow_imp.g_varchar2_table(2447) := 'nd loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_attribute_value;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2448) := '--------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2449) := '--'||wwv_flow.LF||
'end "BLOG_ADMIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_PLUGIN"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2450) := '--------------------------------------------------------'||wwv_flow.LF||
'------------------------------------------';
wwv_flow_imp.g_varchar2_table(2451) := '--------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2452) := '--------------------------------------------------------'||wwv_flow.LF||
'------------------------------------------';
wwv_flow_imp.g_varchar2_table(2453) := '--------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2454) := '-----------------------------'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2455) := '-----------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2456) := '------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2457) := '------------'||wwv_flow.LF||
'  function to_html_entities('||wwv_flow.LF||
'    p_number in number'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l';
wwv_flow_imp.g_varchar2_table(2458) := '_string varchar2(4000);'||wwv_flow.LF||
'    l_result varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_string := blog_util.int_to_v';
wwv_flow_imp.g_varchar2_table(2459) := 'c2( p_number );'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. length( l_string )'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      l_result :='||wwv_flow.LF||
'        apex_s';
wwv_flow_imp.g_varchar2_table(2460) := 'tring.format('||wwv_flow.LF||
'          p_message => ''%s&#%s'''||wwv_flow.LF||
'        , p0 => l_result'||wwv_flow.LF||
'        , p1 => ascii( sub';
wwv_flow_imp.g_varchar2_table(2461) := 'str( l_string, i, 1 ) )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_result;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end to_html_';
wwv_flow_imp.g_varchar2_table(2462) := 'entities;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(2463) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'-- Global procedures and ';
wwv_flow_imp.g_varchar2_table(2464) := 'functions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(2465) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure render_math_q';
wwv_flow_imp.g_varchar2_table(2466) := 'uestion_field('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in            apex_pl';
wwv_flow_imp.g_varchar2_table(2467) := 'ugin.t_plugin,'||wwv_flow.LF||
'    p_param   in            apex_plugin.t_item_render_param,'||wwv_flow.LF||
'    p_result  in out n';
wwv_flow_imp.g_varchar2_table(2468) := 'ocopy apex_plugin.t_item_render_result'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_application.g_debug'||wwv_flow.LF||
'    t';
wwv_flow_imp.g_varchar2_table(2469) := 'hen'||wwv_flow.LF||
'      apex_plugin_util.debug_page_item('||wwv_flow.LF||
'        p_plugin      => p_plugin'||wwv_flow.LF||
'      , p_page_item';
wwv_flow_imp.g_varchar2_table(2470) := '  => p_item'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if not ( p_param.is_readonly or p_param.is_printer_friendl';
wwv_flow_imp.g_varchar2_table(2471) := 'y )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      sys.htp.p( ''<input type="text" '''||wwv_flow.LF||
'        || case when p_item.element_width i';
wwv_flow_imp.g_varchar2_table(2472) := 's not null'||wwv_flow.LF||
'            then ''size="'' || p_item.element_width ||''" '''||wwv_flow.LF||
'           end'||wwv_flow.LF||
'        || cas';
wwv_flow_imp.g_varchar2_table(2473) := 'e when p_item.element_max_length  is not null'||wwv_flow.LF||
'            then ''maxlength="'' || p_item.element_max_';
wwv_flow_imp.g_varchar2_table(2474) := 'length || ''" '''||wwv_flow.LF||
'           end'||wwv_flow.LF||
'        ||'||wwv_flow.LF||
'          apex_plugin_util.get_element_attributes('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2475) := '        p_item            => p_item'||wwv_flow.LF||
'          , p_name            => p_item.name'||wwv_flow.LF||
'          , p_def';
wwv_flow_imp.g_varchar2_table(2476) := 'ault_class   => ''text_field apex-item-text'''||wwv_flow.LF||
'          , p_add_labelledby  => false'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2477) := '      || ''value="">'''||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_item.icon_css_classes is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2478) := 'sys.htp.p(''<span class="apex-item-icon fa '''||wwv_flow.LF||
'          || p_item.icon_css_classes'||wwv_flow.LF||
'          || ''" a';
wwv_flow_imp.g_varchar2_table(2479) := 'ria-hidden="true"></span>'''||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_json.initialize_clob_output;'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2480) := '    apex_json.open_object;'||wwv_flow.LF||
'      apex_json.write( ''labelId'', p_item.name || ''_LABEL'' );'||wwv_flow.LF||
'      apex';
wwv_flow_imp.g_varchar2_table(2481) := '_json.write( ''ajaxIdentifier'', apex_plugin.get_ajax_identifier );'||wwv_flow.LF||
'      apex_json.close_object;'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2482) := '      apex_javascript.add_onload_code('||wwv_flow.LF||
'        p_code =>'||wwv_flow.LF||
'          apex_string.format('||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(2483) := '  p_message => ''blog.plugin.mathQuestionField.getQuestion(%s)'''||wwv_flow.LF||
'          , p0 => apex_json.get_clob';
wwv_flow_imp.g_varchar2_table(2484) := '_output'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Tell APEX that this input is navigable'||wwv_flow.LF||
'      p_result.is';
wwv_flow_imp.g_varchar2_table(2485) := '_navigable := true;'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      p_result.item_rendered := false;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end render';
wwv_flow_imp.g_varchar2_table(2486) := '_math_question_field;'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2487) := '---'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure a';
wwv_flow_imp.g_varchar2_table(2488) := 'jax_math_question_field('||wwv_flow.LF||
'    p_item    in            apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in         ';
wwv_flow_imp.g_varchar2_table(2489) := '   apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in            apex_plugin.t_item_ajax_param,'||wwv_flow.LF||
'    p_result  ';
wwv_flow_imp.g_varchar2_table(2490) := 'in out nocopy apex_plugin.t_item_ajax_result'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_err   varchar2(4000);'||wwv_flow.LF||
'    l_min   nu';
wwv_flow_imp.g_varchar2_table(2491) := 'mber;'||wwv_flow.LF||
'    l_max   number;'||wwv_flow.LF||
'    l_num_1 number;'||wwv_flow.LF||
'    l_num_2 number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_min   := to_n';
wwv_flow_imp.g_varchar2_table(2492) := 'umber( p_item.attribute_01 );'||wwv_flow.LF||
'    l_max   := to_number( p_item.attribute_02 );'||wwv_flow.LF||
'    l_num_1 := roun';
wwv_flow_imp.g_varchar2_table(2493) := 'd( sys.dbms_random.value( l_min, l_max ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_min   := to_number( p_item.attribute_03 );'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2494) := ' l_max   := to_number( p_item.attribute_04 );'||wwv_flow.LF||
'    l_num_2 := round( sys.dbms_random.value( l_min, l';
wwv_flow_imp.g_varchar2_table(2495) := '_max ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set correct answer to item session state'||wwv_flow.LF||
'    apex_util.set_session_state('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2496) := '  p_name   => p_item.attribute_05'||wwv_flow.LF||
'    , p_value  => blog_util.int_to_vc2( l_num_1 + l_num_2 )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2497) := ', p_commit => false'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Write header for the output'||wwv_flow.LF||
'    apex_plugin_util.print_json_h';
wwv_flow_imp.g_varchar2_table(2498) := 'ttp_header;'||wwv_flow.LF||
'    -- Write output'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_json.write('||wwv_flow.LF||
'      ''label'''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2499) := '     ,apex_string.format('||wwv_flow.LF||
'        p_message => ''%s&nbsp;%s&nbsp;&#%s&nbsp;%s&nbsp;&#%s&nbsp;&#%s'''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2500) := '      , p0 => p_item.plain_label'||wwv_flow.LF||
'      , p1 => to_html_entities( l_num_1 )'||wwv_flow.LF||
'      , p2 => ascii(''+''';
wwv_flow_imp.g_varchar2_table(2501) := ')'||wwv_flow.LF||
'      , p3 => to_html_entities( l_num_2 )'||wwv_flow.LF||
'      , p4 => ascii(''='')'||wwv_flow.LF||
'      , p5 => ascii(''?'')'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2502) := '    )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    apex_json.close_all;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error( ';
wwv_flow_imp.g_varchar2_table(2503) := '''ajax_math_question_field error: %s'', sqlerrm );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_err := apex_lang.get_message('||wwv_flow.LF||
'      p_nam';
wwv_flow_imp.g_varchar2_table(2504) := 'e => p_plugin.attribute_02'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    if l_err = apex_escape.html( upper( p_plugin.attribute_02 ';
wwv_flow_imp.g_varchar2_table(2505) := ') )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_err := p_plugin.attribute_02;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    raise_application_error( -2';
wwv_flow_imp.g_varchar2_table(2506) := '0002 ,  l_err );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ajax_math_question_field;'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(2507) := '---------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2508) := '---------------------------'||wwv_flow.LF||
'  procedure validate_math_question_field('||wwv_flow.LF||
'    p_item    in            ';
wwv_flow_imp.g_varchar2_table(2509) := 'apex_plugin.t_item,'||wwv_flow.LF||
'    p_plugin  in            apex_plugin.t_plugin,'||wwv_flow.LF||
'    p_param   in            ';
wwv_flow_imp.g_varchar2_table(2510) := 'apex_plugin.t_item_validation_param,'||wwv_flow.LF||
'    p_result  in out nocopy apex_plugin.t_item_validation_resu';
wwv_flow_imp.g_varchar2_table(2511) := 'lt'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_answer  varchar2(4000);'||wwv_flow.LF||
'    l_value   varchar2(4000);'||wwv_flow.LF||
'    l_result  boolean;';
wwv_flow_imp.g_varchar2_table(2512) := ''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_param.value is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_value   := v(p_item.attribute_05);';
wwv_flow_imp.g_varchar2_table(2513) := ''||wwv_flow.LF||
'      l_answer  := p_param.value;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Check is answer correct'||wwv_flow.LF||
'      l_result  := case whe';
wwv_flow_imp.g_varchar2_table(2514) := 'n l_value = l_answer then true else false end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      l_result := false;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2515) := ''||wwv_flow.LF||
'    if not l_result'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      p_result.message := apex_lang.get_message('||wwv_flow.LF||
'        p_name =';
wwv_flow_imp.g_varchar2_table(2516) := '> p_plugin.attribute_01'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_result.message = apex_escape.html( upper( p_plugin.a';
wwv_flow_imp.g_varchar2_table(2517) := 'ttribute_01 ) )'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        p_result.message := p_plugin.attribute_01;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2518) := '  end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end validate_math_question_field;'||wwv_flow.LF||
'--------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2519) := '------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2520) := '------------'||wwv_flow.LF||
'end "BLOG_PLUGIN";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_URL"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(2521) := '----------------------------------------------------------------'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(2522) := '----------------------------------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(2523) := '----------------------------------------------------------------'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(2524) := '----------------------------------------------'||wwv_flow.LF||
'-- json for pages and items'||wwv_flow.LF||
'  c_page_and_items cons';
wwv_flow_imp.g_varchar2_table(2525) := 'tant json_object_t := json_object_t.parse('||wwv_flow.LF||
'    ''{'||wwv_flow.LF||
'      "post": {"page": "POST", "items": "P2_POST';
wwv_flow_imp.g_varchar2_table(2526) := '_ID"},'||wwv_flow.LF||
'      "category": {"page": "CATEGORY", "items": "P14_CATEGORY_ID"},'||wwv_flow.LF||
'      "archive": {"page';
wwv_flow_imp.g_varchar2_table(2527) := '": "ARCHIVES", "items": "P15_ARCHIVE_ID"},'||wwv_flow.LF||
'      "tag": {"page": "TAG", "items": "P6_TAG_ID"},'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2528) := '   "unsubscribe": {"page": "POST", "items": "P2_POST_ID,P2_SUBSCRIPTION_ID"},'||wwv_flow.LF||
'      "download": {"p';
wwv_flow_imp.g_varchar2_table(2529) := 'age": "PGM", "items": "P1003_FILE_NAME", "process": "download"}'||wwv_flow.LF||
'    }'''||wwv_flow.LF||
'  );'||wwv_flow.LF||
''||wwv_flow.LF||
'-- cache rss and at';
wwv_flow_imp.g_varchar2_table(2530) := 'om url'||wwv_flow.LF||
'  g_rss_url             varchar2(1024);'||wwv_flow.LF||
'  g_atom_url            varchar2(1024);'||wwv_flow.LF||
'-- cache c';
wwv_flow_imp.g_varchar2_table(2531) := 'anonical host url'||wwv_flow.LF||
'  g_canonical_host_url  varchar2(1024);'||wwv_flow.LF||
''||wwv_flow.LF||
'--------------------------------------';
wwv_flow_imp.g_varchar2_table(2532) := '------------------------------------------'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2533) := '------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(2534) := '-------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2535) := '-------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2536) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2537) := '-- Global procedures and functions'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2538) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2539) := '  procedure set_canonical_host'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get canonical host from blog settings or use';
wwv_flow_imp.g_varchar2_table(2540) := ' APEX provided value'||wwv_flow.LF||
'    -- cache value to package private variable'||wwv_flow.LF||
'    if g_canonical_host_url is';
wwv_flow_imp.g_varchar2_table(2541) := ' null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      g_canonical_host_url := blog_util.get_attribute_value( ''G_CANONICAL_HOST'' )';
wwv_flow_imp.g_varchar2_table(2542) := ';'||wwv_flow.LF||
'      -- if host not found from settings, use APEX provided value'||wwv_flow.LF||
'      if g_canonical_host_url ';
wwv_flow_imp.g_varchar2_table(2543) := 'is null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        g_canonical_host_url := apex_util.host_url();'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'      -- ';
wwv_flow_imp.g_varchar2_table(2544) := 'remove trailing slash'||wwv_flow.LF||
'      g_canonical_host_url := rtrim( g_canonical_host_url, ''/'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end ';
wwv_flow_imp.g_varchar2_table(2545) := 'if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_canonical_host;'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2546) := '--------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2547) := 'function get_canonical_host'||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_canonical_host_url;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2548) := ''||wwv_flow.LF||
'  end get_canonical_host;'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2549) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  functi';
wwv_flow_imp.g_varchar2_table(2550) := 'on get_tab('||wwv_flow.LF||
'    p_page        in varchar2,'||wwv_flow.LF||
'    p_application in varchar2 default null,'||wwv_flow.LF||
'    p_cano';
wwv_flow_imp.g_varchar2_table(2551) := 'nical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2552) := '   return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'        when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'      end ||'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2553) := ' apex_page.get_url('||wwv_flow.LF||
'        p_application => p_application'||wwv_flow.LF||
'      , p_page        => p_page'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2554) := ', p_session     => '''''||wwv_flow.LF||
'      , p_plain_url   => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_tab;'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(2555) := '--------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(2556) := '--------------------------------------------------'||wwv_flow.LF||
'  function get_post('||wwv_flow.LF||
'    p_post_id     in numbe';
wwv_flow_imp.g_varchar2_table(2557) := 'r,'||wwv_flow.LF||
'    p_application in varchar2 default null,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) ret';
wwv_flow_imp.g_varchar2_table(2558) := 'urn varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_post_id varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id := blog_util.int_to_vc2( ';
wwv_flow_imp.g_varchar2_table(2559) := 'p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      get_post('||wwv_flow.LF||
'        p_post_id     => l_post_id'||wwv_flow.LF||
'      , p_applicati';
wwv_flow_imp.g_varchar2_table(2560) := 'on => p_application'||wwv_flow.LF||
'      , p_canonical   => p_canonical'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_post;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2561) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2562) := '--------------------------------------------------------'||wwv_flow.LF||
'  function get_post('||wwv_flow.LF||
'    p_post_id     in';
wwv_flow_imp.g_varchar2_table(2563) := ' varchar2,'||wwv_flow.LF||
'    p_application in varchar2 default null,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO''';
wwv_flow_imp.g_varchar2_table(2564) := ''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  l_json := c_page_and_items.get_o';
wwv_flow_imp.g_varchar2_table(2565) := 'bject( ''post'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'  return'||wwv_flow.LF||
'    case p_canonical'||wwv_flow.LF||
'      when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2566) := 'end ||'||wwv_flow.LF||
'    apex_page.get_url('||wwv_flow.LF||
'      p_application => p_application'||wwv_flow.LF||
'    , p_page        => l_json.';
wwv_flow_imp.g_varchar2_table(2567) := 'get_string( ''page'' )'||wwv_flow.LF||
'    , p_session     => '''''||wwv_flow.LF||
'    , p_items       => l_json.get_string( ''items'' )';
wwv_flow_imp.g_varchar2_table(2568) := ''||wwv_flow.LF||
'    , p_values      => p_post_id'||wwv_flow.LF||
'    , p_plain_url   => true'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_post;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(2569) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'----------------------';
wwv_flow_imp.g_varchar2_table(2570) := '----------------------------------------------------------'||wwv_flow.LF||
'  function get_category('||wwv_flow.LF||
'    p_category';
wwv_flow_imp.g_varchar2_table(2571) := '_id in number,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_categor';
wwv_flow_imp.g_varchar2_table(2572) := 'y_id varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_category_id := blog_util.int_to_vc2( p_category_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    r';
wwv_flow_imp.g_varchar2_table(2573) := 'eturn'||wwv_flow.LF||
'      get_category('||wwv_flow.LF||
'        p_category_id => l_category_id'||wwv_flow.LF||
'      , p_canonical   => p_canon';
wwv_flow_imp.g_varchar2_table(2574) := 'ical'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_category;'||wwv_flow.LF||
'-------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2575) := '-------------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2576) := '-------'||wwv_flow.LF||
'  function get_category('||wwv_flow.LF||
'    p_category_id in varchar2,'||wwv_flow.LF||
'    p_canonical   in varchar2 def';
wwv_flow_imp.g_varchar2_table(2577) := 'ault ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'  l_json := c_page_and_i';
wwv_flow_imp.g_varchar2_table(2578) := 'tems.get_object( ''category'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'        when ''YES'' then g_cano';
wwv_flow_imp.g_varchar2_table(2579) := 'nical_host_url'||wwv_flow.LF||
'      end ||'||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_page      => l_json.get_string( ''p';
wwv_flow_imp.g_varchar2_table(2580) := 'age'' )'||wwv_flow.LF||
'      , p_session   => '''''||wwv_flow.LF||
'      , p_items     => l_json.get_string( ''items'' )'||wwv_flow.LF||
'      , p_va';
wwv_flow_imp.g_varchar2_table(2581) := 'lues    => p_category_id'||wwv_flow.LF||
'      , p_plain_url => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_category;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2582) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2583) := '--------------------------------------------------------'||wwv_flow.LF||
'  function get_archive('||wwv_flow.LF||
'    p_archive_id ';
wwv_flow_imp.g_varchar2_table(2584) := ' in number,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_archive_id';
wwv_flow_imp.g_varchar2_table(2585) := ' varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_archive_id := blog_util.int_to_vc2( p_archive_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return';
wwv_flow_imp.g_varchar2_table(2586) := ''||wwv_flow.LF||
'      get_archive('||wwv_flow.LF||
'        p_archive_id  => l_archive_id'||wwv_flow.LF||
'      , p_canonical   => p_canonical'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2587) := '    )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_archive;'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2588) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2589) := '  function get_archive('||wwv_flow.LF||
'    p_archive_id  in varchar2,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO''';
wwv_flow_imp.g_varchar2_table(2590) := ''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and_items.get';
wwv_flow_imp.g_varchar2_table(2591) := '_object( ''archive'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'        when ''YES'' then g_canonical_hos';
wwv_flow_imp.g_varchar2_table(2592) := 't_url'||wwv_flow.LF||
'      end  ||'||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_page      => l_json.get_string( ''page'' )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2593) := '      , p_session   => '''''||wwv_flow.LF||
'      , p_items     => l_json.get_string( ''items'' )'||wwv_flow.LF||
'      , p_values    ';
wwv_flow_imp.g_varchar2_table(2594) := '=> p_archive_id'||wwv_flow.LF||
'      , p_plain_url => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_archive;'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(2595) := '----------------------------------------------------------------'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(2596) := '----------------------------------------------'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id      in number,'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2597) := '   p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_tag_id varchar2(256);'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2598) := ' begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_tag_id := blog_util.int_to_vc2( p_tag_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      get_tag('||wwv_flow.LF||
'        p';
wwv_flow_imp.g_varchar2_table(2599) := '_tag_id    => l_tag_id'||wwv_flow.LF||
'      , p_canonical => p_canonical'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_tag;'||wwv_flow.LF||
'------';
wwv_flow_imp.g_varchar2_table(2600) := '--------------------------------------------------------------------------'||wwv_flow.LF||
'------------------------';
wwv_flow_imp.g_varchar2_table(2601) := '--------------------------------------------------------'||wwv_flow.LF||
'  function get_tag('||wwv_flow.LF||
'    p_tag_id      in ';
wwv_flow_imp.g_varchar2_table(2602) := 'varchar2,'||wwv_flow.LF||
'    p_canonical   in varchar2 default ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_ob';
wwv_flow_imp.g_varchar2_table(2603) := 'ject_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and_items.get_object( ''tag'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_';
wwv_flow_imp.g_varchar2_table(2604) := 'canonical'||wwv_flow.LF||
'        when ''YES'' then g_canonical_host_url'||wwv_flow.LF||
'      end ||'||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2605) := '     p_page      => l_json.get_string( ''page'' )'||wwv_flow.LF||
'      , p_session   => '''''||wwv_flow.LF||
'      , p_items     => l';
wwv_flow_imp.g_varchar2_table(2606) := '_json.get_string( ''items'' )'||wwv_flow.LF||
'      , p_values    => p_tag_id'||wwv_flow.LF||
'      , p_plain_url => true'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2607) := '    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_tag;'||wwv_flow.LF||
'---------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2608) := '-----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function ';
wwv_flow_imp.g_varchar2_table(2609) := 'get_dynamic_page('||wwv_flow.LF||
'    p_content_id in number'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_content_id varchar(2';
wwv_flow_imp.g_varchar2_table(2610) := '56);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_content_id := blog_util.int_to_vc2( p_content_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      apex';
wwv_flow_imp.g_varchar2_table(2611) := '_page.get_url('||wwv_flow.LF||
'        p_page    => ''information'''||wwv_flow.LF||
'      , p_request => l_content_id'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2612) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_dynamic_page;'||wwv_flow.LF||
'----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2613) := '----------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  func';
wwv_flow_imp.g_varchar2_table(2614) := 'tion get_process('||wwv_flow.LF||
'    p_application in varchar2 default null,'||wwv_flow.LF||
'    p_process     in varchar2 defaul';
wwv_flow_imp.g_varchar2_table(2615) := 't null,'||wwv_flow.LF||
'    p_items       in varchar2 default null,'||wwv_flow.LF||
'    p_values      in varchar2 default null,'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2616) := '   p_canonical   in varchar2 default ''YES'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_request varchar2(256);';
wwv_flow_imp.g_varchar2_table(2617) := ''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_request :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_message => ''application_process=%';
wwv_flow_imp.g_varchar2_table(2618) := 's'''||wwv_flow.LF||
'      , p0 => p_process'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case p_canonical'||wwv_flow.LF||
'      when ''YES'''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2619) := '     then g_canonical_host_url end ||'||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_application => p_applicat';
wwv_flow_imp.g_varchar2_table(2620) := 'ion'||wwv_flow.LF||
'      , p_page        => ''pgm'''||wwv_flow.LF||
'      , p_session     => '''''||wwv_flow.LF||
'      , p_request     => l_request';
wwv_flow_imp.g_varchar2_table(2621) := ''||wwv_flow.LF||
'      , p_items       => p_items'||wwv_flow.LF||
'      , p_values      => p_values'||wwv_flow.LF||
'      , p_plain_url   => true';
wwv_flow_imp.g_varchar2_table(2622) := ''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_process;'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2623) := '--------------------'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2624) := '--'||wwv_flow.LF||
'  function get_unsubscribe('||wwv_flow.LF||
'    p_application     in varchar2,'||wwv_flow.LF||
'    p_post_id         in varcha';
wwv_flow_imp.g_varchar2_table(2625) := 'r2,'||wwv_flow.LF||
'    p_subscription_id in number'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url     varchar2(4000);'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2626) := 'l_subs_id varchar2(256);'||wwv_flow.LF||
'    l_json    json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and_items.ge';
wwv_flow_imp.g_varchar2_table(2627) := 't_object( ''unsubscribe'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_subs_id := blog_util.int_to_vc2( p_subscription_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_u';
wwv_flow_imp.g_varchar2_table(2628) := 'rl :='||wwv_flow.LF||
'      apex_page.get_url('||wwv_flow.LF||
'        p_application => p_application'||wwv_flow.LF||
'      , p_page        => l_';
wwv_flow_imp.g_varchar2_table(2629) := 'json.get_string( ''page'' )'||wwv_flow.LF||
'      , p_session     => '''''||wwv_flow.LF||
'      , p_items       => l_json.get_string( ';
wwv_flow_imp.g_varchar2_table(2630) := '''items'' )'||wwv_flow.LF||
'      , p_values      => p_post_id || '','' || l_subs_id'||wwv_flow.LF||
'      , p_plain_url   => true'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2631) := '    )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_canonical_host_url || l_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_unsubscribe;'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(2632) := '-----------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(2633) := '-----------------------------------------------'||wwv_flow.LF||
'  function get_rss('||wwv_flow.LF||
'    p_application in varchar2 ';
wwv_flow_imp.g_varchar2_table(2634) := 'default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- get rss url from blog settings or use defau';
wwv_flow_imp.g_varchar2_table(2635) := 'lt value'||wwv_flow.LF||
'    -- cache value to package private variable'||wwv_flow.LF||
'    if g_rss_url is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2636) := '-- Fetch RSS URL override from settings'||wwv_flow.LF||
'      g_rss_url := blog_util.get_attribute_value( ''G_RSS_UR';
wwv_flow_imp.g_varchar2_table(2637) := 'L'' );'||wwv_flow.LF||
'      -- If there isn''t override custruct URL'||wwv_flow.LF||
'      if g_rss_url is null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2638) := '  g_rss_url :='||wwv_flow.LF||
'          get_process('||wwv_flow.LF||
'            p_application => p_application'||wwv_flow.LF||
'          , p_pr';
wwv_flow_imp.g_varchar2_table(2639) := 'ocess     => ''rss.xml'''||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_rss_url;';
wwv_flow_imp.g_varchar2_table(2640) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_rss;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2641) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get_at';
wwv_flow_imp.g_varchar2_table(2642) := 'om('||wwv_flow.LF||
'    p_application in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- cache ';
wwv_flow_imp.g_varchar2_table(2643) := 'value to package private variable'||wwv_flow.LF||
'    if g_atom_url is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      g_atom_url :='||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2644) := ' get_process('||wwv_flow.LF||
'          p_application => p_application'||wwv_flow.LF||
'        , p_process     => ''atom.xml'''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2645) := '    )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_atom_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_atom;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(2646) := '------------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(2647) := '------------------------------------'||wwv_flow.LF||
'  function get_rss_xsl('||wwv_flow.LF||
'    p_application in varchar2 default';
wwv_flow_imp.g_varchar2_table(2648) := ' null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xsl_url varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Fetch XSL URL ove';
wwv_flow_imp.g_varchar2_table(2649) := 'rride from settings'||wwv_flow.LF||
'    l_xsl_url := blog_util.get_attribute_value( ''G_RSS_XSL_URL'' );'||wwv_flow.LF||
'    -- If t';
wwv_flow_imp.g_varchar2_table(2650) := 'here isn''t override use default XSL'||wwv_flow.LF||
'    if l_xsl_url is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_xsl_url :='||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2651) := ' get_process('||wwv_flow.LF||
'          p_application => p_application'||wwv_flow.LF||
'        , p_process     => ''rss.xsl'''||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(2652) := '   )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_xsl_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_rss_xsl;'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(2653) := '-------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(2654) := '-------------------------------------'||wwv_flow.LF||
'  function get_sitemap_index('||wwv_flow.LF||
'    p_application     in varch';
wwv_flow_imp.g_varchar2_table(2655) := 'ar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_sitemap_url varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_sit';
wwv_flow_imp.g_varchar2_table(2656) := 'emap_url :='||wwv_flow.LF||
'      get_process('||wwv_flow.LF||
'        p_application => p_application'||wwv_flow.LF||
'      , p_process     => ''s';
wwv_flow_imp.g_varchar2_table(2657) := 'itemap-index.xml'''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_sitemap_url;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_sitemap_index;'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(2658) := '------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(2659) := '------------------------------------------------------'||wwv_flow.LF||
'  function get_file('||wwv_flow.LF||
'    p_file_path       ';
wwv_flow_imp.g_varchar2_table(2660) := 'in varchar2,'||wwv_flow.LF||
'    p_application     in varchar2 default null,'||wwv_flow.LF||
'    p_canonical       in varchar2 def';
wwv_flow_imp.g_varchar2_table(2661) := 'ault ''NO'''||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_json := c_page_and';
wwv_flow_imp.g_varchar2_table(2662) := '_items.get_object( ''download'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      get_process('||wwv_flow.LF||
'        p_application => p_appli';
wwv_flow_imp.g_varchar2_table(2663) := 'cation'||wwv_flow.LF||
'      , p_process     => l_json.get_string( ''process'' )'||wwv_flow.LF||
'      , p_items       => l_json.get';
wwv_flow_imp.g_varchar2_table(2664) := '_string( ''items'' )'||wwv_flow.LF||
'      , p_values      => p_file_path'||wwv_flow.LF||
'      , p_canonical   => p_canonical'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2665) := '  )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_file;'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2666) := '-----------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Pa';
wwv_flow_imp.g_varchar2_table(2667) := 'ckage initialization'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2668) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  -- in';
wwv_flow_imp.g_varchar2_table(2669) := 'itialize parameters'||wwv_flow.LF||
'  apex_debug.info( ''----- Initialize package BLOG_URL -----'' );'||wwv_flow.LF||
'  set_canonica';
wwv_flow_imp.g_varchar2_table(2670) := 'l_host;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(2671) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_URL";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create ';
wwv_flow_imp.g_varchar2_table(2672) := 'or replace package body "BLOG_COMMENT"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2673) := '------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2674) := '------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2675) := '------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2676) := '------'||wwv_flow.LF||
'  c_whitelist_tags  constant varchar2(256) := ''<b>,</b>,<i>,</i>,<u>,</u>,<code>,</code>'';'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2677) := '  c_code_block_html constant varchar2(256) := ''<pre class="blog-program-code"><code>%s</code></pre>''';
wwv_flow_imp.g_varchar2_table(2678) := ';'||wwv_flow.LF||
'  c_app_email       constant varchar2(256) := blog_util.get_attribute_value( ''G_APP_EMAIL'' );'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(2679) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------';
wwv_flow_imp.g_varchar2_table(2680) := '------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(2681) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(2682) := '-------------------------------------------------------------'||wwv_flow.LF||
'  procedure remove_html_tags('||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(2683) := 'string    in out nocopy varchar2,'||wwv_flow.LF||
'    p_html_tags in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_html_tags apex_t_va';
wwv_flow_imp.g_varchar2_table(2684) := 'rchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- create table of html tags'||wwv_flow.LF||
'    l_html_tags := apex_string.split( p_html_tag';
wwv_flow_imp.g_varchar2_table(2685) := 's, '':'' );'||wwv_flow.LF||
'    -- loop table'||wwv_flow.LF||
'    for i in 1 .. l_html_tags.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      -- remove html ta';
wwv_flow_imp.g_varchar2_table(2686) := 'g'||wwv_flow.LF||
'      p_string :='||wwv_flow.LF||
'        regexp_replace('||wwv_flow.LF||
'          p_string'||wwv_flow.LF||
'        , apex_string.format('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2687) := '          p_message => ''<%0[^>]*>(.*?)<\/%0>'''||wwv_flow.LF||
'          , p0 => l_html_tags(i)'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2688) := '  , '''', 1, 0, ''in'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end remove_html_tags;'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(2689) := '--------------------------------------------------------------'||wwv_flow.LF||
'------------------------------------';
wwv_flow_imp.g_varchar2_table(2690) := '--------------------------------------------'||wwv_flow.LF||
'  procedure remove_ascii('||wwv_flow.LF||
'    p_string in out nocopy ';
wwv_flow_imp.g_varchar2_table(2691) := 'varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- remove unwanted ascii codes except new line chr 10'||wwv_flow.LF||
'    for i i';
wwv_flow_imp.g_varchar2_table(2692) := 'n 0 .. 31'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
'      if i != 10 then'||wwv_flow.LF||
'        p_string := trim( replace( p_string, chr(i) ) );';
wwv_flow_imp.g_varchar2_table(2693) := ''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
'  end remove_ascii;'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2694) := '---------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2695) := '---------------'||wwv_flow.LF||
'  procedure escape_html('||wwv_flow.LF||
'    p_string in out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_has';
wwv_flow_imp.g_varchar2_table(2696) := 'mark constant varchar(10) := ''#HashMark#'';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- change all hash marks so we can escape';
wwv_flow_imp.g_varchar2_table(2697) := ' those'||wwv_flow.LF||
'    -- after calling apex_escape.html_whitelist'||wwv_flow.LF||
'    -- escape of hash marks needed to preve';
wwv_flow_imp.g_varchar2_table(2698) := 'nt APEX substitutions'||wwv_flow.LF||
'    p_string := replace( p_string, ''#'', l_hasmark );'||wwv_flow.LF||
'    -- escape comment h';
wwv_flow_imp.g_varchar2_table(2699) := 'tml'||wwv_flow.LF||
'    p_string := apex_escape.html_whitelist('||wwv_flow.LF||
'      p_html            => p_string'||wwv_flow.LF||
'    , p_white';
wwv_flow_imp.g_varchar2_table(2700) := 'list_tags  => c_whitelist_tags'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- escape hash marks'||wwv_flow.LF||
'    p_string := replace( p_string,';
wwv_flow_imp.g_varchar2_table(2701) := ' l_hasmark, ''	&#35;'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end escape_html;'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2702) := '---------------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2703) := '---------'||wwv_flow.LF||
'  procedure build_code_tab('||wwv_flow.LF||
'    p_comment   in out nocopy varchar2,'||wwv_flow.LF||
'    p_code_tab  in ';
wwv_flow_imp.g_varchar2_table(2704) := 'out nocopy apex_t_varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_code      varchar2(32700);'||wwv_flow.LF||
'    l_code_cnt  pls_integ';
wwv_flow_imp.g_varchar2_table(2705) := 'er := 0;'||wwv_flow.LF||
'    l_start_pos pls_integer := 0;'||wwv_flow.LF||
'    l_end_pos   pls_integer := 0;'||wwv_flow.LF||
''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(2706) := 'check code open tag count'||wwv_flow.LF||
'    l_code_cnt := regexp_count( p_comment, ''<code>'', 1, ''i'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(2707) := 'process code tags if open and close count match ( pre check is for valid HTML )'||wwv_flow.LF||
'    if l_code_cnt =';
wwv_flow_imp.g_varchar2_table(2708) := ' regexp_count( p_comment, ''<\/code>'', 1, ''i'' )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- collect content inside code tag';
wwv_flow_imp.g_varchar2_table(2709) := 's to collection'||wwv_flow.LF||
'      for i in 1 .. l_code_cnt'||wwv_flow.LF||
'      loop'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_code := null;'||wwv_flow.LF||
''||wwv_flow.LF||
'        --';
wwv_flow_imp.g_varchar2_table(2710) := ' get code start and end position'||wwv_flow.LF||
'        l_start_pos := instr( lower( p_comment ), ''<code>'' );'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2711) := '     l_end_pos := instr( lower( p_comment ), ''</code>'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_code := trim( substr( p_comme';
wwv_flow_imp.g_varchar2_table(2712) := 'nt, l_start_pos  + 6, l_end_pos - l_start_pos - 6 ) );'||wwv_flow.LF||
'        l_code := trim( trim( both chr(10) f';
wwv_flow_imp.g_varchar2_table(2713) := 'rom l_code ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- store code tag content to collection and wrap it to pre tag having cla';
wwv_flow_imp.g_varchar2_table(2714) := 'ss'||wwv_flow.LF||
'        apex_string.push('||wwv_flow.LF||
'          p_table => p_code_tab'||wwv_flow.LF||
'        , p_value =>'||wwv_flow.LF||
'            ap';
wwv_flow_imp.g_varchar2_table(2715) := 'ex_string.format('||wwv_flow.LF||
'              p_message => c_code_block_html'||wwv_flow.LF||
'            , p0 => l_code'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2716) := '    )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- substitude handled code tag'||wwv_flow.LF||
'        p_comment :='||wwv_flow.LF||
'          apex_st';
wwv_flow_imp.g_varchar2_table(2717) := 'ring.format('||wwv_flow.LF||
'            p_message => ''%s%s#BLOG_COMMENT_CODE%s#%s%s'''||wwv_flow.LF||
'          , p0 => rtrim( sub';
wwv_flow_imp.g_varchar2_table(2718) := 'str( p_comment, 1, l_start_pos - 1 ), chr(10) )'||wwv_flow.LF||
'          , p1 => chr(10)'||wwv_flow.LF||
'          , p2 => i'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2719) := '       , p3 => chr(10)'||wwv_flow.LF||
'          , p4 => ltrim( substr( p_comment, l_end_pos + 7 ), chr(10) )'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2720) := '      )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end build_code_tab;'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(2721) := '-----------------------------------------------------------'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(2722) := '-----------------------------------------'||wwv_flow.LF||
'  procedure build_comment_html('||wwv_flow.LF||
'    p_comment in out noc';
wwv_flow_imp.g_varchar2_table(2723) := 'opy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_temp        varchar2(32700);'||wwv_flow.LF||
'    l_code_row    pls_integer;'||wwv_flow.LF||
'    l_c';
wwv_flow_imp.g_varchar2_table(2724) := 'ode_tab    apex_t_varchar2;'||wwv_flow.LF||
'    l_comment_tab apex_t_varchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process code tags';
wwv_flow_imp.g_varchar2_table(2725) := ''||wwv_flow.LF||
'    build_code_tab('||wwv_flow.LF||
'      p_comment => p_comment'||wwv_flow.LF||
'    , p_code_tab => l_code_tab'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(2726) := '- split comment to collection by new line character'||wwv_flow.LF||
'    l_comment_tab := apex_string.split( p_comme';
wwv_flow_imp.g_varchar2_table(2727) := 'nt, chr(10) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- comment is stored to collection'||wwv_flow.LF||
'    -- start building comment with prober ';
wwv_flow_imp.g_varchar2_table(2728) := 'html tags'||wwv_flow.LF||
'    p_comment := null;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Format comment'||wwv_flow.LF||
'    for i in 1 .. l_comment_tab.count'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2729) := '   loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_temp := trim( l_comment_tab(i) );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- check if row is code block'||wwv_flow.LF||
'      i';
wwv_flow_imp.g_varchar2_table(2730) := 'f regexp_like( l_temp, ''^#BLOG_COMMENT_CODE[0-9]+\#$'' )'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- get code block row n';
wwv_flow_imp.g_varchar2_table(2731) := 'umber'||wwv_flow.LF||
'        l_code_row := regexp_substr( l_temp, ''[0-9]+'' );'||wwv_flow.LF||
'        -- close p tag, insert code';
wwv_flow_imp.g_varchar2_table(2732) := ' block'||wwv_flow.LF||
'        -- and open p tag again for text'||wwv_flow.LF||
'        p_comment :='||wwv_flow.LF||
'          apex_string.format';
wwv_flow_imp.g_varchar2_table(2733) := '('||wwv_flow.LF||
'            p_message => ''%s%s'''||wwv_flow.LF||
'          , p0 => p_comment'||wwv_flow.LF||
'          , p1 => l_code_tab( l_cod';
wwv_flow_imp.g_varchar2_table(2734) := 'e_row )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        -- append text if row is not empty'||wwv_flow.LF||
'        if ';
wwv_flow_imp.g_varchar2_table(2735) := 'l_temp is not null'||wwv_flow.LF||
'        then'||wwv_flow.LF||
'          p_comment :='||wwv_flow.LF||
'            apex_string.format('||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(2736) := '     p_message => ''%s<p>%s</p>'''||wwv_flow.LF||
'            , p0 => p_comment'||wwv_flow.LF||
'            , p1 => l_temp'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(2737) := '    )'||wwv_flow.LF||
'          ;'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end build_comment_html;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2738) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(2739) := '--------------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2740) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(2741) := '--------------------------------------------------------------'||wwv_flow.LF||
'  function plain_text('||wwv_flow.LF||
'    p_string';
wwv_flow_imp.g_varchar2_table(2742) := ' in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_string varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_string := p';
wwv_flow_imp.g_varchar2_table(2743) := '_string;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- remove unwanted ascii'||wwv_flow.LF||
'    remove_ascii('||wwv_flow.LF||
'      p_string => l_string'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2744) := ' -- Unescape HTML entities'||wwv_flow.LF||
'    l_string := utl_i18n.unescape_reference( l_string );'||wwv_flow.LF||
'    -- remove ';
wwv_flow_imp.g_varchar2_table(2745) := 'code and anchor HTML tags'||wwv_flow.LF||
'    remove_html_tags('||wwv_flow.LF||
'      p_string    => l_string'||wwv_flow.LF||
'    , p_html_tags =';
wwv_flow_imp.g_varchar2_table(2746) := '> ''code'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- add space before html tag'||wwv_flow.LF||
'    -- needed for language AI sentence recogniti';
wwv_flow_imp.g_varchar2_table(2747) := 'on'||wwv_flow.LF||
'    l_string := replace( l_string, ''<'', '' <'' );'||wwv_flow.LF||
'    -- remove HTML'||wwv_flow.LF||
'    l_string := apex_escape';
wwv_flow_imp.g_varchar2_table(2748) := '.striphtml( l_string );'||wwv_flow.LF||
'    -- remove extra whitespaces'||wwv_flow.LF||
'    l_string := blog_util.remove_whitespac';
wwv_flow_imp.g_varchar2_table(2749) := 'e( l_string );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_string;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end plain_text;'||wwv_flow.LF||
'---------------------------------------';
wwv_flow_imp.g_varchar2_table(2750) := '-----------------------------------------'||wwv_flow.LF||
'---------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2751) := '-----------------------'||wwv_flow.LF||
'  function short_text('||wwv_flow.LF||
'    p_string      in varchar2,'||wwv_flow.LF||
'    p_plain_text  i';
wwv_flow_imp.g_varchar2_table(2752) := 'n boolean default true,'||wwv_flow.LF||
'    p_str_length  in number default 100'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_l';
wwv_flow_imp.g_varchar2_table(2753) := 'ength  pls_integer;'||wwv_flow.LF||
'    l_string  varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_string := p_string;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if ';
wwv_flow_imp.g_varchar2_table(2754) := 'p_plain_text'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_string := plain_text( l_string );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_length := in';
wwv_flow_imp.g_varchar2_table(2755) := 'str( l_string, '' '', p_str_length );'||wwv_flow.LF||
''||wwv_flow.LF||
'    return'||wwv_flow.LF||
'      case when l_length > 0'||wwv_flow.LF||
'        then substr';
wwv_flow_imp.g_varchar2_table(2756) := '( l_string, 1, l_length ) || '' ...'''||wwv_flow.LF||
'        else l_string'||wwv_flow.LF||
'      end'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end short_text;'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(2757) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(2758) := '-------------------------------------------------------------'||wwv_flow.LF||
'  function format_comment('||wwv_flow.LF||
'    p_com';
wwv_flow_imp.g_varchar2_table(2759) := 'ment in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_comment varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_commen';
wwv_flow_imp.g_varchar2_table(2760) := 't := p_comment;'||wwv_flow.LF||
'    -- remove unwanted ascii'||wwv_flow.LF||
'    remove_ascii('||wwv_flow.LF||
'      p_string => l_comment'||wwv_flow.LF||
'    )';
wwv_flow_imp.g_varchar2_table(2761) := ';'||wwv_flow.LF||
'    -- remove anchors tags'||wwv_flow.LF||
'    remove_html_tags('||wwv_flow.LF||
'      p_string    => l_comment'||wwv_flow.LF||
'    , p_html_t';
wwv_flow_imp.g_varchar2_table(2762) := 'ags => ''a'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- escape HTML'||wwv_flow.LF||
'    escape_html('||wwv_flow.LF||
'      p_string => l_comment'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(2763) := '- build comment HTML'||wwv_flow.LF||
'    build_comment_html('||wwv_flow.LF||
'      p_comment => l_comment'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debu';
wwv_flow_imp.g_varchar2_table(2764) := 'g.info( ''Formatted comment: %s'', l_comment );'||wwv_flow.LF||
'    -- return comment'||wwv_flow.LF||
'    return l_comment;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end';
wwv_flow_imp.g_varchar2_table(2765) := ' format_comment;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2766) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function validat';
wwv_flow_imp.g_varchar2_table(2767) := 'e_comment('||wwv_flow.LF||
'    p_comment     in varchar2,'||wwv_flow.LF||
'    p_max_length  in number default 4000'||wwv_flow.LF||
'  ) return var';
wwv_flow_imp.g_varchar2_table(2768) := 'char2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml       xmltype;'||wwv_flow.LF||
'    l_result    varchar2(32700);'||wwv_flow.LF||
'    l_err_mesg  varchar2(32';
wwv_flow_imp.g_varchar2_table(2769) := '700);'||wwv_flow.LF||
''||wwv_flow.LF||
'    xml_parsing_failed exception;'||wwv_flow.LF||
'    pragma exception_init( xml_parsing_failed, -31011 );';
wwv_flow_imp.g_varchar2_table(2770) := ''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check formatted comment length'||wwv_flow.LF||
'    if length( p_comment ) > p_max_length'||wwv_flow.LF||
'    t';
wwv_flow_imp.g_varchar2_table(2771) := 'hen'||wwv_flow.LF||
'      -- set error message'||wwv_flow.LF||
'      l_err_mesg := ''BLOG_VALIDATION_ERR_COMMENT_LENGTH'';'||wwv_flow.LF||
'    else';
wwv_flow_imp.g_varchar2_table(2772) := ''||wwv_flow.LF||
'      -- check HTML is valid'||wwv_flow.LF||
'      -- TO DO see item 1 from package specs'||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        l';
wwv_flow_imp.g_varchar2_table(2773) := '_xml := xmltype.createxml('||wwv_flow.LF||
'          apex_string.format('||wwv_flow.LF||
'            p_message => ''<comment>%s</co';
wwv_flow_imp.g_varchar2_table(2774) := 'mment>'''||wwv_flow.LF||
'          , p0 => p_comment'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      exception when xml_parsing_fail';
wwv_flow_imp.g_varchar2_table(2775) := 'ed then'||wwv_flow.LF||
'        -- set error message'||wwv_flow.LF||
'        l_err_mesg := ''BLOG_VALIDATION_ERR_COMMENT_HTML'';'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2776) := '    end;'||wwv_flow.LF||
''||wwv_flow.LF||
'      if short_text( p_comment ) is null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- set error message'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2777) := '    l_err_mesg := ''BLOG_VALIDATION_ERR_COMMENT_PREVIEW'';'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if l_e';
wwv_flow_imp.g_varchar2_table(2778) := 'rr_mesg is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- prepare return validation error message'||wwv_flow.LF||
'      l_result := a';
wwv_flow_imp.g_varchar2_table(2779) := 'pex_lang.get_message('||wwv_flow.LF||
'        p_name => l_err_mesg'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- return validation';
wwv_flow_imp.g_varchar2_table(2780) := ' result'||wwv_flow.LF||
'    -- if validation fails we return error message stored to variable'||wwv_flow.LF||
'    return l_result;';
wwv_flow_imp.g_varchar2_table(2781) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  end validate_comment;'||wwv_flow.LF||
'-----------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2782) := '---------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  funct';
wwv_flow_imp.g_varchar2_table(2783) := 'ion is_email('||wwv_flow.LF||
'    p_email     in varchar2,'||wwv_flow.LF||
'    p_err_mesg  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as';
wwv_flow_imp.g_varchar2_table(2784) := ''||wwv_flow.LF||
'    l_err_mesg varchar2(32700);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- TO DO see item 3 from package specs'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- do s';
wwv_flow_imp.g_varchar2_table(2785) := 'ome basic check for email address'||wwv_flow.LF||
'    if not regexp_like( p_email, ''^.*\@.*\..*$'' )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2786) := '  -- if validation fails prepare error message'||wwv_flow.LF||
'      l_err_mesg := p_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2787) := '  return l_err_mesg;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end is_email;'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2788) := '---------------------'||wwv_flow.LF||
'-----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2789) := '---'||wwv_flow.LF||
'  procedure flag_comment('||wwv_flow.LF||
'    p_comment_id  in varchar2,'||wwv_flow.LF||
'    p_flags       in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2790) := '  as'||wwv_flow.LF||
'    l_flags apex_t_varchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_flags := apex_string.split( p_flags, '':'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2791) := '    for i in 1 .. l_flags.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        insert into blog_comment_flags( co';
wwv_flow_imp.g_varchar2_table(2792) := 'mment_id, flag )'||wwv_flow.LF||
'          values( p_comment_id, l_flags(i) )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      exception when dup_';
wwv_flow_imp.g_varchar2_table(2793) := 'val_on_index'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug.warn( ''Duplicate flag %s for comment id: %s'', l_flags(i';
wwv_flow_imp.g_varchar2_table(2794) := '), p_comment_id );'||wwv_flow.LF||
'      end;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end flag_comment;'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(2795) := '----------------------------------------------------'||wwv_flow.LF||
'----------------------------------------------';
wwv_flow_imp.g_varchar2_table(2796) := '----------------------------------'||wwv_flow.LF||
'  procedure unflag_comment('||wwv_flow.LF||
'    p_comment_id  in varchar2,'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2797) := ' p_flags       in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_flags apex_t_varchar2;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_flags := apex_';
wwv_flow_imp.g_varchar2_table(2798) := 'string.split( p_flags, '':'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    for i in 1 .. l_flags.count'||wwv_flow.LF||
'    loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      delete from blog';
wwv_flow_imp.g_varchar2_table(2799) := '_comment_flags'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and comment_id = p_comment_id'||wwv_flow.LF||
'        and flag = l_flags';
wwv_flow_imp.g_varchar2_table(2800) := '(i)'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      if sql%rowcount != 1'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug.warn( ''Removed %s %s flag';
wwv_flow_imp.g_varchar2_table(2801) := 's from comment id: %s'', sql%rowcount, l_flags(i), p_comment_id );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2802) := ''||wwv_flow.LF||
'  end unflag_comment;'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2803) := '----'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure ';
wwv_flow_imp.g_varchar2_table(2804) := 'new_comment_notify('||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_e';
wwv_flow_imp.g_varchar2_table(2805) := 'mail_template  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_post_id number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id   := to_numbe';
wwv_flow_imp.g_varchar2_table(2806) := 'r( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if application email address is not set, exit from procedure'||wwv_flow.LF||
'    if c_app';
wwv_flow_imp.g_varchar2_table(2807) := '_email is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_debug.warn( ''application email address is not set'' );'||wwv_flow.LF||
'      re';
wwv_flow_imp.g_varchar2_table(2808) := 'turn;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get values for APEX email template'||wwv_flow.LF||
'    -- send notify email if blog em';
wwv_flow_imp.g_varchar2_table(2809) := 'ail address is set'||wwv_flow.LF||
'    -- and blogger has set email'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        v1.blogg';
wwv_flow_imp.g_varchar2_table(2810) := 'er_email'||wwv_flow.LF||
'      , json_object('||wwv_flow.LF||
'          ''APP_NAME''      value p_app_name'||wwv_flow.LF||
'        , ''BLOGGER_NAME''';
wwv_flow_imp.g_varchar2_table(2811) := '  value v1.blogger_name'||wwv_flow.LF||
'        , ''POST_TITLE''    value v1.title'||wwv_flow.LF||
'        , ''POST_LINK''     value'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2812) := '            blog_url.get_post('||wwv_flow.LF||
'              p_post_id   => v1.id'||wwv_flow.LF||
'            , p_canonical => ''YE';
wwv_flow_imp.g_varchar2_table(2813) := 'S'''||wwv_flow.LF||
'            )'||wwv_flow.LF||
'        ) as placeholders'||wwv_flow.LF||
'      from blog_v_all_posts v1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2814) := '   and v1.id = l_post_id'||wwv_flow.LF||
'      and v1.blogger_email is not null'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.inf';
wwv_flow_imp.g_varchar2_table(2815) := 'o('||wwv_flow.LF||
'        ''Send email to: %s from: %s template: %s placeholders: %s'''||wwv_flow.LF||
'      , c1.blogger_email'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2816) := '    , c_app_email'||wwv_flow.LF||
'      , p_email_template'||wwv_flow.LF||
'      , c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      -- send notify';
wwv_flow_imp.g_varchar2_table(2817) := ' email'||wwv_flow.LF||
'      apex_mail.send('||wwv_flow.LF||
'        p_to                  => c1.blogger_email'||wwv_flow.LF||
'      , p_from    ';
wwv_flow_imp.g_varchar2_table(2818) := '            => c_app_email'||wwv_flow.LF||
'      , p_template_static_id  => p_email_template'||wwv_flow.LF||
'      , p_placeholder';
wwv_flow_imp.g_varchar2_table(2819) := 's        => c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end new_comment_notify;'||wwv_flow.LF||
'---------------';
wwv_flow_imp.g_varchar2_table(2820) := '-----------------------------------------------------------------'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(2821) := '-----------------------------------------------'||wwv_flow.LF||
'  procedure reply_notify('||wwv_flow.LF||
'    p_app_id          in';
wwv_flow_imp.g_varchar2_table(2822) := ' varchar2,'||wwv_flow.LF||
'    p_app_name        in varchar2,'||wwv_flow.LF||
'    p_post_id         in varchar2,'||wwv_flow.LF||
'    p_email_temp';
wwv_flow_imp.g_varchar2_table(2823) := 'late  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_watch_end     date;'||wwv_flow.LF||
'    l_post_id       number;'||wwv_flow.LF||
'    l_watch_mo';
wwv_flow_imp.g_varchar2_table(2824) := 'nths  number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if application email ad';
wwv_flow_imp.g_varchar2_table(2825) := 'dress is not set, exit from procedure'||wwv_flow.LF||
'    if c_app_email is null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_debug.warn( ';
wwv_flow_imp.g_varchar2_table(2826) := '''application email address is not set'' );'||wwv_flow.LF||
'      return;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- fetch comment watch ';
wwv_flow_imp.g_varchar2_table(2827) := 'expires'||wwv_flow.LF||
'    l_watch_months := to_number('||wwv_flow.LF||
'        blog_util.get_attribute_value( ''G_COMMENT_WATCH_M';
wwv_flow_imp.g_varchar2_table(2828) := 'ONTHS'' )'||wwv_flow.LF||
'      ) * -1'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    l_watch_end := add_months( trunc( sysdate ), l_watch_months );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2829) := ''||wwv_flow.LF||
'    -- send notify users that have subscribed to replies to comment'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select t';
wwv_flow_imp.g_varchar2_table(2830) := '2.email'||wwv_flow.LF||
'      ,json_object('||wwv_flow.LF||
'         ''APP_NAME''         value p_app_name'||wwv_flow.LF||
'        ,''POST_TITLE''   ';
wwv_flow_imp.g_varchar2_table(2831) := '    value v1.title'||wwv_flow.LF||
'        ,''POST_LINK''        value'||wwv_flow.LF||
'            blog_url.get_post('||wwv_flow.LF||
'             ';
wwv_flow_imp.g_varchar2_table(2832) := ' p_application => p_app_id'||wwv_flow.LF||
'            , p_post_id     => p_post_id'||wwv_flow.LF||
'            , p_canonical   =>';
wwv_flow_imp.g_varchar2_table(2833) := ' ''YES'''||wwv_flow.LF||
'            )'||wwv_flow.LF||
'        ,''UNSUBSCRIBE_LINK'' value'||wwv_flow.LF||
'            blog_url.get_unsubscribe('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2834) := '           p_application     => p_app_id'||wwv_flow.LF||
'            , p_post_id         => p_post_id'||wwv_flow.LF||
'            ';
wwv_flow_imp.g_varchar2_table(2835) := ', p_subscription_id => t1.id'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'       ) as placeholders'||wwv_flow.LF||
'      from blog_comment_subsc';
wwv_flow_imp.g_varchar2_table(2836) := 'ribers t1'||wwv_flow.LF||
'      join blog_subscribers_email t2'||wwv_flow.LF||
'        on t1.email_id = t2.id'||wwv_flow.LF||
'      join blog_v_a';
wwv_flow_imp.g_varchar2_table(2837) := 'll_posts v1'||wwv_flow.LF||
'        on t1.post_id = v1.id'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and t1.is_active'||wwv_flow.LF||
'          *';
wwv_flow_imp.g_varchar2_table(2838) := ' t2.is_active'||wwv_flow.LF||
'          * case v1.post_status_code when ''PUBLISHED'' then 1 else 0 end'||wwv_flow.LF||
'          = ';
wwv_flow_imp.g_varchar2_table(2839) := '1'||wwv_flow.LF||
'        and v1.id = l_post_id'||wwv_flow.LF||
'        -- send notification if subscription is created less than ';
wwv_flow_imp.g_varchar2_table(2840) := 'months ago specified in settings'||wwv_flow.LF||
'        and t1.subscription_date > l_watch_end'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2841) := '  apex_debug.info('||wwv_flow.LF||
'        ''Send email to: %s from: %s template: %s placeholders: %s'''||wwv_flow.LF||
'      , c1.e';
wwv_flow_imp.g_varchar2_table(2842) := 'mail'||wwv_flow.LF||
'      , c_app_email'||wwv_flow.LF||
'      , p_email_template'||wwv_flow.LF||
'      , c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      -- sen';
wwv_flow_imp.g_varchar2_table(2843) := 'd notify email'||wwv_flow.LF||
'      apex_mail.send('||wwv_flow.LF||
'        p_from => c_app_email'||wwv_flow.LF||
'      , p_to => c1.email'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(2844) := '  , p_template_static_id => p_email_template'||wwv_flow.LF||
'      , p_placeholders => c1.placeholders'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2845) := ''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end reply_notify;'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2846) := '-------------------'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2847) := '-'||wwv_flow.LF||
'  procedure subscribe('||wwv_flow.LF||
'    p_post_id in varchar2,'||wwv_flow.LF||
'    p_email   in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_e';
wwv_flow_imp.g_varchar2_table(2848) := 'mail     varchar2(256);'||wwv_flow.LF||
'    l_post_id   number;'||wwv_flow.LF||
'    l_email_id  number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_email   ';
wwv_flow_imp.g_varchar2_table(2849) := ':= trim( lower( p_email ) );'||wwv_flow.LF||
'    l_post_id := to_number( p_post_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- subscribe user to g';
wwv_flow_imp.g_varchar2_table(2850) := 'et notify on reply to comment'||wwv_flow.LF||
'    if p_email is not null'||wwv_flow.LF||
'    and p_post_id is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2851) := '      -- check if email address already exists and fetch id'||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        select id'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2852) := ' into l_email_id'||wwv_flow.LF||
'        from blog_subscribers_email'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and email = l_';
wwv_flow_imp.g_varchar2_table(2853) := 'email'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      -- if email address not exists, insert and return id'||wwv_flow.LF||
'      exception when n';
wwv_flow_imp.g_varchar2_table(2854) := 'o_data_found'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        insert into'||wwv_flow.LF||
'            blog_subscribers_email( email, is_active ';
wwv_flow_imp.g_varchar2_table(2855) := ')'||wwv_flow.LF||
'        values'||wwv_flow.LF||
'          ( l_email, 1 )'||wwv_flow.LF||
'        returning id into l_email_id'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2856) := 'end;'||wwv_flow.LF||
'      -- insert post to email relation'||wwv_flow.LF||
'      begin'||wwv_flow.LF||
'        insert into'||wwv_flow.LF||
'          blog_comme';
wwv_flow_imp.g_varchar2_table(2857) := 'nt_subscribers( post_id, email_id, subscription_date, is_active )'||wwv_flow.LF||
'        values'||wwv_flow.LF||
'          ( p_pos';
wwv_flow_imp.g_varchar2_table(2858) := 't_id, l_email_id, trunc( sysdate ), 1 )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      -- if subscription already exists update s';
wwv_flow_imp.g_varchar2_table(2859) := 'ubscription'||wwv_flow.LF||
'      exception when dup_val_on_index'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        update blog_comment_subscrib';
wwv_flow_imp.g_varchar2_table(2860) := 'ers'||wwv_flow.LF||
'          set subscription_date = trunc( sysdate )'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and is_activ';
wwv_flow_imp.g_varchar2_table(2861) := 'e = 1'||wwv_flow.LF||
'          and post_id = p_post_id'||wwv_flow.LF||
'          and email_id = l_email_id'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
'      end;';
wwv_flow_imp.g_varchar2_table(2862) := ''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end subscribe;'||wwv_flow.LF||
'-----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2863) := '---------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2864) := ' procedure unsubscribe('||wwv_flow.LF||
'    p_subscription_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- remove user s';
wwv_flow_imp.g_varchar2_table(2865) := 'ubscribtion to get notify from replies'||wwv_flow.LF||
'    delete'||wwv_flow.LF||
'      from blog_comment_subscribers'||wwv_flow.LF||
'    where 1';
wwv_flow_imp.g_varchar2_table(2866) := ' = 1'||wwv_flow.LF||
'      and id = p_subscription_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'  end unsubscribe;'||wwv_flow.LF||
'---------------------------------';
wwv_flow_imp.g_varchar2_table(2867) := '-----------------------------------------------'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2868) := '-----------------------------'||wwv_flow.LF||
'  procedure auto_approve('||wwv_flow.LF||
'    p_comment_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2869) := '   l_cnt number;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Automaticallu approve comment id %s if sentiment ';
wwv_flow_imp.g_varchar2_table(2870) := 'is Positive'', p_comment_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check that comment exists'||wwv_flow.LF||
'    select 1'||wwv_flow.LF||
'    into l_cnt'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2871) := ' from blog_comment_sentiments t1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and t1.comment_id = p_comment_id'||wwv_flow.LF||
'      and';
wwv_flow_imp.g_varchar2_table(2872) := ' t1.sentiment_json.documentSentiment = ''Positive'''||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- remove MODERATE flag'||wwv_flow.LF||
'    unflag_';
wwv_flow_imp.g_varchar2_table(2873) := 'comment('||wwv_flow.LF||
'      p_comment_id  => p_comment_id'||wwv_flow.LF||
'    , p_flags       => ''MODERATE'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- s';
wwv_flow_imp.g_varchar2_table(2874) := 'et comment active'||wwv_flow.LF||
'    update blog_comments'||wwv_flow.LF||
'      set is_active = 1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and id ';
wwv_flow_imp.g_varchar2_table(2875) := '= p_comment_id'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  exception when no_data_found'||wwv_flow.LF||
'  then'||wwv_flow.LF||
'    apex_debug.warn( ''Comment id %s';
wwv_flow_imp.g_varchar2_table(2876) := ' not found for automatic approve'', p_comment_id );'||wwv_flow.LF||
'  end auto_approve;'||wwv_flow.LF||
'---------------------------';
wwv_flow_imp.g_varchar2_table(2877) := '-----------------------------------------------------'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(2878) := '-----------------------------------'||wwv_flow.LF||
'end "BLOG_COMMENT";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_HT';
wwv_flow_imp.g_varchar2_table(2879) := 'ML"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(2880) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- Private constants and va';
wwv_flow_imp.g_varchar2_table(2881) := 'riables'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(2882) := '-----------------------------------------------------------------------'||wwv_flow.LF||
''||wwv_flow.LF||
'  c_link_canonical_templa';
wwv_flow_imp.g_varchar2_table(2883) := 'te constant varchar2(64) := ''<link rel="canonical" href="%s">'';'||wwv_flow.LF||
'  c_link_alternate_template constan';
wwv_flow_imp.g_varchar2_table(2884) := 't varchar2(64) := ''<link rel="alternate" href="%s" title="%s &raquo; %s" type="%s">'';'||wwv_flow.LF||
''||wwv_flow.LF||
'  g_link_ca';
wwv_flow_imp.g_varchar2_table(2885) := 'nonical varchar2(1024);'||wwv_flow.LF||
''||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2886) := '-------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Privat';
wwv_flow_imp.g_varchar2_table(2887) := 'e procedures and functions'||wwv_flow.LF||
'------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2888) := '--------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- none';
wwv_flow_imp.g_varchar2_table(2889) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(2890) := '---------------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and procedures';
wwv_flow_imp.g_varchar2_table(2891) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(2892) := '---------------------------------------------------------------'||wwv_flow.LF||
'  function get_robots_noindex_meta';
wwv_flow_imp.g_varchar2_table(2893) := ''||wwv_flow.LF||
'  return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return ''<meta name="robots" value="noindex">'';'||wwv_flow.LF||
'  end get_rob';
wwv_flow_imp.g_varchar2_table(2894) := 'ots_noindex_meta;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2895) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function set_ta';
wwv_flow_imp.g_varchar2_table(2896) := 'b_canonical_link('||wwv_flow.LF||
'    p_page  in varchar2,'||wwv_flow.LF||
'    p_url   out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2897) := ' as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- generate canonical link for tab'||wwv_flow.LF||
'    if p_page is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      p_u';
wwv_flow_imp.g_varchar2_table(2898) := 'rl :='||wwv_flow.LF||
'        blog_url.get_tab('||wwv_flow.LF||
'          p_page       => p_page'||wwv_flow.LF||
'        , p_canonical  => ''YES''';
wwv_flow_imp.g_varchar2_table(2899) := ''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_message => ';
wwv_flow_imp.g_varchar2_table(2900) := 'c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      -- if p_page i';
wwv_flow_imp.g_varchar2_table(2901) := 's not defined'||wwv_flow.LF||
'      apex_debug.warn( ''Canonical link tag not generated for tab.'' );'||wwv_flow.LF||
'      g_link_c';
wwv_flow_imp.g_varchar2_table(2902) := 'anonical := get_robots_noindex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_tab_c';
wwv_flow_imp.g_varchar2_table(2903) := 'anonical_link;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--';
wwv_flow_imp.g_varchar2_table(2904) := '------------------------------------------------------------------------------'||wwv_flow.LF||
'  function set_post_';
wwv_flow_imp.g_varchar2_table(2905) := 'canonical_link('||wwv_flow.LF||
'    p_post_id in varchar2,'||wwv_flow.LF||
'    p_url     out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2';
wwv_flow_imp.g_varchar2_table(2906) := ''||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- generate canonical link for post'||wwv_flow.LF||
'    if p_post_id is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2907) := '   p_url :='||wwv_flow.LF||
'        blog_url.get_post('||wwv_flow.LF||
'          p_post_id      => p_post_id'||wwv_flow.LF||
'        , p_canonica';
wwv_flow_imp.g_varchar2_table(2908) := 'l    => ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(2909) := ' p_message => c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2910) := 'apex_debug.warn( ''Canonical link tag not generated for post.'' );'||wwv_flow.LF||
'      g_link_canonical := get_robo';
wwv_flow_imp.g_varchar2_table(2911) := 'ts_noindex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_post_canonical_link;'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(2912) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(2913) := '-----------------------------------------------------------'||wwv_flow.LF||
'  function set_category_canonical_link(';
wwv_flow_imp.g_varchar2_table(2914) := ''||wwv_flow.LF||
'    p_category_id in varchar2,'||wwv_flow.LF||
'    p_url         out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2915) := '  begin'||wwv_flow.LF||
'    -- generate canonical link for category'||wwv_flow.LF||
'    if p_category_id is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2916) := '    p_url :='||wwv_flow.LF||
'        blog_url.get_category('||wwv_flow.LF||
'          p_category_id  => p_category_id'||wwv_flow.LF||
'        , p';
wwv_flow_imp.g_varchar2_table(2917) := '_canonical    => ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2918) := '          p_message => c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    els';
wwv_flow_imp.g_varchar2_table(2919) := 'e'||wwv_flow.LF||
'      apex_debug.warn( ''Canonical link tag not generated for category.'' );'||wwv_flow.LF||
'      g_link_canonica';
wwv_flow_imp.g_varchar2_table(2920) := 'l := get_robots_noindex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_category_can';
wwv_flow_imp.g_varchar2_table(2921) := 'onical_link;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(2922) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'  function set_archive';
wwv_flow_imp.g_varchar2_table(2923) := '_canonical_link('||wwv_flow.LF||
'    p_archive_id in varchar2,'||wwv_flow.LF||
'    p_url        out nocopy varchar2'||wwv_flow.LF||
'  ) return va';
wwv_flow_imp.g_varchar2_table(2924) := 'rchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'      -- generate canonical link for archives'||wwv_flow.LF||
'    if p_archive_id is not nul';
wwv_flow_imp.g_varchar2_table(2925) := 'l'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      p_url :='||wwv_flow.LF||
'        blog_url.get_archive('||wwv_flow.LF||
'          p_archive_id => p_archive_id'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2926) := '        , p_canonical  => ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'        apex_string.';
wwv_flow_imp.g_varchar2_table(2927) := 'format('||wwv_flow.LF||
'          p_message => c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;';
wwv_flow_imp.g_varchar2_table(2928) := ''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_debug.warn( ''Canonical link tag not generated for archive.'' );'||wwv_flow.LF||
'      g_link_';
wwv_flow_imp.g_varchar2_table(2929) := 'canonical := get_robots_noindex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_arch';
wwv_flow_imp.g_varchar2_table(2930) := 'ive_canonical_link;'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2931) := '-'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function set_';
wwv_flow_imp.g_varchar2_table(2932) := 'tag_canonical_link('||wwv_flow.LF||
'    p_tag_id in varchar2,'||wwv_flow.LF||
'    p_url    out nocopy varchar2'||wwv_flow.LF||
'  ) return varchar';
wwv_flow_imp.g_varchar2_table(2933) := '2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    -- generate canonical link for tags'||wwv_flow.LF||
'    if p_tag_id is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2934) := '    p_url :='||wwv_flow.LF||
'        blog_url.get_tag('||wwv_flow.LF||
'          p_tag_id     => p_tag_id'||wwv_flow.LF||
'        , p_canonical  ';
wwv_flow_imp.g_varchar2_table(2935) := '=> ''YES'''||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'      g_link_canonical :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_me';
wwv_flow_imp.g_varchar2_table(2936) := 'ssage => c_link_canonical_template'||wwv_flow.LF||
'        , p0 => p_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      apex_';
wwv_flow_imp.g_varchar2_table(2937) := 'debug.warn( ''Canonical link tag not generated for tag.'' );'||wwv_flow.LF||
'      g_link_canonical := get_robots_noi';
wwv_flow_imp.g_varchar2_table(2938) := 'ndex_meta;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    return g_link_canonical;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_tag_canonical_link;'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(2939) := '----------------------------------------------------------------------'||wwv_flow.LF||
'----------------------------';
wwv_flow_imp.g_varchar2_table(2940) := '----------------------------------------------------'||wwv_flow.LF||
'  function get_rss_anchor('||wwv_flow.LF||
'    p_app_name  in';
wwv_flow_imp.g_varchar2_table(2941) := ' varchar2,'||wwv_flow.LF||
'    p_message   in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_rss_url     varchar2(4000)';
wwv_flow_imp.g_varchar2_table(2942) := ';'||wwv_flow.LF||
'    l_rss_anchor  varchar2(4000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get rss url'||wwv_flow.LF||
'    l_rss_url :=  blog_url.get_';
wwv_flow_imp.g_varchar2_table(2943) := 'rss;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- generate RSS anchor'||wwv_flow.LF||
'    l_rss_anchor :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_messag';
wwv_flow_imp.g_varchar2_table(2944) := 'e =>'||wwv_flow.LF||
'          ''<a href="%s" aria-label="%s &raquo; %s" rel="alternate" type="%s" class="%s">'''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2945) := '       || ''<span aria-hidden="true" class="%s"></span>'''||wwv_flow.LF||
'          || ''</a>'''||wwv_flow.LF||
'      , p0 => l_rss_ur';
wwv_flow_imp.g_varchar2_table(2946) := 'l'||wwv_flow.LF||
'      , p1 => p_app_name'||wwv_flow.LF||
'      , p2 => p_message'||wwv_flow.LF||
'      , p3 => blog_util.g_mime_rss'||wwv_flow.LF||
'      , p4';
wwv_flow_imp.g_varchar2_table(2947) := ' => ''t-Button t-Button--noLabel t-Button--icon t-Button--link'''||wwv_flow.LF||
'      , p5 => ''fa fa-rss-square fa-3';
wwv_flow_imp.g_varchar2_table(2948) := 'x fa-lg u-color-8-text'''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'    -- return generated HTML'||wwv_flow.LF||
'    return l_rss_anchor;'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2949) := ' end get_rss_anchor;'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2950) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  function get';
wwv_flow_imp.g_varchar2_table(2951) := '_rss_link('||wwv_flow.LF||
'    p_app_id        in varchar2,'||wwv_flow.LF||
'    p_app_name      in varchar2,'||wwv_flow.LF||
'    p_message       ';
wwv_flow_imp.g_varchar2_table(2952) := 'in varchar2,'||wwv_flow.LF||
'    p_build_option  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_app_id    number;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2953) := '   l_rss_url   varchar2(256);'||wwv_flow.LF||
'    l_rss_link  varchar2(2000);'||wwv_flow.LF||
'    --l_rss_title varchar2(4000);'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2954) := ' begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check build option should HTML generated';
wwv_flow_imp.g_varchar2_table(2955) := ''||wwv_flow.LF||
'    if'||wwv_flow.LF||
'      apex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_application_id    => l_app';
wwv_flow_imp.g_varchar2_table(2956) := '_id'||wwv_flow.LF||
'      , p_build_option_name => p_build_option'||wwv_flow.LF||
'      ) = apex_application_admin.c_build_option_';
wwv_flow_imp.g_varchar2_table(2957) := 'status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- get rss url'||wwv_flow.LF||
'      l_rss_url := blog_url.get_rss;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- gen';
wwv_flow_imp.g_varchar2_table(2958) := 'erate HTML'||wwv_flow.LF||
'      l_rss_link :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_message => c_link_alternat';
wwv_flow_imp.g_varchar2_table(2959) := 'e_template'||wwv_flow.LF||
'        , p0 => l_rss_url'||wwv_flow.LF||
'        , p1 => p_app_name'||wwv_flow.LF||
'        , p2 => p_message'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(2960) := '  , p3 => blog_util.g_mime_rss'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- return generated HTML'||wwv_flow.LF||
'    r';
wwv_flow_imp.g_varchar2_table(2961) := 'eturn l_rss_link;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_rss_link;'||wwv_flow.LF||
'----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2962) := '----------------------'||wwv_flow.LF||
'----------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2963) := '----'||wwv_flow.LF||
'  function get_atom_link('||wwv_flow.LF||
'    p_app_id        in varchar2,'||wwv_flow.LF||
'    p_app_name      in varchar2,';
wwv_flow_imp.g_varchar2_table(2964) := ''||wwv_flow.LF||
'    p_message       in varchar2,'||wwv_flow.LF||
'    p_build_option  in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l';
wwv_flow_imp.g_varchar2_table(2965) := '_app_id      number;'||wwv_flow.LF||
'    l_atom_url    varchar2(256);'||wwv_flow.LF||
'    l_atom_link   varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2966) := ''||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check build option should HTML generated'||wwv_flow.LF||
'    if';
wwv_flow_imp.g_varchar2_table(2967) := ''||wwv_flow.LF||
'      apex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_application_id    => l_app_id'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2968) := '   , p_build_option_name => p_build_option'||wwv_flow.LF||
'      ) = apex_application_admin.c_build_option_status_i';
wwv_flow_imp.g_varchar2_table(2969) := 'nclude'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- get atom url'||wwv_flow.LF||
'      l_atom_url := blog_url.get_atom;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- generate';
wwv_flow_imp.g_varchar2_table(2970) := ' HTML'||wwv_flow.LF||
'      l_atom_link :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_message => c_link_alternate_te';
wwv_flow_imp.g_varchar2_table(2971) := 'mplate'||wwv_flow.LF||
'        , p0 => l_atom_url'||wwv_flow.LF||
'        , p1 => p_app_name'||wwv_flow.LF||
'        , p2 => p_message'||wwv_flow.LF||
'        ,';
wwv_flow_imp.g_varchar2_table(2972) := ' p3 => blog_util.g_mime_atom'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- return generated HTML'||wwv_flow.LF||
'    r';
wwv_flow_imp.g_varchar2_table(2973) := 'eturn l_atom_link;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_atom_link;'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2974) := '------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2975) := '------'||wwv_flow.LF||
'  function get_button('||wwv_flow.LF||
'    p_app_id          in varchar2,'||wwv_flow.LF||
'    p_title           in varchar';
wwv_flow_imp.g_varchar2_table(2976) := '2,'||wwv_flow.LF||
'    p_action          in varchar2,'||wwv_flow.LF||
'    p_icon_classes    in varchar2,'||wwv_flow.LF||
'    p_button_classes  in';
wwv_flow_imp.g_varchar2_table(2977) := ' varchar2 default null,'||wwv_flow.LF||
'    p_build_option    in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(2978) := '    l_app_id  number;'||wwv_flow.LF||
'    l_button  varchar2(32700) := ''<span class="blog-hidden"></span>'';'||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(2979) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_app_id := to_number( p_app_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check build option should button generated'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2980) := '  if p_build_option is null or'||wwv_flow.LF||
'      apex_application_admin.get_build_option_status('||wwv_flow.LF||
'        p_app';
wwv_flow_imp.g_varchar2_table(2981) := 'lication_id    => l_app_id'||wwv_flow.LF||
'      , p_build_option_name => p_build_option'||wwv_flow.LF||
'      ) = apex_applicatio';
wwv_flow_imp.g_varchar2_table(2982) := 'n_admin.c_build_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- generate button HTML'||wwv_flow.LF||
'      l_button :='||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(2983) := '       apex_string.format('||wwv_flow.LF||
'          p_message =>'||wwv_flow.LF||
'            ''<button type="button" data-action="';
wwv_flow_imp.g_varchar2_table(2984) := '%0" title="%1" aria-label="%1" class="%2" data-no-update="true">'' ||'||wwv_flow.LF||
'            ''<span class="t-Ic';
wwv_flow_imp.g_varchar2_table(2985) := 'on fa %3" aria-hidden="true"></span>'' ||'||wwv_flow.LF||
'            ''</button>'''||wwv_flow.LF||
'        , p0 => p_action'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(2986) := ' , p1 => p_title'||wwv_flow.LF||
'        , p2 => coalesce( p_button_classes, ''t-Button t-Button--noLabel t-Button--';
wwv_flow_imp.g_varchar2_table(2987) := 'icon t-Button--link'' )'||wwv_flow.LF||
'        , p3 => p_icon_classes'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    retur';
wwv_flow_imp.g_varchar2_table(2988) := 'n l_button;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_button;'||wwv_flow.LF||
'------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2989) := '--------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(2990) := 'procedure prn_html('||wwv_flow.LF||
'    p_markdown in apex_application_global.vc_arr2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_response cl';
wwv_flow_imp.g_varchar2_table(2991) := 'ob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response := apex_string.table_to_clob('||wwv_flow.LF||
'      p_table => p_markdown'||wwv_flow.LF||
'    , p_s';
wwv_flow_imp.g_varchar2_table(2992) := 'ep   => null'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response := apex_markdown.to_html('||wwv_flow.LF||
'      p_markdown              => l';
wwv_flow_imp.g_varchar2_table(2993) := '_response'||wwv_flow.LF||
'    , p_softbreak             => apex_application.lf'||wwv_flow.LF||
'    , p_embedded_html_mode    => ap';
wwv_flow_imp.g_varchar2_table(2994) := 'ex_markdown.c_embedded_html_escape'||wwv_flow.LF||
'    , p_extra_link_attributes => apex_t_varchar2( ''target'', ''_bl';
wwv_flow_imp.g_varchar2_table(2995) := 'ank'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_util.prn('||wwv_flow.LF||
'      p_clob    => l_response'||wwv_flow.LF||
'    , p_escape  => false'||wwv_flow.LF||
'    )';
wwv_flow_imp.g_varchar2_table(2996) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'  end prn_html;'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(2997) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_HTML';
wwv_flow_imp.g_varchar2_table(2998) := '";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_OCI_OS"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(2999) := '-------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3000) := '-------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'-------------------------------------------';
null;
end;
/
begin
wwv_flow_imp.g_varchar2_table(3001) := '-------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3002) := '-------------------'||wwv_flow.LF||
''||wwv_flow.LF||
'  type str_t is table of varchar2( 2000 ) index by varchar2( 60 );'||wwv_flow.LF||
''||wwv_flow.LF||
'-- vari';
wwv_flow_imp.g_varchar2_table(3003) := 'ables'||wwv_flow.LF||
'  param_t           str_t;'||wwv_flow.LF||
'  response_heade_t  str_t;'||wwv_flow.LF||
''||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(3004) := '---------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3005) := '---------------------------'||wwv_flow.LF||
'-- Private procedures and functions'||wwv_flow.LF||
'----------------------------------';
wwv_flow_imp.g_varchar2_table(3006) := '----------------------------------------------'||wwv_flow.LF||
'----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3007) := '----------------------------'||wwv_flow.LF||
'  procedure init_params'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set valus for session';
wwv_flow_imp.g_varchar2_table(3008) := ''||wwv_flow.LF||
'    param_t( ''build_option_name'' ) := ''BLOG_FEATURE_OCI_OBJECT_STORAGE'';'||wwv_flow.LF||
'    param_t( ''module_sta';
wwv_flow_imp.g_varchar2_table(3009) := 'tic_id'' ) := ''BLOG_OBJECT_STORAGE_OBJECT'';'||wwv_flow.LF||
'    param_t( ''remote_server_static_id'' ) := ''BLOG_OBJECT';
wwv_flow_imp.g_varchar2_table(3010) := '_STORAGE'';'||wwv_flow.LF||
'    param_t( ''bucket_param_name'' ) := ''G_OCI_OS_BUCKET'';'||wwv_flow.LF||
'    param_t( ''namespace_param_';
wwv_flow_imp.g_varchar2_table(3011) := 'name'' ) := ''G_OCI_OS_NAMESPACE'';'||wwv_flow.LF||
'    param_t( ''region_param_name'' ) := ''G_OCI_OS_REGION'';'||wwv_flow.LF||
'    para';
wwv_flow_imp.g_varchar2_table(3012) := 'm_t( ''bucket_url_param_name'' ) := ''G_OCI_OS_BUCKET_URL'';'||wwv_flow.LF||
'    param_t( ''bucket'' ) := blog_util.get_a';
wwv_flow_imp.g_varchar2_table(3013) := 'ttribute_value( param_t( ''bucket_param_name'' ) );'||wwv_flow.LF||
'    param_t( ''namespace'' ) := blog_util.get_attri';
wwv_flow_imp.g_varchar2_table(3014) := 'bute_value( param_t( ''namespace_param_name'' ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- query REST source module credential id an';
wwv_flow_imp.g_varchar2_table(3015) := 'd base url for session'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      t2.base_url'||wwv_flow.LF||
'    , t1.credential_static_id'||wwv_flow.LF||
'    into param';
wwv_flow_imp.g_varchar2_table(3016) := '_t( ''base_url'' ), param_t( ''credential'' )'||wwv_flow.LF||
'    from apex_appl_web_src_modules t1'||wwv_flow.LF||
'    join apex_work';
wwv_flow_imp.g_varchar2_table(3017) := 'space_remote_servers t2 on 1 = 1'||wwv_flow.LF||
'      and t1.remote_server_static_id = t2.remote_server_static_id';
wwv_flow_imp.g_varchar2_table(3018) := ''||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and t1.application_id = apex_application.g_flow_id'||wwv_flow.LF||
'      and t1.module_stat';
wwv_flow_imp.g_varchar2_table(3019) := 'ic_id = param_t( ''module_static_id'' )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Debug parameters'||wwv_flow.LF||
'    apex_debug.info( ''Objec';
wwv_flow_imp.g_varchar2_table(3020) := 't storage build option name: %s'', param_t( ''build_option_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object st';
wwv_flow_imp.g_varchar2_table(3021) := 'orage module static id: %s'', param_t( ''module_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage ';
wwv_flow_imp.g_varchar2_table(3022) := 'remote server static id: %s'', param_t( ''remote_server_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object ';
wwv_flow_imp.g_varchar2_table(3023) := 'storage bucket parameter name: %s'', param_t( ''bucket_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object ';
wwv_flow_imp.g_varchar2_table(3024) := 'storage namespace parameter name: %s'', param_t( ''namespace_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''O';
wwv_flow_imp.g_varchar2_table(3025) := 'bject storage region parameter name: %s'', param_t( ''region_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''O';
wwv_flow_imp.g_varchar2_table(3026) := 'bject storage bucket url parameter name: %s'', param_t( ''bucket_url_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.';
wwv_flow_imp.g_varchar2_table(3027) := 'info( ''Object storage bucket: %s'', param_t( ''bucket'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage name';
wwv_flow_imp.g_varchar2_table(3028) := 'space: %s'', param_t( ''namespace'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage base URL: %s'', param_t( ';
wwv_flow_imp.g_varchar2_table(3029) := '''base_url'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Object storage credential: %s'', param_t( ''credential'' ) );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3030) := ''||wwv_flow.LF||
'  end init_params;'||wwv_flow.LF||
'-------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3031) := '-'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure pro';
wwv_flow_imp.g_varchar2_table(3032) := 'cess_headers('||wwv_flow.LF||
'    p_is_error in boolean'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_resp_status_msg constant varchar2(256) :=';
wwv_flow_imp.g_varchar2_table(3033) := ' ''Request HTTP status: %s - %s'';'||wwv_flow.LF||
'    l_resp_header_msg constant varchar2(256) := ''Response header %';
wwv_flow_imp.g_varchar2_table(3034) := 's: %s'';'||wwv_flow.LF||
'    l_req_header_msg constant varchar2(256) := ''Request header %s: %s'';'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(3035) := 'debug request status'||wwv_flow.LF||
'    apex_debug.info( l_resp_status_msg, apex_web_service.g_status_code, apex_w';
wwv_flow_imp.g_varchar2_table(3036) := 'eb_service.g_reason_phrase );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if error debug request headers'||wwv_flow.LF||
'    if p_is_error'||wwv_flow.LF||
'    then';
wwv_flow_imp.g_varchar2_table(3037) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( l_resp_status_msg, apex_web_service.g_status_code, apex_web_service.g_rea';
wwv_flow_imp.g_varchar2_table(3038) := 'son_phrase );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- loop request headers'||wwv_flow.LF||
'      for i in 1 .. apex_web_service.g_request_heade';
wwv_flow_imp.g_varchar2_table(3039) := 'rs.count'||wwv_flow.LF||
'      loop'||wwv_flow.LF||
'        apex_debug.error( l_req_header_msg, apex_web_service.g_request_headers';
wwv_flow_imp.g_varchar2_table(3040) := '(i).name , apex_web_service.g_request_headers(i).value );'||wwv_flow.LF||
'      end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(3041) := 'loop response headers and store it array'||wwv_flow.LF||
'    for i in 1 .. apex_web_service.g_headers.count'||wwv_flow.LF||
'    lo';
wwv_flow_imp.g_varchar2_table(3042) := 'op'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_is_error'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug.error( l_resp_header_msg, apex_web_service';
wwv_flow_imp.g_varchar2_table(3043) := '.g_headers(i).name , apex_web_service.g_headers(i).value );'||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        apex_debug.info( l_';
wwv_flow_imp.g_varchar2_table(3044) := 'resp_header_msg, apex_web_service.g_headers(i).name , apex_web_service.g_headers(i).value );'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3045) := 'end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- save response header to array for getting value by header name'||wwv_flow.LF||
'      response_h';
wwv_flow_imp.g_varchar2_table(3046) := 'eade_t( lower( trim( apex_web_service.g_headers(i).name ) ) ) :='||wwv_flow.LF||
'        trim( apex_web_service.g_h';
wwv_flow_imp.g_varchar2_table(3047) := 'eaders(i).value )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end process_headers;'||wwv_flow.LF||
'-----------------------------';
wwv_flow_imp.g_varchar2_table(3048) := '---------------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------';
wwv_flow_imp.g_varchar2_table(3049) := '---------------------------------'||wwv_flow.LF||
'  function get_response_header('||wwv_flow.LF||
'    p_header in varchar2'||wwv_flow.LF||
'  ) re';
wwv_flow_imp.g_varchar2_table(3050) := 'turn varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_header varchar2(256);'||wwv_flow.LF||
'    l_result varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_head';
wwv_flow_imp.g_varchar2_table(3051) := 'er := trim( lower( p_header ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get header by name if it exists in array'||wwv_flow.LF||
'    if response';
wwv_flow_imp.g_varchar2_table(3052) := '_heade_t.exists( l_header )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_result := response_heade_t( l_header );'||wwv_flow.LF||
'    end if;';
wwv_flow_imp.g_varchar2_table(3053) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    return l_result;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_response_header;'||wwv_flow.LF||
'---------------------------------------------';
wwv_flow_imp.g_varchar2_table(3054) := '-----------------------------------'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3055) := '-----------------'||wwv_flow.LF||
'  procedure append_default_request_headers'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- append defaul';
wwv_flow_imp.g_varchar2_table(3056) := 't headers'||wwv_flow.LF||
'    apex_web_service.set_request_headers('||wwv_flow.LF||
'      p_reset     => false'||wwv_flow.LF||
'    , p_name_01   ';
wwv_flow_imp.g_varchar2_table(3057) := '=> ''User-Agent'''||wwv_flow.LF||
'    , p_value_01  => ''Oracle Application Express (gzip)'''||wwv_flow.LF||
'    , p_name_02   => ''Acc';
wwv_flow_imp.g_varchar2_table(3058) := 'ept-Encoding'''||wwv_flow.LF||
'    , p_value_02  => ''gzip, deflate'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- debug request headers'||wwv_flow.LF||
'    if ';
wwv_flow_imp.g_varchar2_table(3059) := 'apex_application.g_debug'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- debug request headers'||wwv_flow.LF||
'      for i in 1..apex_web_servi';
wwv_flow_imp.g_varchar2_table(3060) := 'ce.g_request_headers.count'||wwv_flow.LF||
'      loop'||wwv_flow.LF||
'         apex_debug.info('||wwv_flow.LF||
'          p_message => ''Set reque';
wwv_flow_imp.g_varchar2_table(3061) := 'st header %s value: %s'''||wwv_flow.LF||
'        , p0 => apex_web_service.g_request_headers(i).name'||wwv_flow.LF||
'        , p1 =>';
wwv_flow_imp.g_varchar2_table(3062) := ' apex_web_service.g_request_headers(i).value'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end ap';
wwv_flow_imp.g_varchar2_table(3063) := 'pend_default_request_headers;'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3064) := '-----------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  pro';
wwv_flow_imp.g_varchar2_table(3065) := 'cedure parse_error_json('||wwv_flow.LF||
'    p_response  in clob,'||wwv_flow.LF||
'    p_code      out nocopy varchar2,'||wwv_flow.LF||
'    p_mess';
wwv_flow_imp.g_varchar2_table(3066) := 'age   out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_top_obj json_element_t;'||wwv_flow.LF||
'    l_err_obj json_object_t;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3067) := ' begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error( ''Error response body: %s'', p_response );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- parse response to';
wwv_flow_imp.g_varchar2_table(3068) := ' json'||wwv_flow.LF||
'    if p_response is not null and p_response is json'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_top_obj := json_ele';
wwv_flow_imp.g_varchar2_table(3069) := 'ment_t.parse( p_response );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- if top level is object try get error code and error message';
wwv_flow_imp.g_varchar2_table(3070) := ''||wwv_flow.LF||
'      if ( l_top_obj.is_object )'||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_err_obj := treat( l_top_obj as json_objec';
wwv_flow_imp.g_varchar2_table(3071) := 't_t );'||wwv_flow.LF||
''||wwv_flow.LF||
'        p_code := l_err_obj.get_string( ''code'' );'||wwv_flow.LF||
'        p_message := l_err_obj.get_stri';
wwv_flow_imp.g_varchar2_table(3072) := 'ng( ''message'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Error code: %s, error mess';
wwv_flow_imp.g_varchar2_table(3073) := 'age: %s'', p_code, p_message );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end parse_error_json;'||wwv_flow.LF||
'-----------------------------------------';
wwv_flow_imp.g_varchar2_table(3074) := '---------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3075) := '---------------------'||wwv_flow.LF||
'  function prepare_object_url('||wwv_flow.LF||
'    p_file_path in varchar2'||wwv_flow.LF||
'  ) return varch';
wwv_flow_imp.g_varchar2_table(3076) := 'ar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url_endpoint varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Prepare object URL f';
wwv_flow_imp.g_varchar2_table(3077) := 'or file path: %s'', p_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepare URL for object store object'||wwv_flow.LF||
'    l_url_endpoint ';
wwv_flow_imp.g_varchar2_table(3078) := ':='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'        p_message => ''%s/n/%s/b/%s/o/%s'''||wwv_flow.LF||
'      -- remote server'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3079) := '   , p0 => rtrim( param_t( ''base_url'' ), ''/'' )'||wwv_flow.LF||
'      -- object storage namespace'||wwv_flow.LF||
'      , p1 => par';
wwv_flow_imp.g_varchar2_table(3080) := 'am_t( ''namespace'' )'||wwv_flow.LF||
'      -- bucket'||wwv_flow.LF||
'      , p2 => param_t( ''bucket'' )'||wwv_flow.LF||
'      -- object'||wwv_flow.LF||
'      -- d';
wwv_flow_imp.g_varchar2_table(3081) := 'ir + file'||wwv_flow.LF||
'      , p3 => p_file_path'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Returning object URL: ';
wwv_flow_imp.g_varchar2_table(3082) := '%s'', l_url_endpoint );'||wwv_flow.LF||
'    -- return URL'||wwv_flow.LF||
'    return l_url_endpoint;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end prepare_object_url;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3083) := '--------------------------------------------------------------------------------'||wwv_flow.LF||
'------------------';
wwv_flow_imp.g_varchar2_table(3084) := '--------------------------------------------------------------'||wwv_flow.LF||
'  procedure upload_to_bucket('||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(3085) := '_file_name         in varchar2,'||wwv_flow.LF||
'    p_dir               in varchar2,'||wwv_flow.LF||
'    p_mime_type         in va';
wwv_flow_imp.g_varchar2_table(3086) := 'rchar2,'||wwv_flow.LF||
'    p_file_size         in pls_integer,'||wwv_flow.LF||
'    p_cache_control     in varchar2,'||wwv_flow.LF||
'    p_overwr';
wwv_flow_imp.g_varchar2_table(3087) := 'ite_file    in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_blob_content      in blob,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3088) := '  p_client_request_id in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_etag          varchar2(2000);'||wwv_flow.LF||
'    l_md5        ';
wwv_flow_imp.g_varchar2_table(3089) := '   varchar2(2000);'||wwv_flow.LF||
'    l_file_path     varchar2(2000);'||wwv_flow.LF||
'    l_file_desc     varchar2(32700);'||wwv_flow.LF||
'    l';
wwv_flow_imp.g_varchar2_table(3090) := '_error_code    varchar2(2000);'||wwv_flow.LF||
'    l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'    l_url_endpoint  varchar2(20';
wwv_flow_imp.g_varchar2_table(3091) := '00);'||wwv_flow.LF||
'    l_response_body clob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''File name to upload: %s'', p_file_n';
wwv_flow_imp.g_varchar2_table(3092) := 'ame );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- format file path'||wwv_flow.LF||
'    l_file_path := blog_file.format_file_path( p_file_name, p_dir';
wwv_flow_imp.g_varchar2_table(3093) := ' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepare request URL'||wwv_flow.LF||
'    l_url_endpoint := prepare_object_url( l_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    a';
wwv_flow_imp.g_varchar2_table(3094) := 'pex_debug.info( ''Request URL: %s'', l_url_endpoint );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set request headers for request'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3095) := 'apex_web_service.set_request_headers('||wwv_flow.LF||
'      p_reset     => true'||wwv_flow.LF||
'    , p_name_01   => ''Content-Type';
wwv_flow_imp.g_varchar2_table(3096) := ''''||wwv_flow.LF||
'    , p_value_01  => p_mime_type'||wwv_flow.LF||
'    , p_name_02   => case when p_mime_type = blog_mime.g_defaul';
wwv_flow_imp.g_varchar2_table(3097) := 't_mime then ''Content-Length'' end'||wwv_flow.LF||
'    , p_value_02  => case when p_mime_type = blog_mime.g_default_m';
wwv_flow_imp.g_varchar2_table(3098) := 'ime then p_file_size end'||wwv_flow.LF||
'    , p_name_03   => case when p_overwrite_file = ''N'' then ''if-none-match''';
wwv_flow_imp.g_varchar2_table(3099) := ' end'||wwv_flow.LF||
'    , p_value_03  => case when p_overwrite_file = ''N'' then ''*'' end'||wwv_flow.LF||
'    , p_name_04   => case ';
wwv_flow_imp.g_varchar2_table(3100) := 'when p_cache_control is not null then ''Cache-Control'' end'||wwv_flow.LF||
'    , p_value_04  => p_cache_control'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3101) := ' , p_name_05   => case when p_client_request_id is not null then ''opc-client-request-id'' end'||wwv_flow.LF||
'    , ';
wwv_flow_imp.g_varchar2_table(3102) := 'p_value_05  => p_client_request_id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- append default request headers'||wwv_flow.LF||
'    append_defaul';
wwv_flow_imp.g_varchar2_table(3103) := 't_request_headers;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- make request to put file to object storage'||wwv_flow.LF||
'    l_response_body :='||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3104) := '   apex_web_service.make_rest_request('||wwv_flow.LF||
'        p_url                   => l_url_endpoint'||wwv_flow.LF||
'      , p';
wwv_flow_imp.g_varchar2_table(3105) := '_http_method           => ''PUT'''||wwv_flow.LF||
'      , p_body_blob             => p_blob_content'||wwv_flow.LF||
'      , p_creden';
wwv_flow_imp.g_varchar2_table(3106) := 'tial_static_id  => param_t( ''credential'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'    -';
wwv_flow_imp.g_varchar2_table(3107) := '- debug request headers if error'||wwv_flow.LF||
'    process_headers('||wwv_flow.LF||
'      p_is_error => not apex_web_service.g_s';
wwv_flow_imp.g_varchar2_table(3108) := 'tatus_code in( 200, 412 )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- handle request status'||wwv_flow.LF||
'    case apex_web_service.g_statu';
wwv_flow_imp.g_varchar2_table(3109) := 's_code'||wwv_flow.LF||
'    when 200 then'||wwv_flow.LF||
'    -- if HTTP 200 request succeeded'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_etag  := get_response_hea';
wwv_flow_imp.g_varchar2_table(3110) := 'der( ''etag'' );'||wwv_flow.LF||
'      l_md5   := get_response_header( ''opc-content-md5'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- insert file i';
wwv_flow_imp.g_varchar2_table(3111) := 'nfo to blog_files'||wwv_flow.LF||
'      merge into blog_files t1'||wwv_flow.LF||
'      using dual on ( t1.file_path = l_file_path ';
wwv_flow_imp.g_varchar2_table(3112) := ')'||wwv_flow.LF||
'      when not matched then'||wwv_flow.LF||
'        insert( file_path, file_size, mime_type, etag, md5 )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3113) := '    values( l_file_path, p_file_size, p_mime_type, l_etag, l_md5 )'||wwv_flow.LF||
'      when matched then'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(3114) := ' update set'||wwv_flow.LF||
'          file_size     = p_file_size'||wwv_flow.LF||
'        , mime_type     = p_mime_type'||wwv_flow.LF||
'        ,';
wwv_flow_imp.g_varchar2_table(3115) := ' etag          = l_etag'||wwv_flow.LF||
'        , md5           = l_md5'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    when 412 then'||wwv_flow.LF||
'    -- if HT';
wwv_flow_imp.g_varchar2_table(3116) := 'TP 412 file already exists'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- create collection for storing file temporaly'||wwv_flow.LF||
'      -- we pro';
wwv_flow_imp.g_varchar2_table(3117) := 'mpt user to confirm file overwrite'||wwv_flow.LF||
'      -- and show file information e.g. name and possible descri';
wwv_flow_imp.g_varchar2_table(3118) := 'ption from collection'||wwv_flow.LF||
'      -- then if user confirms, we can overwrite file using data stored in co';
wwv_flow_imp.g_varchar2_table(3119) := 'llection'||wwv_flow.LF||
'      if not apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        a';
wwv_flow_imp.g_varchar2_table(3120) := 'pex_collection.create_collection( p_collection_name );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- fetch file descrip';
wwv_flow_imp.g_varchar2_table(3121) := 'tion from database'||wwv_flow.LF||
'      l_file_desc := blog_file.get_file_desc( l_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug';
wwv_flow_imp.g_varchar2_table(3122) := '.info('||wwv_flow.LF||
'        p_message => ''File exists: %s, desc: %s, mime: %s, size: %s'''||wwv_flow.LF||
'      , p0 => l_file_p';
wwv_flow_imp.g_varchar2_table(3123) := 'ath'||wwv_flow.LF||
'      , p1 => l_file_desc'||wwv_flow.LF||
'      , p2 => p_mime_type'||wwv_flow.LF||
'      , p3 => p_file_size'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3124) := '  -- store file lob and other info to collection'||wwv_flow.LF||
'      apex_collection.add_member('||wwv_flow.LF||
'        p_colle';
wwv_flow_imp.g_varchar2_table(3125) := 'ction_name => p_collection_name'||wwv_flow.LF||
'      , p_c001            => l_file_path'||wwv_flow.LF||
'      , p_c002           ';
wwv_flow_imp.g_varchar2_table(3126) := ' => l_file_desc'||wwv_flow.LF||
'      , p_c003            => p_mime_type'||wwv_flow.LF||
'      , p_c004            => p_cache_cont';
wwv_flow_imp.g_varchar2_table(3127) := 'rol'||wwv_flow.LF||
'      , p_n001            => p_file_size'||wwv_flow.LF||
'      , p_blob001         => p_blob_content'||wwv_flow.LF||
'      );';
wwv_flow_imp.g_varchar2_table(3128) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'    -- treat other HTTP status codes as error'||wwv_flow.LF||
'    -- logic need to improved e.g. case';
wwv_flow_imp.g_varchar2_table(3129) := 's when two files are uploaded and only second file goes error'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( ''Error uplo';
wwv_flow_imp.g_varchar2_table(3130) := 'ading file: %s'', l_url_endpoint );'||wwv_flow.LF||
'      -- get error information from response body'||wwv_flow.LF||
'      parse_e';
wwv_flow_imp.g_varchar2_table(3131) := 'rror_json( l_response_body, l_error_code, l_error_mesg);'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error('||wwv_flow.LF||
'        p_m';
wwv_flow_imp.g_varchar2_table(3132) := 'essage           => coalesce( l_error_mesg, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_lo';
wwv_flow_imp.g_varchar2_table(3133) := 'cation  => apex_error.c_inline_in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end case;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_to_bucket;';
wwv_flow_imp.g_varchar2_table(3134) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(3135) := '----------------------------------------------------------------'||wwv_flow.LF||
'  procedure get_object('||wwv_flow.LF||
'    p_fil';
wwv_flow_imp.g_varchar2_table(3136) := 'e_path         in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2,'||wwv_flow.LF||
'    p_content_type      in out no';
wwv_flow_imp.g_varchar2_table(3137) := 'copy varchar2,'||wwv_flow.LF||
'    p_blob_content      in out nocopy blob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url_endpoint    varchar';
wwv_flow_imp.g_varchar2_table(3138) := '2(2000);'||wwv_flow.LF||
'    l_file_extension  varchar2(500);'||wwv_flow.LF||
'    l_response_body   clob;'||wwv_flow.LF||
'    l_error_code      v';
wwv_flow_imp.g_varchar2_table(3139) := 'archar2(2000);'||wwv_flow.LF||
'    l_error_mesg      varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- prepare request URL'||wwv_flow.LF||
'    l_';
wwv_flow_imp.g_varchar2_table(3140) := 'url_endpoint := prepare_object_url( p_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Object URL: %s'', l_url_e';
wwv_flow_imp.g_varchar2_table(3141) := 'ndpoint);'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set request headers'||wwv_flow.LF||
'    apex_web_service.set_request_headers('||wwv_flow.LF||
'      p_reset   ';
wwv_flow_imp.g_varchar2_table(3142) := '  => true'||wwv_flow.LF||
'    , p_name_01   => ''Accept'''||wwv_flow.LF||
'    , p_value_01  => ''*/*'''||wwv_flow.LF||
'    , p_name_02   => case when';
wwv_flow_imp.g_varchar2_table(3143) := ' p_client_request_id is not null then ''opc-client-request-id'' end'||wwv_flow.LF||
'    , p_value_02  => case when p_';
wwv_flow_imp.g_varchar2_table(3144) := 'client_request_id is not null then p_client_request_id end'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- append default request he';
wwv_flow_imp.g_varchar2_table(3145) := 'aders'||wwv_flow.LF||
'    append_default_request_headers;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- make request to get file from object storage'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3146) := '   p_blob_content :='||wwv_flow.LF||
'      apex_web_service.make_rest_request_b('||wwv_flow.LF||
'        p_url                  =>';
wwv_flow_imp.g_varchar2_table(3147) := ' l_url_endpoint'||wwv_flow.LF||
'      , p_http_method          => ''GET'''||wwv_flow.LF||
'      , p_credential_static_id => param_t(';
wwv_flow_imp.g_varchar2_table(3148) := ' ''credential'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'    -- debug request headers if ';
wwv_flow_imp.g_varchar2_table(3149) := 'error'||wwv_flow.LF||
'    process_headers('||wwv_flow.LF||
'      p_is_error => apex_web_service.g_status_code >= 400'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3150) := '  -- check reponse status'||wwv_flow.LF||
'    if apex_web_service.g_status_code >= 400'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debu';
wwv_flow_imp.g_varchar2_table(3151) := 'g.error( ''Error downloading file: %s'', l_url_endpoint );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_response_body := apex_util.blob_';
wwv_flow_imp.g_varchar2_table(3152) := 'to_clob( p_blob_content ) ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      parse_error_json( l_response_body, l_error_code, l_error_mesg )';
wwv_flow_imp.g_varchar2_table(3153) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error('||wwv_flow.LF||
'        p_message           => coalesce( l_error_mesg, apex_web_se';
wwv_flow_imp.g_varchar2_table(3154) := 'rvice.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_location  => apex_error.c_inline_in_notification'||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(3155) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
'      p_content_type := get_response_header( ''content-type'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_content_';
wwv_flow_imp.g_varchar2_table(3156) := 'type is null'||wwv_flow.LF||
'      or p_content_type = blog_mime.g_default_mime'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_debug.inf';
wwv_flow_imp.g_varchar2_table(3157) := 'o( ''File mime type is %s. Trying to fetch better one.'', coalesce( p_content_type, ''(null)'' ) );'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3158) := '     p_content_type := blog_mime.get_mime_type( p_file_path );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.in';
wwv_flow_imp.g_varchar2_table(3159) := 'fo( ''File mime type: %s'', p_content_type );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_object;'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(3160) := '-------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------';
wwv_flow_imp.g_varchar2_table(3161) := '-------------------------------------------'||wwv_flow.LF||
'  procedure delete_bucket_object('||wwv_flow.LF||
'    p_file_path     ';
wwv_flow_imp.g_varchar2_table(3162) := '        in varchar2,'||wwv_flow.LF||
'    p_if_match              in varchar2,'||wwv_flow.LF||
'    p_client_request_id     in varch';
wwv_flow_imp.g_varchar2_table(3163) := 'ar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_error_code    varchar2(2000);'||wwv_flow.LF||
'    l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'    l_resp';
wwv_flow_imp.g_varchar2_table(3164) := 'onse_body clob;'||wwv_flow.LF||
'    l_del_params    apex_exec.t_parameters;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Objec';
wwv_flow_imp.g_varchar2_table(3165) := 't name for deletion: %s, etag: %s'', p_file_path, p_if_match );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.add_parameter( l_del';
wwv_flow_imp.g_varchar2_table(3166) := '_params, ''bucketName'', param_t( ''bucket'' ) );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_del_params, ''namespace';
wwv_flow_imp.g_varchar2_table(3167) := ''', param_t( ''namespace'' ) );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_del_params, ''objectName'', p_file_path )';
wwv_flow_imp.g_varchar2_table(3168) := ';'||wwv_flow.LF||
'    apex_exec.add_parameter( l_del_params, ''if-match'', p_if_match );'||wwv_flow.LF||
'    apex_exec.add_parameter';
wwv_flow_imp.g_varchar2_table(3169) := '( l_del_params, ''opc-client-request-id'', p_client_request_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.execute_rest_source';
wwv_flow_imp.g_varchar2_table(3170) := '('||wwv_flow.LF||
'      p_static_id           => param_t( ''module_static_id'' )'||wwv_flow.LF||
'    , p_operation_static_id => ''del';
wwv_flow_imp.g_varchar2_table(3171) := 'ete_object'''||wwv_flow.LF||
'    , p_parameters          => l_del_params'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response_body := apex_exec';
wwv_flow_imp.g_varchar2_table(3172) := '.get_parameter_clob( l_del_params, ''response_body'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'    -- deb';
wwv_flow_imp.g_varchar2_table(3173) := 'ug request headers if error'||wwv_flow.LF||
'    process_headers('||wwv_flow.LF||
'      p_is_error => not apex_web_service.g_status';
wwv_flow_imp.g_varchar2_table(3174) := '_code in( 204, 404 )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check request status'||wwv_flow.LF||
'    -- don''t raise error on HTTP 404 er';
wwv_flow_imp.g_varchar2_table(3175) := 'ror.'||wwv_flow.LF||
'    -- when HTTP 404 error file not exists in object storage'||wwv_flow.LF||
'    -- and file need to anyway d';
wwv_flow_imp.g_varchar2_table(3176) := 'eleted from blog_files table'||wwv_flow.LF||
'    if apex_web_service.g_status_code in( 204, 404 )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3177) := '  apex_debug.info( ''File deleted from object storage: %s'', apex_web_service.g_status_code );'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3178) := '  delete from blog_files'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          and file_path = p_file_path'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3179) := '   apex_debug.info( ''%s rows deleted from blog_files'', sql%rowcount );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_deb';
wwv_flow_imp.g_varchar2_table(3180) := 'ug.error( ''Error deleting file: %s'', p_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'      parse_error_json( l_response_body, l_er';
wwv_flow_imp.g_varchar2_table(3181) := 'ror_code, l_error_mesg );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error('||wwv_flow.LF||
'        p_message           => coalesce( l';
wwv_flow_imp.g_varchar2_table(3182) := '_error_mesg, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_location  => apex_error.c_inline_';
wwv_flow_imp.g_varchar2_table(3183) := 'in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'  end delete_bucket_object;'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(3184) := '-------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(3185) := '-------------------------------------'||wwv_flow.LF||
'  procedure sync_from_database('||wwv_flow.LF||
'    p_collection_name   in v';
wwv_flow_imp.g_varchar2_table(3186) := 'archar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- loop file'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3187) := '    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        v1.file_name'||wwv_flow.LF||
'      , v1.file_dir'||wwv_flow.LF||
'      , v1.mime_type'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3188) := ' , v1.local_size'||wwv_flow.LF||
'      , v1.blob_content'||wwv_flow.LF||
'      from blog_v_all_files v1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3189) := '  and v1.is_active = 1'||wwv_flow.LF||
'        and v1.local_size > 0'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Process';
wwv_flow_imp.g_varchar2_table(3190) := 'ing file %s : %s'', c1.file_name, c1.mime_type );'||wwv_flow.LF||
''||wwv_flow.LF||
'      upload_to_bucket('||wwv_flow.LF||
'        p_file_name    ';
wwv_flow_imp.g_varchar2_table(3191) := '     => c1.file_name'||wwv_flow.LF||
'      , p_dir               => c1.file_dir'||wwv_flow.LF||
'      , p_mime_type         => c1.';
wwv_flow_imp.g_varchar2_table(3192) := 'mime_type'||wwv_flow.LF||
'      , p_file_size         => c1.local_size'||wwv_flow.LF||
'      , p_cache_control     => null'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3193) := ', p_overwrite_file    => ''N'''||wwv_flow.LF||
'      , p_collection_name   => p_collection_name'||wwv_flow.LF||
'      , p_blob_conte';
wwv_flow_imp.g_varchar2_table(3194) := 'nt      => c1.blob_content'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end ';
wwv_flow_imp.g_varchar2_table(3195) := 'loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sync_from_database;'||wwv_flow.LF||
'----------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3196) := '----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3197) := '  procedure sync_from_object_storage('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id';
wwv_flow_imp.g_varchar2_table(3198) := ' in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_row_timestamp timestamp with time zone;'||wwv_flow.LF||
'    l_mime_type';
wwv_flow_imp.g_varchar2_table(3199) := '     varchar2(2000);'||wwv_flow.LF||
'    l_blob_content  blob;'||wwv_flow.LF||
'    l_file_exists   boolean := false;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3200) := '   -- get files max sync timestamp'||wwv_flow.LF||
'    select'||wwv_flow.LF||
'      coalesce( max( apex$row_sync_timestamp ), curr';
wwv_flow_imp.g_varchar2_table(3201) := 'ent_timestamp ) as row_sync_timestamp'||wwv_flow.LF||
'    into l_row_timestamp'||wwv_flow.LF||
'    from blog_v_all_files'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3202) := ''||wwv_flow.LF||
'    apex_debug.info( ''Max sync time: %s'', l_row_timestamp );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- create collection for storin';
wwv_flow_imp.g_varchar2_table(3203) := 'g filea temporaly'||wwv_flow.LF||
'    apex_collection.create_or_truncate_collection( p_collection_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'    --';
wwv_flow_imp.g_varchar2_table(3204) := ' sync files metadata from object storage'||wwv_flow.LF||
'    apex_rest_source_sync.synchronize_data('||wwv_flow.LF||
'      p_modul';
wwv_flow_imp.g_varchar2_table(3205) := 'e_static_id => param_t( ''module_static_id'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- loop files'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      sel';
wwv_flow_imp.g_varchar2_table(3206) := 'ect'||wwv_flow.LF||
'        v1.id'||wwv_flow.LF||
'      , v1.file_path'||wwv_flow.LF||
'      , v1.file_desc'||wwv_flow.LF||
'      , v1.file_size'||wwv_flow.LF||
'      , v1.loc';
wwv_flow_imp.g_varchar2_table(3207) := 'al_size'||wwv_flow.LF||
'      from blog_v_all_files v1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and v1.apex$row_sync_timestamp >';
wwv_flow_imp.g_varchar2_table(3208) := ' l_row_timestamp'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Processing file: %s'', c1.file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3209) := '   -- get file from object storage'||wwv_flow.LF||
'      get_object('||wwv_flow.LF||
'        p_file_path         => c1.file_path'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3210) := '      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      , p_content_type      => l_mime_type'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3211) := '  , p_blob_content      => l_blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'      -- save file to collection if it already ';
wwv_flow_imp.g_varchar2_table(3212) := 'exists in database'||wwv_flow.LF||
'      -- we prompt user to confirm file overwrite'||wwv_flow.LF||
'      -- and show file inform';
wwv_flow_imp.g_varchar2_table(3213) := 'ation e.g. name and possible description from collection'||wwv_flow.LF||
'      -- then if user confirms, we can ove';
wwv_flow_imp.g_varchar2_table(3214) := 'rwrite file using data stored in collection'||wwv_flow.LF||
'      if c1.local_size > 0'||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        apex_';
wwv_flow_imp.g_varchar2_table(3215) := 'collection.add_member('||wwv_flow.LF||
'          p_collection_name => p_collection_name'||wwv_flow.LF||
'        , p_c001          ';
wwv_flow_imp.g_varchar2_table(3216) := '  => c1.file_path'||wwv_flow.LF||
'        , p_c002            => c1.file_desc'||wwv_flow.LF||
'        , p_c003            => l_mim';
wwv_flow_imp.g_varchar2_table(3217) := 'e_type'||wwv_flow.LF||
'        , p_n001            => c1.file_size'||wwv_flow.LF||
'        , p_blob001         => l_blob_content'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3218) := '        );'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file_exists := true;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else'||wwv_flow.LF||
''||wwv_flow.LF||
'        -- if file not already exists ';
wwv_flow_imp.g_varchar2_table(3219) := 'in database update blob'||wwv_flow.LF||
'        update blog_files'||wwv_flow.LF||
'          set blob_content = l_blob_content'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3220) := '     where 1 = 1'||wwv_flow.LF||
'          and id = c1.id'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if';
wwv_flow_imp.g_varchar2_table(3221) := ' any of files didn''t exists, delete collection'||wwv_flow.LF||
'    if not l_file_exists'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_colle';
wwv_flow_imp.g_varchar2_table(3222) := 'ction.delete_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sync_from_object_storage;'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(3223) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(3224) := '---------------------------------------------------------'||wwv_flow.LF||
'  function get_namespace('||wwv_flow.LF||
'    p_client_r';
wwv_flow_imp.g_varchar2_table(3225) := 'equest_id in varchar2 default null'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_params        apex_exec.t_param';
wwv_flow_imp.g_varchar2_table(3226) := 'eters;'||wwv_flow.LF||
'    l_response_body clob;'||wwv_flow.LF||
'    l_namespace     varchar2(256);'||wwv_flow.LF||
'    l_error_code    varchar2(';
wwv_flow_imp.g_varchar2_table(3227) := '2000);'||wwv_flow.LF||
'    l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'  -- fetch object storage namespace'||wwv_flow.LF||
''||wwv_flow.LF||
'    ape';
wwv_flow_imp.g_varchar2_table(3228) := 'x_exec.add_parameter( l_params, ''opc-client-request-id'', p_client_request_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.exe';
wwv_flow_imp.g_varchar2_table(3229) := 'cute_rest_source('||wwv_flow.LF||
'      p_static_id           => param_t( ''module_static_id'' )'||wwv_flow.LF||
'    , p_operation_s';
wwv_flow_imp.g_varchar2_table(3230) := 'tatic_id => ''get_namespace'''||wwv_flow.LF||
'    , p_parameters          => l_params'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response_body ';
wwv_flow_imp.g_varchar2_table(3231) := ':= apex_exec.get_parameter_clob( l_params, ''response_body'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Fetch object ';
wwv_flow_imp.g_varchar2_table(3232) := 'storage namespace returns: %s'', l_response_body );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check reponse status'||wwv_flow.LF||
'    if not apex_w';
wwv_flow_imp.g_varchar2_table(3233) := 'eb_service.g_status_code = 200'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      process_headers('||wwv_flow.LF||
'        p_is_error => true'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3234) := '  );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.error( ''Error on get_namespace.'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      parse_error_json( l_response_b';
wwv_flow_imp.g_varchar2_table(3235) := 'ody, l_error_code, l_error_mesg );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error('||wwv_flow.LF||
'        p_message           => co';
wwv_flow_imp.g_varchar2_table(3236) := 'alesce( l_error_mesg, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_location  => apex_error.';
wwv_flow_imp.g_varchar2_table(3237) := 'c_inline_in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_namespace := trim( both ''"'' from l_respon';
wwv_flow_imp.g_varchar2_table(3238) := 'se_body );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- return namespace'||wwv_flow.LF||
'    return l_namespace;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_namespace;'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(3239) := '--------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(3240) := '--------------------------------------------------'||wwv_flow.LF||
'-- Global procedures and functions'||wwv_flow.LF||
'------------';
wwv_flow_imp.g_varchar2_table(3241) := '--------------------------------------------------------------------'||wwv_flow.LF||
'------------------------------';
wwv_flow_imp.g_varchar2_table(3242) := '--------------------------------------------------'||wwv_flow.LF||
'  function get_param_value('||wwv_flow.LF||
'    p_param_name in';
wwv_flow_imp.g_varchar2_table(3243) := ' varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return param_t( p_param_name );'||wwv_flow.LF||
'  end get_param_';
wwv_flow_imp.g_varchar2_table(3244) := 'value;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------';
wwv_flow_imp.g_varchar2_table(3245) := '----------------------------------------------------------------------'||wwv_flow.LF||
'  procedure set_object_stora';
wwv_flow_imp.g_varchar2_table(3246) := 'ge('||wwv_flow.LF||
'    p_bucket_name   in varchar2,'||wwv_flow.LF||
'    p_base_url      in varchar2,'||wwv_flow.LF||
'    p_build_status  in varc';
wwv_flow_imp.g_varchar2_table(3247) := 'har2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    c_bucket_url_template constant varchar2(64) := ''https://%0.objectstorage.%1.oci';
wwv_flow_imp.g_varchar2_table(3248) := '.customer-oci.com/n/%0/b/%2/o/'';'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_attributes   apex_t_varchar2;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_base_url    varchar';
wwv_flow_imp.g_varchar2_table(3249) := '2(2000);'||wwv_flow.LF||
'    l_bucket_url  varchar2(2000);'||wwv_flow.LF||
'    l_region      varchar2(256);'||wwv_flow.LF||
'    l_namespace   var';
wwv_flow_imp.g_varchar2_table(3250) := 'char2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Set object storage buid option %s status: %s'', param_t';
wwv_flow_imp.g_varchar2_table(3251) := '( ''build_option_name'' ), p_build_status );'||wwv_flow.LF||
'    -- Set build option status for the storage feature'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3252) := '    blog_admin.update_feature('||wwv_flow.LF||
'      p_build_option_name => param_t( ''build_option_name'' )'||wwv_flow.LF||
'    , p';
wwv_flow_imp.g_varchar2_table(3253) := '_build_status      => p_build_status'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_build_status = apex_application_admin.c_bui';
wwv_flow_imp.g_varchar2_table(3254) := 'ld_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storage bucket: %s'', p_buck';
wwv_flow_imp.g_varchar2_table(3255) := 'et_name );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''bucket_param_name'' ), p_bucket_n';
wwv_flow_imp.g_varchar2_table(3256) := 'ame );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_region :='||wwv_flow.LF||
'        substr('||wwv_flow.LF||
'          param_t( ''base_url'' )'||wwv_flow.LF||
'        , instr( para';
wwv_flow_imp.g_varchar2_table(3257) := 'm_t( ''base_url'' ), ''.'', 1, 1 ) + 1'||wwv_flow.LF||
'        , instr( param_t( ''base_url'' ), ''.'', 1, 2 ) - 1 - instr(';
wwv_flow_imp.g_varchar2_table(3258) := ' param_t( ''base_url'' ), ''.'', 1, 1 )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storag';
wwv_flow_imp.g_varchar2_table(3259) := 'e region: %s'', l_region );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''region_param_nam';
wwv_flow_imp.g_varchar2_table(3260) := 'e'' ), l_region );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_namespace := get_namespace;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object stora';
wwv_flow_imp.g_varchar2_table(3261) := 'ge  namespace: %s'', l_namespace );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''namespac';
wwv_flow_imp.g_varchar2_table(3262) := 'e_param_name'' ), l_namespace );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_bucket_url :='||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'          p_m';
wwv_flow_imp.g_varchar2_table(3263) := 'essage => c_bucket_url_template'||wwv_flow.LF||
'        , p0 => l_namespace'||wwv_flow.LF||
'        , p1 => l_region'||wwv_flow.LF||
'        , p2';
wwv_flow_imp.g_varchar2_table(3264) := ' => p_bucket_name'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      ;'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set object storage bucket URL: %s'',';
wwv_flow_imp.g_varchar2_table(3265) := ' l_bucket_url );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_string.plist_push( l_attributes, param_t( ''bucket_url_param_name'' ), ';
wwv_flow_imp.g_varchar2_table(3266) := 'l_bucket_url );'||wwv_flow.LF||
''||wwv_flow.LF||
'      blog_admin.set_attribute_value('||wwv_flow.LF||
'        p_attribute_list  => l_attributes';
wwv_flow_imp.g_varchar2_table(3267) := ''||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_base_url := rtrim( p_base_url, ''/'' ) || ''/'';'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set obj';
wwv_flow_imp.g_varchar2_table(3268) := 'ect storage remote server %s: %s'', param_t( ''remote_server_static_id'' ), l_base_url );'||wwv_flow.LF||
'      -- Set';
wwv_flow_imp.g_varchar2_table(3269) := ' remote server URL'||wwv_flow.LF||
'      apex_application_admin.set_remote_server('||wwv_flow.LF||
'        p_static_id => param_t(';
wwv_flow_imp.g_varchar2_table(3270) := ' ''remote_server_static_id'' )'||wwv_flow.LF||
'      , p_base_url  => l_base_url'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end se';
wwv_flow_imp.g_varchar2_table(3271) := 't_object_storage;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3272) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure uploa';
wwv_flow_imp.g_varchar2_table(3273) := 'd_object('||wwv_flow.LF||
'    p_file_names        in varchar2,'||wwv_flow.LF||
'    p_dir               in varchar2,'||wwv_flow.LF||
'    p_collect';
wwv_flow_imp.g_varchar2_table(3274) := 'ion_name   in varchar2,'||wwv_flow.LF||
'    p_cache_control     in varchar2 default null,'||wwv_flow.LF||
'    p_extract           ';
wwv_flow_imp.g_varchar2_table(3275) := 'in varchar2 default ''N'','||wwv_flow.LF||
'    p_overwrite_file    in varchar2 default ''N'','||wwv_flow.LF||
'    p_client_request_id ';
wwv_flow_imp.g_varchar2_table(3276) := 'in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_names    apex_t_varchar2;'||wwv_flow.LF||
'    l_file_name     varch';
wwv_flow_imp.g_varchar2_table(3277) := 'ar2(500);'||wwv_flow.LF||
'    l_mime_type     varchar2(500);'||wwv_flow.LF||
'    l_file_size     pls_integer;'||wwv_flow.LF||
'    l_zip_dir      ';
wwv_flow_imp.g_varchar2_table(3278) := ' apex_zip.t_dir_entries;'||wwv_flow.LF||
'    l_zip_file_path varchar2(32767);'||wwv_flow.LF||
'    l_unzipped      blob := empty_bl';
wwv_flow_imp.g_varchar2_table(3279) := 'ob();'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    if apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      ape';
wwv_flow_imp.g_varchar2_table(3280) := 'x_collection.delete_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get file names'||wwv_flow.LF||
'    l_fi';
wwv_flow_imp.g_varchar2_table(3281) := 'le_names :='||wwv_flow.LF||
'      apex_string.split('||wwv_flow.LF||
'        p_str => p_file_names'||wwv_flow.LF||
'      , p_sep => '':'''||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(3282) := ''||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- loop file'||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        files.filename'||wwv_flow.LF||
'      , files.mime';
wwv_flow_imp.g_varchar2_table(3283) := '_type'||wwv_flow.LF||
'      , files.blob_content'||wwv_flow.LF||
'      from apex_application_temp_files files'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3284) := '      and exists('||wwv_flow.LF||
'        select 1'||wwv_flow.LF||
'        from table( l_file_names ) x1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3285) := '       and x1.column_value = files.name'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Processing f';
wwv_flow_imp.g_varchar2_table(3286) := 'ile %s : %s'', c1.filename, c1.mime_type );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if p_extract = ''Y'''||wwv_flow.LF||
'      and c1.mime_type = ''ap';
wwv_flow_imp.g_varchar2_table(3287) := 'plication/zip'''||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_dir :='||wwv_flow.LF||
'          apex_zip.get_dir_entries('||wwv_flow.LF||
'           ';
wwv_flow_imp.g_varchar2_table(3288) := ' p_zipped_blob => c1.blob_content'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        ;'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_zip_file_path := l_zip_dir.fi';
wwv_flow_imp.g_varchar2_table(3289) := 'rst;'||wwv_flow.LF||
''||wwv_flow.LF||
'        while l_zip_file_path is not null'||wwv_flow.LF||
'        loop'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_unzipped :='||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3290) := '    apex_zip.get_file_content('||wwv_flow.LF||
'              p_zipped_blob => c1.blob_content'||wwv_flow.LF||
'            , p_dir_';
wwv_flow_imp.g_varchar2_table(3291) := 'entry   => l_zip_dir( l_zip_file_path )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          ;'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_mime_type := blog';
wwv_flow_imp.g_varchar2_table(3292) := '_mime.get_mime_type( l_zip_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'          l_file_size := dbms_lob.getlength( l_unzipped )';
wwv_flow_imp.g_varchar2_table(3293) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'          upload_to_bucket('||wwv_flow.LF||
'            p_file_name         => l_zip_file_path'||wwv_flow.LF||
'          , p_';
wwv_flow_imp.g_varchar2_table(3294) := 'dir               => p_dir'||wwv_flow.LF||
'          , p_mime_type         => l_mime_type'||wwv_flow.LF||
'          , p_file_size ';
wwv_flow_imp.g_varchar2_table(3295) := '        => l_file_size'||wwv_flow.LF||
'          , p_cache_control     => p_cache_control'||wwv_flow.LF||
'          , p_overwrite_';
wwv_flow_imp.g_varchar2_table(3296) := 'file    => p_overwrite_file'||wwv_flow.LF||
'          , p_collection_name   => p_collection_name'||wwv_flow.LF||
'          , p_blo';
wwv_flow_imp.g_varchar2_table(3297) := 'b_content      => l_unzipped'||wwv_flow.LF||
'          , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'          );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3298) := ''||wwv_flow.LF||
'          l_zip_file_path := l_zip_dir.next( l_zip_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'        end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else';
wwv_flow_imp.g_varchar2_table(3299) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'        l_file_size := dbms_lob.getlength( c1.blob_content );'||wwv_flow.LF||
''||wwv_flow.LF||
'        upload_to_bucket('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3300) := '      p_file_name         => c1.filename'||wwv_flow.LF||
'        , p_dir               => p_dir'||wwv_flow.LF||
'        , p_mime_t';
wwv_flow_imp.g_varchar2_table(3301) := 'ype         => c1.mime_type'||wwv_flow.LF||
'        , p_file_size         => l_file_size'||wwv_flow.LF||
'        , p_cache_control';
wwv_flow_imp.g_varchar2_table(3302) := '     => p_cache_control'||wwv_flow.LF||
'        , p_overwrite_file    => p_overwrite_file'||wwv_flow.LF||
'        , p_collection_n';
wwv_flow_imp.g_varchar2_table(3303) := 'ame   => p_collection_name'||wwv_flow.LF||
'        , p_blob_content      => c1.blob_content'||wwv_flow.LF||
'        , p_client_req';
wwv_flow_imp.g_varchar2_table(3304) := 'uest_id => p_client_request_id'||wwv_flow.LF||
'        );'||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end upload_object;';
wwv_flow_imp.g_varchar2_table(3305) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'----------------';
wwv_flow_imp.g_varchar2_table(3306) := '----------------------------------------------------------------'||wwv_flow.LF||
'  procedure file_sync('||wwv_flow.LF||
'    p_acti';
wwv_flow_imp.g_varchar2_table(3307) := 'on            in varchar2,'||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar';
wwv_flow_imp.g_varchar2_table(3308) := '2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''File sync action is: %s'', p_action );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3309) := ''||wwv_flow.LF||
'    if apex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.dele';
wwv_flow_imp.g_varchar2_table(3310) := 'te_collection( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    case p_action'||wwv_flow.LF||
'    when ''META'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3311) := '      apex_rest_source_sync.synchronize_data('||wwv_flow.LF||
'        p_module_static_id  => param_t( ''module_stati';
wwv_flow_imp.g_varchar2_table(3312) := 'c_id'' )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    when ''DB'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      sync_from_object_storage('||wwv_flow.LF||
'        p_collectio';
wwv_flow_imp.g_varchar2_table(3313) := 'n_name   => p_collection_name'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    w';
wwv_flow_imp.g_varchar2_table(3314) := 'hen ''OCI'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      sync_from_database('||wwv_flow.LF||
'        p_collection_name   => p_collection_name'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3315) := '      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end case;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end file_sync;'||wwv_flow.LF||
'-';
wwv_flow_imp.g_varchar2_table(3316) := '-------------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------';
wwv_flow_imp.g_varchar2_table(3317) := '-------------------------------------------------------------'||wwv_flow.LF||
'  procedure replace_object('||wwv_flow.LF||
'    p_co';
wwv_flow_imp.g_varchar2_table(3318) := 'llection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3319) := ''||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        c001    as file_path'||wwv_flow.LF||
'      , c002    as file_desc'||wwv_flow.LF||
'      , ';
wwv_flow_imp.g_varchar2_table(3320) := 'c003    as mime_type'||wwv_flow.LF||
'      , c004    as cache_control'||wwv_flow.LF||
'      , n001    as file_size'||wwv_flow.LF||
'      , blob00';
wwv_flow_imp.g_varchar2_table(3321) := '1 as blob_content'||wwv_flow.LF||
'      from apex_collections'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and collection_name = p_c';
wwv_flow_imp.g_varchar2_table(3322) := 'ollection_name'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      upload_to_bucket('||wwv_flow.LF||
'        p_file_name         => c1.file_path'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3323) := '      , p_dir               => null'||wwv_flow.LF||
'      , p_mime_type         => c1.mime_type'||wwv_flow.LF||
'      , p_file_siz';
wwv_flow_imp.g_varchar2_table(3324) := 'e         => c1.file_size'||wwv_flow.LF||
'      , p_cache_control     => c1.cache_control'||wwv_flow.LF||
'      , p_overwrite_file';
wwv_flow_imp.g_varchar2_table(3325) := '    => ''Y'''||wwv_flow.LF||
'      , p_collection_name   => p_collection_name'||wwv_flow.LF||
'      , p_blob_content      => c1.blob';
wwv_flow_imp.g_varchar2_table(3326) := '_content'||wwv_flow.LF||
'      , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    if ap';
wwv_flow_imp.g_varchar2_table(3327) := 'ex_collection.collection_exists( p_collection_name )'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_collection.delete_collect';
wwv_flow_imp.g_varchar2_table(3328) := 'ion( p_collection_name );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end replace_object;'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(3329) := '---------------------------------------------'||wwv_flow.LF||
'-----------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3330) := '---------------------------'||wwv_flow.LF||
'  procedure download_selected_objects('||wwv_flow.LF||
'    p_collection_name   in varc';
wwv_flow_imp.g_varchar2_table(3331) := 'har2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_file_name     varchar2(256';
wwv_flow_imp.g_varchar2_table(3332) := ');'||wwv_flow.LF||
'    l_content_type  varchar2(256);'||wwv_flow.LF||
'    l_blob_content  blob;'||wwv_flow.LF||
'    l_zip_file      blob;'||wwv_flow.LF||
'  begi';
wwv_flow_imp.g_varchar2_table(3333) := 'n'||wwv_flow.LF||
''||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        t1.file_path'||wwv_flow.LF||
'      , t1.file_name'||wwv_flow.LF||
'      , t1.etag'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3334) := '  , count(1) over() as num_rows'||wwv_flow.LF||
'      from blog_v_all_files t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and exis';
wwv_flow_imp.g_varchar2_table(3335) := 'ts('||wwv_flow.LF||
'          select 1'||wwv_flow.LF||
'          from apex_collections x1'||wwv_flow.LF||
'          where 1 = 1'||wwv_flow.LF||
'            and ';
wwv_flow_imp.g_varchar2_table(3336) := 'x1.collection_name = p_collection_name'||wwv_flow.LF||
'            and x1.n001 = t1.id'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3337) := '  -- get file from object storage'||wwv_flow.LF||
'      get_object('||wwv_flow.LF||
'        p_file_path         => c1.file_path'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3338) := '     , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'      , p_content_type      => l_content_type'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3339) := '    , p_blob_content      => l_blob_content'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if not apex_error.have_errors_occurre';
wwv_flow_imp.g_varchar2_table(3340) := 'd'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        -- add files to zip if more than 1 is selected'||wwv_flow.LF||
'        if c1.num_rows = 1'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3341) := '       then'||wwv_flow.LF||
'          l_file_name := c1.file_name;'||wwv_flow.LF||
'        else'||wwv_flow.LF||
'          apex_zip.add_file('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3342) := '         p_zipped_blob => l_zip_file'||wwv_flow.LF||
'          , p_file_name   => c1.file_path'||wwv_flow.LF||
'          , p_conte';
wwv_flow_imp.g_varchar2_table(3343) := 'nt     => l_blob_content'||wwv_flow.LF||
'          );'||wwv_flow.LF||
'        end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      else'||wwv_flow.LF||
'        -- exit from loop if ';
wwv_flow_imp.g_varchar2_table(3344) := 'error have occured'||wwv_flow.LF||
'        exit;'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- if we have zip'||wwv_flow.LF||
'    if l';
wwv_flow_imp.g_varchar2_table(3345) := '_zip_file is not null'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_zip.finish('||wwv_flow.LF||
'        p_zipped_blob => l_zip_file'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3346) := '  );'||wwv_flow.LF||
''||wwv_flow.LF||
'      if not apex_error.have_errors_occurred'||wwv_flow.LF||
'      then'||wwv_flow.LF||
''||wwv_flow.LF||
'        l_blob_content := l_zip_';
wwv_flow_imp.g_varchar2_table(3347) := 'file;'||wwv_flow.LF||
'        l_content_type := ''application/zip'';'||wwv_flow.LF||
'        l_file_name := blog_file.get_zip_name;';
wwv_flow_imp.g_varchar2_table(3348) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
'    -- if no error download file/zip'||wwv_flow.LF||
'    if not apex_error.have_er';
wwv_flow_imp.g_varchar2_table(3349) := 'rors_occurred'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      apex_http.download('||wwv_flow.LF||
'        p_blob          => l_blob_content'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3350) := ' , p_content_type  => l_content_type'||wwv_flow.LF||
'      , p_filename      => l_file_name'||wwv_flow.LF||
'      );'||wwv_flow.LF||
'    end if;';
wwv_flow_imp.g_varchar2_table(3351) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'  end download_selected_objects;'||wwv_flow.LF||
'---------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3352) := '-----------------'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3353) := ''||wwv_flow.LF||
'  procedure rename_object('||wwv_flow.LF||
'    p_old_file_path     in varchar2,'||wwv_flow.LF||
'    p_old_if_match      in varcha';
wwv_flow_imp.g_varchar2_table(3354) := 'r2,'||wwv_flow.LF||
'    p_new_file_path     in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3355) := 'as'||wwv_flow.LF||
'    l_error_code    varchar2(2000);'||wwv_flow.LF||
'    l_error_mesg    varchar2(2000);'||wwv_flow.LF||
'    l_response_body cl';
wwv_flow_imp.g_varchar2_table(3356) := 'ob;'||wwv_flow.LF||
'    l_params        apex_exec.t_parameters;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Object for rename';
wwv_flow_imp.g_varchar2_table(3357) := ': %s - etag: %s'', p_old_file_path, p_old_if_match );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ''buck';
wwv_flow_imp.g_varchar2_table(3358) := 'etName'', param_t( ''bucket'' ) );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ''namespace'', param_t( ''names';
wwv_flow_imp.g_varchar2_table(3359) := 'pace'' ) );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ''sourceName'', p_old_file_path );'||wwv_flow.LF||
'    apex_exec.a';
wwv_flow_imp.g_varchar2_table(3360) := 'dd_parameter( l_params, ''srcObjIfMatchETag'', p_old_if_match );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_param';
wwv_flow_imp.g_varchar2_table(3361) := 's, ''newName'', p_new_file_path );'||wwv_flow.LF||
'    apex_exec.add_parameter( l_params, ''opc-client-request-id'', p_';
wwv_flow_imp.g_varchar2_table(3362) := 'client_request_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_exec.execute_rest_source('||wwv_flow.LF||
'      p_static_id           => param_t( ';
wwv_flow_imp.g_varchar2_table(3363) := '''module_static_id'' )'||wwv_flow.LF||
'    , p_operation_static_id => ''rename_object'''||wwv_flow.LF||
'    , p_parameters          =>';
wwv_flow_imp.g_varchar2_table(3364) := ' l_params'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_response_body := apex_exec.get_parameter_clob( l_params, ''response_body'' ';
wwv_flow_imp.g_varchar2_table(3365) := ');'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- process response headers'||wwv_flow.LF||
'    -- debug request headers if error'||wwv_flow.LF||
'    process_headers('||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3366) := '      p_is_error => not apex_web_service.g_status_code = 200'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- check request status';
wwv_flow_imp.g_varchar2_table(3367) := ''||wwv_flow.LF||
'    if apex_web_service.g_status_code = 200'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''File %s renamed to';
wwv_flow_imp.g_varchar2_table(3368) := ' %s'', p_old_file_path, p_new_file_path );'||wwv_flow.LF||
''||wwv_flow.LF||
'    else'||wwv_flow.LF||
''||wwv_flow.LF||
'      parse_error_json( l_response_body, l_';
wwv_flow_imp.g_varchar2_table(3369) := 'error_code, l_error_mesg );'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_error.add_error ('||wwv_flow.LF||
'        p_message           => coalesce';
wwv_flow_imp.g_varchar2_table(3370) := '( l_error_mesg, apex_web_service.g_reason_phrase )'||wwv_flow.LF||
'      , p_display_location  => apex_error.c_inli';
wwv_flow_imp.g_varchar2_table(3371) := 'ne_in_notification'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end rename_object;'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(3372) := '-------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3373) := '-------------------------------'||wwv_flow.LF||
'  procedure delete_object('||wwv_flow.LF||
'    p_file_path         in varchar2,'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3374) := '   p_if_match          in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3375) := 'begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    delete_bucket_object('||wwv_flow.LF||
'      p_file_path         => p_file_path'||wwv_flow.LF||
'    , p_if_match      ';
wwv_flow_imp.g_varchar2_table(3376) := '    => p_if_match'||wwv_flow.LF||
'    , p_client_request_id => p_client_request_id'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end delete_object;';
wwv_flow_imp.g_varchar2_table(3377) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(3378) := '---------------------------------------------------------------'||wwv_flow.LF||
'  procedure delete_selected_objects';
wwv_flow_imp.g_varchar2_table(3379) := '('||wwv_flow.LF||
'    p_collection_name   in varchar2,'||wwv_flow.LF||
'    p_client_request_id in varchar2 default null'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as';
wwv_flow_imp.g_varchar2_table(3380) := ''||wwv_flow.LF||
'    l_obj_idx pls_integer := 1;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    for c1 in('||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        file_path'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3381) := ' , etag'||wwv_flow.LF||
'      from blog_v_all_files t1'||wwv_flow.LF||
'      where 1 = 1'||wwv_flow.LF||
'        and exists('||wwv_flow.LF||
'          select 1';
wwv_flow_imp.g_varchar2_table(3382) := ''||wwv_flow.LF||
'          from apex_collections x1'||wwv_flow.LF||
'          where 1 = 1'||wwv_flow.LF||
'            and x1.collection_name = p_c';
wwv_flow_imp.g_varchar2_table(3383) := 'ollection_name'||wwv_flow.LF||
'            and x1.n001 = t1.id'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      delete_bucket_object';
wwv_flow_imp.g_varchar2_table(3384) := '('||wwv_flow.LF||
'        p_file_path         => c1.file_path'||wwv_flow.LF||
'      , p_if_match          => c1.etag'||wwv_flow.LF||
'      , p_cl';
wwv_flow_imp.g_varchar2_table(3385) := 'ient_request_id => p_client_request_id'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end delete_selected_objects;';
wwv_flow_imp.g_varchar2_table(3386) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(3387) := '---------------------------------------------------------------'||wwv_flow.LF||
'-- Package initialization'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(3388) := '------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3389) := '------------------------------------------------------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  -- initialize parameters'||wwv_flow.LF||
'  apex_de';
wwv_flow_imp.g_varchar2_table(3390) := 'bug.info( ''----- Initialize package BLOG_OCI_OS -----'' );'||wwv_flow.LF||
'  init_params;'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(3391) := '-------------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(3392) := '-------------------------------------'||wwv_flow.LF||
'end "BLOG_OCI_OS";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_X';
wwv_flow_imp.g_varchar2_table(3393) := 'ML"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(3394) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- Private constants and va';
wwv_flow_imp.g_varchar2_table(3395) := 'riables'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(3396) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'  c_mime_xml  constant varc';
wwv_flow_imp.g_varchar2_table(3397) := 'har2(40)     := ''application/xml'';'||wwv_flow.LF||
'  c_char_set  constant varchar2(5)      := ''UTF-8'';'||wwv_flow.LF||
'  c_headers';
wwv_flow_imp.g_varchar2_table(3398) := '   constant apex_t_varchar2  := apex_t_varchar2( ''Cache-Control'', ''Content-Disposition'', ''Last-Modif';
wwv_flow_imp.g_varchar2_table(3399) := 'ied'' );'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'---------';
wwv_flow_imp.g_varchar2_table(3400) := '-----------------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedures and f';
wwv_flow_imp.g_varchar2_table(3401) := 'unctions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(3402) := '------------------------------------------------------------------------'||wwv_flow.LF||
'-- none'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(3403) := '---------------------------------------------------------------'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(3404) := '---------------------------------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'-----------------';
wwv_flow_imp.g_varchar2_table(3405) := '---------------------------------------------------------------'||wwv_flow.LF||
'-----------------------------------';
wwv_flow_imp.g_varchar2_table(3406) := '---------------------------------------------'||wwv_flow.LF||
'  procedure rss('||wwv_flow.LF||
'    p_app_name  in varchar2,'||wwv_flow.LF||
'    p';
wwv_flow_imp.g_varchar2_table(3407) := '_app_desc  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           xmltype;'||wwv_flow.LF||
'    l_rss           blob;'||wwv_flow.LF||
'    l_la';
wwv_flow_imp.g_varchar2_table(3408) := 'ng          varchar2(256);'||wwv_flow.LF||
'    l_app_id        varchar2(256);'||wwv_flow.LF||
'    l_rss_url       varchar2(4000);';
wwv_flow_imp.g_varchar2_table(3409) := ''||wwv_flow.LF||
'    l_xsl_url       varchar2(4000);'||wwv_flow.LF||
'    l_home_url      varchar2(4000);'||wwv_flow.LF||
'    l_app_name      varch';
wwv_flow_imp.g_varchar2_table(3410) := 'ar2(4000);'||wwv_flow.LF||
'    l_app_desc      varchar2(4000);'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'    l_last_modi';
wwv_flow_imp.g_varchar2_table(3411) := 'fied varchar2(256);'||wwv_flow.LF||
'    l_max_published timestamp;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_rss_version   constant varchar2(5)  := ';
wwv_flow_imp.g_varchar2_table(3412) := '''2.0'';'||wwv_flow.LF||
''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_lang := apex_application.g_browser_language;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- RSS feed URL'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3413) := 'l_rss_url   := blog_url.get_rss;'||wwv_flow.LF||
'    -- blog name'||wwv_flow.LF||
'    l_app_name := coalesce('||wwv_flow.LF||
'       p_app_name'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3414) := '      ,blog_util.get_attribute_value( ''P0_BLOG_APP_NAME'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- rss feed description'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3415) := ' l_app_desc  := coalesce('||wwv_flow.LF||
'       p_app_desc'||wwv_flow.LF||
'      ,blog_util.get_attribute_value( ''P0_BLOG_APP_DES';
wwv_flow_imp.g_varchar2_table(3416) := 'C'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- blog home page absulute URL'||wwv_flow.LF||
'    l_home_url  := blog_url.get_tab('||wwv_flow.LF||
'       p_pag';
wwv_flow_imp.g_varchar2_table(3417) := 'e       => ''HOME'''||wwv_flow.LF||
'      ,p_canonical  => ''YES'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- rss transformations (XSLT)'||wwv_flow.LF||
'    l_xs';
wwv_flow_imp.g_varchar2_table(3418) := 'l_url := blog_url.get_rss_xsl;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- generate RSS'||wwv_flow.LF||
'    select xmlserialize('||wwv_flow.LF||
'      content xmlco';
wwv_flow_imp.g_varchar2_table(3419) := 'ncat('||wwv_flow.LF||
'        case when l_xsl_url is not null'||wwv_flow.LF||
'          then xmlpi( "xml-stylesheet",'||wwv_flow.LF||
'           ';
wwv_flow_imp.g_varchar2_table(3420) := ' apex_string.format('||wwv_flow.LF||
'               p_message => ''type="text/xsl" href="%s" media="screen"'''||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3421) := '        ,p0 => l_xsl_url'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        end,'||wwv_flow.LF||
'        xmlelement('||wwv_flow.LF||
'          "';
wwv_flow_imp.g_varchar2_table(3422) := 'rss", xmlattributes('||wwv_flow.LF||
'             l_rss_version                              as "version"'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(3423) := '    ,''http://purl.org/dc/elements/1.1/''         as "xmlns:dc"'||wwv_flow.LF||
'            ,''http://purl.org/rss/1.0';
wwv_flow_imp.g_varchar2_table(3424) := '/modules/content/'' as "xmlns:content"'||wwv_flow.LF||
'            ,''http://www.w3.org/2005/Atom''              as "x';
wwv_flow_imp.g_varchar2_table(3425) := 'mlns:atom"'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'          ,xmlelement('||wwv_flow.LF||
'            "channel"'||wwv_flow.LF||
'            ,xmlelement('||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3426) := '            "atom:link"'||wwv_flow.LF||
'              ,xmlattributes('||wwv_flow.LF||
'                ''self''                as "re';
wwv_flow_imp.g_varchar2_table(3427) := 'l"'||wwv_flow.LF||
'                ,l_rss_url            as "href"'||wwv_flow.LF||
'                ,blog_util.g_mime_rss as "type"';
wwv_flow_imp.g_varchar2_table(3428) := ''||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xmlforest('||wwv_flow.LF||
'              l_app_name  as "title"'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3429) := '           ,l_home_url as "link"'||wwv_flow.LF||
'              ,l_app_desc as "description"'||wwv_flow.LF||
'              ,l_lang ';
wwv_flow_imp.g_varchar2_table(3430) := '    as "language"'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xmlagg('||wwv_flow.LF||
'              xmlelement('||wwv_flow.LF||
'                "';
wwv_flow_imp.g_varchar2_table(3431) := 'item"'||wwv_flow.LF||
'                ,xmlelement( "title",           posts.post_title )'||wwv_flow.LF||
'                ,xmleleme';
wwv_flow_imp.g_varchar2_table(3432) := 'nt( "dc:creator",      posts.blogger_name )'||wwv_flow.LF||
'                ,xmlelement( "category",        posts.c';
wwv_flow_imp.g_varchar2_table(3433) := 'ategory_title )'||wwv_flow.LF||
'                ,xmlelement( "link",            posts.absolute_url )'||wwv_flow.LF||
'             ';
wwv_flow_imp.g_varchar2_table(3434) := '   ,xmlelement( "description",     posts.post_desc )'||wwv_flow.LF||
'                ,xmlelement( "content:encoded"';
wwv_flow_imp.g_varchar2_table(3435) := ', xmlcdata( posts.body_html ) )'||wwv_flow.LF||
'                ,xmlelement( "pubDate",'||wwv_flow.LF||
'                  to_char(';
wwv_flow_imp.g_varchar2_table(3436) := ''||wwv_flow.LF||
'                    sys_extract_utc( posts.published_on )'||wwv_flow.LF||
'                    ,blog_util.g_rfc_28';
wwv_flow_imp.g_varchar2_table(3437) := '22_date'||wwv_flow.LF||
'                    ,blog_util.g_nls_date_lang'||wwv_flow.LF||
'                  )'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3438) := '             ,xmlelement( "guid", xmlattributes( ''false'' as "isPermaLink" ), posts.post_id )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3439) := '        ) order by posts.published_on desc'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as';
wwv_flow_imp.g_varchar2_table(3440) := ' blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    ,max( posts.published_on ) as max_published'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3441) := '   into l_rss, l_max_published'||wwv_flow.LF||
'    from blog_v_posts_last20 posts'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :=';
wwv_flow_imp.g_varchar2_table(3442) := ''||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribu';
wwv_flow_imp.g_varchar2_table(3443) := 'te_value( ''G_MAX_AGE_RSS'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_last_modified :='||wwv_flow.LF||
'      to_char('||wwv_flow.LF||
'         sys_';
wwv_flow_imp.g_varchar2_table(3444) := 'extract_utc( l_max_published )'||wwv_flow.LF||
'        ,blog_util.g_rfc_2822_date'||wwv_flow.LF||
'        ,blog_util.g_nls_date_la';
wwv_flow_imp.g_varchar2_table(3445) := 'ng'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_rss'||wwv_flow.LF||
'      ,p_mime_';
wwv_flow_imp.g_varchar2_table(3446) := 'type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_var';
wwv_flow_imp.g_varchar2_table(3447) := 'char2( l_cache_control, ''inline; filename="rss.xml"'', l_last_modified  )'||wwv_flow.LF||
'      ,p_charset        =>';
wwv_flow_imp.g_varchar2_table(3448) := ' c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.erro';
wwv_flow_imp.g_varchar2_table(3449) := 'r('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_';
wwv_flow_imp.g_varchar2_table(3450) := 'stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_ht';
wwv_flow_imp.g_varchar2_table(3451) := 'tp_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end rss;'||wwv_flow.LF||
'--------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3452) := '------------------------'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3453) := '------'||wwv_flow.LF||
'  procedure atom('||wwv_flow.LF||
'    p_app_name  in varchar2,'||wwv_flow.LF||
'    p_app_desc  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3454) := ' l_xml           xmltype;'||wwv_flow.LF||
'    l_atom          blob;'||wwv_flow.LF||
'    l_app_id        varchar2(256);'||wwv_flow.LF||
'    l_atom';
wwv_flow_imp.g_varchar2_table(3455) := '_url      varchar2(4000);'||wwv_flow.LF||
'    l_home_url      varchar2(4000);'||wwv_flow.LF||
'    l_app_name      varchar2(4000);';
wwv_flow_imp.g_varchar2_table(3456) := ''||wwv_flow.LF||
'    l_app_desc      varchar2(4000);'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'    l_last_modified varcha';
wwv_flow_imp.g_varchar2_table(3457) := 'r2(256);'||wwv_flow.LF||
'    l_max_published timestamp;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- atom feed URL'||wwv_flow.LF||
'    l_atom_url   := blog_';
wwv_flow_imp.g_varchar2_table(3458) := 'url.get_atom;'||wwv_flow.LF||
'    -- blog name'||wwv_flow.LF||
'    l_app_name := coalesce('||wwv_flow.LF||
'       p_app_name'||wwv_flow.LF||
'      ,blog_util.ge';
wwv_flow_imp.g_varchar2_table(3459) := 't_attribute_value( ''P0_BLOG_APP_NAME'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    -- atom feed description'||wwv_flow.LF||
'    l_app_desc  := co';
wwv_flow_imp.g_varchar2_table(3460) := 'alesce('||wwv_flow.LF||
'       p_app_desc'||wwv_flow.LF||
'      ,blog_util.get_attribute_value( ''P0_BLOG_APP_DESC'' )'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3461) := '-- blog home page absulute URL'||wwv_flow.LF||
'    l_home_url  := blog_url.get_tab('||wwv_flow.LF||
'       p_page       => ''HOME''';
wwv_flow_imp.g_varchar2_table(3462) := ''||wwv_flow.LF||
'      ,p_canonical  => ''YES'''||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- generate atom feed'||wwv_flow.LF||
'    select xmlserialize( content';
wwv_flow_imp.g_varchar2_table(3463) := ''||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "feed", xmlattributes('||wwv_flow.LF||
'          ''http://www.w3.org/2005/Atom'' as "xml';
wwv_flow_imp.g_varchar2_table(3464) := 'ns"'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'        ,xmlelement( "link"'||wwv_flow.LF||
'          ,xmlattributes('||wwv_flow.LF||
'            ''self''          ';
wwv_flow_imp.g_varchar2_table(3465) := '        as "rel"'||wwv_flow.LF||
'            ,l_atom_url             as "href"'||wwv_flow.LF||
'            ,blog_util.g_mime_atom ';
wwv_flow_imp.g_varchar2_table(3466) := ' as "type"'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'        ,xmlforest('||wwv_flow.LF||
'          l_app_name  as "title"'||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(3467) := ' ,l_app_desc as "subtitle"'||wwv_flow.LF||
'          ,l_atom_url as "id"'||wwv_flow.LF||
'          ,to_char('||wwv_flow.LF||
'            sys_extr';
wwv_flow_imp.g_varchar2_table(3468) := 'act_utc( max( posts.published_on ) )'||wwv_flow.LF||
'            ,blog_util.g_iso_8601_date'||wwv_flow.LF||
'            ,blog_util';
wwv_flow_imp.g_varchar2_table(3469) := '.g_nls_date_lang'||wwv_flow.LF||
'          )           as "updated"'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'        ,xmlagg('||wwv_flow.LF||
'          xmlelem';
wwv_flow_imp.g_varchar2_table(3470) := 'ent( "entry"'||wwv_flow.LF||
'            ,xmlelement( "title", posts.post_title )'||wwv_flow.LF||
'            ,xmlelement( "author';
wwv_flow_imp.g_varchar2_table(3471) := '"'||wwv_flow.LF||
'              ,xmlelement( "name", posts.blogger_name )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xmlelement( ';
wwv_flow_imp.g_varchar2_table(3472) := '"category"'||wwv_flow.LF||
'              ,xmlattributes('||wwv_flow.LF||
'                posts.category_title  as "label"'||wwv_flow.LF||
'       ';
wwv_flow_imp.g_varchar2_table(3473) := '         ,posts.category_title as "term"'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xmlelement( "';
wwv_flow_imp.g_varchar2_table(3474) := 'link"'||wwv_flow.LF||
'              ,xmlattributes( posts.absolute_url as "href" )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xml';
wwv_flow_imp.g_varchar2_table(3475) := 'element( "summary", posts.post_desc )'||wwv_flow.LF||
'            ,xmlelement( "content"'||wwv_flow.LF||
'              ,xmlattribu';
wwv_flow_imp.g_varchar2_table(3476) := 'tes( ''html'' as "type" )'||wwv_flow.LF||
'              ,xmlcdata( posts.body_html )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xml';
wwv_flow_imp.g_varchar2_table(3477) := 'element( "updated",'||wwv_flow.LF||
'              to_char('||wwv_flow.LF||
'                sys_extract_utc( posts.published_on )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3478) := '                ,blog_util.g_iso_8601_date'||wwv_flow.LF||
'                ,blog_util.g_nls_date_lang'||wwv_flow.LF||
'            ';
wwv_flow_imp.g_varchar2_table(3479) := '  )'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'            ,xmlelement( "id",  posts.absolute_url )'||wwv_flow.LF||
'          ) order by posts';
wwv_flow_imp.g_varchar2_table(3480) := '.published_on desc'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3481) := '  ,max( posts.published_on ) as max_published'||wwv_flow.LF||
'    into l_atom, l_max_published'||wwv_flow.LF||
'    from blog_v_pos';
wwv_flow_imp.g_varchar2_table(3482) := 'ts_last20 posts'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''';
wwv_flow_imp.g_varchar2_table(3483) := 'max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_RSS'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3484) := 'l_last_modified :='||wwv_flow.LF||
'      to_char('||wwv_flow.LF||
'         sys_extract_utc( l_max_published )'||wwv_flow.LF||
'        ,blog_util.';
wwv_flow_imp.g_varchar2_table(3485) := 'g_rfc_2822_date'||wwv_flow.LF||
'        ,blog_util.g_nls_date_lang'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file(';
wwv_flow_imp.g_varchar2_table(3486) := ''||wwv_flow.LF||
'       p_blob_content   => l_atom'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   =';
wwv_flow_imp.g_varchar2_table(3487) := '> c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_cache_control, ''inline; filename="atom.xm';
wwv_flow_imp.g_varchar2_table(3488) := 'l"'', l_last_modified  )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exce';
wwv_flow_imp.g_varchar2_table(3489) := 'ption'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0';
wwv_flow_imp.g_varchar2_table(3490) := ' => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    )';
wwv_flow_imp.g_varchar2_table(3491) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end atom;'||wwv_flow.LF||
'----';
wwv_flow_imp.g_varchar2_table(3492) := '----------------------------------------------------------------------------'||wwv_flow.LF||
'----------------------';
wwv_flow_imp.g_varchar2_table(3493) := '----------------------------------------------------------'||wwv_flow.LF||
'  procedure rss_xsl('||wwv_flow.LF||
'    p_css_file in ';
wwv_flow_imp.g_varchar2_table(3494) := 'varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           xmltype;'||wwv_flow.LF||
'    l_xsl           blob;'||wwv_flow.LF||
'    l_css_url       va';
wwv_flow_imp.g_varchar2_table(3495) := 'rchar2(1024);'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Generate relaive URL for CSS fi';
wwv_flow_imp.g_varchar2_table(3496) := 'le'||wwv_flow.LF||
'    if p_css_file not like ''http%'''||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      l_css_url := apex_util.host_url( ''APEX_PATH''';
wwv_flow_imp.g_varchar2_table(3497) := ' );'||wwv_flow.LF||
'      l_css_url := substr( l_css_url, instr( l_css_url, ''/'', 1, 3 ) );'||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cs';
wwv_flow_imp.g_varchar2_table(3498) := 's_url := l_css_url || p_css_file;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_xml :='||wwv_flow.LF||
'      xmltype('||wwv_flow.LF||
'        apex_string.format('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3499) := '      p_message => '''||wwv_flow.LF||
'            <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XS';
wwv_flow_imp.g_varchar2_table(3500) := 'L/Transform" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://purl.org/rss/1.0/modu';
wwv_flow_imp.g_varchar2_table(3501) := 'les/content/">'||wwv_flow.LF||
'              <!-- This causes the HTML doctype (<!doctype hmlt>) to be rendered. --';
wwv_flow_imp.g_varchar2_table(3502) := '>'||wwv_flow.LF||
'              <xsl:output method="html" doctype-system="about:legacy-compat" indent="yes" />'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3503) := '           <!-- Start matching at the Channel node within the XML RSS feed. -->'||wwv_flow.LF||
'              <xsl:';
wwv_flow_imp.g_varchar2_table(3504) := 'template match="/rss/channel">'||wwv_flow.LF||
'                <html lang="%s">'||wwv_flow.LF||
'                <head>'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3505) := '        <meta name="viewport" content="width=device-width, initial-scale=1.0" />'||wwv_flow.LF||
'                  ';
wwv_flow_imp.g_varchar2_table(3506) := '<title>'||wwv_flow.LF||
'                    <xsl:value-of select="title" />'||wwv_flow.LF||
'                  </title>'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3507) := '        <link rel="stylesheet" type="text/css" href="%s" />'||wwv_flow.LF||
'                </head>'||wwv_flow.LF||
'              ';
wwv_flow_imp.g_varchar2_table(3508) := '  <body>'||wwv_flow.LF||
'                  <h1><a class="blog-rss--title" href="{ link }"><xsl:value-of select="tit';
wwv_flow_imp.g_varchar2_table(3509) := 'le" /></a></h1>'||wwv_flow.LF||
'                  <h2 class="blog-rss--description"><xsl:value-of select="descripti';
wwv_flow_imp.g_varchar2_table(3510) := 'on" /></h2>'||wwv_flow.LF||
'                  <xsl:for-each select="./item">'||wwv_flow.LF||
'                    <article class="b';
wwv_flow_imp.g_varchar2_table(3511) := 'log-rss--post">'||wwv_flow.LF||
'                      <header>'||wwv_flow.LF||
'                        <h3 class="blog-rss--postHe';
wwv_flow_imp.g_varchar2_table(3512) := 'ader"><a href="{ link }"><xsl:value-of select="title" /></a></h3>'||wwv_flow.LF||
'                      </header>'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3513) := '                      <p class="blog-rss--postBody"><xsl:value-of select="description" /></p>'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3514) := '               </article>'||wwv_flow.LF||
'                  </xsl:for-each>'||wwv_flow.LF||
'                </body>'||wwv_flow.LF||
'             ';
wwv_flow_imp.g_varchar2_table(3515) := '   </html>'||wwv_flow.LF||
'              </xsl:template>'||wwv_flow.LF||
'            </xsl:stylesheet>'''||wwv_flow.LF||
'          ,p0 => apex_app';
wwv_flow_imp.g_varchar2_table(3516) := 'lication.g_browser_language'||wwv_flow.LF||
'          ,p1 => l_css_url'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    select'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3517) := '    xmlserialize('||wwv_flow.LF||
'        content l_xml as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'      ) xsl'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3518) := '   into l_xsl'||wwv_flow.LF||
'    from dual'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p';
wwv_flow_imp.g_varchar2_table(3519) := '_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_RSS_XSL'' )'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3520) := ' )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_xsl'||wwv_flow.LF||
'      ,p_mime_type     ';
wwv_flow_imp.g_varchar2_table(3521) := ' => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_';
wwv_flow_imp.g_varchar2_table(3522) := 'cache_control, ''inline; filename="rss.xsl"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3523) := ''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message ';
wwv_flow_imp.g_varchar2_table(3524) := '=> ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))';
wwv_flow_imp.g_varchar2_table(3525) := ''||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3526) := ' raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end rss_xsl;'||wwv_flow.LF||
'-------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3527) := '-------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedu';
wwv_flow_imp.g_varchar2_table(3528) := 're sitemap_index('||wwv_flow.LF||
'    p_app_id        in varchar2,'||wwv_flow.LF||
'    p_app_page_id   in varchar2,'||wwv_flow.LF||
'    p_process';
wwv_flow_imp.g_varchar2_table(3529) := '_name  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_url           varchar2(4000);'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'    l';
wwv_flow_imp.g_varchar2_table(3530) := '_cache_control varchar2(256);'||wwv_flow.LF||
'    l_build_option  constant varchar2(256) := ''BLOG_FEATURE_SITEMAP'';';
wwv_flow_imp.g_varchar2_table(3531) := ''||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- get url to call sitemaps process'||wwv_flow.LF||
'    l_url := blog_url.get_process;'||wwv_flow.LF||
''||wwv_flow.LF||
'    sele';
wwv_flow_imp.g_varchar2_table(3532) := 'ct xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "sitemapindex",'||wwv_flow.LF||
'        xmlattributes( ''http:';
wwv_flow_imp.g_varchar2_table(3533) := '//www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns" ),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          xmlagg('||wwv_flow.LF||
'            xml';
wwv_flow_imp.g_varchar2_table(3534) := 'element( "sitemap"'||wwv_flow.LF||
'              ,xmlelement( "loc", l_url || t1.process_name'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3535) := '         ) order by t1.execution_sequence'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c';
wwv_flow_imp.g_varchar2_table(3536) := '_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from apex_application_page_proc t1'||wwv_flow.LF||
'    where ';
wwv_flow_imp.g_varchar2_table(3537) := '1 = 1'||wwv_flow.LF||
'      and t1.process_name != p_process_name'||wwv_flow.LF||
'      and t1.application_id = p_app_id'||wwv_flow.LF||
'      an';
wwv_flow_imp.g_varchar2_table(3538) := 'd t1.page_id = p_app_page_id'||wwv_flow.LF||
'      and t1.build_option = l_build_option'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_contr';
wwv_flow_imp.g_varchar2_table(3539) := 'ol :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_a';
wwv_flow_imp.g_varchar2_table(3540) := 'ttribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob';
wwv_flow_imp.g_varchar2_table(3541) := '_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3542) := '    ,p_header_values  => apex_t_varchar2( l_cache_control, ''inline; filename="sitemap-index.xml"'', n';
wwv_flow_imp.g_varchar2_table(3543) := 'ull )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when othe';
wwv_flow_imp.g_varchar2_table(3544) := 'rs'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack';
wwv_flow_imp.g_varchar2_table(3545) := '.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show h';
wwv_flow_imp.g_varchar2_table(3546) := 'ttp error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_index;'||wwv_flow.LF||
'-------------';
wwv_flow_imp.g_varchar2_table(3547) := '-------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(3548) := '-------------------------------------------------'||wwv_flow.LF||
'  procedure sitemap_main('||wwv_flow.LF||
'    p_app_id      in v';
wwv_flow_imp.g_varchar2_table(3549) := 'archar2,'||wwv_flow.LF||
'    p_page_group  in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml   blob;'||wwv_flow.LF||
'    l_cache_control varchar2(';
wwv_flow_imp.g_varchar2_table(3550) := '256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "urlset",'||wwv_flow.LF||
'        x';
wwv_flow_imp.g_varchar2_table(3551) := 'mlattributes( ''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns" ),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          xmla';
wwv_flow_imp.g_varchar2_table(3552) := 'gg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'              ,xmlelement( "loc",'||wwv_flow.LF||
'                blog_url.get_';
wwv_flow_imp.g_varchar2_table(3553) := 'tab('||wwv_flow.LF||
'                   p_page       => v1.page_alias'||wwv_flow.LF||
'                  ,p_canonical  => ''YES'''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3554) := '              )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by v1.page_id'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )';
wwv_flow_imp.g_varchar2_table(3555) := ''||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from apex_applicatio';
wwv_flow_imp.g_varchar2_table(3556) := 'n_pages v1'||wwv_flow.LF||
'    where 1 = 1'||wwv_flow.LF||
'      and v1.application_id = p_app_id'||wwv_flow.LF||
'      and v1.page_group = p_pag';
wwv_flow_imp.g_varchar2_table(3557) := 'e_group'||wwv_flow.LF||
'      and case'||wwv_flow.LF||
'        when v1.build_option is null'||wwv_flow.LF||
'        then apex_application_admin.c';
wwv_flow_imp.g_varchar2_table(3558) := '_build_option_status_include'||wwv_flow.LF||
'        else'||wwv_flow.LF||
'          apex_application_admin.get_build_option_status';
wwv_flow_imp.g_varchar2_table(3559) := '('||wwv_flow.LF||
'             p_application_id    => p_app_id'||wwv_flow.LF||
'            ,p_build_option_name => v1.build_option';
wwv_flow_imp.g_varchar2_table(3560) := ''||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      end = apex_application_admin.c_build_option_status_include'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cach';
wwv_flow_imp.g_varchar2_table(3561) := 'e_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_uti';
wwv_flow_imp.g_varchar2_table(3562) := 'l.get_attribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3563) := ' p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_head';
wwv_flow_imp.g_varchar2_table(3564) := 'ers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_cache_control, ''inline; filename="sitemap-main.xm';
wwv_flow_imp.g_varchar2_table(3565) := 'l"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  whe';
wwv_flow_imp.g_varchar2_table(3566) := 'n others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call';
wwv_flow_imp.g_varchar2_table(3567) := '_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- ';
wwv_flow_imp.g_varchar2_table(3568) := 'show http error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_main;'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(3569) := '------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3570) := '------------------------------------------------------'||wwv_flow.LF||
'  procedure sitemap_posts'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml  ';
wwv_flow_imp.g_varchar2_table(3571) := '         blob;'||wwv_flow.LF||
'    l_cache_control varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3572) := '    xmlelement('||wwv_flow.LF||
'        "urlset",'||wwv_flow.LF||
'        xmlattributes(''http://www.sitemaps.org/schemas/sitemap/0';
wwv_flow_imp.g_varchar2_table(3573) := '.9'' as "xmlns"),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'          xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'              ,xmlele';
wwv_flow_imp.g_varchar2_table(3574) := 'ment( "loc",'||wwv_flow.LF||
'                blog_url.get_post('||wwv_flow.LF||
'                   p_post_id    => posts.post_id'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3575) := '                  ,p_canonical  => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'              ,xmlelem';
wwv_flow_imp.g_varchar2_table(3576) := 'ent( "lastmod",'||wwv_flow.LF||
'                to_char('||wwv_flow.LF||
'                  sys_extract_utc('||wwv_flow.LF||
'                    g';
wwv_flow_imp.g_varchar2_table(3577) := 'reatest( posts.published_on, posts.changed_on )'||wwv_flow.LF||
'                  )'||wwv_flow.LF||
'                  ,blog_util.g';
wwv_flow_imp.g_varchar2_table(3578) := '_iso_8601_date'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by posts.published_on desc'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3579) := '          )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into ';
wwv_flow_imp.g_varchar2_table(3580) := 'l_xml'||wwv_flow.LF||
'    from blog_v_posts posts'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3581) := '     p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_SITEMAP'' )';
wwv_flow_imp.g_varchar2_table(3582) := ''||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_typ';
wwv_flow_imp.g_varchar2_table(3583) := 'e      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varcha';
wwv_flow_imp.g_varchar2_table(3584) := 'r2( l_cache_control, ''inline; filename="sitemap-posts.xml"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_ch';
wwv_flow_imp.g_varchar2_table(3585) := 'ar_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3586) := '      p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack';
wwv_flow_imp.g_varchar2_table(3587) := '.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http_er';
wwv_flow_imp.g_varchar2_table(3588) := 'ror( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_posts;'||wwv_flow.LF||
'---------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3589) := '-----------------------------'||wwv_flow.LF||
'---------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3590) := '-----------'||wwv_flow.LF||
'  procedure sitemap_categories'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'    l_cache_control va';
wwv_flow_imp.g_varchar2_table(3591) := 'rchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "urlset",'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3592) := '      xmlattributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns"),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(3593) := ' xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'              ,xmlelement( "loc",'||wwv_flow.LF||
'                blog_url';
wwv_flow_imp.g_varchar2_table(3594) := '.get_category('||wwv_flow.LF||
'                   p_category_id  => cat.category_id'||wwv_flow.LF||
'                  ,p_canonical';
wwv_flow_imp.g_varchar2_table(3595) := '    => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'              ,xmlelement( "lastmod",'||wwv_flow.LF||
'           ';
wwv_flow_imp.g_varchar2_table(3596) := '     to_char('||wwv_flow.LF||
'                  sys_extract_utc( cat.changed_on )'||wwv_flow.LF||
'                  ,blog_util.g_i';
wwv_flow_imp.g_varchar2_table(3597) := 'so_8601_date'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by cat.display_seq desc'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3598) := '     )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml';
wwv_flow_imp.g_varchar2_table(3599) := ''||wwv_flow.LF||
'    from blog_v_categories cat'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3600) := '   p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3601) := '     )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_type ';
wwv_flow_imp.g_varchar2_table(3602) := '     => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2';
wwv_flow_imp.g_varchar2_table(3603) := '( l_cache_control, ''inline; filename="sitemap-categories.xml"'', null )'||wwv_flow.LF||
'      ,p_charset        => c';
wwv_flow_imp.g_varchar2_table(3604) := '_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error(';
wwv_flow_imp.g_varchar2_table(3605) := ''||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_st';
wwv_flow_imp.g_varchar2_table(3606) := 'ack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http';
wwv_flow_imp.g_varchar2_table(3607) := '_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_categories;'||wwv_flow.LF||
'-------------------------------------------';
wwv_flow_imp.g_varchar2_table(3608) := '-------------------------------------'||wwv_flow.LF||
'-------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3609) := '-------------------'||wwv_flow.LF||
'  procedure sitemap_archives'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'    l_cache_cont';
wwv_flow_imp.g_varchar2_table(3610) := 'rol varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "urlset';
wwv_flow_imp.g_varchar2_table(3611) := '",'||wwv_flow.LF||
'        xmlattributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns"),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3612) := '       xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'              ,xmlelement( "loc",'||wwv_flow.LF||
'                bl';
wwv_flow_imp.g_varchar2_table(3613) := 'og_url.get_archive('||wwv_flow.LF||
'                   p_archive_id => arc.archive_year'||wwv_flow.LF||
'                  ,p_canon';
wwv_flow_imp.g_varchar2_table(3614) := 'ical  => ''YES'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'              ,xmlelement( "lastmod",'||wwv_flow.LF||
'         ';
wwv_flow_imp.g_varchar2_table(3615) := '       to_char('||wwv_flow.LF||
'                  sys_extract_utc( arc.changed_on )'||wwv_flow.LF||
'                  ,blog_util.g';
wwv_flow_imp.g_varchar2_table(3616) := '_iso_8601_date'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by arc.archive_year desc'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3617) := '        )'||wwv_flow.LF||
'        )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_';
wwv_flow_imp.g_varchar2_table(3618) := 'xml'||wwv_flow.LF||
'    from blog_v_archive_year arc'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3619) := '        p_message => ''max-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_SITEMAP''';
wwv_flow_imp.g_varchar2_table(3620) := ' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_';
wwv_flow_imp.g_varchar2_table(3621) := 'type      => c_mime_xml'||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_var';
wwv_flow_imp.g_varchar2_table(3622) := 'char2( l_cache_control, ''inline; filename="sitemap-archives.xml"'', null )'||wwv_flow.LF||
'      ,p_charset        =';
wwv_flow_imp.g_varchar2_table(3623) := '> c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  -- handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.err';
wwv_flow_imp.g_varchar2_table(3624) := 'or('||wwv_flow.LF||
'       p_message => ''%s Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call';
wwv_flow_imp.g_varchar2_table(3625) := '_stack.subprogram(1))'||wwv_flow.LF||
'      ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_h';
wwv_flow_imp.g_varchar2_table(3626) := 'ttp_error( 400 );'||wwv_flow.LF||
'    raise;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_archives;'||wwv_flow.LF||
'------------------------------------------';
wwv_flow_imp.g_varchar2_table(3627) := '--------------------------------------'||wwv_flow.LF||
'------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3628) := '--------------------'||wwv_flow.LF||
'  procedure sitemap_tags'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_xml           blob;'||wwv_flow.LF||
'    l_cache_control';
wwv_flow_imp.g_varchar2_table(3629) := ' varchar2(256);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    select xmlserialize( document'||wwv_flow.LF||
'      xmlelement('||wwv_flow.LF||
'        "urlset",';
wwv_flow_imp.g_varchar2_table(3630) := ''||wwv_flow.LF||
'        xmlattributes(''http://www.sitemaps.org/schemas/sitemap/0.9'' as "xmlns"),'||wwv_flow.LF||
'        ('||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3631) := '    xmlagg('||wwv_flow.LF||
'            xmlelement( "url"'||wwv_flow.LF||
'              ,xmlelement( "loc",'||wwv_flow.LF||
'                blog_';
wwv_flow_imp.g_varchar2_table(3632) := 'url.get_tag('||wwv_flow.LF||
'                   p_tag_id     => tags.tag_id'||wwv_flow.LF||
'                  ,p_canonical  => ''YE';
wwv_flow_imp.g_varchar2_table(3633) := 'S'''||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'              ,xmlelement( "lastmod",'||wwv_flow.LF||
'                to_ch';
wwv_flow_imp.g_varchar2_table(3634) := 'ar('||wwv_flow.LF||
'                  sys_extract_utc( tags.changed_on )'||wwv_flow.LF||
'                  ,blog_util.g_iso_8601_d';
wwv_flow_imp.g_varchar2_table(3635) := 'ate'||wwv_flow.LF||
'                )'||wwv_flow.LF||
'              )'||wwv_flow.LF||
'            ) order by tags.changed_on'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3636) := '  )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      as blob encoding c_char_set indent size = 2'||wwv_flow.LF||
'    )'||wwv_flow.LF||
'    into l_xml'||wwv_flow.LF||
'    from blo';
wwv_flow_imp.g_varchar2_table(3637) := 'g_v_tags tags'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    l_cache_control :='||wwv_flow.LF||
'      apex_string.format('||wwv_flow.LF||
'         p_message => ''ma';
wwv_flow_imp.g_varchar2_table(3638) := 'x-age=%s'''||wwv_flow.LF||
'        ,p0 => blog_util.get_attribute_value( ''G_MAX_AGE_SITEMAP'' )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3639) := '  blog_util.download_file('||wwv_flow.LF||
'       p_blob_content   => l_xml'||wwv_flow.LF||
'      ,p_mime_type      => c_mime_xml';
wwv_flow_imp.g_varchar2_table(3640) := ''||wwv_flow.LF||
'      ,p_header_names   => c_headers'||wwv_flow.LF||
'      ,p_header_values  => apex_t_varchar2( l_cache_control, ';
wwv_flow_imp.g_varchar2_table(3641) := '''inline; filename="sitemap-tags.xml"'', null )'||wwv_flow.LF||
'      ,p_charset        => c_char_set'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'  --';
wwv_flow_imp.g_varchar2_table(3642) := ' handle errors'||wwv_flow.LF||
'  exception'||wwv_flow.LF||
'  when others'||wwv_flow.LF||
'  then'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.error('||wwv_flow.LF||
'       p_message => ''%s';
wwv_flow_imp.g_varchar2_table(3643) := ' Error: %s'''||wwv_flow.LF||
'      ,p0 => utl_call_stack.concatenate_subprogram(utl_call_stack.subprogram(1))'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3644) := ' ,p1 => sqlerrm'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- show http error'||wwv_flow.LF||
'    blog_util.raise_http_error( 400 );'||wwv_flow.LF||
'    raise';
wwv_flow_imp.g_varchar2_table(3645) := ';'||wwv_flow.LF||
''||wwv_flow.LF||
'  end sitemap_tags;'||wwv_flow.LF||
'--------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3646) := '------'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_';
wwv_flow_imp.g_varchar2_table(3647) := 'XML";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace package body "BLOG_AI"'||wwv_flow.LF||
'as'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(3648) := '------------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3649) := '------------------'||wwv_flow.LF||
'-- Private constants and variables'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(3650) := '------------------------------------'||wwv_flow.LF||
'--------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3651) := '------------------'||wwv_flow.LF||
''||wwv_flow.LF||
'  type str_t is table of varchar2( 2000 ) index by varchar2( 60 );'||wwv_flow.LF||
'  param_t ';
wwv_flow_imp.g_varchar2_table(3652) := 'str_t;'||wwv_flow.LF||
''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(3653) := '------------------------------------------------------------------------'||wwv_flow.LF||
'-- Private procedures and ';
wwv_flow_imp.g_varchar2_table(3654) := 'functions'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3655) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure init_params'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3656) := '  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- set valus for session'||wwv_flow.LF||
'    param_t( ''lang_ai_static_id'' ) := ''BLOG_LANGUAGE_';
wwv_flow_imp.g_varchar2_table(3657) := 'AI'';'||wwv_flow.LF||
'    param_t( ''gen_ai_static_id'' ) := ''BLOG_OPEN_AI_API'';'||wwv_flow.LF||
'    param_t( ''gen_ai_credential_stat';
wwv_flow_imp.g_varchar2_table(3658) := 'ic_id'' ) := ''BLOG_OPEN_AI_API_KEY'';'||wwv_flow.LF||
'    param_t( ''lang_ai_build_option'' ) := ''BLOG_FEATURE_LANGUAGE';
wwv_flow_imp.g_varchar2_table(3659) := '_AI'';'||wwv_flow.LF||
'    param_t( ''gen_ai_build_option'' ) := ''BLOG_FEATURE_GENERATIVE_AI'';'||wwv_flow.LF||
'    param_t( ''gen_ai_g';
wwv_flow_imp.g_varchar2_table(3660) := 'enerate_msg'' ) := ''BLOG_AI_GENERATE_MESSAGE'';'||wwv_flow.LF||
'    param_t( ''gen_ai_generate_prompt_msg'' ) := ''BLOG_';
wwv_flow_imp.g_varchar2_table(3661) := 'AI_GENERATE_PROMPT'';'||wwv_flow.LF||
'    param_t( ''lang_ai_compartment_param_name'') := ''G_OCI_LANG_AI_COMPARTMENT_O';
wwv_flow_imp.g_varchar2_table(3662) := 'CID'';'||wwv_flow.LF||
'    param_t( ''lang_ai_compartment_ocid'' ) := blog_util.get_attribute_value( param_t( ''lang_ai';
wwv_flow_imp.g_varchar2_table(3663) := '_compartment_param_name'' ) );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Debug parameters'||wwv_flow.LF||
'    apex_debug.info( ''Language AI remote s';
wwv_flow_imp.g_varchar2_table(3664) := 'erver static id: %s'', param_t( ''lang_ai_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI service';
wwv_flow_imp.g_varchar2_table(3665) := ' static id: %s'', param_t( ''gen_ai_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI credential st';
wwv_flow_imp.g_varchar2_table(3666) := 'atic id: %s'', param_t( ''gen_ai_credential_static_id'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Language AI build o';
wwv_flow_imp.g_varchar2_table(3667) := 'ption name: %s'', param_t( ''lang_ai_build_option'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI build opt';
wwv_flow_imp.g_varchar2_table(3668) := 'ion name: %s'', param_t( ''gen_ai_build_option'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI generate mes';
wwv_flow_imp.g_varchar2_table(3669) := 'sage: %s'', param_t( ''gen_ai_generate_msg'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Generative AI generate prompt ';
wwv_flow_imp.g_varchar2_table(3670) := 'message: %s'', param_t( ''gen_ai_generate_prompt_msg'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Language AI comparme';
wwv_flow_imp.g_varchar2_table(3671) := 'nt parameter name : %s'', param_t( ''lang_ai_compartment_param_name'' ) );'||wwv_flow.LF||
'    apex_debug.info( ''Langu';
wwv_flow_imp.g_varchar2_table(3672) := 'age AI comparment OCID : %s'', param_t( ''lang_ai_compartment_ocid'') );'||wwv_flow.LF||
''||wwv_flow.LF||
'  end init_params;'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3673) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(3674) := '-------------------------------------------------------'||wwv_flow.LF||
'  procedure get_sentiments'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_com';
wwv_flow_imp.g_varchar2_table(3675) := 'partnet_id varchar2(256);'||wwv_flow.LF||
'    l_document      clob;'||wwv_flow.LF||
'    l_params        apex_exec.t_parameters;'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3676) := ' begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Loop through comments that have not yet been analyzed'||wwv_flow.LF||
'    for c1 in ('||wwv_flow.LF||
'      with ';
wwv_flow_imp.g_varchar2_table(3677) := 'q1 as('||wwv_flow.LF||
'        select'||wwv_flow.LF||
'          id'||wwv_flow.LF||
'        , v1.body_html'||wwv_flow.LF||
'        , mod( rownum, floor( count(1)';
wwv_flow_imp.g_varchar2_table(3678) := ' over() / 5 ) ) as batch_group'||wwv_flow.LF||
'        from blog_v_all_comments v1'||wwv_flow.LF||
'        where 1 = 1'||wwv_flow.LF||
'          ';
wwv_flow_imp.g_varchar2_table(3679) := 'and sentiment is null'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'      select'||wwv_flow.LF||
'        json_arrayagg('||wwv_flow.LF||
'          json_object('||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3680) := '      ''key''   is blog_util.int_to_vc2( q1.id ),'||wwv_flow.LF||
'            ''text''  is blog_comment.plain_text( q1.';
wwv_flow_imp.g_varchar2_table(3681) := 'body_html )'||wwv_flow.LF||
'          ) returning clob'||wwv_flow.LF||
'        ) as document'||wwv_flow.LF||
'      from q1'||wwv_flow.LF||
'      group by'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(3682) := '   q1.batch_group'||wwv_flow.LF||
'    ) loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Set attributes for the language AI request'||wwv_flow.LF||
'      apex_exe';
wwv_flow_imp.g_varchar2_table(3683) := 'c.add_parameter( l_params, ''compartmentId'', param_t( ''lang_ai_compartment_ocid'') );'||wwv_flow.LF||
'      apex_exec';
wwv_flow_imp.g_varchar2_table(3684) := '.add_parameter( l_params, ''documents'', c1.document );'||wwv_flow.LF||
'      apex_exec.add_parameter( l_params, ''lev';
wwv_flow_imp.g_varchar2_table(3685) := 'el'', ''SENTENCE'' );'||wwv_flow.LF||
'      apex_exec.add_parameter( l_params, ''languageCode'', ''en'' );'||wwv_flow.LF||
'      apex_exe';
wwv_flow_imp.g_varchar2_table(3686) := 'c.add_parameter( l_params, ''batchDocumentService'', ''batchDetectLanguageSentiments'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Ca';
wwv_flow_imp.g_varchar2_table(3687) := 'll language AI to analyze sentiment'||wwv_flow.LF||
'      apex_exec.execute_rest_source('||wwv_flow.LF||
'        p_static_id      ';
wwv_flow_imp.g_varchar2_table(3688) := '     => param_t( ''lang_ai_module_static_id'' ),'||wwv_flow.LF||
'        p_operation_static_id => ''batch_document'','||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3689) := '        p_parameters          => l_params'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Retrieve response body'||wwv_flow.LF||
'      l_docu';
wwv_flow_imp.g_varchar2_table(3690) := 'ment := apex_exec.get_parameter_clob( l_params, ''response_body'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Insert response JSON ';
wwv_flow_imp.g_varchar2_table(3691) := 'into the database'||wwv_flow.LF||
'      merge_sentiment('||wwv_flow.LF||
'        p_language  => ''en'''||wwv_flow.LF||
'      , p_documents => l_doc';
wwv_flow_imp.g_varchar2_table(3692) := 'ument'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'      dbms_session.sleep( 1 );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_sentiments;'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3693) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(3694) := '-------------------------------------------------------'||wwv_flow.LF||
'-- Global functions and procedures'||wwv_flow.LF||
'-------';
wwv_flow_imp.g_varchar2_table(3695) := '-------------------------------------------------------------------------'||wwv_flow.LF||
'-------------------------';
wwv_flow_imp.g_varchar2_table(3696) := '-------------------------------------------------------'||wwv_flow.LF||
'  function get_param_value('||wwv_flow.LF||
'    p_param_na';
wwv_flow_imp.g_varchar2_table(3697) := 'me in varchar2'||wwv_flow.LF||
'  ) return varchar2'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
'    return param_t( p_param_name );'||wwv_flow.LF||
'  end get_p';
wwv_flow_imp.g_varchar2_table(3698) := 'aram_value;'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(3699) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure set_lang_ai';
wwv_flow_imp.g_varchar2_table(3700) := '('||wwv_flow.LF||
'    p_compartment_id  in varchar2,'||wwv_flow.LF||
'    p_base_url        in varchar2,'||wwv_flow.LF||
'    p_build_status    in ';
wwv_flow_imp.g_varchar2_table(3701) := 'varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_attributes  apex_t_varchar2;'||wwv_flow.LF||
'    l_base_url    varchar2(2000);'||wwv_flow.LF||
'  begin';
wwv_flow_imp.g_varchar2_table(3702) := ''||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Set buid option %s status: %s'', param_t( ''lang_ai_build_option'' ), p_build_';
wwv_flow_imp.g_varchar2_table(3703) := 'status );'||wwv_flow.LF||
'    -- Set build option status for the language AI feature'||wwv_flow.LF||
'    blog_admin.update_feature';
wwv_flow_imp.g_varchar2_table(3704) := '('||wwv_flow.LF||
'      p_build_option_name => param_t( ''lang_ai_build_option'' )'||wwv_flow.LF||
'    , p_build_status      => p_bu';
wwv_flow_imp.g_varchar2_table(3705) := 'ild_status'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- If build option status is INCLUDE'||wwv_flow.LF||
'    if p_build_status = apex_applica';
wwv_flow_imp.g_varchar2_table(3706) := 'tion_admin.c_build_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set compartment OCID: ';
wwv_flow_imp.g_varchar2_table(3707) := '%s'', p_compartment_id );'||wwv_flow.LF||
'      -- Set attribute name and value'||wwv_flow.LF||
'      apex_string.plist_push( l_att';
wwv_flow_imp.g_varchar2_table(3708) := 'ributes, param_t( ''lang_ai_compartment_param_name'' ), p_compartment_id );'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Update attribu';
wwv_flow_imp.g_varchar2_table(3709) := 'te'||wwv_flow.LF||
'      blog_admin.set_attribute_value('||wwv_flow.LF||
'        p_attribute_list => l_attributes'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3710) := '   l_base_url := rtrim( p_base_url, ''/'' ) || ''/'';'||wwv_flow.LF||
''||wwv_flow.LF||
'      apex_debug.info( ''Set remote server %s: %';
wwv_flow_imp.g_varchar2_table(3711) := 's'', param_t( ''lang_ai_static_id'' ), l_base_url );'||wwv_flow.LF||
'      -- Set remote server URL'||wwv_flow.LF||
'      apex_applic';
wwv_flow_imp.g_varchar2_table(3712) := 'ation_admin.set_remote_server('||wwv_flow.LF||
'        p_static_id => param_t( ''lang_ai_static_id'' )'||wwv_flow.LF||
'      , p_bas';
wwv_flow_imp.g_varchar2_table(3713) := 'e_url  => l_base_url'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_lang_ai;'||wwv_flow.LF||
'-------------------------------';
wwv_flow_imp.g_varchar2_table(3714) := '-------------------------------------------------'||wwv_flow.LF||
'-------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3715) := '-------------------------------'||wwv_flow.LF||
'  procedure set_gen_ai('||wwv_flow.LF||
'    p_build_status    in varchar2,'||wwv_flow.LF||
'    p_';
wwv_flow_imp.g_varchar2_table(3716) := 'api_key         in varchar2,'||wwv_flow.LF||
'    p_base_url        in varchar2,'||wwv_flow.LF||
'    p_ai_model_name   in varchar2,';
wwv_flow_imp.g_varchar2_table(3717) := ''||wwv_flow.LF||
'    p_ai_http_headers in varchar2,'||wwv_flow.LF||
'    p_ai_attributes   in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_base_url  ';
wwv_flow_imp.g_varchar2_table(3718) := '  varchar2(2000);'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Set buid option %s status: %s'', param_t( ''gen_ai';
wwv_flow_imp.g_varchar2_table(3719) := '_build_option'' ), p_build_status );'||wwv_flow.LF||
'    -- Set build option status for the generative AI feature'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(3720) := '   blog_admin.update_feature('||wwv_flow.LF||
'      p_build_option_name => param_t( ''gen_ai_build_option'' )'||wwv_flow.LF||
'    , ';
wwv_flow_imp.g_varchar2_table(3721) := 'p_build_status      => p_build_status'||wwv_flow.LF||
'    );'||wwv_flow.LF||
''||wwv_flow.LF||
'    if p_build_status = apex_application_admin.c_bu';
wwv_flow_imp.g_varchar2_table(3722) := 'ild_option_status_include'||wwv_flow.LF||
'    then'||wwv_flow.LF||
'      -- Update credential if new API key is provided'||wwv_flow.LF||
'      if';
wwv_flow_imp.g_varchar2_table(3723) := ' p_api_key is not null'||wwv_flow.LF||
'      then'||wwv_flow.LF||
'        apex_credential.set_persistent_credentials('||wwv_flow.LF||
'          p';
wwv_flow_imp.g_varchar2_table(3724) := '_credential_static_id  => param_t( ''gen_ai_credential_static_id'' )'||wwv_flow.LF||
'        , p_key   => ''Authorizat';
wwv_flow_imp.g_varchar2_table(3725) := 'ion'''||wwv_flow.LF||
'        , p_value =>'||wwv_flow.LF||
'            apex_string.format('||wwv_flow.LF||
'              p_message => ''Bearer %s''';
wwv_flow_imp.g_varchar2_table(3726) := ''||wwv_flow.LF||
'            , p0 => p_api_key'||wwv_flow.LF||
'            )'||wwv_flow.LF||
'        );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'      l_base_url := rtri';
wwv_flow_imp.g_varchar2_table(3727) := 'm( p_base_url, ''/'' ) || ''/'';'||wwv_flow.LF||
'      -- Update remote server'||wwv_flow.LF||
'      apex_application_admin.set_remote';
wwv_flow_imp.g_varchar2_table(3728) := '_server('||wwv_flow.LF||
'        p_static_id       => param_t( ''gen_ai_static_id'' )'||wwv_flow.LF||
'      , p_base_url        => p';
wwv_flow_imp.g_varchar2_table(3729) := '_base_url'||wwv_flow.LF||
'      , p_ai_model_name   => p_ai_model_name'||wwv_flow.LF||
'      , p_ai_http_headers => p_ai_http_head';
wwv_flow_imp.g_varchar2_table(3730) := 'ers'||wwv_flow.LF||
'      , p_ai_attributes   => p_ai_attributes'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    end if;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end set_gen_ai;'||wwv_flow.LF||
'---';
wwv_flow_imp.g_varchar2_table(3731) := '-----------------------------------------------------------------------------'||wwv_flow.LF||
'---------------------';
wwv_flow_imp.g_varchar2_table(3732) := '-----------------------------------------------------------'||wwv_flow.LF||
'  procedure gen_ai_chat('||wwv_flow.LF||
'    p_post   ';
wwv_flow_imp.g_varchar2_table(3733) := '       in varchar2,'||wwv_flow.LF||
'    p_system_prompt in varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_messages  apex_ai.t_chat_mess';
wwv_flow_imp.g_varchar2_table(3734) := 'ages := apex_ai.c_chat_messages;'||wwv_flow.LF||
'    l_response  clob;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Prepare user message for ';
wwv_flow_imp.g_varchar2_table(3735) := 'AI chat'||wwv_flow.LF||
'    l_messages(1).chat_role := ''user'';'||wwv_flow.LF||
'    l_messages(1).message :='||wwv_flow.LF||
'      apex_lang.get_m';
wwv_flow_imp.g_varchar2_table(3736) := 'essage('||wwv_flow.LF||
'        p_name    => param_t( ''gen_ai_generate_msg'' )'||wwv_flow.LF||
'      , p_params  =>'||wwv_flow.LF||
'          apex';
wwv_flow_imp.g_varchar2_table(3737) := '_t_varchar2 ('||wwv_flow.LF||
'            ''post'''||wwv_flow.LF||
'          , substr( apex_escape.striphtml( p_post ), 1, 32000 )'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3738) := '          )'||wwv_flow.LF||
'      )'||wwv_flow.LF||
'    ;'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Generate AI response using AI service'||wwv_flow.LF||
'    l_response :='||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3739) := '  apex_ai.chat('||wwv_flow.LF||
'        p_service_static_id => param_t( ''gen_ai_static_id'' )'||wwv_flow.LF||
'      , p_messages   ';
wwv_flow_imp.g_varchar2_table(3740) := '       => l_messages'||wwv_flow.LF||
'      , p_prompt            =>'||wwv_flow.LF||
'          apex_lang.get_message('||wwv_flow.LF||
'            ';
wwv_flow_imp.g_varchar2_table(3741) := 'p_name => param_t( ''gen_ai_generate_prompt_msg'' )'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      , p_system_prompt     =>'||wwv_flow.LF||
'    ';
wwv_flow_imp.g_varchar2_table(3742) := '      apex_lang.get_message('||wwv_flow.LF||
'            p_name => p_system_prompt'||wwv_flow.LF||
'          )'||wwv_flow.LF||
'      );'||wwv_flow.LF||
''||wwv_flow.LF||
'    ap';
wwv_flow_imp.g_varchar2_table(3743) := 'ex_debug.info( ''AI generated content: %s'', l_response );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Write HTTP JSON header and respon';
wwv_flow_imp.g_varchar2_table(3744) := 'se'||wwv_flow.LF||
'    apex_plugin_util.print_json_http_header;'||wwv_flow.LF||
'    apex_json.open_object;'||wwv_flow.LF||
'    apex_json.write( ''';
wwv_flow_imp.g_varchar2_table(3745) := 'response'', l_response );'||wwv_flow.LF||
'    apex_json.close_all;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end gen_ai_chat;'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3746) := '------------------------------------------------------'||wwv_flow.LF||
'--------------------------------------------';
wwv_flow_imp.g_varchar2_table(3747) := '------------------------------------'||wwv_flow.LF||
'  procedure merge_sentiment('||wwv_flow.LF||
'    p_language  in varchar2,'||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3748) := '  p_documents in clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_comment_id      number;'||wwv_flow.LF||
'    l_sentiment_json  varchar2(3270';
wwv_flow_imp.g_varchar2_table(3749) := '0);'||wwv_flow.LF||
'    l_json_documents  json_array_t;'||wwv_flow.LF||
'    l_json_document   json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_';
wwv_flow_imp.g_varchar2_table(3750) := 'debug.info( ''Input JSON document: %s'', p_documents );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Parse JSON document'||wwv_flow.LF||
'    l_json_docu';
wwv_flow_imp.g_varchar2_table(3751) := 'ment := json_object_t.parse( p_documents );'||wwv_flow.LF||
'    -- Retrieve the "documents" array'||wwv_flow.LF||
'    l_json_docum';
wwv_flow_imp.g_varchar2_table(3752) := 'ents := l_json_document.get_array( ''documents'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Loop through each document in the array';
wwv_flow_imp.g_varchar2_table(3753) := ''||wwv_flow.LF||
'    for i in 0 .. l_json_documents.get_size() - 1 loop'||wwv_flow.LF||
''||wwv_flow.LF||
'      -- Extract document details'||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(3754) := 'l_json_document := json_object_t( l_json_documents.get(i) );'||wwv_flow.LF||
'      l_comment_id := to_number( l_jso';
wwv_flow_imp.g_varchar2_table(3755) := 'n_document.get_string( ''key'' ) );'||wwv_flow.LF||
'      l_sentiment_json := l_json_document.stringify();'||wwv_flow.LF||
''||wwv_flow.LF||
'      -';
wwv_flow_imp.g_varchar2_table(3756) := '- Merge sentiment data into the database'||wwv_flow.LF||
'      merge into blog_comment_sentiments t1'||wwv_flow.LF||
'      using d';
wwv_flow_imp.g_varchar2_table(3757) := 'ual on ( t1.comment_id = l_comment_id )'||wwv_flow.LF||
'      when not matched then'||wwv_flow.LF||
'        insert( comment_id, or';
wwv_flow_imp.g_varchar2_table(3758) := 'iginal_language, sentiment_json )'||wwv_flow.LF||
'        values( l_comment_id, p_language, l_sentiment_json )'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(3759) := '   when matched then'||wwv_flow.LF||
'        update set sentiment_json = l_sentiment_json;'||wwv_flow.LF||
''||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  en';
wwv_flow_imp.g_varchar2_table(3760) := 'd merge_sentiment;'||wwv_flow.LF||
'--------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3761) := ''||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'  procedure get_';
wwv_flow_imp.g_varchar2_table(3762) := 'lang_code('||wwv_flow.LF||
'    p_documents in clob,'||wwv_flow.LF||
'    p_lang_code out nocopy varchar2'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_temp_sco';
wwv_flow_imp.g_varchar2_table(3763) := 're      number;'||wwv_flow.LF||
'    l_score           number := -999;'||wwv_flow.LF||
'    l_json_documents  json_array_t;'||wwv_flow.LF||
'    l_j';
wwv_flow_imp.g_varchar2_table(3764) := 'son_document   json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Input JSON document: %s'', p_document';
wwv_flow_imp.g_varchar2_table(3765) := 's );'||wwv_flow.LF||
''||wwv_flow.LF||
'    p_lang_code := ''en''; -- Default language code'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Parse JSON document'||wwv_flow.LF||
'    l_json_';
wwv_flow_imp.g_varchar2_table(3766) := 'document := json_object_t.parse( p_documents );'||wwv_flow.LF||
'    -- Retrieve the "documents" array'||wwv_flow.LF||
'    l_json_d';
wwv_flow_imp.g_varchar2_table(3767) := 'ocuments := l_json_document.get_array( ''documents'' );'||wwv_flow.LF||
'    -- Extract the first document'||wwv_flow.LF||
'    l_json';
wwv_flow_imp.g_varchar2_table(3768) := '_document := json_object_t( l_json_documents.get(0) );'||wwv_flow.LF||
'    -- Retrieve the "languages" array'||wwv_flow.LF||
'    l';
wwv_flow_imp.g_varchar2_table(3769) := '_json_documents := l_json_document.get_array( ''languages'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Loop through languages to fin';
wwv_flow_imp.g_varchar2_table(3770) := 'd the highest score'||wwv_flow.LF||
'    for i in 0 .. l_json_documents.get_size() - 1 loop'||wwv_flow.LF||
'      l_json_document :';
wwv_flow_imp.g_varchar2_table(3771) := '= json_object_t( l_json_documents.get(i) );'||wwv_flow.LF||
'      l_temp_score := l_json_document.get_number( ''scor';
wwv_flow_imp.g_varchar2_table(3772) := 'e'' );'||wwv_flow.LF||
'      if l_temp_score > l_score then'||wwv_flow.LF||
'        l_score := l_temp_score;'||wwv_flow.LF||
'        p_lang_code :';
wwv_flow_imp.g_varchar2_table(3773) := '= l_json_document.get_string( ''code'' );'||wwv_flow.LF||
'      end if;'||wwv_flow.LF||
'    end loop;'||wwv_flow.LF||
''||wwv_flow.LF||
'  end get_lang_code;'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(3774) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'-----------------------';
wwv_flow_imp.g_varchar2_table(3775) := '---------------------------------------------------------'||wwv_flow.LF||
'  procedure get_translation('||wwv_flow.LF||
'    p_docum';
wwv_flow_imp.g_varchar2_table(3776) := 'ents   in clob,'||wwv_flow.LF||
'    p_translation out nocopy clob'||wwv_flow.LF||
'  )'||wwv_flow.LF||
'  as'||wwv_flow.LF||
'    l_json_documents  json_array_t;'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3777) := '    l_json_document   json_object_t;'||wwv_flow.LF||
'  begin'||wwv_flow.LF||
''||wwv_flow.LF||
'    apex_debug.info( ''Input JSON: %s'', p_documents ';
wwv_flow_imp.g_varchar2_table(3778) := ');'||wwv_flow.LF||
''||wwv_flow.LF||
'    -- Parse JSON document'||wwv_flow.LF||
'    l_json_document := json_object_t.parse( p_documents );'||wwv_flow.LF||
'    --';
wwv_flow_imp.g_varchar2_table(3779) := ' Retrieve the "documents" array'||wwv_flow.LF||
'    l_json_documents := l_json_document.get_array( ''documents'' );'||wwv_flow.LF||
'';
wwv_flow_imp.g_varchar2_table(3780) := '    -- Extract the translated text from the first document'||wwv_flow.LF||
'    l_json_document := json_object_t( l_';
wwv_flow_imp.g_varchar2_table(3781) := 'json_documents.get(0) );'||wwv_flow.LF||
'    p_translation := l_json_document.get_string( ''translatedText'' );'||wwv_flow.LF||
''||wwv_flow.LF||
'  ';
wwv_flow_imp.g_varchar2_table(3782) := 'end get_translation;'||wwv_flow.LF||
'------------------------------------------------------------------------------';
wwv_flow_imp.g_varchar2_table(3783) := '--'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-- Package ini';
wwv_flow_imp.g_varchar2_table(3784) := 'tialization'||wwv_flow.LF||
'--------------------------------------------------------------------------------'||wwv_flow.LF||
'-----';
wwv_flow_imp.g_varchar2_table(3785) := '---------------------------------------------------------------------------'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  -- initialize ';
wwv_flow_imp.g_varchar2_table(3786) := 'parameters'||wwv_flow.LF||
'  apex_debug.info( ''----- Initialize package BLOG_AI -----'' );'||wwv_flow.LF||
'  init_params;'||wwv_flow.LF||
'--------';
wwv_flow_imp.g_varchar2_table(3787) := '------------------------------------------------------------------------'||wwv_flow.LF||
'--------------------------';
wwv_flow_imp.g_varchar2_table(3788) := '------------------------------------------------------'||wwv_flow.LF||
'end "BLOG_AI";'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(138405351815225809)
,p_install_id=>wwv_flow_imp.id(148135284869193288)
,p_name=>'Database objects upgrade'
,p_sequence=>60
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_updated_on=>wwv_flow_imp.dz('20260128060917Z')
);
wwv_flow_imp.component_end;
end;
/
