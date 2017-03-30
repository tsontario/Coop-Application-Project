package control;

import dbbeans.ResumeBean;
import dbbeans.ResumeReviewBean;
import dbbeans.ResumeReviewRequestBean;
import dbbeans.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by timothysmith on 2017-03-28.
 */
public class ResumeReviewSubmissionControl extends HttpServlet {

    private HttpSession session;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        session = request.getSession(true);
        UserBean moderator = (UserBean) session.getAttribute("moderator");
        ResumeBean resumeBean = (ResumeBean) session.getAttribute("resume");
        ResumeReviewBean resumeReviewBean = new ResumeReviewBean();


        resumeReviewBean.setModerator(moderator);
        resumeReviewBean.setComments(request.getParameter("comments"));
        resumeReviewBean.setResumeId(resumeBean.getResumeId());
        resumeReviewBean.setResumeVersion(resumeBean.getVersionNo());

        // INSERT into DB
        resumeReviewBean = resumeReviewBean.insertReviewToDb();
        // Now DELETE from review_request table
        int resumeId = resumeBean.getResumeId();
        int resumeVersion = resumeBean.getVersionNo();
        ResumeReviewRequestBean.deleteById(resumeId, resumeVersion);

        session.setAttribute("resumereview", resumeReviewBean);
        response.sendRedirect("../mod.jsp");

    }
}
