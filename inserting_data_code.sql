-- insert authors********************************************************************888
-- insert into Authors (name)
-- 	values 
-- 		("A"),("B"),("C"),("D"),("E"),("F"),("G"),("H"),("I"),("M");
        
-- insert publisher ******************************************************************
-- insert into Publishers(publisher_number,name,telephone,email_address,address,city,province,postal_code,website)
-- 	values
-- 		(1,"Ken_News1",438999990,"ken@publisher1.ca","123 westmount","westmount","quebec","h3h 1r7","www.kennews1.ca"),
-- 		(2,"Ken_News2",438999991,"ken@publisher2.ca","124 westmount","westmount","quebec","h3h 1r8","www.kennews2.ca"),
--         (3,"Ken_News3",438999992,"ken@publisher3.ca","153 westmount","westmount","quebec","h3h 1r9","www.kennews3.ca"),
--         (4,"Ken_News4",438999993,"ken@publisher4.ca","163 westmount","westmount","quebec","h3h 1t7","www.kennews4.ca"),
--         (5,"Ken_News5",438999994,"ken@publisher5.ca","173 westmount","westmount","quebec","h3h 1x1","www.kennews5.ca"),
--         (6,"Ken_News6",438999995,"ken@publisher6.ca","183 westmount","westmount","quebec","h3h 1r3","www.kennews6.ca"),
--         (7,"Ken_News7",438999996,"ken@publisher7.ca","193 westmount","westmount","quebec","h3h 1r4","www.kennews7.ca"),
--         (8,"Ken_News8",438999997,"ken@publisher8.ca","423 westmount","westmount","quebec","h3h 1a1","www.kennews8.ca"),
--         (9,"Ken_News9",438999998,"ken@publisher9.ca","223 westmount","westmount","quebec","h3h 1b2","www.kennews9.ca"),
--         (10,"Ken_News10",438999999,"ken@publisher10.ca","495 westmount","westmount","quebec","h3h 1c9","www.kennews10.ca");

-- insert books info ******************
-- insert into Books(ISBN,publisher_number,title,cost_price,selling_price) 
--  	values 
-- 			("0-7915-3557-6",1,"How to become millionare at 10",11.5,20),
--         ("0-2838-9190-4",1,"How to become millionare at 11",12.5,21),
--         ("0-4838-6782-9",1,"How to become millionare at 12",13.5,22),
--         ("0-6521-1546-2",2,"How to become millionare at 13",14.5,23),
--         ("0-7225-8364-8",2,"How to become millionare at 14",15.5,24),
--         ("0-9583-3711-X",2,"How to become millionare at 15",16.5,25),
--         ("0-8229-1390-9",3,"How to become millionare at 16",17.5,26),
--         ("0-4193-9813-9",3,"How to become millionare at 17",18.5,27),
--         ("0-2237-3192-7",4,"How to become millionare at 18",19.5,28),
--         ("0-6950-6671-4",4,"How to become millionare at 19",20.5,29),
--         ("0-1188-0050-7",5,"How to become millionare at 20",21.5,30),
--         ("0-2710-5457-3",6,"How to become millionare at 21",22.5,31),
--         ("0-4809-1234-3",7,"How to become millionare at 22",23.5,32),
--         ("0-6034-3910-1",8,"How to become millionare at 23",24.5,33),
--         ("0-3432-6145-6",9,"How to become millionare at 24",25.5,34),
--         ("0-6904-3082-5",10,"How to become millionare at 25",26.5,35);
   
-- ***************************************************************************\
-- insert author for the books

-- insert into Book_Author(Books_ISBN,author_id)
-- 	values
-- 		("0-7915-3557-6",1),
--         ("0-7915-3557-6",2),
--         ("0-7915-3557-6",3),
--         ("0-2838-9190-4",1),
--         ("0-4838-6782-9",4),
--         ("0-6521-1546-2",4),
--         ("0-7225-8364-8",5),
--         ("0-9583-3711-X",5),
-- 		("0-9583-3711-X",6),
-- 		("0-9583-3711-X",7),
--         ("0-8229-1390-9",6),
--         ("0-4193-9813-9",7),
--         ("0-2237-3192-7",8),
--         ("0-6950-6671-4",8),
--         ("0-1188-0050-7",8),
--         ("0-2710-5457-3",9),
--         ("0-2710-5457-3",8),
--         ("0-2710-5457-3",7),
--         ("0-2710-5457-3",6),
--         ("0-4809-1234-3",3),
--         ("0-6034-3910-1",8),
--         ("0-3432-6145-6",9),
--         ("0-6904-3082-5",10);
--         
-- ************************************************************

-- insert subjects table

-- insert into Subjects(name)
-- 	values
-- 		("science"),
--         ("science-fiction"),
--         ("fiction"),
--         ("self-help"),
--         ("romance"),
--         ("action"),
--         ("adventure"),
--         ("classic"),
--         ("novel"),
--         ("autobiography");

-- -- ****************************************************

-- -- added subject to books
-- insert into Book_Subject(books_isbn,subject_id)
-- 	values
-- 		("0-7915-3557-6",1),
--         ("0-7915-3557-6",2),
--         ("0-7915-3557-6",3),
--         ("0-2838-9190-4",1),
--         ("0-4838-6782-9",4),
--         ("0-6521-1546-2",4),
--         ("0-7225-8364-8",5),
--         ("0-9583-3711-X",5),
-- 		("0-9583-3711-X",6),
-- 		("0-9583-3711-X",7),
--         ("0-8229-1390-9",6),
--         ("0-4193-9813-9",7),
--         ("0-2237-3192-7",8),
--         ("0-6950-6671-4",8),
--         ("0-1188-0050-7",8),
--         ("0-2710-5457-3",9),
--         ("0-2710-5457-3",8),
--         ("0-2710-5457-3",7),
--         ("0-2710-5457-3",6),
--         ("0-4809-1234-3",3),
--         ("0-6034-3910-1",8),
--         ("0-3432-6145-6",9),
--         ("0-6904-3082-5",10);

-- **************************************************************

-- insert Branches 
-- insert into Branches(branch_id,publisher_number, name, address, rep_name, rep_email, is_head_office)
--  values (1,1,"Konami", "102 Greenview St. Winston Salem, NC 27103", "Hideo Kojima", "h_kojima@gmail.com", 0),
--    (2,5,"EA", "1 Arrowhead Ave. Bangor, ME 04401", "John Madden", "jm@ea.com", 0),
--    (3,3,"Funimation", "8059 Prince St. Great Falls, MT 59404", "Janet Jackson", "head_chief_jackson@funimation.com", 1),
--    (4,9,"Penguin Killers", "85 Poplar St. Noblesville, IN 46060", "Michael Myers", "totally_not_a_stalker@penguinkillers.uk", 0),
--    (5,10,"Fake Acid Pools", "8840 West Dogwood St. Valdosta, GA 31601", "Rick Sanchez", "the_rick@plumbus.org", 1),
--    (6,7,"Nacho Libre", "288 Shipley Street Vienna, VA 22180", "Jack Black", "blackjack76@gmail.com", 0),
--    (7,2,"Cow Chop", "35 North Court Torrance, CA 90505", "James Wilson", "uberhaxornova@hotmail.com", 0),
--    (8,4,"Flex Tape", "159 Cardinal St. Garfield, NJ 07026", "Phil Swift", "alottadamage@flex_seal.com", 1),
--    (9,8,"I love trains", "9022 Iroquois St. Chapel Hill, NC 27516", "Sheldon Cooper", "perfect_being@msn.com", 1),
--    (10,6,"Speedwagon Inc.", "8232 Honey Creek St. Cedar Falls, IA 50613", "Robert E. O. Speedwagon", "checkered_hat@speedwagon.us", 1);
-- **************************************************************

-- insert Branch_Book_Quantity 
-- insert into Branch_Book_Quantity(branch_id,ISBN,quantity)
--  values (1,"0-1188-0050-7",10),
--    (1,"0-4809-1234-3",10),
--    (3,"0-2838-9190-4",30),
--    (9,"0-3432-6145-6",5),
--    (4,"0-8229-1390-9",12),
--    (10,"0-6521-1546-2",10),
--    (4,"0-1188-0050-7",2),
--    (5,"0-3432-6145-6",45);

-- **************************************************************

-- insert Bookstore_Publisher_Order ******************************************************************

-- insert into Bookstore_Publisher_Order(Publishers_publisher_number, Bookstore_bookstore_id, order_id,confirmation)
--  values (1,11,1,0),
--    (1,19,2,1),
--    (3,11,3,0),
--    (9,15,4,0),
--    (4,10,5,1),
--    (10,16,6,0),
--    (4,13,7,1),
--    (5,16,8,1);
    
-- **************************************************************
-- STATUS: Ken updated 6 tables: Book,Book_author,Author,Subject,Book_subject and publisher. 6/16 tables
-- 10 tables remaining are: Bookstore->inventory -> arrived_books; Book_publisher_order; Branch_book_quantity
-- 							branches, customers, orders,order_book,special_order

-- ********************************************************************

-- inserting reader-interest

-- insert into Reader_Interest(order_id,customer_id,ISBN,subject_id,subject)
-- 	values
-- 		(14,1,"0-2838-9190-4",1,"science"),
--         (15,2,"0-8229-1390-9",6,"romance"),
--         (16,1,"0-2237-3192-7",8,"classic"),
--         (16,1,"0-2838-9190-4",1,"science"),
--         (17,3,"0-2710-5457-3",6,"action"),
--         (17,3,"0-2710-5457-3",7,"adventure"),
--         (17,3,"0-2710-5457-3",8,"classic"),
--         (17,3,"0-2710-5457-3",9,"novel"),
--         (18,4,"0-2710-5457-3",6,"action"),
--         (18,4,"0-2710-5457-3",7,"adventure"),
--         (18,4,"0-2710-5457-3",8,"classic"),
--         (18,4,"0-2710-5457-3",9,"novel"),
--         (18,4,"0-2838-9190-4",1,"science"),
--          (22,7,"0-2710-5457-3",6,"action"),
--         (22,7,"0-2710-5457-3",7,"adventure"),
--         (22,7,"0-2710-5457-3",8,"classic"),
--         (22,7,"0-2710-5457-3",9,"novel");
--         
        
        
        
	

