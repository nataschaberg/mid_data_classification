# Bank Classification Project

## Context

### Data
Dataset from a bank containing 18.000 samples from customers for a period of one year

Features in the data set are:
- Customer Number: A sequential number assigned to the customers (this column is hidden and excluded – this unique identifier will not be used directly).
- Offer Accepted: Did the customer accept (Yes) or reject (No) the offer. Reward: The type of reward program offered for the card.
- Mailer Type: Letter or postcard.
- Income Level: Low, Medium, or High.
- Bank Accounts Open: How many non-credit-card accounts are held by the customer.
- Overdraft Protection: Does the customer have overdraft protection on their checking account(s) (Yes or No).
- Credit Rating: Low, Medium, or High.
- Credit Cards Held: The number of credit cards held at the bank.
- Homes Owned: The number of homes owned by the customer.
- Household Size: The number of individuals in the family.
- Own Your Home: Does the customer own their home? (Yes or No).
- Average Balance: Average account balance (across all accounts over time). Q1, Q2, Q3, and Q4
- Balance: The average balance for each quarter in the last year


### Goal 
Build a model that can predict if a customer will accept a credit card offer or not

### Type of Problem and Approach
- Binary Classification 
- Models used in this project are `Logistic Regression`, `KNeighborsClassifier`, `DecisionTreeClassifier` and `RandomForestClassifier`


## Repository structure

- `sql` directory: contains slq queries connected to this project
- `files` directory: contains the dataset in bot `xlsx` and `csv` format
- `notebooks` directory: contains a jupyter notebook with the whole analysis

## Outcomes

the main outcomes of the analysis can be viewed below or via the notebook

