class ApplicationController < ActionController::Base
    before_action :set_current_user, :check_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
    
    def check_user
        #return redirect_to new_login_path if @current_user.nil? && controller_name != 'logins'
    end
end