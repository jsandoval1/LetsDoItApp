<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ page isErrorPage="true" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <title>LetsEdit</title>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1">
                        <link rel="stylesheet" href="/css/EditTask.css">
                        <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
                        <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                            rel="stylesheet"
                            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                            crossorigin="anonymous">
                    </head>

                    <!-- Setting main area to gray -->

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
                                            <a class="nav-link" href="/logout">&#128694;Logout</a>
                                        </nav>
                                    </div>

                                    <!-- Right Main Content -->
                                    <div class="col-md-9" style="padding-left: 0;">
                                        <div style="background-color: #B6D7A8; padding: 1rem;">
                                            <div class="d-flex justify-content-center">
                                                <h2>LetsDoHub</h2>
                                            </div>

                                            <!-- Form -->
                                            <h6> Welcome, ${sessionScope.user.firstName}</h6>
                                            <p>
                                                Changed your mind on something? No worries, you can edit your task or
                                                update your progress here!
                                            </p>
                                            <div class="d-flex justify-content-center">
                                                <div class="mx-auto col-md-6"
                                                    style="background-color:#6AA84F; border-radius: 10px;">

                                                    <form:form method="POST" action="/tasks/new" modelAttribute="task"
                                                        class="p-3" style="background-color: transparent;">

                                                        <!-- ⬇️ NEED THIS FOR TASK TO TIE WITH USER ID ⬇️-->
                                                        <input type="hidden" name="user" value="${userId}">
                                                        <!-- Need this to pass on which task we are updating -->
                                                        <input type="hidden" name="id" value="${task.id}">
                                                        <!-- Need this to pass on the createdAt, will get deleted at if not. But we also dont want the user changing it, so it is not on the form -->
                                                        <input type="hidden" name="createdAt" value="${task.createdAt}">
                                                        <input type="hidden" name="updatedAt" value="${task.updatedAt}">

                                                        <!-- Completion Status, since we took care of that as "started" initially when the task was created -->
                                                        <div class="form-group mt-2">
                                                            <label for="completionStatus">Ready to pdate your staus?
                                                                Congrats.</label>
                                                            <form:select path="completionStatus" class="form-control">
                                                                <form:option value="STARTED">&#x1F95A;Started
                                                                </form:option>
                                                                <form:option value="IN_PROGRESS">&#x1f414;In Progress
                                                                </form:option>
                                                                <form:option value="DONE">&#x1F357;Done</form:option>
                                                            </form:select>
                                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                                path="completionStatus" />
                                                        </div>

                                                        <!-- Task short Name -->
                                                        <div class="form-group mt-2">
                                                            <label for="taskName">Give your task a short descriptive
                                                                name:</label>
                                                            <form:input path="taskName" required="true"
                                                                class="form-control"
                                                                placeholder="Enter your idea here (50 char max)" />
                                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                                path="taskName" />
                                                        </div>

                                                        <!-- Priority -->
                                                        <div class="form-group mt-2">
                                                            <label for="priority"> Have to change your priority? No
                                                                problem.
                                                            </label>
                                                            <form:select path="priority" class="form-control">
                                                                <form:option value="LOW"> &#128994;Low</form:option>
                                                                <form:option value="MEDIUM">&#128993;Medium
                                                                </form:option>
                                                                <form:option value="HIGH">&#128308;High</form:option>
                                                            </form:select>
                                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                                path="priority" />
                                                        </div>

                                                        <!-- Description -->
                                                        <div class="form-group mt-2">
                                                            <label for="taskDescription">Need to change any of the
                                                                details?
                                                                Go for it.</label>
                                                            <form:input path="taskDescription" required="true"
                                                                class="form-control"
                                                                placeholder="Enter your details here (1000 char max)" />
                                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                                path="taskDescription" />
                                                        </div>

                                                        <!-- Due Date -->
                                                        <div class="form-group mt-2">
                                                            <label for="dueDate">
                                                                Plans change. So do dates. Need to?
                                                            </label>
                                                            <form:input path="dueDate" type="date" required="true"
                                                                class="form-control" />
                                                            <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                                path="taskDescription" />
                                                        </div>

                                                        <!--Submit Button -->
                                                        <div class="text-center mt-2">
                                                            <input type="submit"
                                                                value="${sessionScope.user.firstName}, LetsUpdateIt &#x1f414;"
                                                                class="btn btn-success"
                                                                style="background-color: #B6D7A8; color: black;" />
                                                        </div>
                                                    </form:form>

                                                    <!-- Delete Button if user in session is the same as the user who created the task -->
                                                    <div class="text-center mt-2 mb-3">
                                                        <form:form method="POST" action="/tasks/delete/${task.id}"
                                                            modelAttribute="task">
                                                            <input type="hidden" name="user" value="${userId}">
                                                            <input type="hidden" name="_method" value="delete">
                                                            <input type="submit" value="Delete Task"
                                                                class="btn btn-danger">
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </body>

                    </html>