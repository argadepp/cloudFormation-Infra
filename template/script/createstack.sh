# #!/bin/bash


# echo "${VPC}"

# parameterfilepath="${WORKSPACE}/template/parameters.json"

# echo VPC = "${VPC}"

# export VPC

# envsubst < "${WORKSPACE}/template/asg_parameters.json.tmpl" > "${WORKSPACE}/template/parameters.json"


# cat "${WORKSPACE}/template/asg_parameters.json.tmpl"
# echo "Final Parameters"
# cat "${WORKSPACE}/template/parameters.json"


#!/bin/bash

parameterfilepath="file://${WORKSPACE}/template/parameters.json"

echo "!!!!!!!!!!!!!!!!!!!!!!!Substitute the parameters!!!!!!!!!!!!!!!!"
envsubst < "${WORKSPACE}/template/asg_parameters.json.tmpl" > "${WORKSPACE}/template/parameters.json"
templateUrl="file://${WORKSPACE}/template/asg.yaml"
#cat "${WORKSPACE}/template/asg_parameters.json.tmpl"
echo "!!!!!!!!!!!!!!!!Final Parameters!!!!!!!!!!!!!!!!"
cat "${WORKSPACE}/template/parameters.json"

echo "!!!!!!!!!!!!! Creating stack !!!!!!!!!!!!!!!!!!!!!!!!"
aws cloudformation "${action}"-stack \
--template-url "${templateUrl}" --region "${aws_region}" \
--stack-name "${stackName}" \
--parameters  "${parameterfilepath}" \
--capabilities CAPABILITY_NAMED_IAM
