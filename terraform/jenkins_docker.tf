provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0d078af680e7a9b11"
  instance_type = "t2.medium"
  availability_zone = "eu-central-1b"
  key_name = "emirates"
  vpc_security_group_ids = [
    "sg-0b62183b0bec6769b"
  ] 
  tags = {
    Name = "Jenkins"
  }
}
resource "aws_instance" "SonarQube" {
  ami           = "ami-0b7407aab70a137c7"
  instance_type = "t2.medium"
  availability_zone = "eu-central-1b"
  key_name = "emirates"
  vpc_security_group_ids = [
    "sg-0b62183b0bec6769b"
  ] 
  tags = {
    Name = "SonarQube"
  }
}
