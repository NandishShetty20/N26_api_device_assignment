class DeviceActions
  @deviceconfig
  @driver

  def initialize(dc,driver,wait=120)
    @deviceconfig = dc
    @driver = driver
    @wait = Selenium::WebDriver::Wait.new :timeout => wait
  end

  def fill_text(element,value)
    element_id = @deviceconfig[element]
    temp_id=element_id[0].to_sym
    element = @wait.until {@driver.find_element(temp_id,element_id[1])}
    if element
      @driver.find_element(temp_id,element_id[1]).send_keys(value)
    else
      fail("The element does not exist")
    end
  end

  def clickbutton(element)
    element_id = @deviceconfig[element]
    temp_id=element_id[0].to_sym
    element = @wait.until {@driver.find_element(temp_id,element_id[1])}
    if element
      @driver.find_element(temp_id,element_id[1]).click
    else
      fail("The element does not exist")
    end
  end

  def text_exist(element, text)
    element_id = @deviceconfig[element]
    temp_id=element_id[0].to_sym
    @wait.until {@driver.find_element(temp_id,element_id[1])}
    element_text = @driver.find_element(temp_id,element_id[1]).text
    if element_text == text
      puts("The text #{text} is present")
    else
      fail("The text #{text} does not exist")
    end
  end

  ### This method converts a generic TextView xpath to a specific target element based on text
  def text_wrapper(element, text)
    element_id = @deviceconfig[element]
    temp_id=element_id[0].to_sym
    locator = element_id[1] % [text]
    #puts element_id[1] % [text]
    sleep(2)
    if element
      @driver.find_element(temp_id,locator)
    else
      fail("The element does not exist")
    end
  end




end
