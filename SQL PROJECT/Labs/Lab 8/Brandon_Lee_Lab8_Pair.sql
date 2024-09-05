
--Brandon Lee (Partner 1)
--Conall Farney (Partner 2)
--CNIT372 S2022, Wednesday 7:30am Lab
--Lab8 Pair

--Question B1
CREATE VIEW SUPERVISOR AS
SELECT SUPERVISOR, COUNT(employeeid) as number_of_employee
FROM EMPLOYEE
GROUP BY SUPERVISOR
ORDER BY SUPERVISOR;

SELECT * FROM SUPERVISOR;
/

--Question B2
GRANT READ ON SUPERVISOR to cfarney;
/

--Question B3
SELECT * FROM SUPERVISOR;
/

--Question B4
INSERT INTO EMPLOYEE(employeeid, SUPERVISOR)
VALUES('100701', '100559');
/

--Question B5
SELECT * FROM SUPERVISOR;
/

--Question B6
SELECT * FROM SUPERVISOR;
--ANSWER
/

--Question B7
COMMIT;
/

--Question B8
SELECT * FROM SUPERVISOR;
--ANSWER
/

--Question B9
DELETE FROM EMPLOYEE
where employeeid = '100701';
/

--Question B10
SELECT * FROM SUPERVISOR;
/

--Question B11
SELECT * FROM SUPERVISOR;
/

--Question B12
REVOKE READ ON SUPERVISOR from cfarney;
/

--Question B13
SELECT * FROM SUPERVISOR;
/

--Question B14
DROP VIEW SUPERVISOR;
/

--Question B15
/* This question is in regards to the CREATE MATERIALIZED VIEW and the CREATE ANY MATERIALIZED VIEW privileges. We are guessing that these were not provided for security reasons. */
/

--Question B16
/* This question is in regards to the CREATE ROLE privilege. We are assuming that like in Q15, this has been locked by the admins for security/safety reasons.
/

/*
---------Results Section---------

View SUPERVISOR created.


SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      5

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


Grant succeeded.


SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      5

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


1 row inserted.


SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      6

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      6

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


Commit complete.


SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      6

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


1 row deleted.


SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      5

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      5

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


Error starting at line : 62 in command -
REVOKE READ ON SUPERVISOR from cfarney
Error report -
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself
01749. 00000 -  "you may not GRANT/REVOKE privileges to/from yourself"
*Cause:    
*Action:

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100001                      2
100103                      2
100104                      3
100125                      3
100127                      2
100200                      2
100206                      1
100209                      4
100330                      2
100365                      3
100559                      5

SUPERVISOR NUMBER_OF_EMPLOYEE
---------- ------------------
100650                      2
100880                      3
100944                      5
                            1

15 rows selected. 


View SUPERVISOR dropped.
*/


