require 'watir-webdriver' 
require 'uri' 

browser = Watir::Browser.new :firefox 

ls_site = "http://164.100.47.132/Members_Attendance/datewise_results.aspx?xlok=15&vsession=4&vdoa=5/7/2010"

browser.goto ls_site

p browser.body.table(:id, "DataGrid1").rows.first.as.each {|a| a.click }
