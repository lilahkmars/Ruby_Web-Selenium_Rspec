require 'selenium-webdriver'

dr = Selenium::WebDriver.for :firefox

dr.manage.window.resize_to(320,484) 
dr.get 'https://bim360field-qa.autodesk.com'

sleep 5 
dr.quit