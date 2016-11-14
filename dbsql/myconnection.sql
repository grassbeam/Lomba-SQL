-- DROPPING TABLE --
DROP TABLE time_table;
DROP TABLE scoreboard;
DROP TABLE login_cpanel;
DROP TABLE login;
DROP TABLE submission;
DROP TABLE problem;
DROP TABLE contestant;

create table contestant (
  name_code VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  school VARCHAR(50) NOT NULL
);

create table login_cpanel (
  username VARCHAR(25) PRIMARY KEY,
  password VARCHAR(25),
  nama_admin VARCHAR(50),
  admin_code VARCHAR(10)
);

INSERT INTO login_cpanel VALUES('leopisangg', 'kampretos666', 'PisanGG','adm01');
INSERT INTO login_cpanel VALUES('hobert', 'kampretos666', 'Hobert','adm02');

create table login (
  username VARCHAR(15) PRIMARY KEY,
  password VARCHAR(10),
  name_code VARCHAR(10) CONSTRAINT lg_nmc_fk REFERENCES contestant(name_code) ON DELETE CASCADE
);

CREATE TABLE problem (
  prob_num VARCHAR(2) PRIMARY KEY,
  solution_query VARCHAR2(255)
);

INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('1', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('2', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('3', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('4', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('5', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('6', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('7', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('8', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('9', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('10', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('11', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('12', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('13', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('14', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('15', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('16', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('17', 'SELECT');
INSERT INTO PROBLEM (PROB_NUM, SOLUTION_QUERY) VALUES ('18', 'DUMMY');



CREATE TABLE submission (
  sub_id VARCHAR(11) PRIMARY KEY,
  name_code VARCHAR(10) CONSTRAINT subm_nmc_fk REFERENCES contestant(name_code) ON DELETE CASCADE ,
  submitted_text VARCHAR2(255) NOT NULL,
  prob_num VARCHAR2(2) NOT NULL CONSTRAINT subm_submtd_fk REFERENCES problem(prob_num),
  status INT NOT NULL, 
  submit_time INT NOT NULL,
  verifier VARCHAR(50)
);


--SUBMIT TIME IN SECONDS----
CREATE TABLE scoreboard (
  name_code CONSTRAINT sc_nc_fk REFERENCES contestant(name_code) ON DELETE CASCADE,
  prob_num INT,
  submit_count INT,
  submit_time INT,
  time_after_penalty as (submit_time + (submit_count*8)),
  verdict INT NOT NULL,
  CONSTRAINT tots_nc_pn_compokey PRIMARY KEY (name_code, prob_num)
);
--time in MINUTES--

CREATE TABLE time_table (
  idx INT PRIMARY KEY,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL
);

INSERT INTO time_table (idx, start_time, end_time) VALUES ('1', TO_TIMESTAMP ('2016-11-14 00:40', 'YYYY-MM-DD HH24:MI') ,TO_TIMESTAMP ('2016-11-14 07:14', 'YYYY-MM-DD HH24:MI'));

commit;

--JANGAN LUPA COMMIT!!!!!----------------------------------------------------

create table peserta( id_peserta varchar2(6) not null, nama varchar2(20) not null, jurusan varchar2(30) not null, total_sks number not null, primary key(id_peserta));
create table pelajaran( kode_p varchar2(8) not null, mata_pelajaran varchar2(30) not null, jurusan varchar2(20) not null, sks number not null, primary key(kode_p));

COMMIT;
DROP USER sqluntar005 CASCADE;
DROP CASCADE USER  sqluntar001;
CREATE USER sqluntar001 IDENTIFIED BY 90955;
drop user sqluntar001;
create table sqluntar001.peserta( id_peserta varchar2(6) not null, nama varchar2(20) not null, jurusan varchar2(30) not null, total_sks number not null, primary key(id_peserta));


SELECT c.name_code, c.name, c.school, count(verdict) verd , Sum(s.time_after_penalty) totscore FROM scoreboard s JOIN contestant c ON(s.name_code = c.name_code) WHERE s.verdict!=0 group by c.name_code, c.name, c.school ORDER BY verd asc, totscore asc;

UPDATE time_table SET start_time = TO_TIMESTAMP ('2016-11-14 11:40', 'YYYY-MM-DD HH24:MI') , 
end_time = TO_TIMESTAMP ('2016-11-14 18:14', 'YYYY-MM-DD HH24:MI');
commit;
select * from time_table;

select s.sub_id, s.prob_num, s.status, s.submit_time, p.solution_query from submission s , problem p WHERE s.prob_num = p.prob_num AND s.name_code = 'sql-001' ORDER BY s.submit_time DESC;
truncate table submission;

SELECT (select extract( day from diff )*24*60*60 +
 extract( hour from diff )*60*60 +
  extract( minute from diff ) *60+
  round(extract( second from diff )) total_SECONDS
  from (select systimestamp - end_time diff from time_table)) CHECKER, (select extract( day from diff )*24*60*60 +
 extract( hour from diff )*60*60 +
  extract( minute from diff ) *60+
  round(extract( second from diff )) total_SECONDS
  from (select systimestamp - start_time diff from time_table)) DIFF FROM dual;
  
  select extract( day from diff )*24*60*60 +
 extract( hour from diff )*60*60 +
  extract( minute from diff ) *60+
  round(extract( second from diff )) total_SECONDS
  from (select systimestamp - end_time diff from time_table)

select extract( day from diff )*24*60 +
 extract( hour from diff )*60 +
  extract( minute from diff ) total_MINUTES
  from (select systimestamp - start_time diff from time_table);


select systimestamp - start_time from time_table;
TRUNCATE TABLE time_table;
INSERT INTO time_table (idx, start_time, end_time) VALUES ('1', TO_TIMESTAMP ('2016-11-13 04:12', 'YYYY-MM-DD HH24:MI') ,TO_TIMESTAMP ('2016-11-13 05:05', 'YYYY-MM-DD HH24:MI'));
commit;
select (24*60*60*(end_time - start_time)) as KAMPRET from time_table;

INSERT INTO submission (sub_id, name_code, submitted_text, prob_num, status, submit_time) VALUES ('asd123', 'sql-001', 'e:/asem', '1' ,'3' , '');
COMMIT;  
INSERT INTO time_table (idx, start_time, end_time) VALUES ('1', TO_TIMESTAMP ('2016-11-13 05:58', 'YYYY-MM-DD HH24:MI') ,TO_TIMESTAMP ('2016-11-13 06:58', 'YYYY-MM-DD HH24:MI'));
select (24*60*60*(end_time - start_time)) as KAMPRET from time_table;

--SELECT t.username FROM DBA_USERS t WHERE t.username LIKE 's%';
drop USER sqluntar001;
INSERT INTO contestant (name_code, name, school) VALUES ('sql-01', 'blashh21', 'UNTAR');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-02', 'Azure Dragon 77', 'UNTAR');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-03', 'TeamTam', 'NUS');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-04', 'NightRain', 'UNTAR');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-05', 'Awrakin', 'UI');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-06', 'Ainge WF', 'ITB');

INSERT INTO login (username, password, name_code) VALUES ('sqluntar001', 'asd12', 'sql-001');

INSERT INTO totalscore (name_code, score) VALUES('sql-01', 100);
INSERT INTO totalscore (name_code, score) VALUES('sql-02', 90);
INSERT INTO totalscore (name_code, score) VALUES('sql-03', 80);
INSERT INTO totalscore (name_code, score) VALUES('sql-04', 70);
INSERT INTO totalscore (name_code, score) VALUES('sql-05', 60);
INSERT INTO totalscore (name_code, score) VALUES('sql-06', 50);


SELECT c.name_code, c.name, c.school, t.score FROM contestant c, totalscore t WHERE c.name_code = t.name_code ORDER BY t.score DESC;
commit;

-- INIT AWAL DATABASE --
CREATE SMALLFILE TABLESPACE users datafile '/u01/app/oracle/oradata/ORCL/users,.dbf' size 10g;
ALTER DATABASE default TABLESPACE users;
CREATE ROLE peserta;
GRANT CREATE SESSION, CONNECT ,CREATE TABLE TO peserta;

-- UNTUK IMPORT / CREATE PESERTA BARU --
CREATE USER leo IDENTIFIED BY leo123;
GRANT peserta TO sqluntar001;
ALTER user leo quota 50m on users;
-- --------------------------------- --

DROP USER kampret;
CREATE USER kampret IDENTIFIED by "666kg";
CREATE USER ;

select extract( day from diff )*24*60*60 +
 extract( hour from diff )*60*60 +
  extract( minute from diff ) *60+
  round(extract( second from diff )) total_SECONDS
  from (select systimestamp - start_time diff from time_table);


SELECT s.*, c.name FROM submission s, contestant c WHERE s.name_code = c.name_code AND status = '3';
SELECT * FROM login;
SELECT * FROM time_table;
SELECT * FROM contestant;
SELECT * FROM submission;
UPDATE submission SET status = 1, verifier = 'kampretos666'  WHERE sub_id = 'ac3be0c473c';
commit;
SELECT count(*) accepted FROM scoreboard WHERE verdict = 0 AND name_code = 'sql-001';
SELECT c.name_code, c.name, c.school, Sum(s.time_after_penalty) totscore FROM scoreboard s JOIN contestant c ON(s.name_code = c.name_code) group by c.name_code, c.name, c.school ORDER BY totscore DESC;
SELECT name_code, SUM(time_after_penalty),  total_score FROM scoreboard GROUP BY name_code ;
SELECT PROB_NUM, SUBMIT_COUNT, TIME_AFTER_PENALTY FROM scoreboard WHERE name_code = 'sql-001';
SELECT NAME_CODE, submit_count, time_after_penalty FROM scoreboard WHERE prob_num = '1' ORDER BY SUBMIT_COUNT DESC, time_after_penalty ASC;
SELECT COUNT(*) total_submit FROM scoreboard WHERE name_code = 'sql-001' AND verdict = '1';
SELECT * FROM problem;
select * from time_table;
SELECT TO_CHAR(start_time, 'DD-MON-YYYY HH24:MI:SS') FROM time_table;
SELECT TO_char(start_time - end_time, 'HH24:MI') from time_table;

desc scoreboard;
Select * from scoreboard WHERE name_code = 'sql-001' ORDER BY prob_num asc;
SELECT name_code, count(verdict) FROM scoreboard WHERE  ;
SELECT c.name_code, c.name, c.school, count(verdict) verd , Sum(s.time_after_penalty) totscore FROM scoreboard s JOIN contestant c ON(s.name_code = c.name_code) WHERE s.verdict!=0 group by c.name_code, c.name, c.school ORDER BY verd asc, totscore asc;
SELECT COALESE((select name_code, count(verdict) FROM scoreboard WHERE verdict = '3' GROUP BY name_code) ,0);
SELECT DISTINCT * FROM scoreboard ORDER BY SUBMIT_COUNT DESC , TIME_AFTER_PENALTY ASC;
select name_code, count(verdict) FROM scoreboard WHERE verdict = '3' GROUP BY name_code
Select DISTINCT name_code  FROM scoreboard;
select name_code, count(verdict) FROM scoreboard WHERE verdict = '3' GROUP BY name_code;
CREATE TABLE kampret (
total_seconds INT PRIMARY KEY
);
select count(*) from contestant;
SELECT name_code, SUM(time_after_penalty) sum_time, COUNT(VERDICT) verd FROM scoreboard WHERE verdict != 0 GROUP BY name_code ORDER BY verd asc, sum_time asc;
SELECT COUNT(*)-1 FROM problem;
INSERT INTO kampret VALUES(20);
SELECT * from kampret;

TRUNCATE TABLE contestant;
TRUNCATE TABLE totalscore;
DELETE FROM contestant;
Select * from scoreboard WHERE name_code = 'sql-001' ORDER BY prob_num asc;
CREATE TABLE hobert.pesertaInsert (

select extract( day from diff )*24*60*60 +
 extract( hour from diff )*60*60 +
  extract( minute from diff ) *60+
  round(extract( second from diff )) TOTAL_SECONDS
  from (select systimestamp - start_time diff from time_table);