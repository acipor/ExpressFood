/* liste des livreurs avec adresse*/
/* categorie=2 */
SELECT * FROM utilisateur,adresse WHERE (categorie = '2') AND ( utilisateur.adresse_utilisateur = adresse.adresse_id);