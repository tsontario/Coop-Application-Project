-- Remove a job application of a specific user
DELETE FROM applies_to WHERE userid= ? AND jobid= ?;

-- DELETE a company
DELETE FROM company WHERE companyid = ?;

-- DELETE a company review
DELETE FROM company_review WHERE username = ? AND companyid = ?;

-- DELETE a job
DELETE FROM job WHERE jobid = ?;

-- DELETE a resume review request. Occurs after a moderator has finished a review
DELETE FROM resume_review_request WHERE resumeid = ? AND versionno = ?;

-- DELETE a user from the system
DELETE FROM suser WHERE username = ?;

-- DELETE remove admin privileges of a user
DELETE FROM admin WHERE username = ? RETURNING username;

-- DELETE remove moderator privileges of a user
DELETE FROM moderator WHERE username = ? RETURNING username;

-- Consumes notifications of new jobs for users (uses number returned from query)
-- Used to let users know when new job postings are available
DELETE FROM job_notification WHERE username = ?;

-- Delete an upvote
DELETE FROM upvote WHERE username = ? AND reviewid = ?;
