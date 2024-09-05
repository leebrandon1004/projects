-- Question 1
CREATE TABLE PERSON_OF_INTEREST (
    name    VARCHAR2(50),
    company_name VARCHAR2(100),
    telephone VARCHAR2(50),
    email_address VARCHAR2 (100)
);
/

-- Question 2
select custfirstname || ', ' || custlastname as name, phone, emailaddr, companyname 
from customer
where companyname is not null
union
select custfirstname || ', ' || custlastname as name, phone, emailaddr, 'none on record' as companyname 
from customer
where companyname is null
union
select contactname as name, phone, emailaddr, companyname
from supplier
union 
select firstname || ', ' || lastname as name, homephone as phone, emailaddr, 'Eagle Electronic' as companyname
from employee;
/

-- Question 3
INSERT INTO PERSON_OF_INTEREST (name, telephone, email_address, company_name)
select custfirstname || ', ' || custlastname as name, phone, emailaddr, companyname 
from customer
where companyname is not null
union
select custfirstname || ', ' || custlastname as name, phone, emailaddr, 'none on record' as companyname 
from customer
where companyname is null
union
select contactname as name, phone, emailaddr, companyname
from supplier
union 
select firstname || ', ' || lastname as name, homephone as phone, emailaddr, 'Eagle Electronic' as companyname
from employee;
/

-- Question 4
UPDATE PERSON_OF_INTEREST
SET email_address = 'none on record'
where email_address IS NULL;
/

--select * from PERSON_OF_INTEREST

-- Question 5
DELETE PERSON_OF_INTEREST
where company_name = 'none on record';

--select * from PERSON_OF_INTEREST;
/

-- Question 6
TRUNCATE TABLE PERSON_OF_INTEREST;

--select * from PERSON_OF_INTEREST;
/

-- Question 7
--DROP table COPY_CUSTOMER;

create table COPY_CUSTOMER as
select *
from customer;
/

-- Question 8
INSERT INTO COPY_CUSTOMER (customerid, companyname, custfirstname, custlastname, custtitle, city, state)
VALUES ('Z-12345', 'Quick Stop', 'Randal', 'Graves', 'Mr.', 'Leonardo', 'NJ');

--select customerid
--from COPY_CUSTOMER
--where customerid = 'Z-12345';
/

-- Question 9
UPDATE COPY_CUSTOMER
SET postalcode = '07737'
where customerid = 'Z-12345';
/

-- Question 10
DELETE from COPY_CUSTOMER
where state = 'OH'

--select customerid
--from COPY_CUSTOMER
--where state = 'OH';

-- Question 11
DELETE from COPY_CUSTOMER
where customerid = 'Z-12345';

--select customerid
--from COPY_CUSTOMER
--where customerid = 'Z-12345';
/

-- Question 12
UPDATE COPY_CUSTOMER
SET city = 'Leonardo', state = 'NJ';

--select *
--from COPY_CUSTOMER;
/

-- Question 13
--DROP TABLE EMPLOYEE_BOTTOM_25;
--DROP TABLE EMPLOYEE_TOP_10;
--DROP TABLE EMPLOYEE_OTHERS;

CREATE TABLE EMPLOYEE_BOTTOM_25 (
    Employee_id    VARCHAR2(10),
    Employee_name VARCHAR2(35),
    Job_title VARCHAR2(35),
    Salary NUMBER (9,2)
);

CREATE TABLE EMPLOYEE_TOP_10 (
    Employee_id    VARCHAR2(10),
    Employee_name VARCHAR2(35),
    Job_title VARCHAR2(35),
    Salary NUMBER (9,2)
);

CREATE TABLE EMPLOYEE_OTHERS (
    Employee_id    VARCHAR2(10),
    Employee_name VARCHAR2(35),
    Job_title VARCHAR2(35),
    Salary NUMBER (9,2)
);
/

-- Question 14
INSERT ALL
    WHEN EXISTS (SELECT * FROM EMPLOYEE WHERE SALARYWAGE <= (SELECT avg(salarywage) * .25 from employee)) THEN
        INTO EMPLOYEE_BOTTOM_25
    WHEN EXISTS (SELECT * FROM EMPLOYEE WHERE SALARYWAGE >= (SELECT avg(salarywage) * .9 from employee)) THEN
        INTO EMPLOYEE_TOP_10
    WHEN EXISTS (SELECT * FROM EMPLOYEE WHERE SALARYWAGE <= (SELECT avg(salarywage) * .25 from employee) AND SALARYWAGE >= (SELECT avg(salarywage) * .9 from employee)) THEN
        INTO EMPLOYEE_OTHERS  
Select employeeid, firstname || ', ' || lastname as name, jobtitle, avg(salarywage) as salaraywage
From Employee
group by employeeid, firstname || ', ' || lastname, jobtitle;

--select * from EMPLOYEE_BOTTOM_25
--select * from EMPLOYEE_TOP_10
--select * from EMPLOYEE_OTHERS

/

-- Question 15
DELETE FROM EMPLOYEE_BOTTOM_25;
DELETE FROM EMPLOYEE_TOP_10;
DELETE FROM EMPLOYEE_OTHERS;
/

--select * from EMPLOYEE_BOTTOM_25
--select * from EMPLOYEE_TOP_10
--select * from EMPLOYEE_OTHERS

-- Question 16
--DROP TABLE EMPLOYEE_TOP_2;

CREATE TABLE EMPLOYEE_TOP_2 (
    Employee_id    VARCHAR2(10),
    Employee_name VARCHAR2(35),
    Job_title VARCHAR2(35),
    Salary NUMBER (9,2)
);
/

-- Question 17
INSERT ALL
    WHEN EXISTS (SELECT * FROM EMPLOYEE WHERE SALARYWAGE <= (SELECT avg(salarywage) * .25 from employee)) THEN
        INTO EMPLOYEE_BOTTOM_25
    WHEN EXISTS (SELECT * FROM EMPLOYEE WHERE SALARYWAGE >= (SELECT avg(salarywage) * .9 from employee)) THEN
        INTO EMPLOYEE_TOP_10
    WHEN EXISTS (SELECT * FROM EMPLOYEE WHERE SALARYWAGE >= (SELECT avg(salarywage) * .98 from employee)) THEN
        INTO EMPLOYEE_TOP_2
    WHEN EXISTS (SELECT * FROM EMPLOYEE WHERE SALARYWAGE <= (SELECT avg(salarywage) * .25 from employee) AND SALARYWAGE >= (SELECT avg(salarywage) * .9 from employee)) THEN
        INTO EMPLOYEE_OTHERS  
Select employeeid, firstname || ', ' || lastname as name, jobtitle, avg(salarywage) as salaraywage
From Employee
group by employeeid, firstname || ', ' || lastname, jobtitle;
/
--select * from EMPLOYEE_BOTTOM_25
--select * from EMPLOYEE_TOP_10
--select * from EMPLOYEE_OTHERS
--select * from EMPLOYEE_TOP_2


-- Question 18
update EMPLOYEE_TOP_2
set salary = salary * 1.2;

--select * from EMPLOYEE_TOP_2
/

-- Question 19
INSERT INTO  EMPLOYEE_TOP_2 (Employee_id, Employee_name, Job_title, Salary)
VALUES ('101', 'Happy Owner', 'Big Boss', '1000000');
/

-- Question 20
MERGE INTO EMPLOYEE_TOP_10
USING EMPLOYEE_TOP_2
ON (EMPLOYEE_TOP_2.salary = EMPLOYEE_TOP_10.salary)
WHEN MATCHED THEN
    UPDATE SET EMPLOYEE_TOP_10.Employee_id = EMPLOYEE_TOP_2.Employee_id,
               EMPLOYEE_TOP_10.Employee_name = EMPLOYEE_TOP_2.Employee_name,
               EMPLOYEE_TOP_10.Job_title = EMPLOYEE_TOP_2.Job_title,
               EMPLOYEE_TOP_10.Salary = EMPLOYEE_TOP_2.Salary
WHEN NOT MATCHED THEN 
    INSERT (Employee_id, Employee_name, Job_title, Salary)
    VALUES (EMPLOYEE_TOP_2.Employee_id, EMPLOYEE_TOP_2.Employee_name, EMPLOYEE_TOP_2.Job_title, EMPLOYEE_TOP_2.Salary);
/

-- Question 21
DROP TABLE COPY_CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE PERSON_OF_INTEREST CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_TOP_10 CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_TOP_2 CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_BOTTOM_25 CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_OTHERS CASCADE CONSTRAINTS;
/

-- Bonus
DELETE (select * from supplier 
        inner join purchorderline
        on supplier.supplierid = purchorderline.supplierid);

/* Results
Question 1

Question 2

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Adam Cyr                              315-474-5634 acyr@cablesany.com                                 Cables Anywhere                         
Alice Mynhier                         303-696-0557 almyn@Nway.magcomp.com                             Magic Components                        
Allen, Robles                         644-730-8090 copy@onlineservice.com                             Copy Center                             
Allison, Roland                       929-498-4174 alley@onlineservice.com                            none on record                          
Allison, Roland                       929-498-4174                                                    Eagle Electronic                        
Amy, Heide                            802-894-1024 letout@usol.com                                    Outlets                                 
Andrea, Griswold                      970-746-0995 andygwold@usol.com                                 none on record                          
Andrea, Montgomery                    349-397-7772                                                    none on record                          
Andrew, Ray                           609-345-9680 andyray@usol.com                                   none on record                          
Andrew, Smith                         709-307-2568 smokey@zeronet.net                                 none on record                          
Andrew, Yelnick                       517-803-5818 family@free.com                                    none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Andy, Huegel                          302-620-1366                                                    none on record                          
Angela, Wainscott                     208-788-4112 awainscott@free.com                                none on record                          
Angie, Hoover                         307-459-4165 ahoover@free.com                                   Goodwork Corporation                    
Anita, Pastron                        901-796-4654 contracts@fast.com                                 Industrail Contracting Co               
Anna, Mayton                          888-451-1233 doctor@free.com                                    none on record                          
Anne, Hatzell                         302-651-6440 hazel@zeronet.net                                  none on record                          
Ansel, Farrell                        712-440-3934 prickly@onlineservice.com                          none on record                          
Archie, Doremski                      307-944-8959 sheetz@free.com                                    Greenpart Steet Metal                   
Aricka, Bross                         419-676-9758 placetolive@free.com                               Apartment Referrals                     
Austin, Ortman                        919-774-9999                                                    Eagle Electronic                        
Beth, Zobitz                          919-747-8404 bzobitz@eagle.com                                  Eagle Electronic                        

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Bill, Umbarger                        207-155-1577 cheezy@onlineservice.com                           none on record                          
Bob, Weldy                            571-490-6449 sucker42@usol.com                                  none on record                          
Brad, Arquette                        775-914-4294 arq@usol.com                                       none on record                          
Brenda Pritchett                      302-696-1000 bpritchett@wizelec.com                             Wizard Electronics                      
Brenda, Jones                         720-800-2638 show@free.com                                      none on record                          
Brenda, Kitchel                       804-214-8732 cheesman@zeronet.net                               Cheesman Corporation                    
Bridgette, Kyger                      301-467-6480 homeloans@fast.com                                 Sampson Home Mortgages                  
Brittany, Cottingham                  419-464-5273 plastic@onlineservice.com                          Cottingham Plastics                     
Bruce, Fogarty                        598-791-1420 photoniche@usol.com                                Photography Niche                       
Bryan, Price                          804-674-9666                                                    none on record                          
Calie, Zollman                        929-763-2047                                                    Eagle Electronic                        

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Carey, Dailey                         728-896-2767 shelty@usol.com                                    none on record                          
Carl, Dallas                          864-541-5114 analyzeh20@fast.com                                Water Analysts                          
Carl, Hague                           419-890-3531                                                    none on record                          
Carrie, Buchko                        817-739-1335 goobert@free.com                                   none on record                          
Cathy, Bending                        765-617-2811 rrair@zeronet.net                                  R and R Air                             
Cathy, Harvey                         336-477-0249 findwork@onlineservice.com                         The Employment Agency                   
Cecil, Scheetz                        207-679-9822 cecil@free.com                                     Tippe Inn                               
Charlene, Franks                      307-892-2938 learn@rydell.edu                                   Rydell High School                      
Charles, Jones                        919-774-5552 charlie@usol.com                                   none on record                          
Charles, Jones                        919-774-5552 cjones@eagle.com                                   Eagle Electronic                        
Chas, Funk                            860-498-3900 duck@usol.com                                      none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Chris, Dunlap                         307-473-2281                                                    none on record                          
Christina, Wilson                     316-210-8989                                                    none on record                          
Dan, Lageveen                         307-344-8928 veenie@zeronet.net                                 none on record                          
Daniel, Barton                        915-894-8034 dannie@zeronet.net                                 none on record                          
Daniel, Ezra                          207-744-1997 swim@zeronet.net                                   Pools For You                           
Daniel, Hundnall                      918-830-9731 fixit@usol.com                                     Bobs Repair Service                     
Daniel, Rodkey                        719-748-3205 dannie@free.com                                    none on record                          
Daniel, Stabnik                       636-746-4124                                                    none on record                          
Danita, Sharp                         360-650-5604 girlfriend@fast.com                                none on record                          
Darlene Jenkins                       678-490-5461 DarJen@Germ.opticimag.com                          Optical Images                          
David Becker                          843-646-4187 BeckerDavid@Loadiu.com                             Load It Up                              

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
David, Chang                          740-750-1272 lion@free.com                                      none on record                          
David, Deppe                          919-747-5155                                                    Eagle Electronic                        
David, Keck                           919-747-9921                                                    Eagle Electronic                        
David, Schilling                      502-421-1516                                                    none on record                          
David, Smith                          309-980-4350 emerald@onlineservice.com                          none on record                          
David, Tarter                         518-500-0570 estate@fast.com                                    Realty Specialties                      
David, Tietz                          651-912-1583 tietz@free.com                                     none on record                          
Dean, Eagon                           970-581-8611                                                    none on record                          
Dean, Katpally                        808-799-3727 phonecorp@usol.com                                 Phone Corporation                       
Debra Cruz                            812-547-7359 Debra@Francomp.com                                 Computer Fundamentals                   
Dennis, Drazer                        253-315-4247 dollarplan@usol.com                                Financial Planning Consul               

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Dennis, Eberle                        515-708-1802 deber@free.com                                     none on record                          
Dennis, Mundy                         603-306-0774 rino@usol.com                                      none on record                          
Dennis, Sammons                       616-544-1969 repairit@free.com                                  Gards Auto Repair                       
Don, Kaleta                           724-695-2157 stud@zeronet.net                                   none on record                          
Don, Torres                           706-649-6375 drill@usol.com                                     Down Deep Drilling Inc.                 
Donald Blythe                         520-486-6025 Dblythe@makenoise.com                              Make Some Noise Inc.                    
Dorlan, Bresnaham                     603-497-7374 dorlan@usol.com                                    none on record                          
Dorthy Beering                        213-465-4900 dbeering@actual.com                                Actual  Computers                       
Doug, Blizzard                        228-646-5114 collectit@onlineservice.com                        Collectibles Inc.                       
Dusty, Jones                          674-727-0511 rr@usol.com                                        Railroad Express                        
Edna, Lilley                          929-498-2840 elilley@eagle.com                                  Eagle Electronic                        

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Elizabeth Clark                       646-846-6232 eclark.com                                         Luxury Laptops                          
Elizabeth, Derhammer                  785-970-9916 lizzy@onlineservice.com                            none on record                          
Elizabeth, Henderson                  449-486-8018                                                    none on record                          
Eric, Becker                          910-717-7613 daddyo@usol.com                                    none on record                          
Eric, Fannon                          209-980-0812 ef@free.com                                        none on record                          
Eric, Quintero                        812-805-1588 diamond@onlineservice.com                          none on record                          
Eugene, Gasper                        705-580-6124 medcare@fast.com                                   Regency Hospital                        
Evelyn, Cassens                       302-762-9526 dr.animal@onlineservice.com                        Vets Inc.                               
Frank, Aamodt                         898-762-8741 fa@fast.com                                        Franklin Trinkets                       
Frank, Malady                         574-493-0510 frankmala@zeronet.net                              none on record                          
Gabrielle, Stevenson                  929-763-4873 gstevenson@eagle.com                               Eagle Electronic                        

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Gary Mikels                           505-660-9632 GaryMikels@Swiss.Alliance.com                      Networking Alliance                     
Gary, German                          919-774-3325 ggerman@eagle.com                                  Eagle Electronic                        
Gary, Kempf                           937-724-7313 kempfg@free.com                                    none on record                          
Geo, Schofield                        228-480-9751 cleanit@usol.com                                   Cleaning Supply                         
George, Purcell                       432-320-6905 design@zeronet.net                                 BMA Advertising Design                  
George, Trenkle                       856-267-7913 cold@fast.com                                      none on record                          
Gerald, Campbell                      431-087-1044 gcampbell@free.com                                 none on record                          
Ginger, Xiao                          605-846-0451 acctsbryant@zeronet.net                            Bryant Accounting                       
Gordon Mayes                          207-634-1969 Gordon@den.modmagic.com                            Modem Magicians                         
Gregory, Abbott                       812-447-3621 greggie@usol.com                                   Baker and Company                       
Gregory, Hettinger                    929-498-7144                                                    Eagle Electronic                        

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Heather, Wallpe                       816-433-9799 flex@onlineservice.com                             Reflexions Manufacturing                
Heather, Waters                       869-741-7817 dates@free.com                                     Happytime Escort Service                
Helene, Ziekart                       203-244-9192                                                    none on record                          
Hugo, Gillespie                       785-981-0669 critters@free.com                                  Wadake Critters                         
Irene, Poczekay                       401-461-9567                                                    none on record                          
Jack, Akers                           301-454-6061 pizazz@usol.com                                    none on record                          
Jack, Barrick                         786-494-4782 1natbank@free.com                                  First National Bank                     
Jack, Brose                           919-486-5104                                                    Eagle Electronic                        
Jack, Illingworth                     914-748-9829 illing@free.com                                    none on record                          
Jacob, Richer                         425-942-3763 laugh@free.com                                     none on record                          
James, Gross                          908-879-8672 jgross@fast.com                                    none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
James, Jones                          971-522-5851 puffy@fast.com                                     none on record                          
James, King                           207-708-3317 jamesk@usol.com                                    none on record                          
James, Laake                          613-785-7063                                                    none on record                          
James, Schilling                      319-429-9772                                                    none on record                          
Jamie Pickett                         937-147-2569 jpickett@machinemiracle.com                        Miracle Machines                        
Jamie, Osman                          919-486-2519 josman@eagle.com                                   Eagle Electronic                        
Jamie, Thompson                       706-471-1222 jthompson@onlineservice.com                        none on record                          
Jane, Mumford                         270-428-5866                                                    none on record                          
Jared, Meers                          701-371-1701 rehabsouth@zeronet.net                             South Street Rehabilitation             
Jason, Krasner                        919-774-7920                                                    Eagle Electronic                        
Jason, Laxton                         978-860-2824 coondog@usol.com                                   none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Jason, Wendling                       919-774-6798 jwendling@eagle.com                                Eagle Electronic                        
Jay, Hanau                            773-490-8254                                                    none on record                          
Jeff, Kowaiski                        212-492-5644 equipit@usol.com                                   Quality Equipment Corp.                 
Jeffery, Jordan                       509-989-9996 seeya@usol.com                                     none on record                          
Jennie Fry                            806-456-6285 Jfry@yourparts.com                                 Pick Your Parts                         
Jennifer, Hundley                     304-713-3298 jenhund@fast.com                                   none on record                          
Jennifer, Kmec                        443-542-1386 dancingk@free.com                                  Kelly Dance Studio                      
Jerry, Mennen                         520-306-8426 mennenj@free.com                                   none on record                          
Jerry, Muench                         464-669-8537 redhot@onlineservice.com                           none on record                          
Jessica, Cain                         517-901-2610                                                    none on record                          
Jessica, Nakamura                     605-324-2193 carsell@usol.com                                   Automart                                

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Jim, Lichty                           618-847-1904 bankrupt@usol.com                                  Bankruptcy Help                         
Jim, Manaugh                          919-747-5603 jmanaugh@eagle.com                                 Eagle Electronic                        
Jim, Manaugh                          919-747-5603 jmanaugh@eagle.com                                 none on record                          
Jim, Sokeland                         723-366-1117 employment@zeronet.net                             Powerful Employment                     
Jim, Webb                             978-204-3019                                                    none on record                          
Jo, Jacko                             856-752-7471                                                    none on record                          
Joan, Hedden                          501-710-0658                                                    none on record                          
Joanne, Rosner                        919-486-2822                                                    Eagle Electronic                        
John, Garcia                          207-311-0174 jgar@onlineservice.com                             none on record                          
John, McGinnis                        208-741-1963 john@zeronet.net                                   none on record                          
John, Skadberg                        513-282-3919 skad@zeronet.net                                   none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Jon, Clute                            480-181-8940                                                    none on record                          
Jonathon, Blanco                      902-226-1858 hammer@free.com                                    none on record                          
Joseph, Platt                         929-763-5228                                                    Eagle Electronic                        
Joseph, Schuman                       330-209-1273                                                    none on record                          
Joshua, Cole                          865-269-7782 fido@zeronet.net                                   none on record                          
Juicheng, Nugent                      802-352-8923 nugent@fast.com                                    none on record                          
Kara, Orze                            414-773-1017 appinc@zeronet.net                                 Appliances Inc.                         
Karen, Burns                          707-598-2670 burnskaren@fast.com                                Recreation Supply                       
Karen, Mangus                         863-623-0459 missright@onlineservice.com                        none on record                          
Karen, Marko                          580-555-1871 marko@usol.com                                     none on record                          
Karen, Randolph                       603-744-9002 cookin@zeronet.net                                 none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Kathleen, Plyman                      507-543-2052 needles@onlineservice.com                          Needle Center                           
Kathleen, Xolo                        929-763-5513 kxolo@eagle.com                                    Eagle Electronic                        
Kathryn, Deagen                       919-747-9164                                                    Eagle Electronic                        
Kathy, Gunderson                      941-330-3314                                                    none on record                          
Kelli Jones                           912-647-0391 kjoneskelli@DCI.com                                Dot Com Incorporated                    
Kelly, Jordan                         727-951-7737 supplycrafts@fast.com                              Supplying Crafts                        
Kenneth, Mintier                      323-673-0690 builder@usol.com                                   none on record                          
Kenneth, Wilcox                       515-872-8848 kenny@onlineservice.com                            none on record                          
Kevin Martin                          606-677-9789 kmartin@easyaccess.com                             Easy Accessories                        
Kevin, Jackson                        225-624-2341                                                    none on record                          
Kevin, Zubarev                        208-364-3785 sign3@fast.com                                     Signs Signs Signs                       

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Kimber, Spaller                       878-119-5448 mcgimmie@zero.net                                  none on record                          
Kris, Shinn                           469-740-2748 shinnk@zeronet.net                                 none on record                          
Kristen, Gustavel                     919-747-1530 kgustavel@eagle.com                                Eagle Electronic                        
Kristey, Moore                        919-486-6765                                                    Eagle Electronic                        
Kristy, Moore                         919-486-6765 fluffy@onlineservice.com                           none on record                          
Lance Andrews                         972-534-7322 LanceA@braz.monitorU.com                           Monitors for You                        
Larry, Gardiner                       225-313-6268 square@onlineserveice.com                          none on record                          
Larry, Osmanova                       541-905-4819 citybus@fast.com                                   City Bus Transport                      
Laura, Rodgers                        929-763-0691                                                    Eagle Electronic                        
Lawrence, Pullen                      644-591-3243 laurie@free.com                                    none on record                          
Linda, Bowen                          605-234-4114                                                    none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Linda, Hari                           270-411-2316                                                    none on record                          
Linda, Li                             203-744-4677 ll@free.com                                        none on record                          
Lisa, Pettry                          702-799-7272 lpett@zeronet.net                                  none on record                          
Loraine Platt                         520-475-5322 LoraineP@ComponGerm.com                            Greatest Components                     
Lou, Caldwell                         606-901-1238 lucky@fast.com                                     none on record                          
Louise, Cool                          208-956-0698                                                    none on record                          
Lucille, Appleton                     914-497-2160 muscle@zeronet.net                                 none on record                          
Lynne, Lagunes                        208-502-9976 hello@zeronet.net                                  none on record                          
Marc, Williams                        435-774-4595 peanut@fast.com                                    none on record                          
Marjorie, Vandermay                   308-489-1137 nam@fast com                                       National Art Museum                     
Marla, Reeder                         728-442-3031 reedmar@zeronet.net                                none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Marty, Fay                            501-631-3727 sparky@free.com                                    none on record                          
Mary Ann, Rausch                      307-944-3324 spiritual@free.com                                 none on record                          
Mary Jo, Wales                        852-441-4984 jomary@onlineservice.com                           none on record                          
Mary, Deets                           808-562-4081 camphere@fast.com                                  Camping Supplies                        
Mary, Uhl                             803-974-2809 mouse@fast.com                                     Flowers by Mickey                       
Matt, Nakanishi                       435-710-5324 nakan@free.com                                     none on record                          
Matt, Shade                           623-422-6616 shadtree@free.com                                  none on record                          
Matt, Smith                           719-822-8828 matsm@fast.com                                     none on record                          
Matthew, Quant                        910-577-1319 walker@onlineservice.com                           none on record                          
Meghan, Tyrie                         919-747-8589 mtyrie@eagle.com                                   Eagle Electronic                        
Melissa, Alvarez                      919-747-3781                                                    Eagle Electronic                        

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Melody, Fazal                         760-877-4849 melfazal@zeronet.net                               none on record                          
Meredith, Rushing                     606-608-2105 merry@free.com                                     none on record                          
Michael, Abbott                       919-774-2720 mabbott@eagle.com                                  Eagle Electronic                        
Michael, Emore                        352-472-1224 mikemore@usol.com                                  none on record                          
Michael, Tendam                       406-424-7496 flute@usol.com                                     none on record                          
Michelle, Nairn                       919-486-6919                                                    Eagle Electronic                        
Michelle, Oakley                      978-514-5425 littleone@usol.com                                 none on record                          
Mike, Condie                          336-211-1238 kidrec@zeronet.net                                 Kids Recreation Inc.                    
Mike, Dunbar                          208-297-5374 duh@onlineservice.com                              none on record                          
Mildred, Jones                        610-437-6687 compconsul@usol.com                                Computer Consultants                    
Nancy, Basham                         207-422-7135                                                    none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Nicholas, Albregts                    929-763-4843                                                    Eagle Electronic                        
Noemi, Elston                         307-359-9514 closetoheaven@zeronet.net                          North Street Church                     
Norman, Fields                        501-346-4841 catv@onlineservice.com                             The Cable Company                       
Orville, Gilliland                    490-263-2957 eia@zeronet.net                                    Easy Internet Access                    
Pam Krick                             860-624-2539 pkrick@Passoc.com                                  Printing Associated                     
Patricha, Underwood                   929-498-1956                                                    Eagle Electronic                        
Patricia, Leong                       520-247-4141 patrice@usol.com                                   none on record                          
Patrick, Bollock                      307-635-1692 pat@fast.com                                       none on record                          
Paul Smith                            219-703-2277 psmith@computervideo.comq                          Computer Video                          
Paul, Eckelman                        919-486-6410 peckelman@eagle.com                                Eagle Electronic                        
Paul, Kaakeh                          719-750-4539 graphit@usol.com                                   Laser Graphics Associates               

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Paul, Rice                            719-541-1837 paulier@onlineservice.com                          none on record                          
Paul, Sullivan                        785-322-5896 sullie@zeronet.net                                 none on record                          
Peter, Austin                         803-343-6063                                                    none on record                          
Phil, Reece                           919-486-0649 sly@zeronet.net                                    none on record                          
Phil, Reece                           919-486-0649                                                    Eagle Electronic                        
Phillip, Hession                      231-711-6837 howdy@usol.com                                     none on record                          
Rachel, Davis                         702-907-4818 rachdav@zeronet.net                                none on record                          
Randall, Neely                        802-319-9805 storage@fast.com                                   Store It Here                           
Randolph, Darling                     860-684-1620 randolph@fast.com                                  none on record                          
Randy, Talauage                       347-671-2022 paintit@fast.com                                   Ceramic Supply                          
Richard, Kluth                        302-296-8012 rickkluth@free.com                                 Main St. Bar and Grill                  

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Richard, Scott                        304-774-2226 kick@onlineservice.com                             Karate Made Easy                        
Richard, Stetler                      256-412-8112 screwball@free.com                                 none on record                          
Richard, Strehle                      206-434-7305 vacation@fast.com                                  Vacation Car Rentals                    
Richard, Zito                         603-787-0787 rzito@zeronet.net                                  none on record                          
Rita, Bush                            919-747-4397 rbush@eagle.com                                    Eagle Electronic                        
Rob Thomas                            484-374-1998 rthomas@bestchoice.com                             Accessories and More                    
Robert, Cortez                        603-442-3740                                                    none on record                          
Robert, Dalury                        906-278-6446 tas@zeronet.net                                    TAS                                     
Robert, Lister                        801-404-1240 fines@free.com                                     Fire Alarm Systems                      
Ronald, Day                           929-763-6488                                                    Eagle Electronic                        
Ronald, Miller                        734-820-2076 picky@zeronet.net                                  none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Rosemary, Vanderhoff                  770-293-8783                                                    none on record                          
Roy, Beer                             206-745-2584 wizzy@usol.com                                     none on record                          
Roy, McGrew                           208-324-0783 grow@zeronet.net                                   none on record                          
Russ, Mann                            775-549-1798 scooter@onlineservice.com                          none on record                          
Ruth, Albeering                       784-444-0131 rabeering@free.com                                 none on record                          
Ruth, Ball                            651-479-7538                                                    none on record                          
Ryan, Stahley                         919-774-5340 rstahley@eagle.com                                 Eagle Electronic                        
Ryan, Stahley                         919-774-5340 rstahley@eagle.com                                 none on record                          
Sally, Valle                          972-234-2044 roi@usol.com                                       Investment Specialties                  
Sandy Goodman                         208-614-3136 Sgoodman@connex.com                                Connexions                              
Sarah, McCammon                       520-438-7944 squirrel@zeronet.net                               none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Scott, Gray                           484-453-7105 keepsafe@zeronet.net                               Security Installation                   
Scott, Yarian                         252-310-2224 syarian@fast.com                                   none on record                          
Sean, Akropolis                       907-262-4254 pickle@free.com                                    none on record                          
Sharon, Rouls                         205-246-3224 irish@free.com                                     Sharons Shamrock                        
Sherman, Cheswick                     929-498-8150 scheswick@eagle.com                                Eagle Electronic                        
Sherry, Garling                       353-822-7623 homely@fast.com                                    Manufactured Homes Corp.                
Shirley, Osborne                      706-333-7174                                                    none on record                          
Stephanie, Pearl                      660-447-8319 mommyl@fast.com                                    none on record                          
Stephanie, Yeinick                    573-455-4278 jewels@usol.com                                    Tuckers Jewels                          
Stephen Bird                          540-514-1415 sbird@storeit.com                                  Storage Specialties                     
Steve, Cochran                        929-763-1283                                                    Eagle Electronic                        

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Steve, Fulkerson                      602-129-1885 cellcall@usol.com                                  Cellular Services                       
Steve, Hess                           919-486-8804                                                    Eagle Electronic                        
Steven, Hickman                       919-774-4874 shickman@eagle.com                                 Eagle Electronic                        
Steven, Yaun                          317-780-9804 yawn@fast.com                                      none on record                          
Susan, Strong                         912-760-7840 fammed@onlineservice.com                           Family Medical Center                   
Susan, Watson                         801-746-7701 mswatson@fast.com                                  none on record                          
Tammi, Baldocchio                     401-989-4975                                                    none on record                          
Ted, Zissa                            405-151-7445                                                    none on record                          
Terry, Xu                             417-546-2570 muffin@fast.com                                    none on record                          
Thomas, Wolfe                         610-365-9766 wolf@onlineservice.com                             none on record                          
Thomas, Zelenka                       603-374-3706 zelenka@free.com                                   none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Thurman Mezzo                         415-967-1415 tmezzo@playingaround.com                           Playing Around                          
Tim White                             517-777-1905 twhite@networkN.com                                Network Niche                           
Tim, Carlton                          203-608-3465                                                    none on record                          
Tim, Leffert                          315-486-4777 trailrent@zeronet.net                              Trailor Rentals                         
Tim, Parker                           315-985-4102 jeckle@onlineservice.com                           none on record                          
Timothy Neal                          704-736-9458 tneal@compAccess.com                               Computer Accessories                    
Tina, Yates                           929-763-4438 tyates@eagle.com                                   Eagle Electronic                        
Todd, Vigus                           919-486-7143 tvigus@eagle.com                                   Eagle Electronic                        
Tom, Baker                            414-778-5640 bologna@free.com                                   none on record                          
Tom, Irelan                           240-634-5581 tucker@free.com                                    none on record                          
Tom, Moore                            270-692-2845 seedle@fast.com                                    none on record                          

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Tommy, McFerren                       503-767-7054 mcferren@cole.com                                  Cole Sales and Associates               
Tonya, Owens                          843-773-2751                                                    none on record                          
Tracy, Cicholski                      601-959-1315 dixpharm@free.com                                  Dixon Pharmacy                          
Travis Honn                           303-564-1515 thonn@radiant.com                                  Radiant Computers                       
Travis, Camargo                       816-746-4913                                                    none on record                          
Trevor, Snuffer                       336-185-0630 snuffer@zeronet.net                                none on record                          
Trudi, Antonio                        718-747-3259 toni@onlineservice.com                             none on record                          
Verna, McGrew                         334-547-9329 verngrew@free.com                                  none on record                          
Wade Holle                            887-746-6174 Wade@jLi.com                                       Just Link It                            
Wade, Jacobs                          803-477-5347 connernat@usol.com                                 Conner National                         
William Newlon                        909-452-4936 Wnewlon@ccs.com                                    Creative Computer Solutions             

NAME                                  PHONE        EMAILADDR                                          COMPANYNAME                             
------------------------------------- ------------ -------------------------------------------------- ----------------------------------------
Yauleng Depoe                         313-475-1177 ydepoe@sw.com                                      Scanning the World                      
Zach, McGrew                          520-730-8494                                                    none on record                          
Zack, Hill                            503-794-2322 boogie@free.com                                    none on record                          

300 rows selected. 

Question 3

Question 4

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Adam Cyr                                           Cables Anywhere                                                                                      315-474-5634                                       acyr@cablesany.com                                                                                  
Alice Mynhier                                      Magic Components                                                                                     303-696-0557                                       almyn@Nway.magcomp.com                                                                              
Allen, Robles                                      Copy Center                                                                                          644-730-8090                                       copy@onlineservice.com                                                                              
Allison, Roland                                    none on record                                                                                       929-498-4174                                       alley@onlineservice.com                                                                             
Allison, Roland                                    Eagle Electronic                                                                                     929-498-4174                                       none on record                                                                                      
Amy, Heide                                         Outlets                                                                                              802-894-1024                                       letout@usol.com                                                                                     
Andrea, Griswold                                   none on record                                                                                       970-746-0995                                       andygwold@usol.com                                                                                  
Andrea, Montgomery                                 none on record                                                                                       349-397-7772                                       none on record                                                                                      
Andrew, Ray                                        none on record                                                                                       609-345-9680                                       andyray@usol.com                                                                                    
Andrew, Smith                                      none on record                                                                                       709-307-2568                                       smokey@zeronet.net                                                                                  
Andrew, Yelnick                                    none on record                                                                                       517-803-5818                                       family@free.com                                                                                     

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Andy, Huegel                                       none on record                                                                                       302-620-1366                                       none on record                                                                                      
Angela, Wainscott                                  none on record                                                                                       208-788-4112                                       awainscott@free.com                                                                                 
Angie, Hoover                                      Goodwork Corporation                                                                                 307-459-4165                                       ahoover@free.com                                                                                    
Anita, Pastron                                     Industrail Contracting Co                                                                            901-796-4654                                       contracts@fast.com                                                                                  
Anna, Mayton                                       none on record                                                                                       888-451-1233                                       doctor@free.com                                                                                     
Anne, Hatzell                                      none on record                                                                                       302-651-6440                                       hazel@zeronet.net                                                                                   
Ansel, Farrell                                     none on record                                                                                       712-440-3934                                       prickly@onlineservice.com                                                                           
Archie, Doremski                                   Greenpart Steet Metal                                                                                307-944-8959                                       sheetz@free.com                                                                                     
Aricka, Bross                                      Apartment Referrals                                                                                  419-676-9758                                       placetolive@free.com                                                                                
Austin, Ortman                                     Eagle Electronic                                                                                     919-774-9999                                       none on record                                                                                      
Beth, Zobitz                                       Eagle Electronic                                                                                     919-747-8404                                       bzobitz@eagle.com                                                                                   

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Bill, Umbarger                                     none on record                                                                                       207-155-1577                                       cheezy@onlineservice.com                                                                            
Bob, Weldy                                         none on record                                                                                       571-490-6449                                       sucker42@usol.com                                                                                   
Brad, Arquette                                     none on record                                                                                       775-914-4294                                       arq@usol.com                                                                                        
Brenda Pritchett                                   Wizard Electronics                                                                                   302-696-1000                                       bpritchett@wizelec.com                                                                              
Brenda, Jones                                      none on record                                                                                       720-800-2638                                       show@free.com                                                                                       
Brenda, Kitchel                                    Cheesman Corporation                                                                                 804-214-8732                                       cheesman@zeronet.net                                                                                
Bridgette, Kyger                                   Sampson Home Mortgages                                                                               301-467-6480                                       homeloans@fast.com                                                                                  
Brittany, Cottingham                               Cottingham Plastics                                                                                  419-464-5273                                       plastic@onlineservice.com                                                                           
Bruce, Fogarty                                     Photography Niche                                                                                    598-791-1420                                       photoniche@usol.com                                                                                 
Bryan, Price                                       none on record                                                                                       804-674-9666                                       none on record                                                                                      
Calie, Zollman                                     Eagle Electronic                                                                                     929-763-2047                                       none on record                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Carey, Dailey                                      none on record                                                                                       728-896-2767                                       shelty@usol.com                                                                                     
Carl, Dallas                                       Water Analysts                                                                                       864-541-5114                                       analyzeh20@fast.com                                                                                 
Carl, Hague                                        none on record                                                                                       419-890-3531                                       none on record                                                                                      
Carrie, Buchko                                     none on record                                                                                       817-739-1335                                       goobert@free.com                                                                                    
Cathy, Bending                                     R and R Air                                                                                          765-617-2811                                       rrair@zeronet.net                                                                                   
Cathy, Harvey                                      The Employment Agency                                                                                336-477-0249                                       findwork@onlineservice.com                                                                          
Cecil, Scheetz                                     Tippe Inn                                                                                            207-679-9822                                       cecil@free.com                                                                                      
Charlene, Franks                                   Rydell High School                                                                                   307-892-2938                                       learn@rydell.edu                                                                                    
Charles, Jones                                     none on record                                                                                       919-774-5552                                       charlie@usol.com                                                                                    
Charles, Jones                                     Eagle Electronic                                                                                     919-774-5552                                       cjones@eagle.com                                                                                    
Chas, Funk                                         none on record                                                                                       860-498-3900                                       duck@usol.com                                                                                       

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Chris, Dunlap                                      none on record                                                                                       307-473-2281                                       none on record                                                                                      
Christina, Wilson                                  none on record                                                                                       316-210-8989                                       none on record                                                                                      
Dan, Lageveen                                      none on record                                                                                       307-344-8928                                       veenie@zeronet.net                                                                                  
Daniel, Barton                                     none on record                                                                                       915-894-8034                                       dannie@zeronet.net                                                                                  
Daniel, Ezra                                       Pools For You                                                                                        207-744-1997                                       swim@zeronet.net                                                                                    
Daniel, Hundnall                                   Bobs Repair Service                                                                                  918-830-9731                                       fixit@usol.com                                                                                      
Daniel, Rodkey                                     none on record                                                                                       719-748-3205                                       dannie@free.com                                                                                     
Daniel, Stabnik                                    none on record                                                                                       636-746-4124                                       none on record                                                                                      
Danita, Sharp                                      none on record                                                                                       360-650-5604                                       girlfriend@fast.com                                                                                 
Darlene Jenkins                                    Optical Images                                                                                       678-490-5461                                       DarJen@Germ.opticimag.com                                                                           
David Becker                                       Load It Up                                                                                           843-646-4187                                       BeckerDavid@Loadiu.com                                                                              

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
David, Chang                                       none on record                                                                                       740-750-1272                                       lion@free.com                                                                                       
David, Deppe                                       Eagle Electronic                                                                                     919-747-5155                                       none on record                                                                                      
David, Keck                                        Eagle Electronic                                                                                     919-747-9921                                       none on record                                                                                      
David, Schilling                                   none on record                                                                                       502-421-1516                                       none on record                                                                                      
David, Smith                                       none on record                                                                                       309-980-4350                                       emerald@onlineservice.com                                                                           
David, Tarter                                      Realty Specialties                                                                                   518-500-0570                                       estate@fast.com                                                                                     
David, Tietz                                       none on record                                                                                       651-912-1583                                       tietz@free.com                                                                                      
Dean, Eagon                                        none on record                                                                                       970-581-8611                                       none on record                                                                                      
Dean, Katpally                                     Phone Corporation                                                                                    808-799-3727                                       phonecorp@usol.com                                                                                  
Debra Cruz                                         Computer Fundamentals                                                                                812-547-7359                                       Debra@Francomp.com                                                                                  
Dennis, Drazer                                     Financial Planning Consul                                                                            253-315-4247                                       dollarplan@usol.com                                                                                 

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Dennis, Eberle                                     none on record                                                                                       515-708-1802                                       deber@free.com                                                                                      
Dennis, Mundy                                      none on record                                                                                       603-306-0774                                       rino@usol.com                                                                                       
Dennis, Sammons                                    Gards Auto Repair                                                                                    616-544-1969                                       repairit@free.com                                                                                   
Don, Kaleta                                        none on record                                                                                       724-695-2157                                       stud@zeronet.net                                                                                    
Don, Torres                                        Down Deep Drilling Inc.                                                                              706-649-6375                                       drill@usol.com                                                                                      
Donald Blythe                                      Make Some Noise Inc.                                                                                 520-486-6025                                       Dblythe@makenoise.com                                                                               
Dorlan, Bresnaham                                  none on record                                                                                       603-497-7374                                       dorlan@usol.com                                                                                     
Dorthy Beering                                     Actual  Computers                                                                                    213-465-4900                                       dbeering@actual.com                                                                                 
Doug, Blizzard                                     Collectibles Inc.                                                                                    228-646-5114                                       collectit@onlineservice.com                                                                         
Dusty, Jones                                       Railroad Express                                                                                     674-727-0511                                       rr@usol.com                                                                                         
Edna, Lilley                                       Eagle Electronic                                                                                     929-498-2840                                       elilley@eagle.com                                                                                   

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Elizabeth Clark                                    Luxury Laptops                                                                                       646-846-6232                                       eclark.com                                                                                          
Elizabeth, Derhammer                               none on record                                                                                       785-970-9916                                       lizzy@onlineservice.com                                                                             
Elizabeth, Henderson                               none on record                                                                                       449-486-8018                                       none on record                                                                                      
Eric, Becker                                       none on record                                                                                       910-717-7613                                       daddyo@usol.com                                                                                     
Eric, Fannon                                       none on record                                                                                       209-980-0812                                       ef@free.com                                                                                         
Eric, Quintero                                     none on record                                                                                       812-805-1588                                       diamond@onlineservice.com                                                                           
Eugene, Gasper                                     Regency Hospital                                                                                     705-580-6124                                       medcare@fast.com                                                                                    
Evelyn, Cassens                                    Vets Inc.                                                                                            302-762-9526                                       dr.animal@onlineservice.com                                                                         
Frank, Aamodt                                      Franklin Trinkets                                                                                    898-762-8741                                       fa@fast.com                                                                                         
Frank, Malady                                      none on record                                                                                       574-493-0510                                       frankmala@zeronet.net                                                                               
Gabrielle, Stevenson                               Eagle Electronic                                                                                     929-763-4873                                       gstevenson@eagle.com                                                                                

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Gary Mikels                                        Networking Alliance                                                                                  505-660-9632                                       GaryMikels@Swiss.Alliance.com                                                                       
Gary, German                                       Eagle Electronic                                                                                     919-774-3325                                       ggerman@eagle.com                                                                                   
Gary, Kempf                                        none on record                                                                                       937-724-7313                                       kempfg@free.com                                                                                     
Geo, Schofield                                     Cleaning Supply                                                                                      228-480-9751                                       cleanit@usol.com                                                                                    
George, Purcell                                    BMA Advertising Design                                                                               432-320-6905                                       design@zeronet.net                                                                                  
George, Trenkle                                    none on record                                                                                       856-267-7913                                       cold@fast.com                                                                                       
Gerald, Campbell                                   none on record                                                                                       431-087-1044                                       gcampbell@free.com                                                                                  
Ginger, Xiao                                       Bryant Accounting                                                                                    605-846-0451                                       acctsbryant@zeronet.net                                                                             
Gordon Mayes                                       Modem Magicians                                                                                      207-634-1969                                       Gordon@den.modmagic.com                                                                             
Gregory, Abbott                                    Baker and Company                                                                                    812-447-3621                                       greggie@usol.com                                                                                    
Gregory, Hettinger                                 Eagle Electronic                                                                                     929-498-7144                                       none on record                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Heather, Wallpe                                    Reflexions Manufacturing                                                                             816-433-9799                                       flex@onlineservice.com                                                                              
Heather, Waters                                    Happytime Escort Service                                                                             869-741-7817                                       dates@free.com                                                                                      
Helene, Ziekart                                    none on record                                                                                       203-244-9192                                       none on record                                                                                      
Hugo, Gillespie                                    Wadake Critters                                                                                      785-981-0669                                       critters@free.com                                                                                   
Irene, Poczekay                                    none on record                                                                                       401-461-9567                                       none on record                                                                                      
Jack, Akers                                        none on record                                                                                       301-454-6061                                       pizazz@usol.com                                                                                     
Jack, Barrick                                      First National Bank                                                                                  786-494-4782                                       1natbank@free.com                                                                                   
Jack, Brose                                        Eagle Electronic                                                                                     919-486-5104                                       none on record                                                                                      
Jack, Illingworth                                  none on record                                                                                       914-748-9829                                       illing@free.com                                                                                     
Jacob, Richer                                      none on record                                                                                       425-942-3763                                       laugh@free.com                                                                                      
James, Gross                                       none on record                                                                                       908-879-8672                                       jgross@fast.com                                                                                     

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
James, Jones                                       none on record                                                                                       971-522-5851                                       puffy@fast.com                                                                                      
James, King                                        none on record                                                                                       207-708-3317                                       jamesk@usol.com                                                                                     
James, Laake                                       none on record                                                                                       613-785-7063                                       none on record                                                                                      
James, Schilling                                   none on record                                                                                       319-429-9772                                       none on record                                                                                      
Jamie Pickett                                      Miracle Machines                                                                                     937-147-2569                                       jpickett@machinemiracle.com                                                                         
Jamie, Osman                                       Eagle Electronic                                                                                     919-486-2519                                       josman@eagle.com                                                                                    
Jamie, Thompson                                    none on record                                                                                       706-471-1222                                       jthompson@onlineservice.com                                                                         
Jane, Mumford                                      none on record                                                                                       270-428-5866                                       none on record                                                                                      
Jared, Meers                                       South Street Rehabilitation                                                                          701-371-1701                                       rehabsouth@zeronet.net                                                                              
Jason, Krasner                                     Eagle Electronic                                                                                     919-774-7920                                       none on record                                                                                      
Jason, Laxton                                      none on record                                                                                       978-860-2824                                       coondog@usol.com                                                                                    

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Jason, Wendling                                    Eagle Electronic                                                                                     919-774-6798                                       jwendling@eagle.com                                                                                 
Jay, Hanau                                         none on record                                                                                       773-490-8254                                       none on record                                                                                      
Jeff, Kowaiski                                     Quality Equipment Corp.                                                                              212-492-5644                                       equipit@usol.com                                                                                    
Jeffery, Jordan                                    none on record                                                                                       509-989-9996                                       seeya@usol.com                                                                                      
Jennie Fry                                         Pick Your Parts                                                                                      806-456-6285                                       Jfry@yourparts.com                                                                                  
Jennifer, Hundley                                  none on record                                                                                       304-713-3298                                       jenhund@fast.com                                                                                    
Jennifer, Kmec                                     Kelly Dance Studio                                                                                   443-542-1386                                       dancingk@free.com                                                                                   
Jerry, Mennen                                      none on record                                                                                       520-306-8426                                       mennenj@free.com                                                                                    
Jerry, Muench                                      none on record                                                                                       464-669-8537                                       redhot@onlineservice.com                                                                            
Jessica, Cain                                      none on record                                                                                       517-901-2610                                       none on record                                                                                      
Jessica, Nakamura                                  Automart                                                                                             605-324-2193                                       carsell@usol.com                                                                                    

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Jim, Lichty                                        Bankruptcy Help                                                                                      618-847-1904                                       bankrupt@usol.com                                                                                   
Jim, Manaugh                                       Eagle Electronic                                                                                     919-747-5603                                       jmanaugh@eagle.com                                                                                  
Jim, Manaugh                                       none on record                                                                                       919-747-5603                                       jmanaugh@eagle.com                                                                                  
Jim, Sokeland                                      Powerful Employment                                                                                  723-366-1117                                       employment@zeronet.net                                                                              
Jim, Webb                                          none on record                                                                                       978-204-3019                                       none on record                                                                                      
Jo, Jacko                                          none on record                                                                                       856-752-7471                                       none on record                                                                                      
Joan, Hedden                                       none on record                                                                                       501-710-0658                                       none on record                                                                                      
Joanne, Rosner                                     Eagle Electronic                                                                                     919-486-2822                                       none on record                                                                                      
John, Garcia                                       none on record                                                                                       207-311-0174                                       jgar@onlineservice.com                                                                              
John, McGinnis                                     none on record                                                                                       208-741-1963                                       john@zeronet.net                                                                                    
John, Skadberg                                     none on record                                                                                       513-282-3919                                       skad@zeronet.net                                                                                    

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Jon, Clute                                         none on record                                                                                       480-181-8940                                       none on record                                                                                      
Jonathon, Blanco                                   none on record                                                                                       902-226-1858                                       hammer@free.com                                                                                     
Joseph, Platt                                      Eagle Electronic                                                                                     929-763-5228                                       none on record                                                                                      
Joseph, Schuman                                    none on record                                                                                       330-209-1273                                       none on record                                                                                      
Joshua, Cole                                       none on record                                                                                       865-269-7782                                       fido@zeronet.net                                                                                    
Juicheng, Nugent                                   none on record                                                                                       802-352-8923                                       nugent@fast.com                                                                                     
Kara, Orze                                         Appliances Inc.                                                                                      414-773-1017                                       appinc@zeronet.net                                                                                  
Karen, Burns                                       Recreation Supply                                                                                    707-598-2670                                       burnskaren@fast.com                                                                                 
Karen, Mangus                                      none on record                                                                                       863-623-0459                                       missright@onlineservice.com                                                                         
Karen, Marko                                       none on record                                                                                       580-555-1871                                       marko@usol.com                                                                                      
Karen, Randolph                                    none on record                                                                                       603-744-9002                                       cookin@zeronet.net                                                                                  

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Kathleen, Plyman                                   Needle Center                                                                                        507-543-2052                                       needles@onlineservice.com                                                                           
Kathleen, Xolo                                     Eagle Electronic                                                                                     929-763-5513                                       kxolo@eagle.com                                                                                     
Kathryn, Deagen                                    Eagle Electronic                                                                                     919-747-9164                                       none on record                                                                                      
Kathy, Gunderson                                   none on record                                                                                       941-330-3314                                       none on record                                                                                      
Kelli Jones                                        Dot Com Incorporated                                                                                 912-647-0391                                       kjoneskelli@DCI.com                                                                                 
Kelly, Jordan                                      Supplying Crafts                                                                                     727-951-7737                                       supplycrafts@fast.com                                                                               
Kenneth, Mintier                                   none on record                                                                                       323-673-0690                                       builder@usol.com                                                                                    
Kenneth, Wilcox                                    none on record                                                                                       515-872-8848                                       kenny@onlineservice.com                                                                             
Kevin Martin                                       Easy Accessories                                                                                     606-677-9789                                       kmartin@easyaccess.com                                                                              
Kevin, Jackson                                     none on record                                                                                       225-624-2341                                       none on record                                                                                      
Kevin, Zubarev                                     Signs Signs Signs                                                                                    208-364-3785                                       sign3@fast.com                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Kimber, Spaller                                    none on record                                                                                       878-119-5448                                       mcgimmie@zero.net                                                                                   
Kris, Shinn                                        none on record                                                                                       469-740-2748                                       shinnk@zeronet.net                                                                                  
Kristen, Gustavel                                  Eagle Electronic                                                                                     919-747-1530                                       kgustavel@eagle.com                                                                                 
Kristey, Moore                                     Eagle Electronic                                                                                     919-486-6765                                       none on record                                                                                      
Kristy, Moore                                      none on record                                                                                       919-486-6765                                       fluffy@onlineservice.com                                                                            
Lance Andrews                                      Monitors for You                                                                                     972-534-7322                                       LanceA@braz.monitorU.com                                                                            
Larry, Gardiner                                    none on record                                                                                       225-313-6268                                       square@onlineserveice.com                                                                           
Larry, Osmanova                                    City Bus Transport                                                                                   541-905-4819                                       citybus@fast.com                                                                                    
Laura, Rodgers                                     Eagle Electronic                                                                                     929-763-0691                                       none on record                                                                                      
Lawrence, Pullen                                   none on record                                                                                       644-591-3243                                       laurie@free.com                                                                                     
Linda, Bowen                                       none on record                                                                                       605-234-4114                                       none on record                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Linda, Hari                                        none on record                                                                                       270-411-2316                                       none on record                                                                                      
Linda, Li                                          none on record                                                                                       203-744-4677                                       ll@free.com                                                                                         
Lisa, Pettry                                       none on record                                                                                       702-799-7272                                       lpett@zeronet.net                                                                                   
Loraine Platt                                      Greatest Components                                                                                  520-475-5322                                       LoraineP@ComponGerm.com                                                                             
Lou, Caldwell                                      none on record                                                                                       606-901-1238                                       lucky@fast.com                                                                                      
Louise, Cool                                       none on record                                                                                       208-956-0698                                       none on record                                                                                      
Lucille, Appleton                                  none on record                                                                                       914-497-2160                                       muscle@zeronet.net                                                                                  
Lynne, Lagunes                                     none on record                                                                                       208-502-9976                                       hello@zeronet.net                                                                                   
Marc, Williams                                     none on record                                                                                       435-774-4595                                       peanut@fast.com                                                                                     
Marjorie, Vandermay                                National Art Museum                                                                                  308-489-1137                                       nam@fast com                                                                                        
Marla, Reeder                                      none on record                                                                                       728-442-3031                                       reedmar@zeronet.net                                                                                 

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Marty, Fay                                         none on record                                                                                       501-631-3727                                       sparky@free.com                                                                                     
Mary Ann, Rausch                                   none on record                                                                                       307-944-3324                                       spiritual@free.com                                                                                  
Mary Jo, Wales                                     none on record                                                                                       852-441-4984                                       jomary@onlineservice.com                                                                            
Mary, Deets                                        Camping Supplies                                                                                     808-562-4081                                       camphere@fast.com                                                                                   
Mary, Uhl                                          Flowers by Mickey                                                                                    803-974-2809                                       mouse@fast.com                                                                                      
Matt, Nakanishi                                    none on record                                                                                       435-710-5324                                       nakan@free.com                                                                                      
Matt, Shade                                        none on record                                                                                       623-422-6616                                       shadtree@free.com                                                                                   
Matt, Smith                                        none on record                                                                                       719-822-8828                                       matsm@fast.com                                                                                      
Matthew, Quant                                     none on record                                                                                       910-577-1319                                       walker@onlineservice.com                                                                            
Meghan, Tyrie                                      Eagle Electronic                                                                                     919-747-8589                                       mtyrie@eagle.com                                                                                    
Melissa, Alvarez                                   Eagle Electronic                                                                                     919-747-3781                                       none on record                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Melody, Fazal                                      none on record                                                                                       760-877-4849                                       melfazal@zeronet.net                                                                                
Meredith, Rushing                                  none on record                                                                                       606-608-2105                                       merry@free.com                                                                                      
Michael, Abbott                                    Eagle Electronic                                                                                     919-774-2720                                       mabbott@eagle.com                                                                                   
Michael, Emore                                     none on record                                                                                       352-472-1224                                       mikemore@usol.com                                                                                   
Michael, Tendam                                    none on record                                                                                       406-424-7496                                       flute@usol.com                                                                                      
Michelle, Nairn                                    Eagle Electronic                                                                                     919-486-6919                                       none on record                                                                                      
Michelle, Oakley                                   none on record                                                                                       978-514-5425                                       littleone@usol.com                                                                                  
Mike, Condie                                       Kids Recreation Inc.                                                                                 336-211-1238                                       kidrec@zeronet.net                                                                                  
Mike, Dunbar                                       none on record                                                                                       208-297-5374                                       duh@onlineservice.com                                                                               
Mildred, Jones                                     Computer Consultants                                                                                 610-437-6687                                       compconsul@usol.com                                                                                 
Nancy, Basham                                      none on record                                                                                       207-422-7135                                       none on record                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Nicholas, Albregts                                 Eagle Electronic                                                                                     929-763-4843                                       none on record                                                                                      
Noemi, Elston                                      North Street Church                                                                                  307-359-9514                                       closetoheaven@zeronet.net                                                                           
Norman, Fields                                     The Cable Company                                                                                    501-346-4841                                       catv@onlineservice.com                                                                              
Orville, Gilliland                                 Easy Internet Access                                                                                 490-263-2957                                       eia@zeronet.net                                                                                     
Pam Krick                                          Printing Associated                                                                                  860-624-2539                                       pkrick@Passoc.com                                                                                   
Patricha, Underwood                                Eagle Electronic                                                                                     929-498-1956                                       none on record                                                                                      
Patricia, Leong                                    none on record                                                                                       520-247-4141                                       patrice@usol.com                                                                                    
Patrick, Bollock                                   none on record                                                                                       307-635-1692                                       pat@fast.com                                                                                        
Paul Smith                                         Computer Video                                                                                       219-703-2277                                       psmith@computervideo.comq                                                                           
Paul, Eckelman                                     Eagle Electronic                                                                                     919-486-6410                                       peckelman@eagle.com                                                                                 
Paul, Kaakeh                                       Laser Graphics Associates                                                                            719-750-4539                                       graphit@usol.com                                                                                    

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Paul, Rice                                         none on record                                                                                       719-541-1837                                       paulier@onlineservice.com                                                                           
Paul, Sullivan                                     none on record                                                                                       785-322-5896                                       sullie@zeronet.net                                                                                  
Peter, Austin                                      none on record                                                                                       803-343-6063                                       none on record                                                                                      
Phil, Reece                                        none on record                                                                                       919-486-0649                                       sly@zeronet.net                                                                                     
Phil, Reece                                        Eagle Electronic                                                                                     919-486-0649                                       none on record                                                                                      
Phillip, Hession                                   none on record                                                                                       231-711-6837                                       howdy@usol.com                                                                                      
Rachel, Davis                                      none on record                                                                                       702-907-4818                                       rachdav@zeronet.net                                                                                 
Randall, Neely                                     Store It Here                                                                                        802-319-9805                                       storage@fast.com                                                                                    
Randolph, Darling                                  none on record                                                                                       860-684-1620                                       randolph@fast.com                                                                                   
Randy, Talauage                                    Ceramic Supply                                                                                       347-671-2022                                       paintit@fast.com                                                                                    
Richard, Kluth                                     Main St. Bar and Grill                                                                               302-296-8012                                       rickkluth@free.com                                                                                  

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Richard, Scott                                     Karate Made Easy                                                                                     304-774-2226                                       kick@onlineservice.com                                                                              
Richard, Stetler                                   none on record                                                                                       256-412-8112                                       screwball@free.com                                                                                  
Richard, Strehle                                   Vacation Car Rentals                                                                                 206-434-7305                                       vacation@fast.com                                                                                   
Richard, Zito                                      none on record                                                                                       603-787-0787                                       rzito@zeronet.net                                                                                   
Rita, Bush                                         Eagle Electronic                                                                                     919-747-4397                                       rbush@eagle.com                                                                                     
Rob Thomas                                         Accessories and More                                                                                 484-374-1998                                       rthomas@bestchoice.com                                                                              
Robert, Cortez                                     none on record                                                                                       603-442-3740                                       none on record                                                                                      
Robert, Dalury                                     TAS                                                                                                  906-278-6446                                       tas@zeronet.net                                                                                     
Robert, Lister                                     Fire Alarm Systems                                                                                   801-404-1240                                       fines@free.com                                                                                      
Ronald, Day                                        Eagle Electronic                                                                                     929-763-6488                                       none on record                                                                                      
Ronald, Miller                                     none on record                                                                                       734-820-2076                                       picky@zeronet.net                                                                                   

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Rosemary, Vanderhoff                               none on record                                                                                       770-293-8783                                       none on record                                                                                      
Roy, Beer                                          none on record                                                                                       206-745-2584                                       wizzy@usol.com                                                                                      
Roy, McGrew                                        none on record                                                                                       208-324-0783                                       grow@zeronet.net                                                                                    
Russ, Mann                                         none on record                                                                                       775-549-1798                                       scooter@onlineservice.com                                                                           
Ruth, Albeering                                    none on record                                                                                       784-444-0131                                       rabeering@free.com                                                                                  
Ruth, Ball                                         none on record                                                                                       651-479-7538                                       none on record                                                                                      
Ryan, Stahley                                      Eagle Electronic                                                                                     919-774-5340                                       rstahley@eagle.com                                                                                  
Ryan, Stahley                                      none on record                                                                                       919-774-5340                                       rstahley@eagle.com                                                                                  
Sally, Valle                                       Investment Specialties                                                                               972-234-2044                                       roi@usol.com                                                                                        
Sandy Goodman                                      Connexions                                                                                           208-614-3136                                       Sgoodman@connex.com                                                                                 
Sarah, McCammon                                    none on record                                                                                       520-438-7944                                       squirrel@zeronet.net                                                                                

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Scott, Gray                                        Security Installation                                                                                484-453-7105                                       keepsafe@zeronet.net                                                                                
Scott, Yarian                                      none on record                                                                                       252-310-2224                                       syarian@fast.com                                                                                    
Sean, Akropolis                                    none on record                                                                                       907-262-4254                                       pickle@free.com                                                                                     
Sharon, Rouls                                      Sharons Shamrock                                                                                     205-246-3224                                       irish@free.com                                                                                      
Sherman, Cheswick                                  Eagle Electronic                                                                                     929-498-8150                                       scheswick@eagle.com                                                                                 
Sherry, Garling                                    Manufactured Homes Corp.                                                                             353-822-7623                                       homely@fast.com                                                                                     
Shirley, Osborne                                   none on record                                                                                       706-333-7174                                       none on record                                                                                      
Stephanie, Pearl                                   none on record                                                                                       660-447-8319                                       mommyl@fast.com                                                                                     
Stephanie, Yeinick                                 Tuckers Jewels                                                                                       573-455-4278                                       jewels@usol.com                                                                                     
Stephen Bird                                       Storage Specialties                                                                                  540-514-1415                                       sbird@storeit.com                                                                                   
Steve, Cochran                                     Eagle Electronic                                                                                     929-763-1283                                       none on record                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Steve, Fulkerson                                   Cellular Services                                                                                    602-129-1885                                       cellcall@usol.com                                                                                   
Steve, Hess                                        Eagle Electronic                                                                                     919-486-8804                                       none on record                                                                                      
Steven, Hickman                                    Eagle Electronic                                                                                     919-774-4874                                       shickman@eagle.com                                                                                  
Steven, Yaun                                       none on record                                                                                       317-780-9804                                       yawn@fast.com                                                                                       
Susan, Strong                                      Family Medical Center                                                                                912-760-7840                                       fammed@onlineservice.com                                                                            
Susan, Watson                                      none on record                                                                                       801-746-7701                                       mswatson@fast.com                                                                                   
Tammi, Baldocchio                                  none on record                                                                                       401-989-4975                                       none on record                                                                                      
Ted, Zissa                                         none on record                                                                                       405-151-7445                                       none on record                                                                                      
Terry, Xu                                          none on record                                                                                       417-546-2570                                       muffin@fast.com                                                                                     
Thomas, Wolfe                                      none on record                                                                                       610-365-9766                                       wolf@onlineservice.com                                                                              
Thomas, Zelenka                                    none on record                                                                                       603-374-3706                                       zelenka@free.com                                                                                    

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Thurman Mezzo                                      Playing Around                                                                                       415-967-1415                                       tmezzo@playingaround.com                                                                            
Tim White                                          Network Niche                                                                                        517-777-1905                                       twhite@networkN.com                                                                                 
Tim, Carlton                                       none on record                                                                                       203-608-3465                                       none on record                                                                                      
Tim, Leffert                                       Trailor Rentals                                                                                      315-486-4777                                       trailrent@zeronet.net                                                                               
Tim, Parker                                        none on record                                                                                       315-985-4102                                       jeckle@onlineservice.com                                                                            
Timothy Neal                                       Computer Accessories                                                                                 704-736-9458                                       tneal@compAccess.com                                                                                
Tina, Yates                                        Eagle Electronic                                                                                     929-763-4438                                       tyates@eagle.com                                                                                    
Todd, Vigus                                        Eagle Electronic                                                                                     919-486-7143                                       tvigus@eagle.com                                                                                    
Tom, Baker                                         none on record                                                                                       414-778-5640                                       bologna@free.com                                                                                    
Tom, Irelan                                        none on record                                                                                       240-634-5581                                       tucker@free.com                                                                                     
Tom, Moore                                         none on record                                                                                       270-692-2845                                       seedle@fast.com                                                                                     

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Tommy, McFerren                                    Cole Sales and Associates                                                                            503-767-7054                                       mcferren@cole.com                                                                                   
Tonya, Owens                                       none on record                                                                                       843-773-2751                                       none on record                                                                                      
Tracy, Cicholski                                   Dixon Pharmacy                                                                                       601-959-1315                                       dixpharm@free.com                                                                                   
Travis Honn                                        Radiant Computers                                                                                    303-564-1515                                       thonn@radiant.com                                                                                   
Travis, Camargo                                    none on record                                                                                       816-746-4913                                       none on record                                                                                      
Trevor, Snuffer                                    none on record                                                                                       336-185-0630                                       snuffer@zeronet.net                                                                                 
Trudi, Antonio                                     none on record                                                                                       718-747-3259                                       toni@onlineservice.com                                                                              
Verna, McGrew                                      none on record                                                                                       334-547-9329                                       verngrew@free.com                                                                                   
Wade Holle                                         Just Link It                                                                                         887-746-6174                                       Wade@jLi.com                                                                                        
Wade, Jacobs                                       Conner National                                                                                      803-477-5347                                       connernat@usol.com                                                                                  
William Newlon                                     Creative Computer Solutions                                                                          909-452-4936                                       Wnewlon@ccs.com                                                                                     

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Yauleng Depoe                                      Scanning the World                                                                                   313-475-1177                                       ydepoe@sw.com                                                                                       
Zach, McGrew                                       none on record                                                                                       520-730-8494                                       none on record                                                                                      
Zack, Hill                                         none on record                                                                                       503-794-2322                                       boogie@free.com                                                                                     

300 rows selected. 


Question 5

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Adam Cyr                                           Cables Anywhere                                                                                      315-474-5634                                       acyr@cablesany.com                                                                                  
Alice Mynhier                                      Magic Components                                                                                     303-696-0557                                       almyn@Nway.magcomp.com                                                                              
Allen, Robles                                      Copy Center                                                                                          644-730-8090                                       copy@onlineservice.com                                                                              
Allison, Roland                                    Eagle Electronic                                                                                     929-498-4174                                       none on record                                                                                      
Amy, Heide                                         Outlets                                                                                              802-894-1024                                       letout@usol.com                                                                                     
Angie, Hoover                                      Goodwork Corporation                                                                                 307-459-4165                                       ahoover@free.com                                                                                    
Anita, Pastron                                     Industrail Contracting Co                                                                            901-796-4654                                       contracts@fast.com                                                                                  
Archie, Doremski                                   Greenpart Steet Metal                                                                                307-944-8959                                       sheetz@free.com                                                                                     
Aricka, Bross                                      Apartment Referrals                                                                                  419-676-9758                                       placetolive@free.com                                                                                
Austin, Ortman                                     Eagle Electronic                                                                                     919-774-9999                                       none on record                                                                                      
Beth, Zobitz                                       Eagle Electronic                                                                                     919-747-8404                                       bzobitz@eagle.com                                                                                   

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Brenda Pritchett                                   Wizard Electronics                                                                                   302-696-1000                                       bpritchett@wizelec.com                                                                              
Brenda, Kitchel                                    Cheesman Corporation                                                                                 804-214-8732                                       cheesman@zeronet.net                                                                                
Bridgette, Kyger                                   Sampson Home Mortgages                                                                               301-467-6480                                       homeloans@fast.com                                                                                  
Brittany, Cottingham                               Cottingham Plastics                                                                                  419-464-5273                                       plastic@onlineservice.com                                                                           
Bruce, Fogarty                                     Photography Niche                                                                                    598-791-1420                                       photoniche@usol.com                                                                                 
Calie, Zollman                                     Eagle Electronic                                                                                     929-763-2047                                       none on record                                                                                      
Carl, Dallas                                       Water Analysts                                                                                       864-541-5114                                       analyzeh20@fast.com                                                                                 
Cathy, Bending                                     R and R Air                                                                                          765-617-2811                                       rrair@zeronet.net                                                                                   
Cathy, Harvey                                      The Employment Agency                                                                                336-477-0249                                       findwork@onlineservice.com                                                                          
Cecil, Scheetz                                     Tippe Inn                                                                                            207-679-9822                                       cecil@free.com                                                                                      
Charlene, Franks                                   Rydell High School                                                                                   307-892-2938                                       learn@rydell.edu                                                                                    

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Charles, Jones                                     Eagle Electronic                                                                                     919-774-5552                                       cjones@eagle.com                                                                                    
Daniel, Ezra                                       Pools For You                                                                                        207-744-1997                                       swim@zeronet.net                                                                                    
Daniel, Hundnall                                   Bobs Repair Service                                                                                  918-830-9731                                       fixit@usol.com                                                                                      
Darlene Jenkins                                    Optical Images                                                                                       678-490-5461                                       DarJen@Germ.opticimag.com                                                                           
David Becker                                       Load It Up                                                                                           843-646-4187                                       BeckerDavid@Loadiu.com                                                                              
David, Deppe                                       Eagle Electronic                                                                                     919-747-5155                                       none on record                                                                                      
David, Keck                                        Eagle Electronic                                                                                     919-747-9921                                       none on record                                                                                      
David, Tarter                                      Realty Specialties                                                                                   518-500-0570                                       estate@fast.com                                                                                     
Dean, Katpally                                     Phone Corporation                                                                                    808-799-3727                                       phonecorp@usol.com                                                                                  
Debra Cruz                                         Computer Fundamentals                                                                                812-547-7359                                       Debra@Francomp.com                                                                                  
Dennis, Drazer                                     Financial Planning Consul                                                                            253-315-4247                                       dollarplan@usol.com                                                                                 

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Dennis, Sammons                                    Gards Auto Repair                                                                                    616-544-1969                                       repairit@free.com                                                                                   
Don, Torres                                        Down Deep Drilling Inc.                                                                              706-649-6375                                       drill@usol.com                                                                                      
Donald Blythe                                      Make Some Noise Inc.                                                                                 520-486-6025                                       Dblythe@makenoise.com                                                                               
Dorthy Beering                                     Actual  Computers                                                                                    213-465-4900                                       dbeering@actual.com                                                                                 
Doug, Blizzard                                     Collectibles Inc.                                                                                    228-646-5114                                       collectit@onlineservice.com                                                                         
Dusty, Jones                                       Railroad Express                                                                                     674-727-0511                                       rr@usol.com                                                                                         
Edna, Lilley                                       Eagle Electronic                                                                                     929-498-2840                                       elilley@eagle.com                                                                                   
Elizabeth Clark                                    Luxury Laptops                                                                                       646-846-6232                                       eclark.com                                                                                          
Eugene, Gasper                                     Regency Hospital                                                                                     705-580-6124                                       medcare@fast.com                                                                                    
Evelyn, Cassens                                    Vets Inc.                                                                                            302-762-9526                                       dr.animal@onlineservice.com                                                                         
Frank, Aamodt                                      Franklin Trinkets                                                                                    898-762-8741                                       fa@fast.com                                                                                         

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Gabrielle, Stevenson                               Eagle Electronic                                                                                     929-763-4873                                       gstevenson@eagle.com                                                                                
Gary Mikels                                        Networking Alliance                                                                                  505-660-9632                                       GaryMikels@Swiss.Alliance.com                                                                       
Gary, German                                       Eagle Electronic                                                                                     919-774-3325                                       ggerman@eagle.com                                                                                   
Geo, Schofield                                     Cleaning Supply                                                                                      228-480-9751                                       cleanit@usol.com                                                                                    
George, Purcell                                    BMA Advertising Design                                                                               432-320-6905                                       design@zeronet.net                                                                                  
Ginger, Xiao                                       Bryant Accounting                                                                                    605-846-0451                                       acctsbryant@zeronet.net                                                                             
Gordon Mayes                                       Modem Magicians                                                                                      207-634-1969                                       Gordon@den.modmagic.com                                                                             
Gregory, Abbott                                    Baker and Company                                                                                    812-447-3621                                       greggie@usol.com                                                                                    
Gregory, Hettinger                                 Eagle Electronic                                                                                     929-498-7144                                       none on record                                                                                      
Heather, Wallpe                                    Reflexions Manufacturing                                                                             816-433-9799                                       flex@onlineservice.com                                                                              
Heather, Waters                                    Happytime Escort Service                                                                             869-741-7817                                       dates@free.com                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Hugo, Gillespie                                    Wadake Critters                                                                                      785-981-0669                                       critters@free.com                                                                                   
Jack, Barrick                                      First National Bank                                                                                  786-494-4782                                       1natbank@free.com                                                                                   
Jack, Brose                                        Eagle Electronic                                                                                     919-486-5104                                       none on record                                                                                      
Jamie Pickett                                      Miracle Machines                                                                                     937-147-2569                                       jpickett@machinemiracle.com                                                                         
Jamie, Osman                                       Eagle Electronic                                                                                     919-486-2519                                       josman@eagle.com                                                                                    
Jared, Meers                                       South Street Rehabilitation                                                                          701-371-1701                                       rehabsouth@zeronet.net                                                                              
Jason, Krasner                                     Eagle Electronic                                                                                     919-774-7920                                       none on record                                                                                      
Jason, Wendling                                    Eagle Electronic                                                                                     919-774-6798                                       jwendling@eagle.com                                                                                 
Jeff, Kowaiski                                     Quality Equipment Corp.                                                                              212-492-5644                                       equipit@usol.com                                                                                    
Jennie Fry                                         Pick Your Parts                                                                                      806-456-6285                                       Jfry@yourparts.com                                                                                  
Jennifer, Kmec                                     Kelly Dance Studio                                                                                   443-542-1386                                       dancingk@free.com                                                                                   

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Jessica, Nakamura                                  Automart                                                                                             605-324-2193                                       carsell@usol.com                                                                                    
Jim, Lichty                                        Bankruptcy Help                                                                                      618-847-1904                                       bankrupt@usol.com                                                                                   
Jim, Manaugh                                       Eagle Electronic                                                                                     919-747-5603                                       jmanaugh@eagle.com                                                                                  
Jim, Sokeland                                      Powerful Employment                                                                                  723-366-1117                                       employment@zeronet.net                                                                              
Joanne, Rosner                                     Eagle Electronic                                                                                     919-486-2822                                       none on record                                                                                      
Joseph, Platt                                      Eagle Electronic                                                                                     929-763-5228                                       none on record                                                                                      
Kara, Orze                                         Appliances Inc.                                                                                      414-773-1017                                       appinc@zeronet.net                                                                                  
Karen, Burns                                       Recreation Supply                                                                                    707-598-2670                                       burnskaren@fast.com                                                                                 
Kathleen, Plyman                                   Needle Center                                                                                        507-543-2052                                       needles@onlineservice.com                                                                           
Kathleen, Xolo                                     Eagle Electronic                                                                                     929-763-5513                                       kxolo@eagle.com                                                                                     
Kathryn, Deagen                                    Eagle Electronic                                                                                     919-747-9164                                       none on record                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Kelli Jones                                        Dot Com Incorporated                                                                                 912-647-0391                                       kjoneskelli@DCI.com                                                                                 
Kelly, Jordan                                      Supplying Crafts                                                                                     727-951-7737                                       supplycrafts@fast.com                                                                               
Kevin Martin                                       Easy Accessories                                                                                     606-677-9789                                       kmartin@easyaccess.com                                                                              
Kevin, Zubarev                                     Signs Signs Signs                                                                                    208-364-3785                                       sign3@fast.com                                                                                      
Kristen, Gustavel                                  Eagle Electronic                                                                                     919-747-1530                                       kgustavel@eagle.com                                                                                 
Kristey, Moore                                     Eagle Electronic                                                                                     919-486-6765                                       none on record                                                                                      
Lance Andrews                                      Monitors for You                                                                                     972-534-7322                                       LanceA@braz.monitorU.com                                                                            
Larry, Osmanova                                    City Bus Transport                                                                                   541-905-4819                                       citybus@fast.com                                                                                    
Laura, Rodgers                                     Eagle Electronic                                                                                     929-763-0691                                       none on record                                                                                      
Loraine Platt                                      Greatest Components                                                                                  520-475-5322                                       LoraineP@ComponGerm.com                                                                             
Marjorie, Vandermay                                National Art Museum                                                                                  308-489-1137                                       nam@fast com                                                                                        

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Mary, Deets                                        Camping Supplies                                                                                     808-562-4081                                       camphere@fast.com                                                                                   
Mary, Uhl                                          Flowers by Mickey                                                                                    803-974-2809                                       mouse@fast.com                                                                                      
Meghan, Tyrie                                      Eagle Electronic                                                                                     919-747-8589                                       mtyrie@eagle.com                                                                                    
Melissa, Alvarez                                   Eagle Electronic                                                                                     919-747-3781                                       none on record                                                                                      
Michael, Abbott                                    Eagle Electronic                                                                                     919-774-2720                                       mabbott@eagle.com                                                                                   
Michelle, Nairn                                    Eagle Electronic                                                                                     919-486-6919                                       none on record                                                                                      
Mike, Condie                                       Kids Recreation Inc.                                                                                 336-211-1238                                       kidrec@zeronet.net                                                                                  
Mildred, Jones                                     Computer Consultants                                                                                 610-437-6687                                       compconsul@usol.com                                                                                 
Nicholas, Albregts                                 Eagle Electronic                                                                                     929-763-4843                                       none on record                                                                                      
Noemi, Elston                                      North Street Church                                                                                  307-359-9514                                       closetoheaven@zeronet.net                                                                           
Norman, Fields                                     The Cable Company                                                                                    501-346-4841                                       catv@onlineservice.com                                                                              

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Orville, Gilliland                                 Easy Internet Access                                                                                 490-263-2957                                       eia@zeronet.net                                                                                     
Pam Krick                                          Printing Associated                                                                                  860-624-2539                                       pkrick@Passoc.com                                                                                   
Patricha, Underwood                                Eagle Electronic                                                                                     929-498-1956                                       none on record                                                                                      
Paul Smith                                         Computer Video                                                                                       219-703-2277                                       psmith@computervideo.comq                                                                           
Paul, Eckelman                                     Eagle Electronic                                                                                     919-486-6410                                       peckelman@eagle.com                                                                                 
Paul, Kaakeh                                       Laser Graphics Associates                                                                            719-750-4539                                       graphit@usol.com                                                                                    
Phil, Reece                                        Eagle Electronic                                                                                     919-486-0649                                       none on record                                                                                      
Randall, Neely                                     Store It Here                                                                                        802-319-9805                                       storage@fast.com                                                                                    
Randy, Talauage                                    Ceramic Supply                                                                                       347-671-2022                                       paintit@fast.com                                                                                    
Richard, Kluth                                     Main St. Bar and Grill                                                                               302-296-8012                                       rickkluth@free.com                                                                                  
Richard, Scott                                     Karate Made Easy                                                                                     304-774-2226                                       kick@onlineservice.com                                                                              

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Richard, Strehle                                   Vacation Car Rentals                                                                                 206-434-7305                                       vacation@fast.com                                                                                   
Rita, Bush                                         Eagle Electronic                                                                                     919-747-4397                                       rbush@eagle.com                                                                                     
Rob Thomas                                         Accessories and More                                                                                 484-374-1998                                       rthomas@bestchoice.com                                                                              
Robert, Dalury                                     TAS                                                                                                  906-278-6446                                       tas@zeronet.net                                                                                     
Robert, Lister                                     Fire Alarm Systems                                                                                   801-404-1240                                       fines@free.com                                                                                      
Ronald, Day                                        Eagle Electronic                                                                                     929-763-6488                                       none on record                                                                                      
Ryan, Stahley                                      Eagle Electronic                                                                                     919-774-5340                                       rstahley@eagle.com                                                                                  
Sally, Valle                                       Investment Specialties                                                                               972-234-2044                                       roi@usol.com                                                                                        
Sandy Goodman                                      Connexions                                                                                           208-614-3136                                       Sgoodman@connex.com                                                                                 
Scott, Gray                                        Security Installation                                                                                484-453-7105                                       keepsafe@zeronet.net                                                                                
Sharon, Rouls                                      Sharons Shamrock                                                                                     205-246-3224                                       irish@free.com                                                                                      

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Sherman, Cheswick                                  Eagle Electronic                                                                                     929-498-8150                                       scheswick@eagle.com                                                                                 
Sherry, Garling                                    Manufactured Homes Corp.                                                                             353-822-7623                                       homely@fast.com                                                                                     
Stephanie, Yeinick                                 Tuckers Jewels                                                                                       573-455-4278                                       jewels@usol.com                                                                                     
Stephen Bird                                       Storage Specialties                                                                                  540-514-1415                                       sbird@storeit.com                                                                                   
Steve, Cochran                                     Eagle Electronic                                                                                     929-763-1283                                       none on record                                                                                      
Steve, Fulkerson                                   Cellular Services                                                                                    602-129-1885                                       cellcall@usol.com                                                                                   
Steve, Hess                                        Eagle Electronic                                                                                     919-486-8804                                       none on record                                                                                      
Steven, Hickman                                    Eagle Electronic                                                                                     919-774-4874                                       shickman@eagle.com                                                                                  
Susan, Strong                                      Family Medical Center                                                                                912-760-7840                                       fammed@onlineservice.com                                                                            
Thurman Mezzo                                      Playing Around                                                                                       415-967-1415                                       tmezzo@playingaround.com                                                                            
Tim White                                          Network Niche                                                                                        517-777-1905                                       twhite@networkN.com                                                                                 

NAME                                               COMPANY_NAME                                                                                         TELEPHONE                                          EMAIL_ADDRESS                                                                                       
-------------------------------------------------- ---------------------------------------------------------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
Tim, Leffert                                       Trailor Rentals                                                                                      315-486-4777                                       trailrent@zeronet.net                                                                               
Timothy Neal                                       Computer Accessories                                                                                 704-736-9458                                       tneal@compAccess.com                                                                                
Tina, Yates                                        Eagle Electronic                                                                                     929-763-4438                                       tyates@eagle.com                                                                                    
Todd, Vigus                                        Eagle Electronic                                                                                     919-486-7143                                       tvigus@eagle.com                                                                                    
Tommy, McFerren                                    Cole Sales and Associates                                                                            503-767-7054                                       mcferren@cole.com                                                                                   
Tracy, Cicholski                                   Dixon Pharmacy                                                                                       601-959-1315                                       dixpharm@free.com                                                                                   
Travis Honn                                        Radiant Computers                                                                                    303-564-1515                                       thonn@radiant.com                                                                                   
Wade Holle                                         Just Link It                                                                                         887-746-6174                                       Wade@jLi.com                                                                                        
Wade, Jacobs                                       Conner National                                                                                      803-477-5347                                       connernat@usol.com                                                                                  
William Newlon                                     Creative Computer Solutions                                                                          909-452-4936                                       Wnewlon@ccs.com                                                                                     
Yauleng Depoe                                      Scanning the World                                                                                   313-475-1177                                       ydepoe@sw.com                                                                                       

143 rows selected. 


Question 6
no rows selected

Question 7

Question 8
CUSTOMERID
----------
Z-12345

Question 9

Question 10
no rows selected

Question 11
no rows selected

Question 12

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-300001   Baker and Company                        Gregory         Abbott               Mr.   7837 Busse Rd.                           Leonardo             NJ 47813      812-447-3621 812-447-4602 greggie@usol.com                                  
C-300002   Cole Sales and Associates                Tommy           McFerren             Dr.   3817 Farrell Rd.                         Leonardo             NJ 97709      503-767-7054 503-767-3394 mcferren@cole.com                                 
C-300003   Tippe Inn                                Cecil           Scheetz              Ms.   391 Weber Rd.                            Leonardo             NJ 04903      207-679-9822 207-679-6367 cecil@free.com                                    
C-300004   Franklin Trinkets                        Frank           Aamodt               Mr.   3304 Leredo Ave.                         Leonardo             NJ 06776      898-762-8741 898-762-9493 fa@fast.com                                       
C-300005   Needle Center                            Kathleen        Plyman               Ms.   7627 Belmont Ave                         Leonardo             NJ 10131      507-543-2052 507-543-1845 needles@onlineservice.com                         
C-300006   BMA Advertising Design                   George          Purcell              Mr.   4281 Jefferson Rd.                       Leonardo             NJ 18522      432-320-6905 432-320-5741 design@zeronet.net                                
C-300007   Regency Hospital                         Eugene          Gasper               Mr.   7022 Ward Lake Rd.                       Leonardo             NJ 05641      705-580-6124 705-580-4250 medcare@fast.com                                  
C-300008   South Street Rehabilitation              Jared           Meers                Mr.   4271 Airport Rd.                         Leonardo             NJ 58026      701-371-1701 701-371-1372 rehabsouth@zeronet.net                            
C-300009   Dixon Pharmacy                           Tracy           Cicholski            Mrs.  1920 Albion St.                          Leonardo             NJ 39059      601-959-1315 601-959-4277 dixpharm@free.com                                 
C-300010   Photography Niche                        Bruce           Fogarty              Mr.   1012 Island Ave.                         Leonardo             NJ 26346      598-791-1420 598-791-8582 photoniche@usol.com                               
C-300011   Family Medical Center                    Susan           Strong               Mrs.  5883 Sudbury Rd.                         Leonardo             NJ 31620      912-760-7840 912-760-8489 fammed@onlineservice.com                          

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-300012   Bryant Accounting                        Ginger          Xiao                 Mrs.  6636 Walnut St.                          Leonardo             NJ 57703      605-846-0451 605-846-5219 acctsbryant@zeronet.net                           
C-300013   Recreation Supply                        Karen           Burns                Dr.   2850 Farm St.                            Leonardo             NJ 95354      707-598-2670 707-598-3072 burnskaren@fast.com                               
C-300014   R and R Air                              Cathy           Bending              Mrs.  9573 Chestnut St.                        Leonardo             NJ 47732      765-617-2811 765-617-5319 rrair@zeronet.net                                 
C-300015   Vets Inc.                                Evelyn          Cassens              Ms.   6094 Pearson St.                         Leonardo             NJ 19726      302-762-9526 302-762-3338 dr.animal@onlineservice.com                       
C-300016   Goodwork Corporation                     Angie           Hoover               Ms.   6427 Genesee St.                         Leonardo             NJ 82638      307-459-4165 307-459-2606 ahoover@free.com                                  
C-300017   Powerful Employment                      Jim             Sokeland             Mr.   6671 Pearl Rd.                           Leonardo             NJ 21136      723-366-1117 723-366-0896 employment@zeronet.net                            
C-300018   Wadake Critters                          Hugo            Gillespie            Mr.   4194 Northfield Rd.                      Leonardo             NJ 67402      785-981-0669 785-981-6634 critters@free.com                                 
C-300019   Conner National                          Wade            Jacobs               Ms.   2610 E. Lake Rd.                         Leonardo             NJ 58653      803-477-5347 803-477-5487 connernat@usol.com                                
C-300020   Cottingham Plastics                      Brittany        Cottingham           Ms.   4234 Taylor Rd.                          Leonardo             NJ 45819      419-464-5273 419-464-7239 plastic@onlineservice.com                         
C-300021   Realty Specialties                       David           Tarter               Mr.   6274 Blue Rock Rd.                       Leonardo             NJ 13261      518-500-0570 518-500-6159 estate@fast.com                                   
C-300022   Reflexions Manufacturing                 Heather         Wallpe               Ms.   4128 Hulen St.                           Leonardo             NJ 63653      816-433-9799 816-433-3621 flex@onlineservice.com                            

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-300023   TAS                                      Robert          Dalury               Mr.   4718 Pleasant Valley Rd.                 Leonardo             NJ 48708      906-278-6446 906-278-4345 tas@zeronet.net                                   
C-300024   Bankruptcy Help                          Jim             Lichty               Mr.   5991 Kenwood Rd.                         Leonardo             NJ 60624      618-847-1904 618-847-6439 bankrupt@usol.com                                 
C-300025   Railroad Express                         Dusty           Jones                Dr.   1390 Clearview Pkwy.                     Leonardo             NJ 83826      674-727-0511 674-727-1560 rr@usol.com                                       
C-300026   City Bus Transport                       Larry           Osmanova             Mr.   256 Royal Ln.                            Leonardo             NJ 97311      541-905-4819 541-905-8042 citybus@fast.com                                  
C-300027   Vacation Car Rentals                     Richard         Strehle              Mr.   9862 Rock Island Rd.                     Leonardo             NJ 99362      206-434-7305 206-434-1892 vacation@fast.com                                 
C-300028   Cheesman Corporation                     Brenda          Kitchel              Mrs.  6482 Thomasen Rd.                        Leonardo             NJ 24011      804-214-8732 804-214-1253 cheesman@zeronet.net                              
C-300029   Down Deep Drilling Inc.                  Don             Torres               Mr.   1979 Illinois Ave.                       Leonardo             NJ 30635      706-649-6375 706-649-0420 drill@usol.com                                    
C-300030   Main St. Bar and Grill                   Richard         Kluth                Dr.   7901 Peach Tree Dr.                      Leonardo             NJ 19709      302-296-8012 302-296-5060 rickkluth@free.com                                
C-300031   Copy Center                              Allen           Robles               Mr.   1228 Bailey Rd.                          Leonardo             NJ 80761      644-730-8090 644-730-3557 copy@onlineservice.com                            
C-300032   Greenpart Steet Metal                    Archie          Doremski             Mr.   6580 Midway Rd.                          Leonardo             NJ 82414      307-944-8959 307-944-3950 sheetz@free.com                                   
C-300033   Pools For You                            Daniel          Ezra                 Mr.   7393 Lake June Rd.                       Leonardo             NJ 04212      207-744-1997 207-744-8795 swim@zeronet.net                                  

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-300034   Phone Corporation                        Dean            Katpally             Mr.   1179 38th St.                            Leonardo             NJ 96746      808-799-3727 808-7991677  phonecorp@usol.com                                
C-300035   Store It Here                            Randall         Neely                Mr.   1132 Madison St.                         Leonardo             NJ 05701      802-319-9805 802-319-1266 storage@fast.com                                  
C-300036   Kids Recreation Inc.                     Mike            Condie               Mr.   449 Troy Ave.                            Leonardo             NJ 27895      336-211-1238 336-211-3812 kidrec@zeronet.net                                
C-300037   Trailor Rentals                          Tim             Leffert              Mr.   2765 Independence Ave.                   Leonardo             NJ 13442      315-486-4777 315-486-0683 trailrent@zeronet.net                             
C-300038   Water Analysts                           Carl            Dallas               Mr.   2530 Lakewood Blvd.                      Leonardo             NJ 29153      864-541-5114 864-541-9632 analyzeh20@fast.com                               
C-300039   Gards Auto Repair                        Dennis          Sammons              Mr.   581 Sahara Blvd.                         Leonardo             NJ 48609      616-544-1969 616-544-3365 repairit@free.com                                 
C-300040   Computer Consultants                     Mildred         Jones                Ms.   2278 Flamingo Rd.                        Leonardo             NJ 18195      610-437-6687 610-437-6210 compconsul@usol.com                               
C-300041   Laser Graphics Associates                Paul            Kaakeh               Mr.   3616 Jones Blvd.                         Leonardo             NJ 81247      719-750-4539 719-750-9842 graphit@usol.com                                  
C-300042   Signs Signs Signs                        Kevin           Zubarev              Mr.   5933 Valley St.                          Leonardo             NJ 83221      208-364-3785 208-364-5230 sign3@fast.com                                    
C-300043   Flowers by Mickey                        Mary            Uhl                  Ms.   6936 Citrus Blvd.                        Leonardo             NJ 29413      803-974-2809 803-974-6131 mouse@fast.com                                    
C-300044   Kelly Dance Studio                       Jennifer        Kmec                 Mrs.  9413 E. Broadway St.                     Leonardo             NJ 21787      443-542-1386 443-542-0474 dancingk@free.com                                 

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-300045   National Art Museum                      Marjorie        Vandermay            Ms.   5384 Raymond Ave.                        Leonardo             NJ 68310      308-489-1137 308-489-9640 nam@fast com                                      
C-300046   Tuckers Jewels                           Stephanie       Yeinick              Ms.   2596 S. Fairview Rd.                     Leonardo             NJ 65270      573-455-4278 573-455-3163 jewels@usol.com                                   
C-300047   The Employment Agency                    Cathy           Harvey               Mrs.  9481 Town Line Rd.                       Leonardo             NJ 28810      336-477-0249 336-477-7464 findwork@onlineservice.com                        
C-300048   Cleaning Supply                          Geo             Schofield            Mr.   4931 Talbot Blvd.                        Leonardo             NJ 38967      228-480-9751 228-480-4037 cleanit@usol.com                                  
C-300049   Appliances Inc.                          Kara            Orze                 Ms.   2666 Stillwater Rd.                      Leonardo             NJ 54401      414-773-1017 414-773-2842 appinc@zeronet.net                                
C-300050   Quality Equipment Corp.                  Jeff            Kowaiski             Mr.   3323 Mission Pkwy.                       Leonardo             NJ 14895      212-492-5644 212-492-9525 equipit@usol.com                                  
C-300051   Sharons Shamrock                         Sharon          Rouls                Mrs.  1274 Weaver Rd.                          Leonardo             NJ 36303      205-246-3224 205-246-5699 irish@free.com                                    
C-300052   Manufactured Homes Corp.                 Sherry          Garling              Ms.   4350 Concord Blvd.                       Leonardo             NJ 04462      353-822-7623 353-822-9722 homely@fast.com                                   
C-300053   Camping Supplies                         Mary            Deets                Mrs.  4534 South Acres Rd.                     Leonardo             NJ 96782      808-562-4081 808-562-0004 camphere@fast.com                                 
C-300054   Financial Planning Consul                Dennis          Drazer               Dr.   4799 Silverstar Rd.                      Leonardo             NJ 98115      253-315-4247 253-315-7522 dollarplan@usol.com                               
C-300055   Fire Alarm Systems                       Robert          Lister               Mr.   3016 Dunlap Ave.                         Leonardo             NJ 84603      801-404-1240 801-404-8056 fines@free.com                                    

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-300056   Happytime Escort Service                 Heather         Waters               Mrs.  805 Cactus Rd.                           Leonardo             NJ 29560      869-741-7817 869-741-0539 dates@free.com                                    
C-300057   Industrail Contracting Co                Anita           Pastron              Ms.   2817 Northern Ave.                       Leonardo             NJ 37111      901-796-4654 901-796-3276 contracts@fast.com                                
C-300058   Outlets                                  Amy             Heide                Ms.   9119 Camelback Rd.                       Leonardo             NJ 05304      802-894-1024 802-894-1135 letout@usol.com                                   
C-300059   Rydell High School                       Charlene        Franks               Mrs.  1627 Thomas Rd.                          Leonardo             NJ 82633      307-892-2938 307-892-1477 learn@rydell.edu                                  
C-300060   Collectibles Inc.                        Doug            Blizzard             Mr.   856 Van Buren St.                        Leonardo             NJ 39666      228-646-5114 228-646-2170 collectit@onlineservice.com                       
C-300061   Karate Made Easy                         Richard         Scott                Mr.   1489 Dobbins Rd.                         Leonardo             NJ 26555      304-774-2226 304-774-8150 kick@onlineservice.com                            
C-300062   Security Installation                    Scott           Gray                 Mr.   115 Shea Blvd.                           Leonardo             NJ 17406      484-453-7105 484-453-6614 keepsafe@zeronet.net                              
C-300063   Ceramic Supply                           Randy           Talauage             Mr.   6364 Brown St.                           Leonardo             NJ 99157      347-671-2022 347-671-9116 paintit@fast.com                                  
C-300064   Bobs Repair Service                      Daniel          Hundnall             Mr.   909 Reams Rd.                            Leonardo             NJ 73705      918-830-9731 918-830-3898 fixit@usol.com                                    
C-300065   Investment Specialties                   Sally           Valle                Dr.   6298 Killingsworth St.                   Leonardo             NJ 76208      972-234-2044 972-234-1543 roi@usol.com                                      
C-300066   North Street Church                      Noemi           Elston               Mr.   3024 28th St.                            Leonardo             NJ 82902      307-359-9514 307-359-8090 closetoheaven@zeronet.net                         

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-300067   Supplying Crafts                         Kelly           Jordan               Ms.   168 Division St.                         Leonardo             NJ 32205      727-951-7737 727-951-9889 supplycrafts@fast.com                             
C-300068   Cellular Services                        Steve           Fulkerson            Mr.   6912 White Horse Rd.                     Leonardo             NJ 85937      602-129-1885 602-129-5545 cellcall@usol.com                                 
C-300069   Easy Internet Access                     Orville         Gilliland            Mr.   5515 Page-Mill Rd.                       Leonardo             NJ 39565      490-263-2957 490-263-6303 eia@zeronet.net                                   
C-300070   Sampson Home Mortgages                   Bridgette       Kyger                Mrs.  5682 Chester Pike Rd.                    Leonardo             NJ 21412      301-467-6480 301-467-5740 homeloans@fast.com                                
C-300071   The Cable Company                        Norman          Fields               Dr.   4174 Collings St.                        Leonardo             NJ 99811      501-346-4841 501-346-0928 catv@onlineservice.com                            
C-300072   Automart                                 Jessica         Nakamura             Ms.   8233 Clairton Ave.                       Leonardo             NJ 57301      605-324-2193 605-324-1030 carsell@usol.com                                  
C-300073   First National Bank                      Jack            Barrick              Mr.   2638 Becks Run Rd.                       Leonardo             NJ 32783      786-494-4782 786-494-1359 1natbank@free.com                                 
C-300074   Apartment Referrals                      Aricka          Bross                Ms.   555 W. Liberty Ave.                      Leonardo             NJ 43986      419-676-9758 419-676-3995 placetolive@free.com                              
I-300001                                            Anna            Mayton               Dr.   2381 Basse Rd.                           Leonardo             NJ 36456      888-451-1233              doctor@free.com                                   
I-300002                                            Lou             Caldwell             Mr.   1486 Joliet Rd.                          Leonardo             NJ 40211      606-901-1238              lucky@fast.com                                    
I-300003                                            Carl            Hague                Mr.   2711 143rd St.                           Leonardo             NJ 45207      419-890-3531                                                                

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300004                                            Jeffery         Jordan               Mr.   1500 Normantown Rd.                      Leonardo             NJ 99211      509-989-9996              seeya@usol.com                                    
I-300005                                            Kimber          Spaller              Mrs.  1565 Culebra Rd.                         Leonardo             NJ 99836      878-119-5448              mcgimmie@zero.net                                 
I-300006                                            Eric            Fannon               Mr.   2526 Nelson Rd.                          Leonardo             NJ 96003      209-980-0812              ef@free.com                                       
I-300007                                            Jessica         Cain                 Ms.   942 55th St.                             Leonardo             NJ 48838      517-901-2610                                                                
I-300008                                            Richard         Zito                 Mr.   7569 130th St.                           Leonardo             NJ 03766      603-787-0787              rzito@zeronet.net                                 
I-300009                                            Angela          Wainscott            Dr.   3646 North Ave.                          Leonardo             NJ 83415      208-788-4112              awainscott@free.com                               
I-300010                                            James           Gross                Dr.   1983 Mill St.                            Leonardo             NJ 08701      908-879-8672              jgross@fast.com                                   
I-300011                                            Jack            Akers                Mr.   1485 71st St.                            Leonardo             NJ 19850      301-454-6061              pizazz@usol.com                                   
I-300012                                            Kevin           Jackson              Mr.   5990 Cuba Rd.                            Leonardo             NJ 70123      225-624-2341                                                                
I-300013                                            Shirley         Osborne              Mrs.  816 Penny Rd.                            Leonardo             NJ 30401      706-333-7174                                                                
I-300014                                            Eric            Becker               Mr.   8784 Wabash Ave.                         Leonardo             NJ 28504      910-717-7613              daddyo@usol.com                                   

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300015                                            Karen           Mangus               Mrs.  4804 Ridge Rd.                           Leonardo             NJ 33871      863-623-0459              missright@onlineservice.com                       
I-300016                                            Peter           Austin               Mr.   4804 River Rd.                           Leonardo             NJ 29812      803-343-6063                                                                
I-300017                                            Brad            Arquette             Mr.   2599 Ben Hill Rd.                        Leonardo             NJ 89049      775-914-4294              arq@usol.com                                      
I-300018                                            Daniel          Barton               Mr.   4599 Atlanta Rd.                         Leonardo             NJ 79556      915-894-8034              dannie@zeronet.net                                
I-300019                                            Jerry           Mennen               Dr.   869 Clay St.                             Leonardo             NJ 86038      520-306-8426              mennenj@free.com                                  
I-300020                                            Kenneth         Wilcox               Mr.   9364 Hershell Rd.                        Leonardo             NJ 50801      515-872-8848              kenny@onlineservice.com                           
I-300021                                            Matt            Smith                Mr.   6804 All Rd.                             Leonardo             NJ 81402      719-822-8828              matsm@fast.com                                    
I-300022                                            Paul            Sullivan             Mr.   9399 Flat Rd.                            Leonardo             NJ 67251      785-322-5896              sullie@zeronet.net                                
I-300023                                            Gerald          Campbell             Dr.   1869 Boundary St.                        Leonardo             NJ 53964      431-087-1044              gcampbell@free.com                                
I-300024                                            Joan            Hedden               Mrs.  4518 Red Bud Trail                       Leonardo             NJ 72765      501-710-0658                                                                
I-300025                                            Ronald          Miller               Mr.   360 Spring St.                           Leonardo             NJ 49008      734-820-2076              picky@zeronet.net                                 

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300026                                            Terry           Xu                   Ms.   2019 Elm St.                             Leonardo             NJ 65215      417-546-2570              muffin@fast.com                                   
I-300027                                            Danita          Sharp                Ms.   3475 Mystic St.                          Leonardo             NJ 98908      360-650-5604              girlfriend@fast.com                               
I-300028                                            Don             Kaleta               Mr.   8948 Washington St.                      Leonardo             NJ 16602      724-695-2157              stud@zeronet.net                                  
I-300029                                            Tammi           Baldocchio           Ms.   924 North Ave.                           Leonardo             NJ 02876      401-989-4975                                                                
I-300030                                            Eric            Quintero             Mr.   144 Concord Rd.                          Leonardo             NJ 47202      812-805-1588              diamond@onlineservice.com                         
I-300031                                            Phillip         Hession              Mr.   7610 Hartford Ct.                        Leonardo             NJ 49016      231-711-6837              howdy@usol.com                                    
I-300032                                            Ruth            Albeering            Dr.   1348 Yonge Rd.                           Leonardo             NJ 24333      784-444-0131              rabeering@free.com                                
I-300033                                            Jacob           Richer               Mr.   1490 N. Shore Rd.                        Leonardo             NJ 98823      425-942-3763              laugh@free.com                                    
I-300034                                            James           Jones                Mr.   4685 Vernon St.                          Leonardo             NJ 97720      971-522-5851              puffy@fast.com                                    
I-300035                                            Tim             Parker               Mr.   2848 Marrett Rd.                         Leonardo             NJ 12182      315-985-4102              jeckle@onlineservice.com                          
I-300036                                            Andrea          Montgomery           Ms.   1699 Conner Dr.                          Leonardo             NJ 21788      349-397-7772                                                                

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300037                                            Chas            Funk                 Mr.   2490 Maple St.                           Leonardo             NJ 06611      860-498-3900              duck@usol.com                                     
I-300038                                            David           Smith                Mr.   9245 Main St.                            Leonardo             NJ 61125      309-980-4350              emerald@onlineservice.com                         
I-300039                                            David           Chang                Mr.   5786 Manor Rd.                           Leonardo             NJ 44907      740-750-1272              lion@free.com                                     
I-300040                                            Kathy           Gunderson            Mrs.  2257 Oak Springs Rd.                     Leonardo             NJ 32447      941-330-3314                                                                
I-300041                                            Dennis          Mundy                Mr.   5781 Red Bud Trail                       Leonardo             NJ 03561      603-306-0774              rino@usol.com                                     
I-300042                                            George          Trenkle              Mr.   1874 Jefferson Ave.                      Leonardo             NJ 08837      856-267-7913              cold@fast.com                                     
I-300043                                            Carey           Dailey               Ms.   234 Sheridan Dr.                         Leonardo             NJ 80219      728-896-2767              shelty@usol.com                                   
I-300044                                            Louise          Cool                 Mrs.  6831 Walden Ave.                         Leonardo             NJ 83333      208-956-0698                                                                
I-300045                                            Gary            Kempf                Mr.   3908 William St.                         Leonardo             NJ 43326      937-724-7313              kempfg@free.com                                   
I-300046                                            Jane            Mumford              Dr.   8235 Center Rd.                          Leonardo             NJ 42719      270-428-5866                                                                
I-300047                                            Scott           Yarian               Dr.   4198 Center Ridge Rd.                    Leonardo             NJ 28472      252-310-2224              syarian@fast.com                                  

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300048                                            Patrick         Bollock              Mr.   1472 Bayley Rd.                          Leonardo             NJ 82435      307-635-1692              pat@fast.com                                      
I-300049                                            Paul            Rice                 Mr.   830 Shaker Blvd.                         Leonardo             NJ 81626      719-541-1837              paulier@onlineservice.com                         
I-300050                                            James           Schilling            Mr.   2021 North Bend Rd.                      Leonardo             NJ 52498      319-429-9772                                                                
I-300051                                            Lynne           Lagunes              Ms.   2820 Beechmont Ave.                      Leonardo             NJ 83209      208-502-9976              hello@zeronet.net                                 
I-300052                                            Andrew          Yelnick              Mr.   6972 Winton Rd.                          Leonardo             NJ 48226      517-803-5818              family@free.com                                   
I-300053                                            Stephanie       Pearl                Mrs.  6460 Springdale Rd.                      Leonardo             NJ 64468      660-447-8319              mommyl@fast.com                                   
I-300054                                            Dorlan          Bresnaham            Dr.   1328 Mill Ave.                           Leonardo             NJ 03264      603-497-7374              dorlan@usol.com                                   
I-300055                                            Jon             Clute                Dr.   1680 River Oaks Blvd.                    Leonardo             NJ 85711      480-181-8940                                                                
I-300056                                            Elizabeth       Henderson            Ms.   2819 Otay Rd.                            Leonardo             NJ 57758      449-486-8018                                                                
I-300057                                            Tonya           Owens                Mrs.  1414 Fields Ertel Rd.                    Leonardo             NJ 29620      843-773-2751                                                                
I-300058                                            Matthew         Quant                Mr.   253 Silver Creek Rd.                     Leonardo             NJ 28345      910-577-1319              walker@onlineservice.com                          

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300059                                            Kenneth         Mintier              Mr.   4831 Skeet Blvd.                         Leonardo             NJ 95534      323-673-0690              builder@usol.com                                  
I-300060                                            Lucille         Appleton             Ms.   5260 Blue Mound Rd.                      Leonardo             NJ 12553      914-497-2160              muscle@zeronet.net                                
I-300061                                            Brenda          Jones                Mrs.  3696 Cooper St.                          Leonardo             NJ 80230      720-800-2638              show@free.com                                     
I-300062                                            John            McGinnis             Dr.   7841 Hurst Blvd.                         Leonardo             NJ 83263      208-741-1963              john@zeronet.net                                  
I-300063                                            Dennis          Eberle               Mr.   9425 James Rd.                           Leonardo             NJ 50707      515-708-1802              deber@free.com                                    
I-300064                                            Jo              Jacko                Mrs.  6588 Ken Caryl Rd.                       Leonardo             NJ 08361      856-752-7471                                                                
I-300065                                            Karen           Randolph             Ms.   1038 Coal Mine Rd.                       Leonardo             NJ 03235      603-744-9002              cookin@zeronet.net                                
I-300066                                            Ruth            Ball                 Dr.   1093 Valley View Ln.                     Leonardo             NJ 56387      651-479-7538                                                                
I-300067                                            Travis          Camargo              Mr.   6681 Forrest Ln.                         Leonardo             NJ 64853      816-746-4913                                                                
I-300068                                            Jerry           Muench               Mr.   1694 Stone Valley Rd.                    Leonardo             NJ 79059      464-669-8537              redhot@onlineservice.com                          
I-300069                                            Verna           McGrew               Ms.   4755 Rocket Blvd.                        Leonardo             NJ 35811      334-547-9329              verngrew@free.com                                 

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300070                                            Elizabeth       Derhammer            Ms.   2343 Pioneer Pkwy.                       Leonardo             NJ 67868      785-970-9916              lizzy@onlineservice.com                           
I-300071                                            Ted             Zissa                Mr.   4935 Cedar Hill Rd.                      Leonardo             NJ 73402      405-151-7445                                                                
I-300072                                            Matt            Shade                Mr.   8441 Skillman Ave.                       Leonardo             NJ 85622      623-422-6616              shadtree@free.com                                 
I-300073                                            Dean            Eagon                Mr..  616 Burton Rd.                           Leonardo             NJ 81011      970-581-8611                                                                
I-300074                                            Andrew          Ray                  Mr.   1246 Ferry St.                           Leonardo             NJ 08332      609-345-9680              andyray@usol.com                                  
I-300075                                            Robert          Cortez               Mr.   219 Pleasant Run Rd.                     Leonardo             NJ 03435      603-442-3740                                                                
I-300076                                            Tim             Carlton              Mr.   1038 Lancaster St.                       Leonardo             NJ 06082      203-608-3465                                                                
I-300077                                            Jennifer        Hundley              Mrs.  6354 Buckner Blvd.                       Leonardo             NJ 26261      304-713-3298              jenhund@fast.com                                  
I-300078                                            Andrea          Griswold             Dr.   8215 Garland Rd.                         Leonardo             NJ 80429      970-746-0995              andygwold@usol.com                                
I-300079                                            Christina       Wilson               Mrs.  5766 Scyene Rd.                          Leonardo             NJ 67124      316-210-8989                                                                
I-300080                                            Juicheng        Nugent               Mr.   9443 Illinois Ave.                       Leonardo             NJ 05156      802-352-8923              nugent@fast.com                                   

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300081                                            Bryan           Price                Mr.   1745 Best Line Rd.                       Leonardo             NJ 23666      804-674-9666                                                                
I-300082                                            Helene          Ziekart              Mrs.  9533 Simonds Rd.                         Leonardo             NJ 06511      203-244-9192                                                                
I-300083                                            Marty           Fay                  Ms.   9241 School Rd.                          Leonardo             NJ 99775      501-631-3727              sparky@free.com                                   
I-300084                                            Lisa            Pettry               Mrs.  8515 Cossell Ave.                        Leonardo             NJ 89714      702-799-7272              lpett@zeronet.net                                 
I-300085                                            Zach            McGrew               Mr.   5788 Rockville Rd.                       Leonardo             NJ 85502      520-730-8494                                                                
I-300086                                            Jamie           Thompson             Ms.   6878 Holt Ave.                           Leonardo             NJ 30606      706-471-1222              jthompson@onlineservice.com                       
I-300087                                            Charles         Jones                Mr.   1420 N. Highland Ave.                    Leonardo             NJ 33606      919-774-5552              charlie@usol.com                                  
I-300088                                            Thomas          Zelenka              Dr.   5371 Brookeville Rd.                     Leonardo             NJ 03108      603-374-3706              zelenka@free.com                                  
I-300089                                            James           Laake                Mr.   3434 Great Street                        Leonardo             NJ 82710      613-785-7063                                                                
I-300090                                            Daniel          Stabnik              Mr.   3745 35th St.                            Leonardo             NJ 63775      636-746-4124                                                                
I-300091                                            Trudi           Antonio              Ms.   9882 Strother Rd.                        Leonardo             NJ 13699      718-747-3259              toni@onlineservice.com                            

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300092                                            John            Garcia               Mr.   231 63rd St.                             Leonardo             NJ 04122      207-311-0174              jgar@onlineservice.com                            
I-300093                                            Jay             Hanau                Mr.   5897 Sunset Rd.                          Leonardo             NJ 62959      773-490-8254                                                                
I-300094                                            Joseph          Schuman              Dr.   5893 Warm Springs Rd.                    Leonardo             NJ 44304      330-209-1273                                                                
I-300095                                            Joshua          Cole                 Mr.   7903 Paradise Rd.                        Leonardo             NJ 38308      865-269-7782              fido@zeronet.net                                  
I-300096                                            David           Schilling            Mr.   8671 Chapel Rd.                          Leonardo             NJ 42102      502-421-1516                                                                
I-300097                                            Mary Ann        Rausch               Mrs.  3679 Western Ave.                        Leonardo             NJ 82938      307-944-3324              spiritual@free.com                                
I-300098                                            Allison         Roland               Mrs.  4599 S. Maodill Ave.                     Leonardo             NJ 33604      929-498-4174              alley@onlineservice.com                           
I-300099                                            Roy             Beer                 Mr.   8065 Colina Rd.                          Leonardo             NJ 98907      206-745-2584              wizzy@usol.com                                    
I-300100                                            Chris           Dunlap               Mrs.  3526 10th St.                            Leonardo             NJ 82731      307-473-2281                                                                
I-300101                                            Ansel           Farrell              Mr.   316 Birch St.                            Leonardo             NJ 50588      712-440-3934              prickly@onlineservice.com                         
I-300102                                            Jason           Laxton               Mr.   7858 Dowling Ave. N.                     Leonardo             NJ 01368      978-860-2824              coondog@usol.com                                  

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300103                                            Larry           Gardiner             Mr.   1739 W 39th St.                          Leonardo             NJ 71295      225-313-6268              square@onlineserveice.com                         
I-300104                                            Lawrence        Pullen               Mr.   4599 Rheem Blvd.                         Leonardo             NJ 56726      644-591-3243              laurie@free.com                                   
I-300105                                            Matt            Nakanishi            Mr.   8108 Middle Rd.                          Leonardo             NJ 84501      435-710-5324              nakan@free.com                                    
I-300106                                            Nancy           Basham               Mrs.  3409 36th Ave. N.                        Leonardo             NJ 04930      207-422-7135                                                                
I-300107                                            Rachel          Davis                Ms.   2954 Cedar Lake Rd.                      Leonardo             NJ 89523      702-907-4818              rachdav@zeronet.net                               
I-300108                                            Sarah           McCammon             Mrs.  3216 Dimond Lake Rd.                     Leonardo             NJ 86411      520-438-7944              squirrel@zeronet.net                              
I-300109                                            David           Tietz                Mr.   5235 E. 44th St.                         Leonardo             NJ 56265      651-912-1583              tietz@free.com                                    
I-300110                                            Jim             Manaugh              Mr.   1011 W. Hillsborough Ave.                Leonardo             NJ 33605      919-747-5603              jmanaugh@eagle.com                                
I-300111                                            Richard         Stetler              Mr.   7496 University Ave.                     Leonardo             NJ 36832      256-412-8112              screwball@free.com                                
I-300112                                            Jonathon        Blanco               Mr.   8095 Mounty Rd.                          Leonardo             NJ 54904      902-226-1858              hammer@free.com                                   
I-300113                                            Randolph        Darling              Mr.   8254 Coral Way                           Leonardo             NJ 06260      860-684-1620              randolph@fast.com                                 

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300114                                            Melody          Fazal                Mrs.  4603 Killian Rd.                         Leonardo             NJ 93311      760-877-4849              melfazal@zeronet.net                              
I-300115                                            Michael         Tendam               Dr.   190 Dixie St.                            Leonardo             NJ 592331     406-424-7496              flute@usol.com                                    
I-300116                                            Sean            Akropolis            Mr.   6603 E. Little Yak Rd.                   Leonardo             NJ 99509      907-262-4254              pickle@free.com                                   
I-300117                                            Anne            Hatzell              Ms.   5200 Belfat Blvd.                        Leonardo             NJ 19973      302-651-6440              hazel@zeronet.net                                 
I-300118                                            Meredith        Rushing              Dr.   1856 Cullen Blvd.                        Leonardo             NJ 40516      606-608-2105              merry@free.com                                    
I-300119                                            John            Skadberg             Mr.   7577 Holmes Rd.                          Leonardo             NJ 45840      513-282-3919              skad@zeronet.net                                  
I-300120                                            Zack            Hill                 Mr.   2064 Preston Rd.                         Leonardo             NJ 97496      503-794-2322              boogie@free.com                                   
I-300121                                            Dan             Lageveen             Mr.   3056 Southern Ave. N.                    Leonardo             NJ 82073      307-344-8928              veenie@zeronet.net                                
I-300122                                            Marla           Reeder               Mrs.  1029 Moraga Ave. W.                      Leonardo             NJ 32425      728-442-3031              reedmar@zeronet.net                               
I-300123                                            Linda           Bowen                Mrs.  5541 Bell Rd.                            Leonardo             NJ 57350      605-234-4114                                                                
I-300124                                            Michael         Emore                Mr.   7347 Peoria Ave.                         Leonardo             NJ 32810      352-472-1224              mikemore@usol.com                                 

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300125                                            Mary Jo         Wales                Dr.   1416 Wynnewood Ave.                      Leonardo             NJ 97885      852-441-4984              jomary@onlineservice.com                          
I-300126                                            Tom             Moore                Mr.   7742 Glendale Ave.                       Leonardo             NJ 04351      270-692-2845              seedle@fast.com                                   
I-300127                                            Susan           Watson               Mrs.  6151 Indian School Rd.                   Leonardo             NJ 84414      801-746-7701              mswatson@fast.com                                 
I-300128                                            Tom             Irelan               Mr.   7833 McDowell Rd.                        Leonardo             NJ 21503      240-634-5581              tucker@free.com                                   
I-300129                                            Rosemary        Vanderhoff           Dr.   843 99th St.                             Leonardo             NJ 31206      770-293-8783                                                                
I-300130                                            Mike            Dunbar               Mr.   1750 Broadway St.                        Leonardo             NJ 83531      208-297-5374              duh@onlineservice.com                             
I-300131                                            Ryan            Stahley              Mr.   9281 E. Bird St.                         Leonardo             NJ 33606      919-774-5340              rstahley@eagle.com                                
I-300132                                            Patricia        Leong                Ms.   6213 Baseline Rd.                        Leonardo             NJ 86313      520-247-4141              patrice@usol.com                                  
I-300133                                            Roy             McGrew               Mr.   1968 Elliot Rd.                          Leonardo             NJ 83686      208-324-0783              grow@zeronet.net                                  
I-300134                                            Tom             Baker                Mr.   483 Greenway St.                         Leonardo             NJ 54656      414-778-5640              bologna@free.com                                  
I-300135                                            Bill            Umbarger             Mr.   1476 Eastern Pkwy.                       Leonardo             NJ 04915      207-155-1577              cheezy@onlineservice.com                          

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300136                                            Bob             Weldy                Mr.   8227 Oak Ridge Rd.                       Leonardo             NJ 24506      571-490-6449              sucker42@usol.com                                 
I-300137                                            Kris            Shinn                Dr.   7451 Tiden St.                           Leonardo             NJ 79772      469-740-2748              shinnk@zeronet.net                                
I-300138                                            James           King                 Dr.   2734 Mulga Loop Rd.                      Leonardo             NJ 04457      207-708-3317              jamesk@usol.com                                   
I-300139                                            Frank           Malady               Mr.   7894 Geary Blvd.                         Leonardo             NJ 31533      574-493-0510              frankmala@zeronet.net                             
I-300140                                            Jim             Webb                 Mr.   3577 Hessian Ave.                        Leonardo             NJ 01853      978-204-3019                                                                
I-300141                                            Daniel          Rodkey               Ms.   4024 Mill Plain Blvd.                    Leonardo             NJ 81052      719-748-3205              dannie@free.com                                   
I-300142                                            Marc            Williams             Mr.   8443 15th St.                            Leonardo             NJ 84721      435-774-4595              peanut@fast.com                                   
I-300143                                            Kristy          Moore                Ms.   4410 W. Spruce St.                       Leonardo             NJ 33603      919-486-6765              fluffy@onlineservice.com                          
I-300144                                            Russ            Mann                 Mr.   6879 Island Ave.                         Leonardo             NJ 89199      775-549-1798              scooter@onlineservice.com                         
I-300145                                            Carrie          Buchko               Mrs.  3793 Leheigh Ave.                        Leonardo             NJ 75951      817-739-1335              goobert@free.com                                  
I-300146                                            Michelle        Oakley               Ms.   5348 Elmwood Ave.                        Leonardo             NJ 02303      978-514-5425              littleone@usol.com                                

CUSTOMERID COMPANYNAME                              CUSTFIRSTNAME   CUSTLASTNAME         CUSTT ADDRESS                                  CITY                 ST POSTALCODE PHONE        FAX          EMAILADDR                                         
---------- ---------------------------------------- --------------- -------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-300147                                            Steven          Yaun                 Mr.   4711 Hook Rd.                            Leonardo             NJ 46208      317-780-9804              yawn@fast.com                                     
I-300148                                            Jack            Illingworth          Mr.   2741 Ashland Ave.                        Leonardo             NJ 14206      914-748-9829              illing@free.com                                   
I-300149                                            Thomas          Wolfe                Mr.   7347 Broad St.                           Leonardo             NJ 18510      610-365-9766              wolf@onlineservice.com                            
I-300150                                            Irene           Poczekay             Mrs.  7000 W. 7th St.                          Leonardo             NJ 02840      401-461-9567                                                                
I-300151                                            Andy            Huegel               Dr.   7542 Haverford Blvd.                     Leonardo             NJ 19963      302-620-1366                                                                
I-300152                                            Karen           Marko                Ms.   4954 Clifton Rd.                         Leonardo             NJ 73506      580-555-1871              marko@usol.com                                    
I-300153                                            Trevor          Snuffer              Mr.   6550 Forbes Ave.                         Leonardo             NJ 27803      336-185-0630              snuffer@zeronet.net                               
I-300154                                            Phil            Reece                Mr.   1204 N. Nebraska Ave.                    Leonardo             NJ 33603      919-486-0649              sly@zeronet.net                                   
I-300155                                            Linda           Hari                 Mrs.  791 McKnight Rd.                         Leonardo             NJ 42134      270-411-2316                                                                
I-300156                                            Andrew          Smith                Mr.   1244 Fremont Ave.                        Leonardo             NJ 67879      709-307-2568              smokey@zeronet.net                                
I-300157                                            Linda           Li                   Ms.   5920 Grove St.                           Leonardo             NJ 06790      203-744-4677              ll@free.com                                       

231 rows selected. 

Question 13

Question 14

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100125     Gabrielle, Stevenson                Chief Information Officer                75300
100220     Todd, Vigus                         Accountant                                  15
100488     Jamie, Osman                        Programmer Analyst                       46300
100650     Edna, Lilley                        VP Information                           93900
101088     Patricha, Underwood                 Assembly                                 18.45
100120     Michelle, Nairn                     Assembly                                 16.75
100399     Ronald, Day                         Assembly                                 16.25
100550     Allison, Roland                     Assembly                                 16.85
100944     Ryan, Stahley                       Engineer                                 48600
101089     Melissa, Alvarez                    Assembly                                 13.25
101115     Steve, Cochran                      Assembly                                  10.5

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100209     Tina, Yates                         Engineer                                 52000
100559     Meghan, Tyrie                       Engineer                                 50100
101045     Austin, Ortman                      Assembly                                  10.5
101097     Jack, Brose                         Assembly                                 12.05
101166     Phil, Reece                         Assembly                                  10.5
100104     Michael, Abbott                     Engineer                                 74400
100600     Calie, Zollman                      Sales                                    17.35
100880     Gary, German                        Chief Sales Officer                      48900
100989     Kathryn, Deagen                     Assembly                                 16.95
100103     Rita, Bush                          VP Operations                            85800
100106     Paul, Eckelman                      Accountant                               53600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100206     Kathleen, Xolo                      VP Finance                               80700
100101     Joanne, Rosner                      Assembly                                  16.3
100204     David, Keck                         Assembly                                  17.8
100365     Sherman, Cheswick                   President                                99900
100967     Nicholas, Albregts                  Assembly                                  15.5
101066     Laura, Rodgers                      Sales                                     12.6
101135     David, Deppe                        Assembly                                 11.65
101154     Gregory, Hettinger                  Assembly                                 11.25
100001     Jim, Manaugh                        Chief Financial Officer                  75500
100112     Steven, Hickman                     Programmer Analyst                       57600
100127     Jason, Wendling                     Operations Officer                       65600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100200     Beth, Zobitz                        Engineer                                 55200
100330     Kristen, Gustavel                   Operations Officer                       68800
100475     Steve, Hess                         Assembly                                  17.6
100700     Charles, Jones                      DBA                                      65600
100892     Joseph, Platt                       Assembly                                 17.95
101007     Jason, Krasner                      Sales                                    12.75
101030     Kristey, Moore                      Assembly                                  13.6

40 rows selected. 


EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100125     Gabrielle, Stevenson                Chief Information Officer                75300
100220     Todd, Vigus                         Accountant                                  15
100488     Jamie, Osman                        Programmer Analyst                       46300
100650     Edna, Lilley                        VP Information                           93900
101088     Patricha, Underwood                 Assembly                                 18.45
100120     Michelle, Nairn                     Assembly                                 16.75
100399     Ronald, Day                         Assembly                                 16.25
100550     Allison, Roland                     Assembly                                 16.85
100944     Ryan, Stahley                       Engineer                                 48600
101089     Melissa, Alvarez                    Assembly                                 13.25
101115     Steve, Cochran                      Assembly                                  10.5

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100209     Tina, Yates                         Engineer                                 52000
100559     Meghan, Tyrie                       Engineer                                 50100
101045     Austin, Ortman                      Assembly                                  10.5
101097     Jack, Brose                         Assembly                                 12.05
101166     Phil, Reece                         Assembly                                  10.5
100104     Michael, Abbott                     Engineer                                 74400
100600     Calie, Zollman                      Sales                                    17.35
100880     Gary, German                        Chief Sales Officer                      48900
100989     Kathryn, Deagen                     Assembly                                 16.95
100103     Rita, Bush                          VP Operations                            85800
100106     Paul, Eckelman                      Accountant                               53600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100206     Kathleen, Xolo                      VP Finance                               80700
100101     Joanne, Rosner                      Assembly                                  16.3
100204     David, Keck                         Assembly                                  17.8
100365     Sherman, Cheswick                   President                                99900
100967     Nicholas, Albregts                  Assembly                                  15.5
101066     Laura, Rodgers                      Sales                                     12.6
101135     David, Deppe                        Assembly                                 11.65
101154     Gregory, Hettinger                  Assembly                                 11.25
100001     Jim, Manaugh                        Chief Financial Officer                  75500
100112     Steven, Hickman                     Programmer Analyst                       57600
100127     Jason, Wendling                     Operations Officer                       65600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100200     Beth, Zobitz                        Engineer                                 55200
100330     Kristen, Gustavel                   Operations Officer                       68800
100475     Steve, Hess                         Assembly                                  17.6
100700     Charles, Jones                      DBA                                      65600
100892     Joseph, Platt                       Assembly                                 17.95
101007     Jason, Krasner                      Sales                                    12.75
101030     Kristey, Moore                      Assembly                                  13.6

40 rows selected. 

no rows selected

Question 15
no rows selected
no rows selected
no rows selected

Question 16

Question 17

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100125     Gabrielle, Stevenson                Chief Information Officer                75300
100220     Todd, Vigus                         Accountant                                  15
100488     Jamie, Osman                        Programmer Analyst                       46300
100650     Edna, Lilley                        VP Information                           93900
101088     Patricha, Underwood                 Assembly                                 18.45
100120     Michelle, Nairn                     Assembly                                 16.75
100399     Ronald, Day                         Assembly                                 16.25
100550     Allison, Roland                     Assembly                                 16.85
100944     Ryan, Stahley                       Engineer                                 48600
101089     Melissa, Alvarez                    Assembly                                 13.25
101115     Steve, Cochran                      Assembly                                  10.5

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100209     Tina, Yates                         Engineer                                 52000
100559     Meghan, Tyrie                       Engineer                                 50100
101045     Austin, Ortman                      Assembly                                  10.5
101097     Jack, Brose                         Assembly                                 12.05
101166     Phil, Reece                         Assembly                                  10.5
100104     Michael, Abbott                     Engineer                                 74400
100600     Calie, Zollman                      Sales                                    17.35
100880     Gary, German                        Chief Sales Officer                      48900
100989     Kathryn, Deagen                     Assembly                                 16.95
100103     Rita, Bush                          VP Operations                            85800
100106     Paul, Eckelman                      Accountant                               53600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100206     Kathleen, Xolo                      VP Finance                               80700
100101     Joanne, Rosner                      Assembly                                  16.3
100204     David, Keck                         Assembly                                  17.8
100365     Sherman, Cheswick                   President                                99900
100967     Nicholas, Albregts                  Assembly                                  15.5
101066     Laura, Rodgers                      Sales                                     12.6
101135     David, Deppe                        Assembly                                 11.65
101154     Gregory, Hettinger                  Assembly                                 11.25
100001     Jim, Manaugh                        Chief Financial Officer                  75500
100112     Steven, Hickman                     Programmer Analyst                       57600
100127     Jason, Wendling                     Operations Officer                       65600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100200     Beth, Zobitz                        Engineer                                 55200
100330     Kristen, Gustavel                   Operations Officer                       68800
100475     Steve, Hess                         Assembly                                  17.6
100700     Charles, Jones                      DBA                                      65600
100892     Joseph, Platt                       Assembly                                 17.95
101007     Jason, Krasner                      Sales                                    12.75
101030     Kristey, Moore                      Assembly                                  13.6

40 rows selected. 


EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100125     Gabrielle, Stevenson                Chief Information Officer                75300
100220     Todd, Vigus                         Accountant                                  15
100488     Jamie, Osman                        Programmer Analyst                       46300
100650     Edna, Lilley                        VP Information                           93900
101088     Patricha, Underwood                 Assembly                                 18.45
100120     Michelle, Nairn                     Assembly                                 16.75
100399     Ronald, Day                         Assembly                                 16.25
100550     Allison, Roland                     Assembly                                 16.85
100944     Ryan, Stahley                       Engineer                                 48600
101089     Melissa, Alvarez                    Assembly                                 13.25
101115     Steve, Cochran                      Assembly                                  10.5

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100209     Tina, Yates                         Engineer                                 52000
100559     Meghan, Tyrie                       Engineer                                 50100
101045     Austin, Ortman                      Assembly                                  10.5
101097     Jack, Brose                         Assembly                                 12.05
101166     Phil, Reece                         Assembly                                  10.5
100104     Michael, Abbott                     Engineer                                 74400
100600     Calie, Zollman                      Sales                                    17.35
100880     Gary, German                        Chief Sales Officer                      48900
100989     Kathryn, Deagen                     Assembly                                 16.95
100103     Rita, Bush                          VP Operations                            85800
100106     Paul, Eckelman                      Accountant                               53600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100206     Kathleen, Xolo                      VP Finance                               80700
100101     Joanne, Rosner                      Assembly                                  16.3
100204     David, Keck                         Assembly                                  17.8
100365     Sherman, Cheswick                   President                                99900
100967     Nicholas, Albregts                  Assembly                                  15.5
101066     Laura, Rodgers                      Sales                                     12.6
101135     David, Deppe                        Assembly                                 11.65
101154     Gregory, Hettinger                  Assembly                                 11.25
100001     Jim, Manaugh                        Chief Financial Officer                  75500
100112     Steven, Hickman                     Programmer Analyst                       57600
100127     Jason, Wendling                     Operations Officer                       65600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100200     Beth, Zobitz                        Engineer                                 55200
100330     Kristen, Gustavel                   Operations Officer                       68800
100475     Steve, Hess                         Assembly                                  17.6
100700     Charles, Jones                      DBA                                      65600
100892     Joseph, Platt                       Assembly                                 17.95
101007     Jason, Krasner                      Sales                                    12.75
101030     Kristey, Moore                      Assembly                                  13.6

40 rows selected. 

no rows selected

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100125     Gabrielle, Stevenson                Chief Information Officer                75300
100220     Todd, Vigus                         Accountant                                  15
100488     Jamie, Osman                        Programmer Analyst                       46300
100650     Edna, Lilley                        VP Information                           93900
101088     Patricha, Underwood                 Assembly                                 18.45
100120     Michelle, Nairn                     Assembly                                 16.75
100399     Ronald, Day                         Assembly                                 16.25
100550     Allison, Roland                     Assembly                                 16.85
100944     Ryan, Stahley                       Engineer                                 48600
101089     Melissa, Alvarez                    Assembly                                 13.25
101115     Steve, Cochran                      Assembly                                  10.5

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100209     Tina, Yates                         Engineer                                 52000
100559     Meghan, Tyrie                       Engineer                                 50100
101045     Austin, Ortman                      Assembly                                  10.5
101097     Jack, Brose                         Assembly                                 12.05
101166     Phil, Reece                         Assembly                                  10.5
100104     Michael, Abbott                     Engineer                                 74400
100600     Calie, Zollman                      Sales                                    17.35
100880     Gary, German                        Chief Sales Officer                      48900
100989     Kathryn, Deagen                     Assembly                                 16.95
100103     Rita, Bush                          VP Operations                            85800
100106     Paul, Eckelman                      Accountant                               53600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100206     Kathleen, Xolo                      VP Finance                               80700
100101     Joanne, Rosner                      Assembly                                  16.3
100204     David, Keck                         Assembly                                  17.8
100365     Sherman, Cheswick                   President                                99900
100967     Nicholas, Albregts                  Assembly                                  15.5
101066     Laura, Rodgers                      Sales                                     12.6
101135     David, Deppe                        Assembly                                 11.65
101154     Gregory, Hettinger                  Assembly                                 11.25
100001     Jim, Manaugh                        Chief Financial Officer                  75500
100112     Steven, Hickman                     Programmer Analyst                       57600
100127     Jason, Wendling                     Operations Officer                       65600

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100200     Beth, Zobitz                        Engineer                                 55200
100330     Kristen, Gustavel                   Operations Officer                       68800
100475     Steve, Hess                         Assembly                                  17.6
100700     Charles, Jones                      DBA                                      65600
100892     Joseph, Platt                       Assembly                                 17.95
101007     Jason, Krasner                      Sales                                    12.75
101030     Kristey, Moore                      Assembly                                  13.6

40 rows selected. 

Question 18

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100125     Gabrielle, Stevenson                Chief Information Officer                90360
100220     Todd, Vigus                         Accountant                                  18
100488     Jamie, Osman                        Programmer Analyst                       55560
100650     Edna, Lilley                        VP Information                          112680
101088     Patricha, Underwood                 Assembly                                 22.14
100120     Michelle, Nairn                     Assembly                                  20.1
100399     Ronald, Day                         Assembly                                  19.5
100550     Allison, Roland                     Assembly                                 20.22
100944     Ryan, Stahley                       Engineer                                 58320
101089     Melissa, Alvarez                    Assembly                                  15.9
101115     Steve, Cochran                      Assembly                                  12.6

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100209     Tina, Yates                         Engineer                                 62400
100559     Meghan, Tyrie                       Engineer                                 60120
101045     Austin, Ortman                      Assembly                                  12.6
101097     Jack, Brose                         Assembly                                 14.46
101166     Phil, Reece                         Assembly                                  12.6
100104     Michael, Abbott                     Engineer                                 89280
100600     Calie, Zollman                      Sales                                    20.82
100880     Gary, German                        Chief Sales Officer                      58680
100989     Kathryn, Deagen                     Assembly                                 20.34
100103     Rita, Bush                          VP Operations                           102960
100106     Paul, Eckelman                      Accountant                               64320

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100206     Kathleen, Xolo                      VP Finance                               96840
100101     Joanne, Rosner                      Assembly                                 19.56
100204     David, Keck                         Assembly                                 21.36
100365     Sherman, Cheswick                   President                               119880
100967     Nicholas, Albregts                  Assembly                                  18.6
101066     Laura, Rodgers                      Sales                                    15.12
101135     David, Deppe                        Assembly                                 13.98
101154     Gregory, Hettinger                  Assembly                                  13.5
100001     Jim, Manaugh                        Chief Financial Officer                  90600
100112     Steven, Hickman                     Programmer Analyst                       69120
100127     Jason, Wendling                     Operations Officer                       78720

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100200     Beth, Zobitz                        Engineer                                 66240
100330     Kristen, Gustavel                   Operations Officer                       82560
100475     Steve, Hess                         Assembly                                 21.12
100700     Charles, Jones                      DBA                                      78720
100892     Joseph, Platt                       Assembly                                 21.54
101007     Jason, Krasner                      Sales                                     15.3
101030     Kristey, Moore                      Assembly                                 16.32

40 rows selected. 


Question 19

Question 20

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100125     Gabrielle, Stevenson                Chief Information Officer                90360
100220     Todd, Vigus                         Accountant                                  18
100488     Jamie, Osman                        Programmer Analyst                       55560
100650     Edna, Lilley                        VP Information                          112680
101088     Patricha, Underwood                 Assembly                                 22.14
100120     Michelle, Nairn                     Assembly                                  20.1
100399     Ronald, Day                         Assembly                                  19.5
100550     Allison, Roland                     Assembly                                 20.22
100944     Ryan, Stahley                       Engineer                                 58320
101089     Melissa, Alvarez                    Assembly                                  15.9
101115     Steve, Cochran                      Assembly                                  12.6

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100209     Tina, Yates                         Engineer                                 62400
100559     Meghan, Tyrie                       Engineer                                 60120
101045     Austin, Ortman                      Assembly                                  12.6
101097     Jack, Brose                         Assembly                                 14.46
101166     Phil, Reece                         Assembly                                  12.6
100104     Michael, Abbott                     Engineer                                 89280
100600     Calie, Zollman                      Sales                                    20.82
100880     Gary, German                        Chief Sales Officer                      58680
100989     Kathryn, Deagen                     Assembly                                 20.34
100103     Rita, Bush                          VP Operations                           102960
100106     Paul, Eckelman                      Accountant                               64320

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100206     Kathleen, Xolo                      VP Finance                               96840
100101     Joanne, Rosner                      Assembly                                 19.56
100204     David, Keck                         Assembly                                 21.36
100365     Sherman, Cheswick                   President                               119880
100967     Nicholas, Albregts                  Assembly                                  18.6
101066     Laura, Rodgers                      Sales                                    15.12
101135     David, Deppe                        Assembly                                 13.98
101154     Gregory, Hettinger                  Assembly                                  13.5
100001     Jim, Manaugh                        Chief Financial Officer                  90600
100112     Steven, Hickman                     Programmer Analyst                       69120
100127     Jason, Wendling                     Operations Officer                       78720

EMPLOYEE_I EMPLOYEE_NAME                       JOB_TITLE                               SALARY
---------- ----------------------------------- ----------------------------------- ----------
100200     Beth, Zobitz                        Engineer                                 66240
100330     Kristen, Gustavel                   Operations Officer                       82560
100475     Steve, Hess                         Assembly                                 21.12
100700     Charles, Jones                      DBA                                      78720
100892     Joseph, Platt                       Assembly                                 21.54
101007     Jason, Krasner                      Sales                                     15.3
101030     Kristey, Moore                      Assembly                                 16.32

40 rows selected. 

Question 21

Question Bonus


*/
