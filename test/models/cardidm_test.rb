# == Schema Information
#
# Table name: cardidms
#
#  id         :integer          not null, primary key
#  card_idm   :text
#  member_id  :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CardidmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
