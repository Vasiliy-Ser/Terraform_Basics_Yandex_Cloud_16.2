# Домашнее задание к занятию 16.5 «Использование Terraform в команде» - Падеев Василий

------

### Задание 1

1. Возьмите код:
- из [ДЗ к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/src),
- из [демо к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1).
2. Проверьте код с помощью tflint и checkov. Вам не нужно инициализировать этот проект.
3. Перечислите, какие **типы** ошибок обнаружены в проекте (без дублей).

---
Решение:
  
  1. В проекте src ошибок checkov обнаружено не было (ресурс (https://api0.prismacloud.io/bridgecrew/api/v2/guidelines недоступен, Checkov работает только с локальными правилами.)  
  Ошибки tflint:  
  - В блоке required_providers для провайдера yandex отсутствует указание версии, что требуется в Terraform;  
  - Переменные vms_ssh_root_key, vm_web_name, vm_db_name объявлены в файле variables.tf, но нигде не используются.  
    
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/1.1.png)   
 ![answer2](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/1.2.png)   

  2. В проекте vms ошибки checkov: Этот чек предупреждает, что в качестве ссылки на источник модуля следует использовать хеш коммита, а не ветку. Это необходимо для того, чтобы гарантировать, что конфигурация использует неизменяемую версию модуля, которая не будет изменяться при обновлении ветки.  
  Ошибки tflint:  
  - В конфигурационном файле указано использование Git-репозитория без указания конкретной версии (т.е. используется ветка main).  
  - Отсутствие ограничения версии для провайдера  
  - В файле variables.tf переменная public_key объявлена, но нигде не используется в конфигурации. 

 ![answer3](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/1.3vms.png)   
 ![answer4](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/1.4vms.png)   

  3. В проекте passwords ошибок checkov обнаружено не было (ресурс (https://api0.prismacloud.io/bridgecrew/api/v2/guidelines недоступен, Checkov работает только с локальными правилами.)  
  Предупреждение tflint: отсутствие версии для провайдера random   

 ![answer5](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/1.5p.png)   
 ![answer6](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/1.6p.png)     

------

### Задание 2

1. Возьмите ваш GitHub-репозиторий с **выполненным ДЗ 4** в ветке 'terraform-04' и сделайте из него ветку 'terraform-05'.
2. Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.
3. Закоммитьте в ветку 'terraform-05' все изменения.
4. Откройте в проекте terraform console, а в другом окне из этой же директории попробуйте запустить terraform apply.
5. Пришлите ответ об ошибке доступа к state.
6. Принудительно разблокируйте state. Пришлите команду и вывод.

---
Решение:
  
 ![answer7](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/2.1.png)   
 ![answer8](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/2.2.png)   
 ![answer9](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/2.3.png)   
 ![answer10](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/2.4.png)   
 ![answer11](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/c1e968bf6f5e076f23eb67d9297047cf685d9124/png/2.5.png)  

------
### Задание 3  

1. Сделайте в GitHub из ветки 'terraform-05' новую ветку 'terraform-hotfix'.
2. Проверье код с помощью tflint и checkov, исправьте все предупреждения и ошибки в 'terraform-hotfix', сделайте коммит.
3. Откройте новый pull request 'terraform-hotfix' --> 'terraform-05'. 
4. Вставьте в комментарий PR результат анализа tflint и checkov, план изменений инфраструктуры из вывода команды terraform plan.
5. Пришлите ссылку на PR для ревью. Вливать код в 'terraform-05' не нужно.

---
Решение:
  
  CKV_TF_1: Требуется, чтобы источники модулей использовали хеш коммита.

  CKV_TF_2: Требуется, чтобы источники модулей использовали тег с номером версии.

 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/3.1.png)   
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/3.2.png)   
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/3.3.png)   
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/3.4.png)   

------
### Задание 4

1. Напишите переменные с валидацией и протестируйте их, заполнив default верными и неверными значениями. Предоставьте скриншоты проверок из terraform console. 

- type=string, description="ip-адрес" — проверка, что значение переменной содержит верный IP-адрес с помощью функций cidrhost() или regex(). Тесты:  "192.168.0.1" и "1920.1680.0.1";
- type=list(string), description="список ip-адресов" — проверка, что все адреса верны. Тесты:  ["192.168.0.1", "1.1.1.1", "127.0.0.1"] и ["192.168.0.1", "1.1.1.1", "1270.0.0.1"].

---yes
Решение:
  
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/4.1.png)   
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/4.2.png)   
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/4.3.png)   

## Дополнительные задания (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.** Их выполнение поможет глубже разобраться в материале.   
Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 
------
### Задание 5*
1. Напишите переменные с валидацией:
- type=string, description="любая строка" — проверка, что строка не содержит символов верхнего регистра;
- type=object — проверка, что одно из значений равно true, а второе false, т. е. не допускается false false и true true:
```
variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = true
        Connor = false
    }

    validation {
        error_message = "There can be only one MacLeod"
        condition = <проверка>
    }
}
```
---
Решение:
  
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/5.1.png)   
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/5.2.png)   
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/5.3.png)    
 ![answer1](https://github.com/Vasiliy-Ser/Terraform_Basics_Yandex_Cloud_16.2/blob/aebab6d9cfa7cd57b4caad5cbb812e78b360ecf0/png/5.4.png)   

------
### Задание 6*

1. Настройте любую известную вам CI/CD-систему. Если вы ещё не знакомы с CI/CD-системами, настоятельно рекомендуем вернуться к этому заданию после изучения Jenkins/Teamcity/Gitlab.
2. Скачайте с её помощью ваш репозиторий с кодом и инициализируйте инфраструктуру.
3. Уничтожьте инфраструктуру тем же способом.


---
Решение:
  
  

------
### Задание 7*
1. Настройте отдельный terraform root модуль, который будет создавать YDB, s3 bucket для tfstate и сервисный аккаунт с необходимыми правами. 

---
Решение:
  




