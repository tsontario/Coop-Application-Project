package control;

import connection.DataAccess;
import dbbeans.CompanyBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by willieausrotas on 2017-03-28.
 */
public class CompanyRegisterControl extends HttpServlet {

    private DataAccess db;
    private HttpSession session;


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CompanyBean companyBean = new CompanyBean();

        String username = req.getParameter("cname");
        int companySize = Integer.parseInt(req.getParameter("csize"));
        String location = req.getParameter("location");
        String password = req.getParameter("password");
        String passwordCheck = req.getParameter("passwordcheck");

        //Check for valid fields
        if (username == null || username.trim().length() < 1) {
            fail(resp, req, "First name can't be empty.");
            return;
        }
        if (companySize < 1) {
            fail(resp, req, "Company size can't be less than 1.");
            return;
        }
        if (location == null || location.trim().length() < 1) {
            fail(resp, req, "Location can't be empty.");
            return;
        }
        if (!(password.equals(passwordCheck))) {
            fail(resp, req, "Passwords do not match!");
            return;
        }
        if (!(CompanyBean.isUnique(username))) {
            fail(resp, req, "Company name already taken.");
            return;
        }

        companyBean.setcName(username);
        companyBean.setCompanySize(companySize);
        companyBean.setLocation(location);
        companyBean.setPassword(password);
        companyBean.setRating(-1);

        companyBean.insertIntoDB();

        session = req.getSession(true);
        session.setAttribute("currentCompany", companyBean);
        resp.sendRedirect("company/companyhome.jsp");

    }

    private void fail(HttpServletResponse resp, HttpServletRequest req, String msg) throws IOException {
        session = req.getSession(true);
        session.setAttribute("Error", msg);
        resp.sendRedirect("session/registererror.jsp");
    }
}
