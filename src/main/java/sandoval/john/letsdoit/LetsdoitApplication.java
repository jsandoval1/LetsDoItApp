package sandoval.john.letsdoit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

// Use the @SpringBootApplication annotation to indicate this is a Spring Boot application
@SpringBootApplication
// Extend SpringBootServletInitializer to support WAR file deployment
public class LetsdoitApplication extends SpringBootServletInitializer {

	// Override the configure method from SpringBootServletInitializer
	// This method is used when the application is deployed as a WAR file
	// The sources method tells Spring Boot to start the application with the LetsdoitApplication class
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(LetsdoitApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(LetsdoitApplication.class, args);
	}

}