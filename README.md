# Terraform ECS Fargate Example

## Prerequisites
- [Terraform](https://www.terraform.io/)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS credentials configured

## Deployment
1. Deploy IAM roles via CloudFormation:
   ```bash
   pushd iam && ./deploy-iam.sh <env> && popd
   ```
2. Export IAM role ARNs from the stack outputs:
   ```bash
   export TF_VAR_iam_task_execution_role_arn=<TaskExecutionRoleArn>
   export TF_VAR_iam_task_role_arn=<TaskRoleArn>
   export TF_VAR_iam_app_autoscaling_role_arn=<AppAutoScalingRoleArn>
   ```
3. Initialize and apply Terraform:
   ```bash
   terraform init
   terraform apply
   ```

## Cleanup
```bash
terraform destroy
pushd iam
aws cloudformation delete-stack --stack-name ecs-task-exec-<env>
aws cloudformation delete-stack --stack-name ecs-task-<env>
aws cloudformation delete-stack --stack-name ecs-svc-asg-<env>
popd
```
