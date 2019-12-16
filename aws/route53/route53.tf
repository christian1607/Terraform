resource "aws_route53_zone" "caltamirano" {
  name = "caltamirano.com"
}


resource "aws_route53_record" "web-caltamirano" {
  zone_id = "${aws_route53_zone.caltamirano.zone_id}"
  name = "web.caltamirano.com"
  ttl = "300"
  type = "A"
  records = [
                "${aws_instance.web-server-1.public_ip}",
                "${aws_instance.web-server-2.public_ip}"
            ]  
}

