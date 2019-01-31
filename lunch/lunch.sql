/* 관리자 */
DROP TABLE Lunch_admin
	CASCADE CONSTRAINTS;

/* 도시락 */
DROP TABLE lunch
	CASCADE CONSTRAINTS;

/* 주문 */
DROP TABLE ordering
	CASCADE CONSTRAINTS;

--------------------- DDL for lunch_admin ---------------------

/* 관리자 */
CREATE TABLE lunch_admin (
	id VARCHAR2(20) NOT NULL, /* 아이디 */
	pass VARCHAR2(20) NOT NULL, /* 비밀번호 */
	name VARCHAR2(30) NOT NULL, /* 관리자명 */
	input_date DATE DEFAULT sysdate /* 입력일 */
);

CREATE UNIQUE INDEX PK_Lunch_admin
	ON Lunch_admin (
		id ASC
	);

ALTER TABLE Lunch_admin
	ADD
		CONSTRAINT PK_Lunch_admin
		PRIMARY KEY (
			id
		);

--------------------- DDL for lunch ---------------------

/* 도시락 */
CREATE TABLE lunch (
	lunch_code CHAR(8) NOT NULL, /* 도시락코드 */
	lunch_name VARCHAR2(60) NOT NULL, /* 도시락명 */
	img VARCHAR2(90) NOT NULL, /* 이미지 */
	price NUMBER(5) NOT NULL, /* 단가 */
	spec VARCHAR2(4000) NOT NULL, /* 특징 */
	input_date DATE DEFAULT sysdate, /* 입력일 */

	id VARCHAR2(20) /* 아이디 */
);

CREATE UNIQUE INDEX PK_lunch
	ON lunch (
		lunch_code ASC
	);

ALTER TABLE lunch
	ADD
		CONSTRAINT PK_lunch
		PRIMARY KEY (
			lunch_code
		);

--------------------- DDL for ordering ---------------------

/* 주문 */
CREATE TABLE ordering (
	order_num CHAR(12) NOT NULL, /* 주문번호 */
	quan NUMBER(2) NOT NULL, /* 새 컬럼 */
	order_name VARCHAR2(30) NOT NULL, /* 수량 */
	phone VARCHAR2(13) NOT NULL, /* 주문자명 */
	ip_adress VARCHAR2(15) NOT NULL, /* 전화번호 */
	order_date DATE DEFAULT sysdate, /* 주문자IP */
	status CHAR(1) DEFAULT 'N', /* 주문일자 */
	lunch_code CHAR(8) /* 제작상태 */
);

CREATE UNIQUE INDEX PK_ordering
	ON odering (
		order_num ASC
	);

ALTER TABLE odering
	ADD
		CONSTRAINT PK_ordering
		PRIMARY KEY (
			order_num
		);

ALTER TABLE lunch
	ADD
		CONSTRAINT FK_lunch_id
		FOREIGN KEY (
			id
		)
		REFERENCES Lunch_admin (
			id
		);



 TABLE odering
	ADD
		CONSTRAINT FK_lunch_TO_ordering
		FOREIGN KEY (
			lunch_code
		)
		REFERENCES lunch (
			lunch_code
		);

--------

select * from LUNCH             ;
select * from LUNCH_ADMIN;
select * from ORDERING        ;





















