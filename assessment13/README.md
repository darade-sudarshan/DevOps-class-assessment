                                                                                                         Project Overview

1. create a pipeline to fetch code from private repository and configure secret for git repository.
2. setup a freestyle pipeline to compile and test the java code using maven.


    a. setup pileline for compilation of java build.

![alt text](img/image.png)

    b. configure private Repo along with github credentials

![alt text](img/image-1.png)

    c. add build step for compilation of java project from POM file.

![alt text](img/image5.png)
    
    
    d.setup a pipeline for testing of java build.

![alt text](img/image-2.png)

    e. configure private Repo along with github credentials

![alt text](img/image-1.png)

    f. add post build trigger for initiating testing of java project

![alt text](img/image-3.png)

    g. add test step for compilation of java project from POM file.

![alt text](img/image-6.png)


    h. Manually started the build and it succedded along with testing pipeline.

![alt text](img/image-4.png)



    
