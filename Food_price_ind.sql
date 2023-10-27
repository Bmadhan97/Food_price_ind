
SELECT * FROM food_price.food_prices_indtable;
##count total record 
select count(date) as Record_count
from food_prices_indtable;

##Find out from how many states data are taken 

select count(distinct admin1 ) as states
from food_prices_indtable
where admin1 is not null;

## How to find out the states which have had the highest prices of Rice under cereals and tubers category - Retail purchases

SELECT admin1 as state,market,category,commodity,pricetype,max(price) as mprice
FROM food_prices_indtable
WHERE category ="cereals and tubers" AND pricetype = "Retail" AND commodity ="Rice"
group by 1,2 
order by mprice desc;

##. Find out the states and market which have had the highest prices of Rice under cereals and tubers category- Wholesale purchases

select admin1 as state,market,category,commodity,unit,pricetype,max(price) as price
from food_prices_indtable
where category = "cereals and tubers" AND pricetype = "Wholesale" AND commodity ="Rice"
group by 1,2,5
order by  price desc;

##Find out the states and market which have had the highest prices of Milk under milk and dairy category- Retail purchases only

select admin1 as state, market,category,pricetype,commodity,max(price) as price
from food_prices_indtable
where category ="milk and dairy" and pricetype ="Retail" and  commodity ="Milk"
group by 1,2,3
order by 4 desc;

##Find out the states and market which have had the highest prices of Milk (pasteurized) under milk and dairy category- Retail purchases only

SELECT admin1 as state,market,category,commodity,pricetype,max(price) as price
FROM food_prices_indtable
WHERE category ="milk and dairy" AND pricetype = "Retail" AND commodity ="Milk (pasteurized)"
group by 1,2 
order by price desc;

##Find out the states and market which have had the highest prices of Ghee (vanaspati) under oil and fats- Retail purchases only

select admin1 as state,market,category,commodity,pricetype,max(price) as price
from food_prices_indtable
where admin1 is not null AND category ="oil and fats" AND commodity ="Ghee (vanaspati)" 
group by 1,2,5
order by price desc;

##Finding out the avegarge price of oil and fats as whole
select category,pricetype,round(avg(price),2) as average_price
from food_prices_indtable
where category="oil and fats"
group by 1,2
order by 3 ;

##Find out the average prices for each type of oil under oil and fats

select *
from food_prices_indtable;

## Average price of oil (mustard)

select avg(price) as Average_price
from food_prices_indtable
where category="oil and fats" and commodity = "Oil (mustard)";

## average price in oil groundnet

select avg(price) as Average_price
from food_prices_indtable
where category="oil and fats" and commodity="Oil (groundnut)";

## Average price of sunflower 
select avg(price) as Average_price
from food_prices_indtable
where category = "oil and fats" and commodity ="Oil (sunflower)";

## Average price palm

select avg(price) as Average_price
from food_prices_indtable
where category = "oil and fats" and commodity ="Oil (palm)";

## Average price of soybean

select avg(price) as Average_price
from food_prices_indtable
where category ="oil and fats" and commodity="Oil (soybean)";

##Average price of vanaspati

select avg(price) as Average_price
from food_prices_indtable
where category="oil and fats" and commodity="Ghee (vanaspati)";

## Finding out the average prices of lentils
-- Urad has the highest average price of 102.13 INR and chickpeas has the lowest average price of 46.23 INR

## Average price of moong
select avg(price) as average_price
from food_prices_indtable
where category ="pulses and nuts" AND commodity = "Lentils (moong)";

## Average price of urad

select avg(price) as Average_price
from food_prices_indtable
where category="pulses and nuts" and commodity = "Lentils (urad)";

##Average price of masur

select avg(price) as Average_price
from food_prices_indtable
where category ="pulses and nuts" and commodity="Lentils (masur)";

##Average price of Chicpeas 

select avg(price) as Average_price
from food_prices_indtable
where category="pulses and nuts" and commodity="chickpeas";

##Finding out the average price of Onions and tomatoes

#Average price of onions 

select avg(price) as Average_price
from food_prices_indtable
where category="vegetables and fruits" and commodity="Onions";

##Average price of tomatoes

select avg(price) as Average_price
from food_prices_indtable
where category="vegetables and fruits" and commodity="Tomatoes";

##Find out which commodity has the highest price 

SELECT date, admin1 as state,market,category,commodity,pricetype,max(price) as price
FROM food_prices_indtable
WHERE pricetype = "Retail"
group by 1,2,3,4,5,6 
order by price desc;

## Find out the commodities which has the highest prices recently year 2022

select date,market,zone,category,max(price) as Highest_price
from food_prices_indtable
where date="15/07/22" and pricetype = "Retail" 
group by 2,3,4
order by Highest_price;

##Create a table for zones

DROP Table if exists zones;
CREATE TABLE `zones` (
  `City` VARCHAR(255),
  `State` VARCHAR (255),
  `zone` VARCHAR(255),
  PRIMARY KEY(`City`, `State`)
);

Insert into zones
select DISTINCT admin2, admin1, NULL
from food_prices_indtable
where admin2 is not NULL;

SET SQL_SAFE_UPDATES = 0;

UPDATE `zones` SET zone ='South'  WHERE State LIKE 'Tamil Nadu';
UPDATE `zones` SET zone ='South'  WHERE State LIKE 'Telangana';
UPDATE `zones` SET zone ='South'  WHERE State LIKE 'Andhra Pradesh';
UPDATE `zones` SET zone ='South'  WHERE State LIKE 'Kerala';
UPDATE `zones` SET zone ='South'  WHERE State LIKE 'Karnataka';

update `zones`set zone = 'North' WHERE State = 'Himachal Pradesh';
update `zones`set zone = 'North' WHERE State = 'Punjab';
update `zones`set zone = 'North' WHERE State = 'Uttarakhand';
update `zones`set zone = 'North' WHERE State = 'Uttar Pradesh';
update `zones`set zone = 'North' WHERE State = 'Haryana';

update `zones`set zone = 'East' WHERE State = 'Bihar';
update `zones`set zone = 'East' WHERE State = 'Orissa';
update `zones`set zone = 'East' WHERE State = 'Jharkhand';
update `zones`set zone = 'East' WHERE State = 'West Bengal';

update `zones`set zone = 'West' WHERE State = 'Rajasthan';
update `zones`set zone = 'West' WHERE State = 'Gujarat';
update `zones`set zone = 'West' WHERE State = 'Goa';
update `zones`set zone = 'West' WHERE State = 'Maharashtra';

update `zones`set zone = 'Central' WHERE State = 'Madhya Pradesh';
update `zones`set zone = 'Central' WHERE State = 'Chhattisgarh';

update `zones`set zone = 'North East' WHERE State = 'Assam';
update `zones`set zone = 'North East' WHERE State = 'Sikkim';
update `zones`set zone = 'North East' WHERE State = 'Manipur';
update `zones`set zone = 'North East' WHERE State = 'Meghalaya';
update `zones`set zone = 'North East' WHERE State = 'Nagaland';
update `zones`set zone = 'North East' WHERE State = 'Mizoram';
update `zones`set zone = 'North East' WHERE State = 'Tripura';
update `zones`set zone = 'North East' WHERE State = 'Arunachal Pradesh';

update `zones`set zone = 'Union Territory' WHERE State = 'Chandigarh';
update `zones`set zone = 'Union Territory' WHERE State = 'Delhi';
update `zones`set zone = 'Union Territory' WHERE State = 'Puducherry';
update `zones`set zone = 'Union Territory' WHERE State = 'Andaman and Nicobar';

select *
from zones;

delete from zones
where state is null or City is null or zone is null;

##JOIN zones table and food_prices_ind AND Create a view
create view food as
select f.date,z.City,z.State,f.market,z.zone,f.latitude,f.longitude,f.category,f.commodity,f.unit,f.priceflag,f.pricetype,f.currency,f.price,f.usdprice
from food_prices_indtable as f
inner join zones as z
on z.City = f.admin1;

select *
from food ;

select distinct market
from food;

DROP Table if exists price_differencesB;
Create Table price_differencesB
(State varchar(255),
zone varchar(255),
category varchar(255),
commodity varchar(255),
Average_price_2012 double);

INSERT INTO price_differencesB
SELECT State,zone,category,commodity,round(avg(price)) from food
WHERE date = "15/12/12" AND pricetype = "Retail"
group by 1,2,3,4;


