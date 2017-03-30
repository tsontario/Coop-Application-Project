package dbbeans;

import DAO.ResumeReviewDAO;

import java.io.Serializable;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class ResumeReviewBean implements Serializable {
    private int reviewId;
    private UserBean moderator;
    private int resumeId;
    private int resumeVersion;
    private String comments;

    public ResumeReviewBean() {

    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public UserBean getModerator() {
        return moderator;
    }

    public void setModerator(UserBean moderator) {
        this.moderator = moderator;
    }

    public int getResumeId() {
        return resumeId;
    }

    public void setResumeId(int resumeId) {
        this.resumeId = resumeId;
    }

    public int getResumeVersion() {
        return resumeVersion;
    }

    public void setResumeVersion(int resumeVersion) {
        this.resumeVersion = resumeVersion;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public ResumeReviewBean insertReviewToDb() {
        return ResumeReviewDAO.insertReviewToDb(this);
    }

    @Override
    public String toString() {
        String res = "";

        res += this.getReviewId();
        res += this.getResumeId();
        res += this.getResumeVersion();
        res += " " + this.getModerator();
        res += " " + this.getComments();

        return res;
    }
}
