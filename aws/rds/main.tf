resource "aws_db_instance" "mysql" {
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "tfdatabase"
  username = "${var.db_username}"
  password = "${var.db_password}"
  skip_final_snapshot = true

}
