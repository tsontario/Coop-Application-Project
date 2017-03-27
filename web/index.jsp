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
    <title>Welcome</title>
  </head>
  <body>

  <h1>Student login</h1>
  <form action="LoginControl" method="POST">
    <label for="uname">Username:</label>
    <input id="uname" type="text" name="uname" />
    <label for="password">Password: </label>
    <input id="password" type="password" name="pword" />
    <button type="submit">Submit</button>
  </form>
  <a href="student/studentregister.jsp"><button>New User? Register Here!</button></a>

  <br />
  <hr />
  <br />

  <h1>Company login</h1>
    <form action="CompanyLoginControl" method="POST">
      <label for="cname">Company Name:</label>
      <input id="cname" type="text" name="cname"/>
      <label for="cpassword">Password:</label>
      <input id="cpassword" type="password" name="cpassword" />
      <button type="submit">Submit</button>
    </form>
  <a href="company/companyregister.jsp"><button>New Company? Register Here!</button></a>
  </body>
</html>
