
INSERT INTO PROGRAM VALUES
	('Software Engineering', 'SEG'),
	('Computer Science', 'CSI'),
	('Mechanical Engineering', 'MCG'),
	('Civil Engineering', 'CVG')
;

INSERT INTO sUser VALUES
	('tsmit094@uottawa.ca', 'tsmit094', 'CSI', 3, 'passw0rd', 'Timothy', 'Smith'),
	('leule089@uottawa.ca', 'leule089', 'SEG', 4, 'passw0rd', 'Leonard', 'Euler'),
	('cgauss099@uottawa.ca', 'cgauss099', 'CVG', 1, 'passw0rd', 'Charles', 'Gauss'),
	('alkhwa055@uottawa.ca', 'alkhwa055', 'MCG', 4, 'passw0rd', 'Al', 'Khwarizmi')
;

INSERT INTO Moderator VALUES
	('tsmit094');

INSERT INTO Admin VALUES
	('leule089');

INSERT INTO Company(CompanySize, Location, Rating, Cname, Password) VALUES
	(1000, 'Ottawa', -1, 'Shopify', 'passw0rd'),
	(250, 'Ottawa', -1, 'Kinaxis', 'passw0rd'),
	(10000, 'Google', -1, 'Silicon Valley', 'passw0rd')
;

INSERT INTO Company_Review VALUES
	(1, 'tsmit094', 1, 
		'Interviews took way too long and I didn''t even know I had the job until my last day of exams. I felt they 
		could have let me know a bit sooner',
		'On the job experience was really great. Everyone was helping me to succeed and I felt I could ask as many questions 
		as I needed to accomplish my work. 10/10 would definitely recomment',
		'Salary was nothing spectacular but was definitely better than my friends who got jobs through FSWEP for the summer',
	current_date)
;

INSERT INTO Job(joblevel, jobname, companyid, description, numpositions,rateofpay,closingdate,postingdate) VALUES
	(1, 'Frontend Developer', 1, 'Develop for the frontend!', 3, 8001, current_date+10, current_date),
	(2, 'Quality Assurance Engineer', 3, 'Assure the quality through engineering!', 1, 5000, current_date+10, current_date),
	(3, 'Risk Analyst', 2, 'Analyze the risk!', 2, 10000, current_date+10, current_date);

INSERT INTO Applies_to VALUES
	(1, 'leule089', current_date),
	(1, 'cgauss099', current_date),
	(2, 'tsmit094', current_date)
;

INSERT INTO Offered_to VALUES
	(1, 'CSI'),
	(2, 'MCG'),
	(3, 'SEG')
;

INSERT INTO Resume VALUES
	(1, 1, 'tsmit094', 'It''s a resume'),
	(2, 1, 'leule089', 'Experience: None'),
	(3, 1, 'cgauss099', 'Experience: Some'),
	(4, 1, 'alkhwa055', 'Proven gogetter with management potential'),
	(1, 2, 'tsmit094', 'workyworkwork')
;

INSERT INTO Resume_Review VALUES
	(1, 1, 'tsmit094', 2, 'Bad resume, work harder better faster stronger technologic.');

INSERT INTO Resume_Review_Request VALUES
	('tsmit094', 1, 2),
	('leule089', 2, 1);

INSERT INTO Upvote VALUES
	('leule089', 1),
	('cgauss099', 1),
	('alkhwa055', 1)
;