--CNIT 372
--Homework 3

--QUESTION 0A
create table HW3_ZIPCODE (
zipcode VARCHAR(100),
state VARCHAR(100),
city VARCHAR(100),
latitude INT,
longitude INT,
updated DATE
);

--QUESTION 0B
--Right click HW3_ZIPCODE table and select import data
--Select browse, then select the file you wish you upload, next
--Update row limit, next, next
--Make sure to select the correct target for the source data, next, finish
--Now run the code it writes for you
--Each line of code will look like this INSERT INTO HW3_ZIPCODE (ZIPCODE, STATE, CITY, LATITUDE, LONGITUDE, UPDATED) VALUES ('67123','KS','POTWIN',97.000608,37.971872,to_date('5/1/1990 12:00:00 AM'));

--QUESTION 0C
SELECT ZIPCODE, COUNT(*) FROM HW3_ZIPCODE GROUP BY ZIPCODE HAVING COUNT(*)>1;

--QUESTION 0D
SELECT POSTALCODE FROM EMPLOYEE WHERE EMAILADDR LIKE'%eagle.com'
UNION
SELECT POSTALCODE FROM CUSTOMER
UNION
SELECT POSTALCODE FROM SUPPLIER
UNION
SELECT ZIPCODE FROM HW3_ZIPCODE
;

--QUESTION 0E
--Right click HW3_ZIPCODE table and select import data
--Select browse, then select the file you wish you upload, next
--Update row limit, next, next
--Make sure to select the correct target for the source data, next, finish
--Now run the code it writes for you
--Each line of code will look like this INSERT INTO HW3_ZIPCODE (ZIPCODE, STATE, CITY, LATITUDE, LONGITUDE, UPDATED) VALUES ('67123','KS','POTWIN',97.000608,37.971872,to_date('5/1/1990 12:00:00 AM'));

--QUESTION 0F
SELECT ZIPCODE FROM HW3_ZIPCODE
UNION
SELECT POSTALCODE FROM EMPLOYEE WHERE EMAILADDR LIKE'%eagle.com'
UNION
SELECT POSTALCODE FROM CUSTOMER
UNION
SELECT POSTALCODE FROM SUPPLIER
;

--Question 1
create or replace package HW03
is

    FUNCTION KM_TO_MILES(
        p_km NUMBER)
    RETURN NUMBER;

    FUNCTION DISTANCE_BETWEEN_ZIPS(
        p_zipcode1 NUMBER,
        p_zipcode2 NUMBER)
    RETURN NUMBER;
    
end HW03;
/

--Question 1
CREATE OR REPLACE PACKAGE BODY HW03
IS

function DEGREES_TO_RADIANS
(p_degrees number) 
return number 
is
    l_result number;
begin
    l_result := p_degrees/57.29577951;
    return l_result;
    
end DEGREES_TO_RADIANS;

--Question 2
function KM_TO_MILES
(p_km number) 
return number 
is
    l_result number;
begin
    l_result := p_km * (1/1.609344);
    return l_result;
    
end KM_TO_MILES;

--Question 3
function DISTANCE_BETWEEN_ZIPS
    (p_zipcode1 number,
    p_zipcode2 number)
    return number
is
    p_distance number;
    Lat1 number;
    Lon1 number;
    Lat2 number;
    Lon2 number;
    Radius number;
    delta_phi number;
    delta_lambda number;
    phi_1 number;
    phi_2 number;
    a number;
    c number;
begin
    select latitude, longitude
    into lat1, lon1
    from hw3_zipcode
    where zipcode = p_zipcode1;
    
    select latitude, longitude
    into lat2, lon2
    from hw3_zipcode
    where zipcode = p_zipcode2;
    
    Radius := 6371000;
    phi_1:=DEGREES_TO_RADIANS(lat1);
    phi_2:=DEGREES_TO_RADIANS(lat2);
    delta_phi:=DEGREES_TO_RADIANS(lat2-lat1);
    delta_lambda:=DEGREES_TO_RADIANS(lon2-lon1);
/*
Formula: a = sin²(?B - ?A/2) + cos ?A * cos ?B * sin²(?B - ?A/2)
c = 2 * atan2( ?a, ?(1?a) )
d = R ? c
*/

    a := power(sin(delta_phi/2),2)+ cos(phi_1) * cos(phi_2) * power(sin(delta_lambda/2),2);
    c := 2*atan2(sqrt(a),sqrt(1-a));
    
    p_distance:= (radius *c)/1000;

    if select zipcode != p_zipcode1 or zipcode != p_zipcode2 then
    dbms_output.put_line('-1');
    end if;
    
exception
    when others then
        dbms_output.put(SQLCODE);
        dbms_output.put(': ');
        dbms_output.put_line(substr(SQLERRM, 1, 1000));
        
end DISTANCE_BETWEEN_ZIPS;

--question 4
FUNCTION DISTANCE_BETWEEN_ZIPS (p_zip IN VARCHAR2)
    RETURN NUMBER
    AS
        v_roe NUMBER := 6371; --Radius of Earth in km
        v_distance NUMBER(10,3) := 0;
        lat1 NUMBER := 0;
        lat2 NUMBER := 0;
        lon1 NUMBER := 0;
        lon2 NUMBER := 0;
        v_arc NUMBER := 0;
        dlat NUMBER := 0;
        dlon NUMBER := 0;
    BEGIN
        SELECT LATITUDE INTO lat1 FROM HW2_Q1_ZIPCODE WHERE ZIPCODE = p_zip;
        SELECT LONGITUDE INTO lon1 FROM HW2_Q1_ZIPCODE WHERE ZIPCODE = p_zip;
        SELECT LATITUDE INTO lat2 FROM HW2_Q1_ZIPCODE WHERE ZIPCODE = 33605;
        SELECT LONGITUDE INTO lon2 FROM HW2_Q1_ZIPCODE WHERE ZIPCODE = 33605;
    
        lat1 := DEGREES_TO_RADIANS(lat1);
        lat2 := DEGREES_TO_RADIANS(lat2);
        lon1 := DEGREES_TO_RADIANS(lon1);
        lon2 := DEGREES_TO_RADIANS(lon2);
        
        dlat := lat2 - lat1;
        dlon := lon2 - lon1;
        
        v_arc := (sin(dlat/2) * sin(dlat/2)) + (cos(lat1) * cos(lat2) * (sin(dlon/2) * sin(dlon/2)));
        v_distance := v_roe * 2 * ATAN2(sqrt(v_arc), sqrt((1 - v_arc)));
    
        RETURN v_distance;
    
        EXCEPTION
            WHEN no_data_found THEN
                RETURN -1;
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE (SQLCODE || ': ' || SUBSTR(SQLERRM, 1, 100));

    END DISTANCE_BETWEEN_ZIPS;
    
-- Question 5
procedure POI_WITHIN_DISTANCE (
p_dis IN NUMBER
)
IS

BEGIN
    select lastname ||', '|| firstname as Name, city, p_dis into customer_dis from customer where KM_TO_MILES(DISTANCE_BETWEEN_ZIPS) <= p_dis AND KM_TO_MILES(DISTANCE_BETWEEN_ZIPS) >= 0;
    select lastname ||', '|| firstname as Name, companyname, city, p_dis into employee_dis from employee where KM_TO_MILES(DISTANCE_BETWEEN_ZIPS) <= p_dis AND KM_TO_MILES(DISTANCE_BETWEEN_ZIPS) >= 0;
    select lastname ||', '|| firstname as Name, suppliername, city, p_dis into supplier_dis from supplier where KM_TO_MILES(DISTANCE_BETWEEN_ZIPS) <= p_dis AND KM_TO_MILES(DISTANCE_BETWEEN_ZIPS) >= 0;
    
    EXCEPTION
        WHEN no_data_found THEN
            RETURN -1;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE (SQLCODE || ': ' || SUBSTR(SQLERRM, 1, 100));
END POI_WITHIN_DISTANCE;

DECLARE 
    customer_dis NUMBER := 0;
    employee_dis NUMBER := 0;
    supplier_dis NUMBER := 0;
begin
    POI_WITHIN_DISTANCE (p_dis);
end;

--question 6
FUNCTION POI_DENSITY (p_dis IN NUMBER)
    RETURN NUMBER
    AS
    v_count_c NUMBER := 0;
    v_count_e NUMBER := 0;
    v_count_s NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_count_c FROM CUSTOMER WHERE KM_TO_MILES(DISTANCE_BETWEEN_ZIPS(POSTALCODE)) <= p_dis AND KM_TO_MILES(DISTANCE_BETWEEN_ZIPS(POSTALCODE)) >= 0;
    SELECT COUNT(*) INTO v_count_e FROM EMPLOYEE WHERE KM_TO_MILES(DISTANCE_BETWEEN_ZIPS(POSTALCODE)) <= p_dis AND KM_TO_MILES(DISTANCE_BETWEEN_ZIPS(POSTALCODE)) >= 0;
    SELECT COUNT(*) INTO v_count_s FROM SUPPLIER WHERE KM_TO_MILES(DISTANCE_BETWEEN_ZIPS(POSTALCODE)) <= p_dis AND KM_TO_MILES(DISTANCE_BETWEEN_ZIPS(POSTALCODE)) >= 0;
    
    RETURN v_count_c + v_count_e + v_count_s;
    
    EXCEPTION
        WHEN no_data_found THEN
            RETURN -1;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE (SQLCODE || ': ' || SUBSTR(SQLERRM, 1, 100));
END POI_DENSITY;
end HW03;

-- Question 7
/* Usually most procedures and functions that we have created in this class are public by default, but there
are instances where procedures or functions will be private based on how users have defined the package. In 
this case, any public procedures/functions will be publicly accessible to the user, but a privately accessible 
function/procedure is hidden from the user. The degree_to_radians function is only internally accessible, so only
when a user is within the HW03 package, and this is because it is used again in question 3 to create the function
DISTANCE_BETWEEN_ZIPS. This publicly accessible DISTANCE_BETWEEN_ZIPS function is then used for several other 
functions/procedures whereas the degree_to_radians function is not used again in the package. 
*/

/* Question 8
GRANT EXECUTE ON HW03 TO ebecerra;
Explanation: In order to run the package, the grant on privileges must be on the HW03 package to make another user run the referenced package.

Source: https://docs.oracle.com/database/121/TTPLS/accesscntl.htm#TTPLS269
*/


/* Question 9
Error starting at line : 71 in command -
CREATE OR REPLACE PACKAGE BODY HW03
IS

function DEGREES_TO_RADIANS
(p_degrees number) 
return number 
is
    l_result number;
begin
    l_result := p_degrees/57.29577951;
    return l_result;
    
end DEGREES_TO_RADIANS;
Error report -
ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges

Public packages are accessible with other users who are not owners of the schema but for private functions, they are not accessible for other users. 
*/

/* QUESTION 10
As a database owner you can run the procedures or functions of the packages public this, this is beacuse anyone can access them publicly.
As a database owner you can run the procedures or funcitons of the packages privately.  
This is because as an owner you have full permission in that database. 
As the database owner, if a user created a private function or procedure you could look for it in the query adminstration.
This will also allow you to run the code.
*/