package DAO;

import connection.DataAccess;
import dbbeans.UserBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by timothysmith on 2017-03-26.
 */
public class UserDAO {

    static private Connection connection;
    static private Statement st;
    static private ResultSet rs;


    public static UserBean login(UserBean userBean) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        String username = userBean.getUsername();
        String password = userBean.getPassword();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".suser WHERE "
                    + "username = '" + username + "' AND password = '" + password + "';");
            if (rs.next()) {
                userBean.setEmail(rs.getString("Email"));
                userBean.setLevel(rs.getInt("level"));
                userBean.setfName(rs.getString("FName"));
                userBean.setlName(rs.getString("LName"));
                userBean.setProgramCode(rs.getString("ProgramCode"));
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
        return userBean;
    }
}
