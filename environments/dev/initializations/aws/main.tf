module "backend_bucket" {
  source              = "../../../../modules/aws/backend-bucket"
  project             = var.project
  backend_bucket_name = var.backend_bucket_name
}

