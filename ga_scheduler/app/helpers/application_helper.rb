module ApplicationHelper

  def select_cohorts_by_location(loc)
    Cohort.all.select {|c| c.course.location_id = loc }
  end

end
