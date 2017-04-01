<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-03-29
  Time: 00:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="dbbeans.CompanyBean" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page import="DAO.CompanyReviewDAO" %>
<%@ page import="dbbeans.CompanyReviewBean" %>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    CompanyReviewBean currentReview;
    boolean reviewExist = false;
    if(user == null){
        response.sendRedirect("../index.jsp");
    }
    if(request.getParameter("companyid") == null){
        response.sendRedirect("reviewlist.jsp");
    } else {
        reviewExist = CompanyReviewDAO.isExistingReview(user.getUsername(), Integer.parseInt(request.getParameter("companyid")));
    }
    CompanyBean company = CompanyDAO.getCompanyById(request.getParameter("companyid"));
    if(reviewExist){
        currentReview = CompanyReviewBean.getUserReviewByCompanyID(user.getUsername(), Integer.parseInt(request.getParameter("companyid")));
    } else {
        currentReview = new CompanyReviewBean(0,0,0,"","","","","");
    }
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
    <link rel="stylesheet" type="text/css" href="../css/joblist.css">
    <link rel="stylesheet" type="text/css" href="../css/jobpost.css">
    <link rel="stylesheet" href="../css/header.css">
    <title>Create Company Review</title>
</head>
<body>
    <header class="header-basic">

        <div class="header-limiter">

            <h1><a href="#">COOP<span>Database</span></a></h1>

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
    <div class="container" style="margin-top: 30px;">
        <h1>Create Company Review</h1>
        <hr>
        <div class="row">

            <!-- edit form column -->
            <div class="col-md-9 personal-info">
                <div class="alert alert-info alert-dismissable">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    <i class="fa fa-coffee"></i>
                    <% if(reviewExist){ %>
                        Here you can edit your existing review for <%=company.getcName()%>.
                    <%  } else { %>
                        Here you can submit a review for <%=company.getcName()%>.
                    <% } %>
                </div>

                <form action="../CreateCompanyReviewControl" method="POST" class="form-horizontal" role="form">
                    <input name="reviewExist" hidden="hidden" readonly="true" type="text"
                           value=<%=reviewExist%>>
                    <input name="companyid" hidden="hidden" readonly="true" type="text"
                           value=<%=company.getCompanyId()%>>
                    <input name="username" hidden="hidden" readonly="true" type="text"
                           value="<%=user.getUsername()%>">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="col-lg-3 control-label">Rating Level</label>
                            <select name="companyRating" class="form-control">
                                <option value="1" <%= currentReview.getRating() == 1 ? "selected" : "" %> >1</option>
                                <option value="2" <%= currentReview.getRating() == 2 ? "selected" : "" %> >2</option>
                                <option value="3" <%= currentReview.getRating() == 3 ? "selected" : "" %> >3</option>
                                <option value="4" <%= currentReview.getRating() == 4 ? "selected" : "" %> >4</option>
                                <option value="5" <%= currentReview.getRating() == 5 ? "selected" : "" %> >5</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Interview Experience</label>
                        <div class="col-lg-8">
                            <textarea name="interviewExperience" class="form-control" type="text"><%=currentReview.getInterviewExperience()%></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">On the Job Experience</label>
                        <div class="col-lg-8">
                            <textarea name="onTheJobExperience" class="form-control" type="text"><%=currentReview.getOnTheJobExperience()%></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Salary Experience</label>
                        <div class="col-lg-8">
                            <textarea name="salaryExperience" class="form-control" type="text"><%=currentReview.getSalaryExperience()%> </textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <input type="submit" class="btn btn-primary" value="Submit">
                            <span></span>
                            <a href="../reviews/reviewlist.jsp" class="btn btn-danger">Cancel</a>
                        </div>
                    </div>
                </form>
                <% if(reviewExist){ %>
                <div class="col-md-9">
                    <form role="form" action="../DeleteCompanyReviewControl" class="form-horizontal" method="post">
                        <input name="deleteUsername" hidden="hidden" readonly="true" type="text"
                               value=<%=user.getUsername()%>>
                        <input name="deleteCompanyID" hidden="hidden" readonly="true" type="text"
                               value=<%=company.getCompanyId()%>>
                        <button type="submit" class="btn-danger btn">Delete</button>
                    </form>
                </div>
                <%  } %>
            </div>
        </div>
    </div>
    </div>

</body>
</html>
