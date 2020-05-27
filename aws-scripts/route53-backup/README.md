#Purpose
This script is backup-script for AWS Route53

#condition
AWS CLI rrequired.

#How to use
$> bash route53-bk-aws-cli

#Import to AWS Route53
$> aws route53 change-resource-record-sets --hosted-zone-id [target-zone-id] --change-batch file://[backup.json]
