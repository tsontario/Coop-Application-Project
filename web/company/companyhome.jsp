<%@ page import="dbbeans.CompanyBean" %>
<%@ page import="dbbeans.JobBean" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-27
  Time: 1:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CompanyBean company = (CompanyBean) request.getSession().getAttribute("currentCompany");
    ArrayList<JobBean> jobList = JobBean.getAllJobsOrderByNewest();
    ArrayList<UserBean> users = UserBean.getAllUsers();


%>
<html>
<head>
    <title>Welcome ${currentCompany.getcName()}!</title>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
    <link rel="stylesheet" type="text/css" href="../css/joblist.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="companyhome.jsp" class="selected">Home</a>
            <a href="companyprofile.jsp">Profile</a>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->
<div class="container">
    <div class="row" style="padding-top: 40px">
        <div class="col-lg-11">
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert"></a>
                <i class="fa fa-coffee"></i>
                Welcome to your dashboard, ${currentCompany.getcName()}.
                Here you will see your most recent job postings and the most recent applications to your positions.
            </div>
            <h2>Job Postings</h2>
            <hr class="w-100">
            <div id="" style="overflow-y: auto; height:500px">
                <%
                    for (JobBean job : jobList) {
                        if (company.getCompanyId() == Integer.parseInt(job.getCompanyId())) {
                %>

                <a href="#">
                    <div class="card w-100">

                        <div class="card-block job-post">
                            <h4 class="card-title "><a href="../jobs/jobpostcompany.jsp?jobid=<%=job.getJobId()%>"
                                                       class="title-link"><%=job.getJobName()%>
                            </a></h4>
                            <h6 class="card-subtitle mb-2 text-muted"><%=job.getCName()%>
                            </h6>
                            <div class="row">
                                <div class="col">
                                    <p class="card-text "><%=job.getLocation()%>
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

                <% }
                }%>
            </div>
            <hr class="w-100">
        </div>

    </div>
</div>
</body>
</html>
