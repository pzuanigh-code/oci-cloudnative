# Copyright (c) 2019 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 
resource "oci_objectstorage_bucket" "mushop" {

    #Required
    compartment_id = "${var.compartment_ocid}"
    name = "Mushop-${random_id.mushop_id.dec}"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"

}

resource "oci_objectstorage_object" "mushop_wallet" {
    #Required
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    content = "${data.oci_database_autonomous_database_wallet.autonomous_database_wallet.content}"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    object = "mushop_atp_wallet"

}

resource "oci_objectstorage_preauthrequest" "mushop_wallet_preauth" {
    #Required
    access_type = "ObjectRead"
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    name = "Mushop_wallet_preauth"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    time_expires = "${timeadd(timestamp(),"30m")}"

    #Optional
    object = "${oci_objectstorage_object.mushop_wallet.object}"
}

resource "oci_objectstorage_object" "catalogue_sql_script" {
    #Required
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    content = "${file("./scripts/catalogue_setup.sql")}"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    object = "catalogue_sql_script"

}

resource "oci_objectstorage_preauthrequest" "catalogue_sql_script_preauth" {
    #Required
    access_type = "ObjectRead"
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    name = "catalogue_sql_script_preauth"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    time_expires = "${timeadd(timestamp(),"30m")}"

    #Optional
    object = "${oci_objectstorage_object.catalogue_sql_script.object}"
}

resource "oci_objectstorage_object" "apache_conf" {
    #Required
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    content = "${file("./scripts/httpd.conf")}"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    object = "apache_conf"

}

resource "oci_objectstorage_preauthrequest" "apache_conf_preauth" {
    #Required
    access_type = "ObjectRead"
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    name = "apache_conf_preauth"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    time_expires = "${timeadd(timestamp(),"30m")}"

    #Optional
    object = "${oci_objectstorage_object.apache_conf.object}"
}

resource "oci_objectstorage_object" "entrypoint" {
    #Required
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    content = "${file("./scripts/entrypoint.sh")}"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    object = "entrypoint"

}

resource "oci_objectstorage_preauthrequest" "entrypoint_preauth" {
    #Required
    access_type = "ObjectRead"
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    name = "entrypoint_preauth"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    time_expires = "${timeadd(timestamp(),"30m")}"

    #Optional
    object = "${oci_objectstorage_object.entrypoint.object}"
}

resource "oci_objectstorage_object" "mushop_lite" {
    #Required
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    content = "${file("./scripts/mushop-lite-mono.tar.gz")}"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    object = "mushop_lite"

}

resource "oci_objectstorage_preauthrequest" "mushop_lite_preauth" {
    #Required
    access_type = "ObjectRead"
    bucket = "${oci_objectstorage_bucket.mushop.name}"
    name = "mushop_lite_preauth"
    namespace = "${data.oci_objectstorage_namespace.user_namespace.namespace}"
    time_expires = "${timeadd(timestamp(),"30m")}"

    #Optional
    object = "${oci_objectstorage_object.mushop_lite.object}"
}


