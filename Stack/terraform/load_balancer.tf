# Load balancer

resource oci_load_balancer_load_balancer lb {
  compartment_id  = var.compartment_ocid
  display_name    = local.lb_name
  ip_mode         = "IPV4"
  is_private      = "false"
  shape           = "flexible"
  shape_details {
    maximum_bandwidth_in_mbps = "10"
    minimum_bandwidth_in_mbps = "10"
  }
  network_security_group_ids = [
    oci_core_network_security_group.lb_network_security_group.id,
  ]
  subnet_ids = [
    oci_core_subnet.lb_subnet.id,
  ]
  defined_tags = {}
  freeform_tags = local.common_tags
}

resource oci_load_balancer_backend_set bs {
  load_balancer_id = oci_load_balancer_load_balancer.lb.id
  name             = format( "backend-set-%s", local.lb_name )
  policy           = "ROUND_ROBIN"
  health_checker {
    interval_ms         = "10000"
    port                = "80"
    protocol            = "HTTP"
    response_body_regex = ""
    retries             = "3"
    return_code         = "200"
    timeout_in_millis   = "3000"
    url_path            = "/index.html"
  }
}

resource oci_load_balancer_backend be {
  count             = var.compute_count
  load_balancer_id  = oci_load_balancer_load_balancer.lb.id
  backendset_name   = oci_load_balancer_backend_set.bs.name
  backup            = count.index != 0 ? "true" : "false"
  drain             = "false"
  ip_address        = element(oci_core_instance.web_server.*.private_ip, count.index)
  offline           = "false"
  port              = "80"
  weight            = "1"
}

## HTTPS listener
resource oci_load_balancer_listener listener_https {
  load_balancer_id          = oci_load_balancer_load_balancer.lb.id
  name                      = format( "https-listener-%s", local.lb_name )
  default_backend_set_name  = oci_load_balancer_backend_set.bs.name
  port                      = "443"
  protocol                  = "HTTP"
  hostname_names            = []
  rule_set_names            = []
  ssl_configuration {
    certificate_name  = oci_load_balancer_certificate.lb_certificate.certificate_name
    cipher_suite_name = "oci-default-ssl-cipher-suite-v1"
    certificate_ids = []
    protocols = [
      "TLSv1.2",
    ]
    server_order_preference = "ENABLED"
    verify_peer_certificate = "false"
    verify_depth            = "1"
  }
  connection_configuration {
    backend_tcp_proxy_protocol_version = "0"
    idle_timeout_in_seconds            = "60"
  }
  lifecycle {
    replace_triggered_by = [
      tls_self_signed_cert.lb_cert.id
    ]
  }
}

## HTTP listener
resource oci_load_balancer_listener listener_http {
  load_balancer_id          = oci_load_balancer_load_balancer.lb.id
  name                      = format( "http-listener-%s", local.lb_name )
  default_backend_set_name  = oci_load_balancer_backend_set.bs.name
  port                      = "80"
  protocol                  = "HTTP"
  hostname_names            = []
  rule_set_names            = [
    oci_load_balancer_rule_set.redirect_rule.name,
  ]
  connection_configuration {
    backend_tcp_proxy_protocol_version = "0"
    idle_timeout_in_seconds            = "60"
  }
}

## Certificate
resource oci_load_balancer_certificate lb_certificate {
  certificate_name    = format( "Certificate-%s", random_string.deploy_id.result )
  load_balancer_id    = oci_load_balancer_load_balancer.lb.id
  public_certificate  = tls_self_signed_cert.lb_cert.cert_pem
  private_key         = tls_private_key.lb_cert_key.private_key_pem
  #passphrase          =
  #ca_certificate      =
}

## Rule set
resource oci_load_balancer_rule_set redirect_rule {
  load_balancer_id = oci_load_balancer_load_balancer.lb.id
  name             = format( "HTTP_to_HTTPS_%s", random_string.deploy_id.result )
  items {
    action = "REDIRECT"
    conditions {
      attribute_name  = "PATH"
      attribute_value = "/"
      operator        = "FORCE_LONGEST_PREFIX_MATCH"
    }
    redirect_uri {
      host     = "{host}"
      path     = "/{path}"
      port     = "443"
      protocol = "https"
      query    = "?{query}"
    }
    response_code = "302"
  }
}