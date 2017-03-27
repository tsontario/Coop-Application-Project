<%@ page import="dbbeans.JobBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dbbeans.CompanyBean" %>
<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-26
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<JobBean> jobList = JobBean.listTopFiveJobs(); %>
<% ArrayList<CompanyBean> companyList = CompanyBean.listTopFiveCompanies(); %>
<% CompanyBean companyBean = new CompanyBean(); %>

<html>
<head>

    <title>Welcome</title>
</head>
<body>
    <p>Hello ${currentUser.getUsername()}</p>
    <br />

    <h2>Top 5 Jobs</h2>
    <table id="top5_jobs">
        <tr>
            <th>Job Title</th>
            <th>Job Level</th>
            <th>Company</th>
            <th>Salary</th>
        </tr>
        <% for (JobBean job : jobList) { %>
            <%=
                "<tr>" +
                    "<td>" + job.getJobName() + "</td>" +
                    "<td>" + job.getJobLevel() + "</td>" +
                    "<td>" + companyBean.getCompanyById(job.getCompanyId()).getcName() + "</td>" +
                    "<td>" + job.getRateOfPay() + "</td>" +
                "</tr>"
            %>
        <% } %>
    </table>
    <hr />
    <table id="top5_companies">
        <tr>
            <th>Company</th>
            <th>Location</th>
            <th>Average Rating</th>
        </tr>
        <% for (CompanyBean company : companyList) { %>
            <%=
                "<tr>" +
                    "<td>" + company.getcName() + "</td>" +
                    "<td>" + company.getLocation() + "</td>" +
                    "<td>" + company.getAverageRating(company.getCompanyId()) + "</td>" +
                "</tr>"
            %>
        <% } %>

    </table>

</body>
</html>
