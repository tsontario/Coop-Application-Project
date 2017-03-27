<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>New Student Registration</title>
    </head>
    <body>
        <form action="StudentRegisterControl" method="POST">

            <label for="#">First Name: </label>
            <input type="text" />

            <label for="#">Last Name: </label>
            <input type="text" />

            <label for="#">Username: </label>
            <input type="text" />

            <label for="#">Your Program: </label>
            <!-- pull down menu -->

            <label for="#">Current School Year: </label>
            <!-- pull down menu -->

            <button type="submit">Register</button>
        </form>
    </body>
</html>