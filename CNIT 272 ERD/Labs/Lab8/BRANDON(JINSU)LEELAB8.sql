/*
Brandon (Jin Su) Lee
CNIT 27200 Spring 2020
Lab Time: Online
Duration: 1:50 MIN
******************************************************
Question 1A
*/
Select supplier_id
from food
where supplier_id ='Sky';

Insert into food_supplier (supplier_id, supplier_name, supplier_city)
values ('Sky', 'Sky Rise Market', 'Chicago');

Insert into food (Supplier_ID, product_code, menu_item, description, price, price_upcharge)
values ('Sky', 'Sp', 2, 'Broccoli Soup', 4.75, .6);

select food_supplier.supplier_id, food_supplier.supplier_name, food.product_code, food.price
from food, food_supplier
where food_supplier.supplier_id = 'Sky';

/* Results:
no rows selected

1 row inserted.

1 row inserted.
*/
/*
******************************************************
Question 2
*/
select supplier_id, supplier_name, supplier_city
from food_supplier
where supplier_id = 'Hsd';

update food_supplier
set supplier_name = 'Hanover Market',
    supplier_city = 'Skokie'
where supplier_id= 'Hsd';

COMMIT;

select supplier_id, supplier_name, supplier_city
from food_supplier
where supplier_id = 'Hsd';

/* Results:

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Hsd Halsted Street Deli            Naperville                    

1 row updated.

Commit complete.

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Hsd Hanover Market                 Skokie                        

*/
/*
******************************************************
Question 3
*/
select supplier_id, description, price
from food
where product_code = 'Sp';

update food
set price = price + 2
where product_code = 'Sp';

select supplier_id, description, price
from food
where product_code = 'Sp';
/* Results:

SUP DESCRIPTION               PRICE
--- -------------------- ----------
Foi Barley Soup                 4.5
Hsd Chicken Soup                4.5
Jmd Potato Soup                 6.5
Lss Veggie Soup                4.95
Sky Broccoli Soup              4.75

5 rows updated.

SUP DESCRIPTION               PRICE
--- -------------------- ----------
Foi Barley Soup                 6.5
Hsd Chicken Soup                6.5
Jmd Potato Soup                 8.5
Lss Veggie Soup                6.95
Sky Broccoli Soup              6.75
*/
/*
******************************************************
Question 4
*/
select lunch_id, lunch_date, worker_id
from lunch
where worker_id = 231;

insert into lunch (lunch_id, lunch_date, worker_id)
values (48, '12-JAN-2020', 231);

select lunch_id, lunch_date, worker_id
from lunch
where worker_id = 231;

/* Results:

  LUNCH_ID LUNCH_DAT WOR
---------- --------- ---
        18 01-AUG-19 231
        42 20-AUG-19 231

1 row inserted.

  LUNCH_ID LUNCH_DAT WOR
---------- --------- ---
        48 12-JAN-20 231
        18 01-AUG-19 231
        42 20-AUG-19 231
*/
/*
******************************************************
Question 4B
*/
insert into lunch_item (lunch_id, item_number, supplier_id, product_code, quantity)
    values ('18', '8', 'Crm', 'Ps', '3');
    
insert into lunch_item (lunch_id, item_number, supplier_id, product_code, quantity)
    values ('18', '9', 'Hsd', 'Cs', '2');
    
insert into lunch_item (lunch_id, item_number, supplier_id, product_code, quantity)
    values ('18', '10', 'Jmd', 'Vr', '3');



insert into lunch_item (lunch_id, item_number, supplier_id, product_code, quantity)
    values ('48', '10', 'Jmd', 'Vr', '3');

insert into lunch_item (lunch_id, item_number, supplier_id, product_code, quantity)
    values ('48', '9', 'Hsd', 'Cs', '2');

insert into lunch_item (lunch_id, item_number, supplier_id, product_code, quantity)
    values ('48', '8', 'Crm', 'Ps', '3');

select worker_id, lunch.lunch_id, lunch_date, item_number, supplier_id, product_code, quantity
from lunch_item
inner join lunch 
on lunch_item.lunch_id = lunch.lunch_id
where worker_id = 231;

Rollback;

/* Results:
1 row inserted.


1 row inserted.


1 row inserted.

1 row inserted.


1 row inserted.


1 row inserted.

WOR   LUNCH_ID LUNCH_DAT ITEM_NUMBER SUP PR   QUANTITY
--- ---------- --------- ----------- --- -- ----------
231         18 01-AUG-19           1 Hsd Cs          1
231         18 01-AUG-19           2 Jmd Vr          1
231         42 20-AUG-19           1 Hsd Cs          2
231         42 20-AUG-19           2 Crm Ps          1
231         42 20-AUG-19           3 Jd6 Vr          1
231         48 12-JAN-20          10 Jmd Vr          3
231         48 12-JAN-20           9 Hsd Cs          2
231         48 12-JAN-20           8 Crm Ps          3

8 rows selected. 


*/
/*
******************************************************
Question 4C
*/


/* Results:

*/
/*
******************************************************
Question 5
*/
Select supplier_id, supplier_name
from food_supplier
where supplier_id NOT IN (select supplier_id from food);

delete from food_supplier
    where supplier_id = 'Fas';

delete from food_supplier
    where supplier_id = 'Rby';
    
delete from food_supplier
    where supplier_id = 'Har';

delete from food_supplier
    where supplier_id = 'Gio';

COMMIT;

select supplier_id, supplier_name, supplier_city
from food_supplier;

/* Results:

SUP SUPPLIER_NAME                 
--- ------------------------------
Fas Fiona and Samson              
Rby Rosemont Bakery               
Har Harman Bakery                 
Gio Gio and Sons                  

1 row deleted.

1 row deleted.

1 row deleted.

1 row deleted.

no rows selected

Commit complete.

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Sky Sky Rise Market                Chicago                       
Ard Arnoldo Deli                   Oak Brook                     
Hsd Hanover Market                 Skokie                        
Crm Corner Market                  Naperville                    
Foi Fontinas Italian               Chicago                       
Jd6 Justin's Deli at 601           Oak Brook                     
Jmd Jebston Montrose Deli          Chicago                       
Lss Lucias Sub Shop                Aurora                        
Dpz Downtowner Pizza               Chicago                       
Gls Great Lakes Station            Skokie                        
Blu Blue Sky Deli                  Skokie                                         

11 rows selected. 
*/
/*
******************************************************
Question 6
*/
create table EmpComp
(   Worker_ID char(3),
    Comp_Date date,
    Comp_Limit number(5,2),
    Participants varchar2(100),
    constraint EmpComp_PK primary key (Worker_ID, Comp_Date)
    );

alter table EmpComp
    add constraint EmpComp_FK
    Foreign key (Worker_ID)
    references Worker;

update empcomp
set Comp_Limit = (select worker.credit_limit * 1.4 AS Comp_Limit
                    from worker);

insert into EmpComp (worker_id, comp_date, Comp_Limit)
    select worker_id, hire_date
    from worker
    where dept_code = 'Sal';

COMMIT;

select worker.worker_id, worker.dept_code, worker.credit_limit, empcomp.Comp_Limit
from worker
inner join empcomp
on worker.worker_id = empcomp.worker_id;

/* Results:

Table EMPCOMP created.


Table EMPCOMP altered.

Commit complete.

WOR DEP CREDIT_LIMIT COMP_LIMIT
--- --- ------------ ----------
210 Sal           33       46.2
223 Sal           20         28
*/
/*
******************************************************

