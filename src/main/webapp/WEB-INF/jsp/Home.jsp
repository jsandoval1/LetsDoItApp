<!-- Home.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>LetsDoIt</title>
                <script src="/js/quote.js"></script>
                <link rel="stylesheet" href="/css/Home.css">
                <link href="https://fonts.googleapis.com/css2?family=Play:wght@400;700&display=swap" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                    crossorigin="anonymous">
            </head>

            <!-- LetsDoItHeader -->
            <body style="background-color: gray;">
                <header class="navbar navbar-expand-lg navbar-dark justify-content-center"
                    style="padding-top: 0.5rem; padding-bottom: 0.5rem; background-color: #6AA84F;">
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

                            <!-- Right Maincontent -->
                            <div class="col-md-9" style="padding-left: 0;">
                                <div style="background-color: #B6D7A8; padding: 1rem;">
                                    <div style="display: flex; justify-content: space-between; align-items: center;">
                                        <div>
                                            <h6> Welcome, ${sessionScope.user.firstName}</h6>
                                        </div>
                                        <div>
                                            <h2>LetsDoHub</h2>
                                        </div>
                                        <div>
                                            <h3>WeatherAPI</h3>
                                            <!-- ! Add weather API call here -->
                                            <div id="weather"></div>
                                            <!-- ! Plans for weather API -->
                                            <script>
                                                fetch(`https://api.openweathermap.org/data/2.5/weather?q=${sessionScope.user.location}&appid=API_KEY&units=metric`)
                                                    .then(response => response.json())
                                                    .then(data => {
                                                        const weatherDiv = document.getElementById('weather');
                                                        const temperature = data.main.temp;
                                                        const description = data.weather[0].description;
                                                        weatherDiv.innerHTML = `Current temperature in ${sessionScope.user.location} is ${temperature}°C with ${description}.`;
                                                    })
                                                    .catch(error => console.error(error));
                                            </script>
                                        </div>
                                    </div>

                                    <!-- Table -->
                                    <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                                        <table class="table table-hover" style="border: 1px solid black;">
                                            <thead>
                                                <tr>
                                                    <th class="d-none d-md-table-cell"
                                                        style="background-color: lightgrey; font-size: 0.8rem;">
                                                        Date Posted</th>
                                                    <th style="background-color: lightgrey; font-size: 0.8rem;">User
                                                    </th>
                                                    <th style="background-color: lightgrey; font-size: 0.8rem;">Name
                                                    </th>
                                                    <th style="background-color: lightgrey; font-size: 0.8rem;">Due Date
                                                    </th>
                                                    <th style="background-color: lightgrey; font-size: 0.8rem;">Status
                                                    </th>
                                                    <th class="d-none d-md-table-cell"
                                                        style="background-color: lightgrey; font-size: 0.8rem;">
                                                        Comments</th>
                                                    <th style="background-color: lightgrey; font-size: 0.8rem;">Actions
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="scroll-table">
                                                <c:forEach items="${tasks}" var="task">
                                                    <tr class="table-row">

                                                        <!-- created @ date -->
                                                        <td class="d-none d-md-table-cell">
                                                            <fmt:formatDate value="${task.createdAt}" pattern="MM/dd/yy"
                                                                var="formattedDate" />
                                                            ${formattedDate}
                                                        </td>

                                                        <!-- user first name -->
                                                        <td>${task.user.firstName}
                                                            <c:if test="${userId == task.user.id }">
                                                                <a href="/tasks/edit/${task.id}"
                                                                    class="btn btn-warning btn-sm"
                                                                    style="display: inline-block;">&#x1F58D;</a>
                                                            </c:if>
                                                        </td>

                                                        <!-- task name and priority -->
                                                        <td>
                                                            <a href="/tasks/${task.id}">${task.taskName}</a>
                                                            <div>
                                                                <c:choose>
                                                                    <c:when test="${task.priority.toString() == 'LOW'}">
                                                                        <span>&#x1F7E2; Low priority</span>
                                                                        <!-- Green Circle Emoji-->
                                                                    </c:when>
                                                                    <c:when
                                                                        test="${task.priority.toString() == 'MEDIUM'}">
                                                                        <span>&#x1F7E1; Medium Priority</span>
                                                                        <!-- Yellow Circle Emoji-->
                                                                    </c:when>
                                                                    <c:when
                                                                        test="${task.priority.toString() == 'HIGH'}">
                                                                        <span>&#x1F7E0; High Priority</span>
                                                                        <!-- Red Circle Emoji-->
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                        </td>

                                                        <!-- due date -->
                                                        <td>
                                                            <fmt:formatDate value="${task.dueDate}" pattern="MM/dd/yy"
                                                                var="formattedDueDate" />
                                                            ${formattedDueDate}
                                                        </td>

                                                        <!-- completion status -->
                                                        <td>
                                                            <c:choose>
                                                                <c:when
                                                                    test="${task.completionStatus.toString() == 'STARTED'}">
                                                                    <span>&#x1F95A;</span> <!-- Egg Emoji-->
                                                                </c:when>
                                                                <c:when
                                                                    test="${task.completionStatus.toString() == 'IN_PROGRESS'}">
                                                                    <span>&#x1f414;</span> <!-- Chicken Emoji-->
                                                                </c:when>
                                                                <c:when
                                                                    test="${task.completionStatus.toString() == 'DONE'}">
                                                                    <span>&#x1F357;</span> <!-- Drumstick Emoji-->
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${task.completionStatus}
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>

                                                        <!-- comment count -->
                                                        <td class="d-none d-md-table-cell">
                                                            <c:out value="${fn:length(task.comments)}" />
                                                        </td>

                                                        <!-- actions -->
                                                        <td>
                                                            <div class="text-center">
                                                                <a href="/tasks/${task.id}" class="btn btn-info btn-sm"
                                                                    style="display: inline-block;">&#x1F52D;</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!-- Button that displays the user in sessions name to create a task -->
                                    <div class="text-center mt-3">
                                        <form method="GET" action="/tasks/new">
                                            <input type="hidden" name="user" value="${userId}">
                                            <input type="submit"
                                                value="${sessionScope.user.firstName}, LetsDoSomethingNew &#x1F95A;"
                                                class="btn btn-success" style="background-color: #6AA84F;">
                                        </form>
                                    </div>

                                    <!-- Adding an API call to generarate a random motivational call every time page is loaded -->
                                    <div class="text-center mt-3">
                                        <div class="container mt-5">
                                            <div class="row justify-content-center">
                                                <div class="col-md-8">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="mb-0"><u><i>Today's Motivational Quote</i></u>
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
                                </div> 
                            </div><!-- End of Main Content Green Div -->

            </body>

            </html>