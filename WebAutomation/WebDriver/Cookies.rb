require 'rubygems'
require 'selenium-webdriver'



dr = Selenium::WebDriver.for :firefox
url = 'https://bim360field-qa.autodesk.com/'
dr.get url

p dr.manage.all_cookies
dr.manage.delete_all_cookies
dr.manage.add_cookie(name: 'login', value: 'jie.cao@autodesk.com')
dr.manage.add_cookie(name: 'password', value: 'Autodesk1')

dr.get url
sleep 3