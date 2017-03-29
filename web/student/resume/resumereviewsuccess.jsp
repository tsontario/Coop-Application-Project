<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-29
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Review Successful!</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="alert alert-success">
                <p class="alert alert-success">Great job! Your review has been submitted to ${resume.getUsername()}!</p>
            </div>
        </div>
    </div>

    <a href="../studenthome.jsp"><button class="btn btn-primary">Return to Home</button></a>
</body>
</html>
