package DAO;

import connection.DataAccess;
import dbbeans.ResumeBean;
import dbbeans.ResumeReviewBean;
import dbbeans.UserBean;

import java.sql.*;

/**
 * Created by timothysmith on 2017-03-29.
 */
public class ResumeReviewDAO {

    static private Connection connection;
    static private Statement st;
    static private ResultSet rs;

    public static ResumeReviewBean insertReviewToDb(ResumeReviewBean resumeReviewBean) {

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        int resumeid = resumeReviewBean.getResumeId();
        int resumeVersion = resumeReviewBean.getResumeVersion();
        String moderatorUsername = resumeReviewBean.getModerator().getUsername();
        String moderatorComments = resumeReviewBean.getComments();

        try {

            String insertSQL = "INSERT INTO \"Proj\".resume_review (resumeid, resumeversion, moderator, resumecomments)" +
                    " VALUES (?, ?, ?, ?) RETURNING reviewid";
            PreparedStatement pst = connection.prepareStatement(insertSQL);

            pst.setInt(1, resumeid);
            pst.setInt(2, resumeVersion);
            pst.setString(3, moderatorUsername);
            pst.setString(4, moderatorComments);

            rs = pst.executeQuery();
            if (rs.next()) {
                resumeReviewBean.setReviewId(rs.getInt("reviewid"));
                ResumeReviewRequestDAO.deleteRequestById(resumeid, resumeVersion);
            }
            rs.close();
            pst.close();
            connection.close();



        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resumeReviewBean;
    }

    public static ResumeReviewBean getReviewForResumeVersion(int resumeid, int version){
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        ResumeReviewBean resumeBean = new ResumeReviewBean();
        String username ="";
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".RESUME_REVIEW WHERE resumeid=" + resumeid +
                    " AND resumeversion=" + version + ";");
            if(rs.next()){
                resumeBean.setReviewId(Integer.parseInt(rs.getString("reviewid")));
                resumeBean.setResumeId(Integer.parseInt(rs.getString("resumeid")));
                resumeBean.setResumeVersion(Integer.parseInt(rs.getString("resumeversion")));
                resumeBean.setComments(rs.getString("resumecomments"));
                username = rs.getString("moderator");
            }
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        if(!username.equals("")){
            resumeBean.setModerator(UserBean.getUserById(username));
        }
        return resumeBean;
    }
}
