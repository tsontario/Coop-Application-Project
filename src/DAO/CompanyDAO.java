package DAO;

import connection.DataAccess;
import dbbeans.CompanyBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-26.
 */
public class CompanyDAO {
    static private Connection connection;
    static private Statement st;
    static private ResultSet rs;

    public static CompanyBean getCompanyById(String id) {

        CompanyBean companyBean = new CompanyBean();

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT cname, companyid FROM \"Proj\".company " +
                    "WHERE companyid = '" + id + "';");
            if (rs.next()) {
                companyBean.setcName(rs.getString("cname"));
                companyBean.setCompanyId(rs.getString("companyid"));
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return companyBean;
    }

    public static int getAverageRating(String id) {

        int averageRating = 0;
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT SUM(rating), COUNT(rating) " +
                    "FROM \"Proj\".company WHERE companyid = '"
                    + id + "';");
            if (rs.next()) {
                averageRating = rs.getInt(1) / rs.getInt(2);
                System.out.println("In the try: averageRating is: " + averageRating);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return averageRating;
    }

    public static ArrayList<CompanyBean> listTopFiveCompanies() {
        ArrayList<CompanyBean> companyList = new ArrayList<>();

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT rating, cname, location, companyid FROM \"Proj\".company " +
                                    "ORDER BY rating DESC LIMIT 5;");
            while (rs.next()) {
                CompanyBean company = new CompanyBean();
                company.setcName(rs.getString("cname"));
                company.setLocation(rs.getString("location"));
                company.setCompanyId(rs.getString("companyid"));

                companyList.add(company);
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return companyList;
    }
}
