# LetsDoItApp

---

### A Journey Through the AWS Landscape...
--- 

Embarking on the deployment journey with AWS, I initially opted for their **Elastic Beanstalk** service, coupled with an **RDS database** connected to MySQL Workbench. This setup allowed me to control everything from my local machine. The RDS connection was a breeze, but establishing a stable environment for the app proved to be a real challenge.

I found myself in a perplexing situation, facing a barrage of (404 error) and (502 bad gateway) errors. It felt like a tantalizing puzzle, where I could only ever get half the app to work at any given time. Frustrating? Absolutely. But every great story needs a bit of conflict, right?

Determined to find a solution, I delved deeper into the Spring documentation. That's when it hit me - using JSP pages might not have been the best approach for this project. The documentation suggested Thymeleaf as a more suitable option for server-side rendering in a Spring project.

With renewed vigor, I decided to pivot. I put my JSPs on the back burner and embarked on the mission to convert my project to use Thymeleaf. The result? Success! I managed to deploy the app using Thymeleaf templates.

However, every victory comes with its own set of challenges. The app would only render the ("/") route and wouldn't display form errors correctly. Despite these issues, I could see the form/user interactions being triggered in the console while debugging on my localhost. This was a perplexing situation, but one that only added to the excitement of the journey.

<i>**It was time for a new plan of attack.**</i>

#### Transitioning to Ubuntu...
---
<b> Spoiler Alert: </b> The solution I was seeking was right under my nose all along.

With no prior experience in using SSH to connect to an EC2 instance, I started from scratch. I meticulously followed the AWS documentation, ensuring I understood every detail. My goal was to grasp the concept of a remote server and its functionalities. This led me to install a variety of programs such as Apache Tomcat, MySQL, and Java JDK. I immersed myself in the command line, learning to navigate the file system, install programs, and execute scripts. Along the way, I discovered VIM, a command-line text editor, which quickly became an indispensable tool. The thrill of exploring these uncharted territories was exhilarating.

Another significant achievement was learning to link a domain name to an EC2 instance. I procured a domain name from GoDaddy and successfully linked it to my EC2 instance. This required adjusting the security groups to allow HTTP traffic and modifying the DNS settings on GoDaddy to point towards my EC2 instance. Seeing my app go live on the internet was immensely satisfying. I had to brush up on my VIM skills to make necessary adjustments to Apache Tomcat, replacing the IP address with the domain name.

#### It wasn't all smooth sailing from there...
---
<b> It wasnt all smooth sailing from there. </b>  

Transitioning to Ubuntu presented a unique set of challenges. While the initial deployment was successful, the joy was short-lived. The instance was frequently failing due to internal AWS issues, turning the experience into a roller-coaster ride of highs and lows. Despite conducting thorough checks on my VPC and security groups, the issue stubbornly persisted. The deployment was inconsistent, working in a sporadic fashion over several days, which was far from ideal.

Determined to find a solution, I delved deeper into the labyrinth of AWS documentation. It was there that I discovered a potential lifeline: AWS CloudWatch. This monitoring service provided the tools I needed to keep a close eye on my instance. I set up an alarm to monitor the instance's status and configured it to restart the instance if it detected a failure. 

This was a game-changer. It was like having a vigilant sentinel standing guard over my application, ready to step in and restart the system at the first sign of trouble. I could now rest easy, knowing that my app would be consistently up and running, providing a reliable service to its users. This experience underscored the importance of robust monitoring and recovery mechanisms in cloud computing, a lesson I will carry with me in my future projects.

## Deployment Technology Stack

This application was deployed using a variety of technologies across different categories:

### Cloud Services (AWS)
- [X] **Elastic Beanstalk**: Initially used for deployment.
- **RDS**: Used for database services.
- **EC2**: The application was hosted on an EC2 instance.
- **VPC**: Used for creating a virtual network for resources.
- **Security Groups**: Used for controlling inbound and outbound traffic.
- **CloudWatch**: Used for monitoring the application and setting alarms.

### Operating System
- **Ubuntu**: The operating system on the EC2 instance.

### Backend Technologies
- **Spring Boot**: Used for creating the backend application.
- **MySQL**: The database used in conjunction with AWS RDS.
- **Apache Tomcat**: The web server used for running the application.
- **Java JDK**: The Java Development Kit used for developing the application.

### Tools
- **VIM**: The text editor used for editing files on the server.

### Domain Connection
- **GoDaddy**: The domain registrar used for connecting the domain to the application.

