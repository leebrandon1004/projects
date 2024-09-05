--Question 1
create or replace function ClassEnrollmentNo
(p_CLASSNAME IN varchar2 := (35))
return NUMBER
as
    v_number_of_students NUMBER := 0;
begin

    select count(*)
        into v_number_of_students 
    from student
    inner join class
    on student.classno = class.classno
    where upper(CLASSNAME) = trim(upper(p_CLASSNAME));

    return v_number_of_students;
end ClassEnrollmentNo;
/

Declare 
    Students NUMBER;
    ClassNo VARCHAR2(100) := 'Intro Civ';
Begin
    Students := ClassEnrollmentNo(ClassNo);
    dbms_output.put_line('Total number of students at the current class name are: ' || Students);
End;
/

--Question 2
CREATE OR REPLACE PROCEDURE MinMaxGPA 
  (p_CLASSNAME           IN class.CLASSNAME%TYPE,
   maxStudentGPA         OUT student.GPA%TYPE,
   minStudentGPA         OUT student.GPA%TYPE)
IS
BEGIN
   select MAX(GPA),MIN(GPA)
       into   maxStudentGPA,minStudentGPA
       from STUDENT  
       WHERE classno=(SELECT CLASSNO FROM CLASS WHERE LOWER(CLASSNAME)=LOWER(p_CLASSNAME));
 END MinMaxGPA;
/

DECLARE
    maxgpa NUMBER(7,2);
    mingpa NUMBER(7,2);
BEGIN
    MinMaxGPA('Intro Civ',maxStudentGPA=>maxgpa,minStudentGPA=>mingpa); 
    DBMS_OUTPUT.PUT_LINE('The maximum GPA in this class is: ' || maxgpa);
    DBMS_OUTPUT.PUT_LINE('The minimum GPA in this class is: ' || mingpa);
END;
/

--Question 3
CREATE OR REPLACE PROCEDURE StudentWithGivenGPA 
  (p_CLASSNAME           IN class.CLASSNAME%TYPE,
   GPA1                   IN student.GPA%TYPE
   )
IS
BEGIN
FOR t IN (
     select LASTNAME
       from STUDENT  WHERE STUDENT.gpa = GPA1 AND  classno=(SELECT CLASSNO FROM CLASS WHERE  LOWER(CLASSNAME)=LOWER(p_CLASSNAME))
       )
	loop
      DBMS_OUTPUT.put_line ('The student with the given class name and gpa is: ' || t.LASTNAME); 
   END loop;
 EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.put_line ('No student with given classname and gpa found');
 END StudentWithGivenGPA;
/

BEGIN
  StudentWithGivenGPA('Intro Civ',2.2); 
 END;
/

--Question 4
CREATE OR REPLACE PROCEDURE ClassEnrollmentReport 
  (
  p_CLASSNAME           IN class.CLASSNAME%TYPE
 )
IS
stud_count NUMBER:=0;
gpa1 NUMBER(7,2):=0;
mingpa NUMBER(7,2):=0;
maxgpa NUMBER(7,2):=0;
BEGIN
stud_count:=CLASSENROLLMENTNO(p_CLASSNAME);
      DBMS_OUTPUT.put_line ('Number of Students Enrolled: ' || stud_count); 
 IF (stud_count=1) THEN
 SELECT GPA INTO gpa1 FROM student WHERE classno=(SELECT CLASSNO FROM CLASS WHERE  LOWER(CLASSNAME)=LOWER(p_CLASSNAME));
END IF;
 CASE WHEN stud_count = 0 THEN DBMS_OUTPUT.PUT_LINE('No Student in the class');
 WHEN stud_count = 1 THEN
    CASE WHEN gpa1>3.0 THEN dbms_output.put_line('There is 1 student with gpa more than 3.0');
    ELSE
    dbms_output.put_line('There is 1 student with gpa less than 3.0');
    END CASE;
  ELSE
     MinMaxGPA(p_CLASSNAME,maxStudentGPA=>maxgpa,minStudentGPA=>mingpa);
    StudentWithGivenGPA(p_CLASSNAME,maxgpa);
   StudentWithGivenGPA(p_CLASSNAME,mingpa);
END CASE;
 END ClassEnrollmentReport;

BEGIN
  ClassEnrollmentReport('Technical Writing'); 
 END;
/

--Question 5
(select firstname || ' '|| lastname AS Person_of_Interest, homephone, 
    nvl(emailaddr, 'Empty email'), 'Eagle Electronics' as Employer, StreetAddress    --COLUMN name was wrong (actual - streetaddress, given - streeetadress)
    from employee  -- actual TABLE name IS employee NOT employees
    where jobtitle = 'Assembly'  and substr(homephone,1,3) != 919) --actual COLUMN name IS homephone NOT phone
UNION
(select custfirstname || ' '|| custlastname AS Person_of_Interest, phone, 
    nvl(emailaddr, 'Empty email'), companyname, address   --COLUMN name IS companyname NOT compayname, FUNCTION IS nvl NOT nl
    from customer
    where (companyname is not null and address like 'Rd.'  and state in ('OH', 'IN', 'MI', 'KY', 'ND'))  or substr(phone,1,3) = 898 and state = 'CT'  and substr(phone,-1,1) != substr(fax,-1,1));
