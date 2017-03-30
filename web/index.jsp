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
          <form class="login-form" action="LoginControl" method="POST">
              <p>Student Login</p>
              <input type="text" name="uname" placeholder="username" required/>
              <input type="password" name="pword" placeholder="password" required/>
              <button type="submit">login</button>
              <p class="message">Not registered? <a href="student/studentregister.jsp">Create an account</a></p>
              <p class="message">Company? <a href="indexCompany.jsp">Login here</a></p>
          </form>
      </div>
  </div>
  </body>
</html>
