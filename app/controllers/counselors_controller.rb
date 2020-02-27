class CounselorsController < ApplicationController
    before_action :require_login
    before_action :not_admin?, except: [:show]
    def create
        counselor = Counselor.new(counselor_params)
        if counselor.valid?
            counselor.save
            flash[:success] = "New Counselor Added!"
            redirect_to "/admins/new"
        else
            flash[:errors] = counselor.errors.full_messages
            redirect_to "/admins/new"
        end
    end

    def show 
        @counselor = Counselor.find(params[:id])
        @users = @counselor.users_treated
    end

    def edit
        @counselor = Counselor.find(params[:id])
    end

    def update
        @counselor = Counselor.find(params[:id])
        @counselor.first_name = params[:first_name]
        @counselor.last_name = params[:last_name]
        @counselor.email = params[:email]
        @counselor.specialty = params[:specialty]
        @counselor.desc = params[:desc]
        if @counselor.valid?
            @counselor.save
            redirect_to "/counselors/#{@counselor.id}"
        else
            flash[:errors] = @counselor.errors.full_messages
            redirect_to "/counselor/#{@counselor.id}/edit"
        end
    end

    def destroy
        @counselor = Counselor.find(params[:id])
        @counselor.delete
        redirect_to "/admins"
    end
        private
    def counselor_params
        params.require(:counselor).permit(:first_name, :last_name, :email, :desc, :specialty)
    end    
end
