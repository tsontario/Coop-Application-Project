<%@ page import="dbbeans.ProgramBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<ProgramBean> programList = ProgramBean.getProgramList(); %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/indexCSS.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <title>New Student Registration</title>
    </head>
    <body>

    <div class="login-page">
        <div class="form">
            <form class="login-form" action="../StudentRegisterControl" method="POST">
                <input type="text" name="fname" placeholder="First Name"/>
                <input type="text" name="lname" placeholder="Last Name"/>
                <input type="text" name="username" placeholder="Username"/>
                <input type="text" name="email" placeholder="Email"/>
                <div class="form-group">
                    <select name="programcode" class="form-control">
                        <% for (ProgramBean program : programList) {
                            String p = program.getProgramCode(); %>
                        <option value="<%=p%>"><%=p%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <select name="level" class="form-control">
                        <option value="1" selected>Year 1</option>
                        <option value="2">Year 2</option>
                        <option value="3">Year 3</option>
                        <option value="4">Year 4</option>
                    </select>
                </div>
                <input type="password" name="password" placeholder="Password"/>
                <input type="password" name="passwordcheck" placeholder="Password">
                <button type="submit">register</button>
                <p class="message">Already Registered? <a href="#">Login here</a></p>
                <p class="message">Company? <a href="#">Login here</a> or <a href="#">Register here</a></p>
            </form>
        </div>
    </div>
    </body>
</html>