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
-- Table `mydb`.`Клиент1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Клиент1` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Клиент1` (
  `Имя` INT NOT NULL,
  `Лет` VARCHAR(45) NOT NULL,
  `Телефон` VARCHAR(45) NOT NULL,
  `Картинки` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Имя`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Состоявшиеся пары`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Состоявшиеся пары` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Состоявшиеся пары` (
  `idСостоявшиеся пары` INT NOT NULL,
  `Клиент1` VARCHAR(45) NOT NULL,
  `Клиент2` VARCHAR(45) NOT NULL,
  `Картинки` VARCHAR(45) NOT NULL,
  `Клиент1_Имя` INT NOT NULL,
  PRIMARY KEY (`idСостоявшиеся пары`, `Картинки`),
  INDEX `fk_Состоявшиеся пары_Клиент11_idx` (`Клиент1_Имя` ASC) VISIBLE,
  CONSTRAINT `fk_Состоявшиеся пары_Клиент11`
    FOREIGN KEY (`Клиент1_Имя`)
    REFERENCES `mydb`.`Клиент1` (`Имя`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Чат`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Чат` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Чат` (
  `Сообщения` INT NOT NULL,
  `Имя` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Сообщения`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Пол`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Пол` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Пол` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Описание`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Описание` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Описание` (
  `ID` INT NOT NULL,
  `Зодиак` VARCHAR(45) NOT NULL,
  `Пол_id` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Описание_Пол1_idx` (`Пол_id` ASC) VISIBLE,
  CONSTRAINT `fk_Описание_Пол1`
    FOREIGN KEY (`Пол_id`)
    REFERENCES `mydb`.`Пол` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Клиент`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Клиент` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Клиент` (
  `idКлиент` INT NOT NULL,
  `Имя` VARCHAR(45) NOT NULL,
  `Телефон` VARCHAR(45) NOT NULL,
  `Лет` VARCHAR(45) NOT NULL,
  `Образование` VARCHAR(45) NULL,
  `Зодиак` VARCHAR(45) NOT NULL,
  `Картинки` VARCHAR(45) NOT NULL,
  `Состоявшиеся пары_idСостоявшиеся пары` INT NOT NULL,
  `Состоявшиеся пары_Картинки` VARCHAR(45) NOT NULL,
  `Сообщения` VARCHAR(45) NOT NULL,
  `Чат_Сообщения` INT NOT NULL,
  `Описание_Зодиак` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Образование`),
  INDEX `fk_Клиент_Состоявшиеся пары1_idx` (`Состоявшиеся пары_idСостоявшиеся пары` ASC, `Состоявшиеся пары_Картинки` ASC) VISIBLE,
  INDEX `fk_Клиент_Чат1_idx` (`Чат_Сообщения` ASC) VISIBLE,
  INDEX `fk_Клиент_Описание1_idx` (`Описание_Зодиак` ASC) VISIBLE,
  CONSTRAINT `fk_Клиент_Состоявшиеся пары1`
    FOREIGN KEY (`Состоявшиеся пары_idСостоявшиеся пары` , `Состоявшиеся пары_Картинки`)
    REFERENCES `mydb`.`Состоявшиеся пары` (`idСостоявшиеся пары` , `Картинки`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Клиент_Чат1`
    FOREIGN KEY (`Чат_Сообщения`)
    REFERENCES `mydb`.`Чат` (`Сообщения`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Клиент_Описание1`
    FOREIGN KEY (`Описание_Зодиак`)
    REFERENCES `mydb`.`Описание` (`Зодиак`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Виды образования`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Виды образования` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Виды образования` (
  `idВиды образования` INT NOT NULL,
  PRIMARY KEY (`idВиды образования`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Требование`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Требование` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Требование` (
  `idТребование` INT NOT NULL,
  `Образование` VARCHAR(45) NULL,
  `` VARCHAR(45) NULL,
  `Клиент_Образование` VARCHAR(45) NOT NULL,
  `Виды образования_idВиды образования` INT NOT NULL,
  PRIMARY KEY (`Образование`),
  INDEX `fk_Требование_Клиент_idx` (`Клиент_Образование` ASC) VISIBLE,
  INDEX `fk_Требование_Виды образования1_idx` (`Виды образования_idВиды образования` ASC) VISIBLE,
  CONSTRAINT `fk_Требование_Клиент`
    FOREIGN KEY (`Клиент_Образование`)
    REFERENCES `mydb`.`Клиент` (`Образование`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Требование_Виды образования1`
    FOREIGN KEY (`Виды образования_idВиды образования`)
    REFERENCES `mydb`.`Виды образования` (`idВиды образования`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Сообщение`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Сообщение` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Сообщение` (
  `idСообщение` INT NOT NULL,
  `Текст` VARCHAR(45) NOT NULL,
  `Картинки` VARCHAR(45) NOT NULL,
  `Idсооьщения` VARCHAR(45) NOT NULL,
  `Сообщениеcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idСообщение`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Сообщение_has_Чат`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Сообщение_has_Чат` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Сообщение_has_Чат` (
  `Сообщение_idСообщение` INT NOT NULL,
  `Чат_Сообщения` INT NOT NULL,
  PRIMARY KEY (`Сообщение_idСообщение`, `Чат_Сообщения`),
  INDEX `fk_Сообщение_has_Чат_Чат1_idx` (`Чат_Сообщения` ASC) VISIBLE,
  INDEX `fk_Сообщение_has_Чат_Сообщение1_idx` (`Сообщение_idСообщение` ASC) VISIBLE,
  CONSTRAINT `fk_Сообщение_has_Чат_Сообщение1`
    FOREIGN KEY (`Сообщение_idСообщение`)
    REFERENCES `mydb`.`Сообщение` (`idСообщение`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Сообщение_has_Чат_Чат1`
    FOREIGN KEY (`Чат_Сообщения`)
    REFERENCES `mydb`.`Чат` (`Сообщения`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
