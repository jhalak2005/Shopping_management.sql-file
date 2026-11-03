drop database if exists shopping_management;
create database shopping_management;
use shopping_management;

create table customers(
		customer_id int primary key auto_increment,
        customer_name varchar(100) not null,
        email varchar (100) unique,
        phone_number varchar(10)not null,
        age tinyint unsigned check(age>0),
        gender enum ('male','female','other'),
        country varchar (50)default 'India',
        city varchar(50)default 'delhi',
        pincode char(6)default'201301',
        registration_date date default(current_date),
        registration_time time default(current_time),
        created_at timestamp default(current_timestamp),
        address varchar(250)not null,
        customer_status enum('active','inactive','blocked')default'active',
        customers_notes tinytext);
        
show create table customers;
select* from customers;

insert into customers(customer_name,email,phone_number,age,gender,city,address,customer_status)values
('vaishnavi','vaishnavi@gmail.com','9972634896',23,'female','delhi','rohini','active'),
('bhumi','bhumi21@gmail.com','9972635643',22,'female','delhi','preet vihar','active'),
('rahul','rahul@gmail.com','9972634823',28,'male','delhi','janakpuri','inactive'),
('shivam','shivam12@gmail.com','9972635438',23,'male','delhi','dwarka','inactive'),
('rashika','rashika@gmail.com','9972634842',21,'female','delhi','lajpat nagar','active');

alter table customers
drop check customer_chk_1;

alter table customers add constraint chk_age check (age>=0);
                
create table orders(
		order_id int primary key auto_increment,
        customer_id int,
        order_date date default(current_date),
        order_amount decimal(10,2)not null ,
        order_status enum('pending','processing','shipped','delivered','cancelled')default'pending',
        payment_method enum('cash','card','upi','net banking'),
        payment_status enum('pending','paid','failed')default'pending',
        shipping_address varchar(250)not null,
        delivery_pincode varchar(6),
        quantity int unsigned check (quantity>0),
        discount_amount decimal (10,2),
        delivery_date date default(current_date),
        create_at timestamp default(current_timestamp),
        tracking_number varchar(30)default'not null',
		delivery_status enum ('not dispatched','in transit','delivery','returned')default 'not dispatched',
        order_notes tinytext);
show create table orders;
select*from orders;
insert into orders(customer_id ,order_amount,order_status,payment_method,payment_status,shipping_address,delivery_pincode,quantity,tracking_number,delivery_status)value
(102,1499.78,'processing','card','paid','MG Road, Bangalore','560001',4,'TRK1245760','in transit'),
(103,2358.32,'shipped','upi','paid','Lajpat nagar, Delhi','560301',5,'TRK1273760','delivery'),
(104,764.54,'delivered','card','paid','MG Road, Bangalore','660501',2,'TRK1625760','in transit'),
(106,149.28,'processing','cash','pending','Gandhi Nagar,Delhi','560201',3,'TRK1345760','delivery'),
(105,7543.83,'delivered','cash','paid','vikas marg, Delhi','110041',7,'TRK1256760','in transit'),
(108,2369.48,'processing','card','paid','MG Road, Bangalore','560451',6,'TRK1245764','in transit');

        
