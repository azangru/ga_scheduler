class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :biography, :email, :first_name, :last_name, :password, :password_confirmation, :photo, :role


  has_many :courses, foreign_key: 'producer_id'

  has_many :enrollments, foreign_key: 'student_id'
  has_many :teaching_assignments, foreign_key: 'instructor_id'

  has_many :studied_courses, through: :enrollments, source: :cohort, foreign_key: 'student_id'
  has_many :taught_courses, through: :teaching_assignments, source: :cohort, foreign_key: 'instructor_id'

  def self.who_can_enroll cohort
    where(role: "student").select do |u|
      program_ids = u.studied_courses.map do |c| 
        c.course.program_id
      end
      !program_ids.include? cohort.course.program_id
    end
    all # TODO REMOVE THIS 
  end

  def self.who_is_instructor cohort
    where(role: "instructor").select do |u|
      program_ids = u.studied_courses.map do |c| 
        c.course.program_id
      end
      program_ids.include? cohort.course.program_id
    end 
  end

  def full_name
    [first_name, last_name].join(" ")
  end 
end
