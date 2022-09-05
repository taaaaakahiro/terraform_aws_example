// module practice
module "module_sample_main" {
  source = "../modules/local_file"
  content = "hello world!"
  filename = "../modules/local_file/hello.txt"
}

