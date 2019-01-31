select * from ORDERING;

select * from LUNCH;

--��ũĥ��, L_000001, �� �Ǹż��� 4��, 4500*4 = 18000
--���, L_000002, �� �Ǹż��� 1��, 3800*1 = 1

select to_char(to_date('2019-1-15','yyyy-mm-dd'),'yyyy-mm-dd')
from dual;
;
select l.lunch_name, l.lunch_code, sum(o.quan) total, sum(o.quan)*l.price price
from  lunch l, ordering o
where (o.lunch_code = l.lunch_code)
			and to_char(o.order_date, 'yyyy-mm-dd')=to_char(to_date('2019-1-16','yyyy-mm-dd'),'yyyy-mm-dd')
group by l.lunch_code, l.lunch_name, l.price
order by l.lunch_code;
