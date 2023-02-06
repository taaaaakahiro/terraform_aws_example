# terraform-example

## terraform set up
1.  setup env
```sh
$ export AWS_ACCESS_KEY_ID=XXXXXX
$ export AWS_SECRET_ACCESS_KEY=XXXXXX
```

2. init network
```sh
$ cd ./init
$ terraform plan
$ terraform apply  
```

3. move to targest
```sh
$ cd ./dev/<TARGET_RESOURCE>
$ terraform plan
$ terraform apply
```

## Docs
 - https://registry.terraform.io/providers/hashicorp/aws/latest/docs

### RDS
- https://zenn.dev/suganuma/articles/fe14451aeda28f  
- https://rurukblog.com/post/terraform-mysql/  
- https://dev.classmethod.jp/articles/sales-rds-ec2-session/


### EC2
```sh
$ ssh-keygen -N "" -f ec2_key #key generate
```

### Redis

### ECR

### ECS
 - https://qiita.com/charon/items/15cb8be654c4a179e3a7  
 
### S3
- https://dev.classmethod.jp/articles/s3-cloudfront-static-site-design-patterns-2022/#note-917582-1  
- http://s3-site-test-20220903-1.s3-website-ap-northeast-1.amazonaws.com/  
- https://d1zkwh5t4jd0q6.cloudfront.net  

## CloudFront
    

