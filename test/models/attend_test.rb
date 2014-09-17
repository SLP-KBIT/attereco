# == Schema Information
#
# Table name: attends
#
#  id         :integer          not null, primary key
#  date       :datetime
#  member_id  :integer
#  log_at     :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AttendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
