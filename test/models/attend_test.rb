# == Schema Information
#
# Table name: attends
#
#  id         :integer          not null, primary key
#  date       :datetime         not null
#  member_id  :integer
#  log_at     :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#  status     :integer
#

require 'test_helper'

class AttendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
