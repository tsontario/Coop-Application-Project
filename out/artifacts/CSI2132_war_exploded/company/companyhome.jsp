<%@ page import="dbbeans.CompanyBean" %><%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-27
  Time: 1:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CompanyBean company = (CompanyBean) request.getSession().getAttribute("currentCompany");
%>
<html>
<head>
    <title>Welcome ${currentCompany.getcName()}!</title>
    <link rel="stylesheet" href="../css/header.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="companyhome.jsp" class="selected">Home</a>
            <a href="companyprofile.jsp">Profile</a>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->
Welcome ${currentCompany.getcName()}!
<a href="companyprofile.jsp">
    <button>Edit Profile</button>
</a>
</body>
</html>
