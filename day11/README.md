                                                                                    Jenkin Project
Project Overview.

1. Perform installation of Jenkins Locally and configure it.

before installing jenkins we must install latest openJDK available for your Distro.
![alt text](img/image.png)

then add apt repository and perform installation using following commands.

![alt text](img/image-1.png)

post installation jenkin will run on port 8080 on your localhost.
to access Jenkins open Browser and enter URL. http://localhost:8080/

![alt text](img/image-2.png)

The command: sudo cat /var/lib/jenkins/secrets/initialAdminPassword will print the password at console.

post unlocking jenkin create a user account to use jenkin or you can use admin account as well.

2. Run a sample java build using free style project.

    a. create a simple free stype project 

![alt text](img/image-%203.png)

    b. add description for Project pipeline.
![alt text](img/image-4.png)

    c. enter SCM details for fetching and building code.
    Note: choose correct branch name to be fetched and build from SCM.

![alt text](img/image-5.png)

    d. we have to trigger the build after every 5 minutes

![alt text](img/image-6.png)

    e. provide Build command in excute shell in build steps to build Java code.

![alt text](img/image-8.png)
    
    
    f. building is scheduled to buid after every 5 minutes.

![alt text](img/image-7.png)