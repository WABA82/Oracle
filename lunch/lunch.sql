/* ������ */
DROP TABLE Lunch_admin
	CASCADE CONSTRAINTS;

/* ���ö� */
DROP TABLE lunch
	CASCADE CONSTRAINTS;

/* �ֹ� */
DROP TABLE ordering
	CASCADE CONSTRAINTS;

--------------------- DDL for lunch_admin ---------------------

/* ������ */
CREATE TABLE lunch_admin (
	id VARCHAR2(20) NOT NULL, /* ���̵� */
	pass VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	name VARCHAR2(30) NOT NULL, /* �����ڸ� */
	input_date DATE DEFAULT sysdate /* �Է��� */
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

/* ���ö� */
CREATE TABLE lunch (
	lunch_code CHAR(8) NOT NULL, /* ���ö��ڵ� */
	lunch_name VARCHAR2(60) NOT NULL, /* ���ö��� */
	img VARCHAR2(90) NOT NULL, /* �̹��� */
	price NUMBER(5) NOT NULL, /* �ܰ� */
	spec VARCHAR2(4000) NOT NULL, /* Ư¡ */
	input_date DATE DEFAULT sysdate, /* �Է��� */

	id VARCHAR2(20) /* ���̵� */
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

/* �ֹ� */
CREATE TABLE ordering (
	order_num CHAR(12) NOT NULL, /* �ֹ���ȣ */
	quan NUMBER(2) NOT NULL, /* �� �÷� */
	order_name VARCHAR2(30) NOT NULL, /* ���� */
	phone VARCHAR2(13) NOT NULL, /* �ֹ��ڸ� */
	ip_adress VARCHAR2(15) NOT NULL, /* ��ȭ��ȣ */
	order_date DATE DEFAULT sysdate, /* �ֹ���IP */
	status CHAR(1) DEFAULT 'N', /* �ֹ����� */
	lunch_code CHAR(8) /* ���ۻ��� */
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





















