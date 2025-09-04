create database assignment_1;
use assignment_1;


--WORKING WITH CUSTOMER TABLE
desc customer_orders;

--getting  customer order table
select * from customer_orders;

---Showing 50 orders
select * from customer_orders  limit 50;

--- Total no. of orders
select  count(order_id) from customer_orders;

---checking total order on the basis of order status
select count(order_id) as pending_orders from customer_orders where order_status ="pending";
select count(order_id) as delivered_orders from customer_orders where order_status ="delivered";
select count(order_id) as shipped_orders from customer_orders where order_status ="shipped";

---maximum nad minimum order amount
select round(max(order_amount)) from customer_orders;
select round(min(order_amount)) from customer_orders;

---average order amount
select round(avg(order_amount)) from customer_orders;

----Getting order amount on the basis of frequecy
select count(order_amount) ,order_amount from customer_orders group by order_amount ,
order by order_amount desc;

---Arranging customer table according to highest-lowest order amount
select *from customer_orders order by order_amount desc;

---getting customer id and count ,person order more than the average amount
select customer_id from customer_orders where order_amount>254;
select count(customer_id )from customer_orders where order_amount>254;


--WORKING WITH PAYMENTS TABLE
desc payments;

--getting payments table
select*from payments;

--finding no of order placed by differnet payment method respectively
select count(payment_method) from payments group by payment_method;

---calculating  no of orders placed by method of payment individually
select count(payment_id) from payments where payment_method="paypal";
select count(payment_id) from payments where payment_method="credit card";
select count(payment_id) from payments where payment_method="bank transfer";

---total sales
select round(sum(payment_amount) )from payments;

---average of payment amount
select round(avg(payment_amount))as avg_payment_amount from payments ;

--checking no of orders for payment status by using group by
select count(payment_status) from payments group by payment_status;

--checking no of orders for payment status individually for all type of payment status
select count(payment_status) as completed_orders from payments where payment_status="completed";
select count(payment_status)as failed_orders from payments where payment_status="failed";
select count(payment_status) as pending_orders from payments where payment_status="pending";

 ---calculating total order and sales on the basis of status and mode of payment  
 
 for FY 2020-2021 individually
select count(payment_id),round(sum(payment_amount) )as sales from payments where payment_date BETWEEN "01-01-2020"  and  "31-12-2020";

SELECT count(payment_id),round(SUM(payment_amount)) FROM payments WHERE payment_date BETWEEN "01-01-2020"  and  "31-12-2020" 
group by payment_status ;
SELECT count(payment_id),round(SUM(payment_amount)) FROM payments WHERE payment_date BETWEEN "01-01-2020"  and  "31-12-2020" 
group by payment_method ;

---calculating total order and amt recieved on the basis of status  for FY 2021-2022
select count(payment_id) ,round(sum(payment_amount)) from payments where payment_date BETWEEN "01-01-2021"  and  "31-12-2022";

select count(payment_id) ,round(SUM(payment_amount))as sales FROM payments WHERE payment_date BETWEEN "01-01-2021"  and  "31-12-2022"
group by payment_status; 
SELECT count(payment_id),round(SUM(payment_amount)) FROM payments WHERE payment_date BETWEEN "01-01-2021"  and  "31-12-2022" 
group by payment_method;


---calculating total order and amt recieved on the basis of status  for FY 2022-2023
select count(payment_id) ,round(sum(payment_amount)) from payments where payment_date BETWEEN "01-01-2022"  and  "31-12-2023";

select count(payment_id) ,round(SUM(payment_amount))as sales FROM payments WHERE payment_date BETWEEN "01-01-2022"  and  "31-12-2023"
group by payment_status ;
SELECT count(payment_id), round(SUM(payment_amount)) FROM payments WHERE payment_date BETWEEN "01-01-2022"  and  "31-12-2023" 
group by payment_method;

---calculating total order and amt recieved on the basis of status  for FY 2023-2024
select count(payment_id) ,round(SUM(payment_amount)) from payments where payment_date BETWEEN "01-01-2023"  and  "31-12-2024";

select count(payment_id) ,round(SUM(payment_amount)) as sales FROM payments WHERE payment_date BETWEEN "01-01-2023"  and  "31-12-2024"
group by payment_status;
SELECT count(payment_id), round(SUM(payment_amount)) FROM payments WHERE payment_date BETWEEN "01-01-2023"  and  "31-12-2024" 
group by payment_method ;

---calculating total order and amt recieved on the basis of status  for FY 2024-2025
select count(payment_id) ,round(SUM(payment_amount)) from payments where payment_date BETWEEN "01-01-2024"  and  "31-12-2025";

select count(payment_id) ,round(SUM(payment_amount)) as sales FROM payments WHERE payment_date BETWEEN "01-01-2024"  and  "31-12-2025"
group by payment_status;
SELECT count(payment_id),round(SUM(payment_amount)) as  FROM payments WHERE payment_date BETWEEN "01-01-2024"  and  "31-12-2025" 
group by payment_method;


---joining both tables 
select * from customer_orders join payments on customer_orders.order_id=payments.order_id;










































































