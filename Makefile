default:
	echo "Please specify an entry in the Makefile"
update-hosted-zone:
	aws cloudformation update-stack --stack-name DNS --template-body file://hosted-zone/cloudformation.yml --tags Key=service,Value=dns
create-hosted-zone:
	aws cloudformation create-stack --stack-name DNS --template-body file://hosted-zone/cloudformation.yml --tags Key=service,Value=dns
create-dnssec-kms:
	aws cloudformation create-stack --region us-east-1 --stack-name DNSSECKMS --template-body file://dnssec-kms/cloudformation.yml --tags Key=service,Value=dns
update-dnssec-kms:
	aws cloudformation update-stack --region us-east-1 --stack-name DNSSECKMS --template-body file://dnssec-kms/cloudformation.yml --tags Key=service,Value=dns
create-records:
	aws cloudformation create-stack --stack-name DNSRecords --template-body file://dns-records/cloudformation.yml --tags Key=service,Value=dns
update-records:
	aws cloudformation update-stack --stack-name DNSRecords --template-body file://dns-records/cloudformation.yml --tags Key=service,Value=dns
