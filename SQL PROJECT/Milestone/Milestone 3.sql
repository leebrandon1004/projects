/*
Milestone 3 Project
Library Operations Database
Logan Fish: Questions 1, 2, 5. Created Database Structure. 
Ethan Ade: Questions 4, 6, 7
Brandon Lee Questions 3, 8, 9, 10

*/

--Drop Tables before loading here
DROP TABLE ITEM CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE BORROWING CASCADE CONSTRAINTS;
DROP TABLE TRANSACTION CASCADE CONSTRAINTS;
DROP TABLE TRANSACTION_REPORT CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE EVENTS CASCADE CONSTRAINTS;
--Drop Tables before loading here

/*
Library System
*/

/*
Questions Implemented. 
Question 1 - Can you view all the available items?
Question 2 - Can you view all the not available items?
Question 3 Records of Overdue Books/Movies/Items
Question 4 Using a members phone number what is their id #?
Question 5 - How will employees know of events & what's needed?
Question 6 - Can you Lookup recommendations?
Question 7 - Using a members ID what items do they have checked out?
Question 8 Can members be denied?
Question 9 - Can you see inactive members?
Question 10 Can a member be fined for late returns?
*/

CREATE TABLE borrowing (
    borrowing_id  VARCHAR2(10) NOT NULL,
    date_borrowed DATE,
    date_returned DATE,
    item_id       VARCHAR2(10) NOT NULL,
    member_id     VARCHAR2(10) NOT NULL
);

ALTER TABLE borrowing ADD CONSTRAINT borrowing_pk PRIMARY KEY ( borrowing_id );

CREATE TABLE employee (
    employee_id    VARCHAR2(10) NOT NULL,
    employee_fname VARCHAR2(15),
    employee_lname VARCHAR2(15),
    birthday       DATE,
    jobtitle       VARCHAR2(10),
    phonenumber    VARCHAR2(12)
);

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id );

CREATE TABLE events (
    event_id       VARCHAR2(10) NOT NULL,
    eventname      VARCHAR2(25),
    eventdate      DATE,
    eventstarttime VARCHAR2(12),
    eventendtime   VARCHAR2(12),
    employee_id    VARCHAR2(10) NOT NULL,
    item_item_id   VARCHAR2(10) NOT NULL
);

ALTER TABLE events ADD CONSTRAINT events_pk PRIMARY KEY ( event_id );

CREATE TABLE item (
    item_id           VARCHAR2(10) NOT NULL,
    item_title        VARCHAR2(35),
    item_type         VARCHAR2(35),
    item_genre        VARCHAR2(15),
    item_publisher    VARCHAR2(45),
    item_author       VARCHAR2(45),
    item_number       INTEGER,
    item_publish_date DATE
);

ALTER TABLE item ADD CONSTRAINT item_pk PRIMARY KEY ( item_id );

CREATE TABLE member (
    member_id            VARCHAR2(10) NOT NULL,
    member_first_name    VARCHAR2(25),
    member_last_name     VARCHAR2(25),
    gender               VARCHAR2(2),
    member_birthday      DATE,
    member_phone_contact VARCHAR2(12),
    member_email         VARCHAR2(45)
);


ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( member_id );

CREATE TABLE review (
    review_id VARCHAR2(10) NOT NULL,
    review    VARCHAR2(4000),
    item_id   VARCHAR2(10) NOT NULL,
    member_id VARCHAR2(10) NOT NULL
);

ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( review_id );

CREATE TABLE transaction (
    transaction_id   VARCHAR2(10) NOT NULL,
    transaction_name VARCHAR2(15),
    transaction_date DATE,
    borrowing_id     VARCHAR2(10) NOT NULL,
    member_id        VARCHAR2(10) NOT NULL
);

ALTER TABLE transaction ADD CONSTRAINT transaction_pk PRIMARY KEY ( transaction_id );

CREATE TABLE transaction_report (
    report_id      VARCHAR2(10) NOT NULL,
    report_date    DATE,
    transaction_id VARCHAR2(10) NOT NULL,
    borrowing_id   VARCHAR2(10) NOT NULL
);

ALTER TABLE transaction_report ADD CONSTRAINT transaction_report_pk PRIMARY KEY ( report_id );

ALTER TABLE transaction
    ADD CONSTRAINT borrowing_fk FOREIGN KEY ( borrowing_id )
        REFERENCES borrowing ( borrowing_id );

ALTER TABLE borrowing
    ADD CONSTRAINT borrowing_item_fk FOREIGN KEY ( item_id )
        REFERENCES item ( item_id );

ALTER TABLE borrowing
    ADD CONSTRAINT borrowing_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( member_id );

ALTER TABLE events
    ADD CONSTRAINT events_employee_fk FOREIGN KEY ( employee_id )
        REFERENCES employee ( employee_id );

ALTER TABLE events
    ADD CONSTRAINT events_item_fk FOREIGN KEY ( item_item_id )
        REFERENCES item ( item_id );

ALTER TABLE review
    ADD CONSTRAINT review_item_fk FOREIGN KEY ( item_id )
        REFERENCES item ( item_id );

ALTER TABLE review
    ADD CONSTRAINT review_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( member_id );

ALTER TABLE transaction_report
    ADD CONSTRAINT tr_rep_borrowing_fk FOREIGN KEY ( borrowing_id )
        REFERENCES borrowing ( borrowing_id );

ALTER TABLE transaction_report
    ADD CONSTRAINT tr_rep_transaction_fk FOREIGN KEY ( transaction_id )
        REFERENCES transaction ( transaction_id );

ALTER TABLE transaction
    ADD CONSTRAINT transaction_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( member_id );



--Insert data

/*
ITEM TABLE
*/
--INSERT INTO MEMBER values ('member_id' , 'member_first_name' , 'member_last_name', 'member_gender', 'member_birthday', 'member_phone_contact', 'member_email');

/*
ITEM TABLE
*/
--INSERT INTO MEMBER values ('member_id' , 'member_first_name' , 'member_last_name', 'member_gender', 'member_birthday', 'member_phone_contact', 'member_email');
INSERT INTO MEMBER VALUES ('3000000001' , 'John' , 'Stiles', 'M', '02-MAY-2000', '574-855-5141', 'johnStilezzz@gmail.com');
INSERT INTO MEMBER VALUES ('3000000002' , 'Logan' , 'Smith', 'M', '09-NOV-2002', '574-855-5142', 'loganSmithy12@gmail.com');
INSERT INTO MEMBER VALUES ('3000000003' , 'Jacob' , 'Rowe', 'M', '22-JUN-2001', '574-855-5143', 'Jacobrowe3@gmail.com');
INSERT INTO MEMBER VALUES ('3000000004' , 'Samuel' , 'Carson', 'M', '12-JAN-2006', '574-855-5144', 'SamCargo42@gmail.com');
INSERT INTO MEMBER VALUES ('3000000005' , 'Owen' , 'Larson', 'M', '14-JUL-2004', '574-855-5145', 'OwenLarson1@gmail.com');

--SELECT * FROM MEMBER;



/*
ITEM TABLE
--Item Insert layout. 
Book id's start with #10
Movie Id's start with #12
CD's Start with #14
*/
--INSERT INTO ITEM values ('ITEM_ID', 'ITEM_TITLE', 'ITEM_TYPE' , 'ITEM_GENRE', 'ITEM_PUBLISHER', 'ITEM_AUTHOR', 'ITEM_NUMBER' , 'ITEM_PUBLISH_DATE');
INSERT INTO ITEM VALUES ('1000000001', 'The Chow', 'Book', 'Non-Fiction', 'Apple', 'Bill Gates', '5', '10-JUN-2013');
INSERT INTO ITEM VALUES ('1000000002', 'Wall Street', 'Book', 'Fiction', 'Mark Mans', 'Mirror', '3', '07-OCT-2020');
INSERT INTO ITEM VALUES ('1200000001', 'Project X', 'Movie', 'Comedy', 'Rubble', 'Totinos', '2', '03-JAN-2004');
INSERT INTO ITEM VALUES ('1200000002', '50 Shades of Gray', 'Movie', 'Romance', 'Trains', 'Stone Cold Steve Austin', '1', '20-APR-2020');
INSERT INTO ITEM VALUES ('1400000001', 'The Memo', 'CD', 'Hip-Hop', 'Silver Record Labels', 'Lil Peep', '8', '03-JUN-2006');
/*
REVIEWS TABLE
CREATE REVIEWS WITH unique id for review id, 
add a review. up to 4000 characters. 
then pair it with the item_id of the item its reviewing. 
*/
--INSERT INTO REVIEW ('REVIEW_ID', 'REVIEW', 'ITEM_ID');
INSERT INTO REVIEW VALUES ('6000000001', 'Really enjoyed this movie. Great actors!', '1200000002','3000000001');
INSERT INTO REVIEW VALUES ('6000000002', 'Book came damaged!', '1000000002','3000000003');
INSERT INTO REVIEW VALUES ('6000000003', 'The CD was exactly what my kid wanted for his birthday 10/10', '1400000001','3000000003' );
/*
BORROWING TABLE 
MAKE SURE TO USE ITEM_ID AND MEMBER_ID 'S THAT EXSIST. 
*/

--INSERT INTO BORROWING ('BORROWING_ID','DATE_BORROWED','DATE_RETURNE', 'ITEM_ID', 'MEMBER_ID');
INSERT INTO BORROWING VALUES ('1000000001', '04-APR-2022', '16-APR-2022', '1000000001', '3000000002');
INSERT INTO BORROWING VALUES ('1000000002', '13-JAN-2022', NULL, '1200000002', '3000000004');
INSERT INTO BORROWING VALUES ('1000000003', '16-MAR-2022', '24-APR-2022', '1400000001', '3000000003');

/*
TRANSACTION TABLE

*/
--INSERT INTO TRANSACTION ('TRANSACTION_ID','TRANSACTION_NAME', 'TRANSACTION_DATE', 'BORROWING_ID', 'MEMBER_ID');
INSERT INTO TRANSACTION VALUES ('1000000001', 'Borrow Book', '04-APR-2022', '1000000001', '3000000002');
INSERT INTO TRANSACTION VALUES ('1000000002', 'Borrow Movie', '13-JAN-2022', '1000000002', '3000000004');
INSERT INTO TRANSACTION VALUES ('1000000003', 'Borrow CD', '16-MAR-2022', '1000000003', '3000000003');

/*
TRANSACTION_REPORT TABLE

*/
--INSERT INTO TRANSACTION_REPORT( 'REPORT_ID', 'REPORT_DATE', 'TRANSACTION_ID', 'BORROWING_ID');
INSERT INTO TRANSACTION_REPORT VALUES ('1000000001','04-APR-2022','1000000001', '1000000001');
INSERT INTO TRANSACTION_REPORT VALUES ('1000000002','13-JAN-2022','1000000002', '1000000002');
INSERT INTO TRANSACTION_REPORT VALUES ('1000000003','16-MAR-2022','1000000003', '1000000003');


/*
Employee Table
*/
--Insert into employee(EMPLOYEEID, FIRSTNAME, LASTNAME, BIRTHDAY, JOBTITLE, PHONENUMBER)
Insert into EMPLOYEE VALUES('6500000000', 'Miguel', 'Samson', '14-JUN-2004', 'LIBRARIAN', '574-862-4857');
Insert into EMPLOYEE VALUES('6500000001', 'John', 'Dunn', '12-JUN-2003', 'LIBRARIAN', '574-756-3576');
Insert into EMPLOYEE VALUES('6500000002', 'Jack', 'Mike', '11-JUN-2000', 'LIBRARIAN', '574-357-3544');


/*
Events Table
*/
--Insert into Events(event_id, eventname, eventdate, eventstarttime, eventendtime, employee_id, item_item_id)
Insert into Events VALUES('1234567891', 'Party', '14-JUN-2004', '7PM', '9PM', '6500000000', '1000000001');
Insert into Events VALUES('1234567892', 'Book Borrowing', '14-JUN-2004', '7PM', '9PM', '6500000000', '1000000001');
Insert into Events VALUES('1234567893', 'Book Lending', '14-JUN-2004', '7PM', '9PM', '6500000000', '1000000001');


--QUESTION 1 All Available Books and Items. 
DROP PROCEDURE PRINT_AVAILABLEBOOKS;
CREATE OR REPLACE PROCEDURE PRINT_AVAILABLEBOOKS AS

    cITEM_ID ITEM.ITEM_ID%TYPE;
    cITEM_TYPE   ITEM.ITEM_TYPE%TYPE;
    cITEM_TITLE   ITEM.ITEM_TITLE%TYPE;
    cITEM_GENRE  ITEM.ITEM_GENRE%TYPE;
    
    CURSOR all_AVAILABLE IS
    SELECT ITEM_ID,ITEM_TYPE,ITEM_TITLE,ITEM_GENRE
    FROM ITEM
    NATURAL JOIN BORROWING
    WHERE DATE_RETURNED IS NOT NULL;
        
    Current_Available_iTEMS   all_AVAILABLE%rowtype;
        
BEGIN
    OPEN all_AVAILABLE;
    
    FETCH all_AVAILABLE into Current_Available_iTEMS;
    
    WHILE all_AVAILABLE%FOUND LOOP
        DBMS_OUTPUT.PUT (RPAD(Current_Available_iTEMS.ITEM_ID, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_Available_iTEMS.ITEM_TYPE, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_Available_iTEMS.ITEM_TITLE, 15, ' '));
        DBMS_OUTPUT.PUT_LINE(RPAD(Current_Available_iTEMS.ITEM_GENRE, 15, ' '));
        FETCH all_AVAILABLE into Current_Available_iTEMS;
    END LOOP;
    
    CLOSE all_AVAILABLE;
END PRINT_AVAILABLEBOOKS;

EXECUTE PRINT_AVAILABLEBOOKS;

--Question 2 -- All NonAvailable / Checked out Items. 
DROP PROCEDURE PRINT_NONAVAILABLEBOOKS;
CREATE OR REPLACE PROCEDURE PRINT_NONAVAILABLEBOOKS AS

    cITEM_ID ITEM.ITEM_ID%TYPE;
    cITEM_TYPE   ITEM.ITEM_TYPE%TYPE;
    cITEM_TITLE   ITEM.ITEM_TITLE%TYPE;
    cITEM_GENRE  ITEM.ITEM_GENRE%TYPE;
    
    CURSOR all_nonAVAILABLE IS
    SELECT ITEM_ID,ITEM_TYPE,ITEM_TITLE,ITEM_GENRE
    FROM ITEM
    NATURAL JOIN BORROWING
    WHERE DATE_RETURNED IS NULL;
        
    Current_nonAvailable_iTEMS   all_nonAVAILABLE%rowtype;
        
BEGIN
    OPEN all_nonAVAILABLE;
    
    FETCH all_nonAVAILABLE into Current_nonAvailable_iTEMS;
    
    WHILE all_nonAVAILABLE%FOUND LOOP
        DBMS_OUTPUT.PUT (RPAD(Current_nonAvailable_iTEMS.ITEM_ID, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_nonAvailable_iTEMS.ITEM_TYPE, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_nonAvailable_iTEMS.ITEM_TITLE, 15, ' '));
        DBMS_OUTPUT.PUT_LINE(RPAD(Current_nonAvailable_iTEMS.ITEM_GENRE, 15, ' '));
        FETCH all_nonAVAILABLE into Current_nonAvailable_iTEMS;
    END LOOP;
    
    CLOSE all_nonAVAILABLE;
END PRINT_NONAVAILABLEBOOKS;

EXECUTE PRINT_NONAVAILABLEBOOKS;
/

--Question 3 (Package created, Package body contunues in question 8,9,10)
create or replace package M3
is

    function Reminder
    return varchar2;
    
    function validation
    return varchar2;
    
    function dates
    return varchar2;
    
    function FineC
    return varchar2;
    
end M3;

CREATE OR REPLACE PACKAGE BODY M3
IS
function Reminder
    return varchar2
is  
    v_member_id varchar2(10);
    v_borrowed date;
begin
    select member.member_id, date_borrowed
    into v_member_id, v_borrowed
    from member
    inner join borrowing on borrowing.member_id = member.member_id
    where sysdate - date_borrowed > 14;
    
    dbms_output.put_line (v_member_id);
end Reminder;

--Question 4 Completed By Ethan Ade
create or replace procedure member_id_lookup
(p_member_phone_contact varchar2)
as
v_member_id varchar2(12);
begin
select member_id
into v_member_id
from member
where p_member_phone_contact = member_phone_contact;
dbms_output.put_line (v_member_id);
end member_id_lookup;

begin 
member_id_lookup('574-855-5141');
end;


--Question 5 Event Reminder Information. 
DROP PROCEDURE PRINT_EVENTREMINDER;
CREATE OR REPLACE PROCEDURE PRINT_EVENTREMINDER AS

    cEMPLOYEE_ID EVENTS.EMPLOYEE_ID%TYPE;
    cEVENTNAME   EVENTS.EVENTNAME%TYPE;
    cEVENTDATE  EVENTS.EVENTDATE%TYPE;
    cEVENTSTARTTIME  EVENTS.EVENTSTARTTIME%TYPE;
    cEVENTENDTIME  EVENTS.EVENTENDTIME%TYPE;
    cITEM_ITEM_ID  EVENTS.ITEM_ITEM_ID%TYPE;
    
    CURSOR allEvents IS
    SELECT EMPLOYEE_ID,EVENTNAME,EVENTDATE, EVENTSTARTTIME, EVENTENDTIME, ITEM_ITEM_ID
    FROM EVENTS;
        
    Current_Event   allEvents%rowtype;
        
BEGIN
    OPEN allEvents;
    
    FETCH allEvents into Current_Event;
    
    WHILE allEvents%FOUND LOOP
        DBMS_OUTPUT.PUT (RPAD(Current_Event.EMPLOYEE_ID, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_Event.EVENTNAME, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_Event.EVENTDATE, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_Event.EVENTSTARTTIME, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(Current_Event.EVENTENDTIME, 15, ' '));
        DBMS_OUTPUT.PUT_LINE(RPAD(Current_Event.ITEM_ITEM_ID, 15, ' '));
        FETCH allEvents into Current_Event;
    END LOOP;
    
    CLOSE allEvents;
END PRINT_EVENTREMINDER;

EXECUTE PRINT_EVENTREMINDER;


--Question 6 Completed By Ethan Ade
create or replace procedure recommendations_lookup
(p_item_genre in item.item_genre%type)
as

cursor item_recommendation
is
select item_title, item_id, item_type, item_genre from item
where upper(trim(item_genre)) = upper(trim(p_item_genre));

begin

for new_recommendation in item_recommendation loop
dbms_output.put_line(new_recommendation.item_title);
dbms_output.put_line(new_recommendation.item_id);
dbms_output.put_line(new_recommendation.item_type);
dbms_output.put_line(new_recommendation.item_genre);
end loop;
end recommendations_lookup;

--Question 7
create or replace procedure member_checked
(p_member_id in member.member_id%type)
as

cursor checked_out
is
select borrowing_id, b.item_id, i.item_title
from borrowing b inner join item i on b.item_id = i.item_id
where upper(trim(member_id)) = upper(trim(p_member_id));

begin

for all_checked_out in checked_out loop
dbms_output.put_line(all_checked_out.borrowing_id);
dbms_output.put_line(all_checked_out.item_id);
dbms_output.put_line(all_checked_out.item_title);
end loop;
end member_checked;

--Question 8
function validation
    return varchar2
is  
    v_member_id varchar2(10);
    v_first varchar2(25);
    v_last varchar2(25);
    v_phone varchar2(12);
    v_gender varchar2(2);
    v_email varchar2(45);
begin
    select member_id, member_first_name, member_last_name, gender, member_phone_contact, member_email
    into v_member_id, v_first, v_last, v_gender, v_phone, v_email
    from member
    where member_id is null and member_first_name is null and member_last_name is null and 
    gender is null and member_phone_contact is null and member_email is null and 
    not regexp_like (member_email, '^\w+(\.\w+)*+@\w+(\.\w+)+$.') and length(member_id) > 10 and
    length(member_first_name)>25 and length(member_last_name)>25 and length(gender)>2 and 
    length(member_phone_contact)>12 and length(member_email)>45;
    
    dbms_output.put ('These members do not meet membership datatype requirements: ' || v_member_id);
end validation;

--Question 9
function dates
return varchar2
is
    v_lastdate date;
    v_memberid varchar2(10);
begin
    select member.member_id, transaction_date
    into v_memberid, v_lastdate
    from member
    inner join transaction on transaction.member_id = member.member_id
    where (sysdate - transaction_date) > 30;
    
    dbms_output.put ('These members are inactive: ' || v_member_id);
end dates;

--Question 10 Trigger at the end to validate the data
function FineC
    return varchar2
is  
    v_member_id varchar2(10);
    v_borrowed date;
    v_Fine varchar2(10);

begin
    select member.member_id, borrowing.date_borrowed
    into v_member_id, v_borrowed
    from member
    inner join borrowing on borrowing.member_id = member.member_id
    where sysdate - date_borrowed > 14;
    
if sysdate - v_borrowed > 14 then
v_Fine := '$10';
elsif sysdate - v_borrowed > 21 then
v_Fine := '$20';
elsif sysdate - v_borrowed > 29 then
v_Fine := '$30';
else
v_Fine := '$50';
end if;

    dbms_output.put ('These members are fined: ' || v_Fine);
end FineC;
end M3;

--Trigger Validation
create or replace trigger Email_Check
after update on Members
for each row
when (new.emailaddr not like '%.com')
begin
    RAISE_APPLICATION_ERROR(-20000, 'Cannot not update');
end;

create or replace trigger before_Members
before insert on Members
begin
dbms_output.put_line('Trigger fired before inserting data from Members');
end;
create or replace trigger before_row_Members
before insert on Members
for each row
begin
dbms_output.put_line('Trigger fired before inserting a row from Members');
end;
create or replace trigger after_row_Members
after insert on Members
for each row
begin
dbms_output.put_line('Trigger fired after inserting a row from Members');
end;
create or replace trigger after_Members
after insert on Members
begin
dbms_output.put_line('Trigger fired after inserting data from Members');
end;