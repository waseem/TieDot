class RsMember < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :rs_attendances
end
