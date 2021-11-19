require_relative '../../../../lib/androiddevice/Initandroid.rb'
require_relative '../../../../lib/systeminit/hooks.rb'

Given(/^I Init the app on the android device$/) do
  $app_page = get_android_app
end

And(/^I clear all the toaster messages$/) do
  $app_page.text_wrapper("text_widget", "Tap to add a new expense record").click
  sleep(2)
  $app_page.text_wrapper("text_widget", "Or tap the category icon to add a record faster").click
  sleep(2)
  $device_driver.find_element(:xpath, '//android.widget.TextView[@text="Tap the \'Transfer\' button to move money between accounts"]').click
  sleep(2)
  $app_page.text_wrapper("text_widget", "Main currency can be changed here").click
  $app_page.click_app_button("vertical_ellipsis_button")
end

When(/^I click on '(.*?)' on the device$/) do |value|
  $app_page.click_app_button(value)
end

When(/^I create a new account using the below values:$/) do |table|
  options = table.raw
  $app_page.clickbutton("accounts_tab_button")
  $app_page.clickbutton("accounts_tab_add_button")
  $app_page.fill_text("account_name_textbox", options[0][1])
  $app_page.fill_text("initbalance_textbox", options[1][1])
  puts (options[2][1])
  $app_page.clickbutton("initial_date_tab")
  sleep(2)
  $device_driver.find_element(:accessibility_id, options[2][1]).click
  $app_page.clickbutton("calendar_confirm_button")
  $app_page.clickbutton("account_cash_button")
  $app_page.clickbutton("account_add_button")
end

Then(/^I verify if the new account was created$/) do
  $app_page.text_exist("account_snackbar_text", "New account was added")
end

Given(/^I select account '(.*?)' from open navigation tab$/) do |account|
  $app_page.select_account(account)
end

When(/^I swipe left-right to reach '(.*?)'$/) do |date|
  while(true)
    begin
      $app_page.text_wrapper("text_widget", date).displayed?
      break
    rescue Exception => e
      $app_page.swipe_left_right
    end
  end
  $app_page.swipe_left_right
end


Then(/^the balance should be '(.*?)' in '(.*?)'$/) do |balance, element|
  $app_page.check_balance(balance, element)
end

Given(/^I am on the date '(.*?)' page$/) do |date|
  if $app_page.text_wrapper("text_widget", date).displayed?
    puts("The user on the correct date period")
  else
    fail("User not on correct date period")
  end
end

When(/^I add an expense amount of '(.*?)' to category '(.*?)'$/) do |amount, category|
  $app_page.modify_expense_income(amount, category)
end

And(/^I swipe right-left to reach '(.*?)'$/) do |date|
  while(true)
    begin
      $app_page.text_wrapper("text_widget", date).displayed?
      break
    rescue Exception => e
      $app_page.swipe_right_left
    end
  end
  $app_page.swipe_right_left
end

When(/^I add an income amount of '(.*?)' to category '(.*?)'$/) do |amount, category|
  $app_page.modify_expense_income(amount, category)
end

Then(/^I verify if the below mentioned text exists on the page:$/) do |table|
  options = table.raw
  options.each do |x|
    x = x[0].gsub('"','')
    sleep(1)
    element_text = $app_page.text_wrapper("text_widget", x).text
    if x == element_text
      puts("The text #{x} is present")
    else
      fail("The text #{x} is not present")
    end
  end
end

When(/^I transfer '(.*?)' from '(.*?)' to '(.*?)'$/) do |amount, frm_acc, to_acc|
  sleep(2)
  $app_page.text_wrapper("text_widget", "Cash").click
  sleep(1)
  $app_page.text_wrapper("text_widget", frm_acc).click
  sleep(1)
  $app_page.text_wrapper("text_widget", "Payment card").click
  sleep(1)
  $app_page.text_wrapper("text_widget", to_acc).click
  $app_page.clickbutton("amount_enter_text")
  amount = amount.split("")
  amount.each do |x|
    $device_driver.find_element(:id, "com.monefy.app.lite:id/buttonKeyboard#{x}").click
  end
  $app_page.clickbutton("add_transfer_button")

end


When(/^I change the language to '(.*?)'$/) do |language|
  $app_page.text_wrapper("text_widget", "Language").click
  sleep(2)
  $device_driver.find_element(:xpath, "//android.widget.CheckedTextView[@text='#{language}']").click
  $app_page.clickbutton("ok_button")
end