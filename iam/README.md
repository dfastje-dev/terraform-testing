# IAM Roles for ECS Fargate

## Deployment
Use the helper script to deploy the CloudFormation stacks. Pass an environment name to differentiate resources:

```bash
./deploy-iam.sh <env>
```

This creates three stacks:
- `ecs-task-exec-<env>`
- `ecs-task-<env>`
- `ecs-svc-asg-<env>`

The script prints stack outputs containing the ARNs. Copy these values into Terraform variables or `tfvars`:

- `iam_task_execution_role_arn`
- `iam_task_role_arn`
- `iam_app_autoscaling_role_arn`
