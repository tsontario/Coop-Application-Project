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
 * Created by willieausrotas on 2017-03-27.
 */
public class UpdateControl extends HttpServlet {

    private DataAccess db;
    private HttpSession session;

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String fName = req.getParameter("firstName");
        String lName = req.getParameter("lastName");


        String password = req.getParameter("password");
        String passwordCheck = req.getParameter("passwordcheck");

        // Check for valid fields
        if (fName == null || fName.trim().length() < 1) {
            fail(resp, req, "First name can't be empty");
            return;
        }
        if (lName == null || lName.trim().length() < 1) {
            fail(resp, req, "Last name can't be empty");
            return;
        }
        if (!(password.equals(passwordCheck))) {
            fail(resp, req, "Passwords don't match!");
            return;
        }

        UserBean userBean = new UserBean();
        userBean.setEmail(req.getParameter("email"));
        userBean.setfName(req.getParameter("firstName"));
        userBean.setlName(req.getParameter("lastName"));
        userBean.setPassword(req.getParameter("password"));
        userBean.setProgramCode(req.getParameter("programCode"));
        userBean.setUsername(req.getParameter("username"));


        db = new DataAccess();
        db.openConnection();
        userBean = UserDAO.updateUser(userBean);


        if (userBean != null) {
            session = req.getSession(true);
            session.setAttribute("currentUser", userBean);
            resp.sendRedirect("/student/studenthome.jsp");
        }
    }

    private void fail(HttpServletResponse resp, HttpServletRequest req, String msg) throws IOException {
        session = req.getSession(true);
        session.setAttribute("error", msg);
        resp.sendRedirect("../session/registererror.jsp");
    }
}
