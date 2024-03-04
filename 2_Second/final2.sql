USE SportsStore
GO
-- ADDING DATA
INSERT INTO Category
VALUES ('Men');
INSERT INTO Category
VALUES ('Women');
INSERT INTO Category
VALUES ('Ski');
INSERT INTO Category
VALUES ('Summer');
INSERT INTO Category
VALUES ('Camping');
INSERT INTO Category
VALUES ('Winter');

INSERT INTO Customer
VALUES (36, 'Cecil Palmer', '0123456789', 1234567890);
INSERT INTO Customer
VALUES (56, 'Carlos the Scientist', 0123456798, 1234567980);
INSERT INTO Customer
VALUES (234, 'Faceless Old Woman', 0123456897, 1234567089);
INSERT INTO Customer
VALUES (156, 'Glow Cloud', 0123457896, 1234560987);
INSERT INTO Customer
VALUES (60, 'Hiram McDaniels', 0123456798, 1234567980);
INSERT INTO Customer
VALUES (56, 'Koshek', 0145456798, 1248256860);
INSERT INTO Customer
VALUES (56, 'Steve Carlsberg', 1023456798, 1243567980);

INSERT INTO Role
VALUES ('Cashier');
INSERT INTO Role
VALUES ('Sales associates');
INSERT INTO Role
VALUES ('Customer Service');
INSERT INTO Role
VALUES ('Store manager');
INSERT INTO Role
VALUES ('Assistant store manager');
INSERT INTO Role
VALUES ('Inventory control specialist');
INSERT INTO Role
VALUES ('CEO');

insert into Store (store_address, tel_number)
values ('939 Larry Parkway', '5786670351');
insert into Store (store_address, tel_number)
values ('3113 Macpherson Drive', '6857903193');
insert into Store (store_address, tel_number)
values ('6920 Utah Park', '3622519425');
insert into Store (store_address, tel_number)
values ('66966 Westridge Alley', '5226107267');
insert into Store (store_address, tel_number)
values ('636 Hoard Street', '1704693512');
insert into Store (store_address, tel_number)
values ('5 Summit Street', '9717539062');
insert into Store (store_address, tel_number)
values ('304 Chinook Junction', '1747673219');
insert into Store (store_address, tel_number)
values ('04 Pankratz Court', '5137654717');
insert into Store (store_address, tel_number)
values ('49 Fremont Park', '7603735457');
insert into Store (store_address, tel_number)
values ('866 Derek Park', '9307491169');

insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('1701082391', 1, 1, '7/18/2022', N'€1801,08');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('1118074705', 2, 2, '8/5/2022', N'€1270,62');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('6303476006', 3, 3, '11/17/2022', N'€919,41');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('3564356409', 4, 4, '5/3/2022', N'€1897,89');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('9728811297', 5, 5, '4/3/2021', N'€505,55');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('7769172762', 1, 6, '3/15/2023', N'€1141,03');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('4466482153', 2, 7, '11/7/2020', N'€1059,50');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('9963205740', 3, 8, '11/19/2021', N'€1881,92');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('2147159177', 4, 9, '12/4/2022', N'€711,40');
insert into Employee (cnp, id_role, id_store, hiring_date, salary)
values ('3301894028', 5, 10, '3/25/2022', N'€894,02');


insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€662,21', 'Toughjoyfax shirt', 'Mens sportswear - comfy and sweatproof', 'blue', 1, 1133);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€836,43', 'Y-Solowarm jacket', 'Feel warm always!', 'white', 2, 232);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€261,63', 'Lotstring shoes', 'Womens shoes designed for you!', 'green', 2, 3434);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€751,62', 'Frisbee', 'Fot a great summer game experience', 'multicolor', 4, 344);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€642,67', 'Andje pool', 'Put up the pool anywhere and have fun!', 'yellow', 4, 5435);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€1000,05', 'Duobam', 'Durable ski for podwer snow', 'purple', 3, 4356);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€817,93', 'Ski boots', 'Antislip winter shoes', 'purple', 3, 577);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€476,62', 'Stim boots', 'Winter boots - warm and comfy', 'blue', 6, 843);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€905,43', 'Vagram jacket', 'Owarm jacket just for you!', 'red', 6, 9);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€411,20', 'Fix San cort', 'Te protejeaza de elemente!', 'red', 5, 10324);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€60.35', 'Ski pants VGr', 'Vesitile and good quality!', 'black', 6, 1024);
insert into Product (price, product_name, product_description, product_color, id_category, number_on_stock)
values (N'€60.35', 'Ski jacket VGr', 'Vesitile and good quality!', 'black', 6, 1032);

insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('jcb', N'€9464.40', '2021-01-31 00:00:40', 'true', 1, 1);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('cash', N'€1000,05', '2021-02-09 01:48:25', 'true', 2, 2);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('maestro', N'€4993.65', '2022-12-26 12:31:00', 'false', 3, 3);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('diners-club-enroute', N'€9816.78', '2023-02-25 15:31:23', 'true', 4, 4);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('jcb', N'€57.39', '2021-06-16 06:54:23', 'true', 5, 5);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('visa-electron', N'€7903.16', '2022-03-02 20:31:30', 'true', 6, 6);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('switch', N'€3357.17', '2021-08-26 16:42:03', 'true', 7, 7);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('maestro', N'€2963.71', '2021-03-12 16:25:33', 'true', 8, 8);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('cash', N'€100,05', '2021-07-30 15:13:14', 'true', 9, 9);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('cash', N'€1000,05', '2021-01-19 10:50:08', 'false', 10, 10);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('cash', N'€1542,05', '2021-01-30 10:50:08', 'false', 10, 10);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('cash', N'€1543,05', '2021-05-30 10:50:08', 'false', 10, 10);
insert into Transact (payment_type, amount, date_time, status, id_customer, id_store)
values ('maestro', N'€1543.05', '2021-05-30 10:50:08', 'false', 10, 10);

insert into Shopping_List (id_transaction, id_product, quantity, price)
values (1, 21, 14, N'€1716,24');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (2, 22, 4, N'€4289,84');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (3, 23, 43, N'€6972,07');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (4, 24, 43, N'€1326,65');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (5, 25, 13, N'€628,71');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (6, 26, 41, N'€1305,05');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (7, 27, 21, N'€4385,52');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (8, 28, 12, N'€4434,33');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (9, 29, 12, N'€29,31');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (10, 30, 10, N'€1954.10');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (11, 32, 1, N'€5878.10');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (12, 33, 4, N'€1345.10');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (13, 27, 2, N'€1345.10');
insert into Shopping_List (id_transaction, id_product, quantity, price)
values (18, 27, 1, N'€1345.10');


SELECT *
FROM Role
SELECT *
FROM Customer
SELECT *
FROM Category
SELECT *
FROM Store


SELECT *
FROM Employee
SELECT *
FROM Product
SELECT *
FROM Transact
SELECT *
FROM Shopping_List

-- MODIFYING DATA
UPDATE Customer
SET customer_name='Name1'
WHERE id_customer = 8;
UPDATE Customer
SET customer_name='Name2'
WHERE id_customer = 9;
UPDATE Customer
SET customer_name='Name3'
WHERE id_customer = 10;
UPDATE Customer
SET customer_name='Name4'
WHERE id_customer = 11;
UPDATE Customer
SET customer_name='Name5'
WHERE id_customer = 12;
UPDATE Customer
SET customer_name='Name6'
WHERE id_customer = 13;
UPDATE Customer
SET customer_name='Name7'
WHERE id_customer = 14;

UPDATE Product
SET product_name='Asfi Ski Boots',
    price=N'€894.02'
WHERE id_product = 27;
UPDATE Product
SET price=N'€608.05'
WHERE id_product = 21;
UPDATE Product
SET price=N'€470.99'
WHERE id_product = 22;
UPDATE Product
SET price=N'€1000.05'
WHERE id_product = 23;
UPDATE Product
SET price=N'€154.65'
WHERE id_product = 24;
UPDATE Product
SET price=N'€1368'
WHERE id_product = 25;
UPDATE Product
SET price=N'€2368'
WHERE id_product = 26;
UPDATE Product
SET price=N'€34.98'
WHERE id_product = 28;
UPDATE Product
SET price=N'€367.89'
WHERE id_product = 29;
UPDATE Product
SET price=N'€3435.47'
WHERE id_product = 30;

UPDATE Shopping_List
SET price=N'€6080.05'
WHERE id_product = 21
  AND id_transaction = 1;
UPDATE Shopping_List
SET price=N'€4700.99'
WHERE id_product = 22
  AND id_transaction = 2;
UPDATE Shopping_List
SET price=N'€10000.05'
WHERE id_product = 23
  AND id_transaction = 3;
UPDATE Shopping_List
SET price=N'€1540.65'
WHERE id_product = 24
  AND id_transaction = 4;
UPDATE Shopping_List
SET price=N'€13680'
WHERE id_product = 25
  AND id_transaction = 5;
UPDATE Shopping_List
SET price=N'€23680'
WHERE id_product = 26
  AND id_transaction = 6;
UPDATE Shopping_List
SET price=N'€1680'
WHERE id_product = 27
  AND id_transaction = 7;
UPDATE Shopping_List
SET price=N'€340.98'
WHERE id_product = 28
  AND id_transaction = 8;
UPDATE Shopping_List
SET price=N'€3670.89'
WHERE id_product = 29
  AND id_transaction = 9;
UPDATE Shopping_List
SET price=N'€34350.47'
WHERE id_product = 30
  AND id_transaction = 10;

-- DELETING DATA
DELETE
FROM Category
WHERE id_category = 7;
DELETE
FROM Category
WHERE id_category = 8;
DELETE
FROM Category
WHERE id_category = 9;
DELETE
FROM Category
WHERE id_category = 10;
DELETE
FROM Category
WHERE id_category = 11;
DELETE
FROM Category
WHERE id_category = 12;

DELETE
FROM Category
where category_name IS NULL;
DELETE
FROM Role
where role IS NULL;

DELETE
FROM Shopping_List
WHERE id_transaction = 1;

--a. produsele care fac parte din categoria Winter si Woman
SELECT *
FROM Product P
         INNER JOIN Category C on C.id_category = P.id_category
WHERE category_name = 'Winter'
UNION
SELECT *
FROM Product P
         INNER JOIN Category C on C.id_category = P.id_category
WHERE category_name = 'Women';

--b. customers care au platit deja si cu cash si cu maestro card
SELECT C.customer_name
FROM Transact T
         INNER JOIN Customer C on C.id_customer = T.id_customer
WHERE payment_type = 'cash'
INTERSECT
SELECT C.customer_name
FROM Transact T
         INNER JOIN Customer C on C.id_customer = T.id_customer
WHERE payment_type = 'maestro';

--c. produse care nu au culoare ...
SELECT P.product_name, P.product_color
FROM Product P
WHERE P.product_color NOT IN ('yellow', 'green', 'white');

--d1. num?rul de produse din fiecare categorie
SELECT C.category_name, COUNT(*) AS nr_products
FROM Category C
         INNER JOIN Product P on C.id_category = P.id_category
GROUP BY P.id_category, C.category_name
ORDER BY COUNT(*) DESC, C.category_name DESC;

--d2. Rol pe care nici un employee nu-l are
SELECT R.role
FROM Role R
         LEFT JOIN Employee E on R.id_role = E.id_role
WHERE R.id_role NOT IN (SELECT E2.id_role FROM Employee E2);

-- Azon termékek neve amelyeket a legtöbbet vásároló (TRANZAKCIÓ) customer vett
--d2. numele produselor pe care le-a cumparat customer care a facut cele mai multe tranzactii NOPE
SELECT P.product_name, T.id_customer, COUNT(S.id_product) AS nr_transactions
FROM Transact T
         INNER JOIN Shopping_List S on T.id_transaction = S.id_transaction
         INNER JOIN Product P on P.id_product = S.id_product
GROUP BY T.id_customer, P.product_name
HAVING COUNT(*) >= (SELECT MAX(transaction_count)
                    FROM (SELECT COUNT(*) AS transaction_count FROM Transact T2 GROUP BY T2.id_customer) AS subquerry)

SELECT T.id_customer, COUNT(P.id_product) AS nr_transactions
FROM Transact T
         INNER JOIN Shopping_List S on T.id_transaction = S.id_transaction
         INNER JOIN Product P on P.id_product = S.id_product
GROUP BY T.id_customer
HAVING COUNT(*) >= (SELECT MAX(transaction_count)
                    FROM (SELECT COUNT(*) AS transaction_count FROM Transact T2 GROUP BY T2.id_customer) AS subquerry)


--e. winter product with specific colour
SELECT P.product_name, P.product_color, C.category_name
FROM Product P
         INNER JOIN Category C on C.id_category = P.id_category
WHERE P.product_color IN ('red', 'blue', 'purple')
  AND C.category_name = 'Winter';
--e2.
SELECT *
FROM Product P
WHERE   P.id_product IN (SELECT S.id_product FROM Shopping_List S) ;

--e3. pretul produselor increased
SELECT P.price AS original_price, P.price * 1.5 AS increades_price
FROM Product P;


--f. employed_2022
SELECT hiring_date
FROM (SELECT E.hiring_date FROM Employee E WHERE E.hiring_date LIKE '2022%') AS employed_2022;

--g1. SUM salarii pe roluri ordered DESC
SELECT R.role, SUM(E.salary) AS salary_sum_per_role
from Employee E
         INNER JOIN Role R on R.id_role = E.id_role
GROUP BY E.id_role, R.role
ORDER BY SUM(E.salary) DESC;

--g2. for every product sold more than once see how many times it was bought
SELECT P.product_name, COUNT(S.id_product)
FROM Product P
         INNER JOIN Shopping_List S on P.id_product = S.id_product
GROUP BY P.product_name
HAVING COUNT(*) > 1;

--h1. customer cu cele mai multe tranzactii + nr tranz
SELECT DISTINCT TOP 1 C.customer_name, COUNT(P.id_product) AS nr_transactions
FROM Customer C
         INNER JOIN Transact T on C.id_customer = T.id_customer
         INNER JOIN Shopping_List S on T.id_transaction = S.id_transaction
         INNER JOIN Product P on P.id_product = S.id_product
GROUP BY C.customer_name
HAVING COUNT(*) >= ALL (SELECT COUNT(*)  FROM Transact T2 GROUP BY T2.id_customer)
ORDER BY COUNT(P.id_product) DESC;

--h2. product name ordered
SELECT P.product_name
FROM Product P
ORDER BY P.product_name;