package DAO;

import connection.DataAccess;
import dbbeans.ResumeReviewRequestBean;

import java.sql.*;
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

            rs.close();
            st.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviewRequestList;
    }

    public static void deleteRequestById(int resumeid, int resumeVersion) {

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            PreparedStatement pst = connection.prepareStatement(
                    "DELETE FROM \"Proj\".resume_review_request WHERE resumeid = ? AND versionno = ?"
            );
            pst.setInt(1, resumeid);
            pst.setInt(2, resumeVersion);
            pst.executeUpdate();
            pst.close();
            st.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteById(int resumeId, int resumeVersion) {

        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            PreparedStatement pst = connection.prepareStatement(
                    "DELETE FROM \"Proj\".resume_review_request WHERE resumeid = ? AND versionno = ?");
            pst.setInt(1, resumeId);
            pst.setInt(2, resumeVersion);
            pst.executeUpdate();
            rs.close();
            pst.close();
            connection.close();
            System.out.println("ID: " + resumeId + " Version" + resumeVersion);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static int consumeNewReviewRequests(String username) {
        int numNewReviewRequests = 0;
        DataAccess.openConnection();
        connection = DataAccess.getConnection();

        try {
            PreparedStatement pst = connection.prepareStatement(
                    "DELETE FROM \"Proj\".new_resume_review_requests WHERE username = ?"
            );
            pst.setString(1, username);

            numNewReviewRequests = pst.executeUpdate();
            pst.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return numNewReviewRequests;
    }

    public static void createNewResumeRequest(String username, int resumeid ,int versionno){
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        int versionNumber = ResumeDAO.getLastestVersionNumber(username) + 1;
        try {
            st = connection.createStatement();
            st.executeUpdate("INSERT INTO \"Proj\".RESUME_REVIEW_REQUEST (requesterid, resumeid, versionno) " +
                    "VALUES('" + username + "', " + resumeid + ", " + versionno + "); ");
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public static boolean isResumePending(String username, int versionno){
        DataAccess.openConnection();
        connection = DataAccess.getConnection();
        int count = 0;
        try {
            st = connection.createStatement();
            rs = st.executeQuery("SELECT COUNT(*) FROM \"Proj\".resume_review_request WHERE requesterid ='" + username +
                    "' AND versionno='"+ versionno +"';");
            if(rs.next()){
                count = rs.getInt(1);
            }
            rs.close();
            st.close();
            connection.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        if(count >= 1){
            return true;
        } else {
            return false;
        }

    }
}