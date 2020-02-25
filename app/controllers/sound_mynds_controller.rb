class SoundMyndsController < ApplicationController
    def index
        @groups = SupportGroup.where.not(name: ["AA", "NA", "Smart Recovery"]).order("time ASC")
        @groups1 = SupportGroup.where(name: ["AA", "NA", "Smart Recovery"]).order("time ASC")
        @counselors = Counselor.all
    end
    def create
        @this_group = SupportGroup.new(group_params)
        if @this_group.valid?
            @this_group.save
            flash[:success] = "Group has been successfully created!"
        redirect_to "/admins"
        else
            flash[:errors] = @this_group.errors.full_messages
            redirect_to "/admins"
        end
    end
    def show
        @group = SupportGroup.find_by(id: params[:id])
        @users = @group.users_attending

    end

    private
    def group_params
        params.require(:group).permit(:name, :time, :location, :desc)
    end
end