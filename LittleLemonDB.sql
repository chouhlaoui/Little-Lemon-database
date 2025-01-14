-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `salary` FLOAT NULL,
  PRIMARY KEY (`staff_id`));


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL,
  `contact` VARCHAR(32) NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  `Staff_staff_id` INT NOT NULL,
  `Customers_customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_Bookings_Staff_idx` (`Staff_staff_id` ASC) VISIBLE,
  INDEX `fk_Bookings_Customers1_idx` (`Customers_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Staff`
    FOREIGN KEY (`Staff_staff_id`)
    REFERENCES `LittleLemonDB`.`Staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Customers1`
    FOREIGN KEY (`Customers_customer_id`)
    REFERENCES `LittleLemonDB`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `Total` FLOAT NULL,
  `Bookings_booking_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_Orders_Bookings1_idx` (`Bookings_booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Bookings1`
    FOREIGN KEY (`Bookings_booking_id`)
    REFERENCES `LittleLemonDB`.`Bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL,
  `contact` VARCHAR(32) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `Orders_order_id` INT NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `fk_Menu_Orders1_idx` (`Orders_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Orders1`
    FOREIGN KEY (`Orders_order_id`)
    REFERENCES `LittleLemonDB`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderStatus` (
  `OrderStatus_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `Orders_order_id` INT NOT NULL,
  PRIMARY KEY (`OrderStatus_id`),
  INDEX `fk_OrderStatus_Orders1_idx` (`Orders_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_OrderStatus_Orders1`
    FOREIGN KEY (`Orders_order_id`)
    REFERENCES `LittleLemonDB`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
