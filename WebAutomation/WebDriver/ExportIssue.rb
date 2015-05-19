require 'rubygems'
require 'selenium-webdriver'

#open QA env
dr = Selenium::WebDriver.for :firefox
url = 'https://bim360field-qa.autodesk.com/'
dr.get url

#login
dr.find_element(:id=>'login').send_keys('jie.cao@autodesk.com')
dr.find_element(:id=>'password').send_keys('Autodesk1')
dr.find_element(:id=>'login_button').click


dr.find_element(:xpath,'//*[@id="ng-app"]/body/div[4]/div[3]/span/ul/li[2]/a').click #go to issue tab
dr.find_element(:xpath,'//*[@id="more_actions"]').click #click "more actions"
dr.find_element(:xpath,'//*[@id="export_issues"]').click #click "export all"



