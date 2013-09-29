class User < ActiveRecord::Base
  
  validates :email, length: { minimum: 6 }
  validates :password, length: { minimum: 6 }
  has_secure_password

end
