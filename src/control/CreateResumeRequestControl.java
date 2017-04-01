package control;

import DAO.ResumeDAO;
import DAO.ResumeReviewRequestDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Kevin on 2017-04-01.
 */
public class CreateResumeRequestControl extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        int versionno = Integer.parseInt(request.getParameter("versionno"));
        int resumeid = Integer.parseInt(request.getParameter("resumeid"));

        ResumeReviewRequestDAO.createNewResumeRequest(username,resumeid,versionno);
        response.sendRedirect("../resume/resume.jsp?versionno=" + versionno);
    }
}
