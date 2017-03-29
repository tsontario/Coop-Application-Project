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
</head>
<body>
Welcome ${currentCompany.getcName()}!
<a href="companyprofile.jsp">
    <button>Edit Profile</button>
</a>
</body>
</html>
