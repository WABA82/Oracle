/*
����
1. �Ʒ��� ���� �����͸� ������ �� �ִ� ���̺��� �����Ѵ�.
 ��ȣ - �����̸� 5�ڸ����� �Է�
 �̸� - �����������̸� �ѱ۷� 10�ڱ��� �Է�.
 ���� - ���������̸� ����� 1�� �Է�.
 �ּ� - �����������̸� �ѱ۷� 120�� �����Է�.
 ���� - �����̸� 3�ڱ��� �Է�
 �Է��� - �����Ͱ� �߰��Ǵ� ���� �Ϸ� �Է�.
*/

create table team_info(
	num number(5),
	name varchar2(30),
	gender char(1),
	adress varchar2(360),
	score number(3),
	I_date date
);
/*
 select tname from tab;
 /*
2. �� ���̺� �Ʒ��� ���� �����͸� �߰��Ѵ�.
  1, '����ȣ', 'M', '����� ������ ���ﵿ',64,����
  2, '������', 'M', '����� ���α� ������',87,����
  3, '������', 'F', '����� �������� ���ǵ���',97,����
  4, 'Ȳ�缺', 'M', '����� ���۱� �󵵵�',100,����
  5, '���缮', 'M', '��⵵ ������ ���뱸',100,����
 */
 insert into team_info(num, name, gender, adress, score, I_date)
  values(1,'����ȣ','M','����� ������ ���ﵿ',64,sysdate);

 insert into team_info(num, name, gender, adress, score, I_date)
  values(2,'������','M','����� ���α� ������',87,sysdate);

   insert into team_info(num, name, gender, adress, score, I_date)
  values(3,'������','F','����� �������� ���ǵ���',97,sysdate);

   insert into team_info(num, name, gender, adress, score, I_date)
  values(4,'Ȳ�缺','M','����� ���۱� �󵵵�',100,sysdate);

   insert into team_info(num, name, gender, adress, score, I_date)
  values(5,'���缮','M','��⵵ ������ ���뱸',100,sysdate);

  select * from TEAM_INFO;

-- 3. �� �Էµ� ������ �� ���� ��ȣ�� 3���̸� ������ 97���� ����� �̸��� '�׽�Ʈ'�� ������ 'M'���� �����Ѵ�.
 update team_info
 set	name='�׽�Ʈ', gender='M'
 where num=3 and score=97;

commit;

   select * from TEAM_INFO;

--4. ���� �����Ϳ��� �̸��� '���缮'�� ����Ǽ����� 'F'�� �����Ѵ�.
 update team_info
 set gender='F'
 where name='���缮';

 commit;

   select * from TEAM_INFO;

 savepoint update_a;
 update team_info
 set gender='W'
 where name='���缮';


   select * from TEAM_INFO;

   rollback to update_a ;


	select * from TEAM_INFO;

	delete from  TEAM_INFO
	where num=1 and name='������';

	select * from TEAM_INFO;

	truncate table team_info;

	drop table team_info;

	 select tname from tab;

	 purge recyclebin;

	 	 select tname from tab;

/*

5. 4���� �۾��� ����Ѵ�.

6. ��ȣ�� 1���̸� �̸��� �������� ����� �����͸� �����Ѵ�.

7. ��� �����͸� �����Ѵ�.

8. ���̺��� �����Ѵ�.

9. �������� ����.
*/
