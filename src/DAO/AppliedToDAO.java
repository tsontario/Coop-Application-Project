package DAO;

import connection.DataAccess;
import dbbeans.AppliedToBean;

import java.sql.*;
import java.util.Calendar;
/**
 * Created by Kevin on 2017-03-28.
 */
public class AppliedToDAO {

    static DataAccess db = new DataAccess();
    static Connection connection;
    static Statement st;
    static ResultSet rs;

    public static boolean checkIfUserApplied(String userid, int jobid) {

        db.openConnection();
        connection = db.getConnection();
        AppliedToBean appliedTo = new AppliedToBean();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * " +
            "FROM \"Proj\".APPLIES_TO WHERE jobid='" + jobid + "' AND " + "userid='" + userid + "';");
            if(rs.next()) {
                appliedTo.setJobid(rs.getInt("jobid"));
                appliedTo.setUserid(rs.getString("userid"));
                appliedTo.setTimestamp(rs.getDate("timestamp").toString());
                rs.close();
                st.close();
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (appliedTo.getJobid() == 0 || appliedTo.getUserid() == null) {
            return false;
        } else {
            return true;
        }
    }


    public static void applyToJob(String userid, int jobid) {
        java.sql.Date timeNow = new Date(Calendar.getInstance().getTimeInMillis());
        System.out.println(userid);
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            st.executeUpdate("INSERT INTO \"Proj\".APPLIES_TO VALUES ('"  + jobid + "', '" + userid + "', '" + timeNow + "');");
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static AppliedToBean getStudentInfo(String username, int jobid) {
        AppliedToBean appliedToBean = new AppliedToBean();
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".applies_to WHERE userid ='" + username + "' AND jobid = '" + jobid + "';");
            if (rs.next()) {
                appliedToBean.setJobid(rs.getInt("jobid"));
                appliedToBean.setTimestamp(rs.getString("timestamp"));
                appliedToBean.setUserid(rs.getString("userid"));
                st.close();
                rs.close();
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appliedToBean;
    }
}
