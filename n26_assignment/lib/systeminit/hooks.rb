require "base64"


After do |scenario|

  def embed(i, i1)
    # code here
  end

  if scenario.failed?
    $device_driver.screenshot("failed_scenario_mobile_screenshot.png")
    path = 'failed_scenario_mobile_screenshot.png'
    file_handle = File.open(path,'rb') {|file| file.read}
    encoded_device_screeshot=Base64.encode64(file_handle)
    embed("data:image/png;base64, #{encoded_device_screeshot}",'image/png')
  end
end