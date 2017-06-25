/* liste des clients categorie=1 avec leur adresses*/

SELECT * FROM utilisateur,adresse WHERE (categorie = '1') AND ( utilisateur.adresse_utilisateur = adresse.adresse_id);