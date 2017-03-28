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
    ArrayList<ResumeReviewRequestBean> resumeList = ResumeReviewRequestBean.getReviewRequests();
%>

<html>
<head>
    <title>Moderator Panel: ${currentUser}</title>
    <link rel="stylesheet" href="./../css/styles.css">
</head>
<body>
    <h2>Resumes to be reviewed:</h2>


    <table>
        <tr>
            <th>User</th>
            <th width="20px"></th>
        </tr>
        <% for(ResumeReviewRequestBean resume: resumeList) { %>
            <tr id="">
                <td>
                    <%= resume.getRequesterUsername() %>
                </td>
                <td>
                    <form style="all:initial"action="resumereview.jsp" method="POST">
                        <input type="hidden" name="resumeid" value="<%= resume.getResumeId() %>" />
                        <button type="submit">Review</button>
                    </form>
                </td>
            </tr>

        <% } %>
    </table>
</body>
</html>
