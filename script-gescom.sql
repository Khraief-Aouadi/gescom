DROP DATABASE IF EXISTS gescom;
CREATE DATABASE gescom;
USE gescom;

CREATE TABLE departelments(
   dep_id INT NOT NULL AUTO_INCREMENT,
   dep_name VARCHAR(50),
   PRIMARY KEY(dep_id)
);

CREATE TABLE orders_details(
   ode_id INT NOT NULL AUTO_INCREMENT,
   ode_unit_price DECIMAL(7,2) NOT NULL,
   ode_discount DECIMAL(4,2) NOT NULL,
   ode_quantity INT NOT NULL,
   ode_ord_id INT NOT NULL,
   ode_pro_id INT NOT NULL,
   PRIMARY KEY(ode_id),
   UNIQUE(ode_unit_price),
   UNIQUE(ode_discount),
   UNIQUE(ode_quantity),
   UNIQUE(ode_ord_id),
   UNIQUE(ode_pro_id)
);

CREATE TABLE categories(
   cat_id INT NOT NULL AUTO_INCREMENT,
   cat_name VARCHAR(50),
   cat_parent_id INT NOT NULL,
   PRIMARY KEY(cat_id),
   UNIQUE(cat_parent_id)
);

CREATE TABLE employees(
   emp_id INT NOT NULL AUTO_INCREMENT,
   emp_superior_id INT NOT NULL,
   emp_pos_id INT NOT NULL,
   emp_lastname VARCHAR(50),
   emp_firstname VARCHAR(50),
   emp_addresse VARCHAR(150),
   emp_zipcode VARCHAR(5),
   emp_city VARCHAR(50),
   emp_mail VARCHAR(255),
   emp_phone VARCHAR(10),
   emp_salary DECIMAL(8,2) NOT NULL,
   emp_enter_date DATETIME NOT NULL,
   emp_gender VARCHAR(1),
   emp_childern INT NOT NULL,
   emp_sho_id INT NOT NULL,
   emp_dep_id INT NOT NULL,
   dep_id INT NOT NULL,
   PRIMARY KEY(emp_id),
   UNIQUE(emp_superior_id),
   UNIQUE(emp_pos_id),
   UNIQUE(emp_salary),
   UNIQUE(emp_childern),
   UNIQUE(emp_sho_id),
   UNIQUE(emp_dep_id),
   FOREIGN KEY(dep_id) REFERENCES departelments(dep_id)
);

CREATE TABLE posts(
   pos_id INT NOT NULL AUTO_INCREMENT,
   pos_libelle VARCHAR(50),
   emp_id INT NOT NULL,
   PRIMARY KEY(pos_id),
   FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE shops(
   sho_id INT NOT NULL AUTO_INCREMENT,
   sho_name VARCHAR(26) NOT NULL,
   sho_address VARCHAR(100) NOT NULL,
   sho_zipcode VARCHAR(5),
   sho_city VARCHAR(26),
   emp_id INT NOT NULL,
   PRIMARY KEY(sho_id),
   FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE products(
   pro_id INT NOT NULL AUTO_INCREMENT,
   pro_cat_id INT NOT NULL,
   pro_price DECIMAL(7,2) NOT NULL,
   pro_ref VARCHAR(8),
   pro_ean VARCHAR(13),
   pro_stock INT NOT NULL,
   pro_stock_alert INT NOT NULL,
   pro_color VARCHAR(30),
   pro_name VARCHAR(50),
   pro_desc TEXT,
   pro_publish INT NOT NULL,
   pro_sup_id INT NOT NULL,
   pro_add_date DATETIME NOT NULL,
   pro_update_date DATETIME,
   pro_picture VARCHAR(50),
   cat_id INT NOT NULL,
   ode_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   UNIQUE(pro_cat_id),
   UNIQUE(pro_price),
   UNIQUE(pro_stock),
   UNIQUE(pro_stock_alert),
   UNIQUE(pro_publish),
   UNIQUE(pro_sup_id),
   UNIQUE(pro_add_date),
   FOREIGN KEY(cat_id) REFERENCES categories(cat_id),
   FOREIGN KEY(ode_id) REFERENCES orders_details(ode_id)
);

CREATE TABLE suppliers(
   sup_id INT NOT NULL AUTO_INCREMENT,
   sup_name VARCHAR(50),
   sup_city VARCHAR(50),
   sup_countries_id VARCHAR(2) NOT NULL,
   sup_addresse VARCHAR(150),
   sup_zipcode VARCHAR(5),
   sup_contact VARCHAR(100),
   sup_phone VARCHAR(10),
   sup_mail VARCHAR(75),
   pro_id INT NOT NULL,
   PRIMARY KEY(sup_id),
   UNIQUE(sup_countries_id),
   FOREIGN KEY(pro_id) REFERENCES products(pro_id)
);

CREATE TABLE orders(
   ord_id INT NOT NULL AUTO_INCREMENT,
   ord_order_date DATE,
   ord_payment_date DATE,
   ord_ship_date DATE,
   ord_reception_date DATE,
   ord_status VARCHAR(25),
   ord_cus_id INT NOT NULL,
   ode_id INT NOT NULL,
   PRIMARY KEY(ord_id),
   UNIQUE(ord_cus_id),
   FOREIGN KEY(ode_id) REFERENCES orders_details(ode_id)
);

CREATE TABLE customers(
   cus_id INT NOT NULL AUTO_INCREMENT,
   cus_firstname VARCHAR(50),
   cus_lastname VARCHAR(50),
   cus_addresse VARCHAR(50),
   cus_zipcode VARCHAR(5),
   cus_city VARCHAR(50),
   cus_mail VARCHAR(255),
   cus_phone VARCHAR(10),
   cus_password VARCHAR(60),
   cus_add_date DATETIME,
   cus_update_date DATETIME,
   ord_id INT NOT NULL,
   PRIMARY KEY(cus_id),
   FOREIGN KEY(ord_id) REFERENCES orders(ord_id)
);

CREATE TABLE countries(
   cun_id INT NOT NULL AUTO_INCREMENT,
   cou_name VARCHAR(45),
   cus_id INT NOT NULL,
   sup_id INT NOT NULL,
   PRIMARY KEY(cun_id),
   FOREIGN KEY(cus_id) REFERENCES customers(cus_id),
   FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
);
