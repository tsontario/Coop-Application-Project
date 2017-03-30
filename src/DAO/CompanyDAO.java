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
                companyBean.setCompanyId(rs.getInt("companyid"));
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return companyBean;
    }

    public static double getAverageRating(int id) {

        double averageRating = 0;
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT SUM(companyrating), COUNT(companyrating) " +
                    "FROM \"Proj\".COMPANY_REVIEW WHERE companyid = '"
                    + id + "';");
            if (rs.next()) {
                averageRating = rs.getDouble(1) / rs.getDouble(2);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return averageRating;
    }

    public static int numReviews(int id) {
        int rating = 0;
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT COUNT(companyrating) " +
                    "FROM \"Proj\".COMPANY_REVIEW WHERE companyid = '"
                    + id + "';");
            if (rs.next()) {
                rating = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rating;
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
                company.setCompanyId(rs.getInt("companyid"));

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

    public static CompanyBean login(CompanyBean companyBean) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        String companyName = companyBean.getcName();
        String password = companyBean.getPassword();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".company WHERE "
                    + "cname = '" + companyName + "' AND password = '" + password + "';");
            System.out.println(rs.getRow());
            if (rs.next()) {
                companyBean.setCompanyId(rs.getInt("companyid"));
                companyBean.setCompanySize(rs.getInt("companysize"));
                companyBean.setLocation(rs.getString("location"));
                companyBean.setRating(rs.getDouble("rating"));
            }
            else {
                rs.close();
                st.close();
                connection.close();
                return null;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();}
        return companyBean;
    }

    public static boolean isUnique(String username) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT cname FROM \"Proj\".company" +
                    " WHERE cname = '" + username + "';");
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public static void insertIntoDB(CompanyBean companyBean) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            st.execute("INSERT INTO \"Proj\".company (companysize, location, rating, cname, password) VALUES ('" +
                    companyBean.getCompanySize() + "', '" +
                    companyBean.getLocation() + "', '" +
                    companyBean.getRating() + "', '" +
                    companyBean.getcName() + "', '" +
                    companyBean.getPassword() + "');");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static CompanyBean updateCompany(CompanyBean companyBean) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            st.execute("UPDATE \"Proj\".company SET" +
                    " companysize ='" + companyBean.getCompanySize() + "'," +
                    " location ='" + companyBean.getLocation() + "'," +
                    " cname = '" + companyBean.getcName() + "'," +
                    " password='" + companyBean.getPassword() + "'" +
                    " WHERE companyid = '" + companyBean.getCompanyId() + "';");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return companyBean;
    }

    public static ArrayList<CompanyBean> getAllCompanies() {
        ArrayList<CompanyBean> companyList = new ArrayList<>();

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery(
                "SELECT rating, cname, location, companyid, companysize FROM \"Proj\".company;" );
            while (rs.next()) {
                CompanyBean company = new CompanyBean();
                company.setcName(rs.getString("cname"));
                company.setLocation(rs.getString("location"));
                company.setCompanyId(rs.getInt("companyid"));
                company.setCompanySize(rs.getInt("companysize"));
                company.setRating(rs.getDouble("rating"));

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

    public static void deleteCompanyById(int id) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            st.executeUpdate(
                    "DELETE FROM \"Proj\".company WHERE companyid = " + id + ";");

            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

