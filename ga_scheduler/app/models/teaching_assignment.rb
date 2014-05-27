class TeachingAssignment < ActiveRecord::Base
  attr_accessible :cohort_id, :instructor_id, :negotiated_rate

  belongs_to :cohort
  belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"

end
