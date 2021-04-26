/*
Brandon (Jin Su) Lee
CNIT 27200 Spring 2020
Lab Time: Online
Duration: 1:50 MIN
******************************************************
Question 1
*/
CREATE TABLE S20TRAINER
(   TrainerID CHAR(9),
    LastName VARCHAR2 (20),
    FirstName VARCHAR2(20),
    CertificationDate DATE,
    BirthDate DATE,
    EmailAddr VARCHAR2 (30));

Alter table S20TRAINER
    Add Branding varchar2(50);
 
desc S20TRAINER

drop table S20TRAINER CASCADE CONSTRAINTS;

/* Results:

Table S20TRAINER created.


Table S20TRAINER altered.

Name              Null? Type         
----------------- ----- ------------ 
TRAINERID               CHAR(9)      
LASTNAME                VARCHAR2(20) 
FIRSTNAME               VARCHAR2(20) 
CERTIFICATIONDATE       DATE         
BIRTHDATE               DATE         
EMAILADDR               VARCHAR2(30) 
BRANDING                VARCHAR2(50) 

Table S20TRAINER dropped.


 Explanation: 
*/
/*
******************************************************
Question 2
*/
CREATE TABLE S20ZIPCODE AS
SELECT PostalCode as ZipCode, City, State FROM Supplier
 UNION
SELECT PostalCode as ZipCode, City, State FROM Employee
 UNION
SELECT PostalCode as ZipCode, City, State FROM Customer
 UNION
SELECT ShipPostalCode as ZipCode, ShipCity, ShipState FROM Shipment;

Select count(*)
From S20ZIPCODE;

Select ZipCode, City, State
From S20ZIPCODE
Where State = 'NY';
    
/* Results:
Table S20ZIPCODE created.


  COUNT(*)
----------
       312


ZIPCODE    CITY                 ST
---------- -------------------- --
10013      New York             NY
10044      New York City        NY
10131      New York             NY
10131      New York City        NY
12182      Troy                 NY
12211      Albany               NY
12553      Newburgh             NY
13261      Syracuse             NY
13442      Rome                 NY
13504      Utica                NY
13699      Potsdam              NY

ZIPCODE    CITY                 ST
---------- -------------------- --
14206      Buffalo              NY
14895      Wellsville           NY

13 rows selected. 

 Explanation: 
*/
/*
******************************************************
Question 3
*/
Create Table S20DRIVER
(   DriverID char(8) constraint S20DRIVER_PK PRIMARY KEY,
    FirstName varchar2(30),
    LastName varchar2(30),
    Birthdate date NOT NULL,
    LicenseNum char(16)constraint LicenseNum_UQ UNIQUE,
    LicenseDate date,
    City varchar2(20),
    State char(2),
    Phone char(10) NOT NULL);
    
desc S20DRIVER;

Select Constraint_Name, Constraint_Type, Status, Search_Condition
From USER_CONSTRAINTS
Where Table_Name = 'S20DRIVER';

/* Results:

Table S20DRIVER created.

Name        Null?    Type         
----------- -------- ------------ 
DRIVERID    NOT NULL CHAR(8)      
FIRSTNAME            VARCHAR2(30) 
LASTNAME             VARCHAR2(30) 
BIRTHDATE   NOT NULL DATE         
LICENSENUM           CHAR(16)     
LICENSEDATE          DATE         
CITY                 VARCHAR2(20) 
STATE                CHAR(2)      
PHONE       NOT NULL CHAR(10)     

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
SYS_C00784915                                                                                                                    C ENABLED  "BIRTHDATE" IS NOT NULL                                                         
SYS_C00784916                                                                                                                    C ENABLED  "PHONE" IS NOT NULL                                                             
S20DRIVER_PK                                                                                                                     P ENABLED                                                                                  
LICENSENUM_UQ                                                                                                                    U ENABLED                                                                                  


 Explanation: The NOT NULL constraint is written as SYS_... but the PK and the Unique field is 
 written as S20DRIVER_OK and LICENNSENUM_UQ which are the constraints that I named. So NOT NULL is 
 set by the system followed by numbers. 
*/
/*

******************************************************
Question 4
*/
Alter table S20DRIVER
    Add Email varchar2(50);

desc S20DRIVER;

/* Results:

Table S20DRIVER altered.

Name        Null?    Type         
----------- -------- ------------ 
DRIVERID    NOT NULL CHAR(8)      
FIRSTNAME            VARCHAR2(30) 
LASTNAME             VARCHAR2(30) 
BIRTHDATE   NOT NULL DATE         
LICENSENUM           CHAR(16)     
LICENSEDATE          DATE         
CITY                 VARCHAR2(20) 
STATE                CHAR(2)      
PHONE       NOT NULL CHAR(10)     
EMAIL                VARCHAR2(50) 

 Explanation: 
*/
/*
******************************************************
Question 5
*/
 Create Table S20DEPARTMENT
(   DeptCode char(4) constraint S20DEPT_PK PRIMARY KEY,
    DeptName varchar2(30),
    Building varchar2(30),
    DeptHead varchar2(30) constraint DeptHead_UQ UNIQUE);
    
desc S20DEPARTMENT;

/* Results:

Table S20DEPARTMENT created.

Name     Null?    Type         
-------- -------- ------------ 
DEPTCODE NOT NULL CHAR(4)      
DEPTNAME          VARCHAR2(30) 
BUILDING          VARCHAR2(30) 
DEPTHEAD          VARCHAR2(30) 

 Explanation: 
*/
/*
******************************************************
Question 6
*/
 Alter table S20DRIVER
    Add DeptCode char(4);
    
Alter table S20DRIVER
    Add Constraint S20Driver_FK 
        FOREIGN Key (DeptCode) references S20DEPARTMENT (DeptCode);
        
desc S20DRIVER;
    

/* Results:
Table S20DRIVER altered.

Name        Null?    Type         
----------- -------- ------------ 
DRIVERID    NOT NULL CHAR(8)      
FIRSTNAME            VARCHAR2(30) 
LASTNAME             VARCHAR2(30) 
BIRTHDATE   NOT NULL DATE         
LICENSENUM           CHAR(16)     
LICENSEDATE          DATE         
CITY                 VARCHAR2(20) 
STATE                CHAR(2)      
PHONE       NOT NULL CHAR(10)     
EMAIL                VARCHAR2(50) 
DEPTCODE             CHAR(4)    

 Explanation: 
*/
/*
******************************************************
Question 7
*/
 Create table S20SERVICE
 (  DriverID char(5),
    ServiceDate date,
    ServiceFee number(3,0),
    Reason varchar(50),
    Constraint S20SERV_PK PRIMARY Key (DriverID, ServiceDate),
    Constraint S20SERV_FK Foreign key (DriverID) References S20DRIVER);

desc S20SERVICE;


/* Results:
Table S20SERVICE created.

Name        Null?    Type         
----------- -------- ------------ 
DRIVERID    NOT NULL CHAR(5)      
SERVICEDATE NOT NULL DATE         
SERVICEFEE           NUMBER(3)    
REASON               VARCHAR2(50) 
 Explanation: 
*/
/*
******************************************************
Question 8
*/
 Alter table S20SERVICE
 Add Constraint SERVICE_CK CHECK (ServiceFee > 0);

/* Results:
Table S20SERVICE altered.

 Explanation: 
*/
/*

******************************************************
Question 9
*/
 Select Constraint_Name, Table_Name, Status
 From USER_CONSTRAINTS
 Where Constraint_Type = 'P';

Select Constraint_Name, Table_Name, R_Constraint_Name, Status
From USER_CONSTRAINTS
WHERE Constraint_Type = 'R';

/* Results:
S20DEPT_PK                                                                                                                       S20DEPARTMENT                                                                                                                    ENABLED 
S20DRIVER_PK                                                                                                                     S20DRIVER                                                                                                                        ENABLED 
S20SERV_PK                                                                                                                       S20SERVICE                                                                                                                       ENABLED 
SHIPMENT_PK                                                                                                                      SHIPMENT                                                                                                                         ENABLED 
SHIPPEDITEM_PK                                                                                                                   SHIPPEDITEM                                                                                                                      ENABLED 
SHIPPER_PK                                                                                                                       SHIPPER                                                                                                                          ENABLED 
SUPPLIEDPART_PK                                                                                                                  SUPPLIEDPART                                                                                                                     ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
SUPPLIER_PK                                                                                                                      SUPPLIER                                                                                                                         ENABLED 
TIMECARDLINE_PK                                                                                                                  TIMECARDLINE                                                                                                                     ENABLED 
WORKER_PK                                                                                                                        WORKER                                                                                                                           ENABLED 

36 rows selected. 

B.
CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       R_CONSTRAINT_NAME                                                                                                                STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
SHIPMENT_SHIPPER_FK                                                                                                              SHIPMENT                                                                                                                         SHIPPER_PK                                                                                                                       ENABLED 
SHIPPEDITEM_CUSTORDERLINE_FK                                                                                                     SHIPPEDITEM                                                                                                                      CUSTORDERLINE_PK                                                                                                                 ENABLED 
SHIPPEDITEM_PACKINGSLIP_FK                                                                                                       SHIPPEDITEM                                                                                                                      PACKINGSLIP_PK                                                                                                                   ENABLED 
SUPERVISOR_EMPLOYEE_FK                                                                                                           EMPLOYEE                                                                                                                         EMPLOYEE_PK                                                                                                                      ENABLED 
SUPPLIEDPART_INVENTORYPART_FK                                                                                                    SUPPLIEDPART                                                                                                                     INVENTORYPART_PK                                                                                                                 ENABLED 
SUPPLIEDPART_SUPPLIER_FK                                                                                                         SUPPLIEDPART                                                                                                                     SUPPLIER_PK                                                                                                                      ENABLED 
SUPPLIER_FK                                                                                                                      FOOD                                                                                                                             FOOD_SUPPLIER_PK                                                                                                                 ENABLED 
TIMECARDLINE_EMPLOYEE_FK                                                                                                         TIMECARDLINE                                                                                                                     EMPLOYEE_PK                                                                                                                      ENABLED 
TIMECARDLINE_MACHINEPROCESS_FK                                                                                                   TIMECARDLINE                                                                                                                     MACHINEPROCESS_PK                                                                                                                ENABLED 
WORKER_FK                                                                                                                        LUNCH                                                                                                                            WORKER_PK                                                                                                                        ENABLED 

32 rows selected. 

 Explanation: 
*/
/*
******************************************************
Question 10
*/
 drop table S20ZIPCODE cascade constraints;
 drop table S20DEPARTMENT cascade constraints;
 drop table S20SERVICE cascade constraints;

/* Results:
Table S20ZIPCODE dropped.


Table S20DEPARTMENT dropped.


Table S20SERVICE dropped.

 Explanation: 
*/
/*


