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

class Attend < ActiveRecord::Base
  belongs_to :member

  validates :date, :member_id, presence: true

  module Status
    Out = 0
    In = 1
  end

  module LogAt
    CircleRoom = 0
    SeminarRoom = 1
  end

  # def message
  #   return "退室" if status == Status::Out
  #   return "入室" if status == Status::In
  # end
end
