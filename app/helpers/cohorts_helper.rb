module CohortsHelper
  def prework_done_checkbox cohort, user
    done = user.enrollments.where(cohort_id: cohort.id).first.prework_done
    check_box_tag "enrollments_users[#{user.id}][prework_done]" , true, done
  end

  def paid_checkbox cohort, user
    paid = user.enrollments.where(cohort_id: cohort.id).first.paid
    check_box_tag "enrollments_users[#{user.id}][paid]" , true, paid
  end

  def room_occupancy room
    bookings = Booking.all.select { |booking| booking.classroom_id == room.id }
    dates_occupied = bookings.map { |booking| "from #{booking.start_date} to #{booking.end_date}" }
    dates_occupied.join(", ")
  end

end