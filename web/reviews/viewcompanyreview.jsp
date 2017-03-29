<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-03-29
  Time: 01:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="dbbeans.CompanyReviewBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("../index.jsp");
    }
    if(request.getParameter("companyid") == null){
        response.sendRedirect("reviewlist.jsp");
    }
    int companyid = Integer.parseInt(request.getParameter("companyid"));
    ArrayList<CompanyReviewBean> reviews = CompanyReviewBean.getReviewsByID(companyid);
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
    <link rel="stylesheet" type="text/css" href="../css/joblist.css">
    <link rel="stylesheet" type="text/css" href="../css/jobpost.css">
    <link rel="stylesheet" href="../css/header.css">
    <title>View Reviews</title>
</head>
<body>

    <header class="header-basic">

        <div class="header-limiter">

            <h1><a href="#">COOP<span>Database</span></a></h1>

            <nav>
                <a href="../student/studenthome.jsp">Home</a>
                <a href="../student/profile.jsp">Profile</a>
                <a href="#">Resume</a>
                <a href="../jobs/searchjobs.jsp">Jobs</a>
                <a href="../reviews/reviewlist.jsp" class="selected">Write Review</a>
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

    <div class="col-8" style="margin-top: 40px">
        <h2>Companies</h2>
        <hr class="w-100">
        <% for (CompanyReviewBean review : reviews) { %>
        <div class="card w-100">
            <div class="card-block job-post">
                <div class="row">
                    <div class="col">
                        <p class="card-text ">Review by: <%=review.getUsername()%></p>
                    </div>
                    <div class="col">
                        <p class="card-text ">Rating <%=review.getRating()%></p>
                    </div>
                    <div class="col">
                        <p class="card-text ">Review Date <%=review.getTimestamp()%></p>
                    </div>
                </div>
            </div>
        </div>

        <% } %>
    </div>
    <hr>
</body>
</html>