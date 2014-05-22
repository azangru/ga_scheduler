class Enrollment < ActiveRecord::Base
  attr_accessible :cohort_id, :paid, :prework_done, :student_id

  belongs_to :cohort
  belongs_to :student, class_name: "User", foreign_key: "student_id"

  before_save :set_default_prework_and_paid

  def set_default_prework_and_paid
    self.prework_done ||= false
    self.paid ||= false
    true
  end

end
