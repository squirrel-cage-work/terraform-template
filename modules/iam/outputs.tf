output "ecs_task_excecution_role_arn" {
    description = "arn of the ecs task execution role"
    value       = aws_iam_role.ecs_task_excecution_role.arn
}

output "ecs_task_role_arn" {
    description = "arn of the ecs task role"
    value       = aws_iam_role.ecs_task_role.arn
}