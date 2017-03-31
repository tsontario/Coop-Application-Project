-- SELECT information relating to a job from a given company, along with information about that company
SELECT  jobid, jobname, joblevel, rateofpay, job.companyid, numpositions, closingdate, postingdate, cname, location
FROM job INNER JOIN company ON job.companyid = company.companyid WHERE job.jobid= id;

-- SELECT information relating to all jobs from a given company, along with information about that company
SELECT  jobid, jobname, joblevel, rateofpay, job.companyid, numpositions, closingdate, postingdate, cname, location
FROM job INNER JOIN company ON job.companyid = company.companyid;

-- SELECT the id of the most recent INSERT into the table
SELECT currval(pg_get_serial_sequence('job', 'jobid'));

-- SELECT the most recent version of a particular resume
SELECT resumeid, username, resume, MAX(versionno) AS versionno FROM resume
WHERE resumeid = id
GROUP BY resumeid, username, resume LIMIT 1;

-- SELECT all jobs of a particular company that have not been approved yet
SELECT * FROM job_approval NATURAL JOIN job WHERE companyid = id AND approved = FALSE;

-- SELECT all jobs of a particular company that have been approved
SELECT * FROM job_approval NATURAL JOIN job WHERE companyid = id AND approved = TRUE;

-- SELECT the sum of all of a given company's ratings and the number of ratings total.
-- Used to calculate average rating of a given company
SELECT SUM(companyrating), COUNT(companyrating)
FROM "Proj".COMPANY_REVIEW WHERE companyid = id;

-- SELECT the top 5 companies. Companies must have been reviewed to qualify.
-- E.G: a company with no reviews is not considered eligible to be ranked
SELECT AVG(companyrating) as rating, companyid, cname FROM company NATURAL JOIN company_review
GROUP BY companyid ORDER BY rating DESC LIMIT 5;

-- SELECT whether or not a user has applied for a particular job
SELECT * FROM applies_to WHERE jobid = jobid AND userid = userid;

-- SELECT the name and id of a company given its id.
SELECT cname, companyid FROM company WHERE companyid = id;

-- SELECT the number of reviews have been written for a given company
SELECT COUNT(companyrating) FROM COMPANY_REVIEW WHERE companyid = id;

-- SELECT whether or not a company exists with the given username and password
-- Used for logging in
SELECT * FROM company WHERE cname = name AND password = password;

-- SELECT a company with the given company name
-- Used to determine uniqueness of cname in controller
SELECT cname FROM company WHERE cname = cname;

-- SELECT all companies
SELECT cname, location, companyid, companysize FROM company ORDER BY cname;

-- SELECT all companies ordered alphabetically
SELECT * FROM COMPANY ORDER BY cname;

-- SELECT all company reviews for a given company ordered oldest to newest
SELECT * FROM COMPANY_REVIEW WHERE companyid = id ORDER BY timestamp;

-- SELECT all reviews for a given company by a given user
SELECT * FROM COMPANY_REVIEW WHERE companyid = id AND username = username;

-- SELECT the approval status of a given job
SELECT approved FROM job_approval WHERE jobid = id;

-- SELECT all available programs
SELECT * FROM program;

-- SELECT all versions of a given resume, ordered most recent to least
SELECT resumeid, username, resume, MAX(versionno) AS versionno FROM resume WHERE resumeid = id
GROUP BY resumeid, username, resume ORDER BY versionno DESC;

-- SELECT all versions of a resume of a given username
SELECT resumeid, username, resume, MAX(versionno) AS versionno FROM resume
WHERE username = 'tsmit094' GROUP BY resumeid, username, resume ORDER BY versionno DESC;

-- SELECT all resumes waiting to be reviewed
SELECT * FROM resume_review_request;

-- SELECT the user of a given username
SELECT * FROM suser WHERE username = ?;

-- SELECT the user with the given username and password
-- Used for logging in
SELECT * FROM suser WHERE username = ? AND password = ?;

-- SELECT the admin with the given username
-- Used to determine whether a given user is admin
SELECT username FROM admin WHERE username = ?;

-- SELECT the moderator with the given username
-- Used to determine whether a given user is a moderator
SELECT username FROM moderator WHERE username = ?;

-- SELECT a user with the given username
SELECT username FROM suser WHERE username = ?;

-- SELECT the user with the given email;
SELECT email FROM susuer WHERE email = ?;

-- SELECT all users;
SELECT * FROM suser ORDER BY fname;

-- SELECT the top five jobs. Job popularity is based on # of applicants
SELECT jobid, jobname, joblevel, rateofpay, companyid, numpositions, closingdate
FROM job  NATURAL JOIN applies_to GROUP BY jobid ORDER BY count(jobid) DESC;

-- SELECT all approved jobs that have not been closed
SELECT job.jobid, jobname, joblevel, rateofpay, companyid,
numpositions, closingdate, postingdate, cname, location
FROM job NATURAL JOIN company NATURAL JOIN job_approval
WHERE job.closingdate > CURRENT_DATE AND approved = TRUE ORDER BY jobid DESC;

-- SELECT a job by its ID
SELECT  jobid, jobname, joblevel, rateofpay, companyid, numpositions,
closingdate, postingdate, cname, location, job.description
FROM job NATURAL JOIN company WHERE job.jobid=?;

-- SELECT all jobs ordered newest to oldest
SELECT  jobid, jobname, joblevel, rateofpay, companyid, numpositions,
closingdate, postingdate, cname, location
FROM job NATURAL JOIN company ORDER BY postingdate DESC;

-- SELECT jobs by company
SELECT * FROM job where companyid = ?;

-- SELECT all pending jobs by company
SELECT jobid, jobname, joblevel, rateofpay, companyid,
numpositions, closingdate, postingdate, cname, description, location
FROM job_approval NATURAL JOIN job NATURAL JOIN company WHERE companyid = ? AND approved = FALSE;

-- SELECT ALL pending jobs
SELECT jobid, jobname, joblevel, rateofpay, companyid,
numpositions, closingdate, postingdate, cname, description, location
FROM job_approval NATURAL JOIN job NATURAL JOIN company WHERE approved = FALSE ORDER BY jobid;

-- SELECT ALL approved jobs
SELECT jobid, jobname, joblevel, rateofpay, companyid,
  numpositions, closingdate, postingdate, cname, description, location
FROM job_approval NATURAL JOIN job NATURAL JOIN company WHERE approved = TRUE ORDER BY jobid;