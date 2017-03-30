SELECT  jobid, jobname, joblevel, rateofpay, job.companyid,
                    numpositions, closingdate, postingdate, cname, location
                    FROM job INNER JOIN company ON job.companyid = company.companyid WHERE job.jobid= id

SELECT  jobid, jobname, joblevel, rateofpay, job.companyid,
                            numpositions, closingdate, postingdate, cname, location
                    FROM job INNER JOIN company ON job.companyid = company.companyid

SELECT resumeid, username, resume, MAX(versionno) AS versionno FROM "Proj".resume
WHERE resumeid = 1
GROUP BY resumeid, username, resume;