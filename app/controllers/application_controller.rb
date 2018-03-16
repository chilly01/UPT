class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :check_login

  def check_login
    return if (self.controller_name == "games" && self.action_name == "index")
    return if (self.controller_name == "sessions")
    return if current_user
    redirect_to games_path
  end

end
