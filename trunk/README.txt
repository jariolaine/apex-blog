*  DbSWH Apex blogging platform
*  Date: 25.11.2011
*  Dual licensed under the MIT and GPL licenses:
*  http://www.opensource.org/licenses/mit-license.php
*  http://www.gnu.org/licenses/gpl.html
*
*  Requires: 
*  Oracle Application Express 4.1 or higher

Change log:

0.0.2b / 25.11.2011
- Changes to CSS. 
- Twitter and Google+ buttons.
- Materialized view BLOG_MESG changed to be view. Now application can be installed to 11G XE database.
- Included calls to APEX_UTIL.SET_AUTHENTICATION_RESULT to function BLOG_AUTH.

0.0.1b / 16.11.2011
- First public version

Installation:

1)  Unzip files to some folder (e.g. c:\temp on Windows or /tmp on UNIX or Linux)

2)  Run the create_blog_db_user.sql script to create new DB user:
     
    Change directory to the folder where Blog application file are unzipped.
    Start SQL*Plus and connect to the database where Oracle Application Express is installed as SYS specifying the SYSDBA role:
        sqlplus /nolog
        SQL> CONNECT SYS as SYSDBA
        Enter password: SYS_password

    Run create_blog_db_user.sql:
        @create_blog_db_user.sql

    When prompted give password for new database user.

3)  Connect to Apex internal workspace and create new workspace and assign above created schema to that workspace.

4)  Connect to your new workspace.
    Import and install dbswh_blog_reader.sql.
    Choose install Supporting objects during installation. This will create Blog application and DB objects.
    When installation completes, note down Blog application ID.

5)  Import and install dbswh_blog_admin.sql application. Choose install Supporting objects during installation. In Application Substitution Strings enter Blog application ID.
    

Depending on your architecture select one of the methods:
6 a) When using Oracle HTTP server with mod_plsql copy the folder blog from install files to your Oracle HTTP sever Apex image folder root.

When using Embed PL/SQL Gateway (EPG)
6 b)Run upload_images.sql for creating images to XDB.

    Change directory to the folder where Blog application file are unzipped.
    Start SQL*Plus and connect to the database where Oracle Application Express is installed as SYS specifying the SYSDBA role:
        sqlplus /nolog
        SQL> CONNECT SYS as SYSDBA
        Enter password: SYS_password

    Run upload_images.sql passing the file system directory where Blog application was unzipped as shown in the following example:

        On Windows:
        @upload_images.sql c:\temp

        On UNIX and Linux:
        @upload_images.sql /tmp


7)  Run Blog admin application and login using credentials:
        username - admin@blog.com
        password - blog

8)  Create your own user and assign it to administrators, delete the above generic admin. 

Happy blogging.
