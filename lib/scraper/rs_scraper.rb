require 'nokogiri'
require 'open-uri'

#rs stands for rajya sabha

#append session 'id' to rs_session_url_head e.g.
#http://164.100.47.4/Members_attendance/sessionwiseresults.aspx?vsessionno=225Part1
rs_session_url_head = "http://164.100.47.4/Members_attendance/sessionwiseresults.aspx?vsessionno="

sessions = []
(215..218).each {|s| sessions<<"#{s}"}
sessions << "219Part1" << "219Part2"
(220..224).each {|s| sessions<<"#{s}"}
sessions << "225Part1" << "225Part2"

sessions.each do |session|
  url = rs_session_url_head+session
  doc = Nokogiri::HTML(open(url))
  table = doc.search('#GridView1 tr')
  table.search('tr').each do |tr|
    tr.search('td').each_with_index do |td,i|
      p td.content if i==2
    end
  end
end
