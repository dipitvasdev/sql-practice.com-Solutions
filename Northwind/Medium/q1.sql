/* Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table */


select
	p.product_name,
    s.company_name,
    c.category_name
from
	categories c 
	join products p on p.category_id = c.category_id
    JOIN suppliers s on s.supplier_id = p.supplier_id

