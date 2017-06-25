/* creation d'une adresse  dans table adresse*/
INSERT INTO adresse VALUES
(NULL,'2 Place des Halles', '67000', 'Strasbourg', 'France', '0625312245');

/* récupération de  l'id de l'adresse créé dans la variable numero */
SET @numero =(SELECT adresse_id AS numero FROM adresse ORDER BY adresse_id DESC LIMIT 0,1);

/* ajout du client avec la cle externe=@numero et categorie=2 (livreur) dans table utilisateur */
/* crypter le mot de passe  avec MD5+SALT */
/* salt = "@|-°+==00001ddQ" */ 
INSERT INTO utilisateur VALUES
(NULL,'Tourk', 'Amin','2' , 'Tamin', 'amint@free.fr',MD5(CONCAT('@|-°+==00001ddQ','TaGu554ss')),@numero);

/* récupération de  id utilisateur créé dans la variable utl  de la table utilisateur*/
SET @utl =
(SELECT id AS utl FROM utilisateur ORDER BY id DESC LIMIT 0,1);

/*  on calcule sa position: par exemple latitude :48.862725 , longitude:2.287592000000018
/* statut=1 libre */
/* ajout du livreur statut libre dans table livreur*/
INSERT INTO livreur VALUES
(NULL, @utl , '48.862725','2.287592000000018','1');
