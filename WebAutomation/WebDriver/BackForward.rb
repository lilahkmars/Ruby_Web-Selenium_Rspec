require 'selenium-webdriver'

dr = Selenium::WebDriver.for :firefox
url_1 = 'https://bim360field-qa.autodesk.com'
puts "now access #{url_1}"
dr.get url_1
sleep 1
url_2 = 'https://bim360field.autodesk.com'
puts "now acces #{url_2}"
dr.get url_2
sleep 1

puts "back to #{url_1}"
dr.navigate.back()
puts "forward to #{url_2}"
sleep 1
dr.navigate.forward()
sleep 1
dr.quit