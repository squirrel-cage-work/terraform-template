output "ecr_repository_url" {
  value = module.ecr.ecr_repository_url
}

output "ecs_task_excecution_role_arn" {
  value = module.iam.ecs_task_excecution_role_arn
}

output "ecs_task_role_arn" {
  value = module.iam.ecs_task_role_arn
}