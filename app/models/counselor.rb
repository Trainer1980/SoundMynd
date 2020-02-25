class Counselor < ActiveRecord::Base
  has_many :users_treated, through: :appointment, source: :user
end
