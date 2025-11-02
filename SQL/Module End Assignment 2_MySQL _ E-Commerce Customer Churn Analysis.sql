DROP DATABASE IF EXISTS ecomm;
CREATE DATABASE ecomm;
USE ecomm;

CREATE TABLE customer_churn(
    CustomerID                  INT  PRIMARY KEY,
    Churn                       BIT,
    Tenure                      INT,
    PreferredLoginDevice        VARCHAR(20),
    CityTier                    INT,
    WarehouseToHome             INT,
    PreferredPaymentMode        VARCHAR(20),
    Gender                      ENUM('Male','Female'),
    HourSpendOnApp              INT,
    NumberOfDeviceRegistered    INT,
    PreferedOrderCat            VARCHAR(20),
    SatisfactionScore           INT,
    MaritalStatus               VARCHAR(10),
    NumberOfAddress             INT,
    Complain                    BIT,
    OrderAmountHikeFromlastYear INT,
    CouponUsed                  INT,
    OrderCount                  INT,
    DaySinceLastOrder           INT,
    CashbackAmount              INT
    );


    
    -- -----------------------------------------------------------------------------------------------------------------------------------------------------
    
-- Data Cleaning:
-- Handling Missing Values and Outliers:
-- ➢ Impute mean for the following columns, and round off to the nearest integer if required: 
-- WarehouseToHome, HourSpendOnApp, OrderAmountHikeFromlastYear, DaySinceLastOrder.
set sql_safe_updates=0;
set @WareHouseToHome_Avg=(select round(avg(WarehouseToHome)) from customer_Churn);
select @WareHouseToHome_Avg;
start transaction;
update customer_churn 
set warehouseTohome=@WareHouseToHome_Avg 
where WarehouseToHome is null;
rollback;

-- HourSpendOnApp
set @HourSpendOnApp_Avg=(select round(avg(HourSpendOnApp)) from customer_Churn);
select @HourSpendOnApp_Avg;
start transaction;
update customer_churn 
set HourSpendOnApp=@HourSpendOnApp_Avg 
where HourSpendOnApp is null;
rollback;

-- OrderAmountHikeFromlastYear
set @OrderAmountHikeFromlastYear_Avg=(select round(avg(OrderAmountHikeFromlastYear)) from customer_Churn);
select @OrderAmountHikeFromlastYear_Avg;
start transaction;
update customer_churn 
set OrderAmountHikeFromlastYear=@OrderAmountHikeFromlastYear_Avg 
where OrderAmountHikeFromlastYear is null;
rollback;


-- DaySinceLastOrder
set @DaySinceLastOrder_Avg=(select round(avg(DaySinceLastOrder)) from customer_Churn);
select @DaySinceLastOrder_Avg;
start transaction;
update customer_churn 
set DaySinceLastOrder=@DaySinceLastOrder_Avg 
where DaySinceLastOrder is null;
rollback;
   
-- ➢ Impute mode for the following columns: Tenure, CouponUsed, OrderCount.

-- Tenure
select tenure,count(*) from customer_Churn group by tenure order by count(*) desc;
set @Tenure_Mode=(select tenure from customer_Churn group by tenure order by count(*) desc limit 1);
select @Tenure_Mode;
start transaction;
update customer_churn 
set Tenure=@Tenure_Mode 
where Tenure is null;
rollback;

-- CouponUsed
select CouponUsed,count(*) from customer_Churn group by CouponUsed order by count(*) desc;
set @CouponUsed_Mode=(select CouponUsed from customer_Churn group by CouponUsed order by count(*) desc limit 1);
select @CouponUsed_Mode;
start transaction;
update customer_churn 
set CouponUsed=@CouponUsed_Mode 
where CouponUsed is null;
rollback;

-- OrderCount
select OrderCount,count(*) from customer_Churn group by OrderCount order by count(*) desc;
set @OrderCount_Mode=(select OrderCount from customer_Churn group by OrderCount order by count(*) desc limit 1);
select @OrderCount_Mode;
start transaction;
update customer_churn 
set OrderCount=@OrderCount_Mode 
where OrderCount is null;
rollback;

-- ➢ Handle outliers in the 'WarehouseToHome' column by deleting rows where the values are greater than 100.
select * from customer_churn where warehousetohome >100 ;
start transaction;
delete from customer_churn 
where warehousetohome >100 ;
rollback;

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- Dealing with Inconsistencies: 
-- ➢ Replace occurrences of “Phone” in the 'PreferredLoginDevice' column and 

start transaction;
update customer_churn 
set PreferredLoginDevice="Mobile Phone" 
where PreferredLoginDevice="Phone";
rollback;

-- “Mobile” in the 'PreferedOrderCat' column with “Mobile Phone” to ensure uniformity. 

start transaction;
update customer_churn 
set PreferedOrderCat="Mobile Phone" 
where PreferedOrderCat="Mobile";
rollback;

--  Standardize payment mode values: Replace "COD" with "Cash on Delivery" and 

start transaction;
update customer_churn 
set PreferredPaymentMode="Cash on Delivery" 
where PreferredPaymentMode="COD";
rollback;

-- "CC" with "Credit Card" in the PreferredPaymentMode column.

start transaction;
update customer_churn 
set PreferredPaymentMode="Credit Card" 
where PreferredPaymentMode="CC";
rollback;

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- Data Transformation:  (3 marks) 
-- Column Renaming: 
-- ➢ Rename the column "PreferedOrderCat" to "PreferredOrderCat". 

alter table customer_churn 
rename column PreferedOrderCat to PreferredOrderCat;

-- ➢ Rename the column "HourSpendOnApp" to "HoursSpentOnApp". 

alter table customer_churn 
rename column HourSpendOnApp to HoursSpentOnApp;

-- Creating New Columns: 
-- ➢ Create a new column named ‘ComplaintReceived’ with values "Yes" if the corresponding value in the ‘Complain’ is 1, and "No" otherwise. 
alter table customer_churn 
add column ComplaintReceived varchar(10);

update customer_churn 
set ComplaintReceived =if(Complain = 1 , 'Yes' , 'No' );

-- ➢ Create a new column named 'ChurnStatus'. Set its value to “Churned” if the corresponding value in the 'Churn' column is 1, else assign “Active”.
alter table customer_churn 
add column ChurnStatus varchar(20);

update customer_churn 
set ChurnStatus =if(Churn = 1 , 'Churned' , 'Active' );
 
 -- Column Dropping: 
-- ➢ Drop the columns "Churn" and "Complain" from the table. 

alter table customer_churn 
drop column churn;

alter table customer_churn 
drop column Complain;

-- --------------------------------------------------------------------------------------------------------------------------------
-- Data Exploration and Analysis:  (17 marks) 
-- ➢ Retrieve the count of churned and active customers from the dataset.
select ChurnStatus,Count(*) 
from customer_churn 
group by churnstatus; 

-- ➢ Display the average tenure and total cashback amount of customers who churned. 

select avg(tenure) Average_Tenure, sum(cashbackamount) 'Total Cashback', ChurnStatus 
from customer_churn 
where churnstatus= "churned";

select avg(tenure) Average_Tenure, sum(cashbackamount) 'Total Cashback', ChurnStatus 
from customer_churn 
group by churnstatus having churnstatus="churned";

 -- Determine the percentage of churned customers who complained. 
 select complaintReceived,
 concat(round((count(*)/(select count(*) from customer_churn))*100,2),'%') 'Churn Percentage' 
 from customer_churn 
 where complaintReceived="Yes";
 
 -- Identify the city tier with the highest number of churned customers whose preferred order category is Laptop & Accessory.
 select ChurnStatus,count(*),CityTier 
 from customer_churn 
 where ChurnStatus="Churned" and PreferredOrderCat="Laptop & Accessory" 
 group by CityTier 
 order by count(*) desc;
 
 -- Identify the most preferred payment mode among active customers. 
 select PreferredPaymentMode,count(*) 
 from customer_churn 
 group by PreferredPaymentMode 
 order by count(*) desc;
 
 -- Calculate the total order amount hike from last year for customers who are single and prefer mobile phones for ordering. 
 
 select MaritalStatus,sum(OrderAmountHikeFromlastYear) Total_OrderAmtHike,PreferredOrderCat from customer_churn 
 where MaritalStatus="Single" and PreferredOrderCat="Mobile Phone"  
 group by maritalstatus;

-- Find the average number of devices registered among customers who used UPI as their preferred payment mode.
select PreferredPaymentMode,avg(NumberofDeviceRegistered) Avg_DeviceRegistered 
from customer_churn 
where PreferredPaymentMode="UPI";

-- Determine the city tier with the highest number of customers.

select citytier, Count(*) No_Of_Customers 
from customer_Churn 
group by citytier 
order by count(*) desc;

-- Identify the gender that utilized the highest number of coupons.
select Gender, Count(CouponUsed) No_Of_CouponsUsed 
from customer_Churn 
group by Gender 
order by No_Of_CouponsUsed desc;

-- List the number of customers and the maximum hours spent on the app in each preferred order category.
select PreferredOrderCat,Count(PreferredOrderCat) No_Of_Customers, max(HoursSpentOnApp) 
from customer_churn 
group by PreferredOrderCat 
order by No_Of_Customers Desc;

-- Calculate the total order count for customers who prefer using credit cards and have the maximum satisfaction score.

select PreferredPaymentMode,
       COUNT(OrderCount) Total_Orders,
       MAX(SatisfactionScore) MaxSatisfaction
from customer_churn
where SatisfactionScore = (select max(SatisfactionScore) from customer_churn)
group by PreferredPaymentMode;


-- What is the average satisfaction score of customers who have complained
select avg(SatisfactionScore) Avg_Satisfactionscore,ComplaintReceived 
from customer_churn 
where ComplaintReceived="Yes";

-- List the preferred order category among customers who used more than 5 coupons.
select CustomerID,PreferredOrderCat,CouponUsed 
from customer_churn 
where CouponUsed>5;

-- List the top 3 preferred order categories with the highest average cashback amount
select PreferredOrderCat,avg(CashbackAmount) Avg_CashbackAmount 
from customer_churn 
group by PreferredOrderCat 
order by Avg_CashbackAmount 
desc limit 3;

-- Find the preferred payment modes of customers whose average tenure is 10 months and have placed more than 500 orders

select PreferredPaymentMode,round(avg(Tenure)) Avg_Tenure, count(OrderCount) OrderCount 
from customer_churn 
group by PreferredPaymentMode 
having Avg_Tenure=10 and OrderCount>500;

/*Categorize customers based on their distance from the warehouse to home such as 'Very Close Distance' for distances <=5km, 'Close Distance' for <=10km,
'Moderate Distance' for <=15km, and 'Far Distance' for >15km. Then, display the churn status breakdown for each distance category*/

select 
	case
		when WarehouseToHome<=5 then 'Very Close Distance'
        when WarehouseToHome<=10 then 'Close Distance'
        when WarehouseToHome<=15 then 'Moderate Distance'
        else 'Far Distance'
	end Distance_Category,Count(ChurnStatus) ChurnStatus_Breakdown
from customer_churn 
where ChurnStatus="Churned" 
group by Distance_Category 
order by Distance_Category;

/*List the customer’s order details who are married, live in City Tier-1, and their
order counts are more than the average number of orders placed by all customers*/
select  CustomerID,Maritalstatus,CityTier ,OrderCount
from customer_churn 
where Maritalstatus="Married" and CityTier=1 and OrderCount>(select round(avg(Ordercount)) from customer_churn);

commit;

-- Create a ‘customer_returns’ table in the ‘ecomm’ database
drop table if exists customer_returns;
create table customer_returns(
ReturnID int,
CustomerID int,
ReturnDate date,
RefundAmount int
);

INSERT INTO customer_returns (ReturnID, CustomerID, ReturnDate, RefundAmount)
VALUES
  (1001, 50022, STR_TO_DATE('01-01-2023', '%d-%m-%Y'), 2130),
  (1002, 50316, STR_TO_DATE('23-01-2023', '%d-%m-%Y'), 2000),
  (1003, 51099, STR_TO_DATE('14-02-2023', '%d-%m-%Y'), 2290),
  (1004, 52321, STR_TO_DATE('08-03-2023', '%d-%m-%Y'), 2510),
  (1005, 52928, STR_TO_DATE('20-03-2023', '%d-%m-%Y'), 3000),
  (1006, 53749, STR_TO_DATE('17-04-2023', '%d-%m-%Y'), 1740),
  (1007, 54206, STR_TO_DATE('21-04-2023', '%d-%m-%Y'), 3250),
  (1008, 54838, STR_TO_DATE('30-04-2023', '%d-%m-%Y'), 1990);

-- Display the return details along with the customer details of those who have churned and have made complaints
select c.customerid,c.ChurnStatus,c.ComplaintReceived,r.ReturnID,r.returnDate,r.RefundAmount 
from customer_churn c 
inner join customer_returns r
on c.customerid=r.customerid where c.churnstatus="churned" and ComplaintReceived="yes" ;

use ecomm;