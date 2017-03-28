<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-26
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/indexCSS.css">
    <title>Welcome</title>
</head>
<body>

<div class="login-page">
    <div class="form">
        <form class="login-form" action="CompanyLoginControl" method="POST">
            <p>Company Login</p>
            <input type="text" name="cname" placeholder="username"/>
            <input type="password" name="cpassword" placeholder="password"/>
            <button type="submit">login</button>
            <p class="message">Not registered? <a href="company/companyregister.jsp">Create an account</a></p>
            <p class="message">Student? <a href="index.jsp">Login here</a></p>
        </form>
    </div>
</div>

</body>
</html>
