-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`customers` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_contact_number` VARCHAR(45) NOT NULL,
  `customer_email` VARCHAR(45) NOT NULL,
  `customer_address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`bookings` (
  `booking_id` INT NOT NULL,
  `booking_date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDM`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`menu_items` (
  `menu_item_id` INT NOT NULL,
  `course_name` VARCHAR(45) NOT NULL,
  `starter_name` VARCHAR(45) NOT NULL,
  `dessert_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menu_item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`menu` (
  `menu_id` INT NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  `menu_item_id` INT NOT NULL,
  `menu_price` DECIMAL NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `menu_item_fk_idx` (`menu_item_id` ASC) VISIBLE,
  CONSTRAINT `menu_item_fk`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `LittleLemonDM`.`menu_items` (`menu_item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`staff` (
  `staff_id` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`deliveries` (
  `delivery_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `delivery_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`delivery_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`orders` (
  `order_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL NOT NULL,
  `delivery_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `staff_fk_idx` (`staff_id` ASC) VISIBLE,
  INDEX `delivery_fk_idx` (`delivery_id` ASC) VISIBLE,
  INDEX `menu_fk_idx` (`menu_id` ASC) VISIBLE,
  INDEX `customers_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `staff_fk`
    FOREIGN KEY (`staff_id`)
    REFERENCES `LittleLemonDM`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `delivery_fk`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `LittleLemonDM`.`deliveries` (`delivery_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_fk`
    FOREIGN KEY (`menu_id`)
    REFERENCES `LittleLemonDM`.`menu` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customers_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDM`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
