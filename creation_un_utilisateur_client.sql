/* creation d'une adresse */
INSERT INTO adresse VALUES
(NULL,'5 place de la R�publique', '67000', 'Strasbourg', 'France', '0388202244');

/* r�cup�ration de  l'id de l'adresse cr�� dans la variable numero */
SET @numero =
(SELECT adresse_id AS numero FROM adresse ORDER BY adresse_id DESC LIMIT 0,1);

/* ajout du client avec la cle externe=@numero et categorie=client */
INSERT INTO utilisateur VALUES
(NULL,'Chatin', 'Alain', @numero, 'chatinal', 'chatin@orange.fr','Chat2215ss','client');