INSERT INTO client (IdCli, nom, ville)
VALUES ('c101', 'Durand', 'Nice'),
	('c108', 'Fabre', 'Paris'),
	('c110', 'Antonin', 'Rome'),
	('c125', 'Prosper', 'Lille');
    
INSERT INTO produit (IdPro,nom,marque,prix,qstock)
VALUES ('A153', 'auto','BMW',9000.99,5),
	('A589', 'auto', 'Peugeot',5999.99,8),
	('M158', 'moto', 'Toyota',2000.00,10),
	('V600', 'velo', 'Decathlon',250.00,20);


INSERT INTO vente (IdCli,IdPro,date,qte)
VALUES ('c101','A153','2005-01-10',1),
('c108','A589','2005-03-01',2),
('c108','A153','2006-02-10',1),
('c125','M158','2004-10-15',5),
('c125','V600','2008-06-15',10);
