terraform {
  backend "s3" {
    bucket = "waleapagun-bucket"
    key    = "Extra-repo/Jenkins-ip/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {
  instance_id = "i-07431c766b24cd39b"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.waleapagun.online"
  type    = "A"
  zone_id = "Z08999912AI7EUJ47AGDO"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}






