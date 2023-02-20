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
END