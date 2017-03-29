<%@ page import="DAO.ResumeDAO" %>
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
    String username = request.getParameter("username");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    int level = Integer.parseInt(request.getParameter("level"));
    String programCode = request.getParameter("programCode");
    String email = request.getParameter("email");
    ResumeBean resume = ResumeDAO.getResumeByUsername(username);
    UserBean user = new UserBean();
    user.setfName(fname);
    user.setlName(lname);
    user.setLevel(level);
    user.setProgramCode(programCode);
    user.setEmail(email);

%>
<html>
<head>
    <title>Review of <%=resume.getUsername()%>'s Resume</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- HEADER CODE - DO NOT REMOVE -->
<header class="header-basic">

    <div class="header-limiter">

        <h1><a href="#">COOP<span>Database</span></a></h1>

        <nav>
            <a href="../company/companyhome.jsp">Home</a>
            <a href="../company/companyprofile.jsp">Profile</a>
            <a href="../company/companyaddjob.jsp">Add Job</a>
            <a href="../session/goodbye.jsp">Logout</a>
        </nav>
    </div>

</header>
<!-- HEADER CODE - DO NOT REMOVE -->
<div class="container">
    <div><h1>Review <%= resume.getUsername() %>'s Resume</h1></div>

    <div class="row">

        <div class="col-md-9 personal-info">
            <hr class="w-100"/>
            <form id="form" class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="author" class="col-lg-3 control-label">Author:</label>
                    <div class="col-lg-8">
                        <input class="form-control" id="author" type="text"
                               value="<%= user.getfName() + " " + user.getlName() %>" disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="version" class="col-lg-3 control-label">Current Resume Version:</label>
                    <div class="col-lg-8">
                        <input class="form-control" id="version" type="text" value="<%= resume.getVersionNo() %>"
                               disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="content" class="col-lg-3 control-label">Resume:</label>
                    <div class="col-lg-8">
                            <textarea form="form" class="form-control" id="content" rows="10" disabled>
                                <%= resume.getResume() %>
                            </textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
    document.getElementById("content").style.height = document.getElementById("content").scrollHeight + 'px';

</script>
</html>
