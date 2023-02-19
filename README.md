# terraform-example

## run
1.  setup env
```sh
$ export AWS_ACCESS_KEY_ID=XXXXXX
$ export AWS_SECRET_ACCESS_KEY=XXXXXX
```

2. init
```sh
$ cd ./init
$ terraform plan
$ terraform apply  
```

3. dev
```sh
$ cd ./dev/<TARGET_RESOURCE>
$ terraform plan
$ terraform apply
```

## terraform registry
 - https://registry.terraform.io/providers/hashicorp/aws/latest/docs

## AWS
### RDS
 - RDS for MySQL
```sh
$ cd ./dev/db_rds_mysql_bation
$ ssh-keygen -N "" -f ec2_key # key generate
$ terraform apply
```
 - RDS for postgres(MySQL)
```sh
$ sudo yum install postgresql # or sudo yum install mysql
$ psql --host=<HOST> --port=5432 --username=demo_admin --password --dbname=example # login

```
- wiki
    - https://github.com/taaaaakahiro/terraform_aws_example/wiki/%5B%E5%8F%82%E8%80%83%5DRDS(MySQL)%E3%81%B8bation%E7%B5%8C%E7%94%B1%E3%81%A7SSH%E6%8E%A5%E7%B6%9A

### EC2
```sh
```

### Redis

### ECR

### ECS
 - https://qiita.com/charon/items/15cb8be654c4a179e3a7  
 
### S3/CloudFront
- https://zenn.dev/kou_pg_0131/articles/tf-cloudfront-oac

## Route53
 - https://dev.classmethod.jp/articles/onamae-to-route53/
 - 注意
    - ドメインを移管するときはドメイン発効から60日以上経っていること
    - terraformで作成したホストゾーンのNSレコードをドメインのNSレコードに書き換える(AWSから変更メールあり)

## terraform
### terraform import
 - https://tech.layerx.co.jp/entry/improve-iac-development-with-terraform-import
