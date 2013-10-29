# == Schema Information
#
# Table name: identities
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Identity < OmniAuth::Identity::Models::ActiveRecord
end
