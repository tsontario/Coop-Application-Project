package control;

import DAO.ProgramDAO;
import connection.DataAccess;
import dbbeans.JobBean;
import dbbeans.ProgramBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by willieausrotas on 2017-03-29.
 */
public class CompanyAddJobControl extends HttpServlet {
    private DataAccess db;
    private HttpSession session;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jobName = req.getParameter("jobName");
        int jobLevel = Integer.parseInt(req.getParameter("jobLevel"));
        int positions = Integer.parseInt(req.getParameter("positions"));
        double rateOfPay = Double.parseDouble(req.getParameter("rateOfPay"));
        String daysOpen = req.getParameter("daysOpen");
        String companyId = req.getParameter("companyid");
        String location = req.getParameter("location");
        String description = req.getParameter("description").replaceAll("'", "''");
        String companyName = req.getParameter("companyname");
        String[] programCodes = req.getParameterValues("programCodes");

        if (jobName == null || jobName.trim().length() < 1) {
            fail(resp, req, "Job title cant be null");
            return;
        }
        if (jobLevel < 1 || jobLevel > 4) {
            fail(resp, req, "Job level must be between 1 and 4.");
            return;
        }
        if (positions < 1) {
            fail(resp, req, "Positions cant be less then 1");
            return;
        }
        if (rateOfPay < 1) {
            fail(resp, req, "Rate of pay cant be less then 1");
            return;
        }
        if (Integer.parseInt(daysOpen) < 1) {
            fail(resp, req, "Days open must be at least 1.");
            return;
        }
        if (description == null || description.trim().length() < 1) {
            fail(resp, req, "Description cant be null");
            return;
        }
        if (location == null || location.trim().length() < 1) {
            fail(resp, req, "Location cant be empty.");
        }
        if (programCodes == null || programCodes.length == 0) {
            fail(resp, req, "Must select at least one program");
        }

        JobBean jobBean = new JobBean();
        jobBean.setCompanyId(companyId);
        jobBean.setClosingDate(daysOpen);
        jobBean.setDescription(description);
        jobBean.setJobLevel(jobLevel);
        jobBean.setJobName(jobName);
        jobBean.setNumPositions(positions);
        jobBean.setRateOfPay(rateOfPay);

        int id = jobBean.jobAdd(jobBean);

        ProgramBean.addToOffered(programCodes, id);

        resp.sendRedirect("../company/companyhome.jsp");

    }

    private void fail(HttpServletResponse resp, HttpServletRequest req, String msg) throws IOException {
        session = req.getSession(true);
        session.setAttribute("error", msg);
        resp.sendRedirect("../session/registererror.jsp");
    }
}
