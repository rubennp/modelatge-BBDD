-- MySQL Script generated by MySQL Workbench
-- Tue Jul 21 21:04:39 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ita-model-bbdd-ex1
-- -----------------------------------------------------
-- Exercici de modelatge de dades per l’accés a IT Academy

-- -----------------------------------------------------
-- Schema ita-model-bbdd-ex1
--
-- Exercici de modelatge de dades per l’accés a IT Academy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ita-model-bbdd-ex1` DEFAULT CHARACTER SET utf8 ;
USE `ita-model-bbdd-ex1` ;

-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex1`.`Plane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex1`.`Plane` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `capacity` INT UNSIGNED NOT NULL,
  `model` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ita-model-bbdd-ex1`.`Seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ita-model-bbdd-ex1`.`Seat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `planeId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_SEIENTS_Plane_idx` (`planeId` ASC) VISIBLE,
  CONSTRAINT `fk_SEIENTS_Plane`
    FOREIGN KEY (`planeId`)
    REFERENCES `ita-model-bbdd-ex1`.`Plane` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;