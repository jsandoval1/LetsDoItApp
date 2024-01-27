<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <title>LetsLogIn</title>
                        <link rel="stylesheet" href="/css/UserAuth.css">
                        <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap"
                            rel="stylesheet">
                        <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                            crossorigin="anonymous">
                    </head>

                    <body style="background-color: #666666;">

                        <!-- Green header for lets do it, if clicked nothing will happen as not in session -->
                        <header class="navbar navbar-expand-lg navbar-dark justify-content-center"
                            style="padding-top: 0.5rem; padding-bottom: 0.5rem; background-color: #6AA84F ;">
                            <div class="container-fluid d-flex justify-content-center mx-auto">
                                <a class="navbar-brand" id="logo" href="/home">LetsDoIt &#127793;</a>
                            </div>
                        </header>

                        <!-- Forms -->
                        <div style="background-color: white; text-align: center; margin: 0 auto; width: 25%;">
                            <p>
                                You can use:
                                <br>
                                <b>email: j@s.com</b>
                                <br>
                                <b>password: password</b>
                                <br>
                                to login for demo purposes!
                            </p>
                        </div>
                        <div class="d-flex justify-content-center">


                            <!-- Login Form -->
                            <div class="card mx-5" style="background-color: #999999;">
                                <div>
                                    <fieldset>
                                        <legend><b>Login</b></legend>
                                        <form:form action="/login" method="post" modelAttribute="newLogin">
                                            <!-- Login Email with validations -->
                                            <div class="mt-3">
                                                <form:input class="form-control" path="email"
                                                    placeholder="Enter your email"></form:input>
                                                <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                    path="email" />
                                            </div>
                                            <!-- Login Password with validations -->
                                            <div class="mt-3">
                                                <form:input class="form-control" path="password"
                                                    placeholder="Enter your password"></form:input>
                                                <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                    path="password" />
                                            </div>
                                            <!-- Login Submit Button -->
                                            <div class="mt-3 d-flex justify-content-center">
                                                <input type="submit" value="Login" class="btn btn-success"
                                                    style="background-color: #6AA84F;">
                                            </div>
                                        </form:form>
                                    </fieldset>
                                </div>
                            </div>

                            <!-- Register Form -->
                            <div class="card mx-5" style="background-color: #999999;">
                                <fieldset>
                                    <legend><b>Register</b></legend>
                                    <form:form action="/register" method="post" modelAttribute="newUser">
                                        <!-- Register First name with validations -->
                                        <div class="mt-3">
                                            <form:input class="form-control" path="firstName"
                                                placeholder="Enter your first name"></form:input>
                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                path="firstName" />
                                        </div>
                                        <!-- Register Last name with validations -->
                                        <div class="mt-3">
                                            <form:input class="form-control" path="lastName"
                                                placeholder="Enter your last name"></form:input>
                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                path="lastName" />
                                        </div>
                                        <!-- Register Email with validations -->
                                        <div class="mt-3">
                                            <form:input class="form-control" path="email"
                                                placeholder="Enter your email"></form:input>
                                            <form:errors style="color: red; text-shadow: 1px 1px black;" path="email" />
                                        </div>
                                        <!-- Register Password with validations -->
                                        <div class="mt-3">
                                            <form:input class="form-control" path="password"
                                                placeholder="Enter your password"></form:input>
                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                path="password" />
                                        </div>
                                        <!-- Register Confirm password with validations -->
                                        <div class="mt-3">
                                            <form:input class="form-control" path="confirm"
                                                placeholder="Confirm your password"></form:input>
                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                path="confirm" />
                                        </div>
                                        <!-- Register Submit Button -->
                                        <div class="mt-3 d-flex justify-content-center">
                                            <input type="submit" value="Register" class="btn btn-success"
                                                style="background-color: #6AA84F;">
                                        </div>
                                    </form:form>
                                </fieldset>
                            </div>
                    </body>

                    </html>