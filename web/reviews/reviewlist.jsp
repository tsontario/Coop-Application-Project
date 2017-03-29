<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-03-28
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="DAO.CompanyDAO" %>
<%@ page import="dbbeans.CompanyBean" %>
<%@ page import="dbbeans.CompanyReviewBean" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    ArrayList<CompanyBean> companies = CompanyReviewBean.getAllCompanies();
    if(user == null){
        response.sendRedirect("../index.jsp");
    }
%>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
    <link rel="stylesheet" type="text/css" href="../css/joblist.css">
    <link rel="stylesheet" type="text/css" href="../css/jobpost.css">
    <link rel="stylesheet" href="../css/header.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    <title>Companies</title>
</head>
<body>
    <header class="header-basic">

        <div class="header-limiter">

            <h1><a href="../student/studenthome.jsp">COOP<span>Database</span></a></h1>

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
        <% for (CompanyBean company : companies) { %>
        <% int numRating = CompanyDAO.numReviews(company.getCompanyId());%>
        <div class="card w-100">
            <div class="card-block job-post">
                <div class="row">
                    <div class="col">
                        <p class="card-text "><%=company.getcName()%></p>
                    </div>
                    <div class="col">
                        <p class="card-text ">Average rating <%=company.getAverageRating(company.getCompanyId())%></p>
                    </div>
                    <div class="col">
                        <p class="card-text ">Number of ratings <%=numRating%></p>
                    </div>
                    <div class="col">
                        <a href="createcompanyreview.jsp?companyid=<%=company.getCompanyId()%>" class="card-link ">Create Review</a>
                    </div>
                    <div class="col">
                        <a href="viewcompanyreview.jsp?companyid=<%=company.getCompanyId()%>" class="card-link ">View Reviews</a>
                    </div>
                </div>
            </div>
        </div>

        <% } %>
    </div>
    <hr>

</body>
</html>
