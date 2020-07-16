class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :present_user
  helper_method :logged_in?

  def present_user   
    if session[:token]
      decoded = JsonWebToken.decode(session[:token])
      puts "in apc==#{session[:token]} id #{decoded}"
      User.find_by(id: decoded[:user_id])
    else
      return nil
    end
  end
  
  def logged_in?
    !present_user.nil?
  end

  def authorized   
    redirect_to '/users' unless logged_in?
  end

end
