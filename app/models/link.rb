# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  destination :string(255)
#  shortcode   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Link < ActiveRecord::Base
  belongs_to :user

  before_save :ensure_protocol
  
  # maximum length from http://stackoverflow.com/a/417184
  validates :destination, length: { minimum: 4, maximum: 2000 }
  before_create :generate_shortcode

  def shortcode_exists?(shortcode)
    !Link.find_by(shortcode: shortcode).nil?
  end

  def generate_shortcode
    # TODO: Check for collisions
    self.shortcode = SecureRandom.urlsafe_base64(4)[0..4]
  end

  protected

    def ensure_protocol
      unless self.destination[/\Ahttp:\/\//] || self.destination[/\Ahttps:\/\//]
        self.destination = "http://#{self.destination}"
      end
    end

end
