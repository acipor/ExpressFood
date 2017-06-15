/*Création de la base de donnée avec configuration de l'encodage utilisé.*/
CREATE DATABASE expressfood CHARACTER SET 'utf8';

/*sélection de la bdd*/
USE expressfood;

/*Création des tables sous le moteur INNODB pour gérer les clefs étrangères*/


/*table adresse */
CREATE TABLE adresse
(
	adresse_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	adresse VARCHAR(40) NOT NULL,
	code_postal INT UNSIGNED NOT NULL,
	ville VARCHAR(40) NOT NULL,
	pays VARCHAR(40) NOT NULL,
	telephone VARCHAR(40) NOT NULL,
	PRIMARY KEY (adresse_id)
)	
ENGINE=INNODB;

/*table utilisateur*/
CREATE TABLE utilisateur
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nom VARCHAR(40) NOT NULL,
	prenom VARCHAR(40) NOT NULL,
	adresse_utilisateur INT UNSIGNED NOT NULL,
	pseudo VARCHAR(40) NOT NULL,
	email VARCHAR(40) NOT NULL,
	motdepasse VARCHAR(40) NOT NULL,
	categorie ENUM('client','livreur','administration') DEFAULT 'client',
	PRIMARY KEY (id),
	UNIQUE ind_email (email),
	CONSTRAINT fk_adresse_adresse_id
		FOREIGN KEY(adresse_utilisateur)
		REFERENCES adresse(adresse_id)
)	
ENGINE=INNODB;

/*table livreur*/
CREATE TABLE livreur
(
    livreur_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    utilisat_id INT UNSIGNED NOT NULL,
    statut ENUM ('libre','en livraison','indisponible','en pause') DEFAULT 'libre',
    position_latitude FLOAT NOT NULL,
    position_longitude FLOAT NOT NULL,
    PRIMARY KEY (livreur_id),
    CONSTRAINT fk_liv_uti_id
		FOREIGN KEY(utilisat_id)
		REFERENCES utilisateur(id)
)
ENGINE=INNODB;

/* table plat */
CREATE TABLE plat
(
    plat_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    date_de_creation DATE NOT NULL,
    nom_du_plat VARCHAR(40) NOT NULL,
    type_plat ENUM('plat','dessert') DEFAULT 'plat',
    prix_plat DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (plat_id)
)
ENGINE=INNODB;

/* table sac*/
CREATE TABLE sac
(
    sac_livreur_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    plat INT UNSIGNED NOT NULL,
    livreur INT UNSIGNED NOT NULL,
    quantite INT UNSIGNED NOT NULL,
    PRIMARY KEY (sac_livreur_id),	
    CONSTRAINT fk_plat_plat_id
		FOREIGN KEY(plat)
		REFERENCES plat(plat_id),
    CONSTRAINT fk_livreur_livreur_id
		FOREIGN KEY(livreur)
		REFERENCES livreur(livreur_id)	
)
ENGINE=INNODB;

/* table commande */
/*la ligne statut_paiement correspond à 0 = en cours de paiement (ou dans le panier) 1 = payé*/
CREATE TABLE commande
(
	commande_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    	utilisateur_id INT UNSIGNED NOT NULL,
	livreur_id INT UNSIGNED NOT NULL,
	date_commande DATETIME NOT NULL,
	statut_paiement INT UNSIGNED NOT NULL,
	heure_de_depart DATETIME,
	heure_estime DATETIME,
	heure_de_fin DATETIME,
	prix_commande_ttc DECIMAL(6,2),
        adresse_de_livraison INT UNSIGNED NOT NULL,
        PRIMARY KEY (commande_id),
    	CONSTRAINT fk_utilisateur_com
		FOREIGN KEY(utilisateur_id)
		REFERENCES utilisateur(id),
	CONSTRAINT fk_livreur_com
		FOREIGN KEY(livreur_id)
		REFERENCES livreur(livreur_id),
	CONSTRAINT fk_adresse_adresse_liv
		FOREIGN KEY(adresse_de_livraison)
		REFERENCES adresse(adresse_id)
)
ENGINE=INNODB;



/* table ligne_commande */
CREATE TABLE ligne_commande
(
    ligne_commande_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    commande_id INT UNSIGNED NOT NULL,
    plat_id INT UNSIGNED NOT NULL,
    quantite INT UNSIGNED NOT NULL,
    PRIMARY KEY (ligne_commande_id),
    CONSTRAINT fk_ligne_plat_id
		FOREIGN KEY(plat_id)
		REFERENCES plat(plat_id),
    CONSTRAINT fk_ligne_com_com
		FOREIGN KEY(commande_id)
		REFERENCES commande(commande_id)
)
ENGINE=INNODB;


/* jeu de données table adresse */
INSERT INTO adresse VALUES
(NULL,'5 rue Jean Jaurez', '67000', 'Strasbourg', 'France', '0688558425'),
(NULL,'13 rue Montreux', '67380', 'Lingolsheim', 'France', '0789558425'),
(NULL,'1 rue Principale', '67000', 'Strasbourg', 'France', '0618558425');


/* jeu de données table utilisateur */
INSERT INTO utilisateur VALUES
(NULL,'Dupond', 'Marc', '1', 'dupondm', 'dupond.marc@orange.fr','DpMD25','client'),
(NULL,'Reibel', 'Olivier', '2', 'reibelol', 'reibel@free.fr','reiBEL67','livreur'),
(NULL,'Cipor', 'Alexandre', '3', 'alexc', 'aexandre.cipor@gmail.com','AlexCIPp67','administration');


/* jeu de données table livreur */
INSERT INTO livreur VALUES
(NULL, '2', 'libre', '48.862725','2.287592000000018');

/* jeu de données table plat */
INSERT INTO plat VALUES
(NULL,'2017-06-14', 'pizza burger','plat','9.00'),
(NULL,'2017-06-14', 'pizza marguez','plat','9.50'),
(NULL,'2017-06-15', 'pizza calzone','plat','9.44'),
(NULL,'2017-06-15', 'pizza reine','plat','9.00'),
(NULL,'2017-06-14', 'tiramisu','dessert','3.50'),
(NULL,'2017-06-14', 'apple cumble','dessert','3.00'),
(NULL,'2017-06-15', 'brownies','dessert','2.50'),
(NULL,'2017-06-15', 'tarte aux fruits','dessert','3.50')
;

/* jeu de donnes table sac */
/* plat 1,livreur 1 , quantite 1 */
/* plat 2,livreur 1, quantite 1 */
/* plat 3,livreur 1 , quantite 1 */
/* plat 4,livreur 1, quantite 1 */
/* plat 6, livreur 1, quantite 2 */
/* plat 7, livreur 1, quantite 2 */
INSERT INTO sac VALUES
(NULL,'1', '1','1'),
(NULL,'2', '1','1'),
(NULL,'3', '1','1'),
(NULL,'4', '1','1'),
(NULL,'6', '1','2'),
(NULL,'7', '1','2')
;


