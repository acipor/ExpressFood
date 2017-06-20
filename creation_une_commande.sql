/* creation d'une commande */
/* utilisateur 4 */
/* livreur 2 */
/* commande payée 1 */
/* adresse de livraison 4 */

INSERT INTO `commande` 
(`commande_id`, `utilisateur_id`, `livreur_id`, `date_commande`, `statut_paiement`, `heure_de_depart`, `heure_estime`, `heure_de_fin`, `prix_commande_ttc`, `adresse_de_livraison`)
VALUES
(NULL, '4', '2', '2017-06-13 14:20:00', '1', '2017-06-13 14:25:00', '2017-06-13 14:45:00', '2017-06-15 14:44:00', '20.20', '4');
