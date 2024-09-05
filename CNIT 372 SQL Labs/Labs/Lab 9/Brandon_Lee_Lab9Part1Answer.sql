--Question 1a
create or replace function number_of_employees
    return number
as
    v_number_of_employees number:=0;
begin
    select count(*)
    into v_number_of_employees
    from employee
    where state = 'CA';
        
    return v_number_of_employees;
end number_of_employees;
/

--Question 1b
create or replace procedure number_of_emails
    (p_company in varchar2)
as
    v_email varchar2(100);
begin
    select count(*)
    into v_email
    from employee
    where company = p_company;

    dbms_output.put_line (v_email);
END number_of_emails;
/

--Question 2a
create or replace procedure average_gpa
    (p_major           IN class.major%TYPE,
    numberofstudent    OUT student.GPA%TYPE,
    averagegpa         OUT student.GPA%TYPE)
as
BEGIN
    select avg(gpa), count(*)
    into averagegpa, numberofstudent
    from student
    where major = p_major;
end average_gpa;
/

--Question 2b
create or replace procedure average_gpa
    (p_major           IN class.major%TYPE,
    numberofstudent    OUT student.GPA%TYPE,
    averagegpa         OUT student.GPA%TYPE,
    maxStudentGPA      OUT student.GPA%TYPE,
    maxStudentName     OUT student.GPA%TYPE)
as
BEGIN
    select avg(gpa), count(*), max(gpa), lastname
    into averagegpa, numberofstudent, maxStudentGPA, maxStudentName
    from student
    where major = p_major
    group by lastname
    having max(gpa) in major;
    
end average_gpa;
/

--Question 3a
create or replace procedure over_age
    (v_age OUT number)
as
begin
    select age
    into v_age
    from student
    where age > 15;
    
end over_age;
/

--Question 3b
create or replace procedure over_age
    (v_age OUT number,
    v_candy OUT varchar2)
as
begin
    select likedcandy
    into v_age
    from student
    where age > 15;
    
end over_age;
/

--Question 4a
create or replace procedure question_four
    (p_orderid in varchar2)
as
    v_orderdate date;
    v_customerid varchar2(100);
    v_areacode varchar2(100);
begin
    select orderdate, customerid, areacode
    into v_orderdate, v_customerid, areacode
    from order
    inner join customer
    on order.customerid = customer.customerid
    where order = p_orderid;
    
END question_four;
/

--Question 4b
create or replace function numberofdays
    return number
as
    v_numberofdays number := 0;
    v_quote varchar2;
begin
    select TO_DATE(orderdate,'DD-MON-YY')-SYSDATE minus_date
    into v_numberofdays
    from dual;
    
    return v_numberofdays;

if v_numberofdays > 365 then
    v_quote := 'this order is from 1 year ago';
    else 
    v_quote := v_numberofdays;
    end if;
    return v_quote;
    
END question_fourb;
/

--Question 5a
create or replace procedure questionfive
    (p_areacode in number)
as 
    v_state varchar(2);
    v_firstname varchar(100);
    v_lastname varchar(100);
begin
    select state, firstname || ' ' || lastname
    into v_state, v_firstname, v_lastname
    from customer
    where areacode = p_areacode and phone like p_areacode||'%';
    
    end questionfive;
/

--Question 5b
create or replace function questionfiveb
    (p_areacode in number)
    return varchar2
as
    v_numberofpeople number := 0;
begin
    select count(*)
    into v_numberofpeople
    from customer
    where lastname = lastname and areacode = p_areacode
    having max(count(customerid) in areacode;
    
end questionfiveb;
/

