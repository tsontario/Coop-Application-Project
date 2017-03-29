package control;

import connection.DataAccess;
import dbbeans.AppliedToBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Kevin on 2017-03-28.
 */
public class ApplyToJobControl  extends HttpServlet {
    private DataAccess db;
    private HttpSession session;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        AppliedToBean.applyTo(request.getParameter("userIDInput"),request.getParameter("jobIDInput"));

        response.sendRedirect("jobs/jobpost.jsp?jobid=" + request.getParameter("jobIDInput"));

    }
}
