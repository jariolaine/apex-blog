# APEX Blog

Blog application built with Oracle Application Express (APEX).

## Install

1. Ensure you are running Oracle APEX version 19.2 or higher
2. Ensure target schema associated to your workspace has following privileges:
* CREATE INDEXTYPE
* CREATE PROCEDURE
* CREATE SEQUENCE
* CREATE TABLE
* CREATE TRIGGER
* CREATE VIEW
* CREATE JOB

3. Access your target Workspace
4. Select the Application Builder
5. Import and install admin_app.sql and select install supporting objects.
6. Import and install reader_app.sql and select install supporting objects.
7. Create group "Bloggers" to workspace and add APEX users to group. See [Using Groups to Manage Application Express Users](https://docs.oracle.com/en/database/oracle/application-express/19.2/aeadm/managing-users-in-a-workspace.html#GUID-0FD7B406-8A83-40C0-A3E7-EF19BBDEA5A4)

# License

This code is released under [MIT license](https://github.com/jariolaine/apex-blog/blob/master/LICENSE) by Jari Laine.
