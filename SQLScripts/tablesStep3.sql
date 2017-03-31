
CREATE TABLE Program(
	ProgramName VARCHAR(50) UNIQUE,
	ProgramCode VARCHAR(3),
	Primary Key (ProgramCode)
);

CREATE TABLE sUser(
	Email VARCHAR(255) UNIQUE,
	Username VARCHAR(20),
	ProgramCode VARCHAR(20),
	Level INTEGER,
	Password VARCHAR(255),
	FName VARCHAR(255),
	LName VARCHAR(255),
	Primary Key (Username),
	Foreign Key (ProgramCode) REFERENCES Program(ProgramCode)
);

CREATE TABLE Moderator(
	Username VARCHAR(20),
	Primary Key (Username),
	Foreign Key (Username) REFERENCES sUser(Username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Admin(
	Username VARCHAR(20),
	Primary Key (Username),
	Foreign Key (Username) REFERENCES sUser(Username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Company(
	CompanyID SERIAL PRIMARY KEY,
	CompanySize INTEGER,
	Location VARCHAR(255),
	CName VARCHAR(255) UNIQUE,
	Password VARCHAR(255)
);

CREATE TABLE Company_Review(
	ReviewID SERIAL,
	Username VARCHAR(20),
	CompanyID INTEGER,
	InterviewExperience TEXT,
	OnTheJobExperience TEXT,
	SalaryExperience TEXT,
	Timestamp DATE,
	CompanyRating INTEGER,
	Primary Key (ReviewID),
	Foreign Key (CompanyID) REFERENCES Company(CompanyID) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign Key (Username) REFERENCES sUser(Username) ON DELETE SET NULL ON UPDATE CASCADE,
	UNIQUE (Username, companyID)
);


CREATE TABLE Job(
	JobID SERIAL,
	JobLevel INTEGER,
	JobName VARCHAR(50),
	CompanyId INTEGER,
	Description TEXT,
	NumPositions INTEGER,
	RateOfPay REAL,
	ClosingDate DATE,
	PostingDate DATE,
	Primary Key (JobID),
	Foreign Key (CompanyId) REFERENCES Company(CompanyId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Job_Approval(
	Approved Bool NOT NULL DEFAULT FALSE,
	JobID INTEGER,
	PRIMARY KEY(JobID),
	FOREIGN KEY(JobID) REFERENCES Job(JobID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Applies_To(
	JobID INTEGER,
	UserID VARCHAR(20),
	TimeStamp DATE,
	PRIMARY KEY(JobID, UserID),
	Foreign Key(JobID) REFERENCES Job(JobID) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign Key(UserID) REFERENCES sUser(Username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Offered_To(
	JobID INTEGER,
	ProgramCode VARCHAR(3),
	PRIMARY KEY(JobID, ProgramCode), -- A Job can be offered to multiple programs (e.g. CSI & SEG)
	Foreign Key (JobID) REFERENCES Job(JobID) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign Key (ProgramCode) REFERENCES Program(ProgramCode) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Resume(
	ResumeID SERIAL,
	VersionNo INTEGER,
	Username VARCHAR(20),
	Resume TEXT,
	Primary Key (ResumeID, VersionNo),
	Foreign Key (Username) REFERENCES sUser(Username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Resume_Review(
	ReviewID       SERIAL,
	ResumeVersion  INTEGER,
	Moderator      VARCHAR(20),
	ResumeID       INTEGER,
	ResumeComments TEXT,
	Primary Key (ReviewId, ResumeId, ResumeVersion),
	Foreign Key (Moderator) REFERENCES Moderator(Username) ON DELETE SET NULL ON UPDATE CASCADE,
	Foreign Key (ResumeID, ResumeVersion) REFERENCES Resume(ResumeID, VersionNo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Resume_Review_Request(
	RequesterID VARCHAR(20),
	ResumeID INTEGER,
	VersionNo INTEGER,
	Primary Key (ResumeId, VersionNo),
	Foreign Key (RequesterID) REFERENCES sUser(Username) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign Key (ResumeID, VersionNo) REFERENCES Resume(ResumeID, VersionNo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Upvote(
	Username VARCHAR(20),
	ReviewID INTEGER,
	Primary Key (Username, ReviewID),
	Foreign Key (Username) REFERENCES sUser(Username) ON DELETE CASCADE ON UPDATE CASCADE,
	Foreign Key (ReviewID) REFERENCES Company_Review(ReviewID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE job_pending_approval(
	jobid INTEGER,
	username VARCHAR(20),
	PRIMARY KEY(jobid, username),
	FOREIGN KEY(jobid) REFERENCES job(jobid) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(username) REFERENCES admin(username) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE new_resume_review_requests(
	resumeid INTEGER,
	versionno INTEGER,
	username VARCHAR(20),
	PRIMARY KEY (resumeid, versionno, username),
	FOREIGN KEY (resumeid, versionno) REFERENCES resume_review_request ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (username) REFERENCES moderator ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE job_notification(
	jobid INTEGER,
	username VARCHAR(20),
	PRIMARY KEY (jobid, username),
	FOREIGN KEY (jobid) REFERENCES job(jobid),
	FOREIGN KEY (username) REFERENCES suser(username)
);

-- Dropping using cascade.
DROP TABLE Program CASCADE;
DROP TABLE sUSER CASCADE;
DROP TABLE Moderator CASCADE;
DROP TABLE Admin CASCADE;
DROP TABLE Company CASCADE;
DROP TABLE Company_Review CASCADE;
DROP TABLE Job CASCADE;
DROP TABLE Applies_To CASCADE;
DROP TABLE Offered_To CASCADE;
DROP TABLE Resume CASCADE;
DROP TABLE Resume_Review CASCADE;
DROP TABLE Resume_Review_Request CASCADE;
DROP TABLE Upvote CASCADE;
DROP TABLE job_approval CASCADE;