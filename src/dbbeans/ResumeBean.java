package dbbeans;

import DAO.ResumeDAO;

import java.io.Serializable;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class ResumeBean implements Serializable {
    private int resumeId;
    private int versionNo;
    private String username;
    private String resume;

    public ResumeBean() {

    }



    public static ResumeBean getResumeByUsername(String username) {
        return ResumeDAO.getResumeByUsername(username);
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public static ResumeBean getResumeById(int id) {
        return ResumeDAO.getResumeById(id);
    }

    public static ResumeBean getResumeByIdAndVersion(int id, int version) {
        return ResumeDAO.getResumeByIdAndVersion(id, version);
    }
}
