#encoding: utf-8
require 'rubygems'
require 'selenium-webdriver'

dr=Selenium::WebDriver.for :firefox
url='https://bim360field-qa.autodesk.com/'
dr.get url

dr.find_element(:id=>'login').send_keys("jie.cao@autodesk.com")
dr.find_element(:id=>'password').send_keys("Autodesk1")
dr.find_element(:id=>'login_button').click