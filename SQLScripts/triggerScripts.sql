-- CREATE TRIGGER which queues notifications of new jobs for users of a given level
create function "Proj".function_job_notification() returns trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW.approved = TRUE
  THEN
    INSERT INTO "Proj".job_notification
      (SELECT DISTINCT jobid, username
       FROM "Proj".suser INNER JOIN "Proj".job ON "Proj".suser.level = "Proj".job.joblevel NATURAL JOIN "Proj".job_approval
       WHERE jobid = NEW.jobid AND "Proj".job_approval.approved = TRUE);
    RETURN NEW;
  END IF;
  RETURN NEW;
END
$$;

CREATE TRIGGER trigger_notify_new_job
AFTER UPDATE ON "Proj".job_approval
FOR ROW
EXECUTE PROCEDURE "Proj".function_job_notification();

