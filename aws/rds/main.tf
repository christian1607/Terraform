resource "aws_db_instance" "mysql" {
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "tf-database"
  username = "${var.db_username}"
  password = "${var.db_password}"

}
