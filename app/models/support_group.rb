class SupportGroup < ActiveRecord::Base
  validates :name, :time, :location, :desc, :presence => true
  
  belongs_to :user
  has_many :attendance, dependent: :destroy
  has_many :users_attending, through: :attendance, source: :user
end