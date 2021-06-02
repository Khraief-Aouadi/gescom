DROP DATABASE IF EXISTS gescom_jarditou;
CREATE DATABASE gescom_jarditou;
use gescom_jarditou;

CREATE TABLE categorie(
   ca_id INT AUTO_INCREMENT,
   ca_name VARCHAR(50),
   ca_libel VARCHAR(50),
   PRIMARY KEY(ca_id)
);

CREATE TABLE orders(
   or_id INT AUTO_INCREMENT,
   or_discount VARCHAR(50),
   or_unit_price DECIMAL(7,2),
   or_quatity DECIMAL(8,2),
   PRIMARY KEY(or_id)
);

CREATE TABLE boutique(
   bo_id INT AUTO_INCREMENT,
   bo_name VARCHAR(50),
   bo_address VARCHAR(50),
   bo_city VARCHAR(50),
   bo_zipcode VARCHAR(50),
   bo_phone VARCHAR(50),
   PRIMARY KEY(bo_id)
);

CREATE TABLE post(
   po_id INT AUTO_INCREMENT,
   po_libel VARCHAR(50),
   PRIMARY KEY(po_id)
);

CREATE TABLE countries(
   co_id INT AUTO_INCREMENT,
   co_name VARCHAR(50),
   PRIMARY KEY(co_id)
);

CREATE TABLE patron(
   pa_id INT AUTO_INCREMENT,
   pa_firstname VARCHAR(50),
   pa_lastname VARCHAR(50),
   pa_address VARCHAR(255),
   pa_zipcode DECIMAL(7,2),
   pa_city VARCHAR(50),
   co_id INT NOT NULL,
   PRIMARY KEY(pa_id),
   FOREIGN KEY(co_id) REFERENCES countries(co_id)
);

CREATE TABLE employee(
   em_id INT AUTO_INCREMENT,
   em_firstname VARCHAR(50),
   em_lastname VARCHAR(50),
   em_address VARCHAR(50),
   em_phone DECIMAL(8,2),
   em_salary DECIMAL(7,2),
   em_gendre VARCHAR(50),
   em_children VARCHAR(50),
   co_id INT NOT NULL,
   po_id INT NOT NULL,
   bo_id INT NOT NULL,
   PRIMARY KEY(em_id),
   FOREIGN KEY(co_id) REFERENCES countries(co_id),
   FOREIGN KEY(po_id) REFERENCES post(po_id),
   FOREIGN KEY(bo_id) REFERENCES boutique(bo_id)
);

CREATE TABLE suppliers(
   su_id INT AUTO_INCREMENT,
   su_firstname VARCHAR(50),
   su_lastename VARCHAR(50),
   su_address VARCHAR(50),
   su_phone DECIMAL(15,2),
   co_id INT NOT NULL,
   PRIMARY KEY(su_id),
   FOREIGN KEY(co_id) REFERENCES countries(co_id)
);

CREATE TABLE products(
   pr_id INT AUTO_INCREMENT,
   pr_name VARCHAR(50),
   pr_price VARCHAR(50),
   pr_color VARCHAR(50),
   pr_stock_physique INT,
   pr_stock_alert INT,
   pr__file_pic VARCHAR(50),
   pr_status VARCHAR(50),
   pr_code_EAN INT,
   pr_add_date DATETIME,
   pr_update_date DATETIME,
   su_id INT NOT NULL,
   ca_id INT NOT NULL,
   PRIMARY KEY(pr_id),
   FOREIGN KEY(su_id) REFERENCES suppliers(su_id),
   FOREIGN KEY(ca_id) REFERENCES categorie(ca_id)
);

CREATE TABLE commands(
   pa_id INT AUTO_INCREMENT,
   or_id INT,
   PRIMARY KEY(pa_id, or_id),
   FOREIGN KEY(pa_id) REFERENCES patron(pa_id),
   FOREIGN KEY(or_id) REFERENCES orders(or_id)
);

CREATE TABLE descriptions(
   ca_id INT,
   or_id INT AUTO_INCREMENT,
   PRIMARY KEY(ca_id, or_id),
   FOREIGN KEY(ca_id) REFERENCES categorie(ca_id),
   FOREIGN KEY(or_id) REFERENCES orders(or_id)
);
