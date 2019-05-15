class ApplicationController < ActionController::Base
  before_action :init

  def init
    @state = {}

    if user_signed_in?
      cookies.encrypted[:user_id] = current_user.id
    else
      cookies.delete(:user_id)
    end
  end
end
