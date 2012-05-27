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

  total_sittings = doc.search('#lb_totaldays').text
  rs_session = RsSession.find_or_create_by_session_number(session)
  rs_session.update_attribute('total_sittings',total_sittings.to_i)
  


  table = doc.search('#GridView1 tr')
  table.search('tr').each do |tr|
    data = {}
    tr.search('td').each_with_index do |td,i|
      case i 
      when 1 then 
        division_number = td.content.strip
        data[:division_number] =division_number
      when 2 then
        name = td.content.strip
        data[:name] = name
      when 3 then
        state = td.content.strip
        data[:state] = state
      when 4 then
        value = td.content.strip
        data[:value] = value
      end
    end
    rs_member = RsMember.find_or_create_by_division_number(data[:division_number].to_i)
    rs_member.update_attributes(:name => data[:name],:state => data[:state])
    rs_member.rs_attendances << rs_session.rs_attendances.create(:value => data[:value]) 


  end
end
