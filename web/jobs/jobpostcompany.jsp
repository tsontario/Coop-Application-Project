<%--
  Created by IntelliJ IDEA.
  User: willieausrotas
  Date: 2017-03-29
  Time: 12:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dbbeans.*" %>
<%@ page import="java.util.ArrayList" %>
<%
    CompanyBean companyBean = (CompanyBean) request.getSession().getAttribute("currentCompany");
    ArrayList<ResumeReviewRequestBean> resumeList = ResumeReviewRequestBean.getReviewRequests();

    String jobid = request.getParameter("jobid");
    if (jobid == null) {
        response.sendRedirect("searchjobs.jsp");
    }
    JobBean job = JobBean.getJobByID(Integer.parseInt(jobid));
    ArrayList<UserBean> users = UserBean.getAllUsers();


%>

<html>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="../css/jobpost.css">
<link rel="stylesheet" type="text/css" href="../css/companyApplicant.css">
<link rel="stylesheet" href="../css/header.css">
<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
<head>
    <title>Job Posting</title>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="../company/companyhome.jsp">Home</a>
            <a href="../company/companyprofile.jsp">Profile</a>
            <a href="../company/companyaddjob.jsp">Add Job</a>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->

<div class="row" style="padding-top: 50px">
    <div class="col-2"></div>
    <div class="card col-8">
        <div class="card-block">
            <h4 class="card-title text-center mb-2 text-muted"><%= job.getJobName()%>
            </h4>
            <div class="row" style="margin-top: 40px; margin-bottom: 20px;">
                <div class="col">
                    <h6>Company:</h6>
                    <p><%=job.getCName()%>
                    </p>
                </div>
                <div class="col">
                    <h6>Location:</h6>
                    <p><%=job.getLocation()%>
                    </p>
                </div>
                <div class="col">
                    <h6>Rate of Pay:</h6>
                    <p>$<%=job.getRateOfPay()%> per hour</p>
                </div>
                <div class="col">
                    <h6>Number of Positions</h6>
                    <p><%=job.getNumPositions()%>
                    </p>
                </div>
            </div>
            <div class="row" style="margin-top: 40px; margin-bottom: 20px;">
                <div class="col">
                    <h6>Posting Date</h6>
                    <p><%=job.getPostingDate()%>
                    </p>
                </div>
                <div class="col">
                    <h6>Closing Date</h6>
                    <p><%=job.getClosingDate()%>
                    </p>
                </div>
            </div>
            <h6 class="card-subtitle">Description:</h6>
            <hr>
            <p class="card-text "><%=job.getDescription()%>
            </p>
        </div>
        <div class="row" style="padding-top: 30px; padding-bottom: 20px">
            <div class="col">
                <% if (Integer.parseInt(job.getCompanyId()) == companyBean.getCompanyId()) {%>
                <%=
                "<form id=\"applyToCompany\" action=\"../DeleteJobControl\" method=\"POST\">" +
                        "<input type=\"text\" id=\"jobIDInput\" hidden=\"hidden\" name=\"jobid\" value=\"" + job.getJobId() + "\">" +
                        "<button type=\"submit\" class=\"btn btn-danger\">Delete Job</button>" +
                        "</form>"
                %>
                <% } %>
            </div>
        </div>
    </div>
    <hr class="w-100">
</div>
<div class="col-12" style="text-align: center">
    <h2>Users who have applied:</h2>
    <hr class="w-50">
    <table class="table-fill">
        <thead>
        <tr>
            <th class="text-left">First Name</th>
            <th class="text-left">Last Name</th>
            <th class="text-left">Email</th>
            <th class="text-left">Program</th>
            <th class="text-left">Level</th>
            <th class="text-left">Date Applied</th>
            <th class="text-left">Resume</th>
        </tr>
        </thead>
        <tbody class="table-hover">
        <%
            for (UserBean user : users) {
                if (AppliedToBean.isAppliedTo(user.getUsername(), job.getJobId())) {
                    AppliedToBean appliedToBean = AppliedToBean.getStudentInfo(user.getUsername(), job.getJobId());
                    System.out.println(user.getfName());
        %>
        <tr>
            <td class="text-left"><%=user.getfName()%>
            </td>
            <td class="text-left"><%=user.getlName()%>
            </td>
            <td class="text-left"><%=user.getEmail()%>
            </td>
            <td class="text-left"><%=user.getProgramCode()%>
            </td>
            <td class="text-left"><%=user.getLevel()%>
            </td>
            <td class="text-left"><%=appliedToBean.getTimestamp()%>
            </td>
            <td class="text-left">
                <button class="btn btn-primary">Resume</button>
            </td>
        </tr>


        <%
                }


            }
        %>
        </tbody>
    </table>
    <hr class="w-100">
</div>
</body>
</html>