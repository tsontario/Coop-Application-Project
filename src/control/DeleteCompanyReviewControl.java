package control;

import dbbeans.CompanyReviewBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Kevin on 2017-03-29.
 */
public class DeleteCompanyReviewControl extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CompanyReviewBean.deleteReview(request.getParameter("deleteUsername"),
                Integer.parseInt(request.getParameter("deleteCompanyID")));

        response.sendRedirect("/reviews/reviewlist.jsp");
    }
}
