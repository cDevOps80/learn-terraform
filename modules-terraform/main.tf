module "sg" {
  source = "./sg"
}
#module "infra" {
#  source = "./infra"
#  web-sg = lookup(module.sg.web-sg,"id","sg-0665a56c7cd09a0e0")
#}

output "sg-final" {
  value = module.sg.web-sg
}