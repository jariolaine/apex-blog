#!/bin/bash

# Enviroment Variables
export LD_LIBRARY_PATH=/opt/oracle/client/instantclient_18_5:$LD_LIBRARY_PATH
export ORACLE_HOME=/opt/oracle/client/instantclient_18_5
export JAVA_HOME=/opt/oracle/jdk/latest
export PATH=/opt/oracle/client/instantclient_18_5:$PATH
export PATH=/opt/oracle/sqlcl/bin:$PATH

# Script home directory
script_home="$(dirname $(readlink -f $0))";

# Get user and password from user input
read -s -p "Enter user name: " user_name;
echo "";
read -s -p "Enter Password: " user_pass;
echo "";

# Read configuration file
while IFS=":" read -r var value;
do
  if [[ $var =~ (^[[:space:]]*#|^$) ]];
  then
    continue;
  fi;
  export "$var"="${value}"
done < ${script_home}/backup.conf
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# Dump name
dump_name="$(date +%Y%m%d)_${database}_${db_schema}";
# Object storage URL
bucket_url="${base_url}/n/${namespace}/b/${bucket}/o/";
# File variables
log="${log_dir}/${log_name}";
tmp="${log_dir}/dummy"

# Create directories if not exists
mkdir -p ${log_dir};
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# Output some info to initialize log file
echo "$(date +%d.%m.%Y' '%T)" > ${log};
echo "Exporting database ${database} schema ${db_schema}" | tee -a ${log};

# Export schema
expdp ${user_name}/${user_pass}@${tnsalias} \
logtime=all \
reuse_dumpfiles=yes \
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

# Move export from database directory to object storage bucket
sql /nolog >> ${log} 2>&1 << EOF
conn ${user_name}/${user_pass}@${tnsalias};
begin
  for c1 in (
    select object_name
    from dbms_cloud.list_files('DATA_PUMP_DIR')
    where 1 = 1
    and object_name like '${dump_name}%'
  ) loop
    -- Copy file to bucket
    dbms_cloud.put_object(
      credential_name => 'OBJECT_STORAGE_CRED'
      ,directory_name => 'DATA_PUMP_DIR'
      ,object_uri => '${bucket_url}' || c1.object_name
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

# Export APEX workspace applications
sql /nolog >> ${log} 2>&1 << EOF
conn ${user_name}[${db_schema}]/${user_pass}@${tnsalias};
cd ${apex_export_dir};
column workspace_id new_value workspaceid;
select to_char(workspace_id) as workspace_id
from apex_workspaces
where 1 = 1
and workspace = upper('${workspace}')
;
apex export -workspaceid &workspaceid. -skipExportDate;
EOF
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# List objects in bucket and write information to file
oci os object list -bn ${bucket} > ${tmp} 2>> ${log};
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;
cat ${tmp} >> ${log}

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

# Create directory for export download, if not exists
mkdir -p ${dump_dir};
# Exit if error
if [ $? != 0 ];
then
  exit $?;
fi;

# Download export
oci os object bulk-download \
--bucket-name ${bucket} \
--prefix ${dump_name} \
--download-dir ${dump_dir} \
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
