class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email,password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end 
end
