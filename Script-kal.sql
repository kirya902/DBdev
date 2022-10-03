create database bot;
use bot;

CREATE TABLE IF NOT EXISTS `Клиент` (
  `idКлиент` INT NOT null ,
  `Имя` VARCHAR(45) NOT NULL,
  `Телефон` VARCHAR(45) NOT NULL,
  `Образование` VARCHAR(45) NOT NULL,
  `Зодиак` VARCHAR(45) NOT NULL,
  `Сообщения` VARCHAR(45) NOT NULL,
  `idОписание` INT NOT null ,
  `idСостоявшиесяпары` INT NOT null ,
  `idтребования` INT NOT null,
  PRIMARY KEY (`idКлиент`));
 
 CREATE TABLE IF NOT EXISTS `Требование` (
  `idТребование1` INT NOT NULL,
  `Образование` VARCHAR(45) NULL,
  `idВидыобразования` INT NOT null,
  PRIMARY KEY (`idтребование1`));
  
 CREATE TABLE IF NOT EXISTS `Видыобразования` (
  `idВидыобразования` INT NOT NULL,
  `Лет` VARCHAR(45) NOT NULL,
  `Возраст` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idВидыобразования`));
 
 CREATE TABLE IF NOT EXISTS `пары` (
  `idпары` INT NOT NULL,
  `Клиент1` VARCHAR(45) NOT NULL,
  `Клиент2` VARCHAR(45) NOT NULL,
  `Картинки` VARCHAR(45) NOT NULL,
  `idклиент1` INT NOT null ,
  PRIMARY KEY (`idпары`));
 
 CREATE TABLE IF NOT EXISTS `Чат` (
  `Сообщения` INT NOT NULL,
  `Имя` VARCHAR(45) NOT NULL,
   `idклиент` INT NOT null ,
  PRIMARY KEY (`Сообщения`));
 
 CREATE TABLE IF NOT EXISTS `Клиент1` (
  `Имя` INT NOT NULL,
  `Лет` VARCHAR(45) NOT NULL,
  `Телефон` VARCHAR(45) NOT NULL,
  `Картинки` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Имя`));
 
 CREATE TABLE IF NOT EXISTS `Описание` (
  `ID` INT NOT NULL,
  `Зодиак` VARCHAR(45) NOT NULL,
  `idПол` INT NOT null ,
  PRIMARY KEY (`ID`));
 
 CREATE TABLE IF NOT EXISTS `Пол` (
  `id` INT NOT NULL,
  `Лет` VARCHAR(45) NOT NULL,
  `Возраст` VARCHAR(45) NOT NULL, 
  PRIMARY KEY (`id`));
 
 CREATE TABLE IF NOT EXISTS `Сообщение` (
  `id` INT NOT NULL,
  `Текст` VARCHAR(45) NOT NULL,
  `Картинки` VARCHAR(45) NOT NULL,
  `Idсооьщения` VARCHAR(45) NOT NULL,
  `Сообщениеcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
 
 CREATE TABLE IF NOT EXISTS `Общение_chat` (
  `idСооб` INT NOT NULL,
  `idchat` INT NOT NULL);

 
 alter table Клиент
 add constraint foreign key (idОписание) references Описание (ID);
 
alter table Описание
 add constraint foreign key (idПол) references Пол (id);

alter table Клиент
 add constraint foreign key (idСостоявшиесяпары) references пары (idпары);
 
alter table пары
 add constraint foreign key (idклиент1) references Клиент1 (Имя);
 
alter table Клиент
 add constraint foreign key (idтребования) references Требование (idТребование1);

alter table Требование
 add constraint foreign key (idВидыобразования) references Видыобразования (idВидыобразования);

alter table Чат
 add constraint foreign key (idКлиент) references Клиент (idКлиент);

alter table общение_chat
 add constraint foreign key (idchat) references Чат (Сообщения);

alter table общение_chat
 add constraint foreign key (idСооб) references Сообщение (id);
 
 
 
 
