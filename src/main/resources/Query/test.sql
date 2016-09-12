select * from tab;
select * from member;
=======CREATE=======
DROP SEQUENCE grade_seq;
DROP SEQUENCE art_seq;
DROP SEQUENCE subj_seq;
DROP SEQUENCE major_seq;
DROP SEQUENCE exam_seq;
CREATE SEQUENCE grade_seq START with 1000 increment by 1 nocache nocycle;
CREATE SEQUENCE art_seq START with 1000 increment by 1 nocache nocycle;
CREATE SEQUENCE subj_seq START with 1000 increment by 1 nocache nocycle;
CREATE SEQUENCE major_seq START with 1000 increment by 1 nocache nocycle;
CREATE SEQUENCE exam_seq START with 1000 increment by 1 nocache nocycle;
DROP TABLE major CASCADE CONSTRAINT;
CREATE TABLE major(
	major_seq INT CONSTRAINT major_pk PRIMARY KEY,
	title VARCHAR2(20) NOT NULL
);
DROP TABLE Member CASCADE CONSTRAINT;
CREATE TABLE Member(
   mem_id VARCHAR2(20) CONSTRAINT member_pk PRIMARY KEY,
   pw VARCHAR2(20) NOT NULL,
   name VARCHAR2(20) NOT NULL,
   reg_date VARCHAR2(20) NOT NULL,
   ssn VARCHAR2(10) NOT NULL,   
   gender VARCHAR2(10) NOT NULL,   
   role VARCHAR2(10) DEFAULT 'student',   
   email VARCHAR2(20),
   phone VARCHAR2(15) NOT NULL,
   profile_img VARCHAR2(20) DEFAULT 'default.jpg',
   major_seq INT,
   CONSTRAINT gender_ck CHECK (gender IN('MALE','FAMALE')),
   CONSTRAINT major_member_fk FOREIGN KEY (major_seq)
   REFERENCES major(major_seq) on delete CASCADE
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
	category VARCHAR2(20) NOT NULL,
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
	subj_name VARCHAR2(20) NOT NULL,
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
 END;
 
 CREATE OR REPLACE PROCEDURE insertMajor(
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
 END;
 
 exex
 
CREATE OR REPLACE VIEW Major_View AS SELECT 
m.major_seq 	AS major_seq,
m.title 		AS major_title,
u.mem_id		AS mem_id,		
u.pw            AS pw,         
u.name          AS name,       
u.reg_date      AS reg_date,   
u.ssn           AS ssn,      
u.gender        AS gender,     
u.role          AS role,       
u.email         AS email,      
u.phone         AS phone,      
u.profile_img   AS profile_img
FROM Major m, Member u WHERE m.major_seq = u.major_seq;
CREATE OR REPLACE VIEW Grade_View AS SELECT
   u.mem_id AS mem_id,
   u.pw AS pw,
   u.name AS name,
   u.gender AS gender,
   u.reg_date AS reg_date,
   u.ssn AS ssn,
   u.email AS email,
   u.profile_img AS profile_img,
   u.role AS role,
   u.phone AS phone,
   g.grade_seq AS grade_seq,
   g.grade AS grade,
   g.term AS term,
   s.subj_seq AS subj_seq,
   s.subj_name AS subj_name,
   x.exam_seq AS exam_seq,
   x.score AS score
FROM Member u, Grade g, Subject s, Exam x WHERE u.mem_id = g.mem_id AND u.mem_id = s.mem_id AND u.mem_id = x.mem_id;
CREATE OR REPLACE  VIEW Board_View AS SELECT
b.art_seq       AS art_seq,  
b.category      AS category, 
b.title         AS title,    
b.reg_date      AS write_reg_date, 
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
u.profile_img   AS profile_img
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
CREATE sequence seq increment by 1 start with 1000 nocycle;
SELECT SEQUENCE_OWNER, SEQUENCE_NAME FROM DBA_SEQUENCES WHERE SEQUENCE_OWNER = 'HANBIT';
DROP SEQUENCE SEQ;

