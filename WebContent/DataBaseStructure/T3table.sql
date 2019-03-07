
/* Drop Tables */

DROP TABLE inters CASCADE CONSTRAINTS;
DROP TABLE Category CASCADE CONSTRAINTS;
DROP TABLE Companies CASCADE CONSTRAINTS;
DROP TABLE Content CASCADE CONSTRAINTS;
DROP TABLE follow CASCADE CONSTRAINTS;
DROP TABLE Supporters CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE Category
(
	name varchar2(10) NOT NULL,
	description varchar2(100),
	PRIMARY KEY (name)
);


CREATE TABLE Companies
(
	id varchar2(30) NOT NULL,
	name varchar2(20),
	CEO varchar2(20),
	description varchar2(1000),
	homepage varchar2(100),
	email varchar2(30),
	sns varchar2(100),
	tel varchar2(15),
	PRIMARY KEY (id)
);


CREATE TABLE Content
(
	no number NOT NULL,
	id varchar2(30),
	title varchar2(50),
	subtitle varchar2(500),
	goal number,
	PRIMARY KEY (no)
);


CREATE TABLE follow
(
	fromid varchar2(30) NOT NULL,
	toid varchar2(30) NOT NULL,
	PRIMARY KEY (fromid, toid)
);


CREATE TABLE inters
(
	id varchar2(30) NOT NULL,
	name varchar2(10) NOT NULL,
	PRIMARY KEY (id, name)
);


CREATE TABLE Supporters
(
	id varchar2(30) NOT NULL,
	password varchar2(20),
	name varchar2(20),
	type varchar2(4),
	tel varchar2(12),
	zipcode varchar2(12),
	address varchar2(100),
	heart number,
	report number,
	PRIMARY KEY (id)
);

/* Create Foreign Keys */

ALTER TABLE inters
	ADD FOREIGN KEY (name)
	REFERENCES Category (name)
;


ALTER TABLE Companies
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;


ALTER TABLE follow
	ADD FOREIGN KEY (fromid)
	REFERENCES Supporters (id)
;


ALTER TABLE follow
	ADD FOREIGN KEY (toid)
	REFERENCES Supporters (id)
;


ALTER TABLE inters
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;



