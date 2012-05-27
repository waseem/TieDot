require 'watir-webdriver' 
require 'uri' 
require 'nokogiri'

# initialize browser
browser = Watir::Browser.new :firefox 

# parliaments collection - current is the 15th parliament
parliaments = [15]

# parliament sessions
parliament_sessions = {}
# sessions of 15th parliament
parliament_sessions["15"] = [1,2,3,4,5,6,7,8,9,10]


parliaments.each do |parliament|

  ls_parliament = LsParliament.find_or_create_by_number(parliament)

  sessions = parliament_sessions[parliament.to_s]

  sessions.each do |session|

    ls_session = ls_parliament.ls_sessions.find_or_create_by_session_number(session)

    # fetch dates
    session_url = "http://164.100.47.132/Members_Attendance/datewise_attendance.aspx?vsessionno=#{session}"

    browser.goto session_url

    date_rows = browser.body.table(:id, "DataGrid1").rows

    date_rows.each_with_index do |row, index|
      next if index == 0
      month_name_html = row.tds.first.html
      p "*********************************************************"
      p Nokogiri::HTML(month_name_html).content.strip
      p "*********************************************************"

      row.tds.last.as.each do |a|
        a.click

        body = browser.body
 
        ls_site = "http://164.100.47.132/Members_Attendance/datewise_results.aspx?xlok=15&vsession=4&vdoa=5/7/2010"

        browser.goto ls_site

        total_links = browser.body.table(:id, "DataGrid1").rows.first.as.size


        (1..total_links).each do |i|
          
          date_html = body.span(:id, "lb_date").html 
          p date = Nokogiri::HTML(date_html).content.strip
          p "====================================="

          ls_session_date = ls_session.ls_session_dates.find_or_create_by_date(Date.parse(date))

          rows = body.table(:id,"DataGrid1").rows
          rows.each_with_index do |row, index|
            next if index == 0 || index == 1 || index == (rows.size - 1)
            row.tds.each_with_index do |td, index| 
              cell_html = td.html
              cell_content = Nokogiri::HTML(cell_html).content.strip
              
              member_params = {}

              column_name = case index
                            when 0 then 
                              member_params[:division_id] = cell_content.to_i
                              "Div Number : "
                            when 1 then 
                              member_params[:name] = cell_content
                              "Name : "
                            when 2 then 
                              member_params[:status] = cell_content != "NS"
                              "Attendance : "
                            end

              ls_parliament_member = ls_parliament.ls_parliament_members.find_or_create_by_name(member_params[:name])
              ls_parliament_member.ls_attendances << ls_session_date.ls_attendances.create(:status => member_params[:status])
              p column_name + cell_content
            end
          end
          next_link = body.table(:id,"DataGrid1").rows.first.as[i-1]
          next_link.click

          body = browser.body
        end
      end
    end
  
  end
end



