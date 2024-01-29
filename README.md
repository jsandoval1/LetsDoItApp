# LetsDoItApp

---

## Application Development Process

### Conceptualization

- **Problem Statement**: The application, LetsDoIt, addresses the problem of personal productivity and organization. In today's fast-paced world, it's easy to lose track of tasks and deadlines. LetsDoIt provides a solution by offering a platform where users can create, manage, and track their tasks.

- **Target Audience**: The intended users of LetsDoIt are individuals who want to enhance their productivity and stay organized. This includes students, professionals, and anyone else who has tasks to manage. The social aspect of the platform also makes it suitable for those who want to connect with others based on shared tasks or interests.

- **Why LetsDoIt**: LetsDoIt stands out from other task management applications due to its social platform features. Unlike traditional task management apps, LetsDoIt allows users to post tasks publicly, receive comments and likes, and connect with other users. This adds a layer of social accountability and motivation, as users can see what others are working on and get inspired. It also provides a unique way to track personal tasks and stay motivated to complete them.

### Design

- **User Interface**: The design process for LetsDoIt was iterative, starting with a basic wireframe and gradually incorporating more features and functionality. The primary goal was to create a user interface that was simple, intuitive, and aesthetically pleasing. A green color scheme was chosen to represent productivity and health, reinforcing the application's purpose. Additionally, the lifecycle of a user task is represented visually through the use of egg, chicken, and cooked chicken icons, symbolizing a task being born, worked on, and completed respectively. While the initial focus was on functionality and familiarizing myself with Java and Spring Boot, these design considerations were integral to the application's visual identity. CSS and Bootstrap were used to achieve this. While the application's visual appeal and mobile responsiveness are areas for future enhancement, the current design provides a solid foundation for these improvements. Future plans include revisiting the project to enhance the design, potentially using Tailwind CSS in a javvascript framework such as React.

- **User Experience**: The user experience was designed to be straightforward and intuitive, allowing users to easily navigate and use the application. The task lifecycle icons not only add a visual element to the interface but also make it easier for users to understand the status of their tasks at a glance. While the initial development phase prioritized understanding Java in an applicational environment and getting familiar with AWS services, the user experience was not overlooked. The application was designed with simplicity in mind, making it easy for users to get started. This approach ensures a positive user experience, while also leaving room for future enhancements based on user feedback and further UX considerations.

### Technology Stack

---

#### Backend Technologies

- **Spring Boot**: The framework used for creating the backend application.
- **MySQL**: The database used in conjunction with AWS RDS.

#### Deployment Technologies

- **Ubuntu**: The operating system on the EC2 instance.
- **Apache Tomcat**: The web server used for running the application.
- **Java JDK**: The Java Development Kit used for developing the application.

#### Frontend Technologies

- **JSP Pages**: Server-side rendering was used for creating dynamic web content.
- **CSS**: Used for styling and layout of the web pages.
- **Bootstrap**: The framework used for more efficient styling and layout.

### Architecture

The application follows the Spring Model-View-Controller (MVC) architecture, which is a design pattern used in web development to isolate business logic from the user interface. This allows for efficient code organization and separation of concerns.

- **Model**: The Model represents the application data and the business rules that govern access to and updates of this data. In the context of this application, the Model is implemented using Spring and Hibernate, which handle the data interaction logic.

- **View**: The View renders the Model into a form suitable for interaction, typically a user interface. In this application, the views are created using JSP pages.

- **Controller**: The Controller processes and responds to user actions, such as button clicks and data input. The controllers in this application are implemented using Spring MVC, which handles data flow into Model objects and updates the View whenever data changes.

This architecture allows for clear separation between how the application's data is represented, how it is presented to the user, and how the user's interactions are handled.

### Challenges and Learning Experiences

The development process was relatively smooth, thanks to the experience gained from previous projects. Implementing concepts like relationship management and CRUD operations came naturally. However, the deployment process presented a unique set of challenges:

- **Deployment on AWS**: The initial attempt to deploy the application on AWS using Elastic Beanstalk was met with a series of issues. Despite successfully connecting to the RDS database, the application would not run, resulting in a perplexing 404 error. Various attempted solutions proved unsuccessful.

- **Pivot to EC2**: The decision was made to pivot and deploy the application on an EC2 instance. This was a new experience, involving the use of SSH to connect to a remote server, navigating the file system, installing programs, and executing scripts.

- **Discovering VIM**: During this process, VIM, a command-line text editor, was discovered and quickly became an indispensable tool.

- **Linking a Domain Name**: Another significant achievement was learning to link a domain name to an EC2 instance. A domain name was procured from GoDaddy and successfully linked to the EC2 instance. This required adjusting the security groups to allow HTTP traffic and modifying the DNS settings on GoDaddy to point towards the EC2 instance.

Despite the challenges, seeing the application go live on the internet was immensely satisfying. The process required brushing up on VIM skills to make necessary adjustments to Apache Tomcat, replacing the IP address with the domain name.

#### Testing

At the time of development, testing was not something I had worked with before. I was aware of the concept of testing, but I had never implemented it in my projects. I did do my own **regression testing** by manually testing the application after each new feature was added. This was a tedious process, but it helped me identify and fix bugs before moving on to the next feature.

In the future, I plan to implement **unit testing** and **integration testing** using **JUnit** and **Mockito**. This will allow me to automate the testing process and ensure that the application is functioning as expected. I also plan to use **Selenium** for **end-to-end testing** to ensure that the application is working as expected from the user's perspective.

### Deployment
#### A Journey Through the AWS Landscape...

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

- [x] **Elastic Beanstalk**: Initially used for deployment.
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


### Maintenance

#### Monitoring
The application is monitored using AWS CloudWatch. An alarm has been set up to monitor the instance's status and is configured to restart the instance if it detects a failure. This ensures that the application is consistently up and running, providing a reliable service to its users.

#### Updates
Updates to the application are currently handled manually. Changes are pushed to the GitHub repository and then pulled on the EC2 instance. Future plans include implementing a CI/CD pipeline to automate this process, enhancing efficiency and reducing the potential for errors.

#### User Feedback
User feedback is an invaluable resource for improving the application. Currently, feedback is collected through GitHub and email. To streamline this process and make it easier for users to provide feedback, a feedback form is planned for future implementation.