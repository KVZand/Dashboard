SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;SET default_tablespace = '';SET default_with_oids = false;---
--- drop tables
---DROP TABLE IF EXISTS customer_customer_demo;
DROP TABLE IF EXISTS customer_demographics;
DROP TABLE IF EXISTS employee_territories;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS territories;
DROP TABLE IF EXISTS us_states;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS employees;--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace:
--CREATE TABLE categories (
    category_id smallint NOT NULL PRIMARY KEY,
    category_name character varying(20) NOT NULL,
    description text,
    picture bytea
);--
-- Name: customers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--2CREATE TABLE customers (
    customer_id bpchar NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(40),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);--
-- Name: customer_customer_demo; Type: TABLE; Schema: public; Owner: -; Tablespace:
--3CREATE TABLE employees (
    employee_id character varying(10) PRIMARY KEY,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to character varying(10),
    photo_path character varying(255),
	
	--fk_quotation_receipt_id bigint references quotations (receipt_id)	FOREIGN KEY (reports_to) REFERENCES employees);ALTER TABLE employees DISABLE TRIGGER ALL;--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--4CREATE TABLE suppliers (
    supplier_id smallint NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace:
--5CREATE TABLE products (
    product_id smallint NOT NULL PRIMARY KEY,
    product_name character varying(40) NOT NULL,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories,
	FOREIGN KEY (supplier_id) REFERENCES suppliers
);--
-- Name: region; Type: TABLE; Schema: public; Owner: -; Tablespace:
--6CREATE TABLE regions (
    region_id smallint NOT NULL PRIMARY KEY,
    region_description bpchar NOT NULL
);--
-- Name: shippers; Type: TABLE; Schema: public; Owner: -; Tablespace:
--7CREATE TABLE shippers (
    shipper_id smallint NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace:
--8CREATE TABLE orders (
    order_id smallint NOT NULL PRIMARY KEY,
    customer_id bpchar,
    employee_id character varying(10),
    order_date date,
    required_date date,
    shipped_date varchar(23),
    ship_via smallint,
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(40),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15),
	FOREIGN KEY (customer_id) REFERENCES customers,
    FOREIGN KEY (employee_id) REFERENCES employees,
    FOREIGN KEY (ship_via) REFERENCES shippers
);--
-- Name: territories; Type: TABLE; Schema: public; Owner: -; Tablespace:
--CREATE TABLE territories (
    territory_id character varying(20) NOT NULL PRIMARY KEY,
    territory_description bpchar NOT NULL,
    region_id smallint NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions);--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: -; Tablespace:
--CREATE TABLE employee_territories (
    employee_id character varying(10) NOT NULL,
    territory_id character varying(20) NOT NULL,
	PRIMARY KEY (employee_id, territory_id),
    FOREIGN KEY (territory_id) REFERENCES territories,
    FOREIGN KEY (employee_id) REFERENCES employees
);--
-- Name: order_details; Type: TABLE; Schema: public; Owner: -; Tablespace:
--CREATE TABLE order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL,
	PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products,
    FOREIGN KEY (order_id) REFERENCES orders
);