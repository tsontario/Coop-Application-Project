package DAO;

import connection.DataAccess;
import dbbeans.JobBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-26.
 */
public class JobDAO {

    static DataAccess db = new DataAccess();
    static Connection connection;
    static Statement st;
    static ResultSet rs;

    public static ArrayList<JobBean> listTopFiveJobs() {
        ArrayList<JobBean> jobList = new ArrayList<>();
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT jobid, jobname, joblevel, rateofpay, companyid " +
                    "FROM \"Proj\".JOB  NATURAL JOIN \"Proj\".APPLIES_TO " +
                    "GROUP BY jobid ORDER BY count(jobid) DESC;");
            while (rs.next()) {
                JobBean job = new JobBean();
                job.setJobName(rs.getString("jobname"));
                job.setJobLevel(rs.getInt("joblevel"));
                job.setRateOfPay(rs.getDouble("rateofpay"));
                job.setCompanyId(rs.getString("companyid"));
                jobList.add(job);
            }
                rs.close();
                st.close();
                connection.close();
            } catch (SQLException e) {
            e.printStackTrace();
        }

        return jobList;
    }
}
