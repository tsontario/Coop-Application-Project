-- INSERT inserts a job application of a specific user to a specific job
INSERT INTO applies_to VALUES (?, ?);

-- INSERT a new company into the database
INSERT INTO company (companysize, location, cname, password) VALUES
  (?, ?, ?, ?);

-- INSERT a new company review into the database
INSERT INTO company_review (username,companyid,interviewexperience,
                            onthejobexperience,salaryexperience,timestamp, companyrating)
VALUES (?, ?, ?, ?,
        ?, ?, ?);

-- INSERT a new job into the database
INSERT INTO job (joblevel, jobname, companyid, description,
                 numpositions, rateofpay, closingdate, postingdate)
VALUES (?, ?, ?, ?,
        ?, ?, ?, ?);

-- INSERT a new job to be approved by an admin
INSERT INTO job_approval (approved, jobid) VALUES
  (FALSE, ?);

-- INSERT a new relation row indicating a program is eligible for a job
INSERT INTO offered_to VALUES (?, ?);

-- INSERT a completed resume review to the database
INSERT INTO resume_review (resumeid, resumeversion, moderator, resumecomments)
VALUES (?, ?, ?, ?)
RETURNING reviewid;

-- INSERT a new user into the database
INSERT INTO suser VALUES
  (?, ?, ?, ?, ?, ?, ?);

-- INSERT make a user a moderator
INSERT INTO moderator(username) VALUES (?);

-- INSERT add a user as an administrator
INSERT INTO admin(username) VALUES (?);

-- Insert a new resume review and return its generated id
INSERT  INTO resume_review (reviewid, resumeid, resumeversion, moderator, resumecomments)
VALUES (11, 1, 2, 'tsmit094', 'afdsafdsa')
RETURNING resumeid;

-- Insert a new upvote for a review
INSERT INTO upvote(username, reviewid) VALUES (?, ?);

-- INSERT new resume
INSERT INTO resume (versionno, username, resume) VALUES(? ,?, ?);

-- INSERT new resume request
INSERT INTO resume (requesterid, resumeid, versionno) VALUES(? ,?, ?);