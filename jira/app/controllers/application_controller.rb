class ApplicationController < ActionController::Base
  before_action :init

  def init
    @appstate = {}
  end
end
