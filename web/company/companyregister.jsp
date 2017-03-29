<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/indexCSS.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <title>New Company Registration</title>
</head>
<body>

<div class="login-page">
    <div class="form">
        <form class="login-form" action="/CompanyRegisterControl" method="POST">
            <input type="text" name="cname" placeholder="Username" required/>
            <input type="text" name="csize" placeholder="Company Size" required/>
            <input type="text" name="location" placeholder="Location" required/>
            <input type="password" name="password" placeholder="Password" required/>
            <input type="password" name="passwordcheck" placeholder="Password" required>
            <button type="submit">register</button>
            <p class="message">Already Registered? <a href="../indexCompany.jsp">Login here</a></p>
            <p class="message">Student? <a href="../index.jsp">Login here</a> or <a
                    href="../student/studentregister.jsp">Register
                here</a></p>
        </form>
    </div>
</div>
</body>
</html>