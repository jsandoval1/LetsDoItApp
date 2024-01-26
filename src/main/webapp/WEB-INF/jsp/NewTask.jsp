<!-- Home.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>LetsDoPost</title>
                    <script src="/js/quote.js"></script>
                    <link rel="stylesheet" href="/css/NewTask.css">
                    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                        crossorigin="anonymous">
                </head>

                <!-- Setting background color gray -->

                <body style="background-color: gray;">

                    <!-- Header -->
                    <header class="navbar navbar-expand-lg navbar-dark justify-content-center"
                        style="padding-top: 0.5rem; padding-bottom: 0.5rem; background-color: #6AA84F ;">
                        <div class="container-fluid d-flex justify-content-center mx-auto">
                            <a class="navbar-brand" id="logo" href="/home">LetsDoIt &#127793;</a>
                        </div>
                    </header>

                    <!-- Main Content -->
                    <div class="content-container">
                        <div class="container-fluid mt-2">
                            <div class="row">

                                <!-- Left NavBar -->
                                <div class="col-md-3" style="padding-right: 0;">
                                    <nav class="nav flex-column">
                                        <a class="nav-link" href="/home">&#x1F343; Home</a>
                                        <a class="nav-link" href="/tasks/new">&#127912; LetsDoPost</a>
                                        <a class="nav-link disabled" href="#">&#128488; LetsDoChat</a>
                                        <a class="nav-link disabled" href="#">&#9881; LetsDoSettings</a>
                                        <a class="nav-link" href="#">&#9881; LetsDoSettings</a>
                                        <a class="nav-link" href="/logout">&#128694;Logout</a>
                                    </nav>
                                </div>

                                <!-- Right Maincontent -->
                                <div class="col-md-9" style="padding-left: 0;">
                                    <div style="background-color: #B6D7A8; padding: 1rem;">
                                        <div class="d-flex justify-content-center">
                                            <h2>LetsDoHub</h2>
                                        </div>
                                        <!-- Form -->
                                        <h6> Welcome, ${sessionScope.user.firstName}</h6>
                                        <p>
                                            Our servers will take care of of the date and time you post this task. What
                                            we need from you is...
                                        </p>
                                        <div class="d-flex justify-content-center">
                                            <div class="mx-auto col-md-6"
                                                style="background-color:#6AA84F; border-radius: 10px;">

                                                <form:form method="POST" action="/tasks/new" modelAttribute="task"
                                                    class="p-3" style="background-color: transparent;">

                                                    <!--  ⬇️ NEED THIS FOR BOOK TO TIE WITH USER ID ⬇️-->
                                                    <input type="hidden" name="user" value="${userId}">

                                                    <!--  Task Name -->
                                                    <div class="form-group mt-2">
                                                        <label for="taskName">Give your task a short descriptive
                                                            name:</label>
                                                        <form:input path="taskName" required="true" class="form-control"
                                                            placeholder="Enter your idea here (50 char max)" />
                                                        <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                            path="taskName" />
                                                    </div>

                                                    <!--  Priority -->
                                                    <div class="form-group mt-2">
                                                        <label for="priority"> How would you rate the urgency of this?
                                                        </label>
                                                        <form:select path="priority" class="form-control">
                                                            <form:option value="LOW"> &#128994;Low</form:option>
                                                            <form:option value="MEDIUM">&#128993;Medium</form:option>
                                                            <form:option value="HIGH">&#128308;High</form:option>
                                                        </form:select>
                                                        <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                            path="priority" />
                                                    </div>

                                                    <!--  Description -->
                                                    <div class="form-group mt-2">
                                                        <label for="taskDescription">Give your friends a more detailed
                                                            description of what needs to be done:</label>
                                                        <form:input path="taskDescription" required="true"
                                                            class="form-control"
                                                            placeholder="Enter your details here (1000 char max)" />
                                                        <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                            path="taskDescription" />
                                                    </div>

                                                    <!--  Due Date -->
                                                    <div class="form-group mt-2">
                                                        <label for="dueDate">When are you going to have this done
                                                            by?:</label>
                                                        <form:input path="dueDate" type="date" required="true"
                                                            class="form-control" />
                                                        <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                            path="dueDate" />
                                                    </div>

                                                    <!-- Text explaining that user does not need to worry about setting completion status -->
                                                    <div class="text-center mt-2">
                                                        <p>
                                                            (Our servers will automatically start your goal off as an
                                                            egg, you can
                                                            change it later as you make progress)
                                                        </p>
                                                    </div>

                                                    <!-- Submit Button -->
                                                    <div class="text-center mt-2">
                                                        <input type="submit" value="LetsPostThis"
                                                            class="btn btn-success"
                                                            style="background-color: #B6D7A8; color: black;" />
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>

                                        <!-- Quote -->
                                        <div class="text-center mt-3">
                                            <div class="container mt-5">
                                                <div class="row justify-content-center">
                                                    <div class="col-md-8">
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <h4 class="mb-0"><u><i>Today's Motivational
                                                                            Quote</i></u>
                                                                </h4>
                                                            </div>
                                                            <div class="card-body">
                                                                <div id="quote">
                                                                    <p id="quoteText" class="card-text"></p>
                                                                    <p id="quoteAuthor"
                                                                        class="card-subtitle mb-2 text-muted">
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> <!-- End of Main Content Green Div -->
                                </div>

                </body>

                </html>