package DAO;

import connection.DataAccess;
import dbbeans.ResumeReviewBean;

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
            else {
                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resumeReviewBean;
    }
}
