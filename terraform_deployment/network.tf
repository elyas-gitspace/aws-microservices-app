#security group
resource "aws_security_group" "elyass_sg" {
  name        = "elyass-sg"
  description = "Autorisation de SSH et HTTP"
  vpc_id      = data.aws_vpc.default.id

  # SSH
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Sortie (obligatoire)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # j'ai autorisé les sorties sur tous les ports car c'est un projet perso, mais bien entendu, en prod, on limite les sorties par soucis de sécurité (fuite de données par exemple)
  }
}

