## AWS-CLI commands
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


