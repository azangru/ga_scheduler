class Booking < ActiveRecord::Base
  attr_accessible :classroom_id, :cohort_id, :end_date, :start_date

  belongs_to :cohort
  belongs_to :classroom

  def self.is_classroom_available? classroom, start_date, end_date
    results = where("classroom_id = ? AND (end_date >= ? OR start_date <= ?)", classroom, start_date, end_date)
    results.empty?
  end
end
