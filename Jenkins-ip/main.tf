terraform {
  backend "s3" {
    bucket = "waleapagun-bucket"
    key    = "repo/Jenkins-ip/terraform.tfstate"
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

data "aws_instance" "artifactory" {
  instance_id = "i-03ad349494d920641"
}

resource "aws_route53_record" "artifactory" {
  name    = "artifactory.waleapagun.online"
  type    = "A"
  zone_id = "Z08999912AI7EUJ47AGDO"
  records = [data.aws_instance.artifactory.public_ip]
  ttl = 10
}








