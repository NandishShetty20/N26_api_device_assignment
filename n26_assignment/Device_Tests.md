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

I have used Ruby, cucumber and appium to automate the app in android device/emulator.I have followed a Gherkin style front end code using cucumber to write the definition of tests. I feel this is very easy to maintain and even a non technical person and write the front end code using cucumber. My project mainly contains four parts.

1. Cucumber as the front end code: This is my runner code. I send most of the variables from the ferature files so that the end user is aware of what exactly is happening with the test case. I also send my locator keys form the cucuber file. If there are muliple data to be enterd in a form we can use cucumber table to send values.
2. Step Definitions and Corresponding actions page(/lib/androiddevice/AndroidAPPActions.rb): This is where the logic for a cucumber step is coded. We can write stand alone code directly in the step definitions file or if the code is reusable then it can be written in the corresponding Actions page.
3. Device Actions(/lib/common/deviceActions.rb): This is where the real magic happens. All the common action that happens on device like filling a textbox, clicking on button, verifying if text exists can be written here. Also this is where the locators are assigned from a yaml file.
4. Yaml files(/lib/pagedata/android/app.yml): This is where I store all the locators in the form of a key value pair.This is loaded in the Actions page and passed onto DeviceActions.

The entry point of the framework is the hooks.rb file located in /lib/systeminit. This is a configuration file which can configure the way features,scenario,steps behave. Currently I have a single configuration which take a screenshot after a Scenairo fails. I initialise the driver in systeminit.rb file located at /lib/systeminit. I have declared my browser as a global varibale so that I can access the driver from anywhere in the project.

My Scenarios are interdependent, meaning if the third scenario fails then the scenarios after that are going to fail. This is not the ideal way to write tests. The correct way to write a test is to use api wiht you tests. Consider the example of creating an account in one scenario and adding an expense in another. The first scenario should be creating the scenario usign the UI and for the other scenraio use the api and create an account and then add the expense using the UI. Since I dint have the APi's for Monefy app I have done it this way.
