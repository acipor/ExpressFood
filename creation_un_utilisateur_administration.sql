/* creation d'une adresse */
INSERT INTO adresse VALUES
(NULL,'1 rue de la Lib�lule', '67260', 'Eckbolsheim', 'France', '0390203010');

/* r�cup�ration de  l'id de l'adresse cr�� dans la variable numero */
SET @numero =
(SELECT adresse_id AS numero FROM adresse ORDER BY adresse_id DESC LIMIT 0,1);

/* ajout du client avec la cle externe=@numero et categorie=administration */
INSERT INTO utilisateur VALUES
(NULL,'Beck', 'Vincent', @numero, 'beck', 'beck.v@ofree.fr','BckVin15','administration');