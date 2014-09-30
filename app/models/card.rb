# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  idm        :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Card < ActiveRecord::Base
  belongs_to :member
end
