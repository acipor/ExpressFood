/* liste des commandes du client no 1 */
SELECT * FROM utilisateur ,commande WHERE (utilisateur.id=1) AND (utilisateur.categorie ='1') AND  (commande.utilisateur_id=utilisateur.id);