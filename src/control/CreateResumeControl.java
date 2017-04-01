package control;

import DAO.ResumeDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Kevin on 2017-04-01.
 */
public class CreateResumeControl extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String resume = request.getParameter("resume");
        resume = resume.replace("'", "''");

        ResumeDAO.createNewResume(username,resume);
        int latestversion = ResumeDAO.getLastestVersionNumber(username);

        response.sendRedirect("../resume/resume.jsp?versionno=" + latestversion);

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("../resume/resume.jsp?versionno=" + request.getParameter("versionRedirect"));

    }
}
