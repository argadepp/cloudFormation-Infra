#!/bin/bash


echo "${VPC}"

parameterfilepath="${WORKSPACE}/parameters.json"

echo VPC = "${VPC}"

export VPC

envsubst < "${WORKSPACE}/script/asg_parameters.json.tmpl" > "${WORKSPACE}/script/parameters.json"


cat "${parameterfilepath}"
