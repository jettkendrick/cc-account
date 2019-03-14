# Credit Card Account Challenge

First off I just want to apologize for the issues with indentation.  I'm having problems with rubocop and sublime that's messing up my code. it's driving me nuts and I just haven't had the time to fix it yet. I know how to properly indent ruby code. 

## Description 

This Challenge was written in Ruby

essentially this program is supposed to simulate opening up a credit card account with a fixed APR and limit running through a billing period of 30 days.  The software should be able to make charges addiing towards an outstanding balance as well as make payments towards a possible existing outstanding balance. There is daily accrued interest in accordance to the presence and value of an outstanding balance.  Checking the account balance any day prior to the final day of the period results in balance displated without the interest being accrued.  while cheking the balance on the 30th day of the period reults in the balance plus the accrued interest over the billing period due to its rule of being added when the billing period ends. 

the software is just a Creditcard class that creates new instances of credit card accounts.  it's initialized with a number of attributes. 

- apr: sets the Apr percent
- limit: the value limit a charge cannot exceed
- balance: each new account starts at 0 
- opened: sets the date the account was opened and represents the start of the billing period
- day: this was used to advance days in the billing period
- interest: used to store accrued interest value
- transactions and activity: were used to store transaction data and the date they occured 

add_charge and add_payment adds to or subtracts from the overall outstanding balence.  Transaction activity is recorded as well so you are able to see what type of trasaction occured on a specific day. 

```ruby
#using this 
credit.view_activity # can return something like this {"2019-03-13"=>[-500], "2019-03-28"=>[200, -50], "2019-03-23"=>[-100]}
```
with that you can see your payments and charges and on what day they occured. 

