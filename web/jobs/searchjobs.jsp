<%@ page import="dbbeans.JobBean" %>
<%@ page import="dbbeans.UserBean" %>
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
<title>Jobs Page</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="../css/joblist.css">
<link rel="stylesheet" type="text/css" href="../css/jobpost.css">
<link rel="stylesheet" href="../css/header.css">
<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
<head>

</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="../student/studenthome.jsp">Home</a>
            <a href="../student/profile.jsp">Profile</a>
            <a href="#">Resume</a>
            <a href="../jobs/searchjobs.jsp" class="selected">Jobs</a>
            <a href="../reviews/reviewlist.jsp">Write Review</a>
            <% if (user != null) {
                if (user.isAdmin(user.getUsername())) { %>
            <a href="../student/admin.jsp">Admin Panel</a>
            <% } %>
            <% if (user.isModerator(user.getUsername())) { %>
            <a href="../student/mod.jsp">Moderator Panel</a>
            <% }
            }%>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->

    <div class="col-10"  style="padding-top: 40px">
        <h2>Job Postings</h2>
        <hr class="w-100">
        <% for (JobBean job : jobList) { %>
        <% if(user.getLevel() >= job.getJobLevel()){%>
        <a href="#">
            <div class="card w-100">
                <div class="card-block job-post">
                    <h4 class="card-title "><a href="jobpost.jsp?jobid=<%=job.getJobId()%>"
                                               class="title-link"><%=job.getJobName()%>
                    </a></h4>
                    <h6 class="card-subtitle mb-2 text-muted"><%=job.getCName()%></h6>
                    <div class="row">
                        <div class="col">
                            <p class="card-text "><%=job.getLocation()%></p>
                        </div>
                        <div class="col">
                            <p class="card-text "><%=job.getNumPositions()%> position(s)</p>
                        </div>
                        <div class="col">
                            <p class="card-text ">Job Level: <%=job.getJobLevel()%></p>
                        </div>
                        <div class="col">
                            <p class="card-text ">Rate of pay: $<%=job.getRateOfPay()%></p>
                        </div>
                        <div class="col">
                            <p class="card-text ">Closing date: <%=job.getClosingDate()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
        <% } %>
        <% } %>
    </div>

<hr>
</body>

</html>
