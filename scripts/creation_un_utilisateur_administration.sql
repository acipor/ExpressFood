/* creation d'une adresse dans table adresse*/
INSERT INTO adresse VALUES
(NULL,'1 rue de la Libélule', '67260', 'Eckbolsheim', 'France', '0390203010');

/* récupération de  l'id de l'adresse créé dans la variable numero */
SET @numero =
(SELECT adresse_id AS numero FROM adresse ORDER BY adresse_id DESC LIMIT 0,1);

/* ajout du client avec la cle externe=@numero et categorie=3 (administration) dans table utilisateur*/
/* crypter le mot de passe  avec MD5+SALT */
/* salt = "@|-°+==00001ddQ" */ 
INSERT INTO utilisateur VALUES
(NULL,'Beck', 'Vincent','3' , 'beck', 'beck.v@ofree.fr',MD5(CONCAT('@|-°+==00001ddQ','BckVin15')),@numero);