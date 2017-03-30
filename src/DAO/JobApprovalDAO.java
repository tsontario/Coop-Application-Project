package DAO;

import connection.DataAccess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by willieausrotas on 2017-03-29.
 */
public class JobApprovalDAO {

    static DataAccess db = new DataAccess();
    static Connection connection;
    static Statement st;
    static ResultSet rs;

    public static boolean checkIfApproved(int jobId) {
        boolean approved = false;
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT approved FROM \"Proj\".job_approval WHERE jobid = " + jobId + ";");
            if (rs.next()) {
                approved = rs.getBoolean("approved");
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return approved;
    }
}
