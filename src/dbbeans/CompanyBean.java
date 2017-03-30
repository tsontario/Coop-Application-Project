package dbbeans;

import DAO.CompanyDAO;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-26.
 */
public class CompanyBean implements Serializable {
    private int companyId;
    private String password;
    private int companySize;
    private String location;
    private double rating;
    private String cName;

    public CompanyBean() {

    }

    public static ArrayList<CompanyBean> listTopFiveCompanies() {
        return CompanyDAO.listTopFiveCompanies();
    }

    public static boolean isUnique(String username) {
        return CompanyDAO.isUnique(username);
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getCompanySize() {
        return companySize;
    }

    public void setCompanySize(int companySize) {
        this.companySize = companySize;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public CompanyBean getCompanyById(String companyId) {
        return CompanyDAO.getCompanyById(companyId);
    }

    public double getRating() {
        return CompanyDAO.getRating(this.getCompanyId());
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public CompanyBean login(CompanyBean companyBean) {
        return CompanyDAO.login(companyBean);
    }

    public void insertIntoDB() {
        CompanyDAO.insertIntoDB(this);
    }

    public static ArrayList<CompanyBean> getAllCompanies() {
        return CompanyDAO.getAllCompanies();
    }

    public static void executeAction(String action, int id) {

        if (action == null) {
            return;
        }
        else if (action.equals("delete")) {
            CompanyDAO.deleteCompanyById(id);
        }
    }
}
