package dbbeans;

import DAO.ResumeReviewRequestDAO;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class ResumeReviewRequestBean implements Serializable {
    private String requesterUsername;
    private int resumeId;
    private int versionNo;

    public ResumeReviewRequestBean() {

    }

    public String getRequesterUsername() {
        return requesterUsername;
    }

    public void setRequesterUsername(String requesterUsername) {
        this.requesterUsername = requesterUsername;
    }

    public int getResumeId() {
        return resumeId;
    }

    public void setResumeId(int resumeId) {
        this.resumeId = resumeId;
    }

    public int getVersionNo() {
        return versionNo;
    }

    public void setVersionNo(int versionNo) {
        this.versionNo = versionNo;
    }

    public static ArrayList<ResumeReviewRequestBean> getReviewRequests() {
        return ResumeReviewRequestDAO.getReviewRequests();
    }

    public static void deleteById(int resumeId, int resumeVersion) {
        ResumeReviewRequestDAO.deleteById(resumeId,resumeVersion);
    }
}
