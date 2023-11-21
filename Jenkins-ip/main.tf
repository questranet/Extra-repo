terraform {
  backend "s3" {
    bucket = "waleapagun-bucket"
    key    = "repo/Jenkins-ip/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {
  instance_id = "i-02429f20c13c718fb"
}

resource "aws_route53_record" "jenkins" {
  name    = "jenkins.waleapagun.online"
  type    = "A"
  zone_id = "Z08999912AI7EUJ47AGDO"
  records = [data.aws_instance.instance.public_ip]
  ttl = 10
}

#data "aws_instance" "artifactory" {
#  instance_id = "i-0d7eeeba40f9bf8a7"
#}
#
#resource "aws_route53_record" "artifactory" {
#  name    = "artifactory.waleapagun.online"
#  type    = "A"
#  zone_id = "Z08999912AI7EUJ47AGDO"
#  records = [data.aws_instance.artifactory.public_ip]
#  ttl = 10
#}








