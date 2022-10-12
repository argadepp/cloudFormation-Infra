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

echo "!!!!!!!!!!!!! ${action} of ${environment}-${stackName} stack is initiated !!!!!!!!!!!!!!!!!!!!!!!!"
aws cloudformation "${action}"-stack \
--template-body "${templateUrl}" --region "${aws_region}" \
--stack-name "${environment}-${stackName}" \
--parameters  "${parameterfilepath}" \
--capabilities CAPABILITY_NAMED_IAM

echo "Waiting for the '${action}' operation to complete on CloudFormation stack: ${environment}-${stackName}"
aws cloudformation wait stack-${action}-complete \
    --stack-name ${environment}-${stackName} \
    --region ${aws_region}
    
echo "${stackName} is created successfully !!!!!!!!!!!!!!!!"    
