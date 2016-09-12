
/*
META PROCEDURE
*/

SELECT OBJECT_NAME FROM USER_PROCEDURES;
--DROP PROCEDURE HANBIT.INSERTGRADE;
/*
=============== MAJOR ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :전공
=============== MAJOR ===============
*/
--DEF_INSERT_Major
CREATE OR REPLACE PROCEDURE insert_major(sp_title IN Major.title%TYPE) AS 
BEGIN
   INSERT INTO Major(major_seq,title) VALUES(major_seq.nextval,sp_title);
END insert_major;
--EXE_INSERT_MAJOR
EXEC HANBIT.INSERT_MAJOR('전자공학');

--DEF_COUNT_MAJOR
 CREATE OR REPLACE PROCEDURE count_major(
    sp_count OUT NUMBER
    ) AS
    BEGIN
        SELECT COUNT(*) into sp_count FROM Major;
    END count_major;
--EXE_COUNT_MAJOR        
DECLARE
        sp_count NUMBER;
    BEGIN
            count_major(sp_count);
            DBMS_OUTPUT.put_line ('수량:'||sp_count);
    END;
--DEF_FIND_MAJOR
CREATE OR REPLACE PROCEDURE find_major(
    sp_major_seq IN OUT Major.major_seq%TYPE,
    sp_title OUT Major.title%TYPE,
    sp_result out VARCHAR2
    ) AS
    SP_temp_count NUMBER;
    BEGIN
        SELECT COUNT(*) into SP_temp_count from major where major_seq = sp_major_seq;
        IF(SP_temp_count >0)
        THEN
            SELECT 
            major_seq,title
            into sp_major_seq,sp_title
            FROM Major 
            WHERE major_seq =sp_major_seq;
            sp_result :='과목번호:'||sp_major_seq||',과목명'||sp_title;
        ELSE
            sp_result :='전공 과목이 없습니다';
        END IF;
    END find_major;
  --EXE_FIND_MAJOR      
    DECLARE
        sp_major_seq NUMBER:=1000;
        sp_result VARCHAR2(120);
        sp_title VARCHAR2(120);
    BEGIN
            select_major(sp_major_seq,sp_title,sp_result);
            DBMS_OUTPUT.put_line (sp_result);
    END;
      -- all major
CREATE OR REPLACE PROCEDURE all_major(
    sp_result OUT CLOB
) AS
    sp_temp CLOB;
    sp_cnt  NUMBER := 0;
BEGIN
        
    FOR major_rec IN (SELECT m.major_seq
                            ,m.title
                      FROM   major m
                     )
    LOOP
        sp_cnt := sp_cnt + 1;
        IF sp_cnt = 1 THEN
           sp_temp := major_rec.major_seq||'-'||major_rec.title;
           
        ELSE
        
          sp_temp := sp_temp||CHR(10)||
                     major_rec.major_seq||'-'||major_rec.title;
          
        END IF;
    END LOOP;
    
    sp_result := sp_temp;
    
END all_major;
exec all_major();

    DECLARE
    sp_result CLOB;
  BEGIN
    all_major(sp_result);
        DBMS_OUTPUT.put_line(sp_result);
   
    END all_major;
    
--DEF_ALL_MAJOR(URSOR VERSION)
CREATE OR REPLACE PROCEDURE HANBIT.all_major(
    major_cur OUT SYS_REFCURSOR
) IS
BEGIN 
    OPEN major_cur FOR SELECT major_seq,title FROM major;
END all_major;
--EXE_ALL_MAJOR(URSOR VERSION)
DECLARE
  sp_cursor SYS_REFCURSOR;
  sp_major_seq   major.major_seq%TYPE;
  sp_title   Major.title%TYPE;
BEGIN
  all_major (sp_cursor);         
  LOOP 
    FETCH sp_cursor
    INTO  sp_major_seq, sp_title;
    EXIT WHEN sp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(sp_major_seq || ' | ' ||sp_title);
  END LOOP;
  CLOSE sp_cursor;
END;
--DEF_DELETE_MAJOR --
CREATE OR REPLACE PROCEDURE delete_major( sp_major_seq in major.major_seq%TYPE) AS
BEGIN DELETE FROM Major WHERE major_seq=sp_major_seq;END;
BEGIN delete_major(1002);end delete_major;
/*
=============== STUDENT ===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :학생
=======================================
*/
--DEF_INSERT_PROF
CREATE OR REPLACE PROCEDURE insert_prof(
   sp_mem_id IN Member.mem_id%TYPE,
   sp_pw IN member.pw%TYPE,
   sp_name IN Member.name%TYPE,
   sp_gender IN Member.gender%TYPE,
   sp_reg_date IN Member.reg_date%TYPE,
   sp_ssn IN Member.ssn%TYPE,
   sp_email IN Member.email%TYPE,
   sp_profile_img IN Member.profile_img%TYPE,
   sp_role IN Member.role%TYPE,
   sp_phone IN Member.phone%TYPE
) AS 
BEGIN
   INSERT INTO Member(mem_id,pw,name,gender,reg_date,ssn,email,profile_img,role,phone)
   VALUES(sp_mem_id,sp_pw,sp_name,sp_gender,sp_reg_date,sp_ssn,sp_email,sp_profile_img,sp_role,sp_phone);
END insert_prof;
--EXE_INSERT_PROF
EXEC HANBIT.INSERT_PROF('profx1','1','찰스 kang','MALE','2016-05-01','710201-1','charls@gmail.com','default.jpg','PROF','010-4545-1124');
--DEF_COUNT_PROF
 CREATE OR REPLACE PROCEDURE count_prof(
    sp_count OUT NUMBER
    ) AS
    BEGIN
        SELECT COUNT(*) into sp_count FROM member WHERE role='PROF';
    END count_prof;
--EXE_COUNT_PROF        
DECLARE
        sp_count NUMBER;
    BEGIN
            count_prof(sp_count);
            DBMS_OUTPUT.put_line ('수량:'||sp_count);
    END;
--DEF_EXIST_MEMBER_ID
CREATE OR REPLACE PROCEDURE exist_member_id(
sp_mem_id in Member.mem_id%TYPE,
sp_count OUT NUMBER
)AS 
BEGIN SELECT COUNT(*) INTO sp_count FROM Member WHERE mem_id=sp_mem_id; 
END exist_member_id;
--EXE_EXIST_MEMBER_ID
DECLARE sp_mem_id VARCHAR2(30):='hong';sp_count NUMBER;BEGIN exist_member_id(sp_mem_id,sp_count);DBMS_OUTPUT.put_line ('결과값 : '||sp_count); END;   
--DEF_FIND_BY_PROF_ID   
CREATE OR REPLACE PROCEDURE find_by_prof_id(
    sp_prof_id IN OUT Member.mem_id%TYPE,
    sp_prof OUT Member%ROWTYPE
    ) AS BEGIN
        SELECT * into sp_prof from member where mem_id = sp_prof_id AND role='PROF';
    
    END find_by_prof_id;
 --EXE_FIND_BY_PROF_ID      
    DECLARE
        sp_prof_id VARCHAR2(120):='profx';
        sp_prof Member%ROWTYPE;
    BEGIN
            find_by_prof_id(sp_prof_id,sp_prof);
            DBMS_OUTPUT.put_line (sp_prof.name);
    END find_by_prof_id;
--DEF_ALL_PROF(URSOR VERSION)
CREATE OR REPLACE PROCEDURE HANBIT.all_prof(
    prof_cur OUT SYS_REFCURSOR
) IS
BEGIN 
    OPEN prof_cur FOR SELECT * FROM Member WHERE role='PROF';
END all_prof;
--EXE_ALL_PROF(URSOR VERSION)
DECLARE
  sp_cursor SYS_REFCURSOR;
  sp_prof Member%ROWTYPE;
 BEGIN
  all_prof(sp_cursor);         
  LOOP 
    FETCH sp_cursor
    INTO  sp_prof;
    EXIT WHEN sp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(sp_prof.mem_id || ' | ' ||sp_prof.name);
  END LOOP;
  CLOSE sp_cursor;
END;
--DEF_UPDATE_PROF
CREATE OR REPLACE PROCEDURE update_prof(
 sp_prof_id in member.mem_id%TYPE,
 sp_pw in member.pw%TYPE,
 sp_email in member.email%TYPE,
 sp_phone in member.phone%TYPE
 )
 AS
 BEGIN
    UPDATE Member SET pw=sp_pw,email=sp_email,phone=sp_phone WHERE mem_id=sp_prof_id;
 END;
--EXE_UPDATE_PROF
BEGIN update_prof('profx','1','test@test.com','123-1234-1234');end update_major;
-- DEF_DELETE_PROF
 CREATE OR REPLACE PROCEDURE delete_prof(sp_prof_id IN Member.mem_id%TYPE) AS
 BEGIN DELETE FROM Member WHERE mem_id = sp_prof_id; END;
 -- EXE DELETE_PROF
 BEGIN delete_prof('profx'); END;


--DEF_INSERT_STUDENT
CREATE OR REPLACE PROCEDURE insert_student(
   sp_mem_id IN Member.mem_id%TYPE,
   sp_pw IN member.pw%TYPE,
   sp_name IN Member.name%TYPE,
   sp_gender IN Member.gender%TYPE,
   sp_reg_date IN Member.reg_date%TYPE,
   sp_ssn IN Member.ssn%TYPE,
   sp_email IN Member.email%TYPE,
   sp_profile_img IN Member.profile_img%TYPE,
   sp_role IN Member.role%TYPE,
   sp_phone IN Member.phone%TYPE,
   sp_major_seq IN Member.major_seq%TYPE 
) AS 
BEGIN
   INSERT INTO Member(mem_id,pw,name,gender,reg_date,ssn,email,profile_img,role,phone,major_seq)
   VALUES(sp_mem_id,sp_pw,sp_name,sp_gender,sp_reg_date,sp_ssn,sp_email,sp_profile_img,sp_role,sp_phone,sp_major_seq);
END insert_student;
--EXE_INSERT_STUDENT
EXEC HANBIT.INSERT_student('choi','1','홍길동','MALE','2016-05-01','910201-1','reper@gmail.com','default.jpg','STUDENT','010-3619-9284','1000');
--DEF_FIND_BY_ID_MEMBER
CREATE OR REPLACE PROCEDURE find_by_id_member(
    sp_mem_id IN OUT Member.mem_id%TYPE,
    sp_name OUT member.name%TYPE,
    sp_result out VARCHAR2
    ) AS
    SP_temp_count NUMBER;
    BEGIN
        SELECT COUNT(*) into SP_temp_count from member where mem_id = sp_mem_id;
        IF(SP_temp_count >0)
        THEN
            SELECT 
            mem_id,name
            into sp_mem_id,sp_name
            FROM member 
            WHERE mem_id = sp_mem_id;
            sp_result :='아이디:'||sp_mem_id||',회원명:'||sp_name;
        ELSE
            sp_result :='회원이 없습니다';
        END IF;
END find_by_id_member;
--EXE_FIND_BY_ID_MEMBER      
DECLARE
        sp_mem_id VARCHAR2(20):='hong';
        sp_result VARCHAR2(120);
        sp_name VARCHAR2(20);
    BEGIN
            find_by_id_member(sp_mem_id,sp_name,sp_result);
            DBMS_OUTPUT.put_line (sp_result);
END;
--DEF_COUNT_MEMBER
CREATE OR REPLACE PROCEDURE count_member(
    sp_count OUT NUMBER
    ) AS
    BEGIN
        SELECT COUNT(*) into sp_count FROM member;
        END count_member;
--EXE_COUNT_MEMBER       
    DECLARE
        sp_count NUMBER;
    BEGIN
            count_member(sp_count);
            DBMS_OUTPUT.put_line ('회원수:'||sp_count);
    END;
/*
=============== GRADE===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :시험기간 
====================================
*/
--DEF_INSERT_GRADE
CREATE OR REPLACE PROCEDURE insert_grade(
   sp_grade_seq IN Grade.grade_seq%TYPE,
    sp_grade IN Grade.grade%TYPE,
   sp_term IN Grade.term%TYPE,
   sp_mem_id IN Grade.mem_id%TYPE
) AS 
BEGIN
   INSERT INTO Grade(grade_seq,grade,term,mem_id)
   VALUES(sp_grade_seq.NEXTVAL,sp_grade,sp_term,sp_mem_id);
END insert_grade;
--EXE_INSERT_GRADE
EXEC HANBIT.INSERT_GRADE('컴퓨터공학');
/*
=============== QNA===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :질의 응답    게시판
====================================
*/
--DEF_INSERT_QNA
CREATE OR REPLACE PROCEDURE insert_qna(
   sp_art_seq IN Board.art_seq%TYPE,
   sp_category IN Board.category%TYPE,
   sp_title IN Board.title%TYPE,
   sp_reg_date IN Board.reg_date%TYPE,
   sp_content IN Board.content%TYPE,
   sp_mem_id IN Board.mem_id%TYPE
) AS 
BEGIN
   INSERT INTO Board(art_seq,category,title,reg_date,content,mem_id)
   VALUES(sp_art_seq.NEXTVAL,sp_category,sp_title,sp_reg_date,sp_content,sp_mem_id);
END insert_qna;
--EXE_INSERT_QNA
EXEC HANBIT.INSERT_QNA('컴퓨터공학');
/*
=============== NOTICE===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :게시판
====================================
*/
--DEF_INSERT_NOTICE
CREATE OR REPLACE PROCEDURE insert_notice(
   sp_art_seq IN Board.art_seq%TYPE,
   sp_category IN Board.category%TYPE,
   sp_title IN Board.title%TYPE,
   sp_reg_date IN Board.reg_date%TYPE,
   sp_content IN Board.content%TYPE
) AS 
BEGIN
   INSERT INTO Board(art_seq,category,title,reg_date,content)
   VALUES(sp_art_seq.NEXTVAL,sp_category,sp_title,sp_reg_date,sp_content);
END insert_notice;
--EXE_INSERT_NOTICE
EXEC HANBIT.INSERT_NOTICE('컴퓨터공학');
/*
=============== SUBJECT===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :과목
=====================================
*/
--DEF_INSERT_SUBJECT
CREATE OR REPLACE PROCEDURE insert_subject(   
   sp_subj_name IN Subject.subj_name%TYPE,
   sp_mem_id IN Subject.mem_id%TYPE
) AS 
BEGIN
   INSERT INTO Subject(subj_seq,subj_name,mem_id)
   VALUES(subj_seq.NEXTVAL,sp_subj_name,sp_mem_id);
END insert_subject;
--EXE_INSERT_SUBJECT
EXEC HANBIT.INSERT_SUBJECT('컴퓨터공학');
/*
=============== EXAM===============
@AUTHOR :math89@gmail.com
@CREATE DATE: 2016-9-8
@UPDATE DATE: 2016-9-8
@DESC :시험성적
====================================
*/
--DEF_INSERT_EXAM
CREATE OR REPLACE PROCEDURE insert_exam(
   sp_exam_seq IN Exam.exam_seq%TYPE,
   sp_term IN Exam.term%TYPE,
   sp_score IN Exam.score%TYPE,
   sp_subj_seq IN Exam.subj_seq%TYPE,
   sp_mem_id IN Exam.mem_id%TYPE
) AS 
BEGIN
   INSERT INTO Exam(exam_seq,term,score,subj_seq,mem_id)
   VALUES(sp_exam_seq.NEXTVAL,sp_term,sp_score,sp_subj_seq,sp_mem_id);
END insert_exam;
--EXE_INSERT_EXAM
EXEC HANBIT.INSERT_EXAM('컴퓨터공학');

/*
READ PROCEDURE
*/
select * from member;
select * from major;
SET SERVEROUTPUT ON;
BEGIN
 DBMS_OUTPUT.put_LINE ('HELLO WORLD');
 END;
     -- find_by_id_member

/*
UPDATE PROCEDURE
*/
CREATE OR REPLACE PROCEDURE update_major(
 sp_major_seq in major.major_seq%TYPE,
 sp_title IN major.title%TYPE
 )
 AS
 BEGIN
    UPDATE major SET title = sp_title WHERE major_seq=sp_major_seq;
 END;

BEGIN update_major(1002,'경영학부');end update_major;
/*
DELETE PROCEDURE
*/

--DELETE MEMBER --
CREATE OR REPLACE PROCEDURE delete_Member( sp_Mem_id in Member.mem_id%TYPE) AS
BEGIN DELETE FROM Member WHERE Mem_id=sp_mem_id;END;
BEGIN delete_Member(1002);end delete_Member;
   
 
