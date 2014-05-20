class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :biography, :email, :first_name, :last_name, :password, :password_confirmation, :photo, :role


  has_many :courses, foreign_key: 'producer_id'

  has_many :enrollments, foreign_key: 'student_id'
  has_many :teaching_assignments, foreign_key: 'instructor_id'

  has_many :studied_courses, through: :enrollments, source: :cohort, foreign_key: 'student_id'
  has_many :taught_courses, through: :teaching_assignments, source: :cohort, foreign_key: 'instructor_id'

 
end
