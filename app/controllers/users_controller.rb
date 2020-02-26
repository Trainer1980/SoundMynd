class UsersController < ApplicationController
    before_action :require_login, except: [:index, :create]
    before_action :valid_user, except: [:index, :create]
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
        @groups = current_user.groups_attending.order("time ASC")
        @counselors = current_user.treated_by
    end

    def edit
        
    end

    def update
        @user = User.find(current_user.id)
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.nickname = params[:nickname]
        @user.email = params[:email]
        if @user.valid?
            @user.save
            redirect_to "/users/#{@user.id}"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
        end
    end
    def destroy
        @user = User.find(params[:id])
        if current_user.admin?
            @user.delete
            redirect_to "/admins"
        else
            session[:user_id] = nil
            session.clear
            @user.delete
            redirect_to "/"
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation)
    end
    def valid_user
		if current_user != User.find(params[:id])
			redirect_to "/users/#{session[:user_id]}"
		end
	end
end
