CREATE TABLE locataire
(
    num_siret INT PRIMARY KEY,
    nom VARCHAR(20),
    tel INT,
    adresse VARCHAR(30),
    cod_postal INT,
    ville VARCHAR(20)
);

CREATE TABLE bail
(
    num_bail INT PRIMARY KEY,
    loyer_fix REAL(9,2),
    dur_bail DATE,
    date_debut DATE,
    date_fin DATE,
    bareme_loyer_var INT,
    date_de_signature DATE,
    num_siret INT,

    FOREIGN KEY(num_siret) REFERENCES locataire(num_siret) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE activite
(
    id_activite INT PRIMARY KEY,
    nature_activite VARCHAR(30)
);

CREATE TABLE sous_activite
(
    num_sous_activite INT PRIMARY KEY,
    id_activite INT,
    nom_sous_activite VARCHAR(20),
    
    FOREIGN KEY(id_activite) REFERENCES activite(id_activite) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE lignes_locataires_sous_activite
(
    num_siret INT,
    num_sous_activite INT,
    date_sous_activite DATE,

    PRIMARY KEY(num_siret, num_sous_activite,date_sous_activite),
    FOREIGN KEY(num_siret) REFERENCES locataire(num_siret) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(num_sous_activite) REFERENCES sous_activite(num_sous_activite) ON DELETE CASCADE ON UPDATE CASCADE
);