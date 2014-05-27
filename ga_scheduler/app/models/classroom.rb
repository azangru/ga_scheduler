class Classroom < ActiveRecord::Base
  attr_accessible :location_id, :name, :size

  belongs_to :location
  has_many :bookings
end
