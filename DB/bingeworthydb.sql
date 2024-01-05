-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bingeworthydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bingeworthydb` ;

-- -----------------------------------------------------
-- Schema bingeworthydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bingeworthydb` DEFAULT CHARACTER SET utf8 ;
USE `bingeworthydb` ;

-- -----------------------------------------------------
-- Table `show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `show` ;

CREATE TABLE IF NOT EXISTS `show` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `length` INT NULL,
  `still_airing` TINYINT NULL,
  `episodes` VARCHAR(45) NULL,
  `showcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS couchpotato@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'couchpotato'@'localhost' IDENTIFIED BY 'couchpotato';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'couchpotato'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `show`
-- -----------------------------------------------------
START TRANSACTION;
USE `bingeworthydb`;
INSERT INTO `show` (`id`, `name`, `description`, `length`, `still_airing`, `episodes`, `showcol`) VALUES (1, 'Supernatural', NULL, NULL, NULL, NULL, NULL);

COMMIT;

