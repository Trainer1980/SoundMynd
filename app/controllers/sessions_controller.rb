class SessionsController < ApplicationController
    before_action :require_login, except: [:index, :create]
    def index
        render "index.html.erb"
    end
    def create
        @user = User.find_by_email(login_params[:email]).try(:authenticate, login_params[:password])
        if @user
            session[:user_id] = @user.id
                if @user.id = 1
                    @user.admin = true
                    @user.save
                    redirect_to "/sound_mynds"
                end
        else
            flash[:errors] = ["Invalid Combination"]
            redirect_to "/users"
        end
    end
    helper_method :log_in
    helper_method :is_admin?

    def destroy
        session[:user_id] = nil
        session.clear
        redirect_to "/"
    end

    private
    def login_params
        params.require(:login).permit(:email, :password)
    end
end
