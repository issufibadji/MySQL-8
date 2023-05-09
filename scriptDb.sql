-- The MySQL CREATE DATABASE Statement--

CREATE DATABASE testDB;

-- The MYSQL SHOW DATABASES Statement ---

SHOW DATABASES ;

-- The MYSQL USE DATABASES Statement ---

USE testDB;

-- The MySQL DROP DATABASE Statement -- 
 
 DROP DATABASE  testDB;
 
-- The MySQL CREATE TABLE Statement--

CREATE TABLE Persons (
    PersonID INT,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255)
);

-- The MySQL SELECT TABLE Statement--

SELECT 
    *
FROM
    Persons;


-- The MySQL DESCRIBE TABLE Statement--

DESCRIBE Persons;

-- The MySQL DROP TABLE Statement--

DROP TABLE Persons;

-- The MySQL ALTER TABLE Statement--
/*
*A ALTER TABLEinstrução é usada para adicionar, excluir ou modificar colunas em uma tabela existente.
Também é usada para adicionar e remover várias restrições em uma tabela existente. 
*/

-- ALTER TABLE - ADD Column--
ALTER TABLE Persons ADD Email varchar(255);

-- ALTER TABLE - DROP COLUMN --  

ALTER TABLE Persons DROP COLUMN Email; 

-- ALTER TABLE - MODIFY COLUMN --

ALTER TABLE Persons MODIFY COLUMN Email varchar(50);
  
-- MySQL Constraints --

/*
  *As restrições SQL são usadas para especificar regras para os dados em uma tabela.
	
    As seguintes restrições são comumente usadas em SQL:
	NOT NULL- Garante que uma coluna não pode ter um valor NULL
	UNIQUE- Garante que todos os valores em uma coluna sejam diferentes
	PRIMARY KEY- restrição identifica exclusivamente cada registro em uma tabela(chave primária)
	FOREIGN KEY - restrição é usada para evitar ações que destruam os links entre as tabelas(chave estrangeira)
	CHECK- Garante que os valores em uma coluna satisfaçam uma condição específica
	DEFAULT- Define um valor padrão para uma coluna se nenhum valor for especificado
	CREATE INDEX- Usado para criar e recuperar dados do banco de dados muito rapidamente
*/


DESC Persons;

ALTER TABLE Persons MODIFY PersonID int NOT NULL;
ALTER TABLE Persons MODIFY LastName varchar(255) NOT NULL;
ALTER TABLE Persons MODIFY FirstName varchar(255) NOT NULL;

ALTER TABLE Persons ADD Age int NOT NULL;
DESCRIBE Persons;

-- The MySQL UNIQUE Constraint --


-- UNIQUE Constraint on CREATE TABLE--
CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (PersonID)
);

ALTER TABLE Persons ADD UNIQUE (PersonID);

-- UNIQUE Constraint on multiple columns-- 
CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (PersonID,LastName)
);

ALTER TABLE Persons ADD CONSTRAINT UC_Person UNIQUE (PersonID,LastName);

 -- -- UNIQUE Constraint on DROP TABLE--
 ALTER TABLE Persons DROP INDEX UC_Person;
 
 -- MySQL PRIMARY KEY Constraint --
 CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (PersonID)
);


 CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (PersonID, LastName)
);

-- PRIMARY KEY on ALTER TABLE--
ALTER TABLE Persons 
ADD PRIMARY KEY(PersonID);

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID,LastName);

-- DROP a PRIMARY KEY Constraint--
ALTER TABLE Persons
DROP PRIMARY KEY;
use TestDB;


CREATE TABLE Orders(
OrderID int NOT NULL,
OrderNumber int NOT NULL,
PersonID int,
PRIMARY KEY (OrderID),
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

-- MySQL CHECK Constraint --

-- CHECK on CREATE TABLE--
CREATE TABLE Persons (
    PersonID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

CREATE TABLE Persons (
    PersonsID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

ALTER TABLE Persons
ADD CHECK (Age>=18);
-- CHECK on ALTER TABLE --
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');
-- DROP a CHECK Constraint --
ALTER TABLE Persons 
DROP CHECK CHK_PersonAge;


-- MySQL DEFAULT Constraint --

-- DEFAULT on CREATE TABLE --
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT CURRENT_DATE()
);

-- DEFAULT on ALTER TABLE --
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

-- DROP a DEFAULT Constraint --
ALTER TABLE Persons
ALTER City DROP DEFAULT;


-- MySQL CREATE INDEX Statement -- 
-- MySQL CREATE INDEX Example --

CREATE INDEX idx_lastname
ON Persons (LastName);

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);
-- DROP INDEX Statement --
ALTER TABLE table_name
DROP INDEX index_name;


-- MySQL AUTO INCREMENT Field--
-- MySQL AUTO_INCREMENT Keyword--
CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (PersonID)
);

ALTER TABLE Persons AUTO_INCREMENT=100;

INSERT INTO Persons (FirstName,LastName)
VALUES ('Lars','Monsen');



-- MySQL Working With Dates --

-- MySQL Date Data Types --
/*
O MySQL vem com os seguintes tipos de dados para armazenar uma data ou um valor de data/hora no banco de dados:
*/
-- DATE- formato AAAA-MM-DD
-- DATETIME- formato: AAAA-MM-DD HH:MI:SS
-- TIMESTAMP- formato: AAAA-MM-DD HH:MI:SS
-- YEAR- formato AAAA ou AA

ALTER TABLE Orders
ADD  OrderDate datetime;

SELECT * FROM Orders WHERE OrderDate='2008-11-11';

-- DDL:Data Definition Language--
/* 
	Data Definition Language ou linguagem de definição dos dados.
    Data Definition Language é a linguagem de definição de dados.
    Ela permite a gente trabalhar com estruturas.
    
    Nós vamos aprender basicamente três comandos dentro do DDL, que é chamado de Create alter e drop.
    Então create para criar estruturas alter para alterar estruturas é drop.
   Para eliminar estruturas vai criar um banco Create database, vai eliminar um banco drop database se
*/
-- CREATE --
/* 
o comando create o comando create, ele permite você criar objetos.
*/
-- Criar Usraio sem  prevelegio --
CREATE USER 'ibjdev'@'localhost' IDENTIFIED BY '@abcd123';
DROP USER 'ibjdev'@'localhost' ;

-- Criar Usraio com prevelegio de admin --
CREATE ROLE `Administrator`;

GRANT ALL PRIVILEGES ON testDB.* to `Administrator`;

CREATE USER 'ibjdev'@'localhost' DEFAULT ROLE  `Administrator`;

-- Alterar senha de user --
ALTER USER 'ibjdev'@'localhost' 
IDENTIFIED BY '@abcd123';


-- Outra forma de criar usuariar e dar prevelegio e acessa remota
CREATE USER 'ibjdev'@'%.%.%.%' IDENTIFIED BY '@abcd123';

GRANT `Administrator` to 'ibjdev'@'%.%.%.%';


-- MySQL Views--
-- MySQL CREATE VIEW Statement --
USE testDB;

CREATE TABLE IF NOT EXISTS Customers(
CustomersID int NOT NULL AUTO_INCREMENT,
CustomerName varchar(255),
Contact int NOT NULL,
Country varchar(50),
CONSTRAINT PK_Customers PRIMARY KEY (CustomersID)
);

INSERT INTO Customers VALUES(null,'Jose da Silva', 21000000,'Brazil');

SELECT * FROM Customers;

-- Exemplos de MySQL CREATE VIEW--

 
CREATE VIEW BrazilCustomers AS
SELECT CustomerName, Contact
FROM Customers
WHERE Country = 'Brazil';


-- SQL SECURITY DEFINER --
SELECT * FROM BrazilCustomers;


CREATE TABLE IF NOT EXISTS Products(
ProductsID int NOT NULL AUTO_INCREMENT,
ProductName varchar(255),
Price float,
CustomersID int,
PRIMARY KEY (ProductsID),
CONSTRAINT FK_CustomersID FOREIGN KEY (CustomersID) 
REFERENCES Customers(CustomersID)
);
INSERT INTO Products VALUES (null,'Notebook',1.500,'1');

-- QUER SE USE TER PREVELEGIOS PARA ENVOCAR VIEWS--
CREATE OR REPLACE
DEFINER = 'ibj'@'localhost'
SQL SECURITY INVOKER 
VIEW ProductsPrice AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
-- SQL SECURITY DEFINER-- 
SELECT * FROM ProductsPrice;

-- CREATE PROCEDURE ---

USE world;
desc city ;
DELIMITER //

CREATE PROCEDURE sp_contaCidade (in pais char(3), out cidades int)
	BEGIN 
	  SELECT COUNT(*) INTO cidades FROM world.city WHERE CountryCode = pais;
	END
//

 CALL sp_contaCidade('FRA', @cities);
 
 SELECT @cities AS total;
 //
 DELIMITER ;

-- ALTER --
USE testdb;

DESC Products;

ALTER TABLE Products
RENAME COLUMN Price TO ProductPrice;

ALTER TABLE Products
DROP COLUMN ProductPrice;

ALTER TABLE Products
ADD ProductsStatus tinyint signed not null;

ALTER TABLE Products 
ADD ProductsStatus tinyint signed not null default 1;

ALTER TABLE Products 
ADD CONSTRAINT ch_products CHECK(ProductsStatus BETWEEN 1 AND 3);

ALTER TABLE Products 
DROP CONSTRAINT ch_products;

-- DROP TABLE --
DROP TABLE IF EXISTS Products ;

DROP DATABASE IF EXISTS ibjdev;

-- DQL - Data Query Language - Linguagem de Consulta de Dados--

USE testDB;
SELECT * FROM Products ;

SELECT ProductsID AS id, ProductName AS nome FROM Products p;

SELECT p.ProductsID AS id, p.ProductName AS nome FROM testdb.Products p;

SELECT 'Testa' AS coluna_virtual;
 -- ---------------------------------------------

--  DML - Data Manipulation Language - Linguagem de Manipulação dos dados --

Desc Customers; 

-- INSERT POSICIONAL ---
INSERT INTO Customers 
VALUES (NULL,'Ibj', 66990009,'PT');

SELECT * FROM Customers;
-- INSERT DECLARATIVO --- 
INSERT INTO Customers (CustomerName, Contact, Country)
VALUES ('Issufi', 21000000, 'EUA');

-- INSERT SEM INTO--
INSERT INTO Customers (CustomerName, Contact, Country)VALUES 
('Carlos', 20000000, 'EUA'),('Mário', 22000000, 'EUA'),
('Jóse', 24000000, 'EUA'),('Badji', 25000000, 'EUA');


  -- ---------------------------------------------
 -- UPDATE Table -- 
UPDATE Customers 
SET Contact = 29000000
WHERE CustomersID = 1;

-- UPDATE Multiple Records --

UPDATE Customers 
SET Contact = 28000000, Country = 'PRT'
WHERE CustomersID = 1;

 -- ---------------------------------------------
 
 -- The MySQL DELETE Statement -- 
 
 DELETE FROM Customers WHERE CustomerName='Carlos';
  -- ---------------------------------------------
 -- The MySQL  TRUNCATE Statement 
 /* TRUNCATE É O COMANDO QUE MEXE COM ESTRUTURA DE BANCO E PAGA DADOS E ESTRUTURA DE BANCO, E REFAZ ELA  */
 
 TRUNCATE TABLE  Customers ;
  -- ---------------------------------------------
  
  -- The MySQL WHERE Clause
  
  SELECT * FROM
    Customers
WHERE
    Country = 'Mexico';
  
  
SELECT * FROM
    Customers
WHERE
    CustomersID >= 1 and CustomersID < 4 ;
    
SELECT * FROM Customers 
ORDER BY CustomerName ASC
LIMIT 3;

SELECT * FROM Customers 
ORDER BY CustomerName DESC
LIMIT 3;

 
 SELECT COUNT(CustomersID), Country
FROM Customers
GROUP BY Country;

SELECT COUNT(CustomersID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomersID) DESC;

    SELECT * FROM Customers;


-- CLÁUSULAS E OPERADORES -- 

