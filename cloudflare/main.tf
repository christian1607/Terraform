resource "cloudflare_record" "web" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "ws"
  value   = "caltamirano.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "fleetman" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "fleetman"
  value   = "192.168.1.32"
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "kiali" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "kiali"
  value   = "192.168.1.32"
  type    = "A"
  ttl     = 3600
}


resource "cloudflare_record" "azurestorage" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "storage"
  value   = "storagelenki.blob.core.windows.net"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "azurestorageasverify" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "asverify.storage"
  value   = "asverify.storagelenki.blob.core.windows.net"
  type    = "CNAME"
  ttl     = 3600
}






//resource "cloudflare_record" "elb_tf" {
//  zone_id = "${var.cloudflare_zone_id}"
//  name    = "elb_tf"
//  value   = "${data.terraform_remote_state.elb_tf.outputs.elb_dns_name}"
//  type    = "CNAME"
//  ttl     = 3600
//}