#!/bin/bash

## main program ##
main_program(){

  # Read configuration file and set variables
  read_config_file "${1}";
  # Ask database credentials if not specified in configuration file
  ask_db_credentials;

  # Define variables from configuration data
  # Database schema export file name
  dbExportName="$(date +%Y%m%d)_${dbSchema}";
  # Object storage bucket URL
  osBucketUrl="${osBaseUrl}/n/${osNamespace}/b/${osBucket}/o/";
  # Log file
  logFile="${logDir%/}/${logName}";

  # Create needed directories if not exists
  create_dirs;
  # Initialize log file
  write_log true;
  # Export database schema
  run_expdp;
  # Move database schema export to object storage bucket
  export_to_bucket;
  # Download database schema exports from object storage bucket
  export_download;
  # Export APEX applications
  export_apex

}

## Subprograms ##
write_log(){
  if [ "${1}" = true ];
  then
    # Output some info to initialize log file
    echo "$(date +%d.%m.%Y' '%T)" > ${logFile};
  else
    echo "${1}" >> ${logFile};
  fi;
}

error_exit(){
  if [ "${2}" != 0 ];
  then
    # Define default error message
    errMsg="${1:-"Unknown Error"}" 1>&2;
    # If log file exists write error also to file
    [ -f "${logFile}" ] && write_log "${errMsg}" 1>&2;
    # Output error
    echo "${errMsg}" 1>&2;
    # Exit
    exit ${2:-1};
  fi;
}

read_config_file(){

  # Trim function for handling configuration file
  trim(){
    echo ${@};
  }

  confFile="${1}";

  if [ -z "${confFile}" ];
  then
    # If no file specified as parameter then
    # then use script directory and default file name
    confFile="$(dirname $(readlink -f $0))/backup.conf";
  fi;

  # Check configuration file exists
  if [ ! -f "${confFile}" ];
  then
    error_exit "Configuration file ${confFile} not exists" 2;
  fi;

  # Read configuration file
  while IFS=":" read -r confVar confVal;
  do

    # Skip comments and empty lines
    if [[ $confVar =~ (^[[:space:]]*#|^$) ]];
    then
      continue;
    fi;

    # Trim variable name and value
    confVar=$(trim ${confVar});
    #confVal=$(trim ${confVal%/});
    confVal=$(trim ${confVal});

    # Special handling for PATH and LD_LIBRARY_PATH
    case ${confVar} in
      PATH)
        if ! echo "${PATH}" | /bin/grep -Eq "(^|:)${confVal}}($|:)";
        then
          PATH="${confVal}:${PATH}";
          export PATH=${PATH%:};
        fi;
      ;;
      LD_LIBRARY_PATH)
        if ! echo "${LD_LIBRARY_PATH}" | /bin/grep -Eq "(^|:)${confVal}}($|:)";
        then
          LD_LIBRARY_PATH="${confVal}:${LD_LIBRARY_PATH}";
          export LD_LIBRARY_PATH=${LD_LIBRARY_PATH%:};
        fi;
      ;;
      *)
        export "${confVar}"="${confVal}"
      ;;
    esac;

  done < ${confFile}

}

ask_db_credentials(){
  # Ask enter database user name
  if [ -z "${dbUser}" ];
  then
    echo "Enter database administrator user name";
    read -s -p "user name:" dbUser;
    echo "";
  fi;
  # Ask enter password for user
  if [ -z "${dbPasswd}" ];
  then
    echo "Enter password for user ${dbUser}";
    read -s -p "password: " dbPasswd;
    echo "";
  fi;
}

create_dirs(){
  local errMsg="Failed to create directory";
  # Create log directory if not exists
  mkdir -p ${logDir%/};
  # exit if error
  error_exit "${errMsg} ${logDir%/}" $?;
  # Create directory for export download, if not exists
  mkdir -p ${dbExportDir%/};
  # exit if error
  error_exit "${errMsg} ${dbExportDir%/}" $?;
  # Create APEX application export download, if not exists
  mkdir -p ${apexExportDir%/};
  # exit if error
  error_exit "${errMsg} ${apexExportDir%/}" $?;
}

run_expdp(){
  # Use Oracle client expdp command to export database schema
  write_log "Exporting schema ${dbSchema}"
  expdp ${dbUser}/${dbPasswd}@${dbTnsAlias} \
  logtime=all \
  reuse_dumpfiles=yes \
  directory=data_pump_dir \
  schemas=${dbSchema} \
  dumpfile=${dbExportName} \
  logfile=${dbExportName} \
  >> ${logFile} 2>&1;
  # exit if error
  error_exit "Database schema export failed" $?;
}

export_download(){

  local tmpFile="${logDir%/}/object.list";

  # List objects in bucket and write information to file
  oci os object list -bn ${osBucket} > ${tmpFile} 2>> ${logFile};
  error_exit "oci command failed" $?;
  # Add info to log
  cat ${tmpFile} >> ${logFile}

  # Check that export file is in bucket. exit if file isn't in bucket
  if ! grep -q "${dbExportName}.dmp" ${tmpFile};
  then
    error_exit "Export ${dbExportName}.dmp not found from bucket" 1;
  fi;

  # Download export
  oci os object bulk-download \
  --bucket-name ${osBucket} \
  --prefix ${dbExportName} \
  --download-dir ${dbExportDir%/} \
  --overwrite \
  >> ${logFile} 2>&1;
  # exit if error
  error_exit "Database schema export download failed" $?;

  # Remove export from bucket
  oci os object bulk-delete \
  --bucket-name ${osBucket} \
  --prefix ${dbExportName} \
  --force \
  >> ${logFile} 2>&1;
  # exit if error
  error_exit "Deleting files from object storage bucket failed" $?;
}

export_to_bucket(){
  # Use SQLcl to move schema export from database directory to object storage bucket
  write_log "Moving export ${dbExportName} to object storage bucket ${osBucket}";
  sql -S /nolog >> ${logFile} 2>&1 << EOF
  conn ${dbUser}/${dbPasswd}@${dbTnsAlias};
  begin
    -- Loop files in database directory
    for c1 in (
      select object_name
      from dbms_cloud.list_files('DATA_PUMP_DIR')
      where 1 = 1
      and object_name like '${dbExportName}%'
    ) loop
      -- Copy file to bucket
      dbms_cloud.put_object(
        credential_name => 'OBJECT_STORAGE_CRED'
        ,directory_name => 'DATA_PUMP_DIR'
        ,object_uri => '${osBucketUrl}' || c1.object_name
        ,file_name => c1.object_name
      );
      -- Remove file from data_pump_dir
      utl_file.fremove( 'DATA_PUMP_DIR', c1.object_name );
    end loop;
  end;
  /
EOF
  # TODO: check ORA erros
  # Exit if error
  error_exit "Move database schema export to object storage failed" $?;
}

export_apex(){
  # Use SQLcl to export APEX applications
  write_log "Exporting all APEX applicatins from workspace ${apexWorkspace}"
  sql -S /nolog >> ${logFile} 2>&1 << EOF
  -- NOTE! we use proxy user.
  -- Example grant:
  -- alter user admin grant connect through appschema;
  --
  conn ${dbUser}[${dbSchema}]/${dbPasswd}@${dbTnsAlias};
  cd ${apexExportDir%/};
  -- Define variable
  column workspace_id new_value workspaceid;

  -- Select APEX workspace id to variable
  select to_char(aw.workspace_id) as workspace_id
  from apex_workspaces aw
  where 1 = 1
  and aw.workspace = upper('${apexWorkspace}')
  ;

  -- Export all workspace applications
  apex export -workspaceid &workspaceid. -skipExportDate;
EOF
  # TODO: check ORA erros
  # Exit if error
  error_exit "APEX application export failed" $?;
}

# Run main program
main_program "${1}";
exit $?;
