<%@ page import="dbbeans.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dbbeans.CompanyBean" %>
<%@ page import="dbbeans.JobBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Admin action parameters (default = null)
    String userAction = request.getParameter("useraction");
    String companyAction = request.getParameter("companyaction");

    String action = request.getParameter("action");
    String id = request.getParameter("id");

    if (userAction != null && userAction.equals("true")) {
        UserBean.executeAction(action, id);
    }
    if (companyAction != null && companyAction.equals("true")) {
        CompanyBean.executeAction(action, Integer.parseInt(id));
    }


    UserBean admin = (UserBean) request.getSession().getAttribute("currentUser");
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    ArrayList<UserBean> allUsers = UserBean.getAllUsers();
    ArrayList<CompanyBean> allCompanies = CompanyBean.getAllCompanies();
    // TODO all companies
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

    <div class="container">
        <h2>Users</h2>
        <hr class="w-100">
        <table>
            <tr>
                <th>Username</th>
                <th>Email</th>
                <th>Name</th>
                <th>Level</th>
                <th>Program</th>
                <th>Admin</th>
                <th>Moderator</th>
                <th></th>
                <th>Action</th>
            </tr>
        <% for (UserBean u : allUsers) {%>
            <tr>
                <td><%= u.getUsername() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getfName() + " " + u.getlName() %></td>
                <td><%= u.getLevel()%></td>
                <td><%= u.getProgramCode() %></td>
                <td><%= UserBean.isAdmin(u.getUsername()) ?
                        "<a href=\"admin.jsp?useraction=true&action=removeadmin&id=" +
                                u.getUsername() + "\"><button>Revoke Admin Privilege</button></a>"
                        :
                        "<a href=\"admin.jsp?useraction=true&action=makeadmin&id=" +
                        u.getUsername() + "\"><button>Make Admin</button></a>" %>
                </td>
                <td><%= UserBean.isModerator(u.getUsername()) ?
                        "<a href=\"admin.jsp?useraction=true&action=removemoderator&id=" +
                                u.getUsername() + "\"><button>Revoke Mod Privilege</button></a>"
                        :
                        "<a href=\"admin.jsp?useraction=true&action=makemoderator&id=" +
                        u.getUsername() + "\"><button>Make Moderator</button></a>" %></td>
                <td style="width: 20px"></td>
                <td><a href=admin.jsp?useraction=true&action=delete&id=<%= u.getUsername() %>>
                    <button>Delete User</button></a>
                </td>
            </tr>
        <% } %>
        </table>

        <hr />

        <h2>Companies</h2>
        <hr class="w-100">
        <table>
            <tr>
                <th>Company Name</th>
                <th>Company Location</th>
                <th>Rating</th>
                <th>Company ID</th>
                <th># of Employees</th>
                <th>Jobs Posted</th>
                <th>Jobs Pending Approval</th>
                <th>Action</th>
            </tr>
            <% for (CompanyBean c : allCompanies) {%>
            <tr>
                <td><%= c.getcName() %></td>
                <td><%= c.getLocation() %></td>
                <td><%= c.getRating() %></td>
                <td><%= c.getCompanyId() %></td>
                <td><%= c.getCompanySize() %></td>
                <td><%= (JobBean.getJobsByCompany(c.getCompanyId())).size()%></td>
                <td><%= (JobBean.getPendingJobsByCompany(c.getCompanyId())).size()%></td>
                <td><a href=admin.jsp?companyaction=true&action=delete&id=<%= c.getCompanyId() %>>
                    <button>Delete User</button></a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>

    <hr>
    </body>
</html>