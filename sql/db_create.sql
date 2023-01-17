CREATE DATABASE IF NOT EXISTS credit_card_classification;

USE credit_card_classification;

DROP TABLE IF EXISTS credit_card_data;

CREATE TABLE credit_card_data (
  `customer_number` int UNIQUE NOT NULL, -- AS PRIMARY KEY
  `offer_accepted` varchar(30) DEFAULT NULL,
  `reward`varchar(255) DEFAULT NULL,
  `mailer_type` varchar(255) DEFAULT NULL,
  `income_level` varchar(255) DEFAULT NULL,
  `bank_accounts_open` int DEFAULT NULL,
  `overdraft_protection` varchar(30) DEFAULT NULL,
  `credit_rating` varchar(255) DEFAULT NULL,
  `credit_cards_held` int DEFAULT NULL,
  `homes_owned` int DEFAULT NULL,
  `household_size` int DEFAULT NULL,
  `own_your_home` varchar(255) DEFAULT NULL,
  `average_balance` float DEFAULT NULL,
  `q1_balance` float DEFAULT NULL,
  `q2_balance` float DEFAULT NULL,
  `q3_balance` float DEFAULT NULL,
  `q4_balance` float DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (customer_number)
);

SELECT * 
  FROM credit_card_data;
  
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile'; 

LOAD DATA LOCAL INFILE '<path to file here>' 
INTO TABLE credit_card_classification.credit_card_data
FIELDS TERMINATED BY ',';

