class UsersController < ApplicationController
    before_action :require_login, except: [:index, :create]
    def index
        render "index.html.erb"
    end
    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            flash[:success] = "You have successfully registered. Please Login."
            redirect_to "/users"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users"
        end
    end
    def show
        @user =  User.find(params[:id])
        @groups = @user.groups_attending
    end
    
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
    end
end
