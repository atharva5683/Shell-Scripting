#!/bin/bash

code_clone(){
	echo Cloing the app..
	git clone https://github.com/LondheShubham153/django-notes-app.git

}

install_req(){
	echo "Install req"
	sudo apt-get install docker.io nginx -y docker-compose
}
restarts(){
	sudo chown $USER /var/run/docker.sock
	#sudo systemctl enable docker 
	#sudo systemctl enable nginx
	#sudo systemctl restart docker 
}
delpoy(){
        docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
	docker-compose up -d
}

echo "********** DEPLOYMENT STARTED *********"

if ! code_clone ;then
	echo "the code dir already exists"
	cd django-notes-app

fi
if ! install_req ; then
	echo "Installation fail"
	exit 1
fi
if ! restarts; then
	echo "System Fault"
	exit 1
fi
if ! delpoy; then
	echo "Deployment failed "
	exit 1
fi 
echo "********** DEPLOYMENT DONE *********"


