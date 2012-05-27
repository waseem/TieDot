class LsParliamentMember < ActiveRecord::Base

  # Associations
  belongs_to :ls_parliament
  has_many :ls_attendances
end
