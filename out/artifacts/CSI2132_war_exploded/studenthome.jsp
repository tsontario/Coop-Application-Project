<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-26
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="jobs" class="dbbeans.JobBean" scope="request" />
<html>
<head>

    <title>Welcome</title>
</head>
<body>
    <p>Hello  ${currentUser.getUsername()}</p>
    <br />

    <h2>Top 5 Jobs</h2>

</body>
</html>
