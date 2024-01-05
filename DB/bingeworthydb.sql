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
-- Table `program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `program` ;

CREATE TABLE IF NOT EXISTS `program` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `image_url` VARCHAR(2000) NULL,
  `still_airing` TINYINT NOT NULL,
  `length` INT NULL,
  `episode_count` INT NULL,
  `total_runtime` INT NULL,
  `active` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category_has_show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category_has_show` ;

CREATE TABLE IF NOT EXISTS `category_has_show` (
  `category_id` INT NOT NULL,
  `show_id` INT NOT NULL,
  PRIMARY KEY (`category_id`, `show_id`),
  INDEX `fk_category_has_show_show1_idx` (`show_id` ASC),
  INDEX `fk_category_has_show_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_has_show_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_show_show1`
    FOREIGN KEY (`show_id`)
    REFERENCES `program` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Data for table `program`
-- -----------------------------------------------------
START TRANSACTION;
USE `bingeworthydb`;
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`) VALUES (1, 'Supernatural', NULL, NULL, 0, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `bingeworthydb`;
INSERT INTO `category` (`id`, `type`, `description`) VALUES (1, 'Action', 'Involves violence and physical feats');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (2, 'Adventure', 'Involves an epic journey.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (3, 'Animation', 'Drawn or computer animated.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (4, 'Biography', 'Nonfiction account of a real person\'s life.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (5, 'Comedy', 'Intended to be humorus or amusing.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (6, 'Crime', 'Includes detective fiction( such as the whodunit), courtrom drama, hard-boiled fiction, and legal thrillers.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (7, 'Documentary', 'Nonfictional - meant to document reality, primarily for instruction or education. ');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (8, 'Drama', 'Narrative fiction intended to be more serious than humorus.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (9, 'Family', 'General entertainment meant for all ages');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (10, 'Fantasy', 'Features elements of the fantastic, often including magic, supernatural forces or exotic fantasy worlds.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (11, 'History', 'Storytelling that is set in a specific period of time in the past, typically focusing on real people, events, and places');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (12, 'Horror', 'Storytelling intended to scare, shock, and thrill.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (13, 'Musical', 'Melds the auditory and visual elements of storytelling, contributing to the narrative, character development, and emotional impact.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (14, 'Mystery', 'The nature of an event, usually a murder or other crime, remains mysterious until the end of the story.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (15, 'Reality-TV', 'Documents purportedly unscripted real-life situations.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (16, 'Romance', 'Historical romance, contemporary romance, paranormal romance, and romantic comedy.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (17, 'Sci-Fi', 'Deals with futuristic concepts or technology such as advanced science, the exploration of outer space, time travel, parallel dimensions, and alien life.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (18, 'Sport', 'Mainly association football, basketball, volleyball, futsal, rugby, surf, golf, athletics, wrestling, and American sports, combat sports, auto racing, and tennis.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (19, 'Thriller', 'Characterized and defined by the moods they elicit, giving their audiences heightened feelings of suspense, excitement, surprise, anticipation and anxiety.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (20, 'War', 'Concerned with warfare, typically about naval, air, or land battles, with combat scenes.');
INSERT INTO `category` (`id`, `type`, `description`) VALUES (21, 'Western', 'Settings in the later half of the 19th century in the American Old West, Western Canada and Mexico.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `category_has_show`
-- -----------------------------------------------------
START TRANSACTION;
USE `bingeworthydb`;
INSERT INTO `category_has_show` (`category_id`, `show_id`) VALUES (8, 1);
INSERT INTO `category_has_show` (`category_id`, `show_id`) VALUES (10, 1);
INSERT INTO `category_has_show` (`category_id`, `show_id`) VALUES (12, 1);

COMMIT;

