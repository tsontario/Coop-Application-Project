package DAO;

import connection.DataAccess;
import dbbeans.CompanyBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
}
