<%@ page import="dbbeans.CompanyBean" %>
<%--
  Created by IntelliJ IDEA.
  User: willieausrotas
  Date: 2017-03-29
  Time: 1:35 AM
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
    <link rel="stylesheet" href="../css/header.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    <title>Profile of ${currentCompany.getcName()}</title>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="companyhome.jsp">Home</a>
            <a href="companyprofile.jsp">Profile</a>
            <a href="companyaddjob.jsp" class="selected">Add Job</a>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->
<div class="container">
    <h1>Edit Company</h1>
    <hr>
    <div class="row">

        <!-- edit form column -->
        <div class="col-md-9 personal-info">
            <div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a>
                <i class="fa fa-coffee"></i>
                Welcome ${currentCompany.getcName()}. Here you can add jobs to be posted. They will be posted once
                approved by an admin.
            </div>
            <h3>Job info</h3>

            <form action="CompanyAddJobControl" method="POST" class="form-horizontal" role="form">
                <input name="companyid" hidden="hidden" readonly type="text"
                       value=${currentCompany.getCompanyId()}>
                <input name="companyname" hidden="hidden" readonly="true" type="text"
                       value="${currentCompany.getcName()}">
                <div class="form-group">
                    <label class="col-lg-3 control-label">Job Name:</label>
                    <div class="col-lg-8">
                        <input name="jobName" class="form-control" type="text" placeholder="Job Name" value="" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Job Level:</label>
                    <div class="col-lg-8">
                        <input name="jobLevel" class="form-control" type="number" placeholder="2" value=""required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Location:</label>
                    <div class="col-lg-8">
                        <input name="location" class="form-control" type="text" placeholder="Location" value="" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Positions:</label>
                    <div class="col-lg-8">
                        <input name="positions" class="form-control" type="number" placeholder="3"
                               value="" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Rate of Pay:</label>
                    <div class="col-md-8">
                        <input name="rateOfPay" class="form-control" type="text" placeholder="15.5"
                               value="" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Days to be open:</label>
                    <div class="col-md-8">
                        <input name="daysOpen" class="form-control" type="number" placeholder="10"
                               value="" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label">Description</label>
                    <div class="col-md-8">
                        <textarea name="description" class="form-control" rows="10" required></textarea>
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