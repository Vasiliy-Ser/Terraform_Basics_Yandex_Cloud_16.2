# cat ~/.aws/config 
# [default]
# region=ru-central1
# cat ~/.aws/credentials 
# [default]
# aws_access_key_id = YCAJEK...
# aws_secret_access_key = YCMBzZ3...


#For terraform >=1.6<=1.8.5
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.140.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2.0"  # Указываем версию, например, "~> 2.2"
    }
  }
  required_version = ">=1.8.4"

  backend "s3" {
    
    shared_credentials_files = ["~/.aws/credentials"]
#    shared_config_files = [ "~/.aws/config" ]
    profile = "default"
    region="ru-central1"

    bucket     = "tfstate-testing" #FIO-netology-tfstate
    key = "test/terraform.tfstate"
    

    # access_key                  = "..."          #Только для примера! Не хардкодим секретные данные!
    # secret_key                  = "..."          #Только для примера! Не хардкодим секретные данные!


    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true # Необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

  endpoints ={
    dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g0ekit9ink3ggcqn30/etnkktj0nt87gn7i9ke6"
    s3 = "https://storage.yandexcloud.net"
  }

    dynamodb_table              = "tfstate-test"
  }

}

provider "yandex" {
  # token     = var.token
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
#  zone                     = var.default_zone
  service_account_key_file = file("~/.authorized_key.json")
}
