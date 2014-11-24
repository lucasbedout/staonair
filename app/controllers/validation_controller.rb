class ValidationController < ActionController::Base
  # This controller enables teachers/admins validation and role management
  layout 'application'
  def index
    if current_user.role == 'admin'
      @users = User.all
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'You must be an administrator to access this page' }
      end
    end
  end

  def validate
    @user = User.find(params[:user_id])

    if current_user.role == 'admin' && !@user.valid
      @user.valid = true

      respond_to do |format|
        if @user.save
          format.html { redirect_to users_path, notice: 'User was successfully validated.' }
        else
        format.html { redirect_to users_path, alert: 'Impossible to save the user state.' }
      end
      end
    else
      respond_to do |format|
        format.html { redirect_to users_path, alert: 'Impossible to save the user state.' }
      end
    end
  end

end
