module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !!session[:user_id]
  end

  #checks to see if user is trying to create his own team or making team via admin
  def create_team_check(url)
    url =~ /(join_league)/ ? TRUE : FALSE
  end

  def previous_url
    raise request.referrer.inspect
  end

end
