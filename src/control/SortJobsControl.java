package control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Kevin on 2017-03-31.
 */
public class SortJobsControl extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String ordering = request.getParameter("ordering");
        String sortby = request.getParameter("sortby");
        response.sendRedirect("jobs/searchjobs.jsp?ordering=" + ordering + "&" + "sortby=" + sortby);

    }
}
