class CounselorsController < ApplicationController
    def create
        counselor = Counselor.new(counselor_params)
        if counselor.valid?
            counselor.save
            flash[:success] = "New Counselor Added!"
            redirect_to "/admins"
        else
            flash[:errors] = counselor.errors.full_messages
            redirect_to "/admins"
        end
    end

    def show 
        @counselor = Counselor.find(params[:id])
    end

        private
    def counselor_params
        params.require(:counselor).permit(:first_name, :last_name, :email, :desc, :specialty)
    end    
end
