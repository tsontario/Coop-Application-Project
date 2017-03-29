package control;

import dbbeans.JobBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by willieausrotas on 2017-03-29.
 */
public class DeleteJobControl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JobBean job = new JobBean();
        job.setJobId(Integer.parseInt(req.getParameter("jobid")));
        JobBean.deleteJob(job.getJobId());
        resp.sendRedirect("/company/companyhome.jsp");
    }
}
