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
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

ALTER TABLE Persons ADD UNIQUE (ID);

-- UNIQUE Constraint on multiple columns-- 
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

ALTER TABLE Persons ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

 -- -- UNIQUE Constraint on DROP TABLE--
 ALTER TABLE Persons DROP INDEX UC_Person;