module "sg" {
  source = "./sg"
}
module "infra" {
  source = "./infra"
  web-sg = module.sg.web-sg.id
}

#output "sg-final" {
#  value = lookup(module.sg.web-sg,"id","nothing")
#}