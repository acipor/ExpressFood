/* creation d'une adresse  dans table utilisateur*/
INSERT INTO adresse VALUES
(NULL,'2 Place des Halles', '67000', 'Strasbourg', 'France', '0625312245');

/* r�cup�ration de  l'id de l'adresse cr�� dans la variable numero */
SET @numero =
(SELECT adresse_id AS numero FROM adresse ORDER BY adresse_id DESC LIMIT 0,1);

/* ajout du client avec la cle externe=@numero et categorie=livreur dans table utilisateur */
INSERT INTO utilisateur VALUES
(NULL,'Tourk', 'Amin', @numero, 'Tamin', 'amint@free.fr','TaGu554ss','livreur');

/* r�cup�ration de  id utilisateur cr�� dans la variable utl */
SET @utl =
(SELECT id AS utl FROM utilisateur ORDER BY id DESC LIMIT 0,1);

/* on calcule la latitude et longitude � partir de son adresse: 2 place des halles,67000 Strasbourg*/
/*  pour cette adresse c'est latitude :48.862725 , longitude:2.287592000000018

/* ajout du livreur */
INSERT INTO livreur VALUES
(NULL, @utl , 'libre', '48.862725','2.287592000000018');
