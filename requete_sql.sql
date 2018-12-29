INSERT INTO pizzeria
(
	id, nom, numero_telephone, email, rue, code_postal, ville
)
VALUES
(
	1, 'La Royale', '0494123456', 'test@gmail.com', 'Rue du test', 83110, 'Sanary-sur-mer'
)


INSERT INTO reseau_social
(
	id,plateforme,lien,pizzeria_id
)
VALUES

	(1,'Facebook','Facebook/lienPizzeria.fr',1),
	
	(2,'Twitter', 'Twitter/comptePizzeria.com',1);


INSERT INTO niveau_acces
(
	niveau, libelle
)
VALUES
	(1, 'Client'),
	(2, 'Employé'),
	(3, 'Manager'),
	(4, 'Directeur');



INSERT INTO compte
(
	id, niveau_acces, email, mot_de_passe, nom, prenom , numero_telephone, rue, code_postal, ville
)
VALUES
(1, 1, 'el-rambo-poto@hotmail.fr', 'passe17', 'ROCHE', 'Yoann', '0605097496', '401F chemin de la bergerie', 83110, 'Sanary-sur-mer'),
		(2, 4, 'directeur@gmail.com', 'passe1808', 'HAMMONET', 'Alice', '0645076034', 'Rue test', 83110, 'Sanary-sur-mer'),
	(3, 3, 'ManagerTom@hotmail.fr', 'passedemot', 'DAMMER', 'Tom', '0634569456', 'Rue des collines', 83110, 'Sanary-sur-mer'),
	(4, 3, 'ManagerFranck@gmail.com', '12345', 'BAUFROI', 'Franck', '0644653412', '356 chemin du test', 83113, 'Bandol'),
	(5, 2, 'EmployéJo@gmail.fr', 'AZERTY', 'NAVA', 'Joris', '0784957352', 'Rue de labbé', 83452, 'Beausset'),
	(6, 2, 'EmployéFlo@gmail.fr', 'flob', 'BERNDARD', 'Florian', '069403827', 'Impasse Jacques tisseyre', 83110, 'Sanary-sur-mer'),
	(7, 1, 'Patrick83@aol.com', 'QWERTY', 'DELANO', 'Patrick', '0494567346', 'Chemin du puit', 83245, 'Ollioules'),
	(8, 1, 'PierreR@gmail.com', 'PASSE43', 'POCHE', 'Pierre', '0608390465', '118 Le mortier', 83110, 'Sanary-sur-mer');
	


INSERT INTO employe
(
	id, numero_matricule, pizzeria_id, compte_id
)
VALUES
	(1, 234, 1, 2),
	(2, 746, 1, 3),
	(3, 932, 1, 4),
	(4, 124, 1, 5),
    (5, 239, 1, 6);



INSERT INTO client
(
	id, adresse_livraison, pizzeria_id, compte_id
)
VALUES
	(1, '401F chemin de la bergerie', 1, 1),
	(2, 'Chemin du puit', 1, 7),
	(3, 'Rue des pins', 1, 8);



INSERT INTO article
(
	id, code_ean13, reference, nom, designation, prix_unitaire_ht, prix_ttc
)
VALUES
	(1, 2346785, 'CO-003', 'Coca-Cola', 'Bouteille de Coca-Cola 1L', 2.82, 3),
	(2, 6432467, 'VR-436', 'Vin rouge', 'Bouteille de vin rouge 0.75L', 3.18, 3.5),
	(4, 0200135, 'SP-352', 'Sprite', 'Bouteille de sprite 1L', 2.82, 3),
	(12, 5332467, 'PR-056', 'Royale', 'Pizza royale, jambom, champignons, emmental', 11.3, 13),
	(16, 2346178, 'PL-532', 'Lune de miel', 'Pizza lune de miel, chèvre, miel, emmental', 12.35, 14),
	(25, 3467243, 'GB-094', 'Glace brownie', 'Glace brownie fudge 150ML', 3.33, 4),
	(26, 3456257, 'GC-121', 'Glace cookie', 'Glace cookie dough 150ML', 3.33, 4);




INSERT INTO statut_commande
(
	id, statut
)
VALUES
	(1, 'Commande à préparer'),
	(2, 'Commande préparer'),
	(3, 'Commande à livrer'),
	(4, 'Commande livrer');




INSERT INTO commande
(
	id, numero_commande, statut_commande_id, pizzeria_id
)
VALUES
	(1, 453, 1, 1),
	(2, 345, 3, 1)



INSERT INTO famille_de_produit
(
	id,designation
)
VALUES
	(1,'Composant pizza'),
	(2,'Boissons'),
	(3,'Glace');




INSERT INTO ingredient
(
	id, nom, reference
)
VALUES

	(1, 'Tomate', 'to'),
	(2, 'Olive noire', 'on'),
	(3, 'Mozzarella', 'mo'),
	(4, 'Champignons', 'ch'),
	(5, 'Oignon', 'og');




INSERT INTO recette
(
	id, nom, recette, article_id
)
VALUES
(
	1, 'Pizza Royale', 'Nappez généreusement avec la sauce tomate (sans en mettre sur les bords), saupoudrez d origan, puis ajoutez les dés de jambon, des tranches de mozzarella, des tranches de champignons et les olives noires.' , 12
)



INSERT INTO ligne_de_commande
(
	id, designation, prix_ht, prix_ttc, quantite, commande_id, article_id
)
VALUES
	(1, 'Royale', 11.3, 13, 1, 1, 12),
	(2, 'Lune de miel', 12.35, 14, 1, 1, 16),
	(3, 'Glace brownie', 3.33, 4, 1, 1, 25),
	(4, 'Royale', 33.9, 39, 3, 2, 12),
	(5, 'Vin rouge', 3.18, 3.50, 1, 2, 2),
	(6, 'Glace cookie', 9.99, 12, 3, 2, 26);




INSERT INTO stock
(
	id, ingredient_id, article_id, quantite, conditionnement, date_reception, date_peremption, pizzeria_id, famille_de_produit_id
)
VALUES
	(1, 1, null, 20, 'Chambre froide', '07/12/2018 08:23:46','10/12/2018 12:00:00', 1, 1),
	(2, null, 1, 30, 'Chambre froide', '05/12/2018 08:23:46','01/10/2019 12:00:00', 1, 2),
	(3, 2, null, 200, 'Chambre froide', '03/12/2018 08:23:46','03/02/2019 12:00:00', 1, 1);





INSERT INTO facture
(
	numero_facture, numero_siren, numero_tva_entreprise, prix_ht, prix_ttc, date, rue, code_postal, ville, commande_id
)
VALUES
	(2345623, 334455667, 123456789, 26.98, 31, '2018-09-12 15:28:32', 'Rue du test', 83110, 'Sanary-sur-mer', 1),
	(2345692, 334455667, 123456789, 47.07, 54.5, '2018-08-12 15:28:32', 'Rue du test', 83110, 'Sanary-sur-mer', 2);



INSERT INTO composition_recette
(
	id,ingredient_id, recette_id, quantite,unite
)
VALUES
	(1,3, 1, 125,'gr'),
	(2,5, 1,1,'unités'),
	(3,2, 1, 10,'gr'),
	(4,1, 1, 1,'unités'),
	(5,4, 1, 125,'gr');






		
	

