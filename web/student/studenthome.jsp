<%@ page import="dbbeans.CompanyBean" %>
<%@ page import="dbbeans.JobBean" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-26
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<JobBean> jobList = JobBean.listTopFiveJobs();
    ArrayList<CompanyBean> companyList = CompanyBean.listTopFiveCompanies();
    CompanyBean companyBean = new CompanyBean();
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    if (user == null) {response.sendRedirect("sessionended.jsp"); }
%>

<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="../css/header.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="studenthome.jsp" class="selected">Home</a>
            <a href="profile.jsp">Profile</a>
            <a href="#">Resume</a>
            <a href="../jobs/searchjobs.jsp">Jobs</a>
            <a href="../reviews/reviewlist.jsp">Write Review</a>
            <% if (user != null) {
                if (UserBean.isAdmin(user.getUsername())) { %>
            <a href="admin.jsp">Admin Panel</a>
            <% } %>
            <% if (UserBean.isModerator(user.getUsername())) { %>
            <a href="mod.jsp">Moderator Panel</a>
            <% }
            }%>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->


    <p>Hello ${currentUser.getfName()}, welcome to your home page!</p>

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

</body>
</html>
