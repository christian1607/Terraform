resource "cloudflare_record" "web" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "ws"
  value   = "caltamirano.com"
  type    = "CNAME"
  ttl     = 3600
}

resource "cloudflare_record" "elb_tf" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "elb_tf"
  value   = "${data.terraform_remote_state.elb_tf.outputs.elb_dns_name}"
  type    = "CNAME"
  ttl     = 3600
}