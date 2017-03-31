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

-- TRIGGER Populates the job_pending_approval table with the cross product of the new jobid and all admins
-- Strategy: When an admin receives a notification after logging on, the notificaitons for that
-- specific jobid are destroyed (so admins don't end up with 'stale' notifications).
CREATE FUNCTION "Proj".alert_admin_new_job() RETURNS TRIGGER AS
$BODY$
BEGIN
  IF NEW.approved = FALSE THEN
    INSERT INTO "Proj".job_pending_approval (
      SELECT DISTINCT jobid, username FROM "Proj".admin CROSS JOIN "Proj".job_approval WHERE jobid = NEW.jobid);
  END IF;
  RETURN NULL;
END;
$BODY$ LANGUAGE PLPGSQL;

CREATE TRIGGER alert_admin_new_job_trigger AFTER
INSERT ON "Proj".job_approval
FOR ROW
EXECUTE PROCEDURE "Proj".alert_admin_new_job();

-- TRIGGER This is the second part of the above trigger. It allows the removal of
-- redundant notifications. It is assumed only one admin needs to be notified of this information
CREATE FUNCTION "Proj".remove_redundant_pending_job_alerts() RETURNS TRIGGER AS
$BODY$
BEGIN
  DELETE FROM "Proj".job_pending_approval WHERE "Proj".job_pending_approval.jobid = OLD.jobid;
  RETURN NULL;
END;

$BODY$ LANGUAGE PLPGSQL;

CREATE TRIGGER remove_redundant_pending_job_alerts_trigger AFTER
DELETE ON "Proj".job_pending_approval
FOR ROW
EXECUTE PROCEDURE "Proj".remove_redundant_pending_job_alerts();


