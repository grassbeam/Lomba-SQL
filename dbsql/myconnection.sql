-- DROPPING TABLE --
DROP TABLE time_table;
DROP TABLE scoreboard;
DROP TABLE login_cpanel;
DROP TABLE login;
DROP TABLE submission;
DROP TABLE problem;
DROP TABLE contestant;

drop table nilai;
drop table kelas;
drop table pengajar;
drop table jadwal;
drop table pelajaran;
drop table peserta;






create table peserta(
    id_peserta varchar2(6) not null,
	nama varchar2(20) not null,
	jurusan varchar2(30) not null,
	total_sks  number not null,
	primary key(id_peserta)
 );
 
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('00128','ZHANG','ILMU KOMPUTER',102);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('12345','SHANKAR','ILMU KOMPUTER',32);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('19991','BRANDT','SEJARAH',80);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('23121','CHAVEZ','EKONOMI',110);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('44553','PELTIER','FISIKA',56);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('45678','LEVY','FISIKA',46);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('54321','WILLIAMS','ILMU KOMPUTER',54);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('70557','SNOW','FISIKA',0);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('76543','BROWN','ILMU KOMPUTER',58);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('76653','AOI','TEKNIK ELEKTRO',60);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('98765','BOURIKAS','TEKNIK ELEKTRO',98);
 INSERT INTO PESERTA(ID_PESERTA,NAMA,JURUSAN,TOTAL_SKS) VALUES('98988','TANAKA','BIOLOGI',120);
 
 create table pelajaran(
   kode_p varchar2(8) not null,
   mata_pelajaran varchar2(30) not null,
   jurusan varchar2(20) not null,
   sks number not null,
   primary key(kode_p)
 );
 
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('BIO-101','PENGENALAN BIOLOGI','BIOLOGI',4);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('BIO-301','GENETIKA','BIOLOGI',4);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('BIO-399','KOMPUTASI BIOLOGI','BIOLOGI',4);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('CS-101','PENGENALAN ILMU KOMPUTER','ILMU KOMPUTER',3);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('CS-190','GAMIFICATION','ILMU KOMPUTER',4);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('CS-315','ROBOTIKA','ILMU KOMPUTER',4);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('CS-319','PENGOLAHAN CITRA','ILMU KOMPUTER',3);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('CS-347','SISTEM BASIS DATA','ILMU KOMPUTER',3);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('EE-181','PENGENALAN DIGITAL','TEKNIK ELEKTRO',3);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('FIN-201','INVESTASI PERBANKAN','EKONOMI',3);
 INSERT INTO PELAJARAN(KODE_P,MATA_PELAJARAN,JURUSAN,SKS) VALUES ('HIS-351','SEJARAH DUNIA','SEJARAH DAN BUDAYA',3);
 
 create table jadwal(
   kode_p varchar2(8) not null,
   sesi_jadwal char(1) not null,
   semester varchar2(15) not null,
   tahun char(4) not null,
   gedung varchar2(15) not null,
   ruang char(5) not null,
   waktu char(6) not null,
   foreign key(kode_p) references pelajaran(kode_p)
 );
 
  INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('BIO-101','1','GANJIL','2014','PAINTER','514','SIANG');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('BIO-301','1','GANJIL','2015','PAINTER','514','SIANG');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-101','1','GANJIL','2014','PACKARD','101','MALAM');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-101','1','GENAP','2015','PACKARD','101','MALAM');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-190','1','GENAP','2014','TAYLOR','3128','SIANG');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-190','2','GENAP','2014','TAYLOR','3128','MALAM');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-315','1','GENAP','2015','WATSON','120','SIANG');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-319','1','GENAP','2015','WATSON','100','MALAM');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-319','2','GENAP','2015','TAYLOR','3128','SIANG');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('CS-347','1','GANJIL','2014','TAYLOR','3128','MALAM');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('EE-181','1','GENAP','2014','TAYLOR','3128','MAZLAM');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('FIN-201','1','GENAP','2015','PACKARD','101','SIANG');
 INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 ('HIS-351','1','GENAP','2015','PAINTER','514','SIANG');
 --INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
-- ('MU-199','1','GENAP','2015','PACKARD','101','MALAM');
 --INSERT INTO JADWAL(KODE_P,SESI_JADWAL,SEMESTER,TAHUN,GEDUNG,RUANG,WAKTU) VALUES
 --('PHY-101','1','GANJIL','2014','WATSON','100','MALAM');
 
 create table pengajar(
   id_pengajar char(6) not null,
   nama varchar2(20) not null,
   jurusan varchar2(30) not null,
   honor number,
   primary key(id_pengajar)  
  );
  
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('22222','EINSTEIN','FISIKA',95000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('12121','WU','EKONOMI',90000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('32343','EL SAID','SEJARAH DAN BUDAYA',60000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('45565','KATZ','ILMU KOMPUTER',75000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('98345','KIM','TEKNIK ELEKTRO',80000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('76766','CRICK','BIOLOGI',72000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('10101','SRINIVASAN','ILMU KOMPUTER',65000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('58583','CALIFIERI','SEJARAH DAN BUDAYA',62000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('83821','BRANDT','ILMU KOMPUTER',92000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('33456','GOLD','FISIKA',87000);
  INSERT INTO PENGAJAR(ID_PENGAJAR,NAMA,JURUSAN,HONOR) VALUES('76543','SINGH','EKONOMI',80000);
  
  
  create table kelas(
    id_pengajar char(6) not null,
    kode_p varchar2(8) not null,
	semester varchar2(15) not null,
	tahun char(4) not null,
	foreign key(id_pengajar) references pengajar(id_pengajar),
	foreign key(kode_p) references pelajaran (kode_p)
  );
  
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('10101','CS-101','GANJIL','2014');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('10101','CS-315','GENAP','2015');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('10101','CS-347','GANJIL','2014');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('12121','FIN-201','GENAP','2015');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('32343','HIS-351','GENAP','2015');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('45565','CS-101','GENAP','2015');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('45565','CS-319','GENAP','2015');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('76766','BIO-301','GANJIL','2015');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('83821','CS-190','GENAP','2014');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('83821','CS-190','GENAP','2014');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('83821','CS-319','GENAP','2015');
  INSERT INTO KELAS(ID_PENGAJAR,KODE_P,SEMESTER,TAHUN) VALUES('98345','EE-181','GENAP','2014');

  
  
  create table nilai(
    id_peserta varchar2(6) not null,
	kode_p varchar2(8) not null,
	semester varchar2(15) not null,
	tahun char(4) not null,
	huruf_mutu char(2) null,
	foreign key(id_peserta) references peserta(id_peserta),
	foreign key(kode_p) references pelajaran(kode_p)
  );
  
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU)VALUES('00128','CS-101','GANJIL','2014','A');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('00128','CS-347','GANJIL','2014','A');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('12345','CS-101','GANJIL','2014','C');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('12345','CS-190','GENAP','2014','A');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('19991','HIS-351','GENAP','2015','B');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('23121','FIN-201','GENAP','2015','A');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('98988','BIO-101','GANJIL','2014','A');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('98988','BIO-301','GANJIL','2015',NULL);
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('76653','EE-181','GENAP','2014','C');
  INSERT INTO NILAI(ID_PESERTA,KODE_P,SEMESTER,TAHUN,HURUF_MUTU) VALUES('76543','CS-319','GENAP','2015','A');
  

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
  end_time TIMESTAMP NOT NULL,
  activate_time TIMESTAMP NOT NULL
);

INSERT INTO time_table (idx, start_time, end_time, activate_time) 
VALUES ('1', TO_TIMESTAMP ('2016-11-15 13:00', 'YYYY-MM-DD HH24:MI') ,TO_TIMESTAMP ('2016-11-15 15:00', 'YYYY-MM-DD HH24:MI') ,TO_TIMESTAMP ('2016-11-14 23:00', 'YYYY-MM-DD HH24:MI'));

commit;

--JANGAN LUPA COMMIT!!!!!----------------------------------------------------

select * from login;
select * from scoreboard;

create table peserta( id_peserta varchar2(6) not null, nama varchar2(20) not null, jurusan varchar2(30) not null, total_sks number not null, primary key(id_peserta));
create table pelajaran( kode_p varchar2(8) not null, mata_pelajaran varchar2(30) not null, jurusan varchar2(20) not null, sks number not null, primary key(kode_p));

COMMIT;
DROP USER sqluntar005 CASCADE;
DROP CASCADE USER  sqluntar001;
CREATE USER sqluntar001 IDENTIFIED BY 90955;
drop user sqluntar001;
create table sqluntar001.peserta( id_peserta varchar2(6) not null, nama varchar2(20) not null, jurusan varchar2(30) not null, total_sks number not null, primary key(id_peserta));


SELECT c.name_code, c.name, c.school, count(verdict) verd , Sum(s.time_after_penalty) totscore FROM scoreboard s JOIN contestant c ON(s.name_code = c.name_code) WHERE s.verdict!=0 group by c.name_code, c.name, c.school ORDER BY verd asc, totscore asc;


select * from time_table;

UPDATE time_table SET start_time = TO_TIMESTAMP ('2016-11-15 15:00', 'YYYY-MM-DD HH24:MI') , 
end_time = TO_TIMESTAMP ('2016-11-15 20:00', 'YYYY-MM-DD HH24:MI') ,
activate_time = TO_TIMESTAMP ('2016-11-15 06:00', 'YYYY-MM-DD HH24:MI');
commit;

truncate table SQLUNTAR001.PESERTAINSERT;
select * from submission;

truncate table submission;

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
INSERT INTO time_table (idx, start_time, end_time, activate_time) 
VALUES ('1', TO_TIMESTAMP ('2016-11-15 01:00', 'YYYY-MM-DD HH24:MI') ,TO_TIMESTAMP ('2016-11-15 06:00', 'YYYY-MM-DD HH24:MI') ,TO_TIMESTAMP ('2016-11-14 23:00', 'YYYY-MM-DD HH24:MI'));

select * from time_table;
select * from login;


commit;
SELECT TO_DATE (start_time, 'YYYY-MM-DD HH:MI:SS') FROM time_table;
select ((extract(day from int_val)
  + extract(hour from int_val) / 24
  + extract(minute from int_val) / (24 * 60)
  + extract(second from int_val) / (24 * 60 * 60))
  * power(2,44)) + power(2,60)
as z
from (
select activate_time - timestamp '1970-01-01 00:00:00' as int_val from time_table);

SELECT (TO_DATE (TO_CHAR (end_time, 'YYYY-MON-DD HH24:MI:SS'),
                'YYYY-MON-DD HH24:MI:SS'
               ) - TO_DATE('01-01-1970 00:00:00', 'DD-MM-YYYY HH24:MI:SS')) * 24 * 60 * 60 * 1000 AS y FROM time_table;

SELECT TO_CHAR (end_time, 'YYYY-MON-DD HH24:MI:SS') as Y FROM time_table;
select * from time_table;
SELECT round((SYSDATE - TO_DATE('01-01-1970 00:00:00', 'DD-MM-YYYY HH24:MI:SS')) , 9) * 24 * 60 * 60  AS X FROM DUAL;
select * from time_table;
SELECT (TO_DATE (TO_CHAR (start_time, 'YYYY-MON-DD HH24:MI:SS'),
                'YYYY-MON-DD HH24:MI:SS'
               ) - TO_DATE('01-01-1970 00:00:00', 'DD-MM-YYYY HH24:MI:SS')) * 24 * 60 * 60 * 1000 AS x FROM time_table;


SELECT (TO_DATE (TO_CHAR (activate_time, 'YYYY-MON-DD HH24:MI:SS'),
                'YYYY-MON-DD HH24:MI:SS'
               ) - TO_DATE('01-01-1970 00:00:00', 'DD-MM-YYYY HH24:MI:SS')) * 24 * 60 * 60 * 1000 AS z FROM time_table;



drop table kampret;
INSERT INTO kampret (date) VALUES ( '01-01-1970 00:00:00') ;

select * FROM time_table;
select ((extract(day from int_val)
  + extract(hour from int_val) / 24
  + extract(minute from int_val) / (24 * 60)
  + extract(second from int_val) / (24 * 60 * 60))
  * power(2,44)) + power(2,60)
as x
from (
select start_time - timestamp '1970-01-01 00:00:00' as int_val from time_table);


select ((extract(day from int_val)
  + extract(hour from int_val) / 24
  + extract(minute from int_val) / (24 * 60)
  + extract(second from int_val) / (24 * 60 * 60))
  * power(2,44)) + power(2,60)
as y
from (
select end_time - timestamp '1970-01-01 00:00:00' as int_val from time_table);


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

select ((extract(day from int_val)
  + extract(hour from int_val) / 24
  + extract(minute from int_val) / (24 * 60)
  + extract(second from int_val) / (24 * 60 * 60))
  * power(2,44)) + power(2,60)
as x
from (
select systimestamp - to_timestamp( '1970-01-01 00:00:00', 'YYYY-MM-MM HH24:m') as int_val from dual);

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
  
  
  
  select password from login where username = 'sqluntar001';
  
  
  
  