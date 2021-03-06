CREATE TABLE client
(
IdCli VARCHAR(5) PRIMARY KEY ,
nom VARCHAR(20) ,
ville VARCHAR(30)
CHECK (ville IN ('Nice', 'Paris', 'Rome','Lille'))
);

CREATE TABLE produit
(
IdPro VARCHAR(6) PRIMARY KEY ,
nom VARCHAR(30) NOT NULL,
marque VARCHAR(30) ,
prix REAL(6,2),
qstock SMALLINT
);

CREATE TABLE vente
(
IdCli VARCHAR(5) NOT NULL,

IdPro VARCHAR(6) NOT NULL ,
date_v DATE NOT NULL ,
qte SMALLINT,
// contrainte de table
PRIMARY KEY (IdCli, IdPro,date_v),
FOREIGN KEY (IdCli) REFERENCES client(IdCli)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (IdPro) REFERENCES produit(IdPro)
ON DELETE CASCADE ON UPDATE CASCADE
);