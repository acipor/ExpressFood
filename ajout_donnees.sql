/*------------------------------------------------------------------------*/
/*-------------------------------------- données -------------------------*/
/*------------------------------------------------------------------------*/
/* insertion 3 lignes de données table  adresse */
INSERT INTO `adresse` 
(`adresse`, `code_postal`, `ville`, `pays`, `telephone`)
 VALUES ('5 rue Jean Jaurez', '67000', 'Strasbourg', 'France', '0688558425');

INSERT INTO `adresse` 
(`adresse`, `code_postal`, `ville`, `pays`, `telephone`)
 VALUES ('13 rue Montreux', '67380', 'Lingolsheim', 'France', '0789558425');

INSERT INTO `adresse` 
(`adresse`, `code_postal`, `ville`, `pays`, `telephone`)
 VALUES ('1 rue Principale', '67000', 'Strasbourg', 'France', '0618558425');

/* insertion données table catégorie */
INSERT INTO `categorie` (`type_utilisateur`) VALUES ('client');
INSERT INTO `categorie` (`type_utilisateur`) VALUES ('livreur');
INSERT INTO `categorie` (`type_utilisateur`) VALUES ('administration');

/* insertion données table catégorie */
INSERT INTO `status` (`status_id`, `type_status`) VALUES (NULL, 'libre');
INSERT INTO `status` (`status_id`, `type_status`) VALUES (NULL, 'en livraison');
INSERT INTO `status` (`status_id`, `type_status`) VALUES (NULL, 'indisponible');
INSERT INTO `status` (`status_id`, `type_status`) VALUES (NULL, 'en pause');

/* insertion données table type_plat */
INSERT INTO `type_plat` (`type_plat_id`, `type_plat`) VALUES (NULL, 'plat');
INSERT INTO `type_plat` (`type_plat_id`, `type_plat`) VALUES (NULL, 'dessert');

/* jeu de données table utilisateur */
/* crypter le mot de passe  avec MD5+SALT */
/* salt = "@|-°+==00001ddQ" */ 
INSERT INTO utilisateur VALUES
(NULL,'Dupond', 'Marc', '1', 'dupondm', 'dupond.marc@orange.fr',MD5(CONCAT('@|-°+==00001ddQ','DpMD25')),'1'),
(NULL,'Reibel', 'Olivier', '2', 'reibelol', 'reibel@free.fr',MD5(CONCAT('@|-°+==00001ddQ','reiBEL67')),'2'),
(NULL,'Cipor', 'Alexandre', '3', 'alexc', 'aexandre.cipor@gmail.com',MD5(CONCAT('@|-°+==00001ddQ','AlexCIPp67')),'3');

/* jeu de données table livreur */
INSERT INTO `livreur` 
(`livreur_id`, `utilisateur_id`, `position_latitude`, `position_longitude`, `statut`) 
VALUES 
(NULL, '2', '48.862725', '2.287592000000018', '1');

/* jeu de données table plat */
INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-14 06:15:15', 'pizza burger', '9.00', '1');

INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-14 06:15:15', 'pizza merguez', '9.50', '1');

INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-14 06:15:15', 'tiramisu', '3.50', '2');

INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-14 06:15:15', 'apple crumble', '3.00', '2');

INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-15 06:45:15', 'pizza calzone', '9.44', '1');

INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-15 06:45:15', 'pizza reine', '9.00', '1');

INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-15 06:45:15', 'brownies', '2.50', '2');

INSERT INTO `plat` (`plat_id`, `date_de_creation`, `nom_du_plat`, `prix_plat`, `type_plat`) 
VALUES (NULL, '2017-06-15 06:45:15', 'tarte au fruit', '9.00', '2');

/* jeu de donnes table sac */
/* livreur 1 , quantite 1, plat id 1 */
INSERT INTO `sac` (`sac_livreur_id`, `livreur`, `quantite`, `plat_id`) VALUES (NULL, '1', '1', '1');
/* livreur 1 , quantite 1, plat id 2 */
INSERT INTO `sac` (`sac_livreur_id`, `livreur`, `quantite`, `plat_id`) VALUES (NULL, '1', '1', '2');
/* livreur 1 , quantite 1, plat id 3 */
INSERT INTO `sac` (`sac_livreur_id`, `livreur`, `quantite`, `plat_id`) VALUES (NULL, '1', '1', '3');
/* livreur 1 , quantite 1, plat id 4 */
INSERT INTO `sac` (`sac_livreur_id`, `livreur`, `quantite`, `plat_id`) VALUES (NULL, '1', '1', '4');
/* livreur 1 , quantite 2, plat id 6 */
INSERT INTO `sac` (`sac_livreur_id`, `livreur`, `quantite`, `plat_id`) VALUES (NULL, '1', '2', '6');
/* livreur 1 , quantite 2, plat id 7 */
INSERT INTO `sac` (`sac_livreur_id`, `livreur`, `quantite`, `plat_id`) VALUES (NULL, '1', '2', '7');

/* jeu de donnes table commande */
INSERT INTO `commande`
 (`commande_id`, `utilisateur_id`, `livreur_id`, `date_commande`, `status_paiement`, `heure_de_depart`, `heure_de_fin`, `heure_estime`, `prix_commande_ttc`, `adresse_de_livraison`) 
VALUES (NULL, '1', '1', '2017-06-16 10:36:00', '1', '2017-06-16 10:40:00', '2017-06-16 11:00:00', '2017-06-16 10:55:00', '25.50', '1');

/* jeu de donnes table ligne_commande */
INSERT INTO `ligne_commande` (`ligne_commande_id`, `commande_id`, `plat_id`, `quantite`) 
VALUES (NULL, '1', '1', '2');
INSERT INTO `ligne_commande` (`ligne_commande_id`, `commande_id`, `plat_id`, `quantite`) 
VALUES (NULL, '1', '6', '1');







