require 'rubygems'  
require 'selenium-webdriver'  
dr = Selenium::WebDriver.for :ie  
url = 'http://www.soso.com'  
dr.navigate.to url  
sleep 3  
js = <<JS  
    q = document.getElementById("tb");  
    q.style.border = "1px solid red";  
JS  
   
dr.execute_script js