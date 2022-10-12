#!/bin/bash


echo "${VPC}"
echo "${job_root_dir}"
parameterfilepath="${job_root_dir}/parameters.json"

cat "${parameterfilepath}"
