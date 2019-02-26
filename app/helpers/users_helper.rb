module UsersHelper
  def owner?(team)
    team.user_id == current_user.id ? TRUE : FALSE
  end
end
