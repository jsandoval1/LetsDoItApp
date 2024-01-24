<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>User Settings</title>
</head>

<body>
    <h1>User Settings</h1>
    <form:form method="POST" action="/settings" modelAttribute="user">

        <table>
            <tr>
                <td>First Name:</td>
                <td>
                    <form:input path="firstName" />
                    <form:errors path="firstName" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td>
                    <form:input path="lastName" />
                    <form:errors path="lastName" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td>Location:</td>
                <td>
                    <form:input path="location" />
                    <form:errors path="location" cssClass="error" />
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save" /></td>
            </tr>
        </table>
    </form:form>
    <br />
    <a href="/home">Home</a>
</body>

</html>
