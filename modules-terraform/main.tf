module "sg" {
  source = "./sg"
}
module "infra" {
  source = "./infra"
}

output "root_module" {
  value = path.module
}

output "web_module" {
  value = module.infra.web-path
}

output "sg_module" {
  value = module.sg.sg-path
}
#output "sg-final" {
#  value = lookup(module.sg.web-sg,"id","nothing")
#}