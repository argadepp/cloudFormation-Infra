pipeline {
    agent any
    environment {
        aws_region = "${params.aws_region}"
        
    }
    parameters {
        
       
         booleanParam(name: 'Refresh', defaultValue: false , description: 'Refresh this Job')
         choice(name: 'environment', choices: ['dev', 'qa', 'stage', 'stage-or', 'prod','toolchain'], description: '')
         string(name: 'aws_region', defaultValue: 'ap-south-1' , description: 'AWS Region' )
         string(name: 'vpcCIDR',defaultValue: '10.0.0.0/16',description: 'VPC CIDR Range')
         string(name: 'PublicSubnet1CIDR',defaultValue: '10.192.10.0/24',description: 'PublicSubnet1 CIDR Range')
         string(name: 'PublicSubnet2CIDR',defaultValue: '10.192.11.0/24',description: 'PublicSubnet2 CIDR Range')
         string(name: 'PrivateSubnet1CIDR',defaultValue: '10.192.20.0/24',description: 'PrivateSubnet1 CIDR Range')
         string(name: 'PrivateSubnet2CIDR',defaultValue: '10.192.21.0/24',description: 'PrivateSubnet1 CIDR Range')
         string(name: 'ClusterVersion',defaultValue: 'eksCluster', description: 'Specify the cluster name')
         choice(name: 'Product', choices:['eks-test1','eks-test-2'],description: 'Specify the product')
         choice(name: 'ApplicationName', choices: ['pratiktech-dev','pratiktech-stage'])
         string(name: 'stackName',defaultValue: 'eksCluster')
         string(name: 'ProductOwnerEmail',defaultValue: 'argadepp@gmail.com')
    }  
    stages {
        stage('Infra-Creation') {
            steps {
                
               withAWS(credentials: 'aws-access-secreate' , region: 'ap-south-1') {
                
               sh 'aws cloudformation create-stack --template-url https://cf-templates-nxd3fz7ymt6h-ap-south-1.s3.ap-south-1.amazonaws.com/launch-template.yaml --region "${aws_region}" --stack-name "${stackName}" --parameters   ParameterKey=EnvironmentName,ParameterValue="${environment}"  ParameterKey=VpcCIDR,ParameterValue="${vpcCIDR}"  ParameterKey=PublicSubnet1CIDR,ParameterValue="${PublicSubnet1CIDR}"  ParameterKey=PublicSubnet2CIDR,ParameterValue="${PublicSubnet2CIDR}"   ParameterKey=PrivateSubnet1CIDR,ParameterValue="${PrivateSubnet1CIDR}"  ParameterKey=PrivateSubnet2CIDR,ParameterValue="${PrivateSubnet2CIDR}"  ParameterKey=ClusterName,ParameterValue="${ClusterName}"  ParameterKey=ClusterVersion,ParameterValue="${ClusterVersion}"  ParameterKey=Product,ParameterValue="${Product}"  ParameterKey=ApplicationName,ParameterValue="${ApplicationName}" ParameterKey=ProductOwnerEmail,ParameterValue="${ProductOwnerEmail}" --capabilities CAPABILITY_NAMED_IAM'
               }
            }
        }
        
        
    }
}
