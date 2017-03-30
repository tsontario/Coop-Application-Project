package DAO;

import connection.DataAccess;
import dbbeans.ResumeBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by timothysmith on 2017-03-28.
 */
public class ResumeDAO {

    static private Connection connection;
    static private Statement st;
    static private ResultSet rs;

    public static ResumeBean getResumeById(int id) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        ResumeBean resumeBean = new ResumeBean();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT resumeid, username, resume, MAX(versionno) AS versionno FROM \"Proj\".resume " +
                    "WHERE resumeid = " + id +
                    "GROUP BY resumeid, username, resume ORDER BY versionno DESC");
            if (rs.next()) {
                resumeBean.setResumeId(rs.getInt("resumeid"));
                resumeBean.setVersionNo(rs.getInt("versionno"));
                resumeBean.setUsername(rs.getString("username"));
                resumeBean.setResume(rs.getString("resume"));

            }
            else {
                rs.close();
                st.close();
                connection.close();
                // Couldn't find resume
                return null;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();}

        return resumeBean;
    }

    public static ResumeBean getResumeByUsername(String username) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        ResumeBean resumeBean = new ResumeBean();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT resumeid, username, resume, MAX(versionno) AS versionno FROM \"Proj\".resume " +
                    "WHERE username = '" + username +
                    "' GROUP BY resumeid, username, resume ORDER BY versionno DESC;");
            if (rs.next()) {
                resumeBean.setResumeId(rs.getInt("resumeid"));
                resumeBean.setVersionNo(rs.getInt("versionno"));
                resumeBean.setUsername(rs.getString("username"));
                resumeBean.setResume(rs.getString("resume"));

            } else {
                rs.close();
                st.close();
                connection.close();
                // Couldn't find resume
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resumeBean;
    }
}
