prompt --application/shared_components/files/icons_app_icon_32_png
begin
--   Manifest
--     APP STATIC FILES: 402
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>18303204396897713
,p_default_application_id=>402
,p_default_id_offset=>0
,p_default_owner=>'BLOG_040000'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE900000258494441545847ED95CF6E125114877F331DA0834CA122041046A9A54DDAA8FD63DAC6857665746534317D0097EE7C01DFC017';
wwv_flow_imp.g_varchar2_table(2) := '70E10B983426C674DBAE1A6D8C9226D5A03422109C840187296D61A663EE986900C13B85268DC9DCEDBD39E7BBDF3DE75C66E665C6C0192EC601700C3806FE1B03C6910EBD5E83A135C1702E0C790530EC50D70942CE781A0A384347FD5CF89F53C6F61C';
wwv_flow_imp.g_varchar2_table(3) := '389472783427E29A1846B9B68FED828C77328343707F2588E932962645BC497F47C31B3C1D0012A55995703321E0D6440CBCC78574BE8CD7D903D388B58829FF5E093E2F8F8221B4ED7523A11A203AC1B2C7BA498269B782870B9366BC676FB7E10AFCD1';
wwv_flow_imp.g_varchar2_table(4) := '4CF69A7209AEF3919ECFD309410520B79EBAE0C14ED500E70B4053AB783C1F455156311E0960355D408919E92B3981A102684A194F9612A8EC37B09E9110F272B873F51236767EE0EECC185E6C7C4689F59FF8E696092A00D13AE156B1B2903AB6B79929';
wwv_flow_imp.g_varchar2_table(5) := '2215194550E0F12927E1D5D62EDC61D1B6F6D667A00290C347077BB83E0ADC9F4D76AD6802B4B6AB9A4F74D2650BC02C30AD094DAD20C8357139E4C7AC18422228B459E907C23600C9440AF046CC87B17000D99F158486592CA6A20341D806B092C78323';
wwv_flow_imp.g_varchar2_table(6) := 'F8F0356F0E9ACD2F394C47FC0341D802E84C3E371E47BEAC60ABA89AB7BF9714FA86A002E87505F3112FAC9BB726B78A8E007642AC7DCCE2BDE2197C125E646A58BC123575774B6E15402BC4F3D5753C7D70BB6D4AF6EA0EAA01EB632101B252D5D4DEAB';
wwv_flow_imp.g_varchar2_table(7) := 'DD08C4727C18CB53224ECD009901495E33FF836FBF746AAF5BED4ABE6BD6CD53C702D50035C280071C00C78063E0CC0DFC06357955505435A2240000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(10402806143088408)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
