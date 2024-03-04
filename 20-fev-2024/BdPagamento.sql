CREATE DATABASE BdPagamento
USE BdPagamento

CREATE TABLE tblPessoa(
cod_pessoa INT PRIMARY KEY,
nome VARCHAR(20) NOT NULL,
endereco VARCHAR(50) NOT NULL,
bairro VARCHAR(20) NOT NULL,
cidade VARCHAR(20) NOT NULL,
estado CHAR(2) NOT NULL,
cep CHAR(8) NOT NULL
)

CREATE INDEX xPessoa ON tblPessoa (cod_pessoa)

CREATE TABLE tblPagamento(
cod_pagamento INT PRIMARY KEY IDENTITY,
cod_pessoa INT FOREIGN KEY
	REFERENCES tblPessoa (cod_pessoa),
qtde_hora INT NOT NULL,
val_hora INT NOT NULL,
salario DECIMAL(10, 2)
)

CREATE INDEX xPagamento ON tblPagamento (cod_pagamento, cod_pessoa)

INSERT INTO tblPessoa (cod_pessoa, nome, endereco, bairro, cidade, estado, cep) VALUES
	(1, 'Clara Rodriguez', 'Rua das Acácias, 123', 'Jardim Primavera', 'São Paulo', 'SP', '01234567'),
	(2, 'Liam Gallagher', 'Avenida das Palmeiras, 456', 'Centro', 'Rio de Janeiro', 'RJ', '04567890'),
	(3, 'Sofia Chang', 'Travessa das Mangueiras, 789', 'Lagoa Azul', 'Salvador', 'BA', '02345678'),
	(4, 'Ethan Patel', 'Alameda dos Ipês, 987', 'Flores do Campo', 'Belo Horizonte', 'MG', '05678901')
SELECT * FROM tblPessoa
SELECT * FROM tblPagamento

GO
CREATE PROCEDURE uspCadastroPessoa
	@cod INT,
	@nome VARCHAR(20),
	@endereco VARCHAR(50),
	@bairro VARCHAR(20),
	@cidade VARCHAR(20),
	@estado VARCHAR(20),
	@cep CHAR(8)
AS
	INSERT INTO tblPessoa (cod_pessoa, nome, endereco, bairro, cidade, estado, cep) VALUES (@cod, @nome, @endereco, @bairro, @cidade, @estado, @cep)
GO

GO
CREATE PROCEDURE uspAlterarPessoa
	@cod INT,
	@nome VARCHAR(20),
	@endereco VARCHAR(50),
	@bairro VARCHAR(20),
	@cidade VARCHAR(20),
	@estado VARCHAR(20),
	@cep CHAR(8)
AS
	UPDATE tblPessoa SET nome = @nome WHERE cod_pessoa = @cod
	UPDATE tblPessoa SET endereco = @endereco WHERE cod_pessoa = @cod
	UPDATE tblPessoa SET bairro = @bairro WHERE cod_pessoa = @cod
	UPDATE tblPessoa SET cidade = @cidade WHERE cod_pessoa = @cod
	UPDATE tblPessoa SET estado = @estado WHERE cod_pessoa = @cod
	UPDATE tblPessoa SET cep = @cep WHERE cod_pessoa = @cod
GO

GO
CREATE PROCEDURE uspDeletarPessoa
	@cod INT
AS
	DELETE tblPessoa WHERE cod_pessoa = @cod
GO

GO
CREATE PROCEDURE uspCadastroPagamento
	@cod_pessoa INT,
	@qtde_hora INT,
	@val_hora INT,
	@salario DECIMAL (10, 2)
AS
	INSERT INTO tblPagamento(cod_pessoa, qtde_hora, val_hora, salario) VALUES (@cod_pessoa, @qtde_hora, @val_hora, @salario)
GO