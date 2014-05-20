class Enrollment < ActiveRecord::Base
  attr_accessible :cohort_id, :paid, :prework_done, :student_id

  belongs_to :cohort
  belongs_to :student, class_name: "User", foreign_key: "student_id"

end
