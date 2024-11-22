-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CustomerAccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CustomerAccount` (
  `CustomerID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NULL,
  `CustomerBrand` VARCHAR(45) NULL,
  `CustomerCompany` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departement` (
  `dp_id` INT NOT NULL,
  `de_name` VARCHAR(45) NULL,
  `de_head` VARCHAR(45) NULL,
  `CustomerAccount` INT NULL,
  `Departementcol` INT NULL,
  PRIMARY KEY (`dp_id`),
  INDEX `customer_id_idx` (`CustomerAccount` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`CustomerAccount`)
    REFERENCES `mydb`.`CustomerAccount` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Project` (
  `pr_id` INT NOT NULL,
  `pr_name` VARCHAR(45) NULL,
  `pr_head` INT NULL,
  PRIMARY KEY (`pr_id`),
  INDEX `pr_head_idx` (`pr_head` ASC) VISIBLE,
  CONSTRAINT `pr_head`
    FOREIGN KEY (`pr_head`)
    REFERENCES `mydb`.`Employee` (`em_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Game` (
  `GameID` INT NOT NULL,
  `GameName` VARCHAR(45) NULL,
  `GameVersion` INT NULL,
  `GamePG` VARCHAR(45) NULL,
  `GameReview` VARCHAR(45) NULL,
  PRIMARY KEY (`GameID`),
  INDEX `game_version_idx` (`GameVersion` ASC) VISIBLE,
  CONSTRAINT `game_version`
    FOREIGN KEY (`GameVersion`)
    REFERENCES `mydb`.`Project` (`pr_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `em_id` INT NOT NULL,
  `em_name` VARCHAR(45) NULL,
  `em_firstname` VARCHAR(45) NULL,
  `em_departement` INT NULL,
  `GameID` INT NULL,
  PRIMARY KEY (`em_id`),
  INDEX `dp_id_idx` (`em_departement` ASC) VISIBLE,
  INDEX `game_id_idx` (`GameID` ASC) VISIBLE,
  CONSTRAINT `dp_id`
    FOREIGN KEY (`em_departement`)
    REFERENCES `mydb`.`Departement` (`dp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `game_id`
    FOREIGN KEY (`GameID`)
    REFERENCES `mydb`.`Game` (`GameID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salary` (
  `sa_id` INT NOT NULL,
  `sa_amount` VARCHAR(45) NULL,
  PRIMARY KEY (`sa_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee_Salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee_Salary` (
  `es_id` INT NOT NULL,
  `em_id` INT NULL,
  `sa_id` INT NULL,
  `em_percentage` VARCHAR(45) NULL,
  `em_valid_date` VARCHAR(45) NULL,
  PRIMARY KEY (`es_id`),
  INDEX `em_id_idx` (`em_id` ASC) VISIBLE,
  INDEX `sa_id_idx` (`sa_id` ASC) VISIBLE,
  CONSTRAINT `em_id`
    FOREIGN KEY (`em_id`)
    REFERENCES `mydb`.`Employee` (`em_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sa_id`
    FOREIGN KEY (`sa_id`)
    REFERENCES `mydb`.`Salary` (`sa_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignment` (
  `as_id` INT NOT NULL,
  `as_name` VARCHAR(45) NULL,
  `pr_id` VARCHAR(45) NULL,
  `as_priority` VARCHAR(45) NULL,
  `as_status` VARCHAR(45) NULL,
  PRIMARY KEY (`as_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee_Assignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee_Assignments` (
  `em_id` INT NOT NULL,
  `as_id` INT NOT NULL,
  `ea_date` DATE NULL,
  `ea_time` TIME NULL,
  PRIMARY KEY (`em_id`, `as_id`),
  INDEX `as_id4_idx` (`as_id` ASC) VISIBLE,
  CONSTRAINT `em_id2`
    FOREIGN KEY (`em_id`)
    REFERENCES `mydb`.`Employee` (`em_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `as_id4`
    FOREIGN KEY (`as_id`)
    REFERENCES `mydb`.`Assignment` (`as_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Review` (
  `ReviewID` INT NOT NULL,
  `UserID` INT NULL,
  `ReviewGame` INT NULL,
  `ReviewSubmitter` VARCHAR(45) NULL,
  PRIMARY KEY (`ReviewID`),
  INDEX `Userid_idx` (`UserID` ASC) VISIBLE,
  INDEX `ReviewGame_idx` (`ReviewGame` ASC) VISIBLE,
  CONSTRAINT `Userid`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`CustomerAccount` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ReviewGame`
    FOREIGN KEY (`ReviewGame`)
    REFERENCES `mydb`.`Game` (`GameID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
