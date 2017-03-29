package control;

import dbbeans.AppliedToBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Kevin on 2017-03-28.
 */
public class UnApplyToJobControl  extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AppliedToBean.unApplyToJob(request.getParameter("userIDInput2"), Integer.parseInt(request.getParameter("jobIDInput2")));

        response.sendRedirect("jobs/jobpost.jsp?jobid=" + request.getParameter("jobIDInput2"));
    }
}
