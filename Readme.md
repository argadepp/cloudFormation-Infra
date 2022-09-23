To Create the VPC , Subnets , IG , NatGateway , Security Groups and EKS Cluster using AWS Cloud Formation . Use the templates and Jenkinsfile for automation .

Before creating the node group comment the code of LaunchTemplate and NodeGroup and ten create first stack of VPC and EKS and post that get the required inputs for Node Group from cluster and pass it in launch template .

Steps are below : 
1. Clone the repository 
2. Make sure your Jenkins is ready and AWS Steps plugin is successfully installed .
3. Create the User in AWS and configure those credentials in global with AWS Credentials type . Refer https://aws.amazon.com/blogs/compute/building-a-jenkins-pipeline-with-aws-sam/#:~:text=Configuring%20Jenkins&text=Navigate%20to%20Manage%20Jenkins%20%3E%20Manage,access%20key%20and%20choose%20OK
4. Upload the eks-infra.yaml in your S3 bucket .
5. Copy the object URL of that file and pass it in Jenkins file where create-stack command is present .
6. Built the Job

You can refer this to Upgrade the EKS Cluster too , simply you need to pass the latest version in parameters and to upgrade the node pass the proper AMI ID as per the required kubernetes version .

