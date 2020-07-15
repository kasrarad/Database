CREATE TABLE Publisher (
  publisher_number int NOT NULL,
  name varchar(20),
  email varchar(20),
  city varchar(20),
  province varchar(20),
  address varchar(20),
  postal_code varchar(20),
  tel_num varchar(20),
  headoffice varchar(20),
  website varchar(20),
  PRIMARY KEY (publisher_number)
) ENGINE=InnoDB;


CREATE TABLE Branch (
  branch_id int NOT NULL,
  publisher_number int NOT NULL,
  name varchar(20) NOT NULL,
  rep_name varchar(20),
  rep_email varchar(20),
  city varchar(20),
  province varchar(20),
  address varchar(20),
  postal_code varchar(20),
  tel_num varchar(20),
  PRIMARY KEY (branch_id),
  FOREIGN KEY (publisher_number) REFERENCES Publisher(publisher_number) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Book(
  isbn int NOT NULL,
  title varchar(20),
  author varchar(20),
  subject varchar(20),
  published_by int,
  PRIMARY KEY (isbn),
  FOREIGN KEY (published_by) REFERENCES Publisher(publisher_number) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IventoryBookstore(
	store_id int NOT NULL,
	isbn int NOT NULL,
	cost_price float,
	selling_price float,
	quantity int,
	ytd_sold int,
	PRIMARY KEY (store_id,isbn),
    FOREIGN KEY (isbn) REFERENCES Book (isbn) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE IventoryPublisher(
	publisher_number int NOT NULL,
    branch_id int NOT NULL,
	isbn int NOT NULL,
	selling_price float,
	quantity int,
	ytd_sold int,
	PRIMARY KEY (publisher_number,branch_id,isbn),
    FOREIGN KEY (isbn) REFERENCES Book (isbn) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (publisher_number) REFERENCES Publisher(publisher_number) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES Branch (branch_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE BookOrder (
  order_id int NOT NULL,
  isbn int NOT NULL,
  order_date date,
  quantity int,
  publisher_number int,
  branch_id int,
  PRIMARY KEY (order_id),
  FOREIGN KEY (isbn) REFERENCES Book (isbn) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (publisher_number) REFERENCES Publisher (publisher_number) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (branch_id) REFERENCES Branch (branch_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Customer(
  customer_id int NOT NULL,
  first_name varchar(20),
  last_name varchar(20),
  company_name varchar(20),
  tel_num varchar(20),
  address varchar(20),
  city varchar(20),
  province varchar(20),
  postal_code varchar(20),
  email varchar(20),
  amount_total_purchases int,
  PRIMARY KEY (customer_id),
  CHECK (
  (first_name <> NULL and first_name <> '' and last_name <> NULL and last_name <> '') 
  or (company_name <> NULL and company_name <> '')
  )
) ENGINE=InnoDB;

CREATE TABLE SpecialOrder(
  special_order_id int NOT NULL,
  order_id int NOT NULL,
  customer_id int NOT NULL,
  PRIMARY KEY (special_order_id),
  FOREIGN KEY (order_id) REFERENCES BookOrder(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
