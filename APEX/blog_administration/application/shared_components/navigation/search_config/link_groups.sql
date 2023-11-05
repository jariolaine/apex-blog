prompt --application/shared_components/navigation/search_config/link_groups
begin
--   Manifest
--     SEARCH CONFIG: Link Groups
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(38683155012739448)
,p_label=>'Link Groups'
,p_static_id=>'link_groups'
,p_search_prefix=>'link-group'
,p_search_type=>'SIMPLE'
,p_location=>'LOCAL'
,p_query_type=>'TABLE'
,p_query_table=>'BLOG_V_ALL_LINK_GROUPS'
,p_searchable_columns=>'CREATED_BY:CHANGED_BY:TITLE:NOTES:STATUS_TEXT'
,p_pk_column_name=>'ID'
,p_title_column_name=>'TITLE'
,p_description_column_name=>'NOTES'
,p_last_modified_column_name=>'CHANGED_ON'
,p_custom_01_column_name=>'STATUS_TEXT'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:52:&APP_SESSION.::&DEBUG.::P52_ID:\&ID.\'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa-object-group'
);
wwv_flow_imp.component_end;
end;
/
