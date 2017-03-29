package DAO;

import connection.DataAccess;
import dbbeans.AppliedToBean;
import dbbeans.CompanyBean;
import dbbeans.CompanyReviewBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

    public static ArrayList<CompanyReviewBean> getReviewsByID(int companyid){
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


}
