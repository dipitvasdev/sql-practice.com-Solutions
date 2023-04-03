/* Show all the even numbered Order_id from the orders table */

select
	order_id
FROM
	orders
where
	order_id % 2 = 0
