#!/bin/bash

#send script to ubuntu box
#ssh into ubuntu box
#run script in box to assure directory and clean files
#exit box
#send files to directory
#execute node stuff



DIR="$( cd "$( dirname "$0" )" && pwd )"

cd $DIR && cd ..

scp -i deployment/automation.pem $DIR/setup.sh ubuntu@ec2-54-200-138-217.us-west-2.compute.amazonaws.com:~/

ssh -i deployment/automation.pem ubuntu@ec2-54-200-138-217.us-west-2.compute.amazonaws.com "chmod +x setup.sh && sh setup.sh"

tar -czvf project.tar.gz --exclude=node_modules/  --exclude=.git/ --exclude=.DS_Store --exclude=.idea/ .

scp -i deployment/automation.pem project.tar.gz ubuntu@ec2-54-200-138-217.us-west-2.compute.amazonaws.com:~/deployment

ssh -i deployment/automation.pem ubuntu@ec2-54-200-138-217.us-west-2.compute.amazonaws.com 'bash -s' < $DIR/runNode.sh