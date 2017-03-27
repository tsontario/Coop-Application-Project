<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% %>

<html>
    <head>
        <title>New Student Registration</title>
    </head>
    <body>
        <form action="StudentRegisterControl" method="POST">

            <label for="fname">First Name: </label>
            <input id="fname" type="text" />
            <br />

            <label for="lname">Last Name: </label>
            <input id="lname" type="text" />
            <br />

            <label for="username">Username: </label>
            <input id="username" type="text" />
            <br />

            <label for="programcode">Your Program: </label>
            <select id="programcode">
                <% %>
            </select>
            <br />

            <label for="#">Current School Year: </label>
            <!-- pull down menu -->
            <br />

            <button type="submit">Register</button>
        </form>
    </body>
</html>