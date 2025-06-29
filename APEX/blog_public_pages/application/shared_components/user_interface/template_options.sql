prompt --application/shared_components/user_interface/template_options
begin
--   Manifest
--     THEME OPTIONS: 401
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>401
,p_default_id_offset=>44906910937164790
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(163526625416465734)
,p_theme_id=>42
,p_name=>'HIDE_PAGINATION'
,p_display_name=>'Hide Pagination'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(134288965682197782)
,p_css_classes=>'blog-posts--paginationHidden'
,p_template_types=>'REPORT'
);
wwv_flow_imp.component_end;
end;
/
