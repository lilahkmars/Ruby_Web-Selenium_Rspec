require 'selenium-webdriver'

dr = Selenium::WebDriver.for :firefox 
url = 'https://bim360field-qa.autodesk.com'
puts "now access #{url}”"
dr.get url

puts "title of current page is #{dr.title}"
puts "url of current page is #{dr.current_url}"
sleep 2

dr.quit