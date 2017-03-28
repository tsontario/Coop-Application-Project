package dbbeans;

import DAO.UserDAO;
import connection.DataAccess;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-25.
 */
public class UserBean implements Serializable {

    private String email;
    private String username;
    private String programCode;
    private int level;
    private String password;
    private String fName;
    private String lName;

    private Connection connection;
    private Statement st;
    private ResultSet rs;

    public UserBean() {
    }

    public UserBean(String email, String username, String programCode, int level,
                    String password, String fName, String lName) {
        this.email = email;
        this.username = username;
        this.programCode = programCode;
        this.level = level;
        this.password = password;
        this.fName = fName;
        this.lName = lName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProgramCode() {
        return programCode;
    }

    public void setProgramCode(String programCode) {
        this.programCode = programCode;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public static UserBean getUserById(String username)  {
        return UserDAO.getUserById(username);
    }

    public UserBean login(UserBean userBean) {
        return UserDAO.login(userBean);
    }

    public boolean isAdmin(String username) {
        return UserDAO.isAdmin(username);
    }

    public boolean isModerator(String username) {
        return UserDAO.isModerator(username);
    }

    public String toString() {
        String res = getfName() + " " + getlName();
        return res;
    }

    public static boolean isUnique(String username) {
        return UserDAO.isUnique(username);
    }

    public void insertIntoDB() {
        UserDAO.insertIntoDB(this);
    }
}
