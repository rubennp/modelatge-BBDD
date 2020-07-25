-- MySQL Script generated by MySQL Workbench
-- Wed Jul 22 21:56:27 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ita-model-bbdd-ex4
-- -----------------------------------------------------
-- Exercici 4 de modelatge de BBDD per accès a IT Academy

-- -----------------------------------------------------
-- Schema ita-model-bbdd-ex4
--
-- Exercici 4 de modelatge de BBDD per accès a IT Academy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ita-model-bbdd-ex4` DEFAULT CHARACTER SET utf8 ;
USE `ita-model-bbdd-ex4` ;

-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex4`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex4`.`Author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex4`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex4`.`Book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `units` INT UNSIGNED NULL,
  `price` DOUBLE NULL,
  `authorId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Book_Author_idx` (`authorId` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Author`
    FOREIGN KEY (`authorId`)
    REFERENCES `ita-model-bbdd-ex4`.`Author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex4`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex4`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex4`.`Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex4`.`Sale` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Sale_User1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_Sale_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `ita-model-bbdd-ex4`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex4`.`BooksOnSale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex4`.`BooksOnSale` (
  `saleId` INT NOT NULL,
  `bookId` INT NOT NULL,
  INDEX `fk_BooksOnSale_Sale1_idx` (`saleId` ASC) VISIBLE,
  INDEX `fk_BooksOnSale_Book1_idx` (`bookId` ASC) VISIBLE,
  CONSTRAINT `fk_BooksOnSale_Sale1`
    FOREIGN KEY (`saleId`)
    REFERENCES `ita-model-bbdd-ex4`.`Sale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BooksOnSale_Book1`
    FOREIGN KEY (`bookId`)
    REFERENCES `ita-model-bbdd-ex4`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex4`.`BooksOnSale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex4`.`BooksOnSale` (
  `saleId` INT NOT NULL,
  `bookId` INT NOT NULL,
  INDEX `fk_BooksOnSale_Sale1_idx` (`saleId` ASC) VISIBLE,
  INDEX `fk_BooksOnSale_Book1_idx` (`bookId` ASC) VISIBLE,
  CONSTRAINT `fk_BooksOnSale_Sale1`
    FOREIGN KEY (`saleId`)
    REFERENCES `ita-model-bbdd-ex4`.`Sale` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BooksOnSale_Book1`
    FOREIGN KEY (`bookId`)
    REFERENCES `ita-model-bbdd-ex4`.`Book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;