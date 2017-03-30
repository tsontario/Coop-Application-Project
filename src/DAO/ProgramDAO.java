package DAO;

import connection.DataAccess;
import dbbeans.ProgramBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class ProgramDAO {
    static private Connection connection;
    static private Statement st;
    static private ResultSet rs;

    public static ArrayList<ProgramBean> getProgramList() {
        ArrayList<ProgramBean> programList = new ArrayList<>();

        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".program");

            while (rs.next()) {
                ProgramBean programBean = new ProgramBean();
                programBean.setProgramName(rs.getString("programname"));
                programBean.setProgramCode(rs.getString("programcode"));

                programList.add(programBean);
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return programList;
    }

    public static void addProgramToDb(ProgramBean programBean) {
        // TODO Implement
    }

    public static void removeProgramFromDb(ProgramBean programBean) {
        // TODO Implement
    }
}
