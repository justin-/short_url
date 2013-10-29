# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  provider        :string(255)
#  uid             :integer
#

class User < OmniAuth::Identity::Models::ActiveRecord

  before_validation :set_defaults
  
  before_save { self.email = email.downcase }
    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  
  has_many :links

  def self.from_omniauth(auth)
    User.find_by(provider: auth['provider'], uid: auth['uid']) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    generated_password = SecureRandom.hex(10)
    User.create!(email: auth['info']['email'], password: generated_password,
                 password_confirmation: generated_password, provider: auth['provider'], uid: auth['uid'])
  end

end
