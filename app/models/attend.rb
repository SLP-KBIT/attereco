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

class Attend < ActiveRecord::Base
  belongs_to :member

  validates :date, :member_id, presence: true
end
