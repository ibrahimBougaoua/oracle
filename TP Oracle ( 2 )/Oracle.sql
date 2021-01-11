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
CREATE INDEX LIBELLE_IX ON Sports(Libelle);
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
   SESSIONS_PER_USER          4 
   CPU_PER_SESSION            UNLIMITED 
   CPU_PER_CALL               3000 
   CONNECT_TIME               70 
   LOGICAL_READS_PER_SESSION  1300 
   LOGICAL_READS_PER_CALL     1000 
   PRIVATE_SGA                30K
   IDLE_TIME 20
   FAILED_LOGIN_ATTEMPTS 3

