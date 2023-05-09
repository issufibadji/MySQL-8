show databases;
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
GRANT ALL PRIVILEGES ON sakila.* to `Administrator`;

CREATE USER 'ibjdev'@'localhost' DEFAULT ROLE  `Administrator`;
