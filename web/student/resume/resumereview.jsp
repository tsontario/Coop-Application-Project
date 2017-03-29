<%@ page import="dbbeans.ResumeBean" %>
<%@ page import="dbbeans.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: timothysmith
  Date: 2017-03-28
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("resumeid"));
    ResumeBean resumeBean = ResumeBean.getResumeById(id);
    UserBean resumeAuthor = UserBean.getUserById(resumeBean.getUsername());
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("sessionended.jsp");
    }
%>
<html>
<head>
    <title>Review of <%= resumeBean.getUsername() %>'s Resume</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="../../student/studenthome.jsp">Home</a>
            <a href="../../student/profile.jsp">Profile</a>
            <a href="#">Resume</a>
            <a href="../../jobs/searchjobs.jsp">Jobs</a>
            <a href="../../reviews/reviewlist.jsp">Write Review</a>
            <% if (user != null) {
                if (user.isAdmin(user.getUsername())) { %>
            <a href="../admin.jsp">Admin Panel</a>
            <% } %>
            <% if (user.isModerator(user.getUsername())) { %>
            <a href="../mod.jsp">Moderator Panel</a>
            <% }
            }%>
            <a href="../../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->
    <div class="container">
        <div><h1>Review <%= resumeBean.getUsername() %>'s Resume</h1></div>
        <hr />
        <div class="row">
            <div class="col-md-9 personal-info">
                <form id="form" action="ResumeReviewSubmissionControl" method="POST" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="author" class="col-lg-3 control-label">Author:</label>
                        <div class="col-lg-8">
                            <input class="form-control" id="author" type="text" value="<%= resumeAuthor.getfName() + " " + resumeAuthor.getlName() %>" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="version" class="col-lg-3 control-label">Current Resume Version:</label>
                        <div class="col-lg-8">
                            <input class="form-control" id="version" type="text" value="<%= resumeBean.getVersionNo() %>" disabled />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content" class="col-lg-3 control-label">Resume:</label>
                        <div class="col-lg-8">
                            <textarea form="form" class="form-control" id="content" disabled>
                                <%= resumeBean.getResume() %>
                            </textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content" class="col-lg-3 control-label">Type Your Comments Here:</label>
                        <div class="col-lg-8">
                            <textarea form="form" class="form-control" id="comments" rows="10" value="<%= resumeBean.getResume() %>"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <input form="form" type="submit" class="btn btn-primary" value="Submit Review">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript">
    document.getElementById("content").style.height = document.getElementById("content").scrollHeight+'px';

</script>
</html>
