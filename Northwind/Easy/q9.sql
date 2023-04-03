/* 
Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table. */


select
	ROUND(AVG(unit_price),2) as average_unit_price,
    SUM(units_in_stock) as total_units_in_stock,
    sum(discontinued) as total_discontinued
from
	products
