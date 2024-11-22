/* Datenbank erstellung */

DROP DATABASE IF EXISTS EduVerseDB;
CREATE DATABASE EduVerseDB;
USE EduVerseDB;

/* Tabellen erstellung */

CREATE TABLE User (
	User_ID int primary key not null AUTO_INCREMENT,
    Name varchar(100) not null,
    username varchar(100) not null,
    email varchar(100) not null,
    Gender varchar(100),
    Birthday DATE,
    password varchar(100) not null
);

create table Course (
	course_id int primary key not null auto_increment,
    course_name varchar(100) not null,
    description varchar(100),
    instructor_id int not null
);

CREATE TABLE Instructors (
	instructor_id int primary key not null auto_increment,
    instructor_name VARCHAR(100) not null,
    specialization VARCHAR(100)
);

CREATE TABLE Students (
	student_id int PRIMARY KEY not null,
    student_name varchar(100) not null,
    email varchar(100) not null,
    age INT
);

create table Enrollment (
	enrollment_id int primary key not null,
    student_id int not null,
    course_id int not null,
    enrollment_date DATE not null
);

create table assignment (
	assignment_id int primary key not null,
    course_id int not null,
    assignment_name varchar(100) not null,
    deadline DATE,
    max_score int,
    creator varchar(100)
);

CREATE TABLE submission (
	submission_id int PRIMARY KEY not null,
    assignment_id int not null,
    student_id int not null,
    submission_date DATE,
    submitted_file VARCHAR(100),
    grading_sub INT
);

CREATE TABLE Department (
	department_id int primary key not null,
    department_name VARCHAR(100) not null
);

CREATE TABLE Material (
	Material_id int primary key not null,
    course_id int not null,
    material_name VARCHAR(100),
    file varchar(100),
    type varchar(100)
);

CREATE TABLE Quiz (
	Quiz_id int primary key not null,
    course_id int not null,
    quiz_name VARCHAR(100) not null,
    duration int,
    quiz_max int
);

CREATE TABLE Quizquestions (
	question_id int primary key not null,
    quiz_id int not null,
    question_text VARCHAR(100)
);

CREATE TABLE Response (
	response_id int primary key not null,
    quiz_id int not null,
    student_id int not null,
    question_id int not null,
    selected_option VARCHAR(100)
);

CREATE TABLE Thread (
	thread_id int primary key not null,
    course_id int not null,
    threat_title VARCHAR(100) not null,
    created_by INT not null
);

CREATE TABLE Replay (
	reply_id int primary key not null,
    thread_id int not null,
    user_id int not null,
    reply_content VARCHAR(100)
);

CREATE TABLE Certificate (
	certificate_id int primary key not null,
	course_id int not null,
    issued_to INT,
    issue_date DATE
);

CREATE TABLE Feedback (
	feedback_id int primary key not null,
    course_id int not null,
    student_id int not null,
    feedback_text VARCHAR(100),
    rating int
);

CREATE TABLE Tutor (
	tutor_id int primary key not null,
	tutor_name VARCHAR(100) not null,
	department_id int not null,
	contact_info VARCHAR(100)
);

CREATE TABLE TutorCourse (
	tuto_course_id int primary key not null,
    tutor_id int not null,
    course_id int not null
);

CREATE TABLE CourseModules (
	module_id int primary key not null,
    course_id int not null,
    module_name VARCHAR(100),
    module_description VARCHAR(100)
);

CREATE TABLE ModuleProgress (
	module_progress_id int primary key not null,
	student_id int not null,
	module_id int not null,
	is_completed BOOLEAN not null
);

CREATE TABLE CourseCertificates (
	course_certificate_id int primary key not null,
    course_id int not null,
    certificate_name VARCHAR(100),
    issued_date DATE
);

CREATE TABLE CourseModuleContents (
	module_content_id int primary key not null,
    module_id int not null,
    content_type VARCHAR(100),
    content_name VARCHAR(100),
    content_link VARCHAR(100)
);

CREATE TABLE Studentcertificate (
	student_certificate_id int primary key not null,
    student_id int not null,
    certificate_id int not null,
    earned_date DATE,
    status VARCHAR(100)
);

CREATE TABLE CourseDiscussion (
	discussion_id int primary key not null,
    course_id int not null,
    discussion_title VARCHAR(100)
);

CREATE TABLE DiscussionComment (
	discussion_comment_id int primary key not null,
    discussion_id int not null,
    user_id int not null,
    comment_content VARCHAR(100)
);

CREATE TABLE CourseTags (
	course_tag_id int primary key not null,
	course_id int not null,
	tag_name VARCHAR(100)
);

CREATE TABLE CourseReview (
	course_review_id int primary key not null,
    course_id int not null,
    student_id int not null,
    rating int,
    review_text VARCHAR(100)
);

CREATE TABLE CourseFeedback (
	course_feedback_id int primary key not null,
    course_id int not null,
    feedback_text VARCHAR(100),
    timestamp TIMESTAMP
);

CREATE TABLE CourseCompetencies (
	course_competency_id int primary key not null,
    course_id int not null,
    competency_name VARCHAR(100)
);

CREATE TABLE StudentCompetencyLevel (
	student_competency_id int primary key not null,
    student_id int not null,
    course_competency_id int not null,
    proficiency_level int
);

CREATE TABLE CourseSession (
	session_id int primary key not null,
    course_id int not null,
    session_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    location VARCHAR(100)
);

CREATE TABLE SessionAttendees (
	attendance_id int primary key not null,
    session_id int not null,
    student_id int not null,
    attendance_status varchar(100)
);

CREATE TABLE CourseAnalytics (
	analytics_id int primary key not null,
    course_id int not null,
    analytics_date DATE,
    page_views int,
    unique_visitors VARCHAR(100)
);

CREATE TABLE StudentProgress (
	progress_id int primary key not null,
    student_id int not null,
    progress_date date,
    completed_modules VARCHAR(100),
    overall_percentage int
);

CREATE TABLE StudentReward (
	reward_id int primary key not null,
    student_id int not null,
    reward_name VARCHAR(100),
    reward_date DATE
);

CREATE TABLE CourseExam (
	exam_id int primary key not null,
    course_id int not null,
    exam_name VARCHAR(100),
    exam_date date
);

CREATE TABLE ExamResults (
	result_id int primary key not null,
    exam_id int not null,
    student_id int not null,
    score int
);

CREATE TABLE CourseProject (
	project_id int primary key not null,
    course_id int not null,
    project_name VARCHAR(100),
    deadline date
);

create TABLE ProjectSubmissions (
	submission_id int primary key not null,
    project_id int not null,
    student_id int not null,
    submission_date date,
    submitted_files VARCHAR(100)
);

CREATE TABLE CourseBilling (
	billing_id int primary key not null,
    course_id int not null,
    billing_date date,
    amount int not null,
    status VARCHAR(100) not null
);

/* Fremdschlüssel zuteilung */

ALTER TABLE Course
ADD CONSTRAINT fk_InstructorID
FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id);

ALTER TABLE Enrollment
ADD CONSTRAINT fk_studentID
FOREIGN KEY (student_id) REFERENCES Students(student_id),
ADD CONSTRAINT fk_CourseID
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE Assignment
ADD CONSTRAINT fk_courseIDD
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE Submission
ADD CONSTRAINT fk_assignmentID
FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id);

ALTER TABLE Submission
ADD CONSTRAINT fk_studentID2
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE material
ADD CONSTRAINT fk_courseidd2
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE quiz
ADD CONSTRAINT fk_courseid2
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE Quizquestions
ADD CONSTRAINT fk_quiz_id3
FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id);

ALTER TABLE response
ADD CONSTRAINT fk_quiz_id2
FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id),
ADD CONSTRAINT fk_student_id3
FOREIGN KEY (student_id) REFERENCES Students(student_id),
ADD CONSTRAINT fk_question_id
FOREIGN KEY (question_id) REFERENCES Quizquestions(quiz_id);

ALTER TABLE Thread
ADD CONSTRAINT fk_course_id6
FOREIGN KEY (course_id) REFERENCES Course(course_id),
ADD CONSTRAINT fk_created_by7
FOREIGN KEY (created_by) REFERENCES User(user_id);

ALTER TABLE Replay
ADD CONSTRAINT fk_thread_id
FOREIGN KEY (thread_id) REFERENCES DiscussionComment(discussion_comment_id),
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE Certificate
ADD CONSTRAINT fk_course_id
FOREIGN KEY (course_id) REFERENCES Course(course_id),
ADD CONSTRAINT fk_issued_to
FOREIGN KEY (issued_to) REFERENCES Students(student_id);

ALTER TABLE Feedback
ADD CONSTRAINT fk_course_id7
FOREIGN KEY (course_id) REFERENCES Course(course_id),
ADD CONSTRAINT fk_student_id
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE Tutor
ADD CONSTRAINT fk_department_id
FOREIGN KEY (department_id) REFERENCES Department(department_id);

ALTER TABLE TutorCourse
ADD CONSTRAINT fk_tutor_id
FOREIGN KEY (tutor_id) REFERENCES Tutor(tutor_id),
ADD CONSTRAINT fk_course_id8
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE CourseModules
ADD CONSTRAINT fk_course_id9
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE ModuleProgress
ADD CONSTRAINT fk_student_id10
FOREIGN KEY (student_id) REFERENCES Students(student_id),
ADD CONSTRAINT fk_module_id
FOREIGN KEY (module_id) REFERENCES CourseModules(module_id);

ALTER TABLE CourseCertificates
ADD CONSTRAINT fk_course_id10
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE CourseModuleContents
ADD CONSTRAINT fk_module_id222
FOREIGN KEY (module_id) REFERENCES Coursemodules(module_id);

ALTER TABLE Studentcertificate
ADD CONSTRAINT fk_student_id11
FOREIGN KEY (student_id) REFERENCES Students(student_id),
ADD CONSTRAINT fk_certificate_id
FOREIGN KEY (certificate_id) REFERENCES Certificate(certificate_id);

ALTER TABLE CourseDiscussion
ADD CONSTRAINT fk_course_id11
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE DiscussionComment
ADD CONSTRAINT fk_discussion_id
FOREIGN KEY (discussion_id) REFERENCES CourseDiscussion(discussion_id),
ADD CONSTRAINT fk_user_id85
FOREIGN KEY (user_id) REFERENCES User(user_id);

ALTER TABLE CourseTags
ADD CONSTRAINT fk_course_id12
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE CourseReview
ADD CONSTRAINT fk_course_id13
FOREIGN KEY (course_id) REFERENCES Course(course_id),
ADD CONSTRAINT fk_student_id13
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE CourseFeedback
ADD CONSTRAINT fk_course_id14
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE CourseCompetencies
ADD CONSTRAINT fk_course_id15
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE StudentCompetencyLevel
ADD CONSTRAINT fk_student_id14
FOREIGN KEY (student_id) REFERENCES Students(student_id),
ADD CONSTRAINT fk_course_competency_id
FOREIGN KEY (course_competency_id) REFERENCES CourseCompetencies(course_competency_id);

ALTER TABLE CourseSession
ADD CONSTRAINT fk_course_id16
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE SessionAttendees
ADD CONSTRAINT fk_session_id
FOREIGN KEY (session_id) REFERENCES CourseSession(session_id),
ADD CONSTRAINT fk_student_id15
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE StudentProgress
ADD CONSTRAINT fk_student_id16
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE StudentReward
ADD CONSTRAINT fk_student_id17
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE CourseExam
ADD CONSTRAINT fk_course_id17
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE ExamResults
ADD CONSTRAINT fk_exam_id
FOREIGN KEY (exam_id) REFERENCES CourseExam(exam_id),
ADD CONSTRAINT fk_student_id18
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE CourseExam
ADD CONSTRAINT fk_course_id18
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE CourseProject
ADD CONSTRAINT fk_course_id19
FOREIGN KEY (course_id) REFERENCES Course(course_id);

ALTER TABLE Projectsubmissions
ADD CONSTRAINT fk_project_id
FOREIGN KEY (project_id) REFERENCES CourseProject(project_id),
ADD CONSTRAINT fk_student_id19
FOREIGN KEY (student_id) REFERENCES Students(student_id);

ALTER TABLE Coursebilling
ADD CONSTRAINT fk_course_id20
FOREIGN KEY (course_id) REFERENCES Course(course_id);

/* Adding Workers */

insert into User
	(Name, username, email, Gender, Birthday, password)
values
	('Sebastian','Sebez','Sebastian@gmail.com','Male','2008-02-03','Ginger!'),
    ('Jamia','Jamish','Jamia@gmail.com','Female','2007-07-22','Yemen!'),
    ('Spender','Spuzer','Spender@gmail.com','Male','2008-02-19','Spark!'),
    ('Cox','Cox','Cox@gmail.com','Male','2008-01-25','Cora!'),
    ('Esteban','Estuber','Esteban@gmail.com','Male','2007-11-29','Ebestu!'),
    ('Norma','Numare','Norma@gmail.com','Female','2007-04-11','Aruma!'),
    ('Ford','Fart','Ford@gmail.com','Male','2008-12-01','Fart!'),
    ('Arlene','Arleenz','Arlene@gmail.com','Female','2007-11-23','Lenua!'),
    ('Webb','Wubbs','Webb@gmail.com','Male','2008-09-18','Buwsa!'),
    ('Keitha','Kethaa','Keitha@gmail.com','Female','2008-05-05','HIsa!'),
    ('Morgan','Margon','Morgan@gmail.com','Female','2007-04-08','marsOn!'),
    ('Juan','Juaon','Juan@gmail.com','Male','2008-10-17','Uanj!'),
    ('Duncan','Dunzan','Duncan@gmail.com','Male','2007-12-30','Donuts!'),
    ('Shaw','Shawz','Shaw@gmail.com','Male','2007-09-02','Suwja!'),
    ('Bryan','Brain','Bryan@gmail.com','Male','2008-05-31','Braeein!'),
    ('Bichsel','Buchsel','Bichsel@gmail.com','Male','2007-03-21','Zesty!'),
    ('Donna','Danno','Donna@gmail.com','Female','2008-07-27','Door!'),
    ('Payne','Punye','Payne@gmail.com','Female','2008-04-14','Plain!'),
    ('Sue','Zue','Sue@gmail.com','Female','2007-05-18','ISueYou!'),
    ('Marc','Ramc','Marc@gmail.com','Male','2008-01-31','Mcdonalds!');
    
insert into Course
	(course_name, description, instructor_id)
values
	('Math','Working on Math','1'),
    ('English','Learn to speak fluent','2'),
    ('Sport','Stay in shape','3'),
    ('German','Learn a new language','4'),
    ('Painting','Learn how to be creativ','5');
    
    insert into Instructors
	(instructor_id, instructor_name, specialization)
values
	('Gerald','Math'),
    ('Jonas','English'),
    ('Mueller','Sport'),
    ('Meir','German'),
    ('Finn','Painting'),
    ('Kuerv','Math'),
    ('Gareld','English'),
    ('Kevin','Sport'),
    ('Sep','German'),
    ('Peter','Painting'),
    ('Kestufa','Math'),
    ('Azma','English'),
    ('Fardule','Sport'),
    ('Sibille','German'),
    ('Meier','Painting'),
    ('Manuela','English'),
    ('Parturi','Sport'),
    ('Josephine','German');