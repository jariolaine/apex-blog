prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 401
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(9702659906188392)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_current=>false
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_reference_id=>4007676303523989775
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(9703000738188393)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(9703464856188393)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(9703849158188393)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(9704277569188393)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
wwv_flow_api.create_theme_style(
 p_id=>wwv_flow_api.id(42480195505165995)
,p_theme_id=>42
,p_name=>'Vita (Blog)'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_config=>'{"customCSS":"/**************************************\n* Elements\n**************************************/\nblockquote::before {\n  content: open-quote;\n  font-size: 2.2rem;\n}\nblockquote::after {\n  content: close-quote;\n  font-size: 2.2rem;\n}\n'
||'blockquote p {\n  display: inline;\n}\n.z-switch input[value=\"0\"]:checked + label {\n  background-color: #8c8c8c;\n  border-color: #8c8c8c;\n}\n/**************************************\n* Logo\n**************************************/\n.z-app-logo {\'
||'n  display: flex;\n  align-items: baseline;\n  margin-left: 8px;\n}\n.z-app-logo .z-app-desc {\n  white-space: normal;\n  font-style: oblique;\n  font-size: 1.4rem;\n  margin-left: 0.6rem;\n}\n@media only screen and (max-width: 640px) {\n  .z-app-log'
||'o {\n    flex-direction: column;\n  }\n  .z-app-logo .z-app-desc {\n    font-size: 1.2rem;\n    line-height: 1.6rem;\n    margin-left: 0;\n  }\n}\n@media (max-width: 340px) {\n  .z-app-logo .z-app-desc {\n    display: none!important;\n  }\n}\n/******'
||'********************************\n* Region\n**************************************/\n.z-app-source {\n  padding: 0.4rem 0;\n}\n/**************************************\n* Interactive Grid\n**************************************/\n/*\n.z-config-ig .a-I'
||'G-header {\n\tdisplay: none!important;\n  visibility: hidden!important;\n}\n*/\n.z-config-ig span.a-GV-breakLabel {\n  display: none!important;\n  visibility: hidden!important;\n}\n/**************************************\n* Interactive Report\n******'
||'********************************/\n.z-IR--iconLinks td:first-child {\n  overflow: visible;\n  width: 1%;\n}\n/**************************************\n* Classic reports\n**************************************/\n.nodatafound {\n  text-align: center;\n '
||' color: #262626;\n  font-size: 1.2rem;\n  line-height: 2rem;\n  padding: 2.2rem;\n}\n.pagination {\n  text-align: right;\n  width: 100%;\n}\n/**************************************\n* Post report\n**************************************/\n.z-post {\n '
||' background-color: #ffffff;\n  margin-bottom: 1.6rem;\n  border: 1px solid rgba(0, 0, 0, 0.1);\n  border-radius: 4px;\n  box-shadow: 0 2px 4px -2px rgba(0, 0, 0, 0.075);\n  padding: 1.6rem;\n}\n.z-post--header {\n  clear: both;\n}\n.z-post--header h1'
||' {\n  font-size: 1.6em;\n  margin: 0 0 0.2rem;\n}\n.z-post--header h2 {\n  font-size: 1em;\n  margin: 0 0 1.8rem;\n}\n.z-post--header h3 {\n  font-size: 1em;\n  margin: 0 0 0.2rem;\n}\n.z-post--body img {\n  max-width: 100%;\n  height: auto;\n}\n.z-p'
||'ost--body br {\n  clear: none!important;\n}\n.z-post--tags {\n  width: 100%;\n  clear: both;\n  margin: 2rem 0 0;\n  border-top: 1px solid rgba(0, 0, 0, 0.075);\n}\n.z-post--footer {\n  width: 100%;\n  clear: both;\n  margin: 1.2rem 0 0;\n}\n.z-posts'
||'--pagination {\n  margin-bottom: 16px;\n}\n.z-posts--paginationBorder .z-posts--pagination {\n  background-color: #ffffff;\n  border: 1px solid rgba(0, 0, 0, 0.1);\n  box-shadow: 0 2px 4px -2px rgba(0, 0, 0, 0.075);\n  border-radius: 4px;\n  padding:'
||' 0.4rem;\n}\n.z-post--largeMargin .z-post {\n  margin-bottom: 3.2rem;\n}\n.z-post--smallMargin .z-post {\n  margin-bottom: 0.8rem;\n}\n.z-post--noMargin .z-post {\n  margin-bottom: 0;\n}\n.z-post--noMargin .z-post:not(:first-child) {\n  border-top: n'
||'one;\n}\n.z-post--noMargin.z-posts--paginationBorder .z-posts--pagination {\n  border-top: none;\n}\n.z-posts--paginationHidden .z-posts--pagination {\n  display: none!important;\n  visibility: hidden!important;\n}\n/* IR specific */\n.z-post--IR {\n'
||'  margin: 3.2rem 1.6rem;\n}\n@media only screen and (max-width: 640px) {\n  .z-post {\n    padding: 1.2rem;\n    margin-bottom: 1.6rem;\n  }\n  .z-post--header h1 {\n    font-size: 1.4em;\n  }\n}\n/**************************************\n* General cu'
||'stom report\n**************************************/\n.z-Content .z-Content--Row {\n  border: 1px solid rgba(0, 0, 0, 0.1);\n  border-radius: 4px;\n  box-shadow: 0 2px 4px -2px rgba(0, 0, 0, 0.075);\n  margin-bottom: 1.6rem;\n}\n.z-Content--Row {\n  '
||'background-color: #ffffff;\n}\n.z-Content--Title {\n  border-bottom: 1px solid rgba(0, 0, 0, 0.075);\n  padding: 1.2rem;\n  margin: 0;\n  font-size: 1.6rem;\n  font-weight: 500;\n  line-height: 2.4rem;\n}\n.z-Content--Body {\n  padding: 1.6rem;\n}\n.'
||'z-Content--Stacked .z-Content--Title {\n  border-top: 1px solid rgba(0, 0, 0, 0.075);\n}\n.z-Content--Stacked .z-Content--Row:first-child .z-Content--Title {\n  border-top: none;\n}\n/**************************************\n* Program code formatting\'
||'n**************************************/\npre.z-program-code {\n  font-family: SFMono-Regular, Menlo, Monaco, Consolas, \"Liberation Mono\", \"Bitstream Vera Sans Mono\", \"Courier New\", monospace;\n  color: #262626;\n  font-size: 1.1rem;\n  tab-siz'
||'e: 2;\n  counter-reset: line;\n  overflow-x: auto;\n  /*\n\tbackground-color: @code-bg-color;\n  border: @code-border;\n\tbox-shadow: @code-box-shadow;\n*/\n  border-radius: 4px;\n}\npre.z-program-code code {\n  font-family: inherit;\n  font-size: in'
||'herit;\n  line-height: inherit;\n  tab-size: inherit;\n  counter-increment: line;\n  margin: 0;\n  padding: 0;\n  overflow: visible;\n}\npre.z-program-code code::before {\n  content: counter(line);\n  user-select: none;\n  border-right: 2px solid #6c'
||'e26c;\n  border-left: 1px solid rgba(0, 0, 0, 0.055);\n  background-color: rgba(0, 0, 0, 0.035);\n  margin: 0 0.4rem 0 0;\n  padding: 0 0.4rem 0 0;\n  display: inline-block;\n  text-align: right;\n  width: 2.8rem;\n  color: #393939;\n}\npre.z-program'
||'-code code:nth-child(odd):before {\n  background-color: rgba(0, 0, 0, 0.075);\n}\npre.z-program-code code:first-child:before {\n  border-top: 1px solid rgba(0, 0, 0, 0.055);\n}\npre.z-program-code code:last-child:before {\n  border-bottom: 1px solid '
||'rgba(0, 0, 0, 0.055);\n}\n/**************************************\n* About content\n**************************************/\n.z-author-container {\n  display: flex;\n}\n.z-author-left {\n  order: 1;\n  display: flex;\n  flex-direction: column;\n}\n.z'
||'-author-right {\n  order: 2;\n  padding: 0 0 0 1.6rem;\n}\n.z-author-badges {\n  display: flex;\n  flex-direction: column;\n}\n.z-author-badges > * {\n  margin: 1rem 0;\n}\n@media only screen and (max-width: 640px) {\n  .z-author-container {\n    fle'
||'x-direction: column;\n    align-items: center;\n  }\n  .z-author-right {\n    padding: 1.6rem 0;\n  }\n  .z-author-badges {\n    padding: 1.6rem 0;\n    align-items: center;\n  }\n}\n/**************************************\n* Comments report\n*******'
||'*******************************/\n.z-comment {\n  padding: 1.6rem;\n  margin-bottom: 0;\n  border-bottom: 1px solid rgba(0, 0, 0, 0.075);\n}\n.z-comment .t-Comments-body {\n  width: 0;\n}\n.z-comment .t-Comments-comment {\n  overflow-wrap: break-word'
||';\n}\n/**************************************\n* Modifiers\n**************************************/\n.z-text-wrap {\n  white-space: pre-wrap;\n}\n.z-hidden {\n  display: none!important;\n  visibility: hidden!important;\n}\n/**************************'
||'************\n* Status Marker\n**************************************/\n.z-status-marker {\n  position: relative;\n  margin: -8px -12px;\n  padding: 8px 12px;\n}\n/*\n  Generate a triangle at the top left of report cells containing status marker\n  e'
||'lements.\n*/\n.z-status-marker::after {\n  position: absolute;\n  top: 0;\n  left: 0;\n  border: 6px solid transparent;\n  width: 0;\n  height: 0;\n  content: \"\";\n}\n/*\n  Colour the triangles according to the specified status class.\n*/\n.z-statu'
||'s-marker.z-required::after {\n  border-color: #c00 transparent transparent #c00;\n}\n/**************************************\n* Media list report extra classes\n**************************************/\n.z-border-radius {\n  border-radius: 4px;\n}\n.z'
||'-MediaList--files .t-MediaList-title {\n  word-break: break-word;\n}\n","vars":{"@Head-Height":"64px","@g_Container-BorderRadius":"4px"}}'
,p_theme_roller_output_file_url=>'#THEME_DB_IMAGES#42480195505165995.css'
,p_theme_roller_read_only=>false
);
wwv_flow_api.component_end;
end;
/
