USE credit_card_classification;

SELECT * 
  FROM credit_card_data;
 
-- 5
ALTER TABLE credit_card_data
 DROP COLUMN q4_balance;

SELECT * 
  FROM credit_card_data
 LIMIT 10;
 
-- 6
SELECT COUNT(*)
  FROM credit_card_data;

-- 7
SELECT DISTINCT offer_accepted
  FROM credit_card_data;
  
SELECT DISTINCT reward
  FROM credit_card_data;
  
SELECT DISTINCT mailer_type
  FROM credit_card_data;
  
SELECT DISTINCT credit_cards_held
  FROM credit_card_data;

SELECT DISTINCT household_size
  FROM credit_card_data;
  
-- 8
SELECT customer_number
  FROM credit_card_data
 ORDER BY average_balance DESC
 LIMIT 10;
 
-- 9
SELECT AVG(average_balance) AS avg_average_balance
  FROM credit_card_data;
  
-- 10
SELECT income_level, AVG(average_balance) AS avg_customer_balance
  FROM credit_card_data
 GROUP BY income_level;
 
SELECT bank_accounts_open, AVG(average_balance) AS avg_customer_balance
  FROM credit_card_data
 GROUP BY bank_accounts_open;

SELECT credit_rating, ROUND(AVG(credit_cards_held)) AS avg_credit_card_held_by_customer
  FROM credit_card_data
 GROUP BY credit_rating;

-- correlation between credit card held and bank accounts open:
-- we see that the majority of accounts have 1 bank account with crdit cards 2, 1, 3 (ordered by cusomer amount)
-- which gives us the most popular combination of 1 bank account and 2 credit cards
-- the least popular combinations are 3 bank accoutns with varying credit cards held
-- the middle ranks are not that clear - even though we see that more bank accounts correlates with less customers the credit 
-- cards held are mixed here

SELECT credit_cards_held, bank_accounts_open, COUNT(*) AS accounts
  FROM credit_card_data
 GROUP BY credit_cards_held, bank_accounts_open
 ORDER BY accounts DESC;

SELECT * FROM credit_card_data;
-- 11
SELECT * 
 FROM credit_card_data
WHERE credit_rating != 'Low'
  AND credit_cards_held < 3
  AND own_your_home = 'Yes'
  AND household_size > 2;
      
SELECT * 
 FROM credit_card_data
WHERE credit_rating != 'Low'
  AND credit_cards_held < 3
  AND own_your_home = 'Yes'
  AND household_size > 2
  AND offer_accepted = 'Yes';

-- 12
SELECT * 
 FROM credit_card_data
WHERE average_balance < (SELECT AVG(average_balance)
						   FROM credit_card_data);
                           
-- 13
CREATE 
  VIEW customers_below_avg_balance AS
SELECT * 
 FROM credit_card_data
WHERE average_balance < (SELECT AVG(average_balance)
						   FROM credit_card_data);

-- 14
SELECT offer_accepted, COUNT(*)
  FROM credit_card_data
 GROUP BY offer_accepted;
 
-- 15
SELECT (SELECT SUM(average_balance)
 FROM credit_card_data
WHERE credit_rating = 'High') - (SELECT SUM(average_balance)
 FROM credit_card_data
WHERE credit_rating = 'Low') as difference
 FROM credit_card_data
LIMIT 1;

-- 16
SELECT mailer_type, COUNT(*) AS number_of_customers
  FROM credit_card_data
 GROUP BY mailer_type;

-- 17
-- pls note that we get 3 customer accounts as a result here; if you want just select one pls limit the query to 1
SELECT *
	 FROM (SELECT *,
		   DENSE_RANK() OVER (ORDER BY q1_balance ASC) AS ranking
	 FROM credit_card_data) as q1
 WHERE q1.ranking = 11;
