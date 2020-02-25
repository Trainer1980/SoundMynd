class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :support_group
end
