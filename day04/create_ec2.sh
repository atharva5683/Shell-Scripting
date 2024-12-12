#!/bin/bash
set -euo pipefail

check_awscli(){
	if ! command  aws -v  &> /dev/null; then
	     echo "AWS CLI is not installed,pls install it" >&2
	     return 1

	fi

}
install_awscli(){
	echo "Installing AWS CLI"

	#Download and install AWS CLI v2
	curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	sudo apt-get install unzip -y  &> /dev/null
	unzip -q awscliv2.zip
	sudo ./aws/install

	#Verify It install or not
	aws --version

	#Clean up
	rm -rf awscliv2.zip ./aws
}
create_ec2_instance(){
	local ami_id="$1"
	local instance_type="$2"
	local key_name="$3"
	local subnet_id="$4"
	local security_group_ids="$5"
	local instance_name="$6"

	#Run AWS CLI command to create EC2 instance
	instance_id=$(aws ec2 run-instances \
        --image-id "$ami_id" \
        --instance-type "$instance_type" \
        --key-name "$key_name" \
        --subnet-id "$subnet_id" \
        --security-group-ids "$security_group_ids" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instance_name}]" \
        --query 'Instances[0].InstanceId' \
        --output text
  )
   if [[ -z "$instance_id" ]]; then
        echo "Failed to create EC2 instance." >&2
        exit 1
    fi

    echo "Instance $instance_id created successfully."

    # Wait for the instance to be in running state
    wait_for_instance "$instance_id"
}

wait_for_instance(){
	local instance_id="$1"
	echo "Waiting for instance $instance_id to be in running state.."

	while true; do
        state=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[0].Instances[0].State.Name' --output text)
        if [[ "$state" == "running" ]]; then
            echo "Instance $instance_id is now running."
            break
        fi
        sleep 10
    done
}
main(){

if ! check_awscli ; then
     install_awscli || exit 1
fi 
 echo "Creating EC2 instance..."

    # Specify the parameters for creating the EC2 instance
    ami_id="ami-053b12d3152c0cc71"
    instance_type="t2.micro"
    key_name="wp_server"
    subnet_id="subnet-0380301d6d6d73b22"
    security_group_ids="sg-016bf6d9957619602"  # Add your security group IDs separated by space
    instance_name="Shell-Script-EC2-Demo"

    # Call the function to create the EC2 instance
    create_ec2_instance "$ami_id" "$instance_type" "$key_name" "$subnet_id" "$security_group_ids" "$instance_name"

    echo "EC2 instance creation completed."
}
main "$@"
