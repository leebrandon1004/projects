-------------------------------------------------------------
-- Question 1a
-- dropping the table if it already exists
DROP TABLE HW1_Q1_CONTACT CASCADE CONSTRAINTS; 

-- createing the table where unique values should be present
create table HW1_Q1_CONTACT(
first_name varchar2(300),
last_name varchar2(300),
city varchar2(250),
state varchar2(250)
); 

/* Following code will insert the data from Customers table from Eagle Database in 4 tables
and then using these tables data will be inserted into our main table HW1_Q1_CONTACT
*/
DECLARE
  TYPE TAB_FIRSTNAME IS TABLE OF VARCHAR2(40);
  TYPE TAB_LASTNAME IS TABLE OF VARCHAR2(40);
  TYPE TAB_CITY IS TABLE OF VARCHAR2(40);
  TYPE TAB_STATE IS TABLE OF VARCHAR2(40);
  V_FNAMES TAB_FIRSTNAME;
  V_LNAMES TAB_LASTNAME;
  V_CITY   TAB_CITY;
  V_STATE  TAB_STATE;
BEGIN

  SELECT DISTINCT CUSTFIRSTNAME BULK COLLECT INTO V_FNAMES FROM CUSTOMER;
  SELECT DISTINCT CUSTLASTNAME BULK COLLECT INTO V_LNAMES FROM CUSTOMER;
  SELECT DISTINCT CITY BULK COLLECT INTO V_CITY FROM CUSTOMER;
  SELECT DISTINCT STATE BULK COLLECT INTO V_STATE FROM CUSTOMER;

  FOR I IN 1 .. 20 LOOP
    FOR J IN 1 .. 50 LOOP
      FOR K IN 1 .. 52 LOOP
        FOR L IN 1 .. 50 LOOP
          INSERT INTO HW1_Q1_CONTACT
            (FIRST_NAME, LAST_NAME, CITY, STATE)
          VALUES
            (V_FNAMES(I), V_LNAMES(J), V_CITY(K), V_STATE(L));
        END LOOP;
      END LOOP;
    END LOOP;
  END LOOP;
  COMMIT;
END;
/
-------
DECLARE
  TYPE TAB_FIRSTNAME IS TABLE OF VARCHAR2(40);
  TYPE TAB_LASTNAME IS TABLE OF VARCHAR2(40);
  TYPE TAB_CITY IS TABLE OF VARCHAR2(40);
  TYPE TAB_STATE IS TABLE OF VARCHAR2(40);
  V_FNAMES TAB_FIRSTNAME;
  V_LNAMES TAB_LASTNAME;
  V_CITY   TAB_CITY;
  V_STATE  TAB_STATE;
BEGIN

  SELECT DISTINCT CUSTFIRSTNAME BULK COLLECT INTO V_FNAMES FROM CUSTOMER;
  SELECT DISTINCT CUSTLASTNAME BULK COLLECT INTO V_LNAMES FROM CUSTOMER;
  SELECT DISTINCT CITY BULK COLLECT INTO V_CITY FROM CUSTOMER;
  SELECT DISTINCT STATE BULK COLLECT INTO V_STATE FROM CUSTOMER;

  FOR I IN 21 .. 40 LOOP
    FOR J IN 1 .. 50 LOOP
      FOR K IN 1 .. 52 LOOP
        FOR L IN 1 .. 50 LOOP
          INSERT INTO HW1_Q1_CONTACT
            (FIRST_NAME, LAST_NAME, CITY, STATE)
          VALUES
            (V_FNAMES(I), V_LNAMES(J), V_CITY(K), V_STATE(L));
        END LOOP;
      END LOOP;
    END LOOP;
  END LOOP;
  COMMIT;
END;
/
-------------------------------------------------------------
-- Question 1b
/*
Following queries will show the number of unique First Names, unique Last Names, unique States and unique Cities.
*/

SELECT COUNT(DISTINCT FIRST_NAME) FROM HW1_Q1_CONTACT;

SELECT COUNT(DISTINCT LAST_NAME) FROM HW1_Q1_CONTACT;

SELECT COUNT(DISTINCT CITY) FROM HW1_Q1_CONTACT;

SELECT COUNT(DISTINCT STATE) FROM HW1_Q1_CONTACT;

/*
Following query is written to prove that the table HW1_Q1_CONTACT has at least 5
million rows of unique data.
*/

SELECT COUNT(*) FROM
(SELECT DISTINCT * FROM HW1_Q1_CONTACT);

--2a
---------------------------------------------------------------------------------------------
/*
Implement the procedure described above. Use only FOR loops for any necessary
iteration logic.
*/
---------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE GENERATE_MULTIPLICATION_TABLE(P_NUMBER NUMBER) IS
  EX_CUSTOM EXCEPTION;
  V_MESSAGE VARCHAR2(1000);
  J         NUMBER(2);
BEGIN
  -- RESTRICTING USER TO ENTER PARAMETER VALUE GREATER THAN 1
  IF P_NUMBER < 1 THEN
    V_MESSAGE := 'Provided parameter value is less than 1. The parameter value should be between 1 and 15.';
    RAISE EX_CUSTOM;
  END IF;

 -- RESTRICTING USER TO ENTER PARAMETER VALUE LESS THAN OR EQUAL 15
  IF P_NUMBER > 15 THEN
    V_MESSAGE := 'Provided parameter value is greater than 15. The parameter value should be between 1 and 15.';
    RAISE EX_CUSTOM;
  END IF;

  J := 1;
  FOR I IN 1 .. P_NUMBER LOOP  
    DBMS_OUTPUT.PUT_LINE(I || '  ' || CASE
                           WHEN (J + 1) <= P_NUMBER THEN
                            I * (J + 1)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 2) <= P_NUMBER THEN
                            I * (J + 2)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 3) <= P_NUMBER THEN
                            I * (J + 3)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 4) <= P_NUMBER THEN
                            I * (J + 4)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 5) <= P_NUMBER THEN
                            I * (J + 5)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 6) <= P_NUMBER THEN
                            I * (J + 6)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 7) <= P_NUMBER THEN
                            I * (J + 7)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 8) <= P_NUMBER THEN
                            I * (J + 8)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 9) <= P_NUMBER THEN
                            I * (J + 9)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 10) <= P_NUMBER THEN
                            I * (J + 10)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 11) <= P_NUMBER THEN
                            I * (J + 11)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 12) <= P_NUMBER THEN
                            I * (J + 12)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 13) <= P_NUMBER THEN
                            I * (J + 13)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 14) <= P_NUMBER THEN
                            I * (J + 14)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 15) <= P_NUMBER THEN
                            I * (J + 15)
                           ELSE
                            NULL
                         END);
  END LOOP;
EXCEPTION
  WHEN EX_CUSTOM THEN
    RAISE_APPLICATION_ERROR(-20001, V_MESSAGE);
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, SQLERRM);
END;

execute GENERATE_MULTIPLICATION_TABLE(3);
execute GENERATE_MULTIPLICATION_TABLE(8);
execute GENERATE_MULTIPLICATION_TABLE(14);

--2b
CREATE OR REPLACE PROCEDURE GENERATE_MULTIPLICATION_TABLE(P_NUMBER NUMBER) IS
  EX_CUSTOM EXCEPTION;
  V_MESSAGE VARCHAR2(1000);
  J         NUMBER(2);
  I         NUMBER(2);
BEGIN
  -- to check if parameter provided is less than 1
  IF P_NUMBER < 1 THEN
    V_MESSAGE := 'Provided parameter value is less than 1. The parameter value should be between 1 and 15.';
    RAISE EX_CUSTOM;
  END IF;

  -- to check if the parameter provided is greater than 15
  IF P_NUMBER > 15 THEN
    V_MESSAGE := 'Provided parameter value is greater than 15. The parameter value should be between 1 and 15.';
    RAISE EX_CUSTOM;
  END IF;
  I := 1;
  J := 1;
  
  -- implementing logic using while loop
  WHILE (I <= P_NUMBER) LOOP
  
    DBMS_OUTPUT.PUT_LINE(I || '  ' || CASE
                           WHEN (J + 1) <= P_NUMBER THEN
                            I * (J + 1)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 2) <= P_NUMBER THEN
                            I * (J + 2)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 3) <= P_NUMBER THEN
                            I * (J + 3)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 4) <= P_NUMBER THEN
                            I * (J + 4)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 5) <= P_NUMBER THEN
                            I * (J + 5)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 6) <= P_NUMBER THEN
                            I * (J + 6)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 7) <= P_NUMBER THEN
                            I * (J + 7)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 8) <= P_NUMBER THEN
                            I * (J + 8)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 9) <= P_NUMBER THEN
                            I * (J + 9)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 10) <= P_NUMBER THEN
                            I * (J + 10)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 11) <= P_NUMBER THEN
                            I * (J + 11)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 12) <= P_NUMBER THEN
                            I * (J + 12)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 13) <= P_NUMBER THEN
                            I * (J + 13)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 14) <= P_NUMBER THEN
                            I * (J + 14)
                           ELSE
                            NULL
                         END || '  ' || CASE
                           WHEN (J + 15) <= P_NUMBER THEN
                            I * (J + 15)
                           ELSE
                            NULL
                         END);
  
    I := I + 1;
  END LOOP;

EXCEPTION
  WHEN EX_CUSTOM THEN
    RAISE_APPLICATION_ERROR(-20001, V_MESSAGE);
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, SQLERRM);
END;

execute GENERATE_MULTIPLICATION_TABLE(3);
execute GENERATE_MULTIPLICATION_TABLE(8);
execute GENERATE_MULTIPLICATION_TABLE(14);

--2c
CREATE OR REPLACE PROCEDURE GENERATE_MULTIPLICATION_TABLE(P_NUMBER NUMBER) IS
  EX_CUSTOM EXCEPTION;
  V_MESSAGE VARCHAR2(1000);
  J         NUMBER(2);
  I         NUMBER(2);
BEGIN
  
  -- to check if the parameter is less than 1
  IF P_NUMBER < 1 THEN
    V_MESSAGE := 'Provided parameter value is less than 1. The parameter value should be between 1 and 15.';
    RAISE EX_CUSTOM;
  END IF;

  -- to check if the parameter is greater than 15
  IF P_NUMBER > 15 THEN
    V_MESSAGE := 'Provided parameter value is greater than 15. The parameter value should be between 1 and 15.';
    RAISE EX_CUSTOM;
  END IF;
  I := 1;
  J := 1;

  -- implementing simple loop 
  LOOP
    DBMS_OUTPUT.PUT_LINE(I || '  ' || CASE WHEN(J + 1) <= P_NUMBER THEN
                         I * (J + 1) ELSE NULL END || '  ' || CASE
                         WHEN(J + 2) <= P_NUMBER THEN I * (J + 2) ELSE NULL
                         END || '  ' || CASE WHEN(J + 3) <= P_NUMBER THEN
                         I * (J + 3) ELSE NULL END || '  ' || CASE
                         WHEN(J + 4) <= P_NUMBER THEN I * (J + 4) ELSE NULL
                         END || '  ' || CASE WHEN(J + 5) <= P_NUMBER THEN
                         I * (J + 5) ELSE NULL END || '  ' || CASE
                         WHEN(J + 6) <= P_NUMBER THEN I * (J + 6) ELSE NULL
                         END || '  ' || CASE WHEN(J + 7) <= P_NUMBER THEN
                         I * (J + 7) ELSE NULL END || '  ' || CASE
                         WHEN(J + 8) <= P_NUMBER THEN I * (J + 8) ELSE NULL
                         END || '  ' || CASE WHEN(J + 9) <= P_NUMBER THEN
                         I * (J + 9) ELSE NULL END || '  ' || CASE
                         WHEN(J + 10) <= P_NUMBER THEN I * (J + 10) ELSE NULL
                         END || '  ' || CASE WHEN(J + 11) <= P_NUMBER THEN
                         I * (J + 11) ELSE NULL END || '  ' || CASE
                         WHEN(J + 12) <= P_NUMBER THEN I * (J + 12) ELSE NULL
                         END || '  ' || CASE WHEN(J + 13) <= P_NUMBER THEN
                         I * (J + 13) ELSE NULL END || '  ' || CASE
                         WHEN(J + 14) <= P_NUMBER THEN I * (J + 14) ELSE NULL
                         END || '  ' || CASE WHEN(J + 15) <= P_NUMBER THEN
                         I * (J + 15) ELSE NULL END);
  
    I := I + 1;
  
    IF I > P_NUMBER THEN
      EXIT;
    END IF;
  END LOOP;

EXCEPTION
  WHEN EX_CUSTOM THEN
    RAISE_APPLICATION_ERROR(-20001, V_MESSAGE);
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, SQLERRM);
END;

execute GENERATE_MULTIPLICATION_TABLE(3);
execute GENERATE_MULTIPLICATION_TABLE(8);
execute GENERATE_MULTIPLICATION_TABLE(14);
