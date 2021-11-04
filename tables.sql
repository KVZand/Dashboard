CREATE TABLE IF NOT EXISTS categories (
categoryID INTEGER PRIMARY KEY,
categoryName VARCHAR(255),
description VARCHAR(255),
picture TEXT
);

CREATE TABLE IF NOT EXISTS customers (
  customerID VARCHAR(255),
  companyName TEXT,
  contactName TEXT,
  contactTitle TEXT,
  adress TEXT,
  city VARCHAR(255),
  region VARCHAR(255),
  postalCode VARCHAR(255),
  country VARCHAR(255),
  phone VARCHAR(255),
  fax VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS employees (
  employeeID INTEGER PRIMARY KEY,
  lastName VARCHAR(255),
  firstName VARCHAR(255),
  title VARCHAR(255),
  titleOfCourtesy VARCHAR(255),
  birthDate VARCHAR(255),
  hireDate VARCHAR(255),
  adress VARCHAR(255),
  city VARCHAR(255),
  region VARCHAR(255),
  postalCode VARCHAR(255),
  country VARCHAR(255),
  homePhone VARCHAR(255),
  extension INTEGER,
  photo TEXT,
  notes TEXT,
  reportsTo INTEGER,
  photoPath TEXT
);

CREATE TABLE IF NOT EXISTS employee_territories (
  employeeID INTEGER,
  territoryID INTEGER
);

CREATE TABLE IF NOT EXISTS order_details (
  orderID INTEGER,
  productID INTEGER,
  unitPrice NUMERIC,
  quantity INTEGER,
  discount NUMERIC
);

CREATE TABLE IF NOT EXISTS orders (
  orderID INTEGER,
  customerID VARCHAR(255),
  employeeID INTEGER,
  orderDate TIMESTAMP,
  requiredDate TIMESTAMP,
  shippedDate TEXT,
  shipVia INTEGER,
  freight NUMERIC,
  shipName TEXT,
  shipAddress TEXT,
  shipCity TEXT,
  shipRegion VARCHAR(255),
  shipPostalCode VARCHAR(255),
  shipCountry TEXT
);

CREATE TABLE IF NOT EXISTS products (
  productID INTEGER PRIMARY KEY,
  productName VARCHAR (255) NOT NULL,
  supplierID INTEGER NOT NULL,
  categoryID INTEGER NOT NULL,
  quantityPerUnit VARCHAR (255) NOT NULL,
  unitPrice NUMERIC NOT NULL,
  unitsInStock INTEGER,
  unitsOnOrder INTEGER,
  reorderLevel INTEGER,
  discontinued BOOL
);

CREATE TABLE IF NOT EXISTS regions (
  regionID INTEGER PRIMARY KEY,
  regionDescription VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS shippers (
  shipperID INTEGER PRIMARY KEY,
  companyName TEXT,
  phone VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS suppliers (
  supplierID INTEGER PRIMARY KEY,
  companyName TEXT,
  contactName TEXT,
  contactTitle TEXT,
  adress VARCHAR(255),
  city TEXT,
  region VARCHAR(255),
  postalCode VARCHAR(255),
  country TEXT,
  phone VARCHAR(255),
  fax VARCHAR(255),
  homepage TEXT
);

CREATE TABLE IF NOT EXISTS territories (
  territoryID INTEGER,
  territoryDescription VARCHAR(255),
  regionID INTEGER
);

