--주문번호, 도시락코드, 도시락명, 주문자명, 수량, 가격,
--주문일, 연락처, ip,제작상태

select o.order_num, l.lunch_code, l.lunch_name, o.order_name,
			o.quan, l.price, to_char(o.order_date,'yyyy-mm-dd hh:mi:ss')order_date,
			 o.phone, o.ip_address, o.status
from  lunch l, ordering o
where o.lunch_code=l.lunch_code
		and to_char(order_date,'yyyy-mm-dd')=to_char(sysdate,'yyyy-mm-dd')
		and to_char(order_date, 'hh24')<=13
order by o.order_num;
