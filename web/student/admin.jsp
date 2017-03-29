<%@ page import="dbbeans.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% UserBean admin = (UserBean) request.getSession().getAttribute("currentUser");
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("sessionended.jsp");
    } %>
<html>
    <head>
        <title>Admin Page: ${currentUser}</title>
        <link rel="stylesheet" href="../css/header.css">
        <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
    </head>
    <body>
    <!-- HEADER CODE - DO NOT REMOVE -->
    <header class="header-basic">

        <div class="header-limiter">

            <h1><a href="#">COOP<span>Database</span></a></h1>

            <nav>
                <a href="../student/studenthome.jsp">Home</a>
                <a href="../student/profile.jsp">Profile</a>
                <a href="#">Resume</a>
                <a href="../jobs/searchjobs.jsp">Jobs</a>
                <a href="../reviews/reviewlist.jsp">Write Review</a>
                <% if (user != null) {
                    if (user.isAdmin(user.getUsername())) { %>
                <a href="admin.jsp" class="selected">Admin Panel</a>
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
    </body>
</html>