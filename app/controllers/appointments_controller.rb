class AppointmentsController < ApplicationController
    def update
        @counselor = Counselor.find(params[:id])
        Appointment.create(user: current_user, counselor: Counselor.find(params[:id]))
        redirect_to "/counselors/#{@counselor.id}"
    end
    def destroy
        @counselor = Counselor.find(params[:id])
        Appointment.delete(Appointment.where(user: current_user, counselor: Counselor.find(params[:id])))
        redirect_to "/counselors/#{@counselor.id}"
    end
end
