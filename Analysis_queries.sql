# 1) Print customer Id, customer name and average account_balance maintained by each customer 
# for all  of his/her accounts in the bank.(8 Rows) 

Select c.cust_id, c.cust_name , AVG(ba.Balance_amount) as account_balance
 from customer c
join bank_account ba
on c.cust_id=ba.cust_id
group by c.cust_id, c.cust_name
order by account_balance  limit 8;

# 2) Print customer_id , account_number and balance_amount , condition that if balance_amount is 
# nil then assign transaction_amount  for account_type = "Credit Card"(4 Rows) 
Select ba.cust_id, ba.account_number,
	Case
		When ba.Balance_amount is null
			And ba.Account_type='Credit card'
        Then at.transaction_amount 
        else ba.Balance_amount
        End as balance_amount
from bank_account ba
join account_transaction at
on ba.account_number=at.account_number
order by account_number limit 4;

# 3) Print account_number and balance_amount , transaction_amount,Transaction_Date from 
# Bank_Account_Details and bank_account_transaction for all the transactions occurred during 
# jan,2025 and feb,2025(12 Rows) 

Select ba.Account_number,ba.Balance_amount,
at.Transaction_amount,at.Transaction_Date
from bank_account ba
join account_transaction at
on ba.account_number=at.account_number 
where at.transaction_date Between "2025-01-05" And "2025-02-10"
order by at.transaction_date limit 12;

# 4) Print all of the customer id, account number,  balance_amount, transaction_amount , 
 #Transaction_Date  from bank_customer, Bank_Account_Details and bank_account_transaction tables 
 # where excluding all of their transactions in feb,2025 month (22 Rows) 
 
 Select ba.cust_id,ba.Account_number,ba.Balance_amount,
at.Transaction_amount,at.Transaction_Date
from customer c
join bank_account ba
on c.cust_id=ba.cust_id
join account_transaction at
on ba.account_number=at.account_number 
where at.transaction_date Not Between "2025-01-05" And "2025-02-10"
order by at.transaction_date limit 22;

 # 5) Print only the customer id, account_number, balance_amount,transaction_amount 
#transaction_date who did transactions during the first quarter. Do not display the accounts if they 
#have not done any transactions in the first quarter.(16 Rows) 
 
 Select ba.cust_id, ba.Account_number, ba.Balance_amount,
 at.Transaction_amount,at.Transaction_Date 
 from bank_account ba 
 join account_transaction at
 on ba.account_number=at.account_number
 where month(at.transaction_date)in (1,2)
 order by at.Transaction_Date limit 16;
 
 # 6) Print account_number, Event and Customer_message from CUSTOMER_MESSAGES and 
# Account_Details to display an “Login" Event for all customers who have  “SAVINGS" 
# account_type account.(8 Rows)
Select ba.account_number,ba.account_type, cm.event,cm.customer_message
from customer_messages cm
join bank_account ba
On ba.Account_type="Savings"
Where cm.event ='Login'
order by cm.event limit 8;

# 7. Print all Customer_id, Account_Number, Account_type, and display deducted balance_amount 
# by subtracting only negative transaction_amounts for Relationship_type ="P" ( P - means Primary ,  
# s - means Secondary ) .(27 Rows) 

Select ba.cust_id ,ba.account_number, ba.Balance_amount - at.Transaction_amount as deducted_balance_amount 
from bank_account ba
join account_transaction at
on ba.Account_number=at.Account_number
Where at.transaction_amount>0
and ba.Relationship='SB'
order by at.transaction_amount desc limit 27;

# 8) Display records of All Accounts , their Account_types, the transaction amount.
Select ba.Account_number,ba.account_type,at.Transaction_amount
from bank_account ba
join account_transaction at
on ba.account_number =at.account_number;

-- # b) Along with first step, Display other columns with corresponding linking account number, account 
-- types (15 Rows) 
Select ba.Account_number,ba.account_type, rd.Linking_account_number
 from bank_account ba
join relationship_details rd
on ba.cust_id =rd.cust_id
order by ba.cust_id limit 15;

# 9) After retrieving all records of accounts and their linked accounts, display the transaction 
# amount of accounts appeared  in another column.(26 Rows)  
Select rd.account_number ,rd.Linking_account_number,at.Transaction_amount
from relationship_details rd
join account_transaction at
on rd.account_number=at.account_number
Order by rd.account_number limit 26;

# 10) Display all saving account holders have “Add-on Credit Cards" and “Credit cards" (3 Rows
Select cust_id
From relationship_details
where account_type = 'Savings'
and Linking_account_number IN ('Credit Card', 'Add-on Card')
group by Cust_id
having count(distinct linking_account_number)
order by cust_id limit 3;

-- 11  Display  records of “SAVINGS” account linked with “Credit cards" account_type and its credit 
-- # aggregate sum of transaction amount. (1 Row) 
-- # Ref: Check linking relationship in bank_transaction_relationship_details. 
-- # Check transaction_amount in bank_account_transaction. 

Select sum(bt.transaction_amount)as total_credit_amount
from account_transaction bt
where bt.account_number In(
		Select distinct account_number
        from relationship_details
        where account_type="Savings"
        and linking_account_number="Credit card"
);


