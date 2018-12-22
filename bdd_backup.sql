PGDMP             	            v            pizzeria    10.4    11.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    34568    pizzeria    DATABASE     �   CREATE DATABASE pizzeria WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE pizzeria;
             admin_projet_5    false            �           0    0    DATABASE pizzeria    COMMENT     @   COMMENT ON DATABASE pizzeria IS 'Base de données du projet 5';
                  admin_projet_5    false    2997            �            1259    34593    article    TABLE     0  CREATE TABLE public.article (
    id integer NOT NULL,
    code_ean13 integer NOT NULL,
    reference character varying(200) NOT NULL,
    nom character varying NOT NULL,
    designation character varying(200) NOT NULL,
    prix_unitaire_ht numeric(10,2) NOT NULL,
    prix_ttc numeric(10,2) NOT NULL
);
    DROP TABLE public.article;
       public         postgres    false            �            1259    34591    article_id_seq    SEQUENCE     w   CREATE SEQUENCE public.article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.article_id_seq;
       public       postgres    false    201            �           0    0    article_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;
            public       postgres    false    200            �            1259    34666    client    TABLE     �   CREATE TABLE public.client (
    id integer NOT NULL,
    adresse_livraison character varying(300) NOT NULL,
    pizzeria_id integer NOT NULL,
    compte_id integer NOT NULL
);
    DROP TABLE public.client;
       public         postgres    false            �            1259    34664    client_id_seq    SEQUENCE     v   CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.client_id_seq;
       public       postgres    false    216            �           0    0    client_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;
            public       postgres    false    215            �            1259    34685    commande    TABLE     �   CREATE TABLE public.commande (
    id integer NOT NULL,
    numero_commande integer NOT NULL,
    statut_commande_id integer NOT NULL,
    pizzeria_id integer NOT NULL
);
    DROP TABLE public.commande;
       public         postgres    false            �            1259    34683    commande_id_seq    SEQUENCE     x   CREATE SEQUENCE public.commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.commande_id_seq;
       public       postgres    false    220            �           0    0    commande_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.commande_id_seq OWNED BY public.commande.id;
            public       postgres    false    219            �            1259    34615    composition_recette    TABLE     �   CREATE TABLE public.composition_recette (
    id integer NOT NULL,
    ingredient_id integer NOT NULL,
    recette_id integer NOT NULL,
    quantite integer NOT NULL,
    unite character varying(10) NOT NULL
);
 '   DROP TABLE public.composition_recette;
       public         postgres    false            �            1259    34613    composition_recette_id_seq    SEQUENCE     �   CREATE SEQUENCE public.composition_recette_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.composition_recette_id_seq;
       public       postgres    false    205            �           0    0    composition_recette_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.composition_recette_id_seq OWNED BY public.composition_recette.id;
            public       postgres    false    204            �            1259    34636    compte    TABLE     �  CREATE TABLE public.compte (
    id integer NOT NULL,
    niveau_acces integer NOT NULL,
    email character varying(200) NOT NULL,
    mot_de_passe character varying(200) NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    numero_telephone character varying(50) NOT NULL,
    rue character varying(200) NOT NULL,
    code_postal integer NOT NULL,
    ville character varying(100) NOT NULL
);
    DROP TABLE public.compte;
       public         postgres    false            �            1259    34634    compte_id_seq    SEQUENCE     v   CREATE SEQUENCE public.compte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.compte_id_seq;
       public       postgres    false    210            �           0    0    compte_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.compte_id_seq OWNED BY public.compte.id;
            public       postgres    false    209            �            1259    34706    employe    TABLE     �   CREATE TABLE public.employe (
    id integer NOT NULL,
    numero_matricule integer NOT NULL,
    pizzeria_id integer NOT NULL,
    compte_id integer NOT NULL
);
    DROP TABLE public.employe;
       public         postgres    false            �            1259    34704    employe_id_seq    SEQUENCE     w   CREATE SEQUENCE public.employe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.employe_id_seq;
       public       postgres    false    225            �           0    0    employe_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.employe_id_seq OWNED BY public.employe.id;
            public       postgres    false    224            �            1259    34699    facture    TABLE     �  CREATE TABLE public.facture (
    numero_facture integer NOT NULL,
    numero_siren integer NOT NULL,
    numero_tva_entreprise integer NOT NULL,
    prix_ht numeric(10,2) NOT NULL,
    prix_ttc numeric(10,2) NOT NULL,
    date date NOT NULL,
    rue character varying(200) NOT NULL,
    code_postal integer NOT NULL,
    ville character varying(100) NOT NULL,
    commande_id integer NOT NULL
);
    DROP TABLE public.facture;
       public         postgres    false            �            1259    34571    famille_de_produit    TABLE     p   CREATE TABLE public.famille_de_produit (
    id integer NOT NULL,
    designation character varying NOT NULL
);
 &   DROP TABLE public.famille_de_produit;
       public         postgres    false            �            1259    34569    famille_de_produit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.famille_de_produit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.famille_de_produit_id_seq;
       public       postgres    false    197            �           0    0    famille_de_produit_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.famille_de_produit_id_seq OWNED BY public.famille_de_produit.id;
            public       postgres    false    196            �            1259    34582 
   ingredient    TABLE     �   CREATE TABLE public.ingredient (
    id integer NOT NULL,
    nom character varying NOT NULL,
    reference character varying(200) NOT NULL
);
    DROP TABLE public.ingredient;
       public         postgres    false            �            1259    34580    ingredient_id_seq    SEQUENCE     z   CREATE SEQUENCE public.ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ingredient_id_seq;
       public       postgres    false    199            �           0    0    ingredient_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;
            public       postgres    false    198            �            1259    34693    ligne_de_commande    TABLE       CREATE TABLE public.ligne_de_commande (
    id integer NOT NULL,
    designation character varying(200) NOT NULL,
    prix_ht numeric(10,2) NOT NULL,
    prix_ttc numeric(10,2) NOT NULL,
    quantite integer NOT NULL,
    commande_id integer NOT NULL,
    article_id integer NOT NULL
);
 %   DROP TABLE public.ligne_de_commande;
       public         postgres    false            �            1259    34691    ligne_de_commande_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ligne_de_commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ligne_de_commande_id_seq;
       public       postgres    false    222            �           0    0    ligne_de_commande_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ligne_de_commande_id_seq OWNED BY public.ligne_de_commande.id;
            public       postgres    false    221            �            1259    34714 	   livraison    TABLE     �   CREATE TABLE public.livraison (
    id integer NOT NULL,
    adresse character varying(300) NOT NULL,
    client_id integer NOT NULL,
    employe_id integer NOT NULL,
    commande_id integer NOT NULL
);
    DROP TABLE public.livraison;
       public         postgres    false            �            1259    34712    livraison_id_seq    SEQUENCE     y   CREATE SEQUENCE public.livraison_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.livraison_id_seq;
       public       postgres    false    227            �           0    0    livraison_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.livraison_id_seq OWNED BY public.livraison.id;
            public       postgres    false    226            �            1259    34629    niveau_acces    TABLE     o   CREATE TABLE public.niveau_acces (
    niveau integer NOT NULL,
    libelle character varying(250) NOT NULL
);
     DROP TABLE public.niveau_acces;
       public         postgres    false            �            1259    34647    pizzeria    TABLE     4  CREATE TABLE public.pizzeria (
    id integer NOT NULL,
    nom character varying NOT NULL,
    numero_telephone character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    rue character varying(200) NOT NULL,
    code_postal integer NOT NULL,
    ville character varying(100) NOT NULL
);
    DROP TABLE public.pizzeria;
       public         postgres    false            �            1259    34645    pizzeria_id_seq    SEQUENCE     x   CREATE SEQUENCE public.pizzeria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pizzeria_id_seq;
       public       postgres    false    212            �           0    0    pizzeria_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pizzeria_id_seq OWNED BY public.pizzeria.id;
            public       postgres    false    211            �            1259    34604    recette    TABLE     �   CREATE TABLE public.recette (
    id integer NOT NULL,
    nom character varying NOT NULL,
    recette character varying(500) NOT NULL,
    article_id integer NOT NULL
);
    DROP TABLE public.recette;
       public         postgres    false            �            1259    34602    recette_id_seq    SEQUENCE     w   CREATE SEQUENCE public.recette_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.recette_id_seq;
       public       postgres    false    203            �           0    0    recette_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.recette_id_seq OWNED BY public.recette.id;
            public       postgres    false    202            �            1259    34658    reseau_social    TABLE     �   CREATE TABLE public.reseau_social (
    id integer NOT NULL,
    plateforme character varying(200) NOT NULL,
    lien character varying(200) NOT NULL,
    pizzeria_id integer NOT NULL
);
 !   DROP TABLE public.reseau_social;
       public         postgres    false            �            1259    34656    reseau_social_id_seq    SEQUENCE     }   CREATE SEQUENCE public.reseau_social_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.reseau_social_id_seq;
       public       postgres    false    214            �           0    0    reseau_social_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.reseau_social_id_seq OWNED BY public.reseau_social.id;
            public       postgres    false    213            �            1259    34623    statut_commande    TABLE     m   CREATE TABLE public.statut_commande (
    id integer NOT NULL,
    statut character varying(200) NOT NULL
);
 #   DROP TABLE public.statut_commande;
       public         postgres    false            �            1259    34621    statut_commande_id_seq    SEQUENCE        CREATE SEQUENCE public.statut_commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.statut_commande_id_seq;
       public       postgres    false    207            �           0    0    statut_commande_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.statut_commande_id_seq OWNED BY public.statut_commande.id;
            public       postgres    false    206            �            1259    34674    stock    TABLE     ^  CREATE TABLE public.stock (
    id integer NOT NULL,
    ingredient_id integer,
    article_id integer,
    quantite integer NOT NULL,
    conditionnement character varying(100) NOT NULL,
    date_reception date NOT NULL,
    date_peremption character varying NOT NULL,
    pizzeria_id integer NOT NULL,
    famille_de_produit_id integer NOT NULL
);
    DROP TABLE public.stock;
       public         postgres    false            �            1259    34672    stock_id_seq    SEQUENCE     u   CREATE SEQUENCE public.stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.stock_id_seq;
       public       postgres    false    218            �           0    0    stock_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;
            public       postgres    false    217            �
           2604    34596 
   article id    DEFAULT     h   ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);
 9   ALTER TABLE public.article ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    34669 	   client id    DEFAULT     f   ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);
 8   ALTER TABLE public.client ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    216    216            �
           2604    34688    commande id    DEFAULT     j   ALTER TABLE ONLY public.commande ALTER COLUMN id SET DEFAULT nextval('public.commande_id_seq'::regclass);
 :   ALTER TABLE public.commande ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    220    220            �
           2604    34618    composition_recette id    DEFAULT     �   ALTER TABLE ONLY public.composition_recette ALTER COLUMN id SET DEFAULT nextval('public.composition_recette_id_seq'::regclass);
 E   ALTER TABLE public.composition_recette ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205            �
           2604    34639 	   compte id    DEFAULT     f   ALTER TABLE ONLY public.compte ALTER COLUMN id SET DEFAULT nextval('public.compte_id_seq'::regclass);
 8   ALTER TABLE public.compte ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    210    210            �
           2604    34709 
   employe id    DEFAULT     h   ALTER TABLE ONLY public.employe ALTER COLUMN id SET DEFAULT nextval('public.employe_id_seq'::regclass);
 9   ALTER TABLE public.employe ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    224    225    225            �
           2604    34574    famille_de_produit id    DEFAULT     ~   ALTER TABLE ONLY public.famille_de_produit ALTER COLUMN id SET DEFAULT nextval('public.famille_de_produit_id_seq'::regclass);
 D   ALTER TABLE public.famille_de_produit ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    34585    ingredient id    DEFAULT     n   ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);
 <   ALTER TABLE public.ingredient ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    34696    ligne_de_commande id    DEFAULT     |   ALTER TABLE ONLY public.ligne_de_commande ALTER COLUMN id SET DEFAULT nextval('public.ligne_de_commande_id_seq'::regclass);
 C   ALTER TABLE public.ligne_de_commande ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221    222            �
           2604    34717    livraison id    DEFAULT     l   ALTER TABLE ONLY public.livraison ALTER COLUMN id SET DEFAULT nextval('public.livraison_id_seq'::regclass);
 ;   ALTER TABLE public.livraison ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    226    227    227            �
           2604    34650    pizzeria id    DEFAULT     j   ALTER TABLE ONLY public.pizzeria ALTER COLUMN id SET DEFAULT nextval('public.pizzeria_id_seq'::regclass);
 :   ALTER TABLE public.pizzeria ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    211    212            �
           2604    34607 
   recette id    DEFAULT     h   ALTER TABLE ONLY public.recette ALTER COLUMN id SET DEFAULT nextval('public.recette_id_seq'::regclass);
 9   ALTER TABLE public.recette ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    203    203            �
           2604    34661    reseau_social id    DEFAULT     t   ALTER TABLE ONLY public.reseau_social ALTER COLUMN id SET DEFAULT nextval('public.reseau_social_id_seq'::regclass);
 ?   ALTER TABLE public.reseau_social ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    213    214            �
           2604    34626    statut_commande id    DEFAULT     x   ALTER TABLE ONLY public.statut_commande ALTER COLUMN id SET DEFAULT nextval('public.statut_commande_id_seq'::regclass);
 A   ALTER TABLE public.statut_commande ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    34677    stock id    DEFAULT     d   ALTER TABLE ONLY public.stock ALTER COLUMN id SET DEFAULT nextval('public.stock_id_seq'::regclass);
 7   ALTER TABLE public.stock ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    218    218            �          0    34593    article 
   TABLE DATA               j   COPY public.article (id, code_ean13, reference, nom, designation, prix_unitaire_ht, prix_ttc) FROM stdin;
    public       postgres    false    201   a�       �          0    34666    client 
   TABLE DATA               O   COPY public.client (id, adresse_livraison, pizzeria_id, compte_id) FROM stdin;
    public       postgres    false    216   ��       �          0    34685    commande 
   TABLE DATA               X   COPY public.commande (id, numero_commande, statut_commande_id, pizzeria_id) FROM stdin;
    public       postgres    false    220   ��       �          0    34615    composition_recette 
   TABLE DATA               ]   COPY public.composition_recette (id, ingredient_id, recette_id, quantite, unite) FROM stdin;
    public       postgres    false    205   (�       �          0    34636    compte 
   TABLE DATA                  COPY public.compte (id, niveau_acces, email, mot_de_passe, nom, prenom, numero_telephone, rue, code_postal, ville) FROM stdin;
    public       postgres    false    210   q�       �          0    34706    employe 
   TABLE DATA               O   COPY public.employe (id, numero_matricule, pizzeria_id, compte_id) FROM stdin;
    public       postgres    false    225   E�       �          0    34699    facture 
   TABLE DATA               �   COPY public.facture (numero_facture, numero_siren, numero_tva_entreprise, prix_ht, prix_ttc, date, rue, code_postal, ville, commande_id) FROM stdin;
    public       postgres    false    223   ��       �          0    34571    famille_de_produit 
   TABLE DATA               =   COPY public.famille_de_produit (id, designation) FROM stdin;
    public       postgres    false    197   �       �          0    34582 
   ingredient 
   TABLE DATA               8   COPY public.ingredient (id, nom, reference) FROM stdin;
    public       postgres    false    199   I�       �          0    34693    ligne_de_commande 
   TABLE DATA               r   COPY public.ligne_de_commande (id, designation, prix_ht, prix_ttc, quantite, commande_id, article_id) FROM stdin;
    public       postgres    false    222   ��       �          0    34714 	   livraison 
   TABLE DATA               T   COPY public.livraison (id, adresse, client_id, employe_id, commande_id) FROM stdin;
    public       postgres    false    227   G�       �          0    34629    niveau_acces 
   TABLE DATA               7   COPY public.niveau_acces (niveau, libelle) FROM stdin;
    public       postgres    false    208   ��       �          0    34647    pizzeria 
   TABLE DATA               ]   COPY public.pizzeria (id, nom, numero_telephone, email, rue, code_postal, ville) FROM stdin;
    public       postgres    false    212   �       �          0    34604    recette 
   TABLE DATA               ?   COPY public.recette (id, nom, recette, article_id) FROM stdin;
    public       postgres    false    203   B�       �          0    34658    reseau_social 
   TABLE DATA               J   COPY public.reseau_social (id, plateforme, lien, pizzeria_id) FROM stdin;
    public       postgres    false    214   ��       �          0    34623    statut_commande 
   TABLE DATA               5   COPY public.statut_commande (id, statut) FROM stdin;
    public       postgres    false    207   Q�       �          0    34674    stock 
   TABLE DATA               �   COPY public.stock (id, ingredient_id, article_id, quantite, conditionnement, date_reception, date_peremption, pizzeria_id, famille_de_produit_id) FROM stdin;
    public       postgres    false    218   ��       �           0    0    article_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.article_id_seq', 1, false);
            public       postgres    false    200            �           0    0    client_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.client_id_seq', 1, false);
            public       postgres    false    215            �           0    0    commande_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.commande_id_seq', 1, false);
            public       postgres    false    219            �           0    0    composition_recette_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.composition_recette_id_seq', 1, false);
            public       postgres    false    204            �           0    0    compte_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.compte_id_seq', 1, false);
            public       postgres    false    209            �           0    0    employe_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.employe_id_seq', 1, false);
            public       postgres    false    224            �           0    0    famille_de_produit_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.famille_de_produit_id_seq', 1, false);
            public       postgres    false    196            �           0    0    ingredient_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ingredient_id_seq', 1, false);
            public       postgres    false    198            �           0    0    ligne_de_commande_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ligne_de_commande_id_seq', 1, false);
            public       postgres    false    221            �           0    0    livraison_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.livraison_id_seq', 2, true);
            public       postgres    false    226            �           0    0    pizzeria_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pizzeria_id_seq', 1, false);
            public       postgres    false    211            �           0    0    recette_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.recette_id_seq', 1, false);
            public       postgres    false    202            �           0    0    reseau_social_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.reseau_social_id_seq', 1, false);
            public       postgres    false    213            �           0    0    statut_commande_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.statut_commande_id_seq', 1, false);
            public       postgres    false    206            �           0    0    stock_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.stock_id_seq', 1, false);
            public       postgres    false    217            �
           2606    34601    article article_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.article DROP CONSTRAINT article_pk;
       public         postgres    false    201            �
           2606    34671    client client_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pk;
       public         postgres    false    216            �
           2606    34690    commande commande_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pk;
       public         postgres    false    220            �
           2606    34620 *   composition_recette composition_recette_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.composition_recette
    ADD CONSTRAINT composition_recette_pk PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.composition_recette DROP CONSTRAINT composition_recette_pk;
       public         postgres    false    205            �
           2606    34644    compte compte_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.compte DROP CONSTRAINT compte_pk;
       public         postgres    false    210            �
           2606    34711    employe employe_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.employe DROP CONSTRAINT employe_pk;
       public         postgres    false    225            �
           2606    34703    facture facture_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_pk PRIMARY KEY (numero_facture);
 <   ALTER TABLE ONLY public.facture DROP CONSTRAINT facture_pk;
       public         postgres    false    223            �
           2606    34579 (   famille_de_produit famille_de_produit_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.famille_de_produit
    ADD CONSTRAINT famille_de_produit_pk PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.famille_de_produit DROP CONSTRAINT famille_de_produit_pk;
       public         postgres    false    197            �
           2606    34590    ingredient ingredient_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredient_pk;
       public         postgres    false    199            �
           2606    34698 &   ligne_de_commande ligne_de_commande_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT ligne_de_commande_pk PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.ligne_de_commande DROP CONSTRAINT ligne_de_commande_pk;
       public         postgres    false    222                       2606    34719    livraison livraison_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.livraison DROP CONSTRAINT livraison_pk;
       public         postgres    false    227            �
           2606    34633    niveau_acces niveau_acces_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.niveau_acces
    ADD CONSTRAINT niveau_acces_pk PRIMARY KEY (niveau);
 F   ALTER TABLE ONLY public.niveau_acces DROP CONSTRAINT niveau_acces_pk;
       public         postgres    false    208            �
           2606    34655    pizzeria pizzeria_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.pizzeria
    ADD CONSTRAINT pizzeria_pk PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.pizzeria DROP CONSTRAINT pizzeria_pk;
       public         postgres    false    212            �
           2606    34612    recette recette_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.recette DROP CONSTRAINT recette_pk;
       public         postgres    false    203            �
           2606    34663    reseau_social reseau_social_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public.reseau_social
    ADD CONSTRAINT reseau_social_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.reseau_social DROP CONSTRAINT reseau_social_pk;
       public         postgres    false    214            �
           2606    34628 "   statut_commande statut_commande_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.statut_commande
    ADD CONSTRAINT statut_commande_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.statut_commande DROP CONSTRAINT statut_commande_pk;
       public         postgres    false    207            �
           2606    34682    stock stock_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.stock DROP CONSTRAINT stock_pk;
       public         postgres    false    218                       2606    34745 .   ligne_de_commande article_ligne_de_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT article_ligne_de_commande_fk FOREIGN KEY (article_id) REFERENCES public.article(id);
 X   ALTER TABLE ONLY public.ligne_de_commande DROP CONSTRAINT article_ligne_de_commande_fk;
       public       postgres    false    201    222    2789                       2606    34735    recette article_recette_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT article_recette_fk FOREIGN KEY (article_id) REFERENCES public.article(id);
 D   ALTER TABLE ONLY public.recette DROP CONSTRAINT article_recette_fk;
       public       postgres    false    2789    201    203                       2606    34740    stock article_stock_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT article_stock_fk FOREIGN KEY (article_id) REFERENCES public.article(id);
 @   ALTER TABLE ONLY public.stock DROP CONSTRAINT article_stock_fk;
       public       postgres    false    218    201    2789                       2606    34800    livraison client_livraison_fk    FK CONSTRAINT        ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT client_livraison_fk FOREIGN KEY (client_id) REFERENCES public.client(id);
 G   ALTER TABLE ONLY public.livraison DROP CONSTRAINT client_livraison_fk;
       public       postgres    false    227    216    2805                       2606    34810    facture commande_facture_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.facture
    ADD CONSTRAINT commande_facture_fk FOREIGN KEY (commande_id) REFERENCES public.commande(id);
 E   ALTER TABLE ONLY public.facture DROP CONSTRAINT commande_facture_fk;
       public       postgres    false    223    2809    220                       2606    34815 /   ligne_de_commande commande_ligne_de_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_de_commande
    ADD CONSTRAINT commande_ligne_de_commande_fk FOREIGN KEY (commande_id) REFERENCES public.commande(id);
 Y   ALTER TABLE ONLY public.ligne_de_commande DROP CONSTRAINT commande_ligne_de_commande_fk;
       public       postgres    false    222    2809    220                       2606    34805    livraison commande_livraison_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT commande_livraison_fk FOREIGN KEY (commande_id) REFERENCES public.commande(id);
 I   ALTER TABLE ONLY public.livraison DROP CONSTRAINT commande_livraison_fk;
       public       postgres    false    2809    227    220                       2606    34770    client compte_client_fk    FK CONSTRAINT     y   ALTER TABLE ONLY public.client
    ADD CONSTRAINT compte_client_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);
 A   ALTER TABLE ONLY public.client DROP CONSTRAINT compte_client_fk;
       public       postgres    false    216    2799    210                       2606    34765    employe compte_employe_fk    FK CONSTRAINT     {   ALTER TABLE ONLY public.employe
    ADD CONSTRAINT compte_employe_fk FOREIGN KEY (compte_id) REFERENCES public.compte(id);
 C   ALTER TABLE ONLY public.employe DROP CONSTRAINT compte_employe_fk;
       public       postgres    false    2799    210    225                       2606    34820    livraison employe_livraison_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT employe_livraison_fk FOREIGN KEY (employe_id) REFERENCES public.employe(id);
 H   ALTER TABLE ONLY public.livraison DROP CONSTRAINT employe_livraison_fk;
       public       postgres    false    227    2815    225            	           2606    34720 !   stock famille_de_produit_stock_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT famille_de_produit_stock_fk FOREIGN KEY (famille_de_produit_id) REFERENCES public.famille_de_produit(id);
 K   ALTER TABLE ONLY public.stock DROP CONSTRAINT famille_de_produit_stock_fk;
       public       postgres    false    218    197    2785                       2606    34730 5   composition_recette ingredient_composition_recette_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.composition_recette
    ADD CONSTRAINT ingredient_composition_recette_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 _   ALTER TABLE ONLY public.composition_recette DROP CONSTRAINT ingredient_composition_recette_fk;
       public       postgres    false    2787    199    205            
           2606    34725    stock ingredient_stock_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT ingredient_stock_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 C   ALTER TABLE ONLY public.stock DROP CONSTRAINT ingredient_stock_fk;
       public       postgres    false    199    2787    218                       2606    34760    compte niveau_acces_compte_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.compte
    ADD CONSTRAINT niveau_acces_compte_fk FOREIGN KEY (niveau_acces) REFERENCES public.niveau_acces(niveau);
 G   ALTER TABLE ONLY public.compte DROP CONSTRAINT niveau_acces_compte_fk;
       public       postgres    false    210    2797    208                       2606    34790    client pizzeria_client_fk    FK CONSTRAINT        ALTER TABLE ONLY public.client
    ADD CONSTRAINT pizzeria_client_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(id);
 C   ALTER TABLE ONLY public.client DROP CONSTRAINT pizzeria_client_fk;
       public       postgres    false    212    2801    216                       2606    34780    commande pizzeria_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT pizzeria_commande_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(id);
 G   ALTER TABLE ONLY public.commande DROP CONSTRAINT pizzeria_commande_fk;
       public       postgres    false    2801    220    212                       2606    34775    employe pizzeria_employe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employe
    ADD CONSTRAINT pizzeria_employe_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(id);
 E   ALTER TABLE ONLY public.employe DROP CONSTRAINT pizzeria_employe_fk;
       public       postgres    false    225    2801    212                       2606    34795 '   reseau_social pizzeria_reseau_social_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reseau_social
    ADD CONSTRAINT pizzeria_reseau_social_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(id);
 Q   ALTER TABLE ONLY public.reseau_social DROP CONSTRAINT pizzeria_reseau_social_fk;
       public       postgres    false    2801    214    212                       2606    34785    stock pizzeria_stock_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT pizzeria_stock_fk FOREIGN KEY (pizzeria_id) REFERENCES public.pizzeria(id);
 A   ALTER TABLE ONLY public.stock DROP CONSTRAINT pizzeria_stock_fk;
       public       postgres    false    218    212    2801                       2606    34750 2   composition_recette recette_composition_recette_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.composition_recette
    ADD CONSTRAINT recette_composition_recette_fk FOREIGN KEY (recette_id) REFERENCES public.recette(id);
 \   ALTER TABLE ONLY public.composition_recette DROP CONSTRAINT recette_composition_recette_fk;
       public       postgres    false    203    205    2791                       2606    34755 $   commande statut_commande_commande_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT statut_commande_commande_fk FOREIGN KEY (statut_commande_id) REFERENCES public.statut_commande(id);
 N   ALTER TABLE ONLY public.commande DROP CONSTRAINT statut_commande_commande_fk;
       public       postgres    false    2795    207    220            �   +  x�e�Mn�0��/��pd?�$ݒ�T�@bՍ	.�ubU9Q�ы�I���I3�|�7PH��
�ʘ�"Ԇ����d���l-��	/�A��%Z
� X/�֮%]�w�6~��	K3U�0��Q,���q�`UQ�V�Ν����w������%eJ�2�o�r���e���g�lB3#��4�kC{��4�=�����z��g9T%U��۱�q�_���5@?��]l������B
��Q
X�)����dӅ���[E��m܈+v?l$LJ��`QP����Cx�FL�l�����4I�O�4��      �   M   x�3�410tSH�H���SHIU�ITHJ-JO-�L�4�4�2�t�ʕ*�f� ͹�9�JS���
2�B\1z\\\ n      �      x�3�415�4�4�2�461���b���� -wT      �   9   x�3�4�4�442�L/�2�4q8K�2K�,�2�4�@r&`��)�	Bc� `k>      �   �  x�u�Mr�0���)��S���q�+q�?�=3����$����r�\,�$�ςz��^j<@=��.��`:3}1]-��y�p�m�^���.�G#�X��D"	A0o�/X�ƭ���-�>�U1�<;�H{�����hT�b�ao��cJi�sL�b�KW��:�C�U��%���{t;l���8������g�
k���̳�s�	}�q��[�U��� ����)_/�{>��,���7�p���"��|�A�I����L6��N >d�A����Ҝ��z�+����N��4V���X$A��\�����	:���i��	/���I�fY����H�JO��c?��z��.e��'(������{F�;[�YU��|*�	Ƿ�c�y���7u`b�q��'�C�>��}�kl�xpUh-����n�	�qO���1O�ϋ�tkc;Ү��}�8�O���      �   4   x���	  �sR��ُ؋��a�=�	(Q�5V2qRV�E�6�߱�w�|�g      �   n   x���+�@ P=s�^`'���5��4ae+�]��	$8�������="��o*��fjL���&nI�ٗ�\�~^PM���x�s���������q�p��Z�Z/�*(�      �   2   x�3�t��-�/N�+Q(Ȭ�J�2�t��,.��+�2�t�ILN����� )p�      �   S   x�3���M,I�,��2����,KU���,J����2��ͯ�J,J��I����2�t�H�-�L���+�L��2��s8�ӹb���� �      �   �   x�=�1
�0Eg�>�����'�ҩC�.ij��C �޾�A��'�k��53�V�=m.��3�OɵoH�p4"*��8e�X�6�J�p$��׫R��n
b� �2���/��#( w��ڻ{�d�wX"�	p�(}      �   B   x�3�*MUHIU(I-.�4�4�4�2�410tSH�H�����$*$���e�rr�rq��qqq �>5      �   7   x�3�t��L�+�2�t�-�ɯ<��˘�71/1=��˄�%�(5�$���+F��� gfb      �   R   x�3��ITʯL�I�40�4142615�,I-.qH�M���K���*MUH)U �rZp'�%U����q��qqq W�8      �   �   x�e�A
�0E�z�Y� �=H)]w3&�F�L�I�z#����v3�?>h^n���EO�S��c��.T������XA怙�(B���@��'����;���J����&���p�+>m{��,F���,F3���yB��ff�M����c���";!���~��m��S�      �   C   x�3�tKLNM��φ3�s2S�2��R�2�Ҋ8��8C�3KJR�`�~r~nAI*\�T���� ��o      �   7   x�3�t���M�KIU8�@����ʂĢ�".#�8B�EqNfH�!����� ޏ�      �   h   x�uͻ	�@��x�
���C|��V`��h ���b"�0�CCSt�xLi��t���uN˵5��2Z��sE�[�ߖP���5����GhjL
� '�'�     