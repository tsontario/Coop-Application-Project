<%@ page import="dbbeans.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% UserBean user = (UserBean) request.getSession().getAttribute("currentUser"); %>
<html>
    <head>
        <title>Admin Page: ${currentUser.getUsername()}</title>
    </head>
    <body>
    </body>
</html>