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

  <form action="LoginControl" method="POST">
    <label for="uname">Username:</label>
    <input id="uname" type="text" name="uname" />
    <label for="password">Password: </label>
    <input id="password" type="password" name="pword" />
    <button type="submit">Submit</button>
  </form>
  </body>
</html>
