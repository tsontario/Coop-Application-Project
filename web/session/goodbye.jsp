<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-27
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session.invalidate(); %>
<html>
<head>
    <title>Thanks for visiting!</title>
</head>
<body>
    <h2>You have been logged out. Redirecting in 5 seconds...</h2>
</body>
</html>
<%
    response.sendRedirect("/index.jsp");
%>