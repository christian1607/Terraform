resource "cloudflare_record" "web" {
  zone_id = "${var.cloudflare_zone_id}"
  name    = "ws"
  value   = "caltamirano.com"
  type    = "CNAME"
  ttl     = 3600
}