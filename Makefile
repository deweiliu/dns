default:
	echo "Please specify an entry in the Makefile"
update-hosted-zone:
	aws cloudformation update-stack --stack-name DNS --template-body file://hosted-zone/cloudformation.yml --tags Key=service,Value=dns
update-dnssec-kms:
	aws cloudformation update-stack --region us-east-1 --stack-name DNSSECKMS --template-body file://dnssec-kms/cloudformation.yml --tags Key=service,Value=dns
update-records:
	aws cloudformation update-stack --stack-name MicrosoftDNSRecords --template-body file://ms-exchange-records/cloudformation.yml --tags Key=service,Value=dns
