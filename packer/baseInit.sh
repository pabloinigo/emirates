#!/bin/bash
#Updating the system
sudo yum update -y

#Java to version 8
sudo yum install -y git java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel-1.8.0.201.b09-0.43.amzn1.x86_64 java-1.8.0-openjdk-src-1.8.0.201.b09-0.43.amzn1.x86_64 docker
sudo alternatives --remove java /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java
sudo alternatives --remove javac /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/javac
sudo alternatives --install /usr/bin/java java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java 1
sudo alternatives --install /usr/bin/javac javac /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/javac 1

#installing docker composo to start the application at the end
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo service docker start

#Installing Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo service jenkins start
sudo usermod -a -G docker jenkins
sudo mkdir -p /var/lib/jenkins/jobs/emirates
sudo cp /tmp/config.xml /var/lib/jenkins/jobs/emirates/
sudo mkdir /var/lib/jenkins/jobs/emirates/builds
sudo chown -R jenkins:jenkins /var/lib/jenkins/
