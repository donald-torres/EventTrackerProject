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
-- Table `program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `program` ;

CREATE TABLE IF NOT EXISTS `program` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(2000) NULL,
  `image_url` VARCHAR(2000) NULL,
  `still_airing` TINYINT NOT NULL,
  `length` INT NULL,
  `episode_count` INT NULL,
  `total_runtime` INT NULL,
  `active` TINYINT NOT NULL,
  `category_id` INT NOT NULL DEFAULT 22,
  PRIMARY KEY (`id`, `category_id`),
  INDEX `fk_program_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_program_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform` ;

CREATE TABLE IF NOT EXISTS `platform` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `program_has_platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `program_has_platform` ;

CREATE TABLE IF NOT EXISTS `program_has_platform` (
  `program_id` INT NOT NULL,
  `platform_id` INT NOT NULL,
  PRIMARY KEY (`program_id`, `platform_id`),
  INDEX `fk_program_has_platform_platform1_idx` (`platform_id` ASC),
  INDEX `fk_program_has_platform_program1_idx` (`program_id` ASC),
  CONSTRAINT `fk_program_has_platform_program1`
    FOREIGN KEY (`program_id`)
    REFERENCES `program` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_program_has_platform_platform1`
    FOREIGN KEY (`platform_id`)
    REFERENCES `platform` (`id`)
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
INSERT INTO `category` (`id`, `type`, `description`) VALUES (22, 'Unmarked', 'Default for new programs.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `program`
-- -----------------------------------------------------
START TRANSACTION;
USE `bingeworthydb`;
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`, `category_id`) VALUES (1, 'Supernatural', 'Two brothers follow their father\'s footsteps as hunters, fighting evil supernatural beings of many kinds, including monsters, demons, and gods that roam the earth.', 'https://upload.wikimedia.org/wikipedia/en/e/e1/Supernatural_Season_1.jpg', 0, 45, 327, 14715, 1, 1);
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`, `category_id`) VALUES (2, 'Bones', 'F.B.I. Special Agent Seeley Booth teams up with the Jeffersonian\'s top anthropologist, Dr. Temperance Brennan, to investigate cases where all that\'s left of the victims are their bones.', 'https://upload.wikimedia.org/wikipedia/en/3/39/Bones_title_card.png', 0, 45, 246, 11070, 1, 6);
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`, `category_id`) VALUES (3, 'Bob\'s Burgers', 'Bob Belcher runs his dream restaurant with his wife and three children as their last hope of holding the family together.', 'https://upload.wikimedia.org/wikipedia/en/e/ef/Bob%27s_Burgers_%28season_1%29.jpg', 1, 22, 270, 5940, 1, 3);
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`, `category_id`) VALUES (4, 'Law and Order: Special Victims Unit', 'This series follows the Special Victims Unit, a specially trained squad of detectives in the New York City Police Department that investigate sexually related crimes.', 'https://upload.wikimedia.org/wikipedia/commons/b/b7/Law_%26_Order-_Special_Victims_Unit_opening_title_card.jpg', 1, 45, 538, 24210, 1, 6);
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`, `category_id`) VALUES (5, 'How I Met Your Mother', 'A father recounts to his children - through a series of flashbacks - the journey he and his four best friends took leading up to him meeting their mother.', 'https://upload.wikimedia.org/wikipedia/en/f/fc/Howimetyourmother.jpg', 0, 22, 208, 4576, 1, 5);
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`, `category_id`) VALUES (6, 'Family Guy', 'In a wacky Rhode Island town, a dysfunctional family strives to cope with everyday life as they are thrown from one crazy scenario to another.', 'https://upload.wikimedia.org/wikipedia/en/c/ce/Family_Guy_Season1.png', 1, 22, 418, 9196, 1, 3);
INSERT INTO `program` (`id`, `name`, `description`, `image_url`, `still_airing`, `length`, `episode_count`, `total_runtime`, `active`, `category_id`) VALUES (7, 'Fake Program(not active)', 'fake', 'https://httpstatusdogs.com/img/404.jpg', 0, 0, 0, 0, 0, 22);

COMMIT;


-- -----------------------------------------------------
-- Data for table `platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `bingeworthydb`;
INSERT INTO `platform` (`id`, `name`) VALUES (1, 'Netflix');
INSERT INTO `platform` (`id`, `name`) VALUES (2, 'Hulu');
INSERT INTO `platform` (`id`, `name`) VALUES (3, 'Peacock');
INSERT INTO `platform` (`id`, `name`) VALUES (4, 'Max');
INSERT INTO `platform` (`id`, `name`) VALUES (5, 'Amazon Prime Video');
INSERT INTO `platform` (`id`, `name`) VALUES (6, 'Paramount Plus');
INSERT INTO `platform` (`id`, `name`) VALUES (7, 'Disney Plus');
INSERT INTO `platform` (`id`, `name`) VALUES (8, 'Apple TV');
INSERT INTO `platform` (`id`, `name`) VALUES (9, 'Sling TV');
INSERT INTO `platform` (`id`, `name`) VALUES (10, 'Youtube TV');

COMMIT;


-- -----------------------------------------------------
-- Data for table `program_has_platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `bingeworthydb`;
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (1, 1);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (1, 2);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (1, 8);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (1, 9);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (1, 10);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (2, 2);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (2, 5);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (2, 9);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (2, 10);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (3, 2);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (3, 9);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (3, 10);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (4, 2);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (4, 3);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (4, 10);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (5, 2);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (6, 2);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (6, 9);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (6, 10);
INSERT INTO `program_has_platform` (`program_id`, `platform_id`) VALUES (7, 1);

COMMIT;

