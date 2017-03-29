package control;

import DAO.UserDAO;
import connection.DataAccess;
import dbbeans.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class StudentRegisterControl extends HttpServlet {

    private HttpSession session;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserBean userBean = new UserBean();

        String email = request.getParameter("email");
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String username = request.getParameter("username");
        String programCode = request.getParameter("programcode");
        int level = Integer.parseInt(request.getParameter("level"));

        String password = request.getParameter("password");
        String passwordCheck = request.getParameter("passwordcheck");

        // Check for valid fields
        if (fName == null || fName.trim().length() < 1) {
            fail(response, request, "First name can't be empty");
            return;
        }
        if (lName == null || lName.trim().length() < 1) {
            fail(response, request, "Last name can't be empty");
            return;
        }
        if (username == null || username.length() < 5) {
            fail(response, request, "Username must be 4 characters or more");
            return;
        }
        if (email == null || email.trim().equals("")) {
            fail(response, request, "You need to enter an email");
        }

        if(!(UserBean.isUnique(username))) {
            fail(response, request, "Username already taken!");
            return;
        }

        if (!(UserDAO.isUniqueEmail(email))) {
            fail(response, request, "Email already taken.");
            return;
        }

        if (!(password.equals(passwordCheck))) {
            fail(response, request, "Passwords don't match!");
            return;
        }

        userBean.setEmail(email);
        userBean.setUsername(username);
        userBean.setfName(fName);
        userBean.setlName(lName);
        userBean.setProgramCode(programCode);
        userBean.setLevel(level);
        userBean.setPassword(password);

        userBean.insertIntoDB();

        session = request.getSession(true);
        session.setAttribute("currentUser", userBean);
        response.sendRedirect("student/studenthome.jsp");

    }

    private void fail(HttpServletResponse response, HttpServletRequest request, String msg) throws IOException {
            session = request.getSession(true);
            session.setAttribute("error", msg);
            response.sendRedirect("session/registererror.jsp");
    }
}
