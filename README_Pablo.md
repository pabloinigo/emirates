# Exercise 3

### Infrastructure

I have created 2 instances in AWS to save time **( and money )**. First one is a Jenkins machine with docker to start the application in the last step of the pipeline and the second one is an instance with docker to start SonarQube. 

All these infrastructure in my case is running in my AWS account. 

### Jenkins pipeline

Pipeline is splited in 6 steps

- Connection to git repository to get Jenkinsfile
- building in DEV
- SonarQube test in DEV 
- jar file creation
- Docker image creation
- starting container with docker compose

![Pipeline](pipeline.png)

After this execution our job will start the application in the jenkins server. I have not created a new instance to avoid install a artifactory repository ( Normally this is a step that we must to do ). Jenkins pipeline is saved in github and config.xml too to be able to recrete the job in the repository. I setup the copy of this XML file, so after terraform recreation job will be always there. 

I have not saved the completly Jenkins setup because was not in the exercise, that's mean that everytime that the insfrastructe is recreated we need to add again admin password and install plugins, but this can be easily fixed

### SonarQube instance

This instance will run SQ inside Docker. I would prefer to use an instance without docker to do that but because you are using this technque I have followed it. Indeed really I would use a Kubernetes cluster and not docker-compose to do that, and connect Jenkins to this kubernetes cluster and be able to execute jobs in agents ( pods in the kubernetes cluster )

There is a problem, because I have no bought a DNS domain I am using ephemeral DNS instances entries. This generate a problem because everytime that a new SonarQube instance is created I have to change the name in sonar-project.properties file

### packer

I have created 2 json files to install jenkins and sonarque

### terraform

There is a tf files that will deploy the complete infrastructure


### AWS security group

To simplify deployment there is a unique security group that allow to connect to port 22, 8080, 8081, 9091 in every machine from whatever place.


