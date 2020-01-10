#!/bin/bash

# Enviroment Variables
export LD_LIBRARY_PATH=/opt/oracle/client/instantclient_18_5:$LD_LIBRARY_PATH
export ORACLE_HOME=/opt/oracle/client/instantclient_18_5
export JAVA_HOME=/opt/oracle/jdk/latest
#TNS_ADMIN=/opt/oracle/client/instantclient_18_5/network/admin
export PATH=/opt/oracle/client/instantclient_18_5:$PATH
export PATH=/opt/oracle/sqlcl/bin:$PATH

script_home=$HOME/Development/Blog/ATP
# Log file
log="log/backup.log";
tmp="log/dummy"
# Download directory
dl_dir="download";
# Database variables
db="jladb01"
db_conn="${db}_low";
admin_user="admin";
admin_pass="1024cP!u#1024";
db_schema="blog_040000";
dump_name="$(date +%Y%m%d)_${db}_${db_schema}";
# Object storage variables
bucket="Database";
bucket_url="https://objectstorage.eu-frankfurt-1.oraclecloud.com/n/frdt4eogdtjk/b/${bucket}/o/";

# Change to script home directory
cd ${script_home};

# Output some info to initialize log file
echo "$(date +%d.%m.%Y' '%T)" > ${log};
echo "ATP ${db} backup schema ${db_schema}" >> ${log};

# Export schema
expdp ${admin_user}/${admin_pass}@${db_conn} \
logtime=all \
directory=data_pump_dir \
schemas=${db_schema} \
dumpfile=${dump_name} \
logfile=${dump_name} \
>> ${log} 2>&1;
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# Move export to bucket using SQLcl
sql /nolog >> ${log} 2>&1 << EOF
connect ${admin_user}/${admin_pass}@${db_conn};
-- Place schema export and log files to object storage bucket
begin
  for c1 in (
    select object_name
    from dbms_cloud.list_files('DATA_PUMP_DIR')
    where 1 = 1
  ) loop
    -- Copy file to bucket
    dbms_cloud.put_object(
      credential_name => 'OBJECT_STORAGE_CRED'
      ,object_uri => '${bucket_url}' || c1.object_name
      ,directory_name => 'DATA_PUMP_DIR'
      ,file_name => c1.object_name
    );
    -- Remove file from data_pump_dir
    utl_file.fremove( 'DATA_PUMP_DIR', c1.object_name );
  end loop;
end;
/
EOF
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# List objects in bucket and write information to file
oci os object list -bn ${bucket} > ${tmp} 2>&1;
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# Check that export file is in bucket. exit if file isn't in bucket
if ! grep -q "${dump_name}.dmp" ${tmp};
then
  echo "Export ${dump_name}.dmp not found from bucket!" >> ${log};
  exit 1;
fi;
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# Download export
oci os object bulk-download \
--bucket-name ${bucket} \
--prefix ${dump_name} \
--download-dir ${dl_dir} \
--overwrite \
>> ${log} 2>&1;
# exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# Remove export from bucket
oci os object bulk-delete \
--bucket-name ${bucket} \
--prefix ${dump_name} \
--force \
>> ${log} 2>&1;

exit $?
