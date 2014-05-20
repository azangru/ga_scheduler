class Cohort < ActiveRecord::Base
  attr_accessible :course_id, :end_date, :name, :start_date

  has_many :enrollments
  has_many :teaching_assignments
  has_many :students, through: :enrollments, class_name: 'User', source: :student
  has_many :instructors, through: :teaching_assignments, class_name: 'User', source: :instructor

  has_many :bookings

  belongs_to :course

end
