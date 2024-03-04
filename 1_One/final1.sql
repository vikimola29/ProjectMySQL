USE SportsStore;


CREATE TABLE Customer (
id_customer INT NOT NULL PRIMARY KEY IDENTITY,
loyalty_points INT,
customer_name VARCHAR(500),
tel_number VARCHAR(50),
cnp VARCHAR(50)
);

CREATE TABLE Store (
id_store INT NOT NULL  PRIMARY KEY IDENTITY,
store_address VARCHAR(250),
tel_number VARCHAR(50),
);

CREATE TABLE Transact (
id_transaction INT NOT NULL PRIMARY KEY IDENTITY,
payment_type VARCHAR(50),
amount MONEY,
date_time DATETIME,
status VARCHAR(50),
id_customer INT FOREIGN KEY REFERENCES Customer(id_customer ),
id_store INT NOT NULL FOREIGN KEY REFERENCES Store(id_store)
);

CREATE TABLE Role (
id_role INT NOT NULL PRIMARY KEY IDENTITY,
role VARCHAR(50)
);

CREATE TABLE Employee (
id_employee INT NOT NULL PRIMARY KEY IDENTITY,
cnp VARCHAR(50),
id_role INT NOT NULL FOREIGN KEY REFERENCES Role(id_role),
id_store INT NOT NULL FOREIGN KEY REFERENCES Store(id_store),
hiring_date DATE,
salary MONEY
);

CREATE TABLE Category (
id_category INT NOT NULL PRIMARY KEY IDENTITY,
category_name VARCHAR(200),
);


CREATE TABLE Product (
id_product INT NOT NULL PRIMARY KEY IDENTITY,
price MONEY,
product_name VARCHAR(250),
product_description VARCHAR(500),
product_color VARCHAR(50),
id_category INT NOT NULL FOREIGN KEY REFERENCES Category(id_category),
number_on_stock INT
);


CREATE TABLE Shopping_List (
id_transaction INT NOT NULL FOREIGN KEY REFERENCES Transact(id_transaction),
id_product INT NOT NULL FOREIGN KEY REFERENCES Product(id_product),
quantity INT,
price MONEY
CONSTRAINT pk_shoppping_list PRIMARY KEY (id_transaction, id_product)
);





