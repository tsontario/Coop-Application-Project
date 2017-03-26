<%@ page import="dbbeans.JobBean" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-26
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="jobs" class="dbbeans.JobBean" scope="session" />
<%ArrayList<JobBean> jobList = jobs.listTopFiveJobs();%>

<html>
<head>

    <title>Welcome</title>
</head>
<body>
    <p>Hello  ${currentUser.getUsername()}</p>
    <br />

    <h2>Top 5 Jobs</h2>
    <table>
        <tr>
            <th>Job Title</th>
            <th>Job Level</th>
            <th>Company</th>
            <th>Salary</th>
        </tr>
        <% for (JobBean job : jobList) { %>
            <%= "<tr>" +
                    "<td>" + job.getJobName() + "</td>" +
                    "<td>" + job.getJobLevel() + "</td>" +
                    "<td>" + job.getRateOfPay() + "</td>"
            %>
        <% } %>
    </table>

</body>
</html>
