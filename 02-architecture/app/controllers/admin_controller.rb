class AdminController < ActionController::Base
  before_action :verify_admin_user

  def verify_admin_user
    raise 'Access Denied' if current_user&.id != 1
  end
end