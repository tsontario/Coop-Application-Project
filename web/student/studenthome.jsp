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
    if (user == null) {
        response.sendRedirect("sessionended.jsp");
    }
    int newJobs = JobBean.consumeNewJobNotificationsByUser(user.getUsername());

%>

<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
    <link rel="stylesheet" type="text/css" href="../css/joblist.css">
    <link rel="stylesheet" type="text/css" href="../css/homePageList.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="../student/studenthome.jsp">COOP<span>Database</span></a></h1>

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

<br/>

    <% if (newJobs != 0) { %>
        <div class="row" style="padding-top: 20px">
            <div class="alert alert-success alert-dismissable " style="text-align: center;margin-left: 20em">
                <a class="panel-close close" data-dismiss="alert"></a>
                <i class="fa fa-coffee"></i>
                Looks like there are <%= newJobs %> new jobs available for you!
                Check them out in the Jobs tab!
            </div>
        </div>
    <% } %>
    <div class="row" style="padding-top: 40px">
        <div class="alert alert-info alert-dismissable " style="text-align: center;margin-left: 20em">
            <a class="panel-close close" data-dismiss="alert"></a>
            <i class="fa fa-coffee"></i>
            Welcome to your dashboard, ${currentUser.getfName()}.
            Here you will see the top 5 job postings and the top 5 companies!
        </div>

        <div class="col-lg-7" style="margin-left: 50px;">

            <h2>Top Jobs</h2>
            <hr class="w-100">
            <div id="" style="overflow-y: auto; height:400px">
                <%
                    for (JobBean job : jobList) {
                %>

                <a href="#">
                    <div class="card w-100">

                        <div class="card-block job-post">
                            <h4 class="card-title "><a href="../jobs/jobpost.jsp?jobid=<%=job.getJobId()%>"
                                                       class="title-link"><%=job.getJobName()%>
                            </a></h4>
                            <div class="row">
                                <div class="col">
                                    <p class="card-text "><%=companyBean.getCompanyById(job.getCompanyId()).getcName()%>
                                    </p>
                                </div>
                                <div class="col">
                                    <p class="card-text "><%=job.getNumPositions()%> position(s)</p>
                                </div>
                                <div class="col">
                                    <p class="card-text ">Rate of pay: $<%=job.getRateOfPay()%>
                                    </p>
                                </div>
                                <div class="col">
                                    <p class="card-text ">Closing date: <%=job.getClosingDate()%>
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>

                </a>

                <%
                    }%>
            </div>
            <hr class="w-100">
        </div>
        <div class="col-lg-3">
            <div>
                <h2>Top Companies</h2>
                <hr class="w-100">
                <ul>
                    <% for (CompanyBean company : companyList) {
                        int id = company.getCompanyId();
                    %>
                    <li><a href="../reviews/viewcompanyreview.jsp?companyid=<%=id%>"><%=company.getcName()%>
                    </a></li>
                    <% } %>
                </ul>
            </div>

    </div>
</div>
</body>
</html>
