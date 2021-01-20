connect system/root;

----------------- 1 -------------------
// Lister le catalogue « DICT ».
select * from dict;

// Il contient combien d’instances ?
1821 rows selected.

// Donner sa structure ?
desc dict;

---------------- 2 --------------------
// Donner le rôle et la structure des tables (ou vues) suivantes : 
// ALL_TAB_COLUMNS,USER_USERS, ALL_CONSTRAINTS et USER_TAB_PRIVS.

ALL_TAB_COLUMNS : describes the columns of the tables,views,and clusters accessible to the current user.

USER_USERS : describes the current user.

ALL_CONSTRAINTS : describes constraint definition on tables accessible to the current user.

USER_TAB_PRIVS : describes the object grants for which the current user is the object owner,grantor,or grantee.

---------------- 3 --------------------
// Trouver le nom d’utilisateur avec lequel vous êtes connecté ?

select username from user_users;

---------------- 4 --------------------
// Comparer la structure et le contenu des tables ALL_TAB_COLUMNS et USER_TAB_COLUMNS ?

// describes the columns of the tables,views,and clusters owned by the current user.its columns (except for OWNER) are the same as those in "ALL_TAB_COLUMNS".

---------------- 5 --------------------
// Vérifiez que les tables du TP1 ont été réellement créées ? Donner toutes les informations sur ces tables ?
connect DBAGYMNASE/psw;
select table_name from USER_TAB_COLUMNS;
select table_name,COLUMN_NAME from USER_TAB_COLUMNS;

---------------- 6 --------------------
// Lister les tables de l’utilisateur « system » et celles de l’utilisateur DBAGYMNASE (l’utilisateur de TP1).

select table_name from ALL_TAB_COLUMNS where owner = 'system';
select DISTINCT table_name from ALL_TAB_COLUMNS where owner = 'DBAGYMNASE';

---------------- 7 --------------------
// Donner la description des attributs des tables SPORTIFS et SEANCES (Exploiter la table USER_TAB_COLUMNS).
connect DBAGYMNASE/psw; 
select COLUMN_NAME,DATA_TYPE from USER_TAB_COLUMNS where table_name = 'SPORTIFS';
select COLUMN_NAME,DATA_TYPE from USER_TAB_COLUMNS where table_name = 'SEANCES';

---------------- 8 --------------------
// Comment peut-on vérifie qu’il y a une référence de clé étrangère entre les tables SPORTS et JOUER ?
select CONSTRAINT_NAME,CONSTRAINT_TYPE from USER_CONSTRAINTS where table_name = 'JOUER';

---------------- 9 --------------------
// Donner toutes les contraintes créées lors du TP1 et les informations qui les caractérisent (Exploitez la table USER_CONSTRAINTS).
select CONSTRAINT_NAME,TABLE_NAME,CONSTRAINT_TYPE from USER_CONSTRAINTS;

---------------- 10 --------------------
// Retrouver toutes les informations permettant de recréer la table SEANCES.

---------------- 11 --------------------
// Trouver tous les privilèges accordés à ADMINGYM.
connect ADMINGYM/psw;
select PRIVILEGE from USER_TAB_PRIVS;

---------------- 12 --------------------
// Trouver les rôles donnés à l’utilisateur ADMINGYM.
connect ADMINGYM/psw;
select * from user_role_privs;

---------------- 13 --------------------
// Trouver tous les objets appartenant à ADMINGYM.
select object_name,object_type from USER_OBJECTS;

---------------- 14 -------------------- 
// L’administrateur cherche le propriétaire de la table SPORTIFS, comment il pourra le trouver ?
select owner from all_tables where table_name = 'SPORTIFS'; 

---------------- 15 -------------------- *
// Donner la taille en Ko de la table SPORTIFS.
select DISTINCT BLOCKS from USER_EXTENTS where TABLESPACE_NAME = 'SPORTIFS';
select DISTINCT TABLESPACE_NAME from USER_EXTENTS;
select bytes/1021 as "Taille en Mo" from user_tables where table_name = 'SPORTIFS';

---------------- 16 -------------------- *
// Vérifier l’effet produit par chacune des commandes de définition de données du TP1 sur le dictionnaire.

