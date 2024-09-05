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

--Question B4
INSERT INTO EMPLOYEE(employeeid, SUPERVISOR)
VALUES('100701', '100559');
/

--Question B5
SELECT * FROM SUPERVISOR;
/

--Question B7
COMMIT;
/

--Question B9
DELETE FROM EMPLOYEE
where employeeid = '100701';
/

--Question B10
SELECT * FROM SUPERVISOR;
/

--Question B12
REVOKE READ ON SUPERVISOR from cfarney;
/

--Question B14
DROP VIEW SUPERVISOR;

--Results
/*
Question B1
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

Question B2


Question B4


Question B5

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

I do not see the new employee but the number of employee for 100559 has increased by 1 because it does manage the added employee. 

Question B7


Question B9


Question B10
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

I do not see the new employee and the additional employee for supervisor 100559 because it was deleted.

Question B12


Question B14

*/


