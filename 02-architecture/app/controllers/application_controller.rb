class ApplicationController < ActionController::Base
  before_action :check_maintenance_mode

  def current_user
    if super
      super
    else
      GuestUser.new
    end
  end

  def check_maintenance_mode
    if File.exists?(Rails.root.join('maintenance'))
      return render '/maintenance', layout: nil
    end
  end
end
