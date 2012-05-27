require 'watir-webdriver' 
require 'uri' 
require 'nokogiri'

browser = Watir::Browser.new :firefox 

ls_site = "http://164.100.47.132/Members_Attendance/datewise_results.aspx?xlok=15&vsession=4&vdoa=5/7/2010"

browser.goto ls_site

total_links = browser.body.table(:id, "DataGrid1").rows.first.as.size

body = browser.body
  
(1..total_links).each do |i|
  body.table(:id,"DataGrid1").rows[2].tds.each do |td| 
    cell = td.html
    p Nokogiri::HTML(cell).content.strip;
  end


  next_link = body.table(:id,"DataGrid1").rows.first.as[i-1]
  next_link.click
  body = browser.body
end
