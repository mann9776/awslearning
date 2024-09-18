#!/bin/bash
#
#
###########################################
# Author: Manmohan Singh
# Date: 18-09-2024
#
# Version: v1
#
# This script will report the AWS resource usage
###########################################

#set -x #For debug mode

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

echo "List S3 buckets"
aws s3 ls

echo "List EC2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

echo "List lambda functions"
aws lambda list-functions

echo "List IAM users"
aws iam list-users
