<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-03-28
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dbbeans.AppliedToBean" %>
<%@ page import="dbbeans.JobBean" %>
<%@ page import="dbbeans.UserBean" %>
<%
    JobBean job = new JobBean();
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("../index.jsp");
    }
    String jobid = request.getParameter("jobid");
    if(jobid == null) {
        response.sendRedirect("searchjobs.jsp");
    } else {
        job = JobBean.getJobByID(Integer.parseInt(jobid));
    }



%>

<html>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="../css/jobpost.css">
<link rel="stylesheet" href="../css/header.css">
<link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
<head>
    <title>Job Posting</title>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="../student/studenthome.jsp">COOP<span>Database</span></a></h1>

        <nav>
            <a href="../student/studenthome.jsp">Home</a>
            <a href="../student/profile.jsp">Profile</a>
            <a href="../resume/resume.jsp">Resume</a>
            <a href="../jobs/searchjobs.jsp">Jobs</a>
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

    <div class="row" style="padding-top: 50px">
        <div class="col-2"></div>
        <div class="card col-8">
           <div class="card-block">
               <h4 class="card-title text-center mb-2 text-muted"><%= job.getJobName()%></h4>
               <div class="row" style="margin-top: 40px; margin-bottom: 20px;">
                   <div class="col">
                       <h6>Company:</h6>
                       <p><%=job.getCName()%></p>
                   </div>
                   <div class="col" >
                       <h6>Location:</h6>
                       <p><%=job.getLocation()%></p>
                   </div>
                   <div class="col">
                       <h6>Rate of Pay:</h6>
                       <p>$<%=job.getRateOfPay()%> per hour</p>
                   </div>
                   <div class="col">
                       <h6>Number of Positions</h6>
                       <p><%=job.getNumPositions()%></p>
                   </div>
               </div>
               <div class="row" style="margin-top: 40px; margin-bottom: 20px;">
                   <div class="col">
                       <h6>Posting Date</h6>
                       <p><%=job.getPostingDate()%></p>
                   </div>
                   <div class="col">
                       <h6>Closing Date</h6>
                       <p><%=job.getClosingDate()%></p>
                   </div>
               </div>
               <h6 class="card-subtitle">Description:</h6>
               <hr>
               <p class="card-text "><%=job.getDescription()%></p>
           </div>
            <div class="row" style="padding-top: 30px; padding-bottom: 20px">
                <div class="col">
                <% if(AppliedToBean.isAppliedTo(user.getUsername(),Integer.parseInt(jobid)) == false){%>
                    <%=
                        "<form id=\"applyToCompany\" action=\"../ApplyToJobControl\" method=\"POST\">" +
                            "<input type=\"text\" id=\"jobIDInput\" hidden=\"hidden\" name=\"jobIDInput\" value=\"" + job.getJobId() + "\">" +
                            "<input type=\"text\" id=\"userIDInput\" hidden=\"hidden\" name=\"userIDInput\" value=\"" + user.getUsername() + "\">" +
                            "<button type=\"submit\" class=\"btn btn-primary\">Apply To Job</button>" +
                        "</form>"
                    %>
                <% } else { %>
                    <%=
                        "<form id=\"unApplyToCompany\" action=\"../UnApplyToJobControl\" method=\"POST\">" +
                            "<input type=\"text\" id=\"jobIDInput2\" hidden=\"hidden\" name=\"jobIDInput2\" value=\"" + job.getJobId() + "\">" +
                            "<input type=\"text\" id=\"userIDInput2\" hidden=\"hidden\" name=\"userIDInput2\" value=\"" + user.getUsername() + "\">" +
                            "<button type=\"submit\" class=\"btn btn-danger\">Unapply To Job</button>" +
                        "</form>"
                    %>
                <% } %>
                </div>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
    <hr>
</body>
</html>
