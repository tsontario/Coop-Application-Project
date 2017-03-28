<%@ page import="dbbeans.ResumeReviewRequestBean" %>
<%@ page import="java.util.ArrayList" %>
<%--
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../css/modPage.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <title>Moderator Panel</title>
    <meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
</head>

<body>
<div class="table-title">
    <h3>Resumes to be Reviewed</h3>
</div>
<table class="table-fill">
    <thead>
    <tr>
        <th class="text-left">User</th>
        <th class="text-center">Resume</th>
    </tr>
    </thead>
    <tbody class="table-hover">
    <% for (ResumeReviewRequestBean resume : resumeList) { %>
        <tr id="">
            <td class="text-left">
                <%= resume.getRequesterUsername() %>
            </td>
            <td class="text-center">
                <form style="all:initial" action="resume/resumereview.jsp" method="POST">
                    <input type="hidden" name="resumeid" value="<%= resume.getResumeId() %>"/>
                    <button class="btn btn-primary" type="submit">Review</button>
                </form>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>
<hr>

</body>
</html>