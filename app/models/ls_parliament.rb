class LsParliament < ActiveRecord::Base

  # Associations
  belongs_to :house
  has_many :ls_sessions
  has_many :ls_parliament_members

end
