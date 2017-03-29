package DAO;

import connection.DataAccess;
import dbbeans.AppliedToBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import java.util.Calendar;
/**
 * Created by Kevin on 2017-03-28.
 */
public class AppliedToDAO {

    static DataAccess db = new DataAccess();
    static Connection connection;
    static Statement st;
    static ResultSet rs;

    public static boolean checkIfUserApplied(String userid, int jobid){

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
        if(appliedTo.getJobid() == 0 || appliedTo.getUserid() == null){
            return false;
        } else {
            return true;
        }
    }


    public static void applyToJob(String userid, int jobid){
        java.sql.Date timeNow = new Date(Calendar.getInstance().getTimeInMillis());
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

    public static void unApplyToJob(String userid, int jobid){
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            st.executeUpdate("DELETE FROM \"Proj\".APPLIES_TO WHERE userid='" + userid + "' AND jobid="+ jobid + ";");
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
