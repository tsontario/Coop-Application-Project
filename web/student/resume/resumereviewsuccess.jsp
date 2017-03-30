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
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="../company/companyhome.jsp">Home</a>
            <a href="../company/companyprofile.jsp">Profile</a>
            <a href="../company/companyaddjob.jsp">Add Job</a>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->
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
