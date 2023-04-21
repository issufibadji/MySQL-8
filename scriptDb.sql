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
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

-- The MySQL SELECT TABLE Statement--

SELECT * FROM Persons;


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

-- MySQL Views--
-- MySQL CREATE VIEW Statement --

-- Exemplos de MySQL CREATE VIEW--

CREATE VIEW BrazilCustomers AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

SELECT * FROM Brazil_Customers;


CREATE VIEW ProductsPrice AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

SELECT * FROM ProductsPrice;







 
 