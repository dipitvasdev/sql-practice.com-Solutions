/* Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken, and a column called "Shipped" that displays "On Time" if the order shipped on time and "Late" if the order shipped late.

Order by employee last_name, then by first_name, and then descending by number of orders. */


select
	e.first_name,
    e.last_name,
    COUNT(o.order_id) as num_orders,
    CASE
      WHEN o.shipped_date < o.required_date THEN 'On Time'
      ELSE 'Late'
  END AS Shipped
from
	employees e
    join orders o on o.employee_id = e.employee_id
group by
    Shipped,
    e.first_name,
    e.last_name
order by
	last_name,
    first_name,
   	num_orders desc 
