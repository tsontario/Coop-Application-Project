package control;

import DAO.ProgramDAO;
import dbbeans.ProgramBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by timothysmith on 2017-03-30.
 */
public class AddProgramControl extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


//        HttpSession session = request.getSession();

        String programName = request.getParameter("programName");
        String programCode = request.getParameter("programCode");

        ProgramBean programBean = new ProgramBean();
        programBean.setProgramName(programName);
        programBean.setProgramCode(programCode);

        ProgramBean.addProgramToDb(programBean);

        response.sendRedirect("../student/admin.jsp");

    }

}
