require 'selenium-webdriver'

dr = Selenium::WebDriver.for :firefox 
sleep 2 
puts 'browser will be closed'
dr.quit() 
puts 'browser is closed'