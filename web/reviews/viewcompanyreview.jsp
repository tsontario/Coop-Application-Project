<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-03-29
  Time: 01:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dbbeans.CompanyReviewBean" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.CompanyReviewDAO" %>
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

            <h1><a href="../student/studenthome.jsp">COOP<span>Database</span></a></h1>

            <nav>
                <a href="../student/studenthome.jsp">Home</a>
                <a href="../student/profile.jsp">Profile</a>
                <a href="#">Resume</a>
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

    <div class="col-8" style="margin-top: 40px">
        <h2>Reviews</h2>
        <hr class="w-100">
        <% for (CompanyReviewBean review : reviews) { %>
        <div class="card w-100" style="margin-bottom: 40px">
            <div class="card-block job-post">
                <div class="row">
                    <div class="col">
                        <p class="card-text ">Review by: <%=review.getUsername()%></p>
                    </div>
                    <div class="col">
                        <p class="card-text ">Rating: <%=review.getRating()%></p>
                    </div>
                    <div class="col">
                        <p class="card-text ">Review Date: <%=review.getTimestamp()%></p>
                    </div>
                    <div class="col">
                        <p class="card-text ">Upvotes: <%=review.getUpvotes()%></p>
                    </div>
                </div>
                <div class="row" style="margin-top: 40px">
                    <div class="col">
                    <h6 class="card-subtitle">Interview Experience</h6>
                    <% if(review.getInterviewExperience() != null ){%>
                    <p class="card-text "><%=review.getInterviewExperience()%></p>
                    <% } %>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col">
                        <h6 class="card-subtitle">On The Job Experience</h6>
                        <% if(review.getOnTheJobExperience() != null ){%>
                        <p class="card-text "><%=review.getOnTheJobExperience()%></p>
                        <% } %>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col">
                        <h6 class="card-subtitle">Salary Experience</h6>
                        <% if(review.getSalaryExperience() != null ){%>
                            <p class="card-text "><%=review.getSalaryExperience()%></p>
                        <% } %>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px;">
                    <div class="col">
                            <form action="../UpVoteControl" method="post">
                                <input name="username" hidden="hidden" readonly="true" type="text"
                                       value=<%=user.getUsername()%>>
                                <input name="reviewid" hidden="hidden" readonly="true" type="text"
                                       value=<%=review.getReviewid()%>>
                                <input name="companyid" hidden="hidden" readonly="true" type="text"
                                       value=<%=review.getCompanyid()%>>
                                <% if(CompanyReviewDAO.alreadyUpvoted(user.getUsername(),review.getReviewid())){%>
                                    <input name="isUpvoting" hidden="hidden" readonly="true" type="text"
                                       value="false">
                                    <button type="submit" class="btn btn-danger">Undo Upvote</button>
                                <% } else {%>
                                    <input name="isUpvoting" hidden="hidden" readonly="true" type="text"
                                       value="true">
                                    <button type="submit" class="btn btn-primary">Upvote</button>
                                <% } %>
                            </form>
                    </div>
                </div>
            </div>
        </div>

        <% } %>
    </div>
    <hr>
</body>
</html>
