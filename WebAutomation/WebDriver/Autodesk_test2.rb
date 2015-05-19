#encoding: uft-8

require 'selenium-webdriver'

describe "autodesk mainpage login" do
    it "should return username and password is wrong" do
        dr=Selenium::WebDriver.for :firefox
        url='https://bim360field-qa.autodesk.com/'
        dr.get url
        
        dr.find_element(:id=>’login’).send_keys(“jie.cao@autodesk.com”) 
        dr.find_element(:id=>’password’).send_keys(“Autodesk1”) 
        dr.find_element(:id=>’login_button’).click
        
        dr.find_element(:id=>'err_m').text.should eql("Your email address or password is incorrect.")

    end #it
end #describe

        
