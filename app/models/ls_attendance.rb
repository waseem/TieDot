class LsAttendance < ActiveRecord::Base

  # Associations
  belongs_to :ls_parliament_member
  belongs_to :ls_session_date
end
