package dbbeans;

import DAO.JobApprovalDAO;

/**
 * Created by willieausrotas on 2017-03-29.
 */
public class JobApprovalBean {

    private int jobId;
    private boolean approved;

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public boolean isApproved() {
        return approved;
    }

    public void setApproved(boolean approved) {
        this.approved = approved;
    }

    public boolean isApproved(int jobid) {
        return JobApprovalDAO.checkIfApproved(jobid);
    }
}
