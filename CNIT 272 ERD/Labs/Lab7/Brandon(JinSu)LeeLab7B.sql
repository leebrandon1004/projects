/*
Brandon (Jin Su) Lee
CNIT 27200 Spring 2020
Lab Time: Online
Duration: 1:50 MIN
******************************************************
Question 1
*/
drop table S20VIOLATIONCODE CASCADE CONSTRAINTS;

Create table S20VIOLATIONCODE
(   ViolationCode Char(8)constraint S20VIOLATION_PK PRIMARY KEY,
    Description varchar2(30) NOT NULL,
    Points number(3) NOT NULL,
    Limitations varchar2(30) NOT NULL);
    
desc S20VIOLATIONCODE;

/* Results:
Table S20VIOLATIONCODE created.

Name          Null?    Type         
------------- -------- ------------ 
VIOLATIONCODE NOT NULL CHAR(8)      
DESCRIPTION   NOT NULL VARCHAR2(30) 
POINTS        NOT NULL NUMBER(3)    
LIMITATIONS   NOT NULL VARCHAR2(30) 

 Explanation: Once you create the table, when you run the sql, it runs in chronological order so
 you first have to drop it then create the table to make the syntax comfortable. When ran, the created 
 table is dropped and then the table is created bythe Create table command then the 
 table is descriped by the desc command. 
*/
/*
******************************************************
Question 2
*/
Create table S20DRIVERVIOLATION
(   DriverID char(8),
    ViolationCode char(8),
    VCDate date,
    Outcome varchar2(10),
    Decision varchar2(30) NOT NULL,
    Feedback varchar2(30) NOT NULL,
    Constraint S20DRIVERVIOLATION_PK Primary Key (DriverID, ViolationCode, VCDate),
    Constraint S20DRIVER_DV_FK Foreign Key (DriverID) References S20DRIVER (DriverID),
    Constraint S20VIOL_DV_FK Foreign Key (ViolationCode) References S20VIOLATIONCODE (ViolationCode));

desc S20DRIVERVIOLATION;

/* Results:
Table S20DRIVERVIOLATION created.

Name          Null?    Type         
------------- -------- ------------ 
DRIVERID               CHAR(8)      
VIOLATIONCODE          CHAR(8)      
VCDATE                 DATE         
OUTCOME                VARCHAR2(10) 
DECISION      NOT NULL VARCHAR2(30) 
FEEDBACK      NOT NULL VARCHAR2(30) 

 Explanation: The different ways are to:
 1. Constraint Name_PK Primary Key
 2. Constraint Name_PK Primary Key (ID, ID,)
 3. Alter Table TableName Add constraint Name Primary Key (Column1, Column2);
 
 You determine the method of using ways by looking at the numbers of primary keys such as in 1. there is
 only 1 PK and in 2. there is 2 or more PK, and in 3. there is not in the Create table. 
 
 This is an identifying relationship because the foreign key is also in the primary key. 
*/
/*
******************************************************
Question 3
*/
Create table S20VEHICLE
(   VIN char(17) constraint S20VECHICLE_PK PRIMARY KEY,
    Make varchar2(10) NOT NULL,
    Model varchar2(20),
    Year char(4) NOT NULL,
    Color varchar2(10),
    CarValue number(4,2),
    Insurance varchar2(20));
    
desc S20VEHICLE;

Alter Table S20VEHICLE
    Modify CarValue Number(9,2);
    
Alter Table S20VEHICLE
    Drop Column Insurance;
    
desc S20VEHICLE;

/* Results:

Table S20VEHICLE created.

Name      Null?    Type         
--------- -------- ------------ 
VIN       NOT NULL CHAR(17)     
MAKE      NOT NULL VARCHAR2(10) 
MODEL              VARCHAR2(20) 
YEAR      NOT NULL CHAR(4)      
COLOR              VARCHAR2(10) 
CARVALUE           NUMBER(4,2)  
INSURANCE          VARCHAR2(20) 

Table S20VEHICLE altered.


Table S20VEHICLE altered.

Name     Null?    Type         
-------- -------- ------------ 
VIN      NOT NULL CHAR(17)     
MAKE     NOT NULL VARCHAR2(10) 
MODEL             VARCHAR2(20) 
YEAR     NOT NULL CHAR(4)      
COLOR             VARCHAR2(10) 
CARVALUE          NUMBER(9,2)  

 Explanation: Data type is important because it can limit the input data type size and kinds for special
 values such as the Primary key or dates or currency. 
*/
/*
******************************************************
Question 4
*/
Create table S20VEHICLEDRIVER
(   DriverID char(8),
    DateDriven Date,
    VIN char(17),
    GasPayment varchar2(7) Constraint GasPayment_CK Check (GasPayment = 'Credit' AND 
    GasPayment = 'Debit' AND GasPayment ='PayPal' AND GasPayment = 'Transfer' AND GasPayment = 'Cash'),
    Distance Number(4,2) NOT NULL,
    ReturnDate date
    );

desc S20VEHICLEDRIVER;

Alter table S20VEHICLEDRIVER
    Add constraint S20VEHICLEDRIVER_PK Primary Key (DriverID, DateDriven, VIN);

Alter table S20VEHICLEDRIVER
    Add constraint S20VEHICLEDRIVER_VEHICLE_FK Foreign Key (VIN) references S20VEHICLE (VIN);

Alter table S20VEHICLEDRIVER    
    Add constraint S20VEHICLEDRIVER_S20DRIVERVIOLATION_FK Foreign Key (DriverID) references S20DRIVERVIOLATION (DriverID);

desc S20VEHICLEDRIVER;


/* Results:

Table S20VEHICLEDRIVER created.

Name       Null?    Type        
---------- -------- ----------- 
DRIVERID            CHAR(8)     
DATEDRIVEN          DATE        
VIN                 CHAR(17)    
GASPAYMENT          VARCHAR2(7) 
DISTANCE   NOT NULL NUMBER(4,2) 
RETURNDATE          DATE        

Table S20VEHICLEDRIVER altered.

Table S20VEHICLEDRIVER altered.

Name       Null?    Type        
---------- -------- ----------- 
DRIVERID   NOT NULL CHAR(8)     
DATEDRIVEN NOT NULL DATE        
VIN        NOT NULL CHAR(17)    
GASPAYMENT          VARCHAR2(7) 
DISTANCE   NOT NULL NUMBER(4,2) 
RETURNDATE          DATE    

 Explanation: in the newly created table, it places the null colmn as NOT NULL for the assigned
 primary and foreign key. This is an identifying relationship because the foreign key is the
 same with the primary key with other tables. 
*/
/*
******************************************************
Question 5
*/
Select Constraint_Name, Constraint_Type, Status, Search_Condition
From USER_CONSTRAINTS;


/* Results:

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
BILLOFMATLS_INVENTORYPART_FK                                                                                                     R ENABLED                                                                                  
BIN$ojtzhBz4KNbgU1YgLoCWkg==$0                                                                                                   C ENABLED  ServiceFee > 0                                                                  
BIN$ooVXaZvRX1PgU1YgLoBVcg==$0                                                                                                   C ENABLED  ServiceFee > 0                                                                  
BOM_SUBINVENTORYPART_FK                                                                                                          R ENABLED                                                                                  
CUSTORDERLINE_CUSTORDER_FK                                                                                                       R ENABLED                                                                                  
CUSTORDERLINE_INVENTORYPART_FK                                                                                                   R ENABLED                                                                                  
CUSTORDER_CUSTOMER_FK                                                                                                            R ENABLED                                                                                  
DC_FK                                                                                                                            R ENABLED                                                                                  
FOOD_FK                                                                                                                          R ENABLED                                                                                  
GASPAYMENT_CK                                                                                                                    C ENABLED  GasPayment = 'Credit' AND                                                       
                                                                                                                                                GasPayment = 'Debit' AND GasPayment ='PayPal' AND                           


CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
INVENTORYPART_CATEGORY_FK                                                                                                        R ENABLED                                                                                  
LUNCH_FK                                                                                                                         R ENABLED                                                                                  
MACHINEPROCESS_MACHINE_2FK                                                                                                       R ENABLED                                                                                  
MACHINEPROCESS_MACHINE_FK                                                                                                        R ENABLED                                                                                  
OPERATION_PROCESS_FK                                                                                                             R ENABLED                                                                                  
PACKINGSLIP_EMPLOYEE_FK                                                                                                          R ENABLED                                                                                  
PACKINGSLIP_SHIPMENT_FK                                                                                                          R ENABLED                                                                                  
PROCESSROUT_INVENTORYPART_FK                                                                                                     R ENABLED                                                                                  
PROCESS_PROCESSROUTING_FK                                                                                                        R ENABLED                                                                                  
PURCHASEORDER_EMPLOYEE_FK                                                                                                        R ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
PURCHASEORDER_SUPPLIER_FK                                                                                                        R ENABLED                                                                                  
PURCHORDERLINE_PURCHORDER_FK                                                                                                     R ENABLED                                                                                  
PURCHORDERLINE_SUPPLIEDPART_FK                                                                                                   R ENABLED                                                                                  
S20DRIVER_DV_FK                                                                                                                  R ENABLED                                                                                  
S20VEHICLEDRIVER_VEHICLE_FK                                                                                                      R ENABLED                                                                                  
S20VIOL_DV_FK                                                                                                                    R ENABLED                                                                                  
SHIPMENT_CUSTORDER_FK                                                                                                            R ENABLED                                                                                  
SHIPMENT_SHIPPER_FK                                                                                                              R ENABLED                                                                                  
SHIPPEDITEM_CUSTORDERLINE_FK                                                                                                     R ENABLED                                                                                  
SHIPPEDITEM_PACKINGSLIP_FK                                                                                                       R ENABLED                                                                                  
SUPERVISOR_EMPLOYEE_FK                                                                                                           R ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
SUPPLIEDPART_INVENTORYPART_FK                                                                                                    R ENABLED                                                                                  
SUPPLIEDPART_SUPPLIER_FK                                                                                                         R ENABLED                                                                                  
SUPPLIER_FK                                                                                                                      R ENABLED                                                                                  
SYS_C00784915                                                                                                                    C ENABLED  "BIRTHDATE" IS NOT NULL                                                         
SYS_C00784916                                                                                                                    C ENABLED  "PHONE" IS NOT NULL                                                             
SYS_C00789982                                                                                                                    C ENABLED  "DESCRIPTION" IS NOT NULL                                                       
SYS_C00789983                                                                                                                    C ENABLED  "POINTS" IS NOT NULL                                                            
SYS_C00789984                                                                                                                    C ENABLED  "LIMITATIONS" IS NOT NULL                                                       
SYS_C00789986                                                                                                                    C ENABLED  "DECISION" IS NOT NULL                                                          
SYS_C00789987                                                                                                                    C ENABLED  "FEEDBACK" IS NOT NULL                                                          
SYS_C00789990                                                                                                                    C ENABLED  "MAKE" IS NOT NULL                                                              

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
SYS_C00789991                                                                                                                    C ENABLED  "YEAR" IS NOT NULL                                                              
SYS_C00789993                                                                                                                    C ENABLED  "DISTANCE" IS NOT NULL                                                          
TIMECARDLINE_EMPLOYEE_FK                                                                                                         R ENABLED                                                                                  
TIMECARDLINE_MACHINEPROCESS_FK                                                                                                   R ENABLED                                                                                  
WORKER_FK                                                                                                                        R ENABLED                                                                                  
BIN$n1ltdRHxBkXgU1YgLoBi9Q==$0                                                                                                   P ENABLED                                                                                  
BIN$n1ltdRH0BkXgU1YgLoBi9Q==$0                                                                                                   P ENABLED                                                                                  
BIN$n1ltdRH3BkXgU1YgLoBi9Q==$0                                                                                                   P ENABLED                                                                                  
BIN$n1ltdRH6BkXgU1YgLoBi9Q==$0                                                                                                   P ENABLED                                                                                  
BIN$n1ltdRH9BkXgU1YgLoBi9Q==$0                                                                                                   P ENABLED                                                                                  
BIN$n1ltdRIABkXgU1YgLoBi9Q==$0                                                                                                   P ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
S20DRIVER_PK                                                                                                                     P ENABLED                                                                                  
LICENSENUM_UQ                                                                                                                    U ENABLED                                                                                  
BIN$ojtzhBzyKNbgU1YgLoCWkg==$0                                                                                                   P ENABLED                                                                                  
BIN$ojtzhBzzKNbgU1YgLoCWkg==$0                                                                                                   U ENABLED                                                                                  
BIN$ojtzhBz3KNbgU1YgLoCWkg==$0                                                                                                   P ENABLED                                                                                  
SUPPLIER_PK                                                                                                                      P ENABLED                                                                                  
PURCHASE_ORDER_PK                                                                                                                P ENABLED                                                                                  
SUPPLIEDPART_PK                                                                                                                  P ENABLED                                                                                  
PURCHORDERID_PK                                                                                                                  P ENABLED                                                                                  
EMPLOYEE_PK                                                                                                                      P ENABLED                                                                                  
INVENTORYPART_PK                                                                                                                 P ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
BILLOFMATERIALS_PK                                                                                                               P ENABLED                                                                                  
OPERATION_PK                                                                                                                     P ENABLED                                                                                  
TIMECARDLINE_PK                                                                                                                  P ENABLED                                                                                  
CATEGORY_PK                                                                                                                      P ENABLED                                                                                  
PROCESSROUTING_PK                                                                                                                P ENABLED                                                                                  
PROCESSING_PK                                                                                                                    P ENABLED                                                                                  
MACHINEPROCESS_PK                                                                                                                P ENABLED                                                                                  
MACHINE_PK                                                                                                                       P ENABLED                                                                                  
CUSTORDERLINE_PK                                                                                                                 P ENABLED                                                                                  
SHIPPEDITEM_PK                                                                                                                   P ENABLED                                                                                  
CUSTORDER_PK                                                                                                                     P ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
SHIPMENT_PK                                                                                                                      P ENABLED                                                                                  
PACKINGSLIP_PK                                                                                                                   P ENABLED                                                                                  
CUSTOMER_PK                                                                                                                      P ENABLED                                                                                  
SHIPPER_PK                                                                                                                       P ENABLED                                                                                  
WORKER_PK                                                                                                                        P ENABLED                                                                                  
FOOD_PK                                                                                                                          P ENABLED                                                                                  
DEPARTMENT_PK                                                                                                                    P ENABLED                                                                                  
LUNCH_PK                                                                                                                         P ENABLED                                                                                  
LUNCH_ITEM_PK                                                                                                                    P ENABLED                                                                                  
FOOD_SUPPLIER_PK                                                                                                                 P ENABLED                                                                                  
BIN$ooVXaZvLX1PgU1YgLoBVcg==$0                                                                                                   P ENABLED                                                                                  

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
BIN$ooVXaZvMX1PgU1YgLoBVcg==$0                                                                                                   U ENABLED                                                                                  
BIN$ooVXaZvQX1PgU1YgLoBVcg==$0                                                                                                   P ENABLED                                                                                  
S20VIOLATION_PK                                                                                                                  P ENABLED                                                                                  
S20VECHICLE_PK                                                                                                                   P ENABLED                                                                                  
S20VEHICLEDRIVER_PK                                                                                                              P ENABLED                                                                                  

91 rows selected. 


 Explanation: It is important bceause it is easy to look at one sight if you use a consistent 
 naming convention and it is easy to list the contraints. 
*/
/*
******************************************************
Question 6
*/
drop table S20DRIVER cascade constraints;
drop table S20DRIVERVIOLATION cascade constraints;
drop table S20VIOLATIONCODE cascade constraints;
drop table S20VEHICLEDRIVER cascade constraints;
drop table S20VEHICLE cascade constraints;

/* Results:
Table S20DRIVER dropped.


Table S20DRIVERVIOLATION dropped.


Table S20VIOLATIONCODE dropped.


Table S20VEHICLEDRIVER dropped.


Table S20VEHICLE dropped.

 Explanation: When you want to re-run the create table command the table has to be dropped first in
 order to run the table. So if you run the whole sql, and the drop table is the before creating tables,
 the table will be dropped then created automatically. 
 
*/
/*
******************************************************
Question 7
*/
Create table Employee
(   Employee_ID char(16) constraint Employee_ID_PK PRIMARY KEY,
    First_Name varchar2(256),
    Last_Name varchar2(256),
    Hire_Date date,
    Birth_date date,
    Permitted_Access_Level Integer);
    
    
Create table Chat_Message
(   Employee_ID char(16),
    Date_Time Date,
    Message_Contents Long,
    Chat_Room varchar2(128),
    Constraint Chat_Message_PK PRIMARY Key (Employee_ID, Date_Time)
    Constraint Chat_Message_Employee_ID_FK 
        Foreign Key (Employee_ID) References Employee (Employee_ID)
    );


desc Employee;

desc Chat_Message;
/* Results:
Table Employee created.

Table CHAT_MESSAGE created.

Name          Null?    Type         
------------- -------- ------------ 
EMPLOYEEID    NOT NULL VARCHAR2(10) 
LASTNAME               VARCHAR2(20) 
FIRSTNAME              VARCHAR2(15) 
JOBTITLE               VARCHAR2(35) 
STREETADDRESS          VARCHAR2(40) 
CITY                   VARCHAR2(20) 
STATE                  CHAR(2)      
POSTALCODE             CHAR(10)     
HOMEPHONE              CHAR(12)     
SETUPALLOWED           CHAR(1)      
HIREDATE               DATE         
RELEASEDATE            DATE         
TYPE                   VARCHAR2(10) 
TEMPSERVICE            VARCHAR2(10) 
LOCKERNUMBER           VARCHAR2(6)  
BIRTHDATE              DATE         
STAMPNUMBER            VARCHAR2(6)  
SUPERVISOR             VARCHAR2(10) 
EMAILADDR              VARCHAR2(50) 
SALARYWAGE             NUMBER(12,2) 

Name             Null?    Type          
---------------- -------- ------------- 
DATE_TIME        NOT NULL DATE          
EMPLOYEE_ID      NOT NULL CHAR(16)      
MESSAGE_CONTENTS          LONG          
CHAT_ROOM                 VARCHAR2(128) 

 Explanation: The two tables are the Employee Table and the Chat_Message table. The employee controls
 the chatroom used by the users, the employee is the parent table and the chatroom is the child table.
 The relationship between these two tables is an identifying relationship where the primary key in the parent
 is in the child entity, which is the Employee_ID in my case. All the attrubutes listed are required. 
 I selected these two tables because this is the main function in our phase 1 project so I selected these two entity.
 
*/
/*
******************************************************