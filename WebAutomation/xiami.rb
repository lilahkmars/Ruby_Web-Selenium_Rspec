#encoding: utf-8
require 'rubygems'
require 'selenium-webdriver'

dr = Selenium::WebDriver.for :chrome
url = 'http://www.xiami.com/'
dr.get url

dr.find_element(:linkText, '立即登录').click
sleep 3

dr.find_element(:id, 'email').send_keys('caojie_0713@126.com')
dr.find_element(:id, 'password').send_keys('caojie1990713')
dr.find_elements(:id, 'submit').click
sleep 3

dr.find_element(:xpath, '//*[@id="user"]/div[2]/div[4]/b').click

quit.()
