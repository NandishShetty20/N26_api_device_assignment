require 'appium_lib'

def initAndroidApp()
  apk = {
    platformName: "Android",
    #deviceName: "QSEAGMDYPZXCAUOB",
    deviceName: "emulator-5554",
    newCommandTimeout: 300,
    appPackage: 'com.monefy.app.lite',
    appActivity: 'com.monefy.activities.main.MainActivity_',
    app: 'apk_path/monefy-1-13-0.apk'
  }
  $device_driver ||= Appium::Driver.new(caps: apk)
  sleep(2)
end