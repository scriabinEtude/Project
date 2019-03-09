
/* Drop Tables */

DROP TABLE content_category CASCADE CONSTRAINTS;
DROP TABLE inters CASCADE CONSTRAINTS;
DROP TABLE Category CASCADE CONSTRAINTS;
DROP TABLE replys CASCADE CONSTRAINTS;
DROP TABLE comments CASCADE CONSTRAINTS;
DROP TABLE Companies CASCADE CONSTRAINTS;
DROP TABLE ShippingInfo CASCADE CONSTRAINTS;
DROP TABLE Funding CASCADE CONSTRAINTS;
DROP TABLE News CASCADE CONSTRAINTS;
DROP TABLE Rewards CASCADE CONSTRAINTS;
DROP TABLE Contents CASCADE CONSTRAINTS;
DROP TABLE follow CASCADE CONSTRAINTS;
DROP TABLE Supporters CASCADE CONSTRAINTS;
DROP TABLE tmp_col CASCADE CONSTRAINTS;
DROP TABLE tmp_row CASCADE CONSTRAINTS;

PURGE recyclebin;


/* Create Tables */

CREATE TABLE Category
(
	name varchar2(10) NOT NULL,
	description varchar2(100),
	PRIMARY KEY (name)
);


CREATE TABLE comments
(
	comment_no number NOT NULL,
	content_no number NOT NULL,
	id varchar2(30) NOT NULL,
	content varchar2(1000),
	postdate date DEFAULT SYSDATE,
	heart number,
	disheart number,
	PRIMARY KEY (comment_no)
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


CREATE TABLE Contents
(
	content_no number NOT NULL,
	id varchar2(30) NOT NULL,
	title varchar2(50),
	subtitle varchar2(500),
	goal number,
	PostDate date DEFAULT SYSDATE,
	goalDate date,
	profile varchar2(30),
	content varchar2(50),
	heart number,
	shared number,
	PRIMARY KEY (content_no)
);


CREATE TABLE content_category
(
	content_no number NOT NULL,
	name varchar2(10) NOT NULL,
	PRIMARY KEY (content_no, name)
);


CREATE TABLE follow
(
	fromid varchar2(30) NOT NULL,
	toid varchar2(30) NOT NULL,
	PRIMARY KEY (fromid, toid)
);


CREATE TABLE Funding
(
	funding_no number NOT NULL,
	id varchar2(30) NOT NULL,
	content_no number NOT NULL,
	reward_no number,
	count number,
	shipping_zipcode varchar2(15),
	shipping_address varchar2(500),
	request varchar2(200),
	funding_way varchar2(15),
	-- 결제 API거나 정보를 저장한 후 결제하거나
	funding_info varchar2(50),
	regidate date DEFAULT SYSDATE,
	PRIMARY KEY (funding_no)
);


CREATE TABLE inters
(
	id varchar2(30) NOT NULL,
	name varchar2(10) NOT NULL,
	PRIMARY KEY (id, name)
);


CREATE TABLE News
(
	news_no number NOT NULL,
	content_no number NOT NULL,
	title varchar2(50),
	subtitle varchar2(500),
	profile varchar2(50),
	content varchar2(50),
	postdate date,
	PRIMARY KEY (news_no)
);


CREATE TABLE replys
(
	reply_no number NOT NULL,
	comment_no number NOT NULL,
	id varchar2(30) NOT NULL,
	content varchar2(1000),
	postdate date DEFAULT SYSDATE,
	heart number,
	disheart number,
	PRIMARY KEY (reply_no)
);


CREATE TABLE Rewards
(
	reward_no number NOT NULL,
	content_no number NOT NULL,
	title varchar2(50),
	subtitle varchar2(500),
	price number,
	shipping_pee number,
	scheduleddate date,
	count number,
	PRIMARY KEY (reward_no)
);


CREATE TABLE ShippingInfo
(
	funding_no number NOT NULL,
	post_url varchar2(1000),
	PRIMARY KEY (funding_no)
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


CREATE TABLE tmp_col
(
	tmp number
);


CREATE TABLE tmp_row
(
	tmp number
);



/* Create Foreign Keys */

ALTER TABLE content_category
	ADD FOREIGN KEY (name)
	REFERENCES Category (name)
;


ALTER TABLE inters
	ADD FOREIGN KEY (name)
	REFERENCES Category (name)
;


ALTER TABLE replys
	ADD FOREIGN KEY (comment_no)
	REFERENCES comments (comment_no)
;


ALTER TABLE comments
	ADD FOREIGN KEY (content_no)
	REFERENCES Contents (content_no)
;


ALTER TABLE content_category
	ADD FOREIGN KEY (content_no)
	REFERENCES Contents (content_no)
;


ALTER TABLE Funding
	ADD FOREIGN KEY (content_no)
	REFERENCES Contents (content_no)
;


ALTER TABLE News
	ADD FOREIGN KEY (content_no)
	REFERENCES Contents (content_no)
;


ALTER TABLE Rewards
	ADD FOREIGN KEY (content_no)
	REFERENCES Contents (content_no)
;


ALTER TABLE ShippingInfo
	ADD FOREIGN KEY (funding_no)
	REFERENCES Funding (funding_no)
;


ALTER TABLE comments
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;


ALTER TABLE Companies
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;


ALTER TABLE Contents
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;


ALTER TABLE follow
	ADD FOREIGN KEY (toid)
	REFERENCES Supporters (id)
;


ALTER TABLE follow
	ADD FOREIGN KEY (fromid)
	REFERENCES Supporters (id)
;


ALTER TABLE Funding
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;


ALTER TABLE inters
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;


ALTER TABLE replys
	ADD FOREIGN KEY (id)
	REFERENCES Supporters (id)
;



