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
    <title>Profile of ${currentUser.getUsername()}</title>
</head>
<body>
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
                        <input name="firstName" class="form-control" type="text" value=${currentUser.getfName()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Last name:</label>
                    <div class="col-lg-8">
                        <input name="lastName" class="form-control" type="text" value=${currentUser.getlName()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Program Code:</label>
                    <div class="col-lg-8">
                        <select name="programCode" class="form-control">
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
                        <input name="email" class="form-control" type="text"
                               value=${currentUser.getEmail()} readonly="true">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Username:</label>
                    <div class="col-md-8">
                        <input name="username" readonly="true" class="form-control" type="text"
                               value=${currentUser.getUsername()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Password:</label>
                    <div class="col-md-8">
                        <input name="password" class="form-control" type="password" value=${currentUser.getPassword()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Confirm password:</label>
                    <div class="col-md-8">
                        <input name="passwordcheck" class="form-control" type="password"
                               value=${currentUser.getPassword()}>
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