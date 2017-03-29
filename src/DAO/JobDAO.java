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

    public static ArrayList<JobBean> getAllJobListings() {
        ArrayList<JobBean> jobList = new ArrayList<>();
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT  jobid, jobname, joblevel, rateofpay, job.companyid, " +
                            "numpositions, closingdate, postingdate, cname, location " +
                    "FROM \"Proj\".JOB INNER JOIN \"Proj\".COMPANY ON job.companyid = company.companyid");
            while (rs.next()) {
                JobBean job = new JobBean();
                job.setJobName(rs.getString("jobname"));
                job.setJobId(rs.getInt("jobid"));
                job.setJobLevel(rs.getInt("joblevel"));
                job.setRateOfPay(rs.getDouble("rateofpay"));
                job.setCompanyId(rs.getString("companyid"));
                job.setNumPositions(rs.getInt("numpositions"));
                job.setClosingDate(rs.getDate("closingdate").toString());
                job.setPostingDate(rs.getDate("postingdate").toString());
                job.setCName(rs.getString("cname"));
                job.setLocation(rs.getString("location"));
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

    public static JobBean getJobByID(int id){
        JobBean job = new JobBean();
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT  jobid, jobname, joblevel, rateofpay, job.companyid, " +
                    "numpositions, closingdate, postingdate, cname, location, job.description " +
                    "FROM \"Proj\".JOB INNER JOIN \"Proj\".COMPANY ON job.companyid = company.companyid WHERE job.jobid=" + id);
            rs.next();
                job.setJobName(rs.getString("jobname"));
                job.setJobId(rs.getInt("jobid"));
                job.setJobLevel(rs.getInt("joblevel"));
                job.setRateOfPay(rs.getDouble("rateofpay"));
                job.setCompanyId(rs.getString("companyid"));
                job.setNumPositions(rs.getInt("numpositions"));
                job.setClosingDate(rs.getDate("closingdate").toString());
                job.setPostingDate(rs.getDate("postingdate").toString());
                job.setCName(rs.getString("cname"));
                job.setLocation(rs.getString("location"));
                job.setDescription(rs.getString("description"));
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return job;
    }
}
