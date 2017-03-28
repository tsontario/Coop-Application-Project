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

<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="../css/joblist.css">
<head>

</head>
<body>
<div class="row" style="padding-top: 40px">
<div class="col-3"></div>

    <div class="col-8">
        <h2>Job Postings</h2>
        <hr class="w-100">
        <% for (JobBean job : jobList) { %>
        <a href="#">
            <div class="card w-100">
                <div class="card-block job-post">
                    <h4 class="card-title "><a href="#" class="title-link"><%=job.getJobName()%></a></h4>
                    <h6 class="card-subtitle mb-2 text-muted"><%=job.getCName()%></h6>
                    <div class="row">
                        <div class="col">
                            <p class="card-text "><%=job.getLocation()%></p>
                        </div>
                        <div class="col">
                            <p class="card-text "><%=job.getNumPositions()%> position(s)</p>
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
    </div>

</div>
</body>

</html>
