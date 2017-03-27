<%@ page import="dbbeans.ProgramBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<ProgramBean> programList = ProgramBean.getProgramList(); %>

<html>
    <head>
        <title>New Student Registration</title>
    </head>
    <body>
        <form action="../StudentRegisterControl" method="POST">

            <label for="fname">First Name: </label>
            <input name="fname" id="fname" type="text" />
            <br />

            <label for="lname">Last Name: </label>
            <input name="lname" id="lname" type="text" />
            <br />

            <label for="username">Username: </label>
            <input name="username" id="username" type="text" />
            <br />

            <label for="programcode">Your Program: </label>
            <select name="programcode" id="programcode">
                <% for (ProgramBean program : programList) {
                        String p = program.getProgramCode(); %>
                        <option value="<%=p%>"><%=p%></option>
                <% } %>
            </select>
            <br />

            <label for="level">Current School Level (Year): </label>
            <select name="level" id="level">
                    <option value="1" selected>1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
            </select>
            <br />

            <input type="submit">Register</input>
        </form>
    </body>
</html>