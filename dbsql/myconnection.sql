create table contestant (
  name_code VARCHAR(10) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  school VARCHAR(50) NOT NULL
);

create table login (
  username VARCHAR(5) PRIMARY KEY,
  password VARCHAR(10),
  name_code NOT NULL CONSTRAINT lg_nmc_fk REFERENCES contestant(name_code)
);

CREATE TABLE problem (
  prob_num INT PRIMARY KEY,
  solution_query VARCHAR2(4000) NOT NULL
);

CREATE TABLE submission (
  sub_id VARCHAR(11) PRIMARY KEY,
  submitted_text VARCHAR2(4000) NOT NULL,
  prob_num INT NOT NULL CONSTRAINT subm_submtd_fk REFERENCES problem(prob_num),
  submit_time TIMESTAMP NOT NULL
);

CREATE TABLE totalscore (
  name_code PRIMARY KEY CONSTRAINT tots_nc_fk REFERENCES contestant(name_code),
  score INT NOT NULL
);


INSERT INTO contestant (name_code, name, school) VALUES ('sql-01', 'blashh21', 'UNTAR');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-02', 'Azure Dragon 77', 'UNTAR');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-03', 'TeamTam', 'NUS');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-04', 'NightRain', 'UNTAR');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-05', 'Awrakin', 'UI');
INSERT INTO contestant (name_code, name, school) VALUES ('sql-06', 'Ainge WF', 'ITB');

INSERT INTO totalscore (name_code, score) VALUES('sql-01', 100);
INSERT INTO totalscore (name_code, score) VALUES('sql-02', 90);
INSERT INTO totalscore (name_code, score) VALUES('sql-03', 80);
INSERT INTO totalscore (name_code, score) VALUES('sql-04', 70);
INSERT INTO totalscore (name_code, score) VALUES('sql-05', 60);
INSERT INTO totalscore (name_code, score) VALUES('sql-06', 50);




SELECT * FROM V$NLS_PARAMETERS;