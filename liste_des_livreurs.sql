/* liste des livreurs */
/* avec recherche de donnes sur table adresse aussi */
SELECT * FROM utilisateur,adresse WHERE (categorie = 'livreur') AND ( utilisateur.adresse_utilisateur = adresse.adresse_id);