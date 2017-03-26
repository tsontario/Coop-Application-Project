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

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        String uName = request.getParameter("uname");
        String pWord = request.getParameter("pword");

        UserBean userBean = new UserBean();
        db = new DataAccess();
        db.openConnection();
        System.out.println("Is db DEFINED? ::::: " + db.getConnection());


        String email = userBean.login(uName, pWord, db);
        System.out.println("EMAIL: " + email);

        if (email != null) {
            System.out.println("SUCCESS");
        }
        else {
            System.out.println("FAILURE");
        }
    }

}
