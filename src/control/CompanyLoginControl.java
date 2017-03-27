package control;

import dbbeans.CompanyBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class CompanyLoginControl extends HttpServlet {

    private HttpSession session;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CompanyBean companyBean = new CompanyBean();
        companyBean.setcName(request.getParameter("cname"));
        companyBean.setPassword(request.getParameter("cpassword"));

        companyBean = companyBean.login(companyBean);

        if (companyBean != null) {
            session = request.getSession(true);
            session.setAttribute("currentCompany", companyBean);
            response.sendRedirect("company/companyhome.jsp");
        }
        else {
            response.sendRedirect("session/loginfail.jsp");
        }
    }
}
