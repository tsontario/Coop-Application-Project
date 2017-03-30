package control;

import connection.DataAccess;
import dbbeans.AppliedToBean;
import dbbeans.CompanyReviewBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Kevin on 2017-03-29.
 */
public class CreateCompanyReviewControl  extends HttpServlet {
    private DataAccess db;
    private HttpSession session;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if( !Boolean.parseBoolean(request.getParameter("reviewExist"))){
            CompanyReviewBean.createCompanyReview(request.getParameter("username"),
                    Integer.parseInt(request.getParameter("companyid")),
                    request.getParameter("interviewExperience"), request.getParameter("onTheJobExperience"),
                    request.getParameter("salaryExperience") , Integer.parseInt(request.getParameter("companyRating")));
        } else {
            CompanyReviewBean.updateCompanyReview(request.getParameter("username"),
                    Integer.parseInt(request.getParameter("companyid")),
                    request.getParameter("interviewExperience"), request.getParameter("onTheJobExperience"),
                    request.getParameter("salaryExperience") , Integer.parseInt(request.getParameter("companyRating")));
        }


        response.sendRedirect("/reviews/reviewlist.jsp");
    }
}
