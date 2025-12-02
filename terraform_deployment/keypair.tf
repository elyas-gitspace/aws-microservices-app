#déploiement de la clé publique vers AWS (la clée privée reste bien entendu en local dans ~/ .ssh/elyass-key)
#source sur laquelle je me suis appuyé: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair

resource "aws_key_pair" "elyass_key" {
  key_name   = "elyass-key"
  public_key = file("~/.ssh/elyass-key.pub")
}
