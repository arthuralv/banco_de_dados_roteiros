CREATE TABLE Segurado(
	nome VARCHAR(40) NOT NULL,
	cpf CHAR(11),
	telefone INT,
);

ALTER TABLE Segurado ADD PRIMARY KEY (cpf);

CREATE TABLE Automovel(
	chassi INT,
	placa VARCHAR(10),
	marca VARCHAR(15),
	modelo VARCHAR(20),
	nome_dono VARCHAR(40),
	cpf_dono CHAR(11) NOT NULL,
	FOREIGN KEY (cpf_dono) REFERENCES Segurado(cpf_dono)
);

ALTER TABLE Automovel ADD PRIMARY KEY (chassi);



CREATE TABLE Perito(
	nome VARCHAR(40) NOT NULL,
	cpf VARCHAR(11),
	telefone INT,
	PRIMARY KEY (cpf)
);

CREATE TABLE Seguro(
	seguroId INT,
	chassi INT NOT NULL,
	cpf VARCHAR(11),
	PRIMARY KEY (seguroId),
	FOREIGN KEY (chassi) REFERENCES Automovel(chassi),
	FOREIGN KEY (cpf) REFERENCES Segurado(cpf)
);

CREATE TABLE Sinistro(
	sinistroId SERIAL,
	seguroId INT NOT NULL,
	chassi INT NOT NULL,
	descricao VARCHAR(200),
	PRIMARY KEY (sinistroId),
	FOREIGN KEY (seguroId) REFERENCES Seguro(seguroId)
);

CREATE TABLE Oficina(
	nome VARCHAR(20),
	cnpj CHAR(14),
	PRIMARY KEY (cnpj)
);

CREATE TABLE Reparo(
	reparoId SERIAL,
	seguroId INT NOT NULL,
	cnpj_oficina CHAR (14),
	descricao VARCHAR(200),
	PRIMARY KEY (reparoId),
	FOREIGN KEY (cnpj_oficina) REFERENCES Oficina(cnpj),
	FOREIGN KEY (seguroId) REFERENCES Seguro(seguroId)
);