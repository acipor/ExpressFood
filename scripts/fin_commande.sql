/* exemple pour commande no 1 */


/* le status_livraison passe a 2 (livre) dans commande */
UPDATE `commande` SET `status_livraison`= '2' WHERE commande_id=1

/* recherche du livreur_id dans commande */
/* le status du livreur ( livreur_id ) passe a 1 status=libre */ 
UPDATE `livreur` SET `statut`= '1' WHERE (livreur_id =
(SELECT livreur_id FROM `commande` WHERE commande_id = '1' LIMIT 1));
