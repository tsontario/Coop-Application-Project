package control;

import com.sun.deploy.net.HttpRequest;
import connection.DataAccess;
import dbbeans.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.DriverManager;

/**
 * Created by timothysmith on 2017-03-26.
 */
public class LoginControl extends HttpServlet {

    private DataAccess db;
    private HttpSession session;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserBean userBean = new UserBean();
        userBean.setUsername(request.getParameter("uname"));
        userBean.setPassword(request.getParameter("pword"));

        db = new DataAccess();
        db.openConnection();

        userBean = userBean.login(userBean);

        if (userBean != null) {
            session = request.getSession(true);
            session.setAttribute("currentUser", userBean);
            response.sendRedirect("student/studenthome.jsp");
        }
        else {
            response.sendRedirect("session/loginfail.jsp");
        }
    }

}
