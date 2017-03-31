<%@ page import="dbbeans.ProgramBean" %><%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-30
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/indexCSS.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <title>New Program</title>
</head>
<body>

<div class="login-page">
    <div class="form">
        <form class="login-form" action="/program/AddProgramControl" method="POST">
            <label for="name">Program Name:</label>
            <input id="name" type="text" name="programName" placeholder="" required/>

            <label for="code">Program Code:</label>
            <input id="code" type="text" name="programCode" placeholder="" required/>
            <button type="submit" class="btn btn-primary btn-success">Add Program</button>
        </form>
    </div>
</div>
</body>
</html>
