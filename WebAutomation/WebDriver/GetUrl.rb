require 'selenium-webdriver'

dr = Selenium::WebDriver.for :firefox
url = 'https://bim360field-qa.autodesk.com'
puts "now access #{url}"
dr.get url

sleep 5
dr.quit