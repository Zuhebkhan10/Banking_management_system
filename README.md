Banking SQL Database Project
Project Overview:

This project is a Banking SQL Database System designed to simulate real-world banking operations. It focuses on managing customer data, bank accounts, and financial transactions using structured SQL queries.
The project demonstrates how SQL can be used for data storage, management, and analysis in a banking environment.

 Project Objectives:

Design a relational database system

Store and manage customer and account information

Track and analyze financial transactions

Practice SQL concepts like JOIN, GROUP BY, and aggregations

Build a portfolio-ready SQL project

Database Schema

The project includes the following tables:

1. Customer

Stores customer details:

Cust_id (Primary Key)

Cust_name

Address

State_code

Contact

2. Bank_Account

Stores account information:

cust_id

Account_number

Account_type

Balance_amount

Account_Status

Relationship

3. Relationship_Details

Stores linked account details:

Cust_id

Account_number

Account_type

Linking_account_number

4. Account_Transaction

Stores transaction data:

Account_number

Transaction_amount

Transaction_channel

Province

Transaction_Date

5. Customer_Messages

Stores customer notifications:

Event

Customer_message

Notice_delivery_mode

6. Interest_Rate

Stores interest rate data:

Account_type

Interest_rate

Month

Year

🛠️ SQL Skills Used

CREATE TABLE

INSERT INTO

SELECT Queries

WHERE Clause

JOIN Operations

GROUP BY

Aggregate Functions (SUM, AVG, COUNT)

CASE Statements

Sample Analysis Performed

Total transaction amount per customer

Average account balance by customer

First-quarter transaction analysis

Filtering transactions by date

Identifying customers with credit cards



Future Improvements

Add Loan Management System

Implement Fraud Detection Analysis

Include Bank Branch Data

Create dashboards using Power BI / Tableau


Banking SQL-Project/
│
├── README.md
├── insert_bank_data.sql
├── Analysis_queries.sql
└── Img/

What I Learned

Designing relational databases

Writing complex SQL queries

Data analysis using SQL
Understanding real-world banking data

 Conclusion:

This project showcases my ability to work with SQL, relational databases, and data analysis, making it a strong addition to my Data Analyst portfolio.

Feedback::

I would appreciate your feedback and suggestions to improve this project!
