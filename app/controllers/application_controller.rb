class ApplicationController < ActionController::Base

  # before any action happens, it will authenticate the user
  before_action :authenticate_user!

end
