pipeline {
    agent any
    environment {
        aws_region = "${params.aws_region}"
    }
    parameters {
         booleanParam(name: 'Refresh', defaultValue: false, description: 'Refresh this Job')
         choice(name: 'environment', choices: ['dev', 'qa', 'stage', 'stage-or', 'prod','toolchain'], description: '')
         string(name: 'aws_region', defaultValue: 'ap-south-1' , description: 'AWS Region' )
         string(name: 'vpcCIDR',defaultValue: '10.0.0.0/16',description: 'VPC CIDR Range')
         string(name: 'PublicSubnet1CIDR',defaultValue: '10.192.10.0/24',description: 'PublicSubnet1 CIDR Range')
         string(name: 'PublicSubnet2CIDR',defaultValue: '10.192.11.0/24',description: 'PublicSubnet2 CIDR Range')
         string(name: 'PrivateSubnet1CIDR',defaultValue: '10.192.20.0/24',description: 'PrivateSubnet1 CIDR Range')
         string(name: 'PrivateSubnet2CIDR',defaultValue: '10.192.21.0/24',description: 'PrivateSubnet1 CIDR Range')
         string(name: 'ClusterVersion',defaultValue: false , description: 'Specify the cluster name')
         choice(name: 'Product', choices:['eks-test1','eks-test-2'],description: 'Specify the product')
         choice(name: 'ApplicationName', choices: ['pratiktech-dev','pratiktech-stage'])
    }  
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                echo "${env}"
                echo "${vpcCIDR}"
            }
        }
        
        
    }
}
