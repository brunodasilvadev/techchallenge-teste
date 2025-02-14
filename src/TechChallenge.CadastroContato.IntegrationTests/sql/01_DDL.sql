IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TECHCHALLENGE_TESTESINTEGRACAO')
BEGIN
    CREATE DATABASE TECHCHALLENGE_TESTESINTEGRACAO;
    PRINT 'Banco de dados criado com sucesso.';
END

USE [TECHCHALLENGE_TESTESINTEGRACAO]

-- CREATE Tabela CODIGO_AREA_BRASIL
IF NOT EXISTS (SELECT object_id FROM  sys.objects where object_id = OBJECT_ID(N'CODIGO_AREA_BRASIL') and type = 'U')
BEGIN
    CREATE TABLE CODIGO_AREA_BRASIL (
        DDD CHAR(2) NOT NULL PRIMARY KEY,
        DSESTADO CHAR(2) NOT NULL,
        DSCIDADE NVARCHAR(100) NOT NULL,
        DSREGIAO NVARCHAR(255) NOT NULL,
        DHREGISTRO DATETIME DEFAULT GETDATE()
	);
END

-- CREATE Tabela CONTATO
IF NOT EXISTS (SELECT object_id FROM  sys.objects where object_id = OBJECT_ID(N'CONTATO') and type = 'U')
BEGIN 
    CREATE TABLE CONTATO (
        ID INT PRIMARY KEY IDENTITY(1,1),
        NMUSUARIO NVARCHAR(255) NOT NULL,
        NRDDD CHAR(2) NOT NULL,
        NRTELEFONE NVARCHAR(9) NOT NULL,
        DSEMAIL  NVARCHAR(100) NOT NULL,
        DHREGISTRO DATETIME DEFAULT GETDATE(),

        CONSTRAINT FK01_NRDDD_CODIGO_AREA_BRASIL FOREIGN KEY (NRDDD) REFERENCES CODIGO_AREA_BRASIL(DDD)
	);
END