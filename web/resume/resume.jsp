<%@ page import="dbbeans.UserBean" %>
<%@ page import="DAO.ResumeReviewRequestDAO" %>
<%@ page import="dbbeans.ResumeBean" %>
<%@ page import="DAO.ResumeReviewDAO" %>
<%@ page import="DAO.ResumeDAO" %>
<%@ page import="dbbeans.ResumeReviewBean" %><%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 2017-04-01
  Time: 03:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("../index.jsp");
    }
    boolean resumeIsPending = false;
    boolean isExistingResume = false;
    ResumeBean resume = new ResumeBean();
    ResumeReviewBean resumeReviewBean = new ResumeReviewBean();
    int versionno = 0;
    if(request.getParameter("versionno") != null ){
        versionno = Integer.parseInt(request.getParameter("versionno"));
        resumeIsPending = ResumeReviewRequestDAO.isResumePending(user.getUsername(), versionno);
        resume = ResumeDAO.getResumeByVersionNumber(user.getUsername(),versionno);
        if(resume.getResume() != null){
            isExistingResume = true;
            resumeReviewBean = ResumeReviewBean.getReviewForResumeVersion(resume.getResumeId(),versionno);
        }
    }
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-wells.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-grid.css">
    <link rel="stylesheet" type="text/css" href="../css/joblist.css">
    <link rel="stylesheet" type="text/css" href="../css/jobpost.css">
    <link rel="stylesheet" href="../css/header.css">
    <title>Create Resume</title>
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
    <h1>Resume</h1>
    <hr>
    <div class="row">

        <!-- edit form column -->
        <div class="col-md-9 personal-info">
            <div class="alert alert-info alert-dismissable">
                <%=isExistingResume? "This is your resume, version number " + versionno : "Create your new resume"%>
            </div>

            <form action="../CreateResumeControl" method="POST" class="form-horizontal" role="form">
                <input name="username" hidden="hidden" readonly="true" type="text"
                       value=<%=user.getUsername()%>>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Resume</label>
                    <div class="col-lg-8">
                        <textarea name="resume" class="form-control" type="text" required="required"
                        <%=isExistingResume? "disabled" : ""%>><%=isExistingResume? resume.getResume(): "" %></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-8">
                        <input type="submit" class="btn btn-primary" value="Submit" <%=isExistingResume? "disabled":""%>>
                        <span></span>
                        <a href="../student/studenthome.jsp" class="btn btn-danger">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-3">
            <h4>View revision</h4>
            <form action="../CreateResumeControl" method="get" class="form-horizontal" role="form">
                <select name="versionRedirect" class="form-control">
                    <% for(int c=1; c <= ResumeDAO.getLastestVersionNumber(user.getUsername());c++){%>
                    <option value="<%=c%>"><%=c%></option>
                    <% } %>
                </select>
                <button type="submit" class="btn-primary btn" style="margin: 15px 0px">Go to Version</button>
            </form>
        </div>
        <% if(!resumeIsPending && isExistingResume){ %>
        <div class="col-md-9">
            <form role="form" action="../CreateResumeRequestControl" class="form-horizontal" method="post">
                <input name="username" hidden="hidden" readonly="true" type="text"
                       value=<%=user.getUsername()%>>
                <input name="resumeid" hidden="hidden" readonly="true" type="text"
                       value=<%=resume.getResumeId()%>>
                <input name="versionno" hidden="hidden" readonly="true" type="text"
                       value=<%=resume.getVersionNo()%>>
                <button type="submit" class="btn-primary btn">Submit for review</button>
            </form>
        </div>
        <%  } %>
    </div>


    <%if(resumeReviewBean.getModerator() != null){ %>
    <h6>Resume Review Feedback</h6>
    <p>Moderator: <%=resumeReviewBean.getModerator().getfName() + " " + resumeReviewBean.getModerator().getlName()%></p>
    <div class="well-lg well">
        <%=resumeReviewBean.getComments()%>
    </div>
    <% }%>
</div>
</div>
</body>
</html>
