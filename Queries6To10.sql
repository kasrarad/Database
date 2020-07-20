/* Query 6 */
SELECT 
	publisher_number AS title,
	company_name,
	MAX(total) AS number_of_backOrder
FROM (	
SELECT 
	publisher_number,
    name AS company_name,
    COUNT(Publishers_publisher_number) AS total
FROM Publishers
JOIN Bookstore_Publisher_Order ON Publishers_publisher_number = publisher_number
WHERE confirmation = 0
GROUP BY Publishers_publisher_number
) AS Results;

/* Query 7 */
SELECT *
FROM Books
WHERE publisher_number = 1
ORDER BY selling_price;

/* Query 8 */
SELECT *
FROM Branches
WHERE publisher_number IN (
						SELECT publisher_number
						FROM (
							SELECT 
								publisher_number,
								COUNT(publisher_number) AS number_of_branches
							FROM Branches
							GROUP BY publisher_number
							HAVING number_of_branches >= 3) AS publisher_id);

/* Query 9 */
SELECT *
FROM Books
JOIN arrived_books ON Books_ISBN = ISBN
JOIN Inventory USING (inventory_id)
WHERE day_received <= "2019-07-19" AND Books.ISBN = ANY (
									SELECT ISBN
									FROM Orders
									JOIN Order_Book USING (order_id)
									WHERE is_sold = 1);

/* Query 10 */
SELECT * 
FROM Books
WHERE ISBN IN ( SELECT Books_ISBN
				FROM Book_Author
                JOIN Authors USING (author_id)
                WHERE Authors.name = "C");