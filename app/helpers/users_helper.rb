module UsersHelper

  def select_admins
    User.where(role: "admin").order("last_name")
  end

  def select_producers
    User.where(role: "producer").order("last_name")
  end

  def select_instructors
    User.where(role: "instructor").order("last_name")
  end

  def select_students
    User.where(role: "student").order("last_name")
  end

  # def list_users(users)
  #   users.each do |user|
  #     "<li>" + (link_to"#{user.full_name}", user) + "</li>"
  #   end
  # end

end