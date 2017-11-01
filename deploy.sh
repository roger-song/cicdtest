if [ $# != 2 ]
then
    echo "Usage: deploy < branch > <TRAVIS_JOB_NUMBER>"
else
    if [ $1 = "develop" ]
    then 
        echo "Deploy to dev ec2 instances ..."
	chmod 400 dev-test-ec2.pem
	scp -i dev-test-ec2.pem -r buzz ec2-user@ec2-34-215-251-143.us-west-2.compute.amazonaws.com:/home/ec2-user/dataloader
	scp -i dev-test-ec2.pem run.sh ec2-user@ec2-34-215-251-143.us-west-2.compute.amazonaws.com:/home/ec2-user/dataloader
	ssh -o stricthostkeychecking=no -i dev-test-ec2.pem ec2-user@ec2-34-215-251-143.us-west-2.compute.amazonaws.com "/home/ec2-user/dataloader/run.sh"
    fi
fi
