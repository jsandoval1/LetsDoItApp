<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                    <title>LetsView</title>
                    <script src="/js/quote.js"></script>
                    <link rel="stylesheet" href="/css/ViewTask.css">
                    <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap"
                        rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                        crossorigin="anonymous">
                </head>

                <!-- Body background color -->

                <body style="background-color: gray;">

                    <!-- Green header for lets do it -->
                    <header class="navbar navbar-expand-lg navbar-dark justify-content-center"
                        style="padding-top: 0.5rem; padding-bottom: 0.5rem; background-color: #6AA84F ;">
                        <div class="container-fluid d-flex justify-content-center mx-auto">
                            <a class="navbar-brand" id="logo" href="/home">LetsDoIt &#127793;</a>
                        </div>
                    </header>

                    <!-- Setting up flex for both areas -->
                    <div class="content-container">
                        <div class="container-fluid mt-2">
                            <div class="row">

                                <!-- Left NavBar -->
                                <div class="col-md-3" style="padding-right: 0;">
                                    <nav class="nav flex-column">
                                        <a class="nav-link" href="/home">&#x1F343; Home</a>
                                        <a class="nav-link" href="/tasks/new">&#127912; LetsDoPost</a>
                                        <a class="nav-link disabled" href="#">&#128488; LetsDoChat</a>
                                        <a class="nav-link" href="#">&#9881; LetsDoSettings</a>
                                        <a class="nav-link disabled" href="#">&#9881; LetsDoSettings</a>
                                        <a class="nav-link" href="/logout">&#128694;Logout</a>
                                    </nav>
                                </div>

                                <!-- Right Maincontent -->
                                <!-- View Task details -->
                                <div class="col-md-9" style="padding-left: 0;">
                                    <div style="background-color: #B6D7A8; padding: 1rem;">
                                        <div style="display: flex; justify-content: center; align-items: center;">
                                            <h2>LetsView</h2>
                                        </div>

                                        <div class="card">

                                            <!-- Task Details -->
                                            <div class="card-header">
                                                Task Details
                                            </div>
                                            <div class="card-body">

                                                <!-- Task Name -->
                                                <h5 class="card-title">
                                                    <c:out value="${task.taskName}" />
                                                </h5>

                                                <!-- Task Owner -->
                                                <h6 class="card-subtitle mb-2 text-muted">
                                                    <c:out value="${task.user.firstName}" />
                                                    <c:out value="${task.user.lastName}" />
                                                </h6>

                                                <!-- Task Description -->
                                                <p class="card-text">
                                                    <c:out value="${task.taskDescription}" />
                                                </p>
                                                <ul class="list-group list-group-flush">

                                                    <!-- Due Date -->
                                                    <li class="list-group-item">
                                                        <strong>Due Date:</strong>
                                                        <fmt:formatDate value="${task.dueDate}" pattern="MM/dd/yyyy"
                                                            var="formattedDate" />
                                                        ${formattedDate}
                                                    </li>

                                                    <!-- Priority -->
                                                    <li class="list-group-item">
                                                        <strong>Priority:</strong>
                                                        <c:choose>
                                                            <c:when test="${task.priority.toString() == 'LOW'}">
                                                                <span>&#x1F7E2; Low priority</span>
                                                                <!-- Green Square Emoji-->
                                                            </c:when>
                                                            <c:when test="${task.priority.toString() == 'MEDIUM'}">
                                                                <span>&#x1F7E1; Medium Priority</span>
                                                                <!-- Yellow Square Emoji-->
                                                            </c:when>
                                                            <c:when test="${task.priority.toString() == 'HIGH'}">
                                                                <span>&#x1F7E0; High Priority</span>
                                                                <!-- Red Square Emoji-->
                                                            </c:when>
                                                        </c:choose>
                                                    </li>

                                                    <!-- Completion Status -->
                                                    <li class="list-group-item">
                                                        <strong>Status:</strong>
                                                        <c:choose>
                                                            <c:when
                                                                test="${task.completionStatus.toString() == 'STARTED'}">
                                                                <span>&#x1F95A; Starting out</span> <!-- Egg Emoji-->
                                                            </c:when>
                                                            <c:when
                                                                test="${task.completionStatus.toString() == 'IN_PROGRESS'}">
                                                                <span>&#x1f414; Working through it</span>
                                                                <!-- Chicken Emoji-->
                                                            </c:when>
                                                            <c:when
                                                                test="${task.completionStatus.toString() == 'DONE'}">
                                                                <span>&#x1F357; Its done for</span>
                                                                <!-- Drumstick Emoji-->
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${task.completionStatus}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>

                                                    <!-- Created At or Updated at -->
                                                    <li class="list-group-item">
                                                        <c:choose>
                                                            <c:when test="${task.updatedAt == null}">
                                                                <strong>Uploaded At:</strong>
                                                                <fmt:formatDate value="${task.createdAt}"
                                                                    pattern="MM/dd/yyyy" var="formattedDate" />
                                                                ${formattedDate} ,
                                                                <fmt:formatDate value="${task.createdAt}"
                                                                    pattern="hh:mm:ss a" var="formattedTime" />
                                                                ${formattedTime}
                                                            </c:when>
                                                            <c:otherwise>
                                                                <strong style="color: red; font-weight: bold">Updated
                                                                    At:</strong>
                                                                <fmt:formatDate value="${task.updatedAt}"
                                                                    pattern="MM/dd/yyyy" var="formattedDate" />
                                                                ${formattedDate} ,
                                                                <fmt:formatDate value="${task.updatedAt}"
                                                                    pattern="hh:mm:ss a" var="formattedTime" />
                                                                ${formattedTime}
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>

                                        <!-- If the owner of the task is in session, these buttons appear to them under their post -->
                                        <div class="d-flex justify-content-between mt-1">
                                            <c:if test="${sessionScope.user.id == task.user.id}">
                                                <a href="/tasks/edit/${task.id}" class="btn btn-success"
                                                    style="background-color: #6AA84F;">&#x1F58D; Edit Task</a>
                                                <form action="/tasks/delete/${task.id}" method="post">
                                                    <input type="hidden" name="_method" value="delete" />
                                                    <input type="submit" value=" &#x1f5d1; Delete Task"
                                                        class="btn btn-danger" />
                                                </form>
                                            </c:if>
                                        </div>

                                        <!-- Display list of comments and count -->
                                        <h4>Comments (
                                            <c:out value="${fn:length(task.comments)}" />)
                                        </h4>
                                        <c:forEach items="${task.comments}" var="comment">
                                            <div class="card mb-3">
                                                <!-- Comment headder -->
                                                <div class="card-header">
                                                    <strong>
                                                        <c:out
                                                            value="${comment.user.firstName} ${comment.user.lastName}" />
                                                        said:
                                                    </strong>
                                                    <div>
                                                        <!-- Date format -->
                                                        <p class="card-text">
                                                            <fmt:formatDate value="${comment.createdAt}"
                                                                pattern="MM/dd/yyyy" var="formattedDate" />
                                                            ${formattedDate} ,
                                                            <!-- Time format -->
                                                            <fmt:formatDate value="${comment.createdAt}"
                                                                pattern="hh:mm:ss a" var="formattedTime" />
                                                            ${formattedTime}
                                                        </p>
                                                    </div>
                                                </div>
                                                <!-- Comment content -->
                                                <div class="card-body">
                                                    <p class="card-text">
                                                        <c:out value="${comment.content}" />
                                                    </p>
                                                </div>
                                                <!-- If user in session owns the comment, they can delete it -->
                                                <div class="card-footer text-muted">
                                                    <c:if test="${sessionScope.user.id == comment.user.id}">
                                                        <form action="/comment/delete/${comment.id}" method="post">
                                                            <input type="hidden" name="_method" value="delete" />
                                                            <button type="submit" class="btn btn-danger"> &#x1f5d1;
                                                                Delete Comment</button>
                                                        </form>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <!-- Form to add new comment -->
                                        <form:form method="POST" action="/comment/new" modelAttribute="comment"
                                            class="mt-4">
                                            <!-- Hidden fields for task and user IDs -->
                                            <input type="hidden" name="taskId" value="${task.id}" />
                                            <input type="hidden" name="userId" value="${user.id}" />

                                            <!-- Textarea for comment content -->
                                            <div class="form-group">
                                                <label for="content">Add a comment:</label>
                                                <form:textarea path="content" required="true"
                                                    class="form-control text-muted" rows="3"
                                                    placeholder="${sessionScope.user.firstName}, what do you think?" />
                                                <form:errors style="color: red; text-shadow: 1px 1px black;"
                                                    path="content" />
                                            </div>

                                            <!-- Submit button -->
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary mt-1 align-content-center">
                                                    &#128488;Submit</button>
                                            </div>

                                        </form:form>
                                    </div>
                                </div>
                            </div>

                </body>

                </html>