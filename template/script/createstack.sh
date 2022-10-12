#!/bin/bash


echo "${VPC}"

parameterfilepath="${WORKSPACE}/parameters.json"

echo VPC = "${VPC}"

export VPC

envsubst < "${WORKSPACE}/template/asg_parameters.json.tmpl" > "${WORKSPACE}/template/parameters.json"


cat "${WORKSPACE}/template/asg_parameters.json.tmpl"
