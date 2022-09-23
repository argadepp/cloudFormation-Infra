To Create the VPC , Subnets , IG , NatGateway , Security Groups and EKS Cluster using AWS Cloud Formation . Use the templates and Jenkinsfile for automation .

Steps are below : 
1. Clone the repository 
2. Make sure your Jenkins is ready and AWS Steps plugin is successfully installed .
3. Create the User in AWS and configure those credentials in global with AWS Credentials type . Refer https://aws.amazon.com/blogs/compute/building-a-jenkins-pipeline-with-aws-sam/#:~:text=Configuring%20Jenkins&text=Navigate%20to%20Manage%20Jenkins%20%3E%20Manage,access%20key%20and%20choose%20OK
4. Upload the eks-infra.yaml in your S3 bucket .
5. Copy the object URL of that file and pass it in Jenkins file where create-stack command is present .
6. Built the Job
