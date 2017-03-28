<%@ page import="dbbeans.UserBean" %>
<%@ page import="dbbeans.ResumeReviewRequestBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-27
  Time: 12:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    ArrayList<ResumeReviewRequestBean> resumeList = ResumeReviewRequestBean.getReviewRequests();
%>

<html>
<head>
    <title>Moderator Panel: ${currentUser}</title>
</head>
<body>
    <h2>Resumes to be reviewed:</h2>

    <ul>

    </ul>

</body>
</html>
