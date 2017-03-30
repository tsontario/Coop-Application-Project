SET SEARCH_PATH ='Proj';

-- UPDATE information about a company
UPDATE company SET companysize = ?, location = ?, cname = ?,
password=? WHERE companyid = ?;

-- UPDATE information of a given company review
UPDATE company_review SET interviewexperience = ?, onthejobexperience = ?,
salaryexperience=?, companyrating = ?, timestamp=CURRENT_DATE
WHERE companyid = ? AND username = ?;

-- UPDATE approve a job posting
UPDATE job_approval SET approved = TRUE WHERE jobid = ?;

UPDATE suser SET username = ?, programcode = ?,
password = ?, fname = ?, lname = ?, level = ? WHERE email = ?;