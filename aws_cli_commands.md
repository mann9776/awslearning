## AWS-CLI commands
## Install AWS CLI in linux
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

### launch an instance into a default subnet

- aws ec2 run-instances \
    --image-id ami-0abcdef1234567890 \
    --instance-type t2.micro \
    --key-name MyKeyPair

### Start ec2 instance

- aws ec2 start-instances --instance-ids i-0e212af1a7aew14fe

### Stop ec2 instance

- aws ec2 stop-instances --instance-ids i-0e212af1a7aew14fe

### Terminate ec2 instance

- aws ec2 terminate-instances --instance-ids i-093a97c9d4b7be767

### Get console output

- aws ec2 get-console-output --instance-id i-0e212af1a7aew14fe
- aws ec2 get-console-output --instance-id i-0e212af1a7aew14fe --latest --output text


## creating EC2 instance from scratch
1. Creating a VPC(Virtual Private Clous) under which ec2 instance will be launched. Note the *vpcId* generated here.
- aws ec2 create-vpc --cidr-block 10.0.0.0/16

2. Creating subnets, two subnets are required, from which one would be public to access internet. Note the *subnetId*. ap-south-1a or ap-south-1b availibility-zone can be taken as ap-south-1c does not support instance type t2.micro
    - 2.1 First Subnet # Public
    - aws ec2 create-subnet --vpc-id <vpcId> --cidr-block 10.0.1.0/24 --availability-zone ap-south-1a
    - 2.2 Second subnet # Private
    - aws ec2 create-subnet --vpc-id <vpcId> --cidr-block 10.0.0.0/24 --availability-zone ap-south-1a

3. Creating internet gateway, which is used by private subnet to access internet. Note the *InternetGatewayId*. And attach internet gateway to the vpc created.
- aws ec2 create-internet-gateway
- aws ec2 attach-internet-gateway --vpc-id <vpcId> --internet-gateway-id <InternetGatewayId>

4. Creating Route Table, which will further be assigned to created vpc. Note the *RouteTableId* from the first command below.
- aws ec2 create-route-table --vpc-id <vpcId>
- aws ec2 create-route --route-table-id <RouteTableId> --destination-cidr-block 0.0.0.0/0 --gateway-id <InternetGatewayId>

5. Viewing the Route table and subnets for verification.
- aws ec2 describe-route-tables --route-table-id <RouteTableId>
- aws ec2 describe-subnets --filters "Name=vpc-id,Values=<vpcId>" --query "Subnets[\*].{ID:SubnetId,CIDR:CidrBlock}"

6. Associating Route Table and modifying private subnet, then make same subnet as public by mapping the Public IP address to it.
- aws ec2 associate-route-table --subnet-id <SubnetId> --route-table-id <RouteTableId>
- aws ec2 modify-subnet-attribute --subnet-id <SubnetId> --map-public-ip-on-launch

7. Creating key pair and security group, this key pair will be used to access the EC2 instance, keep it safe and secure. 
    7.1 create key pair command. Key pair filename AWSKeypair can be changed by user.
    - aws ec2 create-key-pair --key-name AWSKeypair --query "KeyMaterial" --output-text > "C:\Users\singhman\Downloads\AWSKeypair.pem"
    7.2 create security group command, provide user-defined security group and description
    - aws ec2 create-security-group --group-name <security-group-name> --description "<description>" --vpc-id <vpcId>
    7.3 Note the *GroupId* and use it in next step
    - aws ec2 authorize-security-group-ingress --group-id <GroupId> --protocol tcp --port 22 --cidr 0.0.0.0/0

8. Running the EC2 instance, need AMI-Id so login to AWS Console and choose any AMI type and take id. Example- for ubuntu OS, AMI ID - ami-0522ab6e1ddcc7055. Note the *InstanceId*. t2.micro instance type is free-tier eligible.
- aws ec2 run-instances --image-id <ami-id> --count 1 --instance-type t2.micro --key-name AWSKeypair --security-group-ids <SecurityGroupId> --subnet-id <SubnetId>

9. Describe the instance using InstanceId
- aws ec2 describe-instances --instance-id InstanceId
