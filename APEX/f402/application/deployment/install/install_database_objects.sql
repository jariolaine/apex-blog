prompt --application/deployment/install/install_database_objects
begin
--   Manifest
--     INSTALL: INSTALL-Database Objects
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_api.create_install_script(
 p_id=>wwv_flow_api.id(32897013199918411)
,p_install_id=>wwv_flow_api.id(31706870664802069)
,p_name=>'Database Objects'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/**************************************',
'* Elements',
'**************************************/',
'blockquote::before {',
'  content: open-quote;',
'  font-size: 2.2rem;',
'}',
'blockquote::after {',
'  content: close-quote;',
'  font-size: 2.2rem;',
'}',
'blockquote p {',
'  display: inline;',
'}',
'/**************************************',
'* Logo',
'**************************************/',
'.z-app-logo {',
'  display: flex;',
'  align-items: baseline;',
'}',
'.z-app-logo .z-app-desc {',
'  white-space: normal;',
'  font-style: oblique;',
'  font-size: 1.4rem;',
'  margin-left: 0.6rem;',
'}',
'@media only screen and (max-width: 640px) {',
'  .z-app-logo {',
'    flex-direction: column;',
'  }',
'  .z-app-logo .z-app-desc {',
'    font-size: 1.2rem;',
'    line-height: 1.6rem;',
'    margin-left: 0;',
'  }',
'}',
'@media (max-width: 340px) {',
'  .z-app-logo .z-app-desc {',
'    display: none!important;',
'  }',
'}',
'/**************************************',
'* Region',
'**************************************/',
'.z-tabs * {',
'  font-size: 102.8%;',
'}',
'.z-app-source {',
'  padding: 0.6rem 0;',
'}',
'/**************************************',
'* Interactive Grid',
'**************************************/',
'/*',
'.z-config-ig .a-IG-header {',
'	display: none!important;',
'  visibility: hidden!important;',
'}',
'*/',
'.z-config-ig span.a-GV-breakLabel {',
'  display: none!important;',
'  visibility: hidden!important;',
'}',
'/**************************************',
'* Interactive Report',
'**************************************/',
'.z-IR--iconLinks td:first-child {',
'  overflow: visible;',
'  width: 1%;',
'}',
'/**************************************',
'* Media list report extra classes',
'**************************************/',
'.z-border-radius {',
'  border-radius: 6px;',
'}',
'.z-MediaList--files .t-MediaList-title {',
'  word-break: break-word;',
'}',
'/**************************************',
'* Classic reports',
'**************************************/',
'.nodatafound {',
'  text-align: center;',
'  color: #262626;',
'  font-size: 1.2rem;',
'  line-height: 2rem;',
'  padding: 2.2rem;',
'}',
'.pagination {',
'  text-align: right;',
'  width: 100%;',
'}',
'/**************************************',
'* Post report',
'**************************************/',
'.z-post {',
'  font-size: 112%;',
'  background-color: #ffffff;',
'  margin-bottom: 1.6rem;',
'  border: 1px solid rgba(0, 0, 0, 0.1);',
'  border-radius: 6px;',
'  box-shadow: 0 2px 4px -2px rgba(0, 0, 0, 0.075);',
'  padding: 1.6rem;',
'}',
'.z-post--header {',
'  clear: both;',
'}',
'.z-post--header h1 {',
'  font-size: 1.6em;',
'  margin: 0 0 0.2rem;',
'}',
'.z-post--header h2 {',
'  font-size: 1em;',
'  margin: 0 0 1.8rem;',
'}',
'.z-post--header h3 {',
'  font-size: 1em;',
'  margin: 0 0 0.2rem;',
'}',
'.z-post--body img {',
'  max-width: 100%;',
'  height: auto;',
'}',
'.z-post--body br {',
'  clear: none!important;',
'}',
'.z-post--tags {',
'  width: 100%;',
'  clear: both;',
'  margin: 2rem 0 0;',
'  border-top: 1px solid rgba(0, 0, 0, 0.075);',
'}',
'.z-post--footer {',
'  width: 100%;',
'  clear: both;',
'  margin: 1.2rem 0 0;',
'}',
'.z-posts--pagination {',
'  margin-bottom: 16px;',
'}',
'.z-posts--paginationBorder .z-posts--pagination {',
'  background-color: #ffffff;',
'  border: 1px solid rgba(0, 0, 0, 0.1);',
'  box-shadow: 0 2px 4px -2px rgba(0, 0, 0, 0.075);',
'  border-radius: 6px;',
'  padding: 0.4rem;',
'}',
'.z-post--largeMargin .z-post {',
'  margin-bottom: 3.2rem;',
'}',
'.z-post--smallMargin .z-post {',
'  margin-bottom: 0.8rem;',
'}',
'.z-post--noMargin .z-post {',
'  margin-bottom: 0;',
'}',
'.z-post--noMargin .z-post:not(:first-child) {',
'  border-top: none;',
'}',
'.z-post--noMargin.z-posts--paginationBorder .z-posts--pagination {',
'  border-top: none;',
'}',
'.z-posts--paginationHidden .z-posts--pagination {',
'  display: none!important;',
'  visibility: hidden!important;',
'}',
'/* Post HTML */',
'.z-container--postImage {',
'  margin: 0 0 1.6em;',
'  text-align: center;',
'}',
'/* IR specific */',
'.z-post--IR {',
'  margin: 3.2rem 1.6rem;',
'}',
'@media only screen and (max-width: 640px) {',
'  .z-post {',
'    padding: 1.2rem;',
'    margin-bottom: 1.6rem;',
'  }',
'  .z-post--header h1 {',
'    font-size: 1.4em;',
'  }',
'}',
'/**************************************',
'* General custom report',
'**************************************/',
'.z-Content .z-Content--Row {',
'  border: 1px solid rgba(0, 0, 0, 0.1);',
'  border-radius: 6px;',
'  box-shadow: 0 2px 4px -2px rgba(0, 0, 0, 0.075);',
'  margin-bottom: 1.6rem;',
'}',
'.z-Content--Row {',
'  background-color: #ffffff;',
'}',
'.z-Content--Title {',
'  border-bottom: 1px solid rgba(0, 0, 0, 0.075);',
'  padding: 1.2rem;',
'  margin: 0;',
'  font-size: 1.6rem;',
'  font-weight: 500;',
'  line-height: 2.4rem;',
'}',
'.z-Content--Body {',
'  padding: 1.6rem;',
'}',
'.z-Content--Stacked .z-Content--Title {',
'  border-top: 1px solid rgba(0, 0, 0, 0.075);',
'}',
'.z-Content--Stacked .z-Content--Row:first-child .z-Content--Title {',
'  border-top: none;',
'}',
'/**************************************',
'* Program code formatting',
'**************************************/',
'pre.z-program-code {',
'  font-family: SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Bitstream Vera Sans Mono", "Courier New", monospace;',
'  color: #262626;',
'  font-size: 1.1rem;',
'  tab-size: 2;',
'  counter-reset: line;',
'  overflow-x: auto;',
'  /*',
'	background-color: @code-bg-color;',
'  border: @code-border;',
'	box-shadow: @code-box-shadow;',
'*/',
'  border-radius: 4px;',
'}',
'pre.z-program-code code {',
'  font-family: inherit;',
'  font-size: inherit;',
'  line-height: inherit;',
'  tab-size: inherit;',
'  counter-increment: line;',
'  margin: 0;',
'  padding: 0;',
'  overflow: visible;',
'}',
'pre.z-program-code code::before {',
'  content: counter(line);',
'  user-select: none;',
'  border-right: 2px solid #6ce26c;',
'  border-left: 1px solid rgba(0, 0, 0, 0.055);',
'  background-color: rgba(0, 0, 0, 0.035);',
'  margin: 0 0.4rem 0 0;',
'  padding: 0 0.4rem 0 0;',
'  display: inline-block;',
'  text-align: right;',
'  width: 2.8rem;',
'  color: #393939;',
'}',
'pre.z-program-code code:nth-child(odd):before {',
'  background-color: rgba(0, 0, 0, 0.075);',
'}',
'pre.z-program-code code:first-child:before {',
'  border-top: 1px solid rgba(0, 0, 0, 0.055);',
'}',
'pre.z-program-code code:last-child:before {',
'  border-bottom: 1px solid rgba(0, 0, 0, 0.055);',
'}',
'/**************************************',
'* About content',
'**************************************/',
'.z-author-container {',
'  display: flex;',
'}',
'.z-author-left {',
'  order: 1;',
'  display: flex;',
'  flex-direction: column;',
'}',
'.z-author-right {',
'  order: 2;',
'  padding: 0 0 0 1.6rem;',
'}',
'.z-author-badges {',
'  display: flex;',
'  flex-direction: column;',
'}',
'.z-author-badges > * {',
'  margin: 1rem 0;',
'}',
'@media only screen and (max-width: 640px) {',
'  .z-author-container {',
'    flex-direction: column;',
'    align-items: center;',
'  }',
'  .z-author-right {',
'    padding: 1.6rem 0;',
'  }',
'  .z-author-badges {',
'    padding: 1.6rem 0;',
'    align-items: center;',
'  }',
'}',
'/**************************************',
'* Comments report',
'**************************************/',
'.z-comment .t-Comments-body {',
'  width: 0;',
'}',
'.z-comment .t-Comments-comment {',
'  overflow-wrap: break-word;',
'}',
'/**************************************',
'* Modifiers',
'**************************************/',
'.z-text-wrap {',
'  white-space: pre-wrap;',
'}',
'.z-hidden {',
'  display: none!important;',
'  visibility: hidden!important;',
'}',
'/**************************************',
'* Status Marker',
'**************************************/',
'.z-status-marker {',
'  position: relative;',
'  margin: -8px -12px;',
'  padding: 8px 12px;',
'}',
'/*',
'  Generate a triangle at the top left of report cells containing status marker',
'  elements.',
'*/',
'.z-status-marker::after {',
'  position: absolute;',
'  top: 0;',
'  left: 0;',
'  border: 6px solid transparent;',
'  width: 0;',
'  height: 0;',
'  content: "";',
'}',
'/*',
'  Colour the triangles according to the specified status class.',
'*/',
'.z-status-marker.z-required::after {',
'  border-color: #c00 transparent transparent #c00;',
'}',
''))
);
wwv_flow_api.component_end;
end;
/
