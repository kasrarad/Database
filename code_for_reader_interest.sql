create table if not exists Reader_Interest(
	order_id int,
    customer_id varchar(45) not null,
    ISBN varchar(15),
    subject_id int,
    `subject` varchar(20),
    primary key (order_id,customer_id,ISBN,subject_id),
    foreign key (order_id) references Orders(order_id),
    foreign key (ISBN) references Order_Book(ISBN),
    foreign key (subject_id) references `Book_Subject`(subject_id)
);