#!/bin/bash

set -x -o errexit -o pipefail

echo ${job_root_dir}
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --stack-name)
    control_plane_stack_name="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

cd "${artifacts_dir}"

eks_control_plane_template_uri="file://${job_root_dir}/infra.yaml"
parameters_file_path="${job_root_dir}/parameters.json"
parameters_file_uri="file://${parameters_file_path}"

export key_name="${account}"
envsubst < "${parameters_file_path}.tmpl" > "${parameters_file_path}"

echo "Final parameters.json file content"
cat "${parameters_file_path}"

# create CloudFormation stack for EKS cluster
echo "Creating CloudFormation stack for EKS cluster: ${control_plane_stack_name}"
aws cloudformation create-stack \
    --stack-name ${control_plane_stack_name} \
    --region ${aws_region} \
    --template-body ${eks_control_plane_template_uri} \
    --parameters ${parameters_file_uri} \
    --capabilities CAPABILITY_NAMED_IAM

# wait for the stack to get created
echo "Waiting for the CloudFormation stack to get created: ${control_plane_stack_name}"
aws cloudformation wait stack-create-complete \
    --stack-name ${control_plane_stack_name} \
    --region ${aws_region}

# get the details of stack
aws cloudformation describe-stacks \
    --stack-name ${control_plane_stack_name} \
    --region ${aws_region} \
    --output json > "${control_plane_stack_name}-output.json"
