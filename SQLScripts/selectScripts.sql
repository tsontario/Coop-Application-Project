SELECT  jobid, jobname, joblevel, rateofpay, job.companyid,
                    numpositions, closingdate, postingdate, cname, location
                    FROM job INNER JOIN company ON job.companyid = company.companyid WHERE job.jobid= id

SELECT  jobid, jobname, joblevel, rateofpay, job.companyid,
                            numpositions, closingdate, postingdate, cname, location
                    FROM job INNER JOIN company ON job.companyid = company.companyid