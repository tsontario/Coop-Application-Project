package dbbeans;

import java.io.Serializable;

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
}
