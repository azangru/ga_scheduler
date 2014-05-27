class Location < ActiveRecord::Base
  attr_accessible :abbreviation, :address, :name

  has_many :courses

end
