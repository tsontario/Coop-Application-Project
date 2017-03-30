package DAO;

import connection.DataAccess;
import dbbeans.UserBean;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-26.
 */
public class UserDAO {

    static private Connection connection;
    static private Statement st;
    static private PreparedStatement pst;
    static private ResultSet rs;


    public static UserBean getUserById(String username) {
        UserBean userBean = null;
        DataAccess.openConnection();

        try {
            connection = DataAccess.getConnection();
//            st = connection.createStatement();
            PreparedStatement st = connection.prepareStatement("SELECT * FROM \"Proj\".suser WHERE username = ?");
            st.setString(1, username);
            System.out.println(st);
            rs = st.executeQuery();

            if (rs.next()) {
                userBean = new UserBean();

                userBean.setEmail(rs.getString("email"));
                userBean.setUsername(rs.getString("username"));
                userBean.setProgramCode(rs.getString("programcode"));
                userBean.setLevel(rs.getInt("level"));
                userBean.setPassword(rs.getString("password"));
                userBean.setfName(rs.getString("fname"));
                userBean.setlName(rs.getString("lname"));

            }
            rs.close();
            st.close();
            connection.close();

        } catch(Exception e){

            System.out.println("Cant read SUser table");
        }

        return userBean;
    }

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
            rs.close();
            st.close();
            connection.close();

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
            rs.close();
            st.close();
            connection.close();

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

            st.execute("UPDATE \"Proj\".suser SET username = '" + userBean.getUsername() + "', programcode = '" + userBean.getProgramCode() + "', password = '" + userBean.getPassword() + "', fname = '" + userBean.getfName() +
                    "', lname = '" + userBean.getlName() + "', level = " + userBean.getLevel() + " WHERE email = '" + userBean.getEmail() + "';");
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
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public static boolean isUniqueEmail(String email) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT email FROM \"Proj\".suser" +
                    " WHERE email = '" + email + "';");
            if (rs.next()) {
                rs.close();
                st.close();
                connection.close();
                return false;
            }
            rs.close();
            st.close();
            connection.close();
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
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static ArrayList<UserBean> getAllUsers() {
        ArrayList<UserBean> users = new ArrayList<>();
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".suser ORDER BY fname");
            while (rs.next()) {
                UserBean userBean = new UserBean();
                userBean.setUsername(rs.getString("username"));
                userBean.setProgramCode(rs.getString("programcode"));
                userBean.setfName(rs.getString("fname"));
                userBean.setlName(rs.getString("lname"));
                userBean.setLevel(rs.getInt("level"));
                userBean.setEmail(rs.getString("email"));
                users.add(userBean);
            }
            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public static void deleteUserById(String id) {

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            pst = connection.prepareStatement("DELETE FROM \"Proj\".suser WHERE username = ?;");
            pst.setString(1, id);
            System.out.println(pst.toString());

            pst.executeUpdate();
            connection.close();
            DataAccess.closeConnection();

            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void makeModeratorById(String id) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            pst = connection.prepareStatement("INSERT INTO \"Proj\".moderator(username) VALUES (?)");

            pst.setString(1, id);
            pst.executeUpdate();

            pst.close();
            connection.close();
            DataAccess.closeConnection();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void makeAdminById(String id) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            pst = connection.prepareStatement("INSERT INTO \"Proj\".admin(username) VALUES (?)");

            pst.setString(1, id);
            pst.executeUpdate();

            pst.close();
            connection.close();
            DataAccess.closeConnection();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteAdminById(String id) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            pst = connection.prepareStatement("DELETE FROM \"Proj\".admin WHERE username = ? RETURNING username");
            pst.setString(1, id);

            rs = pst.executeQuery();

            pst.close();
            connection.close();
            DataAccess.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteModeratorById(String id) {
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            pst = connection.prepareStatement("DELETE FROM \"Proj\".moderator WHERE username = ? RETURNING username");
            pst.setString(1, id);

            rs = pst.executeQuery();

            rs.close();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
