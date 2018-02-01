--REM INSERTING into BLOG_AUTHOR
--SET DEFINE OFF;
INSERT INTO blog_author(
email
,user_name
,passwd
,author_name
,author_seq
,bio
) VALUES (
'admin@bexample.org'
,'ADMIN'
,blog_pw_hash('ADMIN','admin')
,'Administrator'
,1
,'<p>'
||'<span style="margin-left:40px">Blog Generic Administrator</span>'
|| '<img alt="My Blog Administrator" src="#IMAGE_PREFIX#menu/student_bx_128x128.png" style="width:128px;height:128px;float:left" />'
|| '</p>'
);