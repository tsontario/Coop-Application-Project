package DAO;

import connection.DataAccess;
import dbbeans.AppliedToBean;
import dbbeans.CompanyBean;
import dbbeans.CompanyReviewBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

/**
 * Created by Kevin on 2017-03-28.
 */
public class CompanyReviewDAO {

    static DataAccess db = new DataAccess();
    static Connection connection;
    static Statement st;
    static ResultSet rs;

    public static ArrayList<CompanyBean> getAllCompanies(){
        ArrayList<CompanyBean> companies = new ArrayList<CompanyBean>();

        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * " +
                    "FROM \"Proj\".COMPANY ORDER BY cname;");
            while(rs.next()) {
                CompanyBean company = new CompanyBean();
                company.setcName(rs.getString("cname"));
                company.setRating(rs.getDouble("rating"));
                company.setCompanyId(rs.getInt("companyid"));
                company.setCompanySize(rs.getInt("companysize"));
                company.setLocation(rs.getString("location"));
                companies.add(company);
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return companies;
    }

    public static ArrayList<CompanyReviewBean> getReviewsByCompanyID(int companyid){
        ArrayList<CompanyReviewBean> reviews = new ArrayList<>();
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * " +
                    "FROM \"Proj\".COMPANY_REVIEW " +
                    "WHERE companyid='" + companyid + "' ORDER BY \"timestamp\";");
            while(rs.next()) {
                CompanyReviewBean review = new CompanyReviewBean();
                review.setCompanyid(rs.getInt("companyid"));
                review.setReviewid(rs.getInt("reviewid"));
                review.setUsername(rs.getString("username"));
                review.setInterviewExperience(rs.getString("interviewexperience"));
                review.setOnTheJobExperience(rs.getString("onthejobexperience"));
                review.setSalaryExperience(rs.getString("salaryexperience"));
                review.setTimestamp(rs.getString("timestamp"));
                review.setRating(rs.getInt("companyrating"));
                reviews.add(review);
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }

    public static void createCompanyReview(String username, int companyid, String interviewExperience, String onTheJobExperience,
                                           String salaryExperience, int companyrating){
        java.sql.Date dateNow = new Date(Calendar.getInstance().getTimeInMillis());
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            st.executeUpdate("INSERT INTO \"Proj\".COMPANY_REVIEW (USERNAME,COMPANYID,INTERVIEWEXPERIENCE," +
                    "ONTHEJOBEXPERIENCE,SALARYEXPERIENCE,TIMESTAMP, COMPANYRATING) VALUES ('"  + username + "', " +
                    companyid + ", '" + interviewExperience + "', '" + onTheJobExperience + "', '" +
                    salaryExperience + "', '" + dateNow + "', " + companyrating + ");");
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static boolean isExistingReview(String username, int companyid){
        CompanyReviewBean review = new CompanyReviewBean();
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * " +
                    "FROM \"Proj\".COMPANY_REVIEW " +
                    "WHERE companyid=" + companyid + " AND username='" + username +"';");
            if(!rs.next()) {
                review = null;
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(review == null){
            return false;
        } else {
            return true;
        }
    }

    public static void updateCompanyReview(String username, int companyid, String interviewExperience, String onTheJobExperience,
                                           String salaryExperience, int companyrating){
        java.sql.Date dateNow = new Date(Calendar.getInstance().getTimeInMillis());
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            st.executeUpdate("UPDATE \"Proj\".COMPANY_REVIEW SET interviewexperience='" + interviewExperience + "', " +
                    "onthejobexperience='" + onTheJobExperience + "', salaryexperience='" + salaryExperience + "', " +
                    "companyrating='" + companyrating + "', timestamp=CURRENT_DATE " + " WHERE companyid=" + companyid +
                    " AND username='" + username +"';");
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static CompanyReviewBean getUserReviewByCompanyID(String username, int companyid){

        CompanyReviewBean review = new CompanyReviewBean();
        db.openConnection();
        connection = db.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * " +
                    "FROM \"Proj\".COMPANY_REVIEW " +
                    "WHERE companyid=" + companyid + " AND username='" + username +"';");
            if(rs.next()) {
                review.setCompanyid(rs.getInt("companyid"));
                review.setReviewid(rs.getInt("reviewid"));
                review.setUsername(rs.getString("username"));
                review.setInterviewExperience(rs.getString("interviewexperience"));
                review.setOnTheJobExperience(rs.getString("onthejobexperience"));
                review.setSalaryExperience(rs.getString("salaryexperience"));
                review.setTimestamp(rs.getString("timestamp"));
                review.setRating(rs.getInt("companyrating"));
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return review;

    }

    public static void deleteReview(String username, int companyid){
        db.openConnection();
        connection = db.getConnection();
        try {
            st = connection.createStatement();
            st.executeUpdate("DELETE FROM \"Proj\".COMPANY_REVIEW WHERE username='" + username + "' AND companyid="+ companyid + ";");
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
