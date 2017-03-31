package dbbeans;

import DAO.JobDAO;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-26.
 */
public class JobBean implements Serializable {

    private int jobId;
    private int jobLevel;
    private String jobName;
    private String companyId;
    private String description;
    private int numPositions;
    private double rateOfPay;
    private String closingDate;
    private String postingDate;

    private String cname;
    private String location;

    public JobBean() {

    }

    public static JobBean getJobByID(int id) {
        return JobDAO.getJobByID(id);
    }

    public static ArrayList<JobBean> getAllJobsOrderByNewest() {
        return JobDAO.getAllJobListingsOrderByNewest();
    }

    public static void deleteJob(int jobid) {
        JobDAO.deleteJob(jobid);
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getJobLevel() {
        return jobLevel;
    }

    public void setJobLevel(int jobLevel) {
        this.jobLevel = jobLevel;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumPositions() {
        return numPositions;
    }

    public void setNumPositions(int numPositions) {
        this.numPositions = numPositions;
    }

    public double getRateOfPay() {
        return rateOfPay;
    }

    public void setRateOfPay(double rateOfPay) {
        this.rateOfPay = rateOfPay;
    }

    public String getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(String closingDate) {
        this.closingDate = closingDate;
    }

    public String getPostingDate() {
        return postingDate;
    }

    public void setPostingDate(String postingDate) {
        this.postingDate = postingDate;
    }

    public String getCName(){ return this.cname; }

    public void setCName(String cname) {
        this.cname = cname;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }


    public static ArrayList<JobBean> listTopFiveJobs() {
        return JobDAO.listTopFiveJobs();
    }
    public static ArrayList<JobBean> getAllJobs() {
        return JobDAO.getAllValidJobListing();
    }
    public void jobAdd(JobBean jobBean) {
        JobDAO.addJob(jobBean);

    }

    public static ArrayList<JobBean> getJobsByCompany(int companyId) {
        return JobDAO.getJobsByCompany(companyId);
    }

    public static ArrayList<JobBean> getPendingJobsByCompany(int companyId) {
        return JobDAO.getPendingJobsByCompany(companyId);
    }

    public static ArrayList<JobBean> getAllPendingJobs() {
        return JobDAO.getAllPendingJobs();
    }

    public static void executeAction(String action, int id) {
        if (action.equals("approve")) {
            JobDAO.approveJob(id);
        }
        else if (action.equals("reject")) {
            JobDAO.rejectJob(id);
        }
        else if (action.equals("delete")) {
            deleteJob(id);
        }
    }

    public static ArrayList<JobBean> getAllApprovedJobs() {
        return JobDAO.getAllApprovedJobs();
    }

    public static int consumeNewJobNotificationsByUser(String username) {
        return JobDAO.consumeNewJobNotifications(username);
    }

    public static int getNumNewPendingJobs(String username) {
        return JobDAO.consumeNumNewPendingJobs(username);
    }
}
