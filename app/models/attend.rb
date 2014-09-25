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
#

class Attend < ActiveRecord::Base
  belongs_to :member, foreign_key: :member_id, class_name: Member

  validates :date, :member_id, presence: true
end
