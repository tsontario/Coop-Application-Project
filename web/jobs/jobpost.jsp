<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-03-28
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="dbbeans.JobBean" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="dbbeans.AppliedToBean" %>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("../index.jsp");
    }
    String jobid = request.getParameter("jobid");
    if(jobid == null) {
        response.sendRedirect("searchjobs.jsp");
    }
    JobBean job = JobBean.getJobByID(Integer.parseInt(jobid));



%>

<html>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="../css/jobpost.css">
<head>
    <title>Job Posting</title>
</head>
<body>

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
                <% if(AppliedToBean.isAppliedTo(user.getUsername(),jobid) == false){%>
                    <%=
                        "<form id=\"applyToCompany\" action=\"../ApplyToJobControl\" method=\"POST\">" +
                            "<input type=\"text\" id=\"jobIDInput\" hidden=\"hidden\" name=\"jobIDInput\" value=\"" + job.getJobId() + "\">" +
                            "<input type=\"text\" id=\"userIDInput\" hidden=\"hidden\" name=\"userIDInput\" value=\"" + user.getUsername() + "\">" +
                            "<button type=\"submit\" class=\"btn btn-primary\">Apply To Job</button>" +
                        "</form>"
                    %>
                <% } else { %>
                    <%=
                        "<button type=\"button\" disabled class=\"btn btn-primary\">Applied To Job Already</button>"
                    %>
                <% } %>
                </div>
            </div>
        </div>

        <div class="col-2"></div>
    </div>
    <%=job.getJobId()%>
</body>
</html>
