namespace   = "flufi"
environment = "production"
stage       = "service"
label_order = ["namespace", "stage", "environment"]
tags = {
  "namespace"   = namespace
  "environment" = environment
  "stage"       = stage
}
#### main.tf ####
