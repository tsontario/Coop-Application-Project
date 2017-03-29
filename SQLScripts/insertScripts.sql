
-- Insert a new resume review and return its generated id
INSERT  INTO "Proj".resume_review (reviewid, resumeid, resumeversion, moderator, resumecomments)
VALUES (11, 1, 2, 'tsmit094', 'afdsafdsa')
RETURNING resumeid;