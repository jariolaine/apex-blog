# Object storage

resource oci_objectstorage_bucket app_bucket {
  compartment_id  = var.compartment_ocid
  name            = "${var.resources_prefix}-${random_string.deploy_id.result}"
  namespace       = data.oci_objectstorage_namespace.user_namespace.namespace
  defined_tags    = {}
  freeform_tags   = local.common_tags
}

resource oci_objectstorage_object wallet_b64 {
  bucket    = oci_objectstorage_bucket.app_bucket.name
  content   = oci_database_autonomous_database_wallet.app_db_wallet.content
  namespace = data.oci_objectstorage_namespace.user_namespace.namespace
  object    = "${upper(oci_database_autonomous_database.app_db.db_name)}_wallet"
}

resource oci_objectstorage_preauthrequest wallet_preauth {
  access_type  = "ObjectRead"
  bucket       = oci_objectstorage_bucket.app_bucket.name
  name         = "${upper(oci_database_autonomous_database.app_db.db_name)}_wallet_preauth"
  namespace    = data.oci_objectstorage_namespace.user_namespace.namespace
  time_expires = timeadd(timestamp(), "30m")
  object_name  = oci_objectstorage_object.wallet_b64.object
}
