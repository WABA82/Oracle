--SUBJECT,STUDENT,TEST

INSERT INTO SUBJECT(SUB_CODE, TITLE, INFO)
VALUES('O_000001', '����Ŭ', '��뷮 DataBase�� �����ϴ� ���α׷�');
INSERT INTO SUBJECT(SUB_CODE, TITLE, INFO)
VALUES('J_000001', '�ڹ�', '�Ϻ��� OOP���');
COMMIT;

INSERT INTO SUBJECT(SUB_CODE, TITLE)
VALUES('A0','');

INSERT INTO STUDENT(stu_num, name, age, address, email)
values('S_00000001','������', 27,'�����', 'lee@test.com');

insert into test(test_num,sub_code, stu_num)
values(3,'J_000001','S_00000001');

select * from student;
select * from subject;
select * from test;                              
