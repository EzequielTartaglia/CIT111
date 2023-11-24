-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- Schema university
DROP SCHEMA IF EXISTS `university` ;

-- Schema university
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8 ;
USE `university` ;

-- Table `university`.`college`
DROP TABLE IF EXISTS `university`.`college` ;

CREATE TABLE IF NOT EXISTS `university`.`college` (
  `collegeId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `collegeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`collegeId`))
ENGINE = InnoDB;

-- DESCRIBE college

-- Table `university`.`department`
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `departmentId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `departmentName` VARCHAR(45) NOT NULL,
  `departmentCode` VARCHAR(15) NOT NULL,
  `collegeId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`departmentId`),
  CONSTRAINT `fk_department_college`
    FOREIGN KEY (`collegeId`)
    REFERENCES `university`.`college` (`collegeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_department_college_idx` ON `university`.`department` (`collegeId` ASC) VISIBLE;

-- DESCRIBE department

-- Table `university`.`course`
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `courseId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(45) NOT NULL,
  `courseNumber` INT UNSIGNED NOT NULL,
  `courseCredit` INT UNSIGNED NOT NULL,
  `departmentId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`courseId`),
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `university`.`department` (`departmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_course_department1_idx` ON `university`.`course` (`departmentId` ASC) VISIBLE;

-- DESCRIBE course

-- Table `university`.`faculty`
DROP TABLE IF EXISTS `university`.`faculty` ;

CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `facultyId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `facultyLastName` VARCHAR(45) NOT NULL,
  `facultyFirstName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`facultyId`))
ENGINE = InnoDB;

-- DESCRIBE faculty

-- Table `university`.`semester`
DROP TABLE IF EXISTS `university`.`semester` ;

CREATE TABLE IF NOT EXISTS `university`.`semester` (
  `semesterId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `semesterName` VARCHAR(45) NOT NULL,
  `semesterYear` YEAR(4) NOT NULL,
  PRIMARY KEY (`semesterId`))
ENGINE = InnoDB;

-- DESCRIBE semester

-- Table `university`.`section`
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `sectionId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `sectionNumber` INT UNSIGNED NOT NULL,
  `sectionCapacity` INT UNSIGNED NOT NULL,
  `courseId` INT UNSIGNED NOT NULL,
  `facultyId` INT UNSIGNED NOT NULL,
  `semesterId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`sectionId`),
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`courseId`)
    REFERENCES `university`.`course` (`courseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_faculty1`
    FOREIGN KEY (`facultyId`)
    REFERENCES `university`.`faculty` (`facultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_semester1`
    FOREIGN KEY (`semesterId`)
    REFERENCES `university`.`semester` (`semesterId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_section_course1_idx` ON `university`.`section` (`courseId` ASC) VISIBLE;

CREATE INDEX `fk_section_faculty1_idx` ON `university`.`section` (`facultyId` ASC) VISIBLE;

CREATE INDEX `fk_section_semester1_idx` ON `university`.`section` (`semesterId` ASC) VISIBLE;

-- DESCRIBE section

-- Table student

DROP TABLE IF EXISTS `university`.`student` ;

CREATE TABLE IF NOT EXISTS `university`.`student` (
  `studentId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentLastName` VARCHAR(45) NOT NULL,
  `studentFirstName` VARCHAR(45) NOT NULL,
  `studentGender` ENUM("M", "F") NOT NULL,
  `studentCity` VARCHAR(45) NOT NULL,
  `studentState` VARCHAR(45) NOT NULL,
  `studentDob` DATE NOT NULL,
  PRIMARY KEY (`studentId`))
ENGINE = InnoDB;

-- DESCRIBE student

-- Table `university`.`enrollment`
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `sectionId` INT UNSIGNED NOT NULL,
  `studentId` INT UNSIGNED NOT NULL,
  CONSTRAINT `fk_section_has_student_section1`
    FOREIGN KEY (`sectionId`)
    REFERENCES `university`.`section` (`sectionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_student_student1`
    FOREIGN KEY (`studentId`)
    REFERENCES `university`.`student` (`studentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_section_has_student_student1_idx` ON `university`.`enrollment` (`studentId` ASC) VISIBLE;

CREATE INDEX `fk_section_has_student_section1_idx` ON `university`.`enrollment` (`sectionId` ASC) VISIBLE;

-- DESCRIBE enrollment

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

