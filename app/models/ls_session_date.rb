class LsSessionDate < ActiveRecord::Base

  # Associations
  has_many :ls_attendances
  belongs_to :ls_session
end
