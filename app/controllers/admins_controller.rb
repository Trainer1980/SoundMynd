class AdminsController < ApplicationController
    before_action :require_login
    before_action :not_admin?
    def index
        @groups = SupportGroup.where.not(name: ["AA", "NA", "Smart Recovery"]).order("time ASC")
        @groups1 = SupportGroup.where(name: ["AA", "NA", "Smart Recovery"]).order("time ASC")
        @counselors = Counselor.all
        @users = User.where.not(admin: true)
    end
    def new

    end
end