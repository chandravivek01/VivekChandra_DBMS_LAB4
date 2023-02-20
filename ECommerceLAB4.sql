Create Database if not exists `order-directory` ;
use `order-directory`;

CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));

CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);

/* Data Insertion to SUPPLIER TABLE */
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

/* Data Insertion to CUSTOMER TABLE */
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

/* Data Insertion to CATEGORY TABLE */
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

/* Data Insertion to PRODUCT TABLE */
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

/* Data Insertion to SUPPLIER_PRICING TABLE */
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

/* Data Insertion to ORDER TABLE */
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

/* Data Insertion to RATING TABLE */
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);



/* 1. Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. */

select Q.CUS_GENDER, count(Q.CUS_ID) as total_no_of_customer from
(select P.CUS_ID, P.CUS_GENDER, count(P.CUS_ID) as no_of_customers from
(select ORD_ID, ORD_AMOUNT, `order`.CUS_ID, CUS_GENDER from `order` 
inner join customer
on customer.CUS_ID=`order`.CUS_ID where `order`.ORD_AMOUNT>=3000) as P group by P.CUS_ID) as Q group by CUS_GENDER;



/* 2. Display all the orders along with product name ordered by a customer having Customer_Id=2. */

select R.ORD_ID, R.ORD_AMOUNT, R.ORD_DATE, product.PRO_NAME from product
inner join (select Q.ORD_ID, Q.ORD_AMOUNT, Q.ORD_DATE, S.PRICING_ID, S.PRO_ID  from supplier_pricing as S 
inner join (select P.ORD_ID, P.ORD_AMOUNT, P.ORD_DATE, supplier_pricing.PRICING_ID from supplier_pricing 
inner join (select * from `ORDER` where CUS_ID=2) as P
on P.PRICING_ID=supplier_pricing.PRICING_ID) as Q
on Q.PRICING_ID=S.PRICING_ID) as R 
on R.PRO_ID=product.PRO_ID;



/* 3. Display the Supplier details who can supply more than one product. */
select Q.SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE from supplier
inner join (select SUPP_ID from (select SUPP_ID, count(PRO_ID) as no_of_products from supplier_pricing group by SUPP_ID) as P 
	where P.no_of_products >1) as Q
on Q.SUPP_ID=supplier.SUPP_ID;


/* 4. Find the least expensive product from each category and print the table with category id, name and price of the product. */

/* SELECT list is not in GROUP BY clause and contains nonaggregated column .... incompatible with sql_mode=only_full_group_by */
/* To counter the above error, follow the below instruction - specifically for 'R.PRO_NAME' column */

/* SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); */

select R.CAT_ID, R.CAT_NAME, R.PRO_NAME, min(R.least) as least_price from
(select Q.CAT_ID, C.CAT_NAME, Q.PRO_NAME, Q.least from category as C
inner join (select CAT_ID,PRO_NAME, P.* from product 
inner join (select PRO_ID,min(SUPP_PRICE) as least from supplier_pricing group by PRO_ID) as P
on P.PRO_ID=product.PRO_ID) as Q
on Q.CAT_ID=C.CAT_ID) as R group by R.CAT_ID order by R.CAT_ID;

/* OR */

select R.CAT_ID, R.CAT_NAME, R.PRO_NAME, min(R.SUPP_PRICE) as least_price from
(select P.CAT_ID, CAT_NAME, P.PRO_NAME, P.SUPP_PRICE from category
inner join (select PRO_NAME, S.SUPP_PRICE,CAT_ID from product 
inner join supplier_pricing as S
on S.PRO_ID= product.PRO_ID) as P
on P.CAT_ID=category.CAT_ID) as R group by R.CAT_ID order by R.CAT_ID;


/* 5. Display the Id and Name of the Product ordered after “2021-10-05”. */
select Q.PRO_ID, PRO_NAME from product 
inner join (select PRO_ID from supplier_pricing as S
inner join (select PRICING_ID from `ORDER` where ORD_DATE > '2021-10-05') as P
on P.PRICING_ID=S.PRICING_ID) as Q
on Q.PRO_ID=product.PRO_ID;


/* 6. Display customer name and gender whose names start or end with character 'A'. */
select CUS_NAME, CUS_GENDER from customer where CUS_NAME like 'A%' or CUS_NAME like '%A';


/* 7. Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, 
	If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. */


/* Stored Procedure */
call service_rating();

/* Sttored Procedure */
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `service_rating`()
BEGIN
select test4.SUPP_ID, test4.SUPP_NAME, test4.Average,
CASE
WHEN test4.Average =5 THEN 'Excellent Service'
WHEN test4.Average >4 THEN 'Good Service'
WHEN test4.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END as Type_of_Service from
(select test3.SUPP_ID, supplier.SUPP_NAME, test3.Average from
(select test2.SUPP_ID, avg(test2.RAT_RATSTARS) as Average from
(select supplier_pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing
inner join (select `order`.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS from`order`
inner join rating 
on rating.ORD_ID=`order`.ORD_ID) as test
on test.PRICING_ID=supplier_pricing.PRICING_ID) as test2
group by supplier_pricing.SUPP_ID) as test3
inner join supplier where test3.SUPP_ID=supplier.SUPP_ID) as test4;
END$$
DELIMITER ;



/* Stored Procdeure Query (Without Stored Procedure) */
select test4.SUPP_ID, test4.SUPP_NAME, test4.Average,
CASE
WHEN test4.Average =5 THEN 'Excellent Service'
WHEN test4.Average >4 THEN 'Good Service'
WHEN test4.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END as Type_of_Service from
(select test3.SUPP_ID, supplier.SUPP_NAME, test3.Average from
(select test2.SUPP_ID, avg(test2.RAT_RATSTARS) as Average from
(select supplier_pricing.SUPP_ID, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing
inner join (select `order`.PRICING_ID, rating.ORD_ID, rating.RAT_RATSTARS from`order`
inner join rating 
on rating.ORD_ID=`order`.ORD_ID) as test
on test.PRICING_ID=supplier_pricing.PRICING_ID) as test2
group by supplier_pricing.SUPP_ID) as test3
inner join supplier where test3.SUPP_ID=supplier.SUPP_ID) as test4;

