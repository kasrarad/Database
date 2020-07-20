/* Query 1 */
SELECT Books.ISBN,Books.publisher_number,Books.title,Books.cost_price,Books.selling_price,Order_Book.is_sold,
	SUM(Order_Book.quantity) as ytd_sold
FROM Books LEFT JOIN Order_Book
	ON Books.ISBN = Order_Book.ISBN
GROUP BY Books.ISBN,Order_Book.is_sold
	HAVING Order_Book.is_sold = 1;
    

/* Query 2 */
SELECT Books.ISBN,Books.publisher_number,Books.title,Books.cost_price,Books.selling_price,Branch_Book_Quantity.branch_id,
	Branch_Book_Quantity.quantity,Order_Book.quantity as order_quantity, 
    (Order_Book.quantity - Branch_Book_Quantity.quantity) as back_order
FROM Books LEFT JOIN Branch_Book_Quantity
	ON Books.ISBN = Branch_Book_Quantity.ISBN
    LEFT JOIN Order_Book
		ON Books.ISBN = Order_Book.ISBN
WHERE Branch_Book_Quantity.branch_id > 0 AND 
	(Order_Book.quantity - Branch_Book_Quantity.quantity) > 0
	GROUP BY Books.ISBN;

/* Query 3 */
SELECT Customers.customer_id,Customers.first_name,Customers.last_name,Orders.date,Order_Book.order_id,
	Order_Book.ISBN,Order_Book.quantity
FROM Customers LEFT JOIN Special_Order
	ON Customers.customer_id = Special_Order.customer_id
    LEFT JOIN Orders 
		ON Special_Order.order_id = Orders.order_id
        LEFT JOIN Order_Book
			ON Orders.order_id = Order_Book.order_id
WHERE Customers.customer_id = 3;

/* Query 4 */
SELECT Customers.customer_id,Customers.first_name,Customers.last_name,Orders.date,Order_Book.order_id,
	Order_Book.ISBN,Order_Book.quantity,Branch_Book_Quantity.branch_id
FROM Customers LEFT JOIN Orders 
		ON Customers.customer_id = Orders.customer_id
        LEFT JOIN Order_Book
			ON Orders.order_id = Order_Book.order_id
			LEFT JOIN Branch_Book_Quantity
				ON Order_Book.ISBN = Branch_Book_Quantity.ISBN
WHERE Customers.customer_id = 3
	AND branch_id = 5
	AND date BETWEEN "2019-01-01" AND "2019-12-31";



/* Query 5 */
SELECT Branch_Book_Quantity.branch_id,Branch_Book_Quantity.ISBN,Books.cost_price as branch_sell_price,
		Order_Book.quantity,Orders.date,(Books.cost_price * Order_Book.quantity) as total_sales
FROM Branch_Book_Quantity LEFT JOIN Books
	ON Branch_Book_Quantity.ISBN = Books.ISBN
	LEFT JOIN Order_Book
		ON Branch_Book_Quantity.ISBN = Order_Book.ISBN
        LEFT JOIN Orders
			ON Order_Book.order_id = Orders.order_id
WHERE Branch_Book_Quantity.branch_id = 1 
		AND Orders.date BETWEEN "2019-01-01" AND "2019-12-31"
        AND Order_Book.is_sold = 0;/*this means it has been sold to bookstore */
        