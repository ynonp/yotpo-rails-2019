class ApplicationController < ActionController::Base
  before_action :check_maintenance_mode

  def check_maintenance_mode
    if File.exists?(Rails.root.join('maintenance'))
      return render '/maintenance', layout: nil
    end
  end
end
