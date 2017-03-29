package dbbeans;

import DAO.AppliedToDAO;

/**
 * Created by Kevin on 2017-03-28.
 */
public class AppliedToBean {

    private int jobid;
    private String userid;
    private String timestamp;

    public static boolean isAppliedTo(String userid, int jobid) {
        return AppliedToDAO.checkIfUserApplied(userid, jobid);
    }

    public static void applyTo(String userid, int jobid) {
        AppliedToDAO.applyToJob(userid, jobid);
    }

    public static AppliedToBean getStudentInfo(String username, int jobid) {
        return AppliedToDAO.getStudentInfo(username, jobid);
    }
    public int getJobid() {
        return jobid;
    }

    public void setJobid(int jobid) {
        this.jobid = jobid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

}
