create user ADMINGYM identified by psw default tablespace GYMNASE_TBS temporary tablespace GYMNASE__TempTBS;

connect ADMINGYM/psw;
revoke select on Seances from admingym;

/****** Qst 8 *******/
delete from DBAGYMNASE.Gymnases where IdGymnase not in (select IdGymnase from DBAGYMNASE.Seances);
/* ona pas le droit pour supprimer cette table ("Gymnases"). */
/* Qst 9 */
grant delete on Gymnases to admingym;
grant select on Seances to admingym;
/* Qst 10 */
/* on peut pas créer */
CREATE INDEX LIBELLE_IX ON Sports('Libelle');
/* Qst 11 */
GRANT INDEX ON Sports TO admingym;
CREATE INDEX LIBELLE_IX ON DBAGYMNASE.Sports(Libelle);
/* Qst 12 */
REVOKE DELETE ON Gymnases FROM admingym;
REVOKE SELECT ON Seances FROM admingym;
REVOKE INDEX ON Sports FROM admingym;

/* Qst 13 */
SELECT * FROM USER_TAB_PRIVS;

/* Qst 14 */
CREATE PROFILE Gymnase_Profil LIMIT 
    SESSIONS_PER_USER 4
    CPU_PER_CALL 30
    CONNECT_TIME 70
    LOGICAL_READS_PER_SESSION 1300
    PRIVATE_SGA 3000
    IDLE_TIME 20
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD_LOCK_TIME 3
    PASSWORD_LIFE_TIME 60
    PASSWORD_REUSE_TIME 40
    PASSWORD_REUSE_MAX UNLIMITED
    PASSWORD_GRACE_TIME 7;
	
/* Qst 15 */
ALTER USER admingym PROFILE Gymnase_Profil;

/* Qst 16 */
CREATE ROLE GESTIONNAIRE_DES_GYMNASES ;//IDENTIFIED BY psw;

GRANT SELECT ON Sportifs TO GESTIONNAIRE_DES_GYMNASES;
GRANT SELECT ON Sports TO GESTIONNAIRE_DES_GYMNASES;
GRANT SELECT ON Gymnases TO GESTIONNAIRE_DES_GYMNASES;

/* UPDATE or ALTER */
GRANT UPDATE ON Arbitrer TO GESTIONNAIRE_DES_GYMNASES;
GRANT UPDATE ON Entrainer TO GESTIONNAIRE_DES_GYMNASES;
GRANT UPDATE ON Jouer TO GESTIONNAIRE_DES_GYMNASES;
GRANT UPDATE ON Seances TO GESTIONNAIRE_DES_GYMNASES;
/****************************************************/
GRANT ALTER ON Arbitrer TO GESTIONNAIRE_DES_GYMNASES;
GRANT ALTER ON Entrainer TO GESTIONNAIRE_DES_GYMNASES;
GRANT ALTER ON Jouer TO GESTIONNAIRE_DES_GYMNASES;
GRANT ALTER ON Seances TO GESTIONNAIRE_DES_GYMNASES;
/****************************************************/

/* Qst 17 */
GRANT GESTIONNAIRE_DES_GYMNASES TO admingym;
SET ROLE GESTIONNAIRE_DES_GYMNASES;//IDENTIFIED BY psw;
select * from session_roles;
select * from user_tab_privs;
set linesize 150
set pagesize 150