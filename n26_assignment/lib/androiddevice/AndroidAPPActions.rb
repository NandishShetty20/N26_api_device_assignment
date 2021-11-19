require_relative("../../lib/common/DeviceActions")


class AndroidAPPActions < DeviceActions
  def initialize(driver)
    if File.exists?(File.dirname(__dir__)+"/pagedata/android/app.yml")
      deviceconfig = YAML.load_file(File.dirname(__dir__)+"/pagedata/android/app.yml")
    else
      puts("File not found "+(File.dirname(__dir__)+"/pagedata/android/app.yml"))
    end
    super(deviceconfig,driver)
  end

  def click_app_button(value)
    self.clickbutton(value)
  end

  def select_account(account)
    self.clickbutton("open_navigation_tab")
    self.clickbutton("all_accounts_button")
    sleep(3)
    self.text_wrapper("text_widget", account).click
    #$device_driver.find_element(:xpath, "//android.widget.TextView[@text='#{account}']").click
  end

  def swipe_left_right(timeoutduration = 5000)
    sleep(1)
    size = $device_driver.window_size
    endx = size.width * 0.85
    startx = size.width * 0.20
    starty = size.height / 2
    Appium::TouchAction.new($device_driver).swipe(:start_x => startx, :start_y => starty, :end_x => endx, :end_y => starty, :duration => timeoutduration).perform
  end

  def check_balance(balance, element)
    sleep(1)
    self.text_exist(element, balance)
  end

  def swipe_right_left(timeoutduration = 5000)
    sleep(1)
    size = $device_driver.window_size
    endx = size.width * 0.20
    startx = size.width * 0.85
    starty = size.height / 2
    Appium::TouchAction.new($device_driver).swipe(:start_x => startx, :start_y => starty, :end_x => endx, :end_y => starty, :duration => timeoutduration).perform
  end

  def modify_expense_income(amount, category)
    sleep(2)
    amount = amount.split("")
    amount.each do |x|
      $device_driver.find_element(:id, "com.monefy.app.lite:id/buttonKeyboard#{x}").click
    end
    # $app_page.fill_text("amount_enter_text", amount)
    $app_page.clickbutton("choose_category_button")
    sleep(1)
    self.text_wrapper("text_widget", category).click
    # $device_driver.find_element(:xpath, "//android.widget.TextView[@text='#{category}']").click
  end
end
