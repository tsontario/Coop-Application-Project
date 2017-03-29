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

        try {

            String insertSQL = "INSERT INTO \"Proj\".resume_review (resumeid, resumeversion, moderator, resumecomments)" +
                    " VALUES (?, ?, ?, ?) RETURNING resumeid";
            PreparedStatement pst = connection.prepareStatement(insertSQL);

            pst.setInt(1, resumeReviewBean.getResumeId());
            pst.setInt(2, resumeReviewBean.getResumeVersion());
            pst.setString(3, resumeReviewBean.getModerator().getUsername());
            pst.setString(4, resumeReviewBean.getComments());

            int reviewId = pst.executeUpdate();

            resumeReviewBean.setReviewId(reviewId);
            System.out.println(resumeReviewBean);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resumeReviewBean;
    }
}
