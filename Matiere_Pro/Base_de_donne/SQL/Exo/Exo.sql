//01:
ALTER TABLE `produit`
MODIFY `prix` REAL(10,2);

//02:
INSERT INTO `client` (IdCli, nom, ville)
VALUES ('C500', 'EPNAK', 'Roubaix');
//ou
INSERT INTO `produit` (IdPro,nom,marque,prix,qstock)
VALUES ('A154', 'auto','opel',7000.99,3);

//03:
UPDATE `produit`
SET prix = prix * 1.2
WHERE produit.nom = 'auto';

//04:
DELETE FROM `client` WHERE ville = 'Rome';

//05:
SELECT DISTINCT nom FROM `produit` P, `vente` V
WHERE P.IdPro = V.IdPro;

//06:
SELECT * FROM `produit` WHERE 5000 < prix AND prix < 12000;
//ou
SELECT * FROM `produit` WHERE prix BETWEEN 5000 AND 12000;

//07:
SELECT * FROM `produit` 
WHERE marque = 'decathlon' OR marque = 'toyota' OR marque = 'opel';
//ou
SELECT * FROM `produit` WHERE marque IN ('Decathlon', 'Toyota', 'Opel');

//08:
SELECT * FROM `produit` WHERE prix IS NULL;

//09:
SELECT * FROM `produit` WHERE marque = 'BMW' AND prix < 12000;

//10:
SELECT P.IdPro, P.nom, P.marque FROM produit P, vente V WHERE V.IdPro = P.IdPro;
//ou
SELECT produit.IdPro, nom, marque FROM `produit` INNER 
JOIN `vente` ON produit.IdPro = vente.IdPro;

//11:
SELECT DISTINCT C.nom FROM `client` C INNER 
JOIN `vente` V ON C.IdCli = V.IdCli 
JOIN `produit` P ON V.IdPro = P.IdPro AND P.marque = 'BMW';
//ou
SELECT DISTINCT C.nom FROM `client` C, `vente` V, `produit` P 
WHERE C.IdCli = V.IdCli AND V.IdPro = P.IdPro AND P.marque = 'BMW';

//12:
SELECT COUNT(nom) FROM `client`;

//13:
SELECT SUM(qte) FROM `vente` V, `produit` P 
WHERE V.IdPro = P.IdPro AND P.nom = 'velo'; 

//14:
SELECT IdPro, SUM(qte) FROM `vente` GROUP BY IdPro;