CREATE TABLE client
(
IdCli CHAR(4) PRIMARY KEY ,
nom CHAR(20) ,
ville CHAR(30)
CHECK (ville IN ('Nice', 'Paris', 'Rome','Lille') )
);
CREATE TABLE produit
(
IdPro CHAR(6) PRIMARY KEY ,
nom CHAR(30) NOT NULL,
marque CHAR(30) ,
prix REAL(6,2) ,
qstock SMALLINT
);

CREATE TABLE vente
(
IdCli CHAR(4) NOT NULL,
IdPro CHAR(6) NOT NULL ,
date DATE NOT NULL ,
qte SMALLINT
CHECK (qte BETWEEN 1 AND 10) ,
-- contrainte de table
PRIMARY KEY (IdCli, IdPro, date) ,
FOREIGN KEY (IdCli) REFERENCES client(IdCli)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (IdPro) REFERENCES produit(IdPro)  
ON DELETE CASCADE
ON UPDATE CASCADE);