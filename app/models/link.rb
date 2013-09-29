class Link < ActiveRecord::Base
  belongs_to :user

  validates :destination, presence: true
  before_create :generate_shortcode

  def shortcode_exists?(shortcode)
    !Link.find_by(shortcode: shortcode).nil?
  end

  def generate_shortcode
    # TODO: Check for collisions
    self.shortcode = SecureRandom.urlsafe_base64(4)
  end

end
