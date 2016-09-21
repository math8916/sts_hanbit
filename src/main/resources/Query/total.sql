select * from tab;
select * from major;
select * from member;
=======CREATE=======
DROP SEQUENCE grade_seq;
CREATE SEQUENCE grade_seq START with 1000 increment by 1 nocache nocycle;
DROP SEQUENCE art_seq;
CREATE SEQUENCE art_seq START with 1000 increment by 1 nocache nocycle;
DROP SEQUENCE subj_seq;
CREATE SEQUENCE subj_seq START with 1000 increment by 1 nocache nocycle;
DROP SEQUENCE major_seq;
CREATE SEQUENCE major_seq START with 1000 increment by 1 nocache nocycle;
DROP SEQUENCE exam_seq;
CREATE SEQUENCE exam_seq START with 1000 increment by 1 nocache nocycle;
DROP TABLE major CASCADE CONSTRAINT;
CREATE TABLE major(
	major_seq INT CONSTRAINT major_pk PRIMARY KEY,
	title VARCHAR2(20) NOT NULL UNIQUE
);
DROP TABLE Member CASCADE CONSTRAINT;
CREATE TABLE Member (
   mem_id VARCHAR2(20) CONSTRAINT member_pk PRIMARY KEY,
   pw VARCHAR2(20) NOT NULL,
   name VARCHAR2(20) NOT NULL,
   gender VARCHAR2(10) NOT NULL,
   reg_date VARCHAR2(20) NOT NULL,
   ssn VARCHAR2(10) NOT NULL UNIQUE,
   email VARCHAR2(30),
   profile_img VARCHAR2(100) DEFAULT 'default.jpg',
   role VARCHAR2(10) DEFAULT 'STUDENT',
   phone VARCHAR2(13) NOT NULL UNIQUE,
   major_seq INT,
   CONSTRAINT gender_ck CHECK (gender IN ('MALE','FEMALE')),
   CONSTRAINT major_member_fk FOREIGN KEY (major_seq) REFERENCES Major(major_seq) ON DELETE CASCADE
);
DROP TABLE grade CASCADE CONSTRAINT;
CREATE TABLE grade(
   grade_seq INT CONSTRAINT grade_pk PRIMARY KEY,
   grade VARCHAR2(5) NOT NULL,
   term VARCHAR2(10) NOT NULL,
   mem_id VARCHAR2(20) NOT NULL ,
    CONSTRAINT member_grade_fk FOREIGN KEY (mem_id)
   REFERENCES member(mem_id) on delete CASCADE
);
DROP TABLE board CASCADE CONSTRAINT;
CREATE TABLE board(
	art_seq INT CONSTRAINT board_pk PRIMARY KEY,
	category VARCHAR2(20) NOT NULL UNIQUE,
	title VARCHAR2(20) DEFAULT 'No_title',
	reg_date VARCHAR2(20) NOT NULL,
	content VARCHAR2(50) DEFAULT 'No',
	mem_id VARCHAR2(20),
    CONSTRAINT member_board_fk FOREIGN KEY (mem_id)
   REFERENCES member(mem_id) on delete cascade
);
DROP TABLE subject CASCADE CONSTRAINT;
CREATE TABLE subject(
	subj_seq INT CONSTRAINT subject_pk PRIMARY KEY,
	subj_name VARCHAR2(20) NOT NULL UNIQUE,
	mem_id VARCHAR2(20) NOT NULL,
    CONSTRAINT member_subject_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id) on delete cascade
);

DROP TABLE exam CASCADE CONSTRAINT;
CREATE TABLE exam(
	exam_seq INT CONSTRAINT exam_pk PRIMARY KEY,
	term VARCHAR2(10) NOT NULL,
	score INT DEFALT 0,
	subj_seq INT,
	mem_id VARCHAR2(20),
    CONSTRAINT subject_exam_fk FOREIGN KEY (subj_seq) REFERENCES subject(subj_seq) on delete cascade,
    CONSTRAINT member_exam_fk FOREIGN KEY (mem_id) REFERENCES member(mem_id) on delete cascade
);
 select * from tab;
 
CREATE OR REPLACE PROCEDURE insertMember(
sp_mem_id IN member.mem_id%TYPE,
sp_pw IN member.pw%TYPE,
sp_name IN member.name%TYPE,
sp_reg_date IN member.reg_date%TYPE,
sp_ssn IN member.ssn%TYPE,
sp_gender IN member.gender%TYPE,
sp_role IN member.role%TYPE,
sp_email IN member.email%TYPE,
sp_phone IN member.phone%TYPE,
sp_profile_img IN member.profile_img%TYPE,
sp_major_seq IN member.major_seq%TYPE,
) as
BEGIN

 INSERT INTO Member(mem_id,pw,name,reg_date,ssn,gender,role,email,phone,profile_img,major)
            values(sp_mem_id,sp_pw,sp_name,sp_reg_date,sp_ssn,sp_gender,sp_role,sp_email,sp_phone,sp_profile_img,sp_major_seq)
 END insertMember;
 
 CREATE OR REPLACE PROCEDURE insertMajor(
	sp_major_seq IN major.major_seq%TYPE,
	sp_title IN major.title%TYPE
) as
BEGIN
 INSERT INTO Major(major_seq,sp_title)
            values(sp_major_seq.NEXTVAL,sp_title)
 END insertMajor;
 
 CREATE OR REPLACE PROCEDURE insertGrade(
	sp_grade_seq IN grade.grade_seq%TYPE,
	sp_grade IN grade.grade%TYPE,
	sp_term IN grade.term%TYPE,
	sp_mem_id IN grade.mem_id%TYPE
) as
BEGIN
 INSERT INTO Grade(grade_seq,grade,term,mem_id)
            values(sp_grade_seq,sp_grade,sp_term,sp_mem_id)
 END insertGrade;
 
CREATE OR REPLACE PROCEDURE insertBoard(
	sp_art_seq  IN board.art_seq%TYPE,
	sp_category IN board.category%TYPE,
	sp_title    IN board.title%TYPE,
	sp_reg_date IN board.reg_date%TYPE,
	sp_content  IN board.content%TYPE,
	sp_mem_id   IN board.mem_id%TYPE
	
) as
BEGIN
 INSERT INTO Board(art_seq,category,title,reg_date,content,mem_id)
            values(sp_art_seq,sp_category,sp_title,sp_reg_date,sp_content,sp_mem_id)
 END insertBoard;
 
 CREATE OR REPLACE PROCEDURE insertSubject(
	sp_subj_seq  IN Subject.subj_seq%TYPE,
	sp_subj_name  IN Subject.subj_name%TYPE,
	sp_mem_id  IN Subject.mem_id%TYPE,
		
) as
BEGIN
 INSERT INTO Subject(subj_seq,subj_name,mem_id)
            values(sp_subj_seq,sp_subj_name,sp_mem_id)
 END insertSubject;
 
  CREATE OR REPLACE PROCEDURE insertExam(
	sp_exam_seq  IN Exam.exam_seq%TYPE,
	sp_term  IN Exam.term%TYPE,
	sp_score  IN Exam.score%TYPE,
	sp_subj_seq  IN Exam.subj_seq%TYPE,
	sp_mem_id  IN Exam.mem_id%TYPE
		
) as
BEGIN
 INSERT INTO Exam(exam_seq,term,score,subj_seq,mem_id)
            values(sp_exam_seq,sp_term,sp_score,sp_subj_seq,sp_mem_id)
 END insertExam;
 
CREATE OR REPLACE VIEW Major_View AS SELECT 
m.major_seq 	AS majorSeq,
m.title 		AS majorTitle,
u.mem_id		AS id,		
u.pw            AS pw,         
u.name          AS name,       
u.reg_date      AS regDate,   
u.ssn           AS ssn,      
u.gender        AS gender,     
u.role          AS role,       
u.email         AS email,      
u.phone         AS phone,      
u.profile_img   AS profileImg
FROM Major m, Member u WHERE m.major_seq = u.major_seq;
CREATE OR REPLACE VIEW Grade_View AS SELECT
   u.mem_id AS id,
   u.pw AS pw,
   u.name AS name,
   u.gender AS gender,
   u.reg_date AS regDate,
   u.ssn AS ssn,
   u.email AS email,
   u.profile_img AS profileImg,
   u.role AS role,
   u.phone AS phone,
   g.grade_seq AS gradeSeq,
   g.grade AS grade,
   g.term AS term,
   s.subj_seq AS subjSeq,
   s.subj_name AS subjName,
   x.exam_seq AS examSeq,
   x.score AS score
FROM Member u, Grade g, Subject s, Exam x WHERE u.mem_id = g.mem_id AND u.mem_id = s.mem_id AND u.mem_id = x.mem_id;
CREATE OR REPLACE  VIEW Board_View AS SELECT
b.art_seq       AS artSeq,  
b.category      AS category, 
b.title         AS title,    
b.reg_date      AS writeRegDate, 
b.content       AS content,  
u.mem_id 		AS mem_id,
u.pw            AS pw,         
u.name          AS name,       
u.reg_date      AS reg_date,   
u.ssn           AS ssn,      
u.gender        AS gender,     
u.role          AS role,       
u.email         AS email,      
u.phone         AS phone,      
u.profile_img   AS profileImg
FROM Member u, Board b WHERE u.mem_id = b.mem_id;





DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE GRADE CASCADE CONSTRAINTS;
DROP TABLE SUBJECT CASCADE CONSTRAINTS;
DROP TABLE TEST;
DROP VIEW GRADE_VIEW;
DROP VIEW ACCOUNT_MEMBER;
DROP VIEW GRADE_MEMBER1;
DROP VIEW SUBJECT_MEMBER;




CREATE TABLE subject(
   major varchar2(10),
   subjects varchar2(100),
   id varchar2(20)
);

CREATE TABLE grade(
   seq number CONSTRAINT grade_pk PRIMARY KEY,
   grade varchar2(1),
   java number,
   sql number,
   html number,
   javascript number,
   id varchar2(20),
   CONSTRAINT grade_member_fk FOREIGN KEY (id)
   REFERENCES member(id) on delete cascade
);

CREATE TABLE account(
   id varchar2(20) ,
   account_no number CONSTRAINT bank_pk PRIMARY KEY,
   money number,
   CONSTRAINT bank_member_fk FOREIGN KEY (id)
   REFERENCES member(id) on delete cascade
);




======= insert ========

insert into account(id, account_no, money) values('hong', '123456', '5000');
insert into grade(seq, grade, java, sql, html, javascript, id) values(seq.nextval,'A','50','50','50','50','hong');
insert into subject(subj_seq, major, subjects, id) values(1000, 'test', 'test','hong');
insert into member(id,pw,name,reg_date,ssn,email,phone,profile_img)
values('lee','1','이순신','2016-07-01','800101-1','lee@test.com','010-7143-0222','lee.jpg');
insert into member(id,pw,name,reg_date,ssn,email,phone,profile_img)
values('hong','1','홍길동','2015-07-01','100701-1','hong@test.com','010-7143-0222','hong.jpg');
insert into member(id,pw,name,reg_date,ssn,email,phone,profile_img)
values('you','1','유관순','2014-07-01','010701-4','you@test.com','010-7143-0222','you.jpg');


DROP TABLE member;
DROP TABLE grade;
DROP TABLE subject;
DROP TABLE account;


====== select ========

select * from member;
select * from grade;
select * from account;
select * from subject;
select * from tab;
select * from sysobjects;
CREATE sequence seq increment by 1 start with 1000 nocycle;
SELECT SEQUENCE_OWNER, SEQUENCE_NAME FROM DBA_SEQUENCES WHERE SEQUENCE_OWNER = 'HANBIT';
DROP SEQUENCE SEQ;

INSERT INTO Major(major_seq,sp_title)
exec insertMajor('','컴퓨터공학');