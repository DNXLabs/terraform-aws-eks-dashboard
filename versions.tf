terraform {
  required_version = ">= 0.13"

  required_providers {
    aws        = ">= 4.0.0, < 5.46.0"
    helm       = ">= 1.0, < 3.0"
    kubernetes = ">= 1.10.0, < 3.0.0"
  }
}