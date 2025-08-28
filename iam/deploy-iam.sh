#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <env>" >&2
  exit 1
fi

ENV="$1"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function deploy_stack() {
  local name="$1"
  local template="$2"
  local stack="${name}-${ENV}"

  aws cloudformation deploy \
    --stack-name "$stack" \
    --template-file "$DIR/$template" \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides Env="$ENV"

  local outputs
  outputs=$(aws cloudformation describe-stacks --stack-name "$stack" --query "Stacks[0].Outputs" --output json)
  echo "$outputs"

  if ! echo "$outputs" | grep -q Arn; then
    echo "Failed to retrieve ARN from $stack" >&2
    exit 1
  fi
}

deploy_stack ecs-task-exec task-execution-role.yaml
deploy_stack ecs-task task-role.yaml
deploy_stack ecs-svc-asg service-autoscaling-role.yaml
