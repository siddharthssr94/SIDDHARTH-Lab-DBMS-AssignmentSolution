-- Create Database
create database if not exists `E-commerce` ;

-- Use Database
use `E-commerce`;

-- Q1) You are required to create tables for supplier,customer,category,product,productDetails,order,rating to store the data for the E-commerce.

	-- Table Supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)
	create table if not exists `supplier`(
		`SUPP_ID` int primary key,
		`SUPP_NAME` varchar(50) ,
		`SUPP_CITY` varchar(50),
		`SUPP_PHONE` varchar(10)
	);
    
    -- Table Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)
	create table if not exists `customer` (
		`CUS_ID` int not null,
		`CUS_NAME` varchar(20) null default null,
		`CUS_PHONE` varchar(10),
		`CUS_CITY` varchar(30) ,
		`CUS_GENDER` CHAR,
		primary key (`CUS_ID`)
	);

	-- Table Category(CAT_ID,CAT_NAME)
	create table if not exists `category` (
	    `CAT_ID` int not null,
	    `CAT_NAME` varchar(20) null default null,
		primary key (`CAT_ID`)
	);

	-- Table Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID)
	create table if not exists `product` (
		`PRO_ID` int not null,
		`PRO_NAME` varchar(20) null default null,
		`PRO_DESC` varchar(60) null default null,
		`CAT_ID` int not null,
		primary key (`PRO_ID`),
		foreign key (`CAT_ID`) references category(`CAT_ID`)
	);

	-- Table ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE)
	create table if not exists `product_details` (
		`PROD_ID` int not null,
		`PRO_ID` int not null,
		`SUPP_ID` int not null,
		`PROD_PRICE` int not null,
		primary key (`PROD_ID`),
		foreign key (`PRO_ID`) references product(`PRO_ID`),
		foreign key (`SUPP_ID`) references supplier(`SUPP_ID`)
	);

	-- Table Order(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PROD_ID)
	create table if not exists `order` (
		`ORD_ID` int not null,
		`ORD_AMOUNT` int not null,
		`ORD_DATE` date,
		`CUS_ID` int not null,
		`PROD_ID` int not null,
		primary key (`ORD_ID`),
		foreign key (`CUS_ID`) references customer(`CUS_ID`),
		foreign key (`PROD_ID`) references product_details(`PROD_ID`)
	);

	-- Table Rating(RAT_ID,CUS_ID,SUPP_ID,RAT_RATSTARS)
	create table if not exists `rating` (
		`RAT_ID` int not null,
		`CUS_ID` int not null,
		`SUPP_ID` int not null,
		`RAT_RATSTARS` int not null,
		primary key (`RAT_ID`),
		foreign key (`SUPP_ID`) references supplier(`SUPP_ID`),
		foreign key (`CUS_ID`) references customer(`CUS_ID`)
	);
    
    
-- Q2 Insert Data to table
	-- Suppliers Table
		insert into `supplier` 
        values
			(1,"Rajesh Retails","Delhi",'1234567890'),
			(2,"Appario Ltd.","Mumbai",'2589631470'),
			(3,"Knome products","Banglore",'9785462315'),
			(4,"Bansal Retails","Kochi",'8975463285'),
			(5,"Mittal Ltd.","Lucknow",'7898456532');
	
    -- Customer Table
		insert into `CUSTOMER` 
		values
			(1,"AAKASH",'9999999999',"DELHI",'M'),
			(2,"AMAN",'9785463215',"NOIDA",'M'),
			(3,"NEHA",'9999999999',"MUMBAI",'F'),
			(4,"MEGHA",'9994562399',"KOLKATA",'F'),
			(5,"PULKIT",'7895999999',"LUCKNOW",'M');
        
	-- Category Table
		insert into `CATEGORY` 
		values
			(1,"BOOKS"),
			(2,"GAMES"),
			(3,"GROCERIES"),
			(4,"ELECTRONICS"),
			(5,"CLOTHES");
    
    
    -- Product Table
        insert into `PRODUCT` 
        values
			(1,"GTA V","DFJDJFDJFDJFDJFJF",2),
			(2,"TSHIRT","DFDFJDFJDKFD",5),
			(3,"ROG LAPTOP","DFNTTNTNTERND",4),
			(4,"OATS","REURENTBTOTH",3),
			(5,"HARRY POTTER","NBEMCTHTJTH",1);
    
    -- Prodcut_Details Table    
		insert into `PRODUCT_DETAILS` 
        values
			(1,1,2,1500),
			(2,3,5,30000),
			(3,5,1,3000),
			(4,2,3,2500),
			(5,4,1,1000);
    
    -- Order Table    
		insert into `ORDER` 
        values 
			(50,2000,"2021-10-06",2,1),
			(20,1500,"2021-10-12",3,5),
			(25,30500,"2021-09-16",5,2),
			(26,2000,"2021-10-05",1,1),
			(30,3500,"2021-08-16",4,3);
    
    -- Rating Table
		insert into `RATING` 
		values
			(1,2,2,4),
			(2,3,4,3),
			(3,5,1,5),
			(4,1,3,2),
			(5,4,5,4);
