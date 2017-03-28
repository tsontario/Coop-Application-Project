<%@ page import="dbbeans.UserBean" %>
<%@ page import="dbbeans.JobBean" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-03-27
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    ArrayList<JobBean> jobList = JobBean.getAllJobs();
    if(user == null){
        response.sendRedirect("../index.jsp");
    }
%>
<% String temp = request.getParameter("name") ;%>
<html>
<head>
    <title>Search Jobs</title>
    <table id="job_listings">
        <tr>
            <th>Company Name</th>
            <th>Location</th>
            <th>Number of Pos</th>
            <th>Rate of pay</th>
            <th>Job Title</th>
            <th>Job ID</th>
            <th>Posting date</th>
            <th>Closing Date</th>
            <th>Job Level</th>

        </tr>
        <p> <%= temp%> </p>
        <% for (JobBean job : jobList) { %>
        <%=
            "<tr>" +
                "<td>" + job.getCName() + "</td>" +
                "<td>" + job.getLocation() + "</td>" +
                "<td>" + job.getNumPositions() + "</td>" +
                "<td>" + "$"  + job.getRateOfPay() + "</td>" +
                "<td>" + job.getJobName() + "</td>" +
                "<td>" + job.getJobId() + "</td>" +
                "<td>" + job.getPostingDate() + "</td>" +
                "<td>" + job.getClosingDate() + "</td>" +
                "<td>" + job.getJobLevel() + "</td>" +
            "</tr>"
        %>
        <% } %>
    </table>
</head>
<body>

</body>
</html>
