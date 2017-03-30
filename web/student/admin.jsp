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
    ArrayList<JobBean> pendingJobs = JobBean.getAllPendingJobs();
    // TODO all companies
    if (user == null) {
        response.sendRedirect("sessionended.jsp");
    } %>
<html>
    <head>
        <title>Admin Page: ${currentUser}</title>
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-3.2.0.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <style>
            td {
                text-align: center;
            }
            th, td {
                border-left: 1px solid black;
            }
        </style>
    </head>
    <body>
    <!-- HEADER CODE - DO NOT REMOVE -->
    <header class="header-basic">

        <div class="header-limiter">

            <h1><a href="../student/studenthome.jsp">COOP<span>Database</span></a></h1>

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
                    <button>Delete Company</button></a>
                </td>
            </tr>
            <% } %>
        </table>
        <hr />

        <h2>Pending Jobs</h2>
        <hr class="w-100">
        <table>
            <tr>
                <th>Job Title</th>
                <th>Company</th>
                <th>Salary</th>
                <th>Description</th>
                <th># of Positions</th>
                <th>Posting Date</th>
                <th>Closing Date</th>
                <th>Action</th>
            </tr>
            <% for (JobBean j : pendingJobs) {%>
            <tr>
                <td><%= j.getJobName() %></td>
                <td>
                    <%= j.getCName() %>
                </td>
                <td><%= j.getRateOfPay() %></td>
                <td>
                    <button class="desc-toggle" type="button" data-toggle="modal" data-target="#myModal" data-id="<%= j.getDescription() %>">
                        Description
                    </button>
                </td>
                <td><%= j.getNumPositions() %></td>
                <td><%= j.getPostingDate() %></td>
                <td> <%=j.getClosingDate() %></td>
                <td>
                <td>
                    <a><button>Delete Company</button></a>
                </td>
            </tr>
            <% } %>
        </table>
    </div>

    <!-- Job Description Modal -->
    <!-- Modal -->
    <div id="myModal" class="modal fade-in" id="showdesc" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close desc-toggle" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Job Description</h4>
                </div>
                <div class="modal-body">
                    <p></p>
                    <textarea name="jobDesc" id="jobDesc" value="" disabled style="width: 90%; margin: 0 auto;"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <hr>
    </body>
<script>
    $(document).on("click", ".desc-toggle", function () {
        var thisjobDesc = $(this).data('id');
        $(".modal-body #jobDesc").val(thisjobDesc);
        $('#showdesc').modal('show');
    });
</script>
</html>