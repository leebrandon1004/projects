--Question A1
CREATE TABLE CUSTOMER_NEW AS SELECT * FROM CNIT372TA.CUSTOMER_NEW;
ALTER TABLE CUSTOMER_NEW ADD PRIMARY KEY (CustomerID);
/

--Question A2
CREATE VIEW CUSTOMER_NEW_VIEW
AS
SELECT custname, companyname, address, city, state, postalcode, phone, emailaddr
FROM CUSTOMER_NEW;

SELECT * FROM CUSTOMER_NEW_VIEW;
/

--Question A3
INSERT INTO CUSTOMER_NEW_VIEW (custname, address, city, state, postalcode)
VALUES ('John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907');

/

--Question A4
CREATE VIEW CUSTOMER_ALL(customerid, custname, companyname, address, postalcode, city, state, phone, emailaddr)
AS
SELECT customerid, custfirstname || ' ' || custlastname as custname, companyname, address, postalcode, city, state, phone, emailaddr
FROM customer
UNION
SELECT customerid, custname, companyname, address, postalcode, city, state, phone, emailaddr
FROM CUSTOMER_NEW;

SELECT * FROM CUSTOMER_ALL;
/

--Question A5
INSERT INTO CUSTOMER_ALL(customerid, custname, address, city, state, postalcode)
VALUES('C-001', 'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907');
/

--Question A6
CREATE VIEW INDIANA_CUSTOMER
AS
SELECT * FROM CUSTOMER_NEW
WHERE state = 'IN';
/

--Question A7
INSERT INTO INDIANA_CUSTOMER(customerid, custname, address, city, state, postalcode)
VALUES('C-001', 'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47906');

COMMIT;
/

--Question A8
DELETE FROM INDIANA_CUSTOMER
WHERE customerid = 'C-001';

SELECT * FROM INDIANA_CUSTOMER;
SELECT * FROM CUSTOMER_NEW;

COMMIT;
/

--Question A9
DELETE FROM CUSTOMER_NEW;

SELECT * FROM CUSTOMER_NEW;

ROLLBACK;

SELECT * FROM CUSTOMER_NEW;
/

--Question A10
TRUNCATE TABLE CUSTOMER_NEW;

SELECT * FROM CUSTOMER_NEW;

ROLLBACK;

SELECT * FROM CUSTOMER_NEW;
/

--Question A11
GRANT READ ON CUSTOMER_ALL TO CNIT372TA;
/

--Question A12
REVOKE READ ON CUSTOMER_ALL FROM CNIT372TA;
/

--Question A13
GRANT SELECT, INSERT, DELETE ON CUSTOMER_ALL TO CNIT372TA;
/

--Question A14
REVOKE SELECT, INSERT, DELETE ON CUSTOMER_ALL FROM CNIT372TA;
/

--Question A15
REVOKE READ ON CUSTOMER_ALL FROM LEE3118;
/

--Question A16
DROP TABLE CUSTOMER_NEW;
DROP VIEW CUSTOMER_NEW_VIEW;
DROP VIEW CUSTOMER_ALL;
DROP VIEW INDIANA_CUSTOMER;
/

--Question A17

/

--Question A18
GRANT EXECUTE ON NUMBER_OF_EMPLOYEES TO CNIT372TA;
/

--Question A19
REVOKE EXECUTE ON NUMBER_OF_EMPLOYEES FROM CNIT372TA;
/

--Question A20
DROP PROCEDURE HELLO_WORLD;

CREATE OR REPLACE PROCEDURE HELLO_WORLD
(P_NAME IN VARCHAR2)
AS
    V_OUTPUT VARCHAR2(100);
BEGIN
    V_OUTPUT := 'Hello ' || P_NAME;
    DBMS_OUTPUT.PUT_LINE (V_OUTPUT);
END HELLO_WORLD;

SELECT * FROM USER_TAB_PRIVS;
/

--Question A21
GRANT EXECUTE ON NUMBER_OF_EMPLOYEES TO CNIT372TA;
/

--Question A22
CREATE OR REPLACE FUNCTION NUMBER_OF_EMPLOYEES
    RETURN NUMBER
AS
    v_number_of_employees NUMBER := 0;
begin

    select count(*)
        into v_number_of_employees
    from employee;
    
    return v_number_of_employees;
end NUMBER_OF_EMPLOYEES;

SELECT * FROM USER_TAB_PRIVS;
/

--Question A23



--Results
/*
Question A1



Question A2
View CUSTOMER_NEW_VIEW created.


CUSTNAME                            COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
----------------------------------- ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
Helly Smith                                                                  953 Eden Park Dr.                        Cincinnati           OH 45202      513-639-2995 information@cincyart.org                          
John Day                            Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-2560 johnday@purdue.edu                                
Shannon Jing                        Purdue University                        500 Oval Dr.                             Wset Lafayette       IN 47907      765-588-7610 jing@purdue.edu                                   
Julia Rayz                          Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-9525 jtaylor1@purdue.edu                               
Jack Anderson                       University of Chicago                    5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-8650 infocenter@uchicago.edu                           
Kate Johnson                        Michigan University                      500 S. State St.                         Ann Arbor            MI 48109      734-764-1817 info@umich.edu                                    
Shannon Jing                                                                 500 Oval Dr.                             West Lafayette       IN 47907      765-588-7610 tarokingu@gmail.com                               
Jackson Williams                                                             3400 Vine St.                            Cincinnati           OH 45220                   jackwilliams@gmail.com                            
Zack Browns                                                                  1777 E. Broad St.                        Columnbus            OH 43203      614-715-0000 zbrowns@yahoo.com                                 
Kate Sun                                                                     405 Sagamore Pkwy S.                     Lafayette            IN 47904                   katesun@gmail.com                                 

10 rows selected. 

Question A3
Error starting at line : 16 in command -
INSERT INTO CUSTOMER_NEW_VIEW (custname, address, city, state, postalcode)
VALUES ('John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907')
Error report -
ORA-01400: cannot insert NULL into ("LEE3118"."CUSTOMER_NEW"."CUSTOMERID")

The inserted value does not have a primary key from the customer table.

Question A4
CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-300001   Gregory Abbott                       Baker and Company                        7837 Busse Rd.                           47813      Terre Haute          IN 812-447-3621 greggie@usol.com                                  
C-300002   Tommy McFerren                       Cole Sales and Associates                3817 Farrell Rd.                         97709      Bend                 OR 503-767-7054 mcferren@cole.com                                 
C-300003   Cecil Scheetz                        Tippe Inn                                391 Weber Rd.                            04903      Waterville           ME 207-679-9822 cecil@free.com                                    
C-300004   Frank Aamodt                         Franklin Trinkets                        3304 Leredo Ave.                         06776      New Milford          CT 898-762-8741 fa@fast.com                                       
C-300005   Kathleen Plyman                      Needle Center                            7627 Belmont Ave                         10131      New York City        NY 507-543-2052 needles@onlineservice.com                         
C-300006   George Purcell                       BMA Advertising Design                   4281 Jefferson Rd.                       18522      Scranton             PA 432-320-6905 design@zeronet.net                                
C-300007   Eugene Gasper                        Regency Hospital                         7022 Ward Lake Rd.                       05641      Barre                VT 705-580-6124 medcare@fast.com                                  
C-300008   Jared Meers                          South Street Rehabilitation              4271 Airport Rd.                         58026      Grand Forks          ND 701-371-1701 rehabsouth@zeronet.net                            
C-300009   Tracy Cicholski                      Dixon Pharmacy                           1920 Albion St.                          39059      Crystal Springs      MS 601-959-1315 dixpharm@free.com                                 
C-300010   Bruce Fogarty                        Photography Niche                        1012 Island Ave.                         26346      Ellenboro            WV 598-791-1420 photoniche@usol.com                               
C-300011   Susan Strong                         Family Medical Center                    5883 Sudbury Rd.                         31620      Adel                 GA 912-760-7840 fammed@onlineservice.com                          

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-300012   Ginger Xiao                          Bryant Accounting                        6636 Walnut St.                          57703      Rapid City           SD 605-846-0451 acctsbryant@zeronet.net                           
C-300013   Karen Burns                          Recreation Supply                        2850 Farm St.                            95354      Modesto              CA 707-598-2670 burnskaren@fast.com                               
C-300014   Cathy Bending                        R and R Air                              9573 Chestnut St.                        47732      Evansville           IN 765-617-2811 rrair@zeronet.net                                 
C-300015   Evelyn Cassens                       Vets Inc.                                6094 Pearson St.                         19726      Newark               DE 302-762-9526 dr.animal@onlineservice.com                       
C-300016   Angie Hoover                         Goodwork Corporation                     6427 Genesee St.                         82638      Casper               WY 307-459-4165 ahoover@free.com                                  
C-300017   Jim Sokeland                         Powerful Employment                      6671 Pearl Rd.                           21136      Reisterstown         MD 723-366-1117 employment@zeronet.net                            
C-300018   Hugo Gillespie                       Wadake Critters                          4194 Northfield Rd.                      67402      Salina               KS 785-981-0669 critters@free.com                                 
C-300019   Wade Jacobs                          Conner National                          2610 E. Lake Rd.                         58653      Scranton             ND 803-477-5347 connernat@usol.com                                
C-300020   Brittany Cottingham                  Cottingham Plastics                      4234 Taylor Rd.                          45819      Lima                 OH 419-464-5273 plastic@onlineservice.com                         
C-300021   David Tarter                         Realty Specialties                       6274 Blue Rock Rd.                       13261      Syracuse             NY 518-500-0570 estate@fast.com                                   
C-300022   Heather Wallpe                       Reflexions Manufacturing                 4128 Hulen St.                           63653      Park Hills           MO 816-433-9799 flex@onlineservice.com                            

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-300023   Robert Dalury                        TAS                                      4718 Pleasant Valley Rd.                 48708      Bay City             MI 906-278-6446 tas@zeronet.net                                   
C-300024   Jim Lichty                           Bankruptcy Help                          5991 Kenwood Rd.                         60624      Chicago              IL 618-847-1904 bankrupt@usol.com                                 
C-300025   Dusty Jones                          Railroad Express                         1390 Clearview Pkwy.                     83826      Eastport             ID 674-727-0511 rr@usol.com                                       
C-300026   Larry Osmanova                       City Bus Transport                       256 Royal Ln.                            97311      Salem                OR 541-905-4819 citybus@fast.com                                  
C-300027   Richard Strehle                      Vacation Car Rentals                     9862 Rock Island Rd.                     99362      Walla Walla          WA 206-434-7305 vacation@fast.com                                 
C-300028   Brenda Kitchel                       Cheesman Corporation                     6482 Thomasen Rd.                        24011      Roanoke              VA 804-214-8732 cheesman@zeronet.net                              
C-300029   Don Torres                           Down Deep Drilling Inc.                  1979 Illinois Ave.                       30635      Elberton             GA 706-649-6375 drill@usol.com                                    
C-300030   Richard Kluth                        Main St. Bar and Grill                   7901 Peach Tree Dr.                      19709      Middletown           DE 302-296-8012 rickkluth@free.com                                
C-300031   Allen Robles                         Copy Center                              1228 Bailey Rd.                          80761      Haxtun               CO 644-730-8090 copy@onlineservice.com                            
C-300032   Archie Doremski                      Greenpart Steet Metal                    6580 Midway Rd.                          82414      Cody                 WY 307-944-8959 sheetz@free.com                                   
C-300033   Daniel Ezra                          Pools For You                            7393 Lake June Rd.                       04212      Auburn               ME 207-744-1997 swim@zeronet.net                                  

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-300034   Dean Katpally                        Phone Corporation                        1179 38th St.                            96746      Kapaa                HI 808-799-3727 phonecorp@usol.com                                
C-300035   Randall Neely                        Store It Here                            1132 Madison St.                         05701      Rutland              VT 802-319-9805 storage@fast.com                                  
C-300036   Mike Condie                          Kids Recreation Inc.                     449 Troy Ave.                            27895      Wilson               NC 336-211-1238 kidrec@zeronet.net                                
C-300037   Tim Leffert                          Trailor Rentals                          2765 Independence Ave.                   13442      Rome                 NY 315-486-4777 trailrent@zeronet.net                             
C-300038   Carl Dallas                          Water Analysts                           2530 Lakewood Blvd.                      29153      Sumter               SC 864-541-5114 analyzeh20@fast.com                               
C-300039   Dennis Sammons                       Gards Auto Repair                        581 Sahara Blvd.                         48609      Saginaw              MI 616-544-1969 repairit@free.com                                 
C-300040   Mildred Jones                        Computer Consultants                     2278 Flamingo Rd.                        18195      Allentown            PA 610-437-6687 compconsul@usol.com                               
C-300041   Paul Kaakeh                          Laser Graphics Associates                3616 Jones Blvd.                         81247      Gunnison             CO 719-750-4539 graphit@usol.com                                  
C-300042   Kevin Zubarev                        Signs Signs Signs                        5933 Valley St.                          83221      Blackfoot            ID 208-364-3785 sign3@fast.com                                    
C-300043   Mary Uhl                             Flowers by Mickey                        6936 Citrus Blvd.                        29413      Charleston           SC 803-974-2809 mouse@fast.com                                    
C-300044   Jennifer Kmec                        Kelly Dance Studio                       9413 E. Broadway St.                     21787      Taneytown            MD 443-542-1386 dancingk@free.com                                 

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-300045   Marjorie Vandermay                   National Art Museum                      5384 Raymond Ave.                        68310      Beatrice             NE 308-489-1137 nam@fast com                                      
C-300046   Stephanie Yeinick                    Tuckers Jewels                           2596 S. Fairview Rd.                     65270      Moberly              MO 573-455-4278 jewels@usol.com                                   
C-300047   Cathy Harvey                         The Employment Agency                    9481 Town Line Rd.                       28810      Asheville            NC 336-477-0249 findwork@onlineservice.com                        
C-300048   Geo Schofield                        Cleaning Supply                          4931 Talbot Blvd.                        38967      Winona               MS 228-480-9751 cleanit@usol.com                                  
C-300049   Kara Orze                            Appliances Inc.                          2666 Stillwater Rd.                      54401      Wausau               WI 414-773-1017 appinc@zeronet.net                                
C-300050   Jeff Kowaiski                        Quality Equipment Corp.                  3323 Mission Pkwy.                       14895      Wellsville           NY 212-492-5644 equipit@usol.com                                  
C-300051   Sharon Rouls                         Sharons Shamrock                         1274 Weaver Rd.                          36303      Dothan               AL 205-246-3224 irish@free.com                                    
C-300052   Sherry Garling                       Manufactured Homes Corp.                 4350 Concord Blvd.                       04462      Millinockets         ME 353-822-7623 homely@fast.com                                   
C-300053   Mary Deets                           Camping Supplies                         4534 South Acres Rd.                     96782      Pearl City           HI 808-562-4081 camphere@fast.com                                 
C-300054   Dennis Drazer                        Financial Planning Consul                4799 Silverstar Rd.                      98115      Seattle              WA 253-315-4247 dollarplan@usol.com                               
C-300055   Robert Lister                        Fire Alarm Systems                       3016 Dunlap Ave.                         84603      Provo                UT 801-404-1240 fines@free.com                                    

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-300056   Heather Waters                       Happytime Escort Service                 805 Cactus Rd.                           29560      Lake City            SC 869-741-7817 dates@free.com                                    
C-300057   Anita Pastron                        Industrail Contracting Co                2817 Northern Ave.                       37111      McMinnville          TN 901-796-4654 contracts@fast.com                                
C-300058   Amy Heide                            Outlets                                  9119 Camelback Rd.                       05304      Brattleboro          VT 802-894-1024 letout@usol.com                                   
C-300059   Charlene Franks                      Rydell High School                       1627 Thomas Rd.                          82633      Douglas              WY 307-892-2938 learn@rydell.edu                                  
C-300060   Doug Blizzard                        Collectibles Inc.                        856 Van Buren St.                        39666      Mars Hill            MS 228-646-5114 collectit@onlineservice.com                       
C-300061   Richard Scott                        Karate Made Easy                         1489 Dobbins Rd.                         26555      Fairmont             WV 304-774-2226 kick@onlineservice.com                            
C-300062   Scott Gray                           Security Installation                    115 Shea Blvd.                           17406      York                 PA 484-453-7105 keepsafe@zeronet.net                              
C-300063   Randy Talauage                       Ceramic Supply                           6364 Brown St.                           99157      Northport            WA 347-671-2022 paintit@fast.com                                  
C-300064   Daniel Hundnall                      Bobs Repair Service                      909 Reams Rd.                            73705      Enid                 OK 918-830-9731 fixit@usol.com                                    
C-300065   Sally Valle                          Investment Specialties                   6298 Killingsworth St.                   76208      Denton               TX 972-234-2044 roi@usol.com                                      
C-300066   Noemi Elston                         North Street Church                      3024 28th St.                            82902      Rock Springs         WY 307-359-9514 closetoheaven@zeronet.net                         

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-300067   Kelly Jordan                         Supplying Crafts                         168 Division St.                         32205      Jacksonville         FL 727-951-7737 supplycrafts@fast.com                             
C-300068   Steve Fulkerson                      Cellular Services                        6912 White Horse Rd.                     85937      Snowflake            AZ 602-129-1885 cellcall@usol.com                                 
C-300069   Orville Gilliland                    Easy Internet Access                     5515 Page-Mill Rd.                       39565      Vancleeve            MS 490-263-2957 eia@zeronet.net                                   
C-300070   Bridgette Kyger                      Sampson Home Mortgages                   5682 Chester Pike Rd.                    21412      Annapolis            MD 301-467-6480 homeloans@fast.com                                
C-300071   Norman Fields                        The Cable Company                        4174 Collings St.                        99811      Juneau               AK 501-346-4841 catv@onlineservice.com                            
C-300072   Jessica Nakamura                     Automart                                 8233 Clairton Ave.                       57301      Mitchell             SD 605-324-2193 carsell@usol.com                                  
C-300073   Jack Barrick                         First National Bank                      2638 Becks Run Rd.                       32783      Titusville           FL 786-494-4782 1natbank@free.com                                 
C-300074   Aricka Bross                         Apartment Referrals                      555 W. Liberty Ave.                      43986      Jewett               OH 419-676-9758 placetolive@free.com                              
C-301      John Day                             Purdue University                        401 N. Grant St.                         47907      West Lafayette       IN 765-494-2560 johnday@purdue.edu                                
C-302      Shannon Jing                         Purdue University                        500 Oval Dr.                             47907      Wset Lafayette       IN 765-588-7610 jing@purdue.edu                                   
C-303      Julia Rayz                           Purdue University                        401 N. Grant St.                         47907      West Lafayette       IN 765-494-9525 jtaylor1@purdue.edu                               

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
C-304      Jack Anderson                        University of Chicago                    5801 S. Ellis Ave.                       60637      Chicago              IL 773-702-8650 infocenter@uchicago.edu                           
C-305      Kate Johnson                         Michigan University                      500 S. State St.                         48109      Ann Arbor            MI 734-764-1817 info@umich.edu                                    
I-300001   Anna Mayton                                                                   2381 Basse Rd.                           36456      McKenzie             Al 888-451-1233 doctor@free.com                                   
I-300002   Lou Caldwell                                                                  1486 Joliet Rd.                          40211      Louisville           KY 606-901-1238 lucky@fast.com                                    
I-300003   Carl Hague                                                                    2711 143rd St.                           45207      Cincinnati           OH 419-890-3531                                                   
I-300004   Jeffery Jordan                                                                1500 Normantown Rd.                      99211      Spokane              WA 509-989-9996 seeya@usol.com                                    
I-300005   Kimber Spaller                                                                1565 Culebra Rd.                         99836      Sitka                AK 878-119-5448 mcgimmie@zero.net                                 
I-300006   Eric Fannon                                                                   2526 Nelson Rd.                          96003      Redding              CA 209-980-0812 ef@free.com                                       
I-300007   Jessica Cain                                                                  942 55th St.                             48838      Greenville           MI 517-901-2610                                                   
I-300008   Richard Zito                                                                  7569 130th St.                           03766      Lebanon              NH 603-787-0787 rzito@zeronet.net                                 
I-300009   Angela Wainscott                                                              3646 North Ave.                          83415      Idaho Falls          ID 208-788-4112 awainscott@free.com                               

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300010   James Gross                                                                   1983 Mill St.                            08701      Lakewood             NJ 908-879-8672 jgross@fast.com                                   
I-300011   Jack Akers                                                                    1485 71st St.                            19850      Wilmington           DE 301-454-6061 pizazz@usol.com                                   
I-300012   Kevin Jackson                                                                 5990 Cuba Rd.                            70123      New Orleans          LA 225-624-2341                                                   
I-300013   Shirley Osborne                                                               816 Penny Rd.                            30401      Swainsboro           GA 706-333-7174                                                   
I-300014   Eric Becker                                                                   8784 Wabash Ave.                         28504      Kinston              NC 910-717-7613 daddyo@usol.com                                   
I-300015   Karen Mangus                                                                  4804 Ridge Rd.                           33871      Sebring              FL 863-623-0459 missright@onlineservice.com                       
I-300016   Peter Austin                                                                  4804 River Rd.                           29812      Barnwell             SC 803-343-6063                                                   
I-300017   Brad Arquette                                                                 2599 Ben Hill Rd.                        89049      Tonopah              NV 775-914-4294 arq@usol.com                                      
I-300018   Daniel Barton                                                                 4599 Atlanta Rd.                         79556      Sweetwater           TX 915-894-8034 dannie@zeronet.net                                
I-300019   Jerry Mennen                                                                  869 Clay St.                             86038      Flagstaff            AZ 520-306-8426 mennenj@free.com                                  
I-300020   Kenneth Wilcox                                                                9364 Hershell Rd.                        50801      Creston              IA 515-872-8848 kenny@onlineservice.com                           

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300021   Matt Smith                                                                    6804 All Rd.                             81402      Montrose             CO 719-822-8828 matsm@fast.com                                    
I-300022   Paul Sullivan                                                                 9399 Flat Rd.                            67251      Wichita              KS 785-322-5896 sullie@zeronet.net                                
I-300023   Gerald Campbell                                                               1869 Boundary St.                        53964      Westfield            WI 431-087-1044 gcampbell@free.com                                
I-300024   Joan Hedden                                                                   4518 Red Bud Trail                       72765      Springdale           AR 501-710-0658                                                   
I-300025   Ronald Miller                                                                 360 Spring St.                           49008      Kalamazoo            MI 734-820-2076 picky@zeronet.net                                 
I-300026   Terry Xu                                                                      2019 Elm St.                             65215      Columbia             MO 417-546-2570 muffin@fast.com                                   
I-300027   Danita Sharp                                                                  3475 Mystic St.                          98908      Yakima               WA 360-650-5604 girlfriend@fast.com                               
I-300028   Don Kaleta                                                                    8948 Washington St.                      16602      Altoona              PA 724-695-2157 stud@zeronet.net                                  
I-300029   Tammi Baldocchio                                                              924 North Ave.                           02876      Slatersville         RI 401-989-4975                                                   
I-300030   Eric Quintero                                                                 144 Concord Rd.                          47202      Columbus             IN 812-805-1588 diamond@onlineservice.com                         
I-300031   Phillip Hession                                                               7610 Hartford Ct.                        49016      Battle Creek         MI 231-711-6837 howdy@usol.com                                    

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300032   Ruth Albeering                                                                1348 Yonge Rd.                           24333      Galax                VA 784-444-0131 rabeering@free.com                                
I-300033   Jacob Richer                                                                  1490 N. Shore Rd.                        98823      Ephrata              WA 425-942-3763 laugh@free.com                                    
I-300034   James Jones                                                                   4685 Vernon St.                          97720      Burns                OR 971-522-5851 puffy@fast.com                                    
I-300035   Tim Parker                                                                    2848 Marrett Rd.                         12182      Troy                 NY 315-985-4102 jeckle@onlineservice.com                          
I-300036   Andrea Montgomery                                                             1699 Conner Dr.                          21788      Thurmont             MD 349-397-7772                                                   
I-300037   Chas Funk                                                                     2490 Maple St.                           06611      Trumbull             CT 860-498-3900 duck@usol.com                                     
I-300038   David Smith                                                                   9245 Main St.                            61125      Rockford             IL 309-980-4350 emerald@onlineservice.com                         
I-300039   David Chang                                                                   5786 Manor Rd.                           44907      Mansfield            OH 740-750-1272 lion@free.com                                     
I-300040   Kathy Gunderson                                                               2257 Oak Springs Rd.                     32447      Marianna             FL 941-330-3314                                                   
I-300041   Dennis Mundy                                                                  5781 Red Bud Trail                       03561      Littleton            NH 603-306-0774 rino@usol.com                                     
I-300042   George Trenkle                                                                1874 Jefferson Ave.                      08837      Edison               NJ 856-267-7913 cold@fast.com                                     

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300043   Carey Dailey                                                                  234 Sheridan Dr.                         80219      Denver               CO 728-896-2767 shelty@usol.com                                   
I-300044   Louise Cool                                                                   6831 Walden Ave.                         83333      Hailey               ID 208-956-0698                                                   
I-300045   Gary Kempf                                                                    3908 William St.                         43326      Kenton               OH 937-724-7313 kempfg@free.com                                   
I-300046   Jane Mumford                                                                  8235 Center Rd.                          42719      Campbellsville       KY 270-428-5866                                                   
I-300047   Scott Yarian                                                                  4198 Center Ridge Rd.                    28472      Whiteville           NC 252-310-2224 syarian@fast.com                                  
I-300048   Patrick Bollock                                                               1472 Bayley Rd.                          82435      Powell               WY 307-635-1692 pat@fast.com                                      
I-300049   Paul Rice                                                                     830 Shaker Blvd.                         81626      Craig                CO 719-541-1837 paulier@onlineservice.com                         
I-300050   James Schilling                                                               2021 North Bend Rd.                      52498      Cedar Rapids         IA 319-429-9772                                                   
I-300051   Lynne Lagunes                                                                 2820 Beechmont Ave.                      83209      Pocatello            ID 208-502-9976 hello@zeronet.net                                 
I-300052   Andrew Yelnick                                                                6972 Winton Rd.                          48226      Detroit              MI 517-803-5818 family@free.com                                   
I-300053   Stephanie Pearl                                                               6460 Springdale Rd.                      64468      Maryville            MO 660-447-8319 mommyl@fast.com                                   

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300054   Dorlan Bresnaham                                                              1328 Mill Ave.                           03264      Plymouth             NH 603-497-7374 dorlan@usol.com                                   
I-300055   Jon Clute                                                                     1680 River Oaks Blvd.                    85711      Tucson               AZ 480-181-8940                                                   
I-300056   Elizabeth Henderson                                                           2819 Otay Rd.                            57758      Zeona                SD 449-486-8018                                                   
I-300057   Tonya Owens                                                                   1414 Fields Ertel Rd.                    29620      Abbeville            SC 843-773-2751                                                   
I-300058   Matthew Quant                                                                 253 Silver Creek Rd.                     28345      Hamlet               NC 910-577-1319 walker@onlineservice.com                          
I-300059   Kenneth Mintier                                                               4831 Skeet Blvd.                         95534      Eureka               CA 323-673-0690 builder@usol.com                                  
I-300060   Lucille Appleton                                                              5260 Blue Mound Rd.                      12553      Newburgh             NY 914-497-2160 muscle@zeronet.net                                
I-300061   Brenda Jones                                                                  3696 Cooper St.                          80230      Aurora               CO 720-800-2638 show@free.com                                     
I-300062   John McGinnis                                                                 7841 Hurst Blvd.                         83263      Preston              ID 208-741-1963 john@zeronet.net                                  
I-300063   Dennis Eberle                                                                 9425 James Rd.                           50707      Waterloo             IA 515-708-1802 deber@free.com                                    
I-300064   Jo Jacko                                                                      6588 Ken Caryl Rd.                       08361      Vineland             NJ 856-752-7471                                                   

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300065   Karen Randolph                                                                1038 Coal Mine Rd.                       03235      Franklin             NH 603-744-9002 cookin@zeronet.net                                
I-300066   Ruth Ball                                                                     1093 Valley View Ln.                     56387      St. Cloud            MN 651-479-7538                                                   
I-300067   Travis Camargo                                                                6681 Forrest Ln.                         64853      Neosho               MO 816-746-4913                                                   
I-300068   Jerry Muench                                                                  1694 Stone Valley Rd.                    79059      Miami                TX 464-669-8537 redhot@onlineservice.com                          
I-300069   Verna McGrew                                                                  4755 Rocket Blvd.                        35811      Huntsville           AL 334-547-9329 verngrew@free.com                                 
I-300070   Elizabeth Derhammer                                                           2343 Pioneer Pkwy.                       67868      Garden City          KS 785-970-9916 lizzy@onlineservice.com                           
I-300071   Ted Zissa                                                                     4935 Cedar Hill Rd.                      73402      Ardmore              OK 405-151-7445                                                   
I-300072   Matt Shade                                                                    8441 Skillman Ave.                       85622      Green Valley         AZ 623-422-6616 shadtree@free.com                                 
I-300073   Dean Eagon                                                                    616 Burton Rd.                           81011      Peublo               CO 970-581-8611                                                   
I-300074   Andrew Ray                                                                    1246 Ferry St.                           08332      Millville            NJ 609-345-9680 andyray@usol.com                                  
I-300075   Robert Cortez                                                                 219 Pleasant Run Rd.                     03435      Keene                NH 603-442-3740                                                   

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300076   Tim Carlton                                                                   1038 Lancaster St.                       06082      Enfield              CT 203-608-3465                                                   
I-300077   Jennifer Hundley                                                              6354 Buckner Blvd.                       26261      Richwood             WV 304-713-3298 jenhund@fast.com                                  
I-300078   Andrea Griswold                                                               8215 Garland Rd.                         80429      Leadville            CO 970-746-0995 andygwold@usol.com                                
I-300079   Christina Wilson                                                              5766 Scyene Rd.                          67124      Pratt                KS 316-210-8989                                                   
I-300080   Juicheng Nugent                                                               9443 Illinois Ave.                       05156      Springfield          VT 802-352-8923 nugent@fast.com                                   
I-300081   Bryan Price                                                                   1745 Best Line Rd.                       23666      Hampton              VA 804-674-9666                                                   
I-300082   Helene Ziekart                                                                9533 Simonds Rd.                         06511      New Haven            CT 203-244-9192                                                   
I-300083   Marty Fay                                                                     9241 School Rd.                          99775      Fairbanks            AK 501-631-3727 sparky@free.com                                   
I-300084   Lisa Pettry                                                                   8515 Cossell Ave.                        89714      Carson City          NV 702-799-7272 lpett@zeronet.net                                 
I-300085   Zach McGrew                                                                   5788 Rockville Rd.                       85502      Globe                AZ 520-730-8494                                                   
I-300086   Jamie Thompson                                                                6878 Holt Ave.                           30606      Athens               GA 706-471-1222 jthompson@onlineservice.com                       

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300087   Charles Jones                                                                 1420 N. Highland Ave.                    33606      Grand                FL 919-774-5552 charlie@usol.com                                  
I-300088   Thomas Zelenka                                                                5371 Brookeville Rd.                     03108      Manchester           NH 603-374-3706 zelenka@free.com                                  
I-300089   James Laake                                                                   3434 Great Street                        82710      Aladdin              WY 613-785-7063                                                   
I-300090   Daniel Stabnik                                                                3745 35th St.                            63775      Perryville           MO 636-746-4124                                                   
I-300091   Trudi Antonio                                                                 9882 Strother Rd.                        13699      Potsdam              NY 718-747-3259 toni@onlineservice.com                            
I-300092   John Garcia                                                                   231 63rd St.                             04122      Portland             ME 207-311-0174 jgar@onlineservice.com                            
I-300093   Jay Hanau                                                                     5897 Sunset Rd.                          62959      Marion               IL 773-490-8254                                                   
I-300094   Joseph Schuman                                                                5893 Warm Springs Rd.                    44304      Akron                OH 330-209-1273                                                   
I-300095   Joshua Cole                                                                   7903 Paradise Rd.                        38308      Jackson              TN 865-269-7782 fido@zeronet.net                                  
I-300096   David Schilling                                                               8671 Chapel Rd.                          42102      Bowling Green        KY 502-421-1516                                                   
I-300097   Mary Ann Rausch                                                               3679 Western Ave.                        82938      Green River          WY 307-944-3324 spiritual@free.com                                

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300098   Allison Roland                                                                4599 S. Maodill Ave.                     33604      Palma                FL 929-498-4174 alley@onlineservice.com                           
I-300099   Roy Beer                                                                      8065 Colina Rd.                          98907      Yakima               WA 206-745-2584 wizzy@usol.com                                    
I-300100   Chris Dunlap                                                                  3526 10th St.                            82731      Gillette             WY 307-473-2281                                                   
I-300101   Ansel Farrell                                                                 316 Birch St.                            50588      Storm Lake           IA 712-440-3934 prickly@onlineservice.com                         
I-300102   Jason Laxton                                                                  7858 Dowling Ave. N.                     01368      Athol                MA 978-860-2824 coondog@usol.com                                  
I-300103   Larry Gardiner                                                                1739 W 39th St.                          71295      Winnsboro            LA 225-313-6268 square@onlineserveice.com                         
I-300104   Lawrence Pullen                                                               4599 Rheem Blvd.                         56726      Greenbush            MN 644-591-3243 laurie@free.com                                   
I-300105   Matt Nakanishi                                                                8108 Middle Rd.                          84501      Price                UT 435-710-5324 nakan@free.com                                    
I-300106   Nancy Basham                                                                  3409 36th Ave. N.                        04930      Dexter               ME 207-422-7135                                                   
I-300107   Rachel Davis                                                                  2954 Cedar Lake Rd.                      89523      Reno                 NV 702-907-4818 rachdav@zeronet.net                               
I-300108   Sarah McCammon                                                                3216 Dimond Lake Rd.                     86411      Kingman              AZ 520-438-7944 squirrel@zeronet.net                              

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300109   David Tietz                                                                   5235 E. 44th St.                         56265      Montevideo           MN 651-912-1583 tietz@free.com                                    
I-300110   Jim Manaugh                                                                   1011 W. Hillsborough Ave.                33605      Garyville            FL 919-747-5603 jmanaugh@eagle.com                                
I-300111   Richard Stetler                                                               7496 University Ave.                     36832      Auburn               AL 256-412-8112 screwball@free.com                                
I-300112   Jonathon Blanco                                                               8095 Mounty Rd.                          54904      Oshkosh              WI 902-226-1858 hammer@free.com                                   
I-300113   Randolph Darling                                                              8254 Coral Way                           06260      Putnam               CT 860-684-1620 randolph@fast.com                                 
I-300114   Melody Fazal                                                                  4603 Killian Rd.                         93311      Bakersfield          CA 760-877-4849 melfazal@zeronet.net                              
I-300115   Michael Tendam                                                                190 Dixie St.                            592331     Glasgow              MT 406-424-7496 flute@usol.com                                    
I-300116   Sean Akropolis                                                                6603 E. Little Yak Rd.                   99509      Anchorage            AK 907-262-4254 pickle@free.com                                   
I-300117   Anne Hatzell                                                                  5200 Belfat Blvd.                        19973      Seaford              DE 302-651-6440 hazel@zeronet.net                                 
I-300118   Meredith Rushing                                                              1856 Cullen Blvd.                        40516      Lexington            KY 606-608-2105 merry@free.com                                    
I-300119   John Skadberg                                                                 7577 Holmes Rd.                          45840      Findlay              OH 513-282-3919 skad@zeronet.net                                  

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300120   Zack Hill                                                                     2064 Preston Rd.                         97496      Winston              OR 503-794-2322 boogie@free.com                                   
I-300121   Dan Lageveen                                                                  3056 Southern Ave. N.                    82073      Laramie              WY 307-344-8928 veenie@zeronet.net                                
I-300122   Marla Reeder                                                                  1029 Moraga Ave. W.                      32425      Bonifay              FL 728-442-3031 reedmar@zeronet.net                               
I-300123   Linda Bowen                                                                   5541 Bell Rd.                            57350      Huron                SD 605-234-4114                                                   
I-300124   Michael Emore                                                                 7347 Peoria Ave.                         32810      Orlando              FL 352-472-1224 mikemore@usol.com                                 
I-300125   Mary Jo Wales                                                                 1416 Wynnewood Ave.                      97885      Wallowa              OR 852-441-4984 jomary@onlineservice.com                          
I-300126   Tom Moore                                                                     7742 Glendale Ave.                       04351      Morehead             KY 270-692-2845 seedle@fast.com                                   
I-300127   Susan Watson                                                                  6151 Indian School Rd.                   84414      Ogden                UT 801-746-7701 mswatson@fast.com                                 
I-300128   Tom Irelan                                                                    7833 McDowell Rd.                        21503      Cumberland           MD 240-634-5581 tucker@free.com                                   
I-300129   Rosemary Vanderhoff                                                           843 99th St.                             31206      Macon                GA 770-293-8783                                                   
I-300130   Mike Dunbar                                                                   1750 Broadway St.                        83531      Grangeville          ID 208-297-5374 duh@onlineservice.com                             

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300131   Ryan Stahley                                                                  9281 E. Bird St.                         33606      Grand                FL 919-774-5340 rstahley@eagle.com                                
I-300132   Patricia Leong                                                                6213 Baseline Rd.                        86313      Prescott             AZ 520-247-4141 patrice@usol.com                                  
I-300133   Roy McGrew                                                                    1968 Elliot Rd.                          83686      Nampa                ID 208-324-0783 grow@zeronet.net                                  
I-300134   Tom Baker                                                                     483 Greenway St.                         54656      Sparta               WI 414-778-5640 bologna@free.com                                  
I-300135   Bill Umbarger                                                                 1476 Eastern Pkwy.                       04915      Belfast              ME 207-155-1577 cheezy@onlineservice.com                          
I-300136   Bob Weldy                                                                     8227 Oak Ridge Rd.                       24506      Lynchburg            VA 571-490-6449 sucker42@usol.com                                 
I-300137   Kris Shinn                                                                    7451 Tiden St.                           79772      Pecos                TX 469-740-2748 shinnk@zeronet.net                                
I-300138   James King                                                                    2734 Mulga Loop Rd.                      04457      Lincoln              ME 207-708-3317 jamesk@usol.com                                   
I-300139   Frank Malady                                                                  7894 Geary Blvd.                         31533      Nahunta              GA 574-493-0510 frankmala@zeronet.net                             
I-300140   Jim Webb                                                                      3577 Hessian Ave.                        01853      Lowell               MA 978-204-3019                                                   
I-300141   Daniel Rodkey                                                                 4024 Mill Plain Blvd.                    81052      Lamar                CO 719-748-3205 dannie@free.com                                   

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300142   Marc Williams                                                                 8443 15th St.                            84721      Cedar City           VT 435-774-4595 peanut@fast.com                                   
I-300143   Kristy Moore                                                                  4410 W. Spruce St.                       33603      Fort Sutton          FL 919-486-6765 fluffy@onlineservice.com                          
I-300144   Russ Mann                                                                     6879 Island Ave.                         89199      Las Vegas            NV 775-549-1798 scooter@onlineservice.com                         
I-300145   Carrie Buchko                                                                 3793 Leheigh Ave.                        75951      Jasper               TX 817-739-1335 goobert@free.com                                  
I-300146   Michelle Oakley                                                               5348 Elmwood Ave.                        02303      Brockton             MA 978-514-5425 littleone@usol.com                                
I-300147   Steven Yaun                                                                   4711 Hook Rd.                            46208      Indianapolis         IN 317-780-9804 yawn@fast.com                                     
I-300148   Jack Illingworth                                                              2741 Ashland Ave.                        14206      Buffalo              NY 914-748-9829 illing@free.com                                   
I-300149   Thomas Wolfe                                                                  7347 Broad St.                           18510      Scranton             PA 610-365-9766 wolf@onlineservice.com                            
I-300150   Irene Poczekay                                                                7000 W. 7th St.                          02840      Newport              RI 401-461-9567                                                   
I-300151   Andy Huegel                                                                   7542 Haverford Blvd.                     19963      Milford              DE 302-620-1366                                                   
I-300152   Karen Marko                                                                   4954 Clifton Rd.                         73506      Lawton               OK 580-555-1871 marko@usol.com                                    

CUSTOMERID CUSTNAME                             COMPANYNAME                              ADDRESS                                  POSTALCODE CITY                 ST PHONE        EMAILADDR                                         
---------- ------------------------------------ ---------------------------------------- ---------------------------------------- ---------- -------------------- -- ------------ --------------------------------------------------
I-300153   Trevor Snuffer                                                                6550 Forbes Ave.                         27803      Rocky Mount          NC 336-185-0630 snuffer@zeronet.net                               
I-300154   Phil Reece                                                                    1204 N. Nebraska Ave.                    33603      Fort Sutton          FL 919-486-0649 sly@zeronet.net                                   
I-300155   Linda Hari                                                                    791 McKnight Rd.                         42134      Franklin             KY 270-411-2316                                                   
I-300156   Andrew Smith                                                                  1244 Fremont Ave.                        67879      Tribune              KS 709-307-2568 smokey@zeronet.net                                
I-300157   Linda Li                                                                      5920 Grove St.                           06790      Torrington           CT 203-744-4677 ll@free.com                                       
I-301      Shannon Jing                                                                  500 Oval Dr.                             47907      West Lafayette       IN 765-588-7610 tarokingu@gmail.com                               
I-302      Jackson Williams                                                              3400 Vine St.                            45220      Cincinnati           OH              jackwilliams@gmail.com                            
I-303      Zack Browns                                                                   1777 E. Broad St.                        43203      Columnbus            OH 614-715-0000 zbrowns@yahoo.com                                 
I-304      Kate Sun                                                                      405 Sagamore Pkwy S.                     47904      Lafayette            IN              katesun@gmail.com                                 
I-305      Helly Smith                                                                   953 Eden Park Dr.                        45202      Cincinnati           OH 513-639-2995 information@cincyart.org                          

241 rows selected. 

Since the table has a unique customerid, customers may not overlap. 

Question A5
Error starting at line : 34 in command -
INSERT INTO CUSTOMER_ALL(customerid, custname, address, city, state, postalcode)
VALUES('C-001', 'John Doe', '401 N. Grant St.', 'West Lafayette', 'IN', '47907')
Error at Command Line : 34 Column : 13
Error report -
SQL Error: ORA-01732: data manipulation operation not legal on this view
01732. 00000 -  "data manipulation operation not legal on this view"
*Cause:    
*Action:

I could not add the values because CUSTOMER_ALL was a multitable view


Question A6



Question A7
1 row inserted.
The customerID is unique in this table and other values were correctly matched.


Question A8

1 row deleted.


CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 


CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-305      Helly Smith                                                                  Mrs.  953 Eden Park Dr.                        Cincinnati           OH 45202                   513-639-2995 information@cincyart.org                          
C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
C-304      Jack Anderson                       University of Chicago                    Mr.   5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-4199 773-702-8650 infocenter@uchicago.edu                           
C-305      Kate Johnson                        Michigan University                      Ms.   500 S. State St.                         Ann Arbor            MI 48109                   734-764-1817 info@umich.edu                                    
I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
I-302      Jackson Williams                                                             Mr.   3400 Vine St.                            Cincinnati           OH 45220                                jackwilliams@gmail.com                            
I-303      Zack Browns                                                                  Mr.   1777 E. Broad St.                        Columnbus            OH 43203                   614-715-0000 zbrowns@yahoo.com                                 
I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 

10 rows selected. 

Commit complete.

The customer id C-001 was not seen in the table views.

Question A9

10 rows deleted.

no rows selected

Rollback complete.


CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
I-305      Helly Smith                                                                  Mrs.  953 Eden Park Dr.                        Cincinnati           OH 45202                   513-639-2995 information@cincyart.org                          
C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
C-304      Jack Anderson                       University of Chicago                    Mr.   5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-4199 773-702-8650 infocenter@uchicago.edu                           
C-305      Kate Johnson                        Michigan University                      Ms.   500 S. State St.                         Ann Arbor            MI 48109                   734-764-1817 info@umich.edu                                    
I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
I-302      Jackson Williams                                                             Mr.   3400 Vine St.                            Cincinnati           OH 45220                                jackwilliams@gmail.com                            
I-303      Zack Browns                                                                  Mr.   1777 E. Broad St.                        Columnbus            OH 43203                   614-715-0000 zbrowns@yahoo.com                                 
I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 

10 rows selected. 

The table had no rows before the rollback but was restored after the rollback. 


Question A10

Table CUSTOMER_NEW truncated.

no rows selected

Rollback complete.

no rows selected

Since a truncate is also deleting all data in the table, and even after the rollback there is no rows in the table, a rollback does not work for a truncate statement.

Question A11
Grant succeeded.

Question A12
Revoke succeeded.

Question A13
Grant succeeded.

Question A14
Revoke succeeded.

Question A15
Error starting at line : 99 in command -
REVOKE READ ON CUSTOMER_ALL FROM LEE3118
Error report -
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself
01749. 00000 -  "you may not GRANT/REVOKE privileges to/from yourself"
*Cause:    
*Action:

Question A16
Table CUSTOMER_NEW dropped.


View CUSTOMER_NEW_VIEW dropped.


View CUSTOMER_ALL dropped.


View INDIANA_CUSTOMER dropped.

Question A17
Source: https://docs.oracle.com/database/121/TTSQL/privileges.htm#TTSQL341
The priviliges that are nessecary are:
ALTER ANY PROCEDURE, CREATE ANY PROCEDURE, CREATE PROCEDURE, DROP ANY PROCEDURE, and EXECUTE ANY PROCEDURE in order to execute one of the hello world procedures.

Question A18


Question A19



Question A20
No, the CNIT372TA does not have privilieges to execute permissions on the function. 

Question A21


Question A22
GRANTEE                                                                                                                          OWNER                                                                                                                            TABLE_NAME                                                                                                                       GRANTOR                                                                                                                          PRIVILEGE                                GRA HIE COM TYPE                     INH
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------- --- --- --- ------------------------ ---
CNIT372TA                                                                                                                        LEE3118                                                                                                                          NUMBER_OF_EMPLOYEES                                                                                                              LEE3118                                                                                                                          EXECUTE                                  NO  NO  NO  FUNCTION                 NO 
PUBLIC                                                                                                                           SYS                                                                                                                              LEE3118                                                                                                                          LEE3118                                                                                                                          INHERIT PRIVILEGES                       NO  NO  NO  USER                     NO 

CNIT372TA still retains execution permissions on this function. 

Question A23
Recreating a procedure does not remove permissions on it. But dropping it does. 

*/