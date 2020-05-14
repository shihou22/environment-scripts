#!/bin/bash
#EC2インスタンスから169.254.169.254（全region共通）にリクエストを送ることで、自身のメタデータを取得
export AWS_DEFAULT_REGION=$(curl -s http://169.254.169.254/latest/meta-data/local-hostname | cut -d '.' -f2)
export INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id/)

aws ec2 describe-instances \
--instance-ids ${INSTANCE_ID} \
| jq -cr '.Reservations[].Instances[].Tags[] | [.Key, .Value] | @tsv' \
| awk '{print "export " $1 "=" $2}'