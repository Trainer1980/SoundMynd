class SoundMyndsController < ApplicationController
    before_action :is_admin?, only: [:index]
    before_action :not_admin?, except: [:index]
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
        redirect_to "/admins/new"
        else
            flash[:errors] = @this_group.errors.full_messages
            redirect_to "/admins/new"
        end
    end
    def show
        @group = SupportGroup.find_by(id: params[:id])
        @users = @group.users_attending
    end
    def edit
        @group = SupportGroup.find(params[:id])
    end
    def update
        @group = SupportGroup.find(params[:id])
        @group.name = params[:name]
        @group.time = params[:time]
        @group.location = params[:location]
        @group.desc = params[:desc]
        if @group.valid?
            @group.save
            redirect_to "/sound_mynds/#{@group.id}"
        else
            flash[:errors] = @group.errors.full_messages
            redirect_to "/sound_mynds/#{@group.id}/edit"
        end
    end
    def destroy
        @group = SupportGroup.find(params[:id])
        @group.delete
        redirect_to "/admins"
    end

    private
    def group_params
        params.require(:group).permit(:name, :time, :location, :desc)
    end
end