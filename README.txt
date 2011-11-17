*  DbSWH Apex blogging platfrom
*  Date: 16.11.2011
*  Dual licensed under the MIT and GPL licenses:
*  http://www.opensource.org/licenses/mit-license.php
*  http://www.gnu.org/licenses/gpl.html
*
*  Requires: 
*  Oracle Application Express 4.1 or higher

Installation:
1. Unzip file to some folder (eg, TEMP on Windows and tmp on UNIX or Linux)
2. Run the create_blog_db_user.sql script to create Db user:
     
    Change directory to the folder where Blog application is unzipped
    Start SQL*Plus and connect to the database where Oracle Application Express is installed as SYS specifying the SYSDBA role:

        sqlplus /nolog
        SQL> CONNECT SYS as SYSDBA
        Enter password: SYS_password

    Run create_blog_db_user.sql:


        @create_blog_db_user.sql 


3. Run upload_images.sql to create images in EPG if you use EPG to connect to Apex, otherwise copy the folder blog to your
Oracle HTTP directory to the root folder of Apex images 


To run the upload_images.sql script:

    Change directory to the folder where Blog application is unzipped
    Start SQL*Plus and connect to the database where Oracle Application Express is installed as SYS specifying the SYSDBA role:

        sqlplus /nolog
        SQL> CONNECT SYS as SYSDBA
        Enter password: SYS_password

    Run upload_images.sql passing the file system path to the base directory where Blog application was unzipped as shown in the following example:

        On Windows:

        @upload_images.sql SYSTEM_DRIVE:\TEMP

        On UNIX and Linux:

        @upload_images.sql /tmp




    Tip:
    The above examples assume that you unzipped Oracle Application Express in a directory called TEMP on Windows and tmp on 
      UNIX or Linux.

4. Connect to Apex internal workspace and create new workspace and assign above created schema to that workspace. 

5. Connect to your new workspace and import first dbswh_blog_appl.sql, choose install Supporting objects during installation.
This will create Blog application and DB objects.

6. Import dbswh_blog_admin.sql application

7. Run Blog admin application and login using credentials:
username - admin@blog.com
password - blog

8. Create your own user and assign it to administrators, delete generic admin. 
   Change the substitution string BLOG_EMAIL to reflect your new Admin email.