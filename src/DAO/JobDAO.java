package DAO;

import connection.DataAccess;
import dbbeans.JobBean;

import java.sql.*;
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

    public static ArrayList<JobBean> getAllValidJobListing() {
        ArrayList<JobBean> jobList = new ArrayList<>();
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT  job.jobid, jobname, joblevel, rateofpay, job.companyid, " +
                            "numpositions, closingdate, postingdate, cname, location " +
                    "FROM \"Proj\".JOB INNER JOIN \"Proj\".COMPANY ON job.companyid = company.companyid " +
                    "INNER JOIN \"Proj\".JOB_APPROVAL ON job.jobid = job_approval.jobid " +
                    "WHERE job.closingdate > CURRENT_DATE;");
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

    public static ArrayList<JobBean> getAllJobListingsOrderByNewest() {
        ArrayList<JobBean> jobList = new ArrayList<>();
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT  jobid, jobname, joblevel, rateofpay, job.companyid, " +
                    "numpositions, closingdate, postingdate, cname, location " +
                    "FROM \"Proj\".JOB INNER JOIN \"Proj\".COMPANY ON job.companyid = company.companyid ORDER BY postingdate DESC;");
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

    public static void deleteJob(int jobid) {
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            st.executeUpdate("DELETE FROM \"Proj\".job WHERE jobid = " + jobid + ";");
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void addJob(JobBean jobBean) {
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            st.executeUpdate("INSERT INTO \"Proj\".job (joblevel, jobname, companyid, description, numpositions, rateofpay, closingdate, postingdate) VALUES (" +
                    jobBean.getJobLevel() + ", '" +
                    jobBean.getJobName() + "', " +
                    jobBean.getCompanyId() + ", '" +
                    jobBean.getDescription() + "', " +
                    jobBean.getNumPositions() + ", " +
                    jobBean.getRateOfPay() + ", " +
                    "CURRENT_DATE +" + jobBean.getClosingDate() + ", " +
                    "CURRENT_DATE );");
            rs = st.executeQuery("SELECT jobid FROM \"Proj\".job WHERE jobname ='" + jobBean.getJobName() + "' AND companyid =" + jobBean.getCompanyId() + ";");
            if (rs.next()) {
                st.executeUpdate("INSERT INTO \"Proj\".job_approval (approved, jobid) VALUES (FALSE, " + rs.getInt("jobid") + ");");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<JobBean> getJobsByCompany(int companyId) {
        DataAccess.openConnection();
        ArrayList<JobBean> jobList = new ArrayList<>();

        try {
            connection = DataAccess.getConnection();
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".job where companyid = " + companyId);
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
                job.setCName(rs.getString("description"));
                jobList.add(job);
            }
            rs.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobList;
    }

    public static ArrayList<JobBean> getPendingJobsByCompany(int companyId) {
        DataAccess.openConnection();
        ArrayList<JobBean> jobList = new ArrayList<>();

        try {
            connection = DataAccess.getConnection();
            st = connection.createStatement();
            rs = st.executeQuery(
                    "SELECT jobid, jobname, joblevel, rateofpay, job.companyid, " +
                            "numpositions, closingdate, postingdate FROM \"Proj\".job_approval NATURAL JOIN \"Proj\".job WHERE companyid = " + companyId + " AND approved = FALSE");
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

                jobList.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobList;
    }

}
