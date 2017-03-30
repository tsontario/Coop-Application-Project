<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-28
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session = request.getSession(true);
%>
<html>
<head>
    <title>$Title$</title>
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
    <div class="alert alert-danger">Something went wrong reviewing this resume. Remember, you can't leave the comments blank!</div>
</body>
</html>
