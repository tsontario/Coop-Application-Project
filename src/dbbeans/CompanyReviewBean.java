package dbbeans;

import DAO.CompanyDAO;
import DAO.CompanyReviewDAO;

import java.util.ArrayList;

/**
 * Created by Kevin on 2017-03-28.
 */
public class CompanyReviewBean {
    public CompanyReviewBean(){

    }

    public CompanyReviewBean (int reviewid, int companyid, int rating, String username, String interviewExperience,
                              String onTheJobExperience, String salaryExperience, String timestamp){
        this.username = username;
        this.companyid = companyid;
        this.rating = rating;
        this.reviewid = reviewid;
        this.onTheJobExperience = onTheJobExperience;
        this.interviewExperience = interviewExperience;
        this.salaryExperience = salaryExperience;
        this.timestamp = timestamp;
        this.upvotes = 0;
    }

    private int reviewid;
    private int companyid;
    private int rating;

    public int getUpvotes() {
        return upvotes;
    }

    public void setUpvotes(int upvotes) {
        this.upvotes = upvotes;
    }

    private int upvotes;
    private String username, interviewExperience, onTheJobExperience,salaryExperience,timestamp;

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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public static ArrayList<CompanyBean> getAllCompanies(){
        return CompanyReviewDAO.getAllCompanies();
    }

    public static int getNumRatings(int companyid){
        return CompanyDAO.numReviews(companyid);
    }

    public static ArrayList<CompanyReviewBean> getReviewsByID(int companyid){
        return CompanyReviewDAO.getReviewsByCompanyID(companyid);
    }
    public static void createCompanyReview(String username, int companyid, String interviewExperience, String onTheJobExperience,
                                           String salaryExperience, int companyrating){
        CompanyReviewDAO.createCompanyReview(username,companyid,interviewExperience,onTheJobExperience,salaryExperience, companyrating);
    }

    public static void updateCompanyReview(String username, int companyid, String interviewExperience, String onTheJobExperience,
                                           String salaryExperience, int companyrating){
        CompanyReviewDAO.updateCompanyReview(username,companyid,interviewExperience,onTheJobExperience,salaryExperience, companyrating);

    }

    public static CompanyReviewBean getUserReviewByCompanyID(String username, int companyid){
        return CompanyReviewDAO.getUserReviewByCompanyID(username, companyid);
    }

    public static void deleteReview(String username, int companyid){
        CompanyReviewDAO.deleteReview(username, companyid);
    }
}
