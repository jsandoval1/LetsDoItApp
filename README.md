# LetsDoItApp
***

### Deployment Adventures: A Journey Through the AWS Landscape...

Embarking on the deployment journey with AWS, I initially opted for their Elastic Beanstalk service, coupled with an RDS database connected to MySQL Workbench. This setup allowed me to control everything from my local machine. The RDS connection was a breeze, but establishing a stable environment for the app proved to be a real challenge.

I found myself in a perplexing situation, facing a barrage of (404 error) and (502 bad gateway) errors. It felt like a tantalizing puzzle, where I could only ever get half the app to work at any given time. Frustrating? Absolutely. But every great story needs a bit of conflict, right?

Determined to find a solution, I delved deeper into the Spring documentation. That's when it hit me - using JSP pages might not have been the best approach for this project. The documentation suggested Thymeleaf as a more suitable option for server-side rendering in a Spring project.

With renewed vigor, I decided to pivot. I put my JSPs on the back burner and embarked on the mission to convert my project to use Thymeleaf. The result? Success! I managed to deploy the app using Thymeleaf templates.

However, every victory comes with its own set of challenges. The app would only render the ("/") route and wouldn't display form errors correctly. Despite these issues, I could see the form/user interactions being triggered in the console while debugging on my localhost. This was a perplexing situation, but one that only added to the excitement of the journey.

<b>It was time for a new plan of attack.</b>

### Switching over to Ubuntu...
