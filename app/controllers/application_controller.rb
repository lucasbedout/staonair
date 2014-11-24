class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Check if user is logged and valid
  before_action :authenticate_user!

  def user_validated
    if current_user && !current_user.valid
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'You have not been validated as a teacher.' }
      end
    end
  end

end
