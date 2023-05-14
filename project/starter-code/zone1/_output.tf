output "account_id" {
   value = data.aws_caller_identity.current.account_id
 }

 output "caller_arn" {
   value = data.aws_caller_identity.current.arn
 }

 output "caller_user" {
   value = data.aws_caller_identity.current.user_id
 }

 output "grafana_dns" {
   value = kubernetes_service.grafana-external.status[0].load_balancer[0].ingress[0].hostname
 }

 output "ec2_public_ip" {
   value = module.project_ec2.ec2_instance_public_ip
 }

 output "lb_dns_name" {
   value = module.alb.lb_dns
 }