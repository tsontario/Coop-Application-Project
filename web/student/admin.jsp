<%@ page import="dbbeans.CompanyBean" %>
<%@ page import="dbbeans.JobBean" %>
<%@ page import="dbbeans.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dbbeans.ProgramBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Admin action parameters (default = null)
    String userAction = request.getParameter("useraction");
    String companyAction = request.getParameter("companyaction");
    String pendingAction = request.getParameter("pendingaction");
    String jobAction = request.getParameter("jobaction");
    String programAction = request.getParameter("programaction");

    String action = request.getParameter("action");
    String id = request.getParameter("id");

    // On Admin update (delete, reject, etc)
    if (userAction != null && userAction.equals("true")) {
        UserBean.executeAction(action, id);
    }
    if (companyAction != null && companyAction.equals("true")) {
        CompanyBean.executeAction(action, Integer.parseInt(id));
    }
    if (pendingAction != null && pendingAction.equals("true")) {
        if (action.equals("approve")) {
            JobBean.executeAction(action, Integer.parseInt(id));
        } else if (action.equals("reject")) {
            JobBean.executeAction(action, Integer.parseInt(id));
        }
    }
    if (jobAction != null && jobAction.equals("true")) {
        JobBean.executeAction(action, Integer.parseInt(id));
    }
    if (programAction != null && programAction.equals("true")) {
        if (action.equals("delete")) {
            ProgramBean.executeAction(action, id);
        }
    }


    UserBean admin = (UserBean) request.getSession().getAttribute("currentUser");
    UserBean user = (UserBean) request.getSession().getAttribute("currentUser");
    ArrayList<UserBean> allUsers = UserBean.getAllUsers();
    ArrayList<CompanyBean> allCompanies = CompanyBean.getAllCompanies();
    ArrayList<JobBean> pendingJobs = JobBean.getAllPendingJobs();
    ArrayList<JobBean> approvedJobs = JobBean.getAllApprovedJobs();
    ArrayList<ProgramBean> programList = ProgramBean.getProgramList();
    if (user == null) {
        response.sendRedirect("sessionended.jsp");
    }
    int numPendingJobs = JobBean.getNumNewPendingJobs(user.getUsername());

%>


<html>
<head>
    <title>Admin Page: ${currentUser}</title>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/adminPage.css">
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


<% if (numPendingJobs != 0) { %>
<div class="row" style="padding-top: 20px">
    <div class="alert alert-success alert-dismissable " style="text-align: center;margin-left: 20em">
        <a class="panel-close close" data-dismiss="alert"></a>
        <i class="fa fa-coffee"></i>
        Looks like there are <%= numPendingJobs %> new jobs to be approved!
        <a href="#pendingjobs">Click here to see them!</a>
    </div>
</div>
<% } %>

<div class="container">
    <div class="col-lg-12">

        <h2>Users</h2>
        <hr class="w-100">

        <table class="table-fill">
            <thead>
            <tr>
                <th class="text-center">Username</th>
                <th class="text-center">Email</th>
                <th class="text-center">Name</th>
                <th class="text-center">Level</th>
                <th class="text-center">Program</th>
                <th class="text-center">Admin Privileges</th>
                <th class="text-center">Moderator Privileges</th>
                <th class="text-center">Remove User</th>
            </tr>
            </thead>
            <tbody class="table-hover">
            <% for (UserBean u : allUsers) {%>
            <tr>
                <td><%= u.getUsername() %>
                </td>
                <td><%= u.getEmail() %>
                </td>
                <td><%= u.getfName() + " " + u.getlName() %>
                </td>
                <td><%= u.getLevel()%>
                </td>
                <td><%= u.getProgramCode() %>
                </td>
                <td><%= UserBean.isAdmin(u.getUsername()) ?
                        "<a href=\"admin.jsp?useraction=true&action=removeadmin&id=" +
                                u.getUsername() + "\"><button class=\"btn btn-danger\">Revoke Admin</button></a>"
                        :
                        "<a href=\"admin.jsp?useraction=true&action=makeadmin&id=" +
                                u.getUsername() + "\"><button class=\"btn btn-primary\">Grant Admin</button></a>" %>
                </td>
                <td><%= UserBean.isModerator(u.getUsername()) ?
                        "<a href=\"admin.jsp?useraction=true&action=removemoderator&id=" +
                                u.getUsername() + "\"><button class=\"btn btn-danger\">Revoke Moderator</button></a>"
                        :
                        "<a href=\"admin.jsp?useraction=true&action=makemoderator&id=" +
                                u.getUsername() + "\"><button class=\"btn btn-primary\">Grant Moderator</button></a>" %>
                </td>
                <td><a href=admin.jsp?useraction=true&action=delete&id=<%= u.getUsername() %>>
                    <button class="btn btn-danger">Delete User</button>
                </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>

        <hr/>

        <h2>Companies</h2>
        <hr class="w-100">
        <table class="table-fill" class="w-100">
            <thead>
            <tr>
                <th class="text-center">Company Name</th>
                <th class="text-center">Company Location</th>
                <th class="text-center">Rating</th>
                <th class="text-center">Company ID</th>
                <th class="text-center"># of Employees</th>
                <th class="text-center">Jobs Posted</th>
                <th class="text-center">Jobs Pending Approval</th>
                <th class="text-center">Remove Company</th>
            </tr>
            </thead>
            <tbody class="table-hover">
            <% for (CompanyBean c : allCompanies) {%>
            <tr>
                <td><%= c.getcName() %>
                </td>
                <td><%= c.getLocation() %>
                </td>
                <td><%= c.getRating() %>
                </td>
                <td><%= c.getCompanyId() %>
                </td>
                <td><%= c.getCompanySize() %>
                </td>
                <td><%= (JobBean.getJobsByCompany(c.getCompanyId())).size()%>
                </td>
                <td><%= (JobBean.getPendingJobsByCompany(c.getCompanyId())).size()%>
                </td>
                <td><a href=admin.jsp?companyaction=true&action=delete&id=<%= c.getCompanyId() %>>
                    <button class="btn btn-danger">Delete Company</button>
                </a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
        <hr/>

        <h2 id="pendingjobs">Pending Jobs</h2>
        <hr class="w-100">
        <table class="w-100">
            <tr>
                <th class="text-center">Job Title</th>
                <th class="text-center">Company</th>
                <th class="text-center">Salary</th>
                <th class="text-center">Description</th>
                <th class="text-center"># of Positions</th>
                <th class="text-center">Posting Date</th>
                <th class="text-center">Closing Date</th>
                <th class="text-center">Approve</th>
                <th class="text-center">Reject</th>
            </tr>
            <% for (JobBean j : pendingJobs) {%>
            <tr>
                <td><%= j.getJobName() %>
                </td>
                <td>
                    <%= j.getCName() %>
                </td>
                <td><%= j.getRateOfPay() %>
                </td>
                <td>
                    <button class="desc-toggle btn btn-info" type="button" data-toggle="modal" data-target="#myModal"
                            data-id="<%= j.getDescription() %>">
                        Description
                    </button>
                </td>
                <td><%= j.getNumPositions() %>
                </td>
                <td><%= j.getPostingDate() %>
                </td>
                <td><%=j.getClosingDate() %>
                </td>
                <td>
                    <a href="admin.jsp?pendingaction=true&action=approve&id=<%=j.getJobId()%>">
                        <button class="btn btn-success">Approve</button>
                    </a>
                </td>
                <td>
                    <a href="admin.jsp?pendingaction=true&action=reject&id=<%=j.getJobId()%>">
                        <button class="btn btn-danger">Reject</button>
                    </a>
                </td>
            </tr>
            <% } %>
        </table>

        <hr/>

        <hr class="wr-100"/>
        <h4>Approved Jobs</h4>
        <table class="w-100">
            <tr>
                <th class="text-center">Job Title</th>
                <th class="text-center">Company</th>
                <th class="text-center">Salary</th>
                <th class="text-center">Description</th>
                <th class="text-center"># of Positions</th>
                <th class="text-center">Posting Date</th>
                <th class="text-center">Closing Date</th>
                <th class="text-center">Delete</th>
            </tr>
            <% for (JobBean j : approvedJobs) {%>
            <tr>
                <td><%= j.getJobName() %>
                </td>
                <td>
                    <%= j.getCName() %>
                </td>
                <td><%= j.getRateOfPay() %>
                </td>
                <td>
                    <button class="desc-toggle btn btn-info" type="button" data-toggle="modal" data-target="#myModal"
                            data-id="<%= j.getDescription() %>">
                        Description
                    </button>
                </td>
                <td><%= j.getNumPositions() %>
                </td>
                <td><%= j.getPostingDate() %>
                </td>
                <td><%=j.getClosingDate() %>
                </td>
                <td>
                    <a href="admin.jsp?jobaction=true&action=delete&id=<%=j.getJobId()%>">
                        <button class="btn btn-danger">Delete</button>
                    </a>
                </td>

            </tr>
            <% } %>
        </table>

        <hr/>
        <hr class="wr-100"/>

        <h4>Active Programs</h4>
        <h5>Note: A program can only be deleted if no users are currently registered in it</h5>
        <table class="w-100">
            <tr>
                <th class="text-center">Program Name</th>
                <th class="text-center">Program Code</th>
                <th class="text-center">Action</th>
            </tr>
            <% for (ProgramBean p : programList) {%>
            <tr>
                <td><%= p.getProgramName() %>
                </td>
                <td>
                    <%= p.getProgramCode() %>
                </td>
                <td>
                    <a href="admin.jsp?programaction=true&action=delete&id=<%=p.getProgramCode()%>">
                        <button class="btn btn-danger">Delete</button>
                    </a>
                </td>

            </tr>
            <% } %>
        </table>
        <a href="../program/addprogram.jsp">
            <button type="submit" class="btn btn-info">Add New Program</button>
        </a>
    </div>
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