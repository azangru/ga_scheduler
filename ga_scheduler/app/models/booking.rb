class Booking < ActiveRecord::Base
  attr_accessible :classroom_id, :cohort_id, :end_date, :start_date

  belongs_to :cohort
  belongs_to :classroom

end
