resource "aws_db_instance" "default" {
  allocated_storage      = 5
  db_name                = "Fires_Garden"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "foo"
  password               = "foobarbaz"
  vpc_security_group_ids = [aws_security_group.web_sg2.id]
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}