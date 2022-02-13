/*
--------------------------------------------------------------------
© 2021 SQL Server All Rights Reserved
--------------------------------------------------------------------
Name   : Ike Chukz
Link   : servermuseai.database.windows.net
Version: 1.0.0
--------------------------------------------------------------------
*/

-- drop schemas
-- DROP SCHEMA IF EXISTS museaiDB;

-- create schemas
-- CREATE SCHEMA museaiDB;
-- go

-- drop tables
DROP TABLE IF EXISTS museaiDB.order_items;
DROP TABLE IF EXISTS museaiDB.orders;
DROP TABLE IF EXISTS museaiDB.stocks;
DROP TABLE IF EXISTS museaiDB.products;
DROP TABLE IF EXISTS museaiDB.categories;
DROP TABLE IF EXISTS museaiDB.brands;
DROP TABLE IF EXISTS museaiDB.customers;
DROP TABLE IF EXISTS museaiDB.staffs;
DROP TABLE IF EXISTS museaiDB.stores;
DROP TABLE IF EXISTS museaiDB.Customer;
DROP TABLE IF EXISTS museaiDB.Earnings;


-- create tables
CREATE TABLE museaiDB.categories (
	category_id INT IDENTITY (1, 1) PRIMARY KEY,
	category_name VARCHAR (255) NOT NULL
);

CREATE TABLE museaiDB.brands (
	brand_id INT IDENTITY (1, 1) PRIMARY KEY,
	brand_name VARCHAR (255) NOT NULL
);

CREATE TABLE museaiDB.products (
	product_id INT IDENTITY (1, 1) PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_id INT NOT NULL,
	category_id INT NOT NULL,
	model_year SMALLINT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES museaiDB.categories (category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (brand_id) REFERENCES museaiDB.brands (brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE museaiDB.customers (
	customer_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5)
);

CREATE TABLE museaiDB.stores (
	store_id INT IDENTITY (1, 1) PRIMARY KEY,
	store_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	state VARCHAR (10),
	zip_code VARCHAR (5)
);

CREATE TABLE museaiDB.staffs (
	staff_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (255) NOT NULL UNIQUE,
	phone VARCHAR (25),
	active tinyint NOT NULL,
	store_id INT NOT NULL,
	manager_id INT,
	FOREIGN KEY (store_id) REFERENCES museaiDB.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES museaiDB.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE museaiDB.orders (
	order_id INT IDENTITY (1, 1) PRIMARY KEY,
	customer_id INT,
	order_status tinyint NOT NULL,
	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	order_date DATE NOT NULL,
	required_date DATE NOT NULL,
	shipped_date DATE,
	store_id INT NOT NULL,
	staff_id INT NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES museaiDB.customers (customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (store_id) REFERENCES museaiDB.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES museaiDB.staffs (staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE museaiDB.order_items (
	order_id INT,
	item_id INT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
	PRIMARY KEY (order_id, item_id),
	FOREIGN KEY (order_id) REFERENCES museaiDB.orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES museaiDB.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE museaiDB.stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id),
	FOREIGN KEY (store_id) REFERENCES museaiDB.stores (store_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_id) REFERENCES museaiDB.products (product_id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE museaiDB.Customer(
	custID int IDENTITY(1,1) NOT NULL,
	name nvarchar(128) NOT NULL,
	addr1 nvarchar(10) NULL,
	addr2 nvarchar(128) NOT NULL,
	city nvarchar(1) NOT NULL,
	state nvarchar(1) NOT NULL,
	zip nvarchar(1) NOT NULL,
	districtID nvarchar(1) NOT NULL
)

CREATE TABLE museaiDB.Earnings(
	earningsID int IDENTITY(1,1) NOT NULL,
	customerID int,
	earnings int,
	reportDate nvarchar(256) NULL
)