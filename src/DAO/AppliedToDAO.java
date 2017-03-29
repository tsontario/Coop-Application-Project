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

    public static boolean checkIfUserApplied(String userid, String jobid){

        db.openConnection();
        connection = db.getConnection();
        AppliedToBean appliedTo = new AppliedToBean();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * " +
            "FROM \"Proj\".APPLIES_TO WHERE jobid='" + jobid + "' AND " + "userid='" + userid + "';");
            if(rs.next()) {
                appliedTo.setJobid(rs.getString("jobid"));
                appliedTo.setUserid(rs.getString("userid"));
                appliedTo.setTimestamp(rs.getDate("timestamp").toString());
                rs.close();
                st.close();
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(appliedTo.getJobid() == null || appliedTo.getUserid() == null){
            return false;
        } else {
            return true;
        }
    }


    public static void applyToJob(String userid, String jobid){
        java.sql.Date timeNow = new Date(Calendar.getInstance().getTimeInMillis());
        System.out.println(timeNow.toString());
//        db.openConnection();
//        connection = db.getConnection();
//        try {
//            st = connection.createStatement();
//            rs = st.executeQuery("INSERT INTO applied_to VALUES (" + userid + ", " + jobid + ", " + timeNow + ");");
//            rs.close();
//            st.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

    }
}
