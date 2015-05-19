require 'selenium-webdriver'

dr = Selenium::WebDriver.for :firefox 
sleep 2 
puts 'maximize browser' 
dr.manage.window.maximize() 
sleep 2 
puts 'close browser' 
dr.quit