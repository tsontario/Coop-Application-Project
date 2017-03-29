<%@ page import="dbbeans.ProgramBean" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<% ArrayList<ProgramBean> programList = ProgramBean.getProgramList(); %>
<%--
  Created by IntelliJ IDEA.
  User: willieausrotas
  Date: 2017-03-27
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/header.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    <title>Profile of ${currentUser.getUsername()}</title>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="../student/studenthome.jsp">Home</a>
            <a href="profile.jsp" class="selected">Profile</a>
            <a href="#">Resume</a>
            <a href="../jobs/searchjobs.jsp">Jobs</a>
            <a href="../reviews/reviewlist.jsp">Write Review</a>
            <% if (user != null) {
                if (user.isAdmin(user.getUsername())) { %>
            <a href="admin.jsp">Admin Panel</a>
            <% } %>
            <% if (user.isModerator(user.getUsername())) { %>
            <a href="mod.jsp">Moderator Panel</a>
            <% }
            }%>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->
<div class="container">
    <h1>Edit Profile</h1>
    <hr>
    <div class="row">

        <!-- edit form column -->
        <div class="col-md-9 personal-info">
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a>
                <i class="fa fa-coffee"></i>
                Welcome ${currentUser.getfName()}. Here you can edit any information you need to on your profile.
            </div>
            <h3>Personal info</h3>

            <form action="UpdateControl" method="POST" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-lg-3 control-label">First name:</label>
                    <div class="col-lg-8">
                        <input name="firstName" class="form-control" type="text" value=${currentUser.getfName()} required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Last name:</label>
                    <div class="col-lg-8">
                        <input name="lastName" class="form-control" type="text" value=${currentUser.getlName()} required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Program Code:</label>
                    <div class="col-lg-8">
                        <select name="programCode" class="form-control" required>
                            <% for (ProgramBean program : programList) {
                                String p = program.getProgramCode();
                                if (p.equals(user.getProgramCode())){%>
                                    <option selected="<%=p%>"><%=p%></option>
                                <% } else{ %>
                                    <option value="<%=p%>"><%=p%></option>
                                <% }
                            } %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Email:</label>
                    <div class="col-lg-8">
                        <input name="email" class="form-control" type="email"
                               value=${currentUser.getEmail()} readonly="true" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Username:</label>
                    <div class="col-md-8">
                        <input name="username" readonly class="form-control" type="text"
                               value=${currentUser.getUsername()} required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Password:</label>
                    <div class="col-md-8">
                        <input name="password" class="form-control" type="password" value=${currentUser.getPassword()} required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Confirm password:</label>
                    <div class="col-md-8">
                        <input name="passwordcheck" class="form-control" type="password"
                               value=${currentUser.getPassword()} required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-8">
                        <input type="submit" class="btn btn-primary" value="Save Changes">
                        <span></span>
                        <a href="studenthome.jsp" class="btn btn-danger">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<hr>
</body>
</html>