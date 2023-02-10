provider "aws" {

  shared_config_files      = ["/home/mozoz/Desktop/ITI/terrform/.aws/config"]
  shared_credentials_files = ["/home/mozoz/Desktop/ITI/terrform/.aws/credentials"]
  region                   = "us-east-2"
  profile                  = "terraform"
}

