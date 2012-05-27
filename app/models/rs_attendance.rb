class RsAttendance < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :rs_session
  belongs_to :rs_member
end
