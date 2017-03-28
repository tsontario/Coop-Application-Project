package DAO;

import connection.DataAccess;
import dbbeans.ResumeReviewRequestBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class ResumeReviewRequestDAO {

    static private Connection connection;
    static private Statement st;
    static private ResultSet rs;

    public static ArrayList<ResumeReviewRequestBean> getReviewRequests() {
        ArrayList<ResumeReviewRequestBean> reviewRequestList = new ArrayList<>();

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT * FROM \"Proj\".resume_review_request;");
            while (rs.next()) {
                ResumeReviewRequestBean resumeReviewRequestBean = new ResumeReviewRequestBean();

                resumeReviewRequestBean.setRequesterUsername(rs.getString("requesterid"));
                resumeReviewRequestBean.setResumeId(rs.getInt("resumeid"));
                resumeReviewRequestBean.setVersionNo(rs.getInt("versionno"));

                reviewRequestList.add(resumeReviewRequestBean);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviewRequestList;
    }
}