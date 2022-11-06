# terraform-practice

## Memo
1. command `aws configure`. register local AWS credencial for IAM  

2. make S3 for .tfstate  

3. setting provider.tf  

4. trraform command  
```
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Todo
- [] VPC
- [] EC2
- [] S3
- [] RDS
- [] ERC
- [] ECS

## Article
 - https://registry.terraform.io/providers/hashicorp/aws/latest/docs

### modules
 - https://hitolog.blog/2021/10/17/terraform-module/  
 

### VPC

### RDS
- https://zenn.dev/suganuma/articles/fe14451aeda28f  
- https://rurukblog.com/post/terraform-mysql/  

### EC2

### redis

### ECR

### ECS
 - https://qiita.com/charon/items/15cb8be654c4a179e3a7  
 

### S3 
- https://dev.classmethod.jp/articles/s3-cloudfront-static-site-design-patterns-2022/#note-917582-1  
- http://s3-site-test-20220903-1.s3-website-ap-northeast-1.amazonaws.com/  
- https://d1zkwh5t4jd0q6.cloudfront.net  


    
### Procedure
 1. setup network
    ```
    $ cd ./dev/network
    $ terraform plan
    $ terraform apply  
    ```
2. setup modules
    ```
    $ cd ./dev/services
    $ terraform plan
    $ terraform apply  
    ```