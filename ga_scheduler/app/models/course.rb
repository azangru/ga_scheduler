class Course < ActiveRecord::Base
  attr_accessible :location_id, :name, :producer_id, :program_id

  has_many :cohorts

  belongs_to :program
  belongs_to :location
  belongs_to :producer, class_name: "User", foreign_key: "producer_id"

end
