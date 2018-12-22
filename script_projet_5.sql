
CREATE SEQUENCE public.famille_de_produit_id_seq;

CREATE TABLE public.famille_de_produit (
                id INTEGER NOT NULL DEFAULT nextval('public.famille_de_produit_id_seq'),
                designation VARCHAR NOT NULL,
                CONSTRAINT famille_de_produit_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.famille_de_produit_id_seq OWNED BY public.famille_de_produit.id;

CREATE SEQUENCE public.ingredient_id_seq;

CREATE TABLE public.ingredient (
                id INTEGER NOT NULL DEFAULT nextval('public.ingredient_id_seq'),
                nom VARCHAR NOT NULL,
                reference VARCHAR(200) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;

CREATE SEQUENCE public.article_id_seq;

CREATE TABLE public.article (
                id INTEGER NOT NULL DEFAULT nextval('public.article_id_seq'),
                code_ean13 INTEGER NOT NULL,
                reference VARCHAR(200) NOT NULL,
                nom VARCHAR NOT NULL,
                designation VARCHAR(200) NOT NULL,
                prix_unitaire_ht NUMERIC(10,2) NOT NULL,
                prix_ttc NUMERIC(10,2) NOT NULL,
                CONSTRAINT article_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;

CREATE SEQUENCE public.recette_id_seq;

CREATE TABLE public.recette (
                id INTEGER NOT NULL DEFAULT nextval('public.recette_id_seq'),
                nom VARCHAR NOT NULL,
                recette VARCHAR(500) NOT NULL,
                article_id INTEGER NOT NULL,
                CONSTRAINT recette_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.recette_id_seq OWNED BY public.recette.id;

CREATE SEQUENCE public.composition_recette_id_seq;

CREATE TABLE public.composition_recette (
                id INTEGER NOT NULL DEFAULT nextval('public.composition_recette_id_seq'),
                ingredient_id INTEGER NOT NULL,
                recette_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                unite VARCHAR(10) NOT NULL,
                CONSTRAINT composition_recette_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.composition_recette_id_seq OWNED BY public.composition_recette.id;

CREATE SEQUENCE public.statut_commande_id_seq;

CREATE TABLE public.statut_commande (
                id INTEGER NOT NULL DEFAULT nextval('public.statut_commande_id_seq'),
                statut VARCHAR(200) NOT NULL,
                CONSTRAINT statut_commande_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.statut_commande_id_seq OWNED BY public.statut_commande.id;

CREATE TABLE public.niveau_acces (
                niveau INTEGER NOT NULL,
                libelle VARCHAR(250) NOT NULL,
                CONSTRAINT niveau_acces_pk PRIMARY KEY (niveau)
);


CREATE SEQUENCE public.compte_id_seq;

CREATE TABLE public.compte (
                id INTEGER NOT NULL DEFAULT nextval('public.compte_id_seq'),
                niveau_acces INTEGER NOT NULL,
                email VARCHAR(200) NOT NULL,
                mot_de_passe VARCHAR(200) NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                numero_telephone VARCHAR(50) NOT NULL,
                rue VARCHAR(200) NOT NULL,
                code_postal INTEGER NOT NULL,
                ville VARCHAR(100) NOT NULL,
                CONSTRAINT compte_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.compte_id_seq OWNED BY public.compte.id;

CREATE SEQUENCE public.pizzeria_id_seq;

CREATE TABLE public.pizzeria (
                id INTEGER NOT NULL DEFAULT nextval('public.pizzeria_id_seq'),
                nom VARCHAR NOT NULL,
                numero_telephone VARCHAR(50) NOT NULL,
                email VARCHAR(100) NOT NULL,
                rue VARCHAR(200) NOT NULL,
                code_postal INTEGER NOT NULL,
                ville VARCHAR(100) NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizzeria_id_seq OWNED BY public.pizzeria.id;

CREATE SEQUENCE public.reseau_social_id_seq;

CREATE TABLE public.reseau_social (
                id INTEGER NOT NULL DEFAULT nextval('public.reseau_social_id_seq'),
                plateforme VARCHAR(200) NOT NULL,
                lien VARCHAR(200) NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT reseau_social_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.reseau_social_id_seq OWNED BY public.reseau_social.id;

CREATE SEQUENCE public.client_id_seq;

CREATE TABLE public.client (
                id INTEGER NOT NULL DEFAULT nextval('public.client_id_seq'),
                adresse_livraison VARCHAR(300) NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                compte_id INTEGER NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;

CREATE SEQUENCE public.stock_id_seq;

CREATE TABLE public.stock (
                id INTEGER NOT NULL DEFAULT nextval('public.stock_id_seq'),
                ingredient_id INTEGER,
                article_id INTEGER,
                quantite INTEGER NOT NULL,
                conditionnement VARCHAR(100) NOT NULL,
                date_reception DATE NOT NULL,
                date_peremption VARCHAR NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                famille_de_produit_id INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;

CREATE SEQUENCE public.commande_id_seq;

CREATE TABLE public.commande (
                id INTEGER NOT NULL DEFAULT nextval('public.commande_id_seq'),
                numero_commande INTEGER NOT NULL,
                statut_commande_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;

CREATE SEQUENCE public.ligne_de_commande_id_seq;

CREATE TABLE public.ligne_de_commande (
                id INTEGER NOT NULL DEFAULT nextval('public.ligne_de_commande_id_seq'),
                designation VARCHAR(200) NOT NULL,
                prix_ht NUMERIC(10,2) NOT NULL,
                prix_ttc NUMERIC(10,2) NOT NULL,
                quantite INTEGER NOT NULL,
                commande_id INTEGER NOT NULL,
                article_id INTEGER NOT NULL,
                CONSTRAINT ligne_de_commande_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ligne_de_commande_id_seq OWNED BY public.ligne_de_commande.id;

CREATE TABLE public.facture (
                numero_facture INTEGER NOT NULL,
                numero_siren INTEGER NOT NULL,
                numero_tva_entreprise INTEGER NOT NULL,
                prix_ht NUMERIC(10,2) NOT NULL,
                prix_ttc NUMERIC(10,2) NOT NULL,
                date DATE NOT NULL,
                rue VARCHAR(200) NOT NULL,
                code_postal INTEGER NOT NULL,
                ville VARCHAR(100) NOT NULL,
                commande_id INTEGER NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (numero_facture)
);


CREATE SEQUENCE public.employe_id_seq;

CREATE TABLE public.employe (
                id INTEGER NOT NULL DEFAULT nextval('public.employe_id_seq'),
                numero_matricule INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                compte_id INTEGER NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.employe_id_seq OWNED BY public.employe.id;

CREATE SEQUENCE public.livraison_id_seq;

CREATE TABLE public.livraison (
                id INTEGER NOT NULL DEFAULT nextval('public.livraison_id_seq'),
                adresse VARCHAR(300) NOT NULL,
                client_id INTEGER NOT NULL,
                employe_id INTEGER NOT NULL,
                commande_id INTEGER NOT NULL,
                CONSTRAINT livraison_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.livraison_id_seq OWNED BY public.livraison.id;

ALTER TABLE public.stock ADD CONSTRAINT famille_de_produit_stock_fk
FOREIGN KEY (famille_de_produit_id)
REFERENCES public.famille_de_produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.composition_recette ADD CONSTRAINT ingredient_composition_recette_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.recette ADD CONSTRAINT article_recette_fk
FOREIGN KEY (article_id)
REFERENCES public.article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT article_stock_fk
FOREIGN KEY (article_id)
REFERENCES public.article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ligne_de_commande ADD CONSTRAINT article_ligne_de_commande_fk
FOREIGN KEY (article_id)
REFERENCES public.article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.composition_recette ADD CONSTRAINT recette_composition_recette_fk
FOREIGN KEY (recette_id)
REFERENCES public.recette (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT statut_commande_commande_fk
FOREIGN KEY (statut_commande_id)
REFERENCES public.statut_commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.compte ADD CONSTRAINT niveau_acces_compte_fk
FOREIGN KEY (niveau_acces)
REFERENCES public.niveau_acces (niveau)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employe ADD CONSTRAINT compte_employe_fk
FOREIGN KEY (compte_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.client ADD CONSTRAINT compte_client_fk
FOREIGN KEY (compte_id)
REFERENCES public.compte (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employe ADD CONSTRAINT pizzeria_employe_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT pizzeria_commande_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.client ADD CONSTRAINT pizzeria_client_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reseau_social ADD CONSTRAINT pizzeria_reseau_social_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livraison ADD CONSTRAINT client_livraison_fk
FOREIGN KEY (client_id)
REFERENCES public.client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livraison ADD CONSTRAINT commande_livraison_fk
FOREIGN KEY (commande_id)
REFERENCES public.commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (commande_id)
REFERENCES public.commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ligne_de_commande ADD CONSTRAINT commande_ligne_de_commande_fk
FOREIGN KEY (commande_id)
REFERENCES public.commande (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livraison ADD CONSTRAINT employe_livraison_fk
FOREIGN KEY (employe_id)
REFERENCES public.employe (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
