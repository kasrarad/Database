USE eyc353_1;

INSERT INTO Orders(customer_id, bookstore_id, publisher_name, branch_name, date)
VALUES (1, null, null, null, 2018-01-05),
		(2, null, null, null, 2018-01-07),
        (null, 1, 2, 1, 2018-03-02),
        (null, 1, 4, 2, 2019-01-02),
        (1, null, null, null, 2019-01-05),
        (3, null, 1, null, null, 2019-02-05),
        (2, null, 1, null, null, 2019-03-05),
        (4, null, 1, null, null, 2020-01-05),
        (null, 1, 2, 3, 2020-02-07),
        (null, 1, 5, 1, 2020-03-08);

INSERT INTO Customers(first_name, last_name, address, city, province, postal_code, telephone, email_address, cumulative_purchase_amount)
VALUES ('John', 'Smith', 'aaa', 'Montreal', 'Quebec', 'H3P1V2', '1234567', 'a@gmail.com', 70.5),
		('Kasra', 'Rad', 'bbb', 'Montreal', 'Quebec', 'H3H1V2', '1234562', 'b@gmail.com', 80.5),
        ('Robert', 'Wilson', 'ccc', 'Montreal', 'Quebec', 'H2H1V2', '1234563', 'c@gmail.com', 20.5),
        ('Michael', 'Anderson', 'ddd', 'Montreal', 'Quebec', 'H3V1V2', '1234564', 'd@gmail.com', 10.2),
        ('William', 'Jackson', 'eee', 'Montreal', 'Quebec', 'H4V1V2', '1234565', 'e@gmail.com', 7),
        ('David', 'Perez', 'fff', 'Montreal', 'Quebec', 'H5V1V2', '1234566', 'f@gmail.com', 170.4),
        ('Richard', 'Lee', 'ggg', 'Montreal', 'Quebec', 'H2P1V2', '1234569', 'g@gmail.com', 90.2),
        ('Joseph', 'Lewis', 'hhh', 'Montreal', 'Quebec', 'H3P1V2', '1234539', 'h@gmail.com', 40),
        ('Thomas', 'Young', 'iii', 'Montreal', 'Quebec', 'H4P1V2', '1234549', 'i@gmail.com', 300),
        ('Daniel', 'Baker', 'jjj', 'Montreal', 'Quebec', 'H3H2P2', '1234559', 'j@gmail.com', 400.58);

INSERT INTO Orders(bookstore_id, publisher_name, brach_name, date)
VALUES (10, 2, 1, "2018-03-02");

INSERT INTO Orders(customer_id, date)
VALUES (1, "2018-09-05"),
		(2, "2018-10-07"),
        (1, "2019-01-05"),
        (3, "2019-02-05"),
        (4, "2019-03-05");

INSERT INTO Orders(bookstore_id, publisher_name, brach_name, date)
VALUES (10, 2, 1, "2020-01-05"),
		(10, 3, 2, "2020-02-05"),
		(10, 4, 3, "2020-03-05");

INSERT INTO Orders(customer_id, date)
VALUES (7, "2020-04-01");


INSERT INTO Order_Book(order_id, ISBN, quantity, is_sold)
VALUES (13, '0-2838-9190-4', 4, 0),
		(13, '0-6521-1546-2', 3, 0),
        (13, '0-7225-8364-8', 2, 0),
        (14, '0-2838-9190-4', 2, 1),
        (15, '0-8229-1390-9', 1, 1),
        (16, '0-2838-9190-4', 1, 1),
        (16, '0-2237-3192-7', 2, 1),
        (17, '0-2710-5457-3', 1, 1),
        (18, '0-2838-9190-4', 1, 1),
        (18, '0-2710-5457-3', 2, 1),
        (19, '0-7225-8364-8', 5, 0),
        (20, '0-2710-5457-3', 1, 0),
        (20, '0-2237-3192-7', 4, 0),
        (21, '0-2710-5457-3', 2, 0),
        (22, '0-2710-5457-3', 2, 1);
