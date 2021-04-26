/* <Begin Comment>
Brandon Lee
CNIT 27200 Spring 2020
Lab Time: Monday 3:30PM-5:20PM
Duration: 1:50MIN
******************************************************
Question 1A
<End comment> */
Select Food.Supplier_ID, Supplier_Name, Description, Price
From Food
INNER JOIN Food_Supplier ON Food.Supplier_ID = Food_Supplier.Supplier_ID
Order by Supplier_Name;


/* Results:

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Ard Arnoldo Deli                   Sausage Pizza                 6
Blu Blue Sky Deli                  Turkey Club                 9.5
Blu Blue Sky Deli                  Chips                         3
Crm Corner Market                  Ham Melt                    8.2
Crm Corner Market                  Philly Melt                 9.6
Crm Corner Market                  Grilled Cheese              7.5
Crm Corner Market                  Bagel                         3
Dpz Downtowner Pizza               Cheese Sauce                 .5
Dpz Downtowner Pizza               Cheese Pizza                7.5
Dpz Downtowner Pizza               Dinner Roll                   1
Foi Fontinas Italian               Apple Pie                     4

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Foi Fontinas Italian               French Fries                2.5
Foi Fontinas Italian               Broccoli Salad                3
Foi Fontinas Italian               Barley Soup                 4.5
Gls Great Lakes Station            Sugar Cookie                  3
Gls Great Lakes Station            Mango Smoothie                6
Gls Great Lakes Station            Breadstick                 1.25
Hsd Halsted Street Deli            Chicken Soup                4.5
Hsd Halsted Street Deli            Velvet Cake                 3.5
Hsd Halsted Street Deli            Protein Plate                 8
Hsd Halsted Street Deli            Chef Salad                  5.5
Jmd Jebston Montrose Deli          Mushroom Pizza                9

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Jmd Jebston Montrose Deli          Potato Soup                 6.5
Jmd Jebston Montrose Deli          Iced Tea                   2.95
Jmd Jebston Montrose Deli          Cole Slaw                   2.5
Jd6 Justin's Deli at 601           Soda                       2.75
Jd6 Justin's Deli at 601           Coffee                     1.99
Jd6 Justin's Deli at 601           Brownie                    3.25
Lak Lakeshore Bakery               Caprese                       5
Lak Lakeshore Bakery               Spinach Salad               6.5
Lak Lakeshore Bakery               Cheese Stick                1.3
Lss Lucias Sub Shop                Grilled Cheese             7.95
Lss Lucias Sub Shop                Veggie Soup                4.95

33 rows selected. 


SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Ard Arnoldo Deli                   Sausage Pizza                 6
Blu Blue Sky Deli                  Turkey Club                 9.5
Blu Blue Sky Deli                  Chips                         3
Crm Corner Market                  Grilled Cheese              7.5
Crm Corner Market                  Philly Melt                 9.6
Crm Corner Market                  Ham Melt                    8.2
Crm Corner Market                  Bagel                         3
Dpz Downtowner Pizza               Cheese Sauce                 .5
Dpz Downtowner Pizza               Dinner Roll                   1
Dpz Downtowner Pizza               Cheese Pizza                7.5
Foi Fontinas Italian               Apple Pie                     4

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Foi Fontinas Italian               Barley Soup                 4.5
Foi Fontinas Italian               Broccoli Salad                3
Foi Fontinas Italian               French Fries                2.5
Gls Great Lakes Station            Breadstick                 1.25
Gls Great Lakes Station            Mango Smoothie                6
Gls Great Lakes Station            Sugar Cookie                  3
Hsd Halsted Street Deli            Protein Plate                 8
Hsd Halsted Street Deli            Velvet Cake                 3.5
Hsd Halsted Street Deli            Chef Salad                  5.5
Hsd Halsted Street Deli            Chicken Soup                4.5
Jmd Jebston Montrose Deli          Mushroom Pizza                9

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Jmd Jebston Montrose Deli          Cole Slaw                   2.5
Jmd Jebston Montrose Deli          Iced Tea                   2.95
Jmd Jebston Montrose Deli          Potato Soup                 6.5
Jd6 Justin's Deli at 601           Brownie                    3.25
Jd6 Justin's Deli at 601           Coffee                     1.99
Jd6 Justin's Deli at 601           Soda                       2.75
Lak Lakeshore Bakery               Cheese Stick                1.3
Lak Lakeshore Bakery               Caprese                       5
Lak Lakeshore Bakery               Spinach Salad               6.5
Lss Lucias Sub Shop                Grilled Cheese             7.95
Lss Lucias Sub Shop                Veggie Soup                4.95

33 rows selected. 
*/
/*
******************************************************
Question 1B 
<End comment> */
Select Food.Supplier_ID, Supplier_Name, Description, Price
From Food_Supplier
LEFT JOIN Food ON Food_SUPPLIER.Supplier_ID = Food.Supplier_ID;

/* Results:
SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Ard Arnoldo Deli                   Sausage Pizza                 6
Blu Blue Sky Deli                  Chips                         3
Blu Blue Sky Deli                  Turkey Club                 9.5
Crm Corner Market                  Grilled Cheese              7.5
Crm Corner Market                  Philly Melt                 9.6
Crm Corner Market                  Ham Melt                    8.2
Crm Corner Market                  Bagel                         3
Dpz Downtowner Pizza               Cheese Sauce                 .5
Dpz Downtowner Pizza               Dinner Roll                   1
Dpz Downtowner Pizza               Cheese Pizza                7.5
    Fiona and Samson                                              

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Foi Fontinas Italian               Apple Pie                     4
Foi Fontinas Italian               French Fries                2.5
Foi Fontinas Italian               Barley Soup                 4.5
Foi Fontinas Italian               Broccoli Salad                3
    Gio and Sons                                                  
Gls Great Lakes Station            Sugar Cookie                  3
Gls Great Lakes Station            Mango Smoothie                6
Gls Great Lakes Station            Breadstick                 1.25
Hsd Halsted Street Deli            Chicken Soup                4.5
Hsd Halsted Street Deli            Velvet Cake                 3.5
Hsd Halsted Street Deli            Protein Plate                 8

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Hsd Halsted Street Deli            Chef Salad                  5.5
    Harman Bakery                                                 
Jmd Jebston Montrose Deli          Mushroom Pizza                9
Jmd Jebston Montrose Deli          Potato Soup                 6.5
Jmd Jebston Montrose Deli          Iced Tea                   2.95
Jmd Jebston Montrose Deli          Cole Slaw                   2.5
Jd6 Justin's Deli at 601           Brownie                    3.25
Jd6 Justin's Deli at 601           Coffee                     1.99
Jd6 Justin's Deli at 601           Soda                       2.75
Lak Lakeshore Bakery               Cheese Stick                1.3
Lak Lakeshore Bakery               Spinach Salad               6.5

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Lak Lakeshore Bakery               Caprese                       5
Lss Lucias Sub Shop                Veggie Soup                4.95
Lss Lucias Sub Shop                Grilled Cheese             7.95
    Rosemont Bakery                                               

37 rows selected. 
*/
/*
******************************************************
Question 1C
<End comment> */
Select Food.Supplier_ID, Supplier_Name, Description, Price
From Food_Supplier
LEFT JOIN Food ON Food_SUPPLIER.Supplier_ID = Food.Supplier_ID
Where Food.Supplier_ID IS NULL;

/* Results:

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
    Fiona and Samson                                              
    Gio and Sons                                                  
    Harman Bakery                                                 
    Rosemont Bakery     
*/
/*
******************************************************
Question 2A
<End comment> */
Select Food.Product_Code, Description, SUM (PRICE * QUANTITY), COUNT (Lunch_ID)
From Food
LEFT JOIN Lunch_Item ON Food.Product_Code = Lunch_Item.Product_Code
Group by Food.Product_Code, Description;

/* Results:
PR DESCRIPTION          SUM(PRICE*QUANTITY) COUNT(LUNCH_ID)
-- -------------------- ------------------- ---------------
Sp Barley Soup                           90              16
Sp Veggie Soup                           99              16
Ff French Fries                        22.5               9
Ds Brownie                            74.75              19
Ps Philly Melt                           96              10
Vt Broccoli Salad                         3               1
Br Cheese Stick                        16.9               7
Vr Mango Smoothie                       198              25
Ds Velvet Cake                         80.5              19
Sw Grilled Cheese                    200.85              22
Br Bagel                                 39               7

PR DESCRIPTION          SUM(PRICE*QUANTITY) COUNT(LUNCH_ID)
-- -------------------- ------------------- ---------------
Br Breadstick                         16.25               7
Sc Cheese Sauce                          .5               1
Pz Cheese Pizza                        82.5               6
Cf Coffee                             11.94               4
Sw Caprese                               65              11
Br Dinner Roll                           13               7
Sp Potato Soup                          130              16
Pz Mushroom Pizza                        99               6
Cp Chips                                  6               1
Pp Protein Plate                          8               1
Sd Spinach Salad                        6.5               1

PR DESCRIPTION          SUM(PRICE*QUANTITY) COUNT(LUNCH_ID)
-- -------------------- ------------------- ---------------
Pz Sausage Pizza                         66               6
Ds Apple Pie                             92              19
Ds Sugar Cookie                          69              19
Vt Cole Slaw                            2.5               1
Cs Chef Salad                          71.5              12
Sp Chicken Soup                          90              16
Vr Soda                               90.75              25
Vr Iced Tea                           97.35              25
Hb Ham Melt                            73.8               6
Sw Turkey Club                        123.5              11

32 rows selected.
*/
/*
******************************************************
Question 2B
<End comment> */
Select Food.Product_Code, Description, SUM (PRICE * QUANTITY), COUNT (Lunch_ID)
From Food
INNER JOIN Lunch_Item ON Food.Product_Code = Lunch_Item.Product_Code 
AND Food.Supplier_ID = Lunch_Item.Supplier_ID
Group by Food.Product_Code, Description;

/* Results:
PR DESCRIPTION          SUM(PRICE*QUANTITY) COUNT(LUNCH_ID)
-- -------------------- ------------------- ---------------
Sp Barley Soup                           18               3
Sp Veggie Soup                          9.9               2
Ff French Fries                        22.5               9
Ps Philly Melt                           96              10
Vt Broccoli Salad                         3               1
Ds Brownie                               26               7
Br Cheese Stick                         3.9               1
Ds Velvet Cake                         17.5               5
Sw Grilled Cheese                     83.85               9
Br Breadstick                          1.25               1
Br Bagel                                  3               1

PR DESCRIPTION          SUM(PRICE*QUANTITY) COUNT(LUNCH_ID)
-- -------------------- ------------------- ---------------
Sc Cheese Sauce                          .5               1
Cf Coffee                             11.94               4
Pz Cheese Pizza                          30               2
Br Dinner Roll                            8               4
Sw Caprese                                5               1
Pz Mushroom Pizza                        27               2
Cp Chips                                  6               1
Sp Potato Soup                          6.5               1
Pp Protein Plate                          8               1
Sd Spinach Salad                        6.5               1
Ds Sugar Cookie                          21               4

PR DESCRIPTION          SUM(PRICE*QUANTITY) COUNT(LUNCH_ID)
-- -------------------- ------------------- ---------------
Ds Apple Pie                             12               3
Pz Sausage Pizza                         24               2
Cs Chef Salad                          71.5              12
Sp Chicken Soup                        58.5              10
Vr Soda                                  66              18
Vr Iced Tea                           26.55               7
Hb Ham Melt                            73.8               6
Sw Turkey Club                          9.5               1

30 rows selected. 

*/
/*
******************************************************
Question 3A
<End comment> */
Set Linesize 200;
Select Worker_ID, CITY, Department.Dept_Code, Department_Name
From Department
INNER JOIN Worker ON Department.Dept_Code = Worker.Dept_Code
Order by Department.Dept_Code;

/* Results:

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
228 Naperville                     Acc Accounting                    
226                                Acc Accounting                    
209 Oak Brook                      Acc Accounting                    
219                                Aud Auditing                      
216 Aurora                         Aud Auditing                      
207 Skokie                         Aud Auditing                      
201 Chicago                        Exe Executive                     
215 Evanston                       Fin Finance                       
221 Evanston                       Fin Finance                       
212 Oak Brook                      Hmn Human Resources               
204 Oak Brook                      Hmn Human Resources               

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
217 Chicago                        Hmn Human Resources               
203 Skokie                         Leg Legal                         
213 Oak Brook                      Leg Legal                         
231 Evanston                       Leg Legal                         
208 Aurora                         Pur Purchasing                    
210 Chicago                        Sal Sales                         
223 Skokie                         Sal Sales                         
205 Naperville                     Srv Service                       
227 Oak Brook                      Srv Service                       
230 Chicago                        Tch Technology                    
224 Evanston                       Tch Technology                    

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
222 Naperville                     Tch Technology                    
211                                Tch Technology                    
202 Naperville                     Tch Technology                    

25 rows selected. 
*/
/*
******************************************************
Question 3B
<End comment> */
Set Linesize 200;
Select Worker_ID, CITY, Department.Dept_Code, Department_Name
From Department
Right JOIN Worker ON Department.Dept_Code = Worker.Dept_Code
Order by Department.Dept_Code;

/* Results:
WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
226                                Acc Accounting                    
228 Naperville                     Acc Accounting                    
209 Oak Brook                      Acc Accounting                    
207 Skokie                         Aud Auditing                      
216 Aurora                         Aud Auditing                      
219                                Aud Auditing                      
201 Chicago                        Exe Executive                     
215 Evanston                       Fin Finance                       
221 Evanston                       Fin Finance                       
217 Chicago                        Hmn Human Resources               
204 Oak Brook                      Hmn Human Resources               

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
212 Oak Brook                      Hmn Human Resources               
203 Skokie                         Leg Legal                         
213 Oak Brook                      Leg Legal                         
231 Evanston                       Leg Legal                         
208 Aurora                         Pur Purchasing                    
210 Chicago                        Sal Sales                         
223 Skokie                         Sal Sales                         
205 Naperville                     Srv Service                       
227 Oak Brook                      Srv Service                       
202 Naperville                     Tch Technology                    
211                                Tch Technology                    

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
222 Naperville                     Tch Technology                    
224 Evanston                       Tch Technology                    
230 Chicago                        Tch Technology                    
225                                                                  
220                                                                  
218 Naperville                                                       
214 Skokie                                                           
229 Aurora                                                           
206 Aurora                                                           

31 rows selected. 
*/
/*
******************************************************
Question 3C
<End comment> */
Set Linesize 200;
Select Worker_ID, CITY, Department.Dept_Code, Department_Name
From Department
Left JOIN Worker ON Department.Dept_Code = Worker.Dept_Code
Order by Department.Dept_Code;

/* Results:

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
228 Naperville                     Acc Accounting                    
226                                Acc Accounting                    
209 Oak Brook                      Acc Accounting                    
219                                Aud Auditing                      
216 Aurora                         Aud Auditing                      
207 Skokie                         Aud Auditing                      
                                   Com Compliance                    
201 Chicago                        Exe Executive                     
                                   Fac Facilities                    
215 Evanston                       Fin Finance                       
221 Evanston                       Fin Finance                       

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
212 Oak Brook                      Hmn Human Resources               
204 Oak Brook                      Hmn Human Resources               
217 Chicago                        Hmn Human Resources               
203 Skokie                         Leg Legal                         
213 Oak Brook                      Leg Legal                         
231 Evanston                       Leg Legal                         
                                   Mkt Marketing                     
208 Aurora                         Pur Purchasing                    
210 Chicago                        Sal Sales                         
223 Skokie                         Sal Sales                         
                                   Shp Shipping                      

WOR CITY                           DEP DEPARTMENT_NAME               
--- ------------------------------ --- ------------------------------
205 Naperville                     Srv Service                       
227 Oak Brook                      Srv Service                       
230 Chicago                        Tch Technology                    
224 Evanston                       Tch Technology                    
222 Naperville                     Tch Technology                    
211                                Tch Technology                    
202 Naperville                     Tch Technology                    

29 rows selected. 
*/
/*
******************************************************
Question 4
<End comment> */
Select first_name||' '||last_name AS NAME, CITY
FROM Worker 
Where City NOT IN ('Skokie' , 'Oak Brook' , 'Chicago')
UNION
Select Supplier_Name, Supplier_City
From Food_Supplier
Where Supplier_City NOT IN ('Skokie' , 'Oak Brook' , 'Chicago');
/* Results:

NAME                            CITY                          
------------------------------- ------------------------------
Amy Trance                      Aurora                        
Angie Cross                     Naperville                    
Carole Shreve                   Naperville                    
Corner Market                   Naperville                    
Dana Sumner                     Evanston                      
Fiona and Samson                Orland Park                   
Halsted Street Deli             Naperville                    
Harman Bakery                   Naperville                    
Katelynn Rayner                 Evanston                      
Kevin Johnson                   Naperville                    
Kevin Ridgeman                  Aurora                        

NAME                            CITY                          
------------------------------- ------------------------------
Keyanna Jones                   Naperville                    
Lucias Sub Shop                 Aurora                        
Maia Neal                       Naperville                    
Rosemont Bakery                 Schaumburg                    
Sam Frank                       Evanston                      
Sean Smith                      Evanston                      
Tom Armstrong                   Aurora                        
Tonya Montre                    Aurora                        

19 rows selected. 
*/
/*
******************************************************
Question 5
<End comment> */
Select CITY
From WOrker
INTERSECT
Select Supplier_City
From Food_Supplier;

/* Results:

CITY                          
------------------------------
Aurora
Chicago
Naperville
Oak Brook
Skokie


*/
/*
******************************************************
Question 6
<End comment> */
Select Supplier_City
From Food_Supplier
MINUS
Select City
From Worker;

/* Results:

SUPPLIER_CITY                 
------------------------------
Orland Park
Schaumburg

*/
/*
******************************************************


