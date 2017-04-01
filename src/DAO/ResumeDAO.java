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

            rs.close();
            st.close();
            connection.close();
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
            rs = st.executeQuery("SELECT resumeid, username, resume, MAX(versionno) AS versionno FROM \"Proj\".RESUME " +
                    "WHERE username = '" + username +
                    "' GROUP BY resumeid, username, resume ORDER BY versionno DESC;");
            if (rs.next()) {
                resumeBean.setResumeId(rs.getInt("resumeid"));
                resumeBean.setVersionNo(rs.getInt("versionno"));
                resumeBean.setUsername(rs.getString("username"));
                resumeBean.setResume(rs.getString("resume"));

            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resumeBean;
    }

    public static void createNewResume(String username, String resume){
        int resumeid = ResumeDAO.getResumeID(username);
        int versionNumber = ResumeDAO.getLastestVersionNumber(username) + 1;
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        try {
            st = connection.createStatement();
            if(resumeid == 0){
                st.executeUpdate("INSERT INTO \"Proj\".RESUME (versionno, username, resume) " +
                        "VALUES(" + versionNumber + ", '" + username + "', '" + resume + "'); ");
            } else {
                st.executeUpdate("INSERT INTO \"Proj\".RESUME (resumeid, versionno, username, resume) " +
                        "VALUES("+ resumeid + ", " + versionNumber + ", '" + username + "', '" + resume + "'); ");
            }
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static int getLastestVersionNumber(String username){
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        int lastestVersion = 0;
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT COUNT (*) FROM \"Proj\".RESUME WHERE username='" + username + "';");
            if(rs.next()){
                lastestVersion = Integer.parseInt(rs.getString(1));
            }
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return lastestVersion;

    }

    public static int getResumeID(String username){
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        int resumeid = 0;
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT resumeid FROM \"Proj\".RESUME WHERE username='" + username + "';");
            if(rs.next()){
                resumeid = Integer.parseInt(rs.getString(1));
            }
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return resumeid;

    }

    public static ResumeBean getResumeByVersionNumber(String username, int versionno){
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        ResumeBean resumeBean = new ResumeBean();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".RESUME WHERE username='" + username +
                    "' AND versionno='" + versionno + "';");
            if(rs.next()){
                resumeBean.setResume(rs.getString("resume"));
                resumeBean.setResumeId(Integer.parseInt(rs.getString("resumeid")));
                resumeBean.setUsername(rs.getString("username"));
                resumeBean.setVersionNo(versionno);
            }
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return resumeBean;
    }

    public static ResumeBean getResumeByIdAndVersion(int id, int version) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        ResumeBean resumeBean = new ResumeBean();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT resumeid, username, resume, versionno FROM \"Proj\".resume " +
                    "WHERE resumeid = " + id +
                    " AND versionno = " + version);
            if (rs.next()) {
                resumeBean.setResumeId(rs.getInt("resumeid"));
                resumeBean.setVersionNo(rs.getInt("versionno"));
                resumeBean.setUsername(rs.getString("username"));
                resumeBean.setResume(rs.getString("resume"));
            }
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();}

        return resumeBean;
    }
}
