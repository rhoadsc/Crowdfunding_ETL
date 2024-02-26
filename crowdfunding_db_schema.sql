--crowdfunding_ETL tables

/*DROP TABLE campaign;
DROP TABLE contacts;
DROP TABLE category;
DROP TABLE subcategory*/

--CREATE TABLES
CREATE TABLE campaign(
	cf_id int NOT NULL,
	contact_id int NOT NULL,
	company_name varchar(50) NOT NULL,
	description varchar(150) NOT NULL,
	goal varchar(10) NOT NULL,
	pledged varchar(15) NOT NULL,
	outcome varchar(20) NOT NULL,
	backers_count int NOT NULL,
	country varchar(5) NOT NULL,
	currency varchar(5) NOT NULL,
	launched_date date NOT NULL, 
	end_date date NOT NULL,
	category_id varchar(10) NOT NULL, 
	subcategory_id varchar(15),
	CONSTRAINT pk_campaign PRIMARY KEY (cf_id)
);

--SELECT cf_id FROM campaign;

CREATE TABLE contacts(
	contact_id int NOT NULL,
	first_name varchar(15) NOT NULL,
	last_name varchar(15) NOT NULL,
	email varchar(50) NOT NULL,
	CONSTRAINT pk_contacts PRIMARY KEY (contact_id)
);

--SELECT * FROM contacts;

CREATE TABLE category(
	category_id varchar(10) NOT NULL,
	category varchar(20) NOT NULL,
	CONSTRAINT pk_category PRIMARY KEY (category_id)
);

--SELECT * FROM category;

CREATE TABLE subcategory(
	subcategory_id varchar(10) NOT NULL,
	subcategory varchar(20) NOT NULL,
	CONSTRAINT pk_subcategory PRIMARY KEY (subcategory_id)
);

--SELECT * FROM subcategory;

--ALTER TABLES FOR FOREIGN KEY CONSTRAINTS
ALTER TABLE campaign ADD CONSTRAINT fk_campaign_contact_id FOREIGN KEY(contact_id)
REFERENCES contacts (contact_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_category_id FOREIGN KEY(category_id)
REFERENCES category (category_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY(subcategory_id)
REFERENCES subcategory (subcategory_id);

--QC TABLES
SELECT * FROM campaign;
SELECT * FROM contacts;
SELECT * FROM category;
SELECT * FROM subcategory;