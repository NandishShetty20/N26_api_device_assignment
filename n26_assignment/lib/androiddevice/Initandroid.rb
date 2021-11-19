require_relative("../../lib/systeminit/systeminit")
require_relative("AndroidAppActions.rb")

module Initandroid
  def get_android_app
    initAndroidApp
    $device_driver.start_driver
    @driver ||= AndroidAPPActions.new($device_driver)
  end
end
World(Initandroid)
