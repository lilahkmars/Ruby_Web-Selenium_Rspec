require 'rubygems'
require 'selenium-webdriver'



dr = Selenium::WebDriver.for :firefox
url = 'https://bim360field-qa.autodesk.com/'
dr.get url

dr.find_element(:id=>'login').send_keys('jie.cao@autodesk.com')
dr.find_element(:id=>'password').send_keys('Autodesk1')
dr.find_element(:id=>'login_button').click

dr.find_element(:xpath,'//*[@id="ng-app"]/body/div[4]/div[3]/span/ul/li[2]/a').click
sleep 3

dr.find_element(:id=>'search_fields').find_element(:id=>'filters').click 
sleep 2
dr.find_element(:xpath=>'//*[@id="filters"]/option[3]').click
sleep 2