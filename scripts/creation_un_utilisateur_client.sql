/* creation d'une adresse dans table adresse */
INSERT INTO adresse VALUES
(NULL,'5 place de la République', '67000', 'Strasbourg', 'France', '0388202244');

/* récupération de  l'id de l'adresse créé dans la variable numero */
SET @numero =
(SELECT adresse_id AS numero FROM adresse ORDER BY adresse_id DESC LIMIT 0,1);

/* ajout du client avec la cle externe=@numero et categorie=1 (client) dans table utilisateur*/
/* crypter le mot de passe  avec MD5+SALT */
/* salt = "@|-°+==00001ddQ" */ 
INSERT INTO utilisateur VALUES
(NULL,'Chatin', 'Alain','1' , 'chatinal', 'chatin@orange.fr',MD5(CONCAT('@|-°+==00001ddQ','Chat2215ss')),@numero);