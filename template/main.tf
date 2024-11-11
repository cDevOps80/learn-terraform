output "name" {
  value = "${templatefile("./value.yaml",{
name = "chaitu"
})}"
}