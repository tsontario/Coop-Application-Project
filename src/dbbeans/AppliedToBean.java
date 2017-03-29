package dbbeans;

import DAO.AppliedToDAO;

/**
 * Created by Kevin on 2017-03-28.
 */
public class AppliedToBean {

    public String getJobid() {
        return jobid;
    }

    public void setJobid(String jobid) {
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

    private String jobid;
    private String userid;
    private String timestamp;

    public static boolean isAppliedTo(String userid, String jobid){ return AppliedToDAO.checkIfUserApplied(userid,jobid);}
    public static void applyTo(String userid, String jobid){ AppliedToDAO.applyToJob(userid, jobid);}

}
