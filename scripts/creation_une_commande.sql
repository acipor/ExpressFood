/* creation d'une commande */
/* utilisateur 7 */
/* livreur 2 */
/* statut paiement 1 */
/* statut livraison =1 en cours de livraison */
/* adresse de livraison 4 */
INSERT INTO `commande`
 (`commande_id`, `utilisateur_id`, `livreur_id`, `date_commande`, `status_paiement`, `status_livraison`, `heure_de_depart`, `heure_de_fin`, `heure_estime`, `prix_commande_ttc`, `adresse_de_livraison`) 
VALUES (NULL, '7', '2', '2017-06-16 10:36:00', '1', '1', '2017-06-16 10:40:00', '2017-06-16 11:00:00', '2017-06-16 10:55:00', '25.50', '4');



