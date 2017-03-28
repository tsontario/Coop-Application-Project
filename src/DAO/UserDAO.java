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

    public static boolean isAdmin(String username) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();


        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT username FROM \"Proj\".admin " +
                                "WHERE username = '" + username + "';");
            if (rs.next()) {
                rs.close();
                st.close();
                connection.close();
                return true;
            }
            else {
                rs.close();
                st.close();
                connection.close();
            }
        }
        catch (SQLException e) {
            e.printStackTrace();}
        return false;
    }

    public static boolean isModerator(String username) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT username FROM \"Proj\".moderator " +
                    "WHERE username = '" + username + "';");
            if (rs.next()) {
                rs.close();
                st.close();
                connection.close();
                return true;
            }
            else {
                rs.close();
                st.close();
                connection.close();
            }
        }
        catch (SQLException e) {
            e.printStackTrace();}
        return false;
    }


    public static UserBean updateUser(UserBean userBean) {

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();

            System.out.println(userBean.getfName());
            st.execute("UPDATE \"Proj\".suser SET username = '" + userBean.getUsername() + "', programcode = '" + userBean.getProgramCode() + "', password = '" + userBean.getPassword() + "', fname = '" + userBean.getfName() +
                    "', lname = '" + userBean.getlName() + "' WHERE email = '" + userBean.getEmail() + "';");
            st.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userBean;
    }

  
      public static boolean isUnique(String username) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT username FROM \"Proj\".suser" +
                    " WHERE username = '" + username + "';");
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public static void insertIntoDB(UserBean userBean) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            st.executeUpdate("INSERT INTO \"Proj\".suser VALUES ('" +
                                        userBean.getEmail() + "', '" +
                                        userBean.getUsername() + "', '" +
                                        userBean.getProgramCode() + "', " +
                                        userBean.getLevel() + ", '" +
                                        userBean.getPassword() + "', '" +
                                        userBean.getfName() + "', '" +
                                        userBean.getlName() + "');");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
