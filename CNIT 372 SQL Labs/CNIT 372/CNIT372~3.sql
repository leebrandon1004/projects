CREATE OR REPLACE FUNCTION ClassEnrollmentNo
(p_CLASSNAME IN VARCHAR2 := 100)
return NUMBER

AS
studentnum NUMBER:=0;

BEGIN
SELECT COUNT(*)
INTO studentnum
FROM CLASS
WHERE UPPER(classname) = TRIM(UPPER(p_classname));

RETURN studentnum;

END classenrollmentno;





CREATE OR REPLACE PROCEDURE MinMaxGPA
(p_CLASSNAME IN VARCHAR2 := 100,
maxStudent OUT NUMBER,
minStudent OUT NUMBER)
AS
StudentName VARCHAR2(100);

BEGIN
select Lastname, max(GPA), min(GPA)
into StudentName, maxStudent, minStudent
from STUDENT
inner join class
on student.classno = class.classno
where classname = p_CLASSNAME AND Lastname = StudentName;

dbms_output.put_line('Max GPA: ' || maxStudent);
dbms_output.put_line('Max GPA: ' || minStudent);

end;

execute MinMaxGPA;









CREATE OR REPLACE PROCEDURE classenrollmentreport
(p_CLASSNAME IN VARCHAR2:=50)

AS
studentnum NUMBER:=0;
NoStudent NUMBER;
OneStudent Number;
MorethanOne Number;

BEGIN
SELECT COUNT(*)
INTO studentnum
FROM CLASS
WHERE LOWER(classname) = TRIM(LOWER(p_CLASSNAME));

CASE
WHEN studentnum < 1;
WHEN studentnum =1;
WHEN studentnum = 0;
ELSE
END CASE;

dbms_output.put_line('There are no students in class' || );
dbms_output.put_line('there is one student in class');
dbms_output.put_line('There are more than 1 student in class');

END;

