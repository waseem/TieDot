class LsSession < ActiveRecord::Base

  # Associations
  belongs_to :ls_parliament
  has_many :ls_session_dates

end
