<table>
    <tr>
        <td><img src="assets/LetsDoItSquare.png" alt="Logo" width="350"></td>
        <td>
            <h2><a href="http://letsdoit-app.com/">LetsDoIt</a></h2>
            LetsDoIt is a task management application that allows users to create, manage, and track their tasks. It also provides a social platform where users can post tasks publicly, receive comments and likes, and connect with other users.
        </td>
    </tr>
</table>



## Table of Contents

1. [Conceptualization](#conceptualization)
2. [Design](#design)
3. [Technology Stack](#technology-stack)
4. [Architecture](#architecture)
5. [Challenges and Learning Experiences](#challenges-and-learning-experiences)
6. [Testing](#testing)
7. [Deployment](#deployment)
8. [Maintenance](#maintenance)
    - [Known Issues](#known-issues)
    - [User Feedback](#user-feedback)

### Conceptualization

| Problem Statement | Target Audience | Why LetsDoIt |
| --- | --- | --- |
| LetsDoIt addresses the problem of personal productivity and organization. It provides a platform where users can create, manage, and track their tasks. | The intended users are individuals who want to enhance their productivity and stay organized. This includes students, professionals, and anyone else who has tasks to manage. | LetsDoIt stands out from other task management applications due to its social platform features. It allows users to post tasks publicly, receive comments and likes, and connect with other users. |

### Design

<!-- ![UI Design](URL_TO_UI_DESIGN) -->

- **User Interface**: The design process for LetsDoIt was iterative, starting with a basic wireframe and gradually incorporating more features and functionality. The primary goal was to create a user interface that was simple, intuitive, and aesthetically pleasing. A green color scheme was chosen to represent productivity and health, reinforcing the application's purpose. Additionally, the lifecycle of a user task is represented visually through the use of egg, chicken, and cooked chicken icons, symbolizing a task being born, worked on, and completed respectively.

- **User Experience**: The user experience was designed to be straightforward and intuitive, allowing users to easily navigate and use the application. The task lifecycle icons not only add a visual element to the interface but also make it easier for users to understand the status of their tasks at a glance.

### Technology Stack

| Category | Technologies |
| --- | --- |
| **Backend** | Spring Boot, MySQL |
| **Deployment** | AWS, Ubuntu, Apache Tomcat, Java JDK |
| **Frontend** | JSP Pages, CSS, Bootstrap |

### Architecture

The application follows the Spring Model-View-Controller (MVC) architecture, which is a design pattern used in web development to isolate business logic from the user interface. This allows for efficient code organization and separation of concerns.

<!-- ![MVC Diagram](URL_TO_MVC_DIAGRAM) -->

<!-- * -->
### Challenges and Learning Experiences

The development process was smooth due to previous experience. However, the deployment process presented unique challenges:

| Challenge | Description |
| --- | --- |
| **Deployment on AWS** | The initial attempt to deploy the application on AWS using Elastic Beanstalk was met with a series of issues, resulting in a perplexing 404 error. |
| **Pivot to EC2** | The decision was made to pivot and deploy the application on an EC2 instance. This involved using SSH to connect to a remote server, navigating the file system, installing programs, and executing scripts. |
| **Discovering VIM** | VIM, a command-line text editor, was discovered and quickly became an indispensable tool. |
| **Linking a Domain Name** | A domain name was procured from GoDaddy and successfully linked to the EC2 instance. This required adjusting the security groups to allow HTTP traffic and modifying the DNS settings on GoDaddy to point towards the EC2 instance. |

<!-- ![Deployment Process](URL_TO_DEPLOYMENT_IMAGE) -->

Despite the challenges, seeing the application go live on the internet was immensely satisfying.
### Testing

At the time of development, testing was not something I had worked with before. I did my own **regression testing** by manually testing the application after each new feature was added. This was a tedious process, but it helped me identify and fix bugs before moving on to the next feature.

In the future, I plan to implement **unit testing** and **integration testing** using **JUnit** and **Mockito**. This will allow me to automate the testing process and ensure that the application is functioning as expected. I also plan to use **Selenium** for **end-to-end testing** to ensure that the application is working as expected from the user's perspective.

### Deployment

#### A Journey Through the AWS Landscape...

Embarking on the deployment journey with AWS, I initially opted for their **Elastic Beanstalk** service, coupled with an **RDS database** connected to MySQL Workbench. This setup allowed me to control everything from my local machine. The RDS connection was a breeze, but establishing a stable environment for the app proved to be a real challenge.

<!-- ![AWS Landscape](URL_TO_AWS_LANDSCAPE_IMAGE) -->

#### Transitioning to Ubuntu...

With no prior experience in using SSH to connect to an EC2 instance, I started from scratch. I meticulously followed the AWS documentation, ensuring I understood every detail. My goal was to grasp the concept of a remote server and its functionalities. This led me to install a variety of programs such as Apache Tomcat, MySQL, and Java JDK. I immersed myself in the command line, learning to navigate the file system, install programs, and execute scripts. Along the way, I discovered VIM, a command-line text editor, which quickly became an indispensable tool.

<!-- ![Ubuntu Transition](URL_TO_UBUNTU_TRANSITION_IMAGE) -->

Another significant achievement was learning to link a domain name to an EC2 instance. I procured a domain name from GoDaddy and successfully linked it to my EC2 instance. This required adjusting the security groups to allow HTTP traffic and modifying the DNS settings on GoDaddy to point towards my EC2 instance. Seeing my app go live on the internet was immensely satisfying. I had to brush up on my VIM skills to make necessary adjustments to Apache Tomcat, replacing the IP address with the domain name.

### Overcoming Deployment Challenges

Transitioning to Ubuntu presented a unique set of challenges. The initial deployment was successful, but the instance was frequently failing due to internal AWS issues. Despite conducting thorough checks on my VPC and security groups, the issue persisted. The deployment was inconsistent, working sporadically over several days.

| Challenge | Solution |
| --- | --- |
| **Inconsistent Deployment** | Delved deeper into the AWS documentation and discovered AWS CloudWatch. This monitoring service provided the tools needed to monitor the instance's status. |
| **Instance Failure** | Set up an alarm in AWS CloudWatch to monitor the instance's status and configured it to restart the instance if it detected a failure. |

<!-- ![AWS CloudWatch](URL_TO_CLOUDWATCH_IMAGE) -->

This was a game-changer. It was like having a vigilant sentinel standing guard over the application, ready to step in and restart the system at the first sign of trouble. This experience underscored the importance of robust monitoring and recovery mechanisms in cloud computing.

### Deployment Technology Stack

The application was deployed using a variety of technologies across different categories:

#### Cloud Services (AWS)

| Service | Usage |
| --- | --- |
| **Elastic Beanstalk** | Initially used for deployment |
| **RDS** | Used for database services |
| **EC2** | The application was hosted on an EC2 instance |
| **VPC** | Used for creating a virtual network for resources |
| **Security Groups** | Used for controlling inbound and outbound traffic |
| **CloudWatch** | Used for monitoring the application and setting alarms |


#### Deployment Technology Stack

| Category | Technology | Usage |
| --- | --- | --- |
| **Operating System** | Ubuntu | The operating system on the EC2 instance |
| **Tools** | VIM | The text editor used for editing files on the server |
| **Domain Connection** | GoDaddy | The domain registrar used for connecting the domain to the application |
| **Backend Technologies** | Spring Boot | Used for creating the backend application |
|  | MySQL | The database used in conjunction with AWS RDS |
|  | Apache Tomcat | The web server used for running the application |
|  | Java JDK | The Java Development Kit used for developing the application |

### Maintenance

#### Monitoring

The application is monitored using AWS CloudWatch. An alarm has been set up to monitor the instance's status and is configured to restart the instance if it detects a failure. This ensures that the application is consistently up and running, providing a reliable service to its users.

#### Updates

Updates to the application are currently handled manually. Changes are pushed to the GitHub repository and then pulled on the EC2 instance. Future plans include implementing a CI/CD pipeline to automate this process, enhancing efficiency and reducing the potential for errors.

#### Known Issues

Currently, there are some known issues that are being worked on:

- **Registration Form Validations**: The validations for the registration form are currently not working as expected. We are aware of this issue and are actively working on a fix. In the meantime, please ensure that you enter valid information when registering.
- **Deployment Issues**: The application is currently hosted on an EC2 instance. Occasionally, the instance fails due to internal AWS issues. This is a known issue and is being worked on.

#### User Feedback

User feedback is an invaluable resource for improving the application. Currently, feedback is collected through GitHub and [e-mail me](mailto:jcsandoval978@gmail.com). To streamline this process and make it easier for users to provide feedback, a feedback form is planned for future implementation.