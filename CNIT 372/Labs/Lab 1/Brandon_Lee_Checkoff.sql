-- Question 2
select distinct substr(Phone,1,3) 
from customer
where state= 'CO';
/

-- Question 3
select substr(Phone,1,3), count(customerid)
from customer
where state = 'CO'
group by substr(Phone,1,3)
order by count(customerid) desc;
/

-- Question 4
select substr(phone,1,3)
from customer
where state = 'CO'
group by substr(phone,1,3)
having count(customerid) =
(
select max(count(customerid))
from customer
where state = 'CO'
group by substr(phone,1,3));
/

-- Question 5
select custlastname || ', ' || custfirstname, city, state, phone
from customer
where substr(phone,1,3) = 
(
select substr(phone,1,3)
from customer
where state = 'CO'
group by substr(phone,1,3)
having count(customerid) =
(
select max(count(customerid))
from customer
where state = 'CO'
group by substr(phone,1,3)));
/

-- Question 13
select customer.customerid, companyname, custlastname || ', ' || custfirstname, to_char(orderdate, 'MM.DD.YYYY')
from customer 
inner join custorder
on customer.customerid = custorder.customerid
where state = 'IN' and orderdate between '01-JAN-2010' and '31-DEC-2010'
order by orderdate asc;
/

-- Question 15
select orderid, inventorypart.partnumber, partdescription, unitprice, 
orderquantity, categoryname
from inventorypart
inner join custorderline
on inventorypart.partnumber = custorderline.partnumber
inner join category
on inventorypart.categoryid = category.categoryid
where partdescription = 'BOARD GAMES'
order by orderquantity desc;
/

-- Question 19
select customer.customerid, companyname, 
custlastname || ', ' || custfirstname, count(orderid)
from customer
inner join custorder 
on customer.customerid = custorder.customerid
where orderdate between '01-JAN-2011' and '31-JAN-2011' and state = 'IN'
group by customer.customerid, companyname, custlastname || ', ' || custfirstname
order by count(orderid) asc;

/* Results
Question 2
SUB
---
719
970
728
644
720

Question 3
SUB COUNT(CUSTOMERID)
--- -----------------
719                 4
970                 2
644                 1
720                 1
728                 1

Question 4
SUB
---
719

Question 5
CUSTLASTNAME||','||CUSTFIRSTNAME      CITY                 ST PHONE       
------------------------------------- -------------------- -- ------------
Kaakeh, Paul                          Gunnison             CO 719-750-4539
Smith, Matt                           Montrose             CO 719-822-8828
Rice, Paul                            Craig                CO 719-541-1837
Rodkey, Daniel                        Lamar                CO 719-748-3205

Question 13
CUSTOMERID COMPANYNAME                              CUSTLASTNAME||','||CUSTFIRSTNAME      TO_CHAR(OR
---------- ---------------------------------------- ------------------------------------- ----------
C-300001   Baker and Company                        Abbott, Gregory                       07.08.2010
C-300001   Baker and Company                        Abbott, Gregory                       07.14.2010
C-300001   Baker and Company                        Abbott, Gregory                       08.13.2010
I-300030                                            Quintero, Eric                        09.15.2010
C-300014   R and R Air                              Bending, Cathy                        10.04.2010
C-300001   Baker and Company                        Abbott, Gregory                       12.02.2010
I-300147                                            Yaun, Steven                          12.07.2010

7 rows selected. 

Question 15
ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY CATEGORYNAME                  
---------- ---------- -------------------------------------------------- ---------- ------------- ------------------------------
2001000536 SFT-005    BOARD GAMES                                              9.99            15 Software                      
2000000050 SFT-005    BOARD GAMES                                              9.99            14 Software                      
2000000279 SFT-005    BOARD GAMES                                              9.99            10 Software                      
2000000426 SFT-005    BOARD GAMES                                              9.99            10 Software                      
2000000348 SFT-005    BOARD GAMES                                              9.99             2 Software                      
2000000139 SFT-005    BOARD GAMES                                              9.99             2 Software                      
2000000005 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000040 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2001000722 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000362 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000011 SFT-005    BOARD GAMES                                              9.99             1 Software                      

ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY CATEGORYNAME                  
---------- ---------- -------------------------------------------------- ---------- ------------- ------------------------------
2000000436 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2000000206 SFT-005    BOARD GAMES                                              9.99             1 Software                      
2001000600 SFT-005    BOARD GAMES                                              9.99             1 Software                      

14 rows selected. 

Question 19
CUSTOMERID COMPANYNAME                              CUSTLASTNAME||','||CUSTFIRSTNAME      COUNT(ORDERID)
---------- ---------------------------------------- ------------------------------------- --------------
C-300014   R and R Air                              Bending, Cathy                                     1
C-300001   Baker and Company                        Abbott, Gregory                                    1
I-300030                                            Quintero, Eric                                     2

*/