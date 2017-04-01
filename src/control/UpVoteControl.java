package control;

import DAO.CompanyReviewDAO;
import dbbeans.AppliedToBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Kevin on 2017-04-01.
 */
public class UpVoteControl extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isUpvoting = Boolean.parseBoolean(request.getParameter("isUpvoting"));
        String username = request.getParameter("username");
        int reviewid = Integer.parseInt(request.getParameter("reviewid"));
        if(isUpvoting){
            CompanyReviewDAO.upvoteReview(username,reviewid);
        } else {
            CompanyReviewDAO.deleteUpvoteReview(username,reviewid);
        }

        response.sendRedirect("reviews/viewcompanyreview.jsp?companyid=" + request.getParameter("companyid"));
    }
}
