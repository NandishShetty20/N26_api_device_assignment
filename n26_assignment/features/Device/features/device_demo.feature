@android
Feature: To test the Monefy app on android device/emulator

  Scenario: Adding a new account and verifying it
    Given I Init the app on the android device
    And I clear all the toaster messages
    And I click on 'vertical_ellipsis_button' on the device
    When I create a new account using the below values:
     |Name           |Test Account|
     |Initial_balance|100000      |
     |Date           |Mon, Nov 1  |
     |Select Image   |cash        |
    Then I verify if the new account was created

  Scenario: Verifying the account balance with Day as the period
    Given I select account 'Test Account' from open navigation tab
    And I click on 'open_navigation_tab' on the device
    When I click on 'day_period_button' on the device
    Then the balance should be 'Balance $0.00' in 'balance_tab'
    When I swipe left-right to reach 'Monday, 1 November'
    Then the balance should be 'Balance $100,000.00' in 'balance_tab'

  Scenario: Verifying the Balance after car expenses
    Given I am on the date 'Monday, 1 November' page
    And I click on 'expense_button' on the device
    When I add an expense amount of '2000' to category 'Car'
    Then the balance should be 'Balance $98,000.00' in 'balance_tab'
    And I swipe right-left to reach 'Tuesday, 2 November'

  Scenario: Verifying the Balance after Adding Savings and Taxi expenses
    Given I am on the date 'Tuesday, 2 November' page
    And I click on 'income_button' on the device
    When I add an income amount of '1000' to category 'Savings'
    Then the balance should be 'Balance $1,000.00' in 'balance_tab'
    And I click on 'expense_button' on the device
    When I add an expense amount of '2000' to category 'Taxi'
    Then the balance should be 'Balance -$1,000.00' in 'balance_tab'

  Scenario: Verify if the Income Amount,Expense Amount and the balance is correct when the period selected is week
    Given I click on 'close_navigation_button' on the device
    When I click on 'week_period_button' on the device
    Then I verify if the below mentioned text exists on the page:
    |31 Oct - 6 Nov|
    |$101,000.00   |
    |$4,000.00     |
    And the balance should be 'Balance $97,000.00' in 'balance_tab'

  Scenario: To test if the transfer of money from one account to another updates accordingly
    Given I click on 'vertical_ellipsis_button' on the device
    And I create a new account using the below values:
      |Name           |Test Account1|
      |Initial_balance|10000        |
      |Date           |Wed, Nov 10  |
      |Select Image   |cash         |
    And I verify if the new account was created
    And I click on 'transfer_button' on the device
    When I transfer '5000' from 'Test Account1' to 'Test Account'
    And I swipe left-right to reach '31 Oct - 6 Nov'
    Then the balance should be 'Balance $97,000.00' in 'balance_tab'
    And I click on 'open_navigation_tab' on the device
    When I click on 'month_period_button' on the device
    Then the balance should be 'Balance $102,000.00' in 'balance_tab'


  #This is a bug, so the test case fails. In the balance view, Income amount and expense amount the decimal point and comma gets interchanged
  Scenario: Change the language and check if the setting works
    Given I click on 'vertical_ellipsis_button' on the device
    And I click on 'settings_button' on the device
    When I change the language to 'Deutsch'
    Then the balance should be 'Kontostand $102,000.00' in 'balance_tab'

