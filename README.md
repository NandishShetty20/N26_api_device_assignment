# N26_api_device_assignment

This project has the tests for api and device assignment. I have used Ruby as my choice of language and used rest-client to automate API tests and aapium_lib for Android device tests.


## Execution Machine:

- Machine: MacBook Pro (13-inch, M1, 2020)
- Chip Apple M1
- OS - macOS Big Sur
- Version 11.6

## Installation and Configuration

1. Install RVM  ```$ \curl -sSL https://get.rvm.io | bash ``` 
2. Install Ruby Version 2.7.2 ```$ rvm install 2.7.1 ```
3. Create default ruby version ```rvm alias create default 2.7.1 ```
4. Install and configure Appium and Android Studio using the link 'https://www.swtestacademy.com/how-to-install-appium-on-mac/'
5. Open AVD Manager and select Pixel_3a_API_31_arm-v8a device.
6. Open appium > Edit Configurations, and provide ANDROID_HOME and JAVA_HOME.You can run echo %ANDROID_HOME and echo %JAVA_HOME in terminal to get the path
7. Start Appium Server
8. Download the automation project.
9. Run the command ```gem install bundler``` to install bundler.
10. Go to the root folder of the project(n26_assignment) and run ```bundle install```. This should install all the required libraries for the automation project.

## Test Execution

From the root folder run command ``` cucumber --profile api``` to run api tests(Make sure the api playground app is running on the local machine)
From the root folder run command ``` cucumber --profile device``` to run device specific tests
From the root folder run command ``` cucumber --profile complete``` to run api and device tests

A report.html file is generated after the execution to know the execution details. Also a .png file get created with the screenshot of the device whenever the device tests fail.More details regarding the device tests can be found in Device_Tests.md file. Similarly more details of the api tests are in API_Tests.md in the root folder of the project.I have uploaded a video of the device test case execution on youtube just for reference. This is the link 'https://www.youtube.com/watch?v=TUCZiJx4ruc'






