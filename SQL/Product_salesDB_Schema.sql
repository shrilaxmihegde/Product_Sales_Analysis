-----------------------------------
--     Tables create and drop --
-------------------------------------
-- products_sheet_processed
--drop table products_sheet_processed CASCADE;
create table products_sheet_processed(
productid int NOT NULL,
product_name varchar NOT NULL,
PRIMARY KEY (productid)		
);

--sales_team_sheet_processed
--drop table sales_team_sheet_processed CASCADE;

commit;

create table sales_team_sheet_processed(
salesteamid int,
sales_team varchar(100) NOT NULL,
region varchar(10) NOT NULL,
PRIMARY KEY (salesteamid)
);
	
-- store_region_processed
--drop table store_region_processed CASCADE;
create table store_region_processed(
storeid int NOT NULL,
city_name varchar(200) NOT NULL,
county varchar (200) NOT NULL,
statecode varchar (50) NOT NULL,
state varchar(100)NOT NULL,
type varchar(50)NOT NULL,
latitude float, 
longitude float,
areacode varchar,
population int,
household_income float,
median_income float,
land_area int,
water_area int,
time_zone varchar(100),
location varchar(500),
region varchar(10),
PRIMARY KEY (storeid)	
	);	
	
--customer_data_processed
--drop table  customer_data_processed CASCADE;

create table customer_data_processed(
customerid int NOT NULL,
customer_names varchar NOT NULL,
 PRIMARY KEY (customerid)	
);
	
--sales_order_sheet_processed
--Drop table sales_order_sheet_processed;
create table sales_order_sheet_processed (
ordernumber varchar(500) NOT NULL,
sales_channel varchar(50) NOT NULL,	
warehousecode varchar(100),
procureddate date ,
orderdate date NOT NULL,
shipdate date ,
deliverydate date ,
currencycode varchar NOT NULL,
salesteamid int NOT NULL,
customerid int NOT NULL,
storeid int NOT NULL,
productid int NOT NULL,
order_quantity int NOT NULL,
discount_applied float ,
unit_price float NOT NULL,
unit_cost float	 NOT NULL,
order_total float NOT NULL,
order_discount float ,	
grand_total float NOT NULL,
PRIMARY KEY (ordernumber),
FOREIGN KEY (customerid) REFERENCES customer_data_processed (customerid),
FOREIGN KEY (salesteamid) REFERENCES sales_team_sheet_processed (salesteamid),
FOREIGN KEY (storeid) REFERENCES store_region_processed (storeid),
FOREIGN KEY (productid) REFERENCES products_sheet_processed (productid)
	);
--------------------------------------------
-- Delete tables records for data reload --
--------------------------------------------
delete from sales_order_sheet_processed ;
delete from products_sheet_processed;
delete from sales_team_sheet_processed;
delete from customer_data_processed ;
delete from store_region_processed;
commit ;

-----------------------------------
--     Verify data loaded or not --
-------------------------------------
select ',sales_order_sheet_processed' as table_name, count(1) as total_records from sales_order_sheet_processed 
union all
select 'products_sheet_processed', count(1) as total_records from products_sheet_processed
union all
select 'sales_team_sheet_processed' , count(1) as total_records from sales_team_sheet_processed
union all
select 'customer_data_processed', count(1) as total_records from customer_data_processed 
union all
select 'store_region_processed', count(1) as total_records  from store_region_processed;