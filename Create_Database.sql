-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema store
-- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 ;
USE eyc353_1 ;

-- -----------------------------------------------------
-- Table `store`.`Bookstore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bookstore` (
  `bookstore_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `telephone` INT NOT NULL,
  `email_address` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `postal_code` VARCHAR(50) NOT NULL,
  `president` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`bookstore_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Intentory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventory` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT,
  `bookstore_id` INT NOT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  `quantity` INT NOT NULL,
  `day_received` DATETIME NOT NULL,
  `is_reserved` TINYINT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  CONSTRAINT `fk_Intentory_Bookstore`
    FOREIGN KEY (`bookstore_id`)
    REFERENCES `Bookstore` (`bookstore_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Publishers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Publishers` (
  `publisher_number` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `telephone` INT NOT NULL,
  `email_address` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `province` VARCHAR(50) NOT NULL,
  `postal_code` VARCHAR(50) NOT NULL,
  `website` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`publisher_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Books` (
  `ISBN` VARCHAR(20) NOT NULL,
  `inventory_id` INT NOT NULL,
  `publisher_number` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `cost_price` DECIMAL(5,2) NOT NULL,
  `selling_price` DECIMAL(5,2) NOT NULL,
  INDEX `fk_Books_Intentory1_idx` (`inventory_id` ASC) VISIBLE,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_Books_Publishers1_idx` (`publisher_number` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Intentory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `Inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Books_Publishers1`
    FOREIGN KEY (`publisher_number`)
    REFERENCES `Publishers` (`publisher_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Subjects` (
  `subject_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`subject_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Book_Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Book_Author` (
  `Books_ISBN` VARCHAR(20) NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`Books_ISBN`, `author_id`),
  INDEX `fk_Book_Author_Books1_idx` (`Books_ISBN` ASC) VISIBLE,
  INDEX `fk_Book_Author_Authors1_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Author_Books1`
    FOREIGN KEY (`Books_ISBN`)
    REFERENCES `Books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Author_Authors1`
    FOREIGN KEY (`author_id`)
    REFERENCES `Authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Book_Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Book_Subject` (
  `Books_ISBN` VARCHAR(20) NOT NULL,
  `subject_id` INT NOT NULL,
  PRIMARY KEY (`Books_ISBN`, `subject_id`),
  INDEX `fk_Book_Subject_Books1_idx` (`Books_ISBN` ASC) VISIBLE,
  INDEX `fk_Book_Subject_Subjects1_idx` (`subject_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Subject_Books1`
    FOREIGN KEY (`Books_ISBN`)
    REFERENCES `Books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_Subject_Subjects1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `Subjects` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `province` VARCHAR(50) NOT NULL,
  `postal_code` VARCHAR(50) NOT NULL,
  `telephone` INT NOT NULL,
  `email_address` VARCHAR(255) NOT NULL,
  `cumulative_purchase_amount` DECIMAL(5,2) NULL DEFAULT 0,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT default NULL,
  `bookstore_id` INT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  `quantity` INT NOT NULL,
  `publisher_name` VARCHAR(50) NULL DEFAULT NULL,
  `brach_name` VARCHAR(50) NULL DEFAULT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_Orders_Customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_Orders_Bookstore1_idx` (`bookstore_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Bookstore1`
    FOREIGN KEY (`bookstore_id`)
    REFERENCES `Bookstore` (`bookstore_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Order_Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Order_Book` (
  `order_id` INT NOT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  `is_sold` TINYINT NOT NULL,
  `total_sell` DECIMAL(7,2) NULL DEFAULT 0,
  `total_purchase` DECIMAL(7,2) NULL DEFAULT 0,
  INDEX `fk_Order_Book_Orders1_idx` (`order_id` ASC) VISIBLE,
  PRIMARY KEY (`order_id`, `ISBN`),
  INDEX `fk_Purchase_Book_Books1_idx` (`ISBN` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Book_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Purchase_Book_Books1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `Books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Bookstore_Publisher_Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bookstore_Publisher_Order` (
  `Publishers_publisher_number` INT NOT NULL,
  `Bookstore_bookstore_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `confirmation` TINYINT NOT NULL,
  INDEX `fk_Bookstore_Publisher_Order_Publishers1_idx` (`Publishers_publisher_number` ASC) VISIBLE,
  INDEX `fk_Bookstore_Publisher_Order_Bookstore1_idx` (`Bookstore_bookstore_id` ASC) VISIBLE,
  PRIMARY KEY (`Publishers_publisher_number`, `Bookstore_bookstore_id`),
  CONSTRAINT `fk_Bookstore_Publisher_Order_Publishers1`
    FOREIGN KEY (`Publishers_publisher_number`)
    REFERENCES `Publishers` (`publisher_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookstore_Publisher_Order_Bookstore1`
    FOREIGN KEY (`Bookstore_bookstore_id`)
    REFERENCES `Bookstore` (`bookstore_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Special_Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Special_Order` (
  `order_id` INT NOT NULL,
  `customer_id` VARCHAR(45) NOT NULL,
  INDEX `fk_Special_Order_Orders1_idx` (`order_id` ASC) VISIBLE,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_Special_Order_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Branches` (
  `branch_id` INT NOT NULL AUTO_INCREMENT,
  `publisher_number` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `rep_name` VARCHAR(50) NOT NULL,
  `rep_email` VARCHAR(255) NOT NULL,
  `is_head_office` TINYINT NOT NULL,
  PRIMARY KEY (`branch_id`),
  INDEX `fk_Branches_Publishers1_idx` (`publisher_number` ASC) VISIBLE,
  CONSTRAINT `fk_Branches_Publishers1`
    FOREIGN KEY (`publisher_number`)
    REFERENCES `Publishers` (`publisher_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`Branch_Book_Quantity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Branch_Book_Quantity` (
  `branch_id` INT NOT NULL,
  `ISBN` VARCHAR(20) NOT NULL,
  `quantity` INT NOT NULL,
  INDEX `fk_Branch_Book_Quantity_Branches1_idx` (`branch_id` ASC) VISIBLE,
  PRIMARY KEY (`ISBN`, `branch_id`),
  CONSTRAINT `fk_Branch_Book_Quantity_Branches1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `Branches` (`branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Branch_Book_Quantity_Books1`
    FOREIGN KEY (`ISBN`)
    REFERENCES `Books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
