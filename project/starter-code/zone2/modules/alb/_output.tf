output "lb_target_group_arn" {
  value = aws_lb_target_group.web.arn
}

output "lb_id" {
  value = aws_lb.flask.id
}

output "lb_arn" {
  value = aws_lb.flask.arn
}

output "lb_security_group" {
  value = aws_security_group.flask.id
}

output "lb_dns" {
  value = aws_lb.flask.dns_name
}