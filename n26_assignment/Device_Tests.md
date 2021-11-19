# Device tests Overview

## Test Cases
1. To create an account and vreifying if it is added.
2. Verifying the account balance with Day as the period.
3. Veriying if the balance gets updated after adding an expense for a particular Date.
4. Verifying if the balance gets updated after adding an income and expense for a particular Date.
5. Verify if the Income Amount,Expense Amount and the balance is correct when the period selected is week.
6. To test if the transfer of money from one account to another updates the balance accordingly.
7. Verifying if the Language changes after changing in app settings.


All the above test cases are of High Priority and have been autmated. The main problem that I faced during automation was identifying the elements as many of the elements do not have a proper ID. I have user xpath with TextView at most places.

##Framework Architecture

I have used Ruby, cucumber and appium to automate the app in android device.
