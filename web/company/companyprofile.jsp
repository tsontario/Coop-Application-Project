<%@ page import="dbbeans.CompanyBean" %><%--
  Created by IntelliJ IDEA.
  User: willieausrotas
  Date: 2017-03-28
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CompanyBean company = (CompanyBean) request.getSession().getAttribute("currentCompany");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <title>Profile of ${currentCompany.getcName()}</title>
</head>
<body>
<div class="container">
    <h1>Edit Company</h1>
    <hr>
    <div class="row">

        <!-- edit form column -->
        <div class="col-md-9 personal-info">
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a>
                <i class="fa fa-coffee"></i>
                Welcome ${currentCompany.getcName()}. Here you can edit any information you need to on your profile.
            </div>
            <h3>Company info</h3>

            <form action="CompanyUpdateControl" method="POST" class="form-horizontal" role="form">
                <input name="companyid" hidden="hidden" readonly="true" type="text"
                       value=${currentCompany.getCompanyId()}>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Company Name:</label>
                    <div class="col-lg-8">
                        <input name="cName" class="form-control" type="text" value=${currentCompany.getcName()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Location:</label>
                    <div class="col-lg-8">
                        <input name="location" class="form-control" type="text" value=${currentCompany.getLocation()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Company Size:</label>
                    <div class="col-lg-8">
                        <input name="size" class="form-control" type="text"
                               value=${currentCompany.getCompanySize()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Rating:</label>
                    <div class="col-md-8">
                        <input name="rating" class="form-control" readonly="true" type="text"
                               value=${currentCompany.getRating()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Password:</label>
                    <div class="col-md-8">
                        <input name="password" class="form-control" type="password"
                               value=${currentCompany.getPassword()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Confirm password:</label>
                    <div class="col-md-8">
                        <input name="passwordcheck" class="form-control" type="password"
                               value=${currentCompany.getPassword()}>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-8">
                        <input type="submit" class="btn btn-primary" value="Save Changes">
                        <span></span>
                        <a href="companyhome.jsp" class="btn btn-danger">Cancel</a>
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