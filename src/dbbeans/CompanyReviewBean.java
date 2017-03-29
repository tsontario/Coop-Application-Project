package dbbeans;

import DAO.CompanyDAO;
import DAO.CompanyReviewDAO;

import java.util.ArrayList;

/**
 * Created by Kevin on 2017-03-28.
 */
public class CompanyReviewBean {

    private int reviewid, companyid;
    private String username, interviewExperience, onTheJobExperience,salaryExperience,timestamp;
    private double rating;

    public int getReviewid() {
        return reviewid;
    }

    public void setReviewid(int reviewid) {
        this.reviewid = reviewid;
    }

    public int getCompanyid() {
        return companyid;
    }

    public void setCompanyid(int companyid) {
        this.companyid = companyid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getInterviewExperience() {
        return interviewExperience;
    }

    public void setInterviewExperience(String interviewExperience) {
        this.interviewExperience = interviewExperience;
    }

    public String getOnTheJobExperience() {
        return onTheJobExperience;
    }

    public void setOnTheJobExperience(String onTheJobExperience) {
        this.onTheJobExperience = onTheJobExperience;
    }

    public String getSalaryExperience() {
        return salaryExperience;
    }

    public void setSalaryExperience(String salaryExperience) {
        this.salaryExperience = salaryExperience;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public static ArrayList<CompanyBean> getAllCompanies(){
        return CompanyReviewDAO.getAllCompanies();
    }

    public static int getNumRatings(int companyid){
        return CompanyDAO.numReviews(companyid);
    }

    public static ArrayList<CompanyReviewBean> getReviewsByID(int companyid){
        return CompanyReviewDAO.getReviewsByID(companyid);
    }
}
