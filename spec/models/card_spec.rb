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

require 'rails_helper'

RSpec.describe Card, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
