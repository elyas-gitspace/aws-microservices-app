# ressource
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  subnet_id       = data.aws_subnets.default.ids[0]     # je récupère l'id du subnet par défaut (que j'ai lui même récupéré via data source dans data.tf)
  vpc_security_group_ids = [aws_security_group.elyass_sg.id]   # je récupère l'id du security group que j'ai crée dans network.tf
  key_name        = aws_key_pair.elyass_key.key_name    # je lie ma clé publique à l'EC2 que je suis en train de créer, pour que je puisse y accéder avec la clé privé (qui a été stockée dans ~/ .ssh/elyass_key)

  tags = {
    Name = "elyass-ec2-vm"
  }
}

#dans l'attribut key_name (afin de lier notre clé publique à cette instance EC2), pour trouver l'argument '.key_name' qui suit 'aws_key_pair.elyass_key.', je me suis appuyé sur cette doc : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair