prompt --application/shared_components/navigation/search_config/files
begin
--   Manifest
--     SEARCH CONFIG: Files
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(38537485558801106)
,p_label=>'Files'
,p_static_id=>'files'
,p_search_prefix=>'file'
,p_search_type=>'SIMPLE'
,p_location=>'LOCAL'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_FILES'
,p_searchable_columns=>'CREATED_BY:CHANGED_BY:FILE_NAME:MIME_TYPE:FILE_DESC:NOTES'
,p_pk_column_name=>'ID'
,p_title_column_name=>'FILE_NAME'
,p_description_column_name=>'FILE_DESC'
,p_last_modified_column_name=>'CHANGED_ON'
,p_custom_01_column_name=>'FILE_SIZE_DISPLAY'
,p_custom_03_column_name=>'NOTES'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:71:&APP_SESSION.::&DEBUG.::P71_ID:\&ID.\'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp.component_end;
end;
/
