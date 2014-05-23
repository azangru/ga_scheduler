class Cohort < ActiveRecord::Base
  attr_accessible :course_id, :end_date, :name, :start_date

  has_many :enrollments
  has_many :teaching_assignments
  has_many :students, through: :enrollments, class_name: 'User', source: :student
  has_many :instructors, through: :teaching_assignments, class_name: 'User', source: :instructor

  has_many :bookings

  belongs_to :course


  def enroll_users user_ids
    user_ids.each do |user_id|
      Enrollment.create(student_id: user_id, cohort_id: self.id)
      #enrollments.create(student_id: user_id)
    end
  end

  def assign_instructors user_ids
    user_ids.each do |user_id|
      #Enrollment.create(student_id: user_id, cohort_id: self.id)
      teaching_assignments.create(instructor_id: user_id)
    end
  end


  def update_enrollments new_enrollments
    puts new_enrollments.inspect
    self.enrollments.each do |enrollment|
      student_object = new_enrollments[enrollment.student_id.to_s]
      paid = student_object ? student_object["paid"] : false
      prework_done = student_object ? student_object["prework_done"] : false
      enrollment.update_attributes({
        prework_done: prework_done,
        paid: paid
      })
    end
  end

  
end
