package control;

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

    private DataAccess db;
    private HttpSession session;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserBean userBean = new UserBean();

        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String username = request.getParameter("username");
        String programCode = request.getParameter("programcode");
        System.out.println("Value of level: " + request.getParameter("level"));
        System.out.println("Value of pcode: " + programCode);

        // Check for valid fields
        if (fName == null || fName.trim().length() < 5) {
            fail(response);
            return;
        }
        if (lName == null || lName.trim().length() < 1) {
            fail(response);
            return;
        }
        if (username == null || username.length() < 5) {
            fail(response);
            return;
        }

    }

    private void fail(HttpServletResponse response) throws IOException {
            response.sendRedirect("register_error.jsp");
    }
}
