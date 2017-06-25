/*Création de la base de donnée avec configuration de l'encodage utilisé.*/
CREATE DATABASE expressfood CHARACTER SET 'utf8';

/*sélection de la bdd*/
USE expressfood;

CREATE TABLE type_plat (
                type_plat_id INT AUTO_INCREMENT NOT NULL,
                type_plat VARCHAR(40) NOT NULL,
                PRIMARY KEY (type_plat_id)
)
ENGINE=INNODB;


CREATE TABLE status (
                status_id INT AUTO_INCREMENT NOT NULL,
                type_status VARCHAR(40) NOT NULL,
                PRIMARY KEY (status_id)
)
ENGINE=INNODB;


CREATE TABLE categorie (
                categorie_id INT AUTO_INCREMENT NOT NULL,
                type_utilisateur VARCHAR(40) NOT NULL,
                PRIMARY KEY (categorie_id)
)
ENGINE=INNODB;


CREATE TABLE plat (
                plat_id INT AUTO_INCREMENT NOT NULL,
                date_de_creation DATETIME NOT NULL,
                nom_du_plat VARCHAR(40) NOT NULL,
                prix_plat DECIMAL(6,2) NOT NULL,
                type_plat INT NOT NULL,
                PRIMARY KEY (plat_id)
)
ENGINE=INNODB;


CREATE TABLE adresse (
                adresse_id INT AUTO_INCREMENT NOT NULL,
                adresse VARCHAR(40) NOT NULL,
                code_postal VARCHAR(40) NOT NULL,
                ville VARCHAR(40) NOT NULL,
                pays VARCHAR(40) NOT NULL,
                telephone VARCHAR(40) NOT NULL,
                PRIMARY KEY (adresse_id)
)
ENGINE=INNODB;


CREATE TABLE utilisateur (
                id INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(40) NOT NULL,
                prenom VARCHAR(40) NOT NULL,
                categorie INT NOT NULL,
                pseudo VARCHAR(40) NOT NULL,
                email VARCHAR(40) NOT NULL,
                mot_de_passe VARCHAR(100) NOT NULL,
                adresse_utilisateur INT NOT NULL,
                PRIMARY KEY (id)
)
ENGINE=INNODB;


CREATE UNIQUE INDEX utilisateur_idx
 ON utilisateur
 ( email );

CREATE INDEX utilisateur_idx1
 ON utilisateur
 ( pseudo );

CREATE TABLE livreur (
                livreur_id INT AUTO_INCREMENT NOT NULL,
                utilisateur_id INT NOT NULL,
                position_latitude FLOAT NOT NULL,
                position_longitude FLOAT NOT NULL,
                statut INT NOT NULL,
                PRIMARY KEY (livreur_id)
)
ENGINE=INNODB;


CREATE TABLE sac (
                sac_livreur_id INT AUTO_INCREMENT NOT NULL,
                livreur INT NOT NULL,
                quantite INT NOT NULL,
                plat_id INT NOT NULL,
                PRIMARY KEY (sac_livreur_id)
)
ENGINE=INNODB;

/*statut_paiement correspond à 0 = en cours de paiement (ou dans le panier) 1 = payé*/
/* statut_livraision correspond à 0 = en attente d'un livreur 1 = en cours de livraison 2 = livré*/
CREATE TABLE commande (
                commande_id INT AUTO_INCREMENT NOT NULL,
                utilisateur_id INT NOT NULL,
                livreur_id INT NOT NULL,
                date_commande DATETIME NOT NULL,
                status_paiement BOOLEAN NOT NULL,
                status_livraison INTEGER NOT NULL, 
                heure_de_depart DATETIME NOT NULL,
                heure_de_fin DATETIME NOT NULL,
                heure_estime DATETIME NOT NULL,
                prix_commande_ttc DECIMAL(6,2) NOT NULL,
                adresse_de_livraison INT NOT NULL,
                PRIMARY KEY (commande_id)
)
ENGINE=INNODB;

ALTER TABLE commande MODIFY COLUMN status_paiement BOOLEAN COMMENT '0 OU 1';


CREATE TABLE ligne_commande (
                ligne_commande_id INT AUTO_INCREMENT NOT NULL,
                commande_id INT NOT NULL,
                plat_id INT NOT NULL,
                quantite INT NOT NULL,
                PRIMARY KEY (ligne_commande_id, commande_id)
)
ENGINE=INNODB;


ALTER TABLE plat ADD CONSTRAINT type_plat_plat_fk
FOREIGN KEY (type_plat)
REFERENCES type_plat (type_plat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE livreur ADD CONSTRAINT status_livreur_fk
FOREIGN KEY (statut)
REFERENCES status (status_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE utilisateur ADD CONSTRAINT categorie_utilisateur_fk
FOREIGN KEY (categorie)
REFERENCES categorie (categorie_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ligne_commande ADD CONSTRAINT plat_ligne_commande_fk
FOREIGN KEY (plat_id)
REFERENCES plat (plat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE sac ADD CONSTRAINT plat_sac_fk
FOREIGN KEY (plat_id)
REFERENCES plat (plat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE utilisateur ADD CONSTRAINT adresse_utilisateur_fk
FOREIGN KEY (adresse_utilisateur)
REFERENCES adresse (adresse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT adresse_commande_fk
FOREIGN KEY (adresse_de_livraison)
REFERENCES adresse (adresse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT utilisateur_commande_fk
FOREIGN KEY (utilisateur_id)
REFERENCES utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE livreur ADD CONSTRAINT utilisateur_livreur_fk
FOREIGN KEY (utilisateur_id)
REFERENCES utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT livreur_commande_fk
FOREIGN KEY (livreur_id)
REFERENCES livreur (livreur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE sac ADD CONSTRAINT livreur_sac_fk
FOREIGN KEY (livreur)
REFERENCES livreur (livreur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ligne_commande ADD CONSTRAINT commande_ligne_commande_fk
FOREIGN KEY (commande_id)
REFERENCES commande (commande_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


