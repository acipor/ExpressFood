/* liste des clients */
/* avec recherche de donnes sur table adresse aussi */
SELECT * FROM utilisateur,adresse WHERE (categorie = 'client') AND ( utilisateur.adresse_utilisateur = adresse.adresse_id);