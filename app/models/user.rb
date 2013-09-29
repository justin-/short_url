# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  
  validates :email, length: { minimum: 6 }
  validates :password, length: { minimum: 6 }
  has_secure_password
  has_many :links

end
