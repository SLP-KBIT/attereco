# == Schema Information
#
# Table name: members
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  student_number  :string(255)
#  grade           :string(255)
#  account         :string(255)
#  password_digest :text
#  card_idm        :string(255)
#  is_admin        :boolean
#  deleted_at      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

class Member < ActiveRecord::Base
  has_secure_password
end
