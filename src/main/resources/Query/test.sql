--DEF_INSERT_student
CREATE OR REPLACE PROCEDURE insert_student(
   sp_mem_id IN Member.mem_id%TYPE,
   sp_pw IN member.pw%TYPE,
   sp_name IN Member.name%TYPE,
   sp_gender IN Member.gender%TYPE,
   sp_reg_date IN Member.reg_date%TYPE,
   sp_ssn IN Member.ssn%TYPE,
   sp_email IN Member.email%TYPE,
   sp_studentile_img IN Member.studentile_img%TYPE,
   sp_role IN Member.role%TYPE,
   sp_phone IN Member.phone%TYPE
) AS 
BEGIN
   INSERT INTO Member(mem_id,pw,name,gender,reg_date,ssn,email,studentile_img,role,phone)
   VALUES(sp_mem_id,sp_pw,sp_name,sp_gender,sp_reg_date,sp_ssn,sp_email,sp_studentile_img,sp_role,sp_phone);
END insert_student;
--EXE_INSERT_student
EXEC HANBIT.INSERT_student('kim','1','김길동 ','MALE','2016-05-01','700211-1','charls@gmail.com','default.jpg','student','010-4145-1124');
--DEF_COUNT_student
 CREATE OR REPLACE PROCEDURE count_STUDENT(
    sp_count OUT NUMBER
    ) AS
    BEGIN
        SELECT COUNT(*) into sp_count FROM member WHERE role='STUDENT';
    END count_STUDENT;
--EXE_COUNT_student        
DECLARE
        sp_count NUMBER;
    BEGIN
            count_student(sp_count);
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
--DEF_FIND_BY_STUDENT_ID   
CREATE OR REPLACE PROCEDURE find_by_STUDENT_id(
    sp_STUDENT_id IN OUT Member.mem_id%TYPE,
    sp_STUDENT OUT Member%ROWTYPE
    ) AS BEGIN
        SELECT * into sp_STUDENT from member where mem_id = sp_STUDENT_id AND role='STUDENT';
    
    END find_by_STUDENT_id;
 --EXE_FIND_BY_student_ID      
    DECLARE
        sp_student_id VARCHAR2(120):='studentx';
        sp_student Member%ROWTYPE;
    BEGIN
            find_by_student_id(sp_student_id,sp_student);
            DBMS_OUTPUT.put_line (sp_student.name);
    END find_by_student_id;
--DEF_ALL_student(URSOR VERSION)
CREATE OR REPLACE PROCEDURE HANBIT.all_student(
    student_cur OUT SYS_REFCURSOR
) IS
BEGIN 
    OPEN student_cur FOR SELECT * FROM Member WHERE role='student';
END all_student;
--EXE_ALL_student(URSOR VERSION)
DECLARE
  sp_cursor SYS_REFCURSOR;
  sp_student Member%ROWTYPE;
 BEGIN
  all_student(sp_cursor);         
  LOOP 
    FETCH sp_cursor
    INTO  sp_student;
    EXIT WHEN sp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(sp_student.mem_id || ' | ' ||sp_student.name);
  END LOOP;
  CLOSE sp_cursor;
END;
--DEF_UPDATE_student
CREATE OR REPLACE PROCEDURE update_student(
 sp_student_id in member.mem_id%TYPE,
 sp_pw in member.pw%TYPE,
 sp_email in member.email%TYPE,
 sp_phone in member.phone%TYPE
 )
 AS
 BEGIN
    UPDATE Member SET pw=sp_pw,email=sp_email,phone=sp_phone WHERE mem_id=sp_student_id;
 END;
--EXE_UPDATE_student
BEGIN update_student('hong','1','test@test.com','123-1234-1234');end update_major;
-- DEF_DELETE_student
 CREATE OR REPLACE PROCEDURE delete_student(sp_student_id IN Member.mem_id%TYPE) AS
 BEGIN DELETE FROM Member WHERE mem_id = sp_student_id; END;
 -- EXE DELETE_student
 BEGIN delete_student('hong'); END;
