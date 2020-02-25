class AttendsController < ApplicationController
    def update
        Attendance.create(user: current_user, support_group: SupportGroup.find(params[:id]))
        redirect_to "/sound_mynds"
    end
    def destroy
        Attendance.delete(Attendance.where(user: current_user, support_group: SupportGroup.find(params[:id])))
        redirect_to "/sound_mynds"
    end
end
