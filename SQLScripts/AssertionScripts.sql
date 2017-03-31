-- ASSERTION There must be at least ONE admin
CREATE FUNCTION "Proj".restrict_last_admin_delete() RETURNS TRIGGER AS
$BODY$
BEGIN
  IF ((SELECT COUNT(*) FROM "Proj".admin) = 1) THEN
    RAISE EXCEPTION 'Error removing admin. There must be at least 1 admin in the system!';
  END IF;
  RETURN NULL;
END;
$BODY$ LANGUAGE PLPGSQL;

CREATE TRIGGER restrict_admin_delete_trigger BEFORE
DELETE ON "Proj".admin EXECUTE PROCEDURE "Proj".restrict_last_admin_delete();

-- ASSERTION There must be at least ONE moderator
CREATE FUNCTION "Proj".restrict_last_moderator_delete() RETURNS TRIGGER AS
$BODY$
BEGIN
  IF ((SELECT COUNT(*) FROM "Proj".moderator) = 1) THEN
    RAISE EXCEPTION 'Error removing admin. There must be at least 1 admin in the system!';
  END IF;
  RETURN NULL;
END;
$BODY$ LANGUAGE PLPGSQL;

CREATE TRIGGER restrict_moderator_delete_trigger BEFORE
DELETE ON "Proj".moderator EXECUTE PROCEDURE "Proj".restrict_last_moderator_delete();

