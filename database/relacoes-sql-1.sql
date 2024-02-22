-- Active: 1708632590081@@127.0.0.1@3306


-- Práticas

CREATE TABLE licenses (
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    register_number TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL
);

CREATE TABLE drivers(
    id TEXT UNIQUE PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL, FOREIGN KEY (license_id) REFERENCES licenses(id)
    -- FOREIGN KEY serve para referenciar a qual tabela ela está ligada
);


INSERT INTO licenses (id, register_number, category)
VALUES('l001', '123456', 'A'),
('l002', '876543', 'AB');

SELECT * FROM licenses;

INSERT INTO drivers (id, name, email, password, license_id)VALUES('d001', 'fulado', 'f@gmail.com', 'fulano123', 'l001'),
('d002', 'ciclano', 'c@gmail.com', 'ciclano123', 'l002');


-- SELECTS mais expecificos.
SELECT  drivers.id AS driverID, drivers.name, drivers.email, drivers.password, licenses.id AS licenseID, licenses.register_number AS registerNumber, licenses.category FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id


CREATE TABLE users (
    id TEXT PRIMARY KEY  UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES('u001', 'Jeison', 'j@gmail.com', 'ÉOJEISO1990'),
('u002', 'Akakka', 'a@gmail.com', 'asa8484');


CREATE TABLE phones(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO phones (id, phone_number, user_id)
VALUES('p001','12345','u001'),('p002','67891','u002'),('p003','11121','u001');

SELECT * FROM users;

SELECT * FROM phones;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;





-------------------------Prática---------------------------------------

--Criando tabela pais:
CREATE TABLE papais(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL
);

--Inserindo pais:
INSERT INTO papais(id, name)
VALUES('p001', 'João'), ('p002', 'Jeferson');


SELECT * FROM papais;

--Criando tabela filhos:
CREATE TABLE filhos(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    pais_id TEXT NOT NULL,
    FOREIGN KEY (pais_id) REFERENCES papais(id)
);
--Inserindo filhos:
INSERT INTO filhos(id, name, pais_id)
VALUES('f001', 'Maria', 'p001'), ('f002', 'Gerson', 'p002'), ('f003', 'Maycon', 'p002');

SELECT papais.id AS idPais, papais.name AS namePais, filhos.id AS idFilhos, filhos.name AS nameFilhos, filhos.pais_id AS idDosPais FROM filhos
INNER JOIN papais
ON filhos.pais_id = papais.id


SELECT  drivers.id AS driverID, drivers.name, drivers.email, drivers.password, licenses.id AS licenseID, licenses.register_number AS registerNumber, licenses.category FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id
