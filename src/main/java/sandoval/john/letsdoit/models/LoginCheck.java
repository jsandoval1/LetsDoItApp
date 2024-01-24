package sandoval.john.letsdoit.models;


// ! This file is used to to authenticate a user. 
// ? Similarly to @transient, we do not want this to be stored in the database.
// ? We wil use this class using <Form:helper> tags to validate the user input, similairly to the @Valid annotation <Form:error> tags.

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

// ? Not marked as @Entity because we do not want a loginuser object to be stored in the database

public class LoginCheck {

    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;

    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    private String password;
    
    // * Empty Constructor
    public LoginCheck() {
    }
    
    // * Getter and Setters
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

    //! Although we still will utilize validation constraints, it's a bit more like
    //! a plain old OOP Java class. It is not an entity in our database, and we only
    //! use it temporarily to validate the form input when the user logs in.
    // * After form input passes or doesn't pass validation and authentication, that LoginUser instance disappears.