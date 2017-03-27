<%@ page import="dbbeans.JobBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dbbeans.CompanyBean" %>
<%@ page import="dbbeans.UserBean" %>
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
<% UserBean user = (UserBean) request.getSession().getAttribute("currentUser"); %>

<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <p>Hello ${currentUser.getUsername()}, welcome to your home page!</p>
    <br />

    <h2>Top Jobs</h2>
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

    <br />
    <hr />
    <br />

    <h2>Top Companies</h2>
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
    <br />
    <hr />
    <nr />
    <h2>Select an option: </h2>

    <% if (user.isAdmin(user.getUsername())) { %>
        <a href="admin.jsp"><button>Admin page</button></a>
    <% } %>

    <% if (user.isModerator(user.getUsername())) { %>
        <%= "MOD" %>
    <% } %>
</body>
</html>
