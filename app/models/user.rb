class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  before_validation { self.email.downcase! unless self.email.blank? }
    validates :first_name, :last_name, :email, :nickname, :presence => true
    validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :first_name, :last_name, :nickname, length: { minimum: 2 }
    validates :password, length: { minimum: 8 }, :if => :password


  has_many :appointments, dependent: :destroy
  has_many :attendance, dependent: :destroy
  has_many :groups_attending, through: :attendance, source: :support_group
  has_many :treated_by, through: :appointments, source: :counselor
end
