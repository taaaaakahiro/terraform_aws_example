# vpcのidを取得
output "vpc_id" {
  value = aws_vpc.demo_vpc.id
}