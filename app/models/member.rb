# == Schema Information
#
# Table name: members
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  student_number         :string(255)
#  name                   :string(255)
#  account                :string(255)
#  grade                  :string(255)
#  is_admin               :boolean
#  deleted_at             :datetime
#

class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates :account, presence: true, uniqueness: true
  validates :grade, inclusion: { in: ["B1", "B2", "B3", "B4", "M1", "M2", "TR", "GS"] }
  # validates_presence_of :email, if: :email_required?

  has_many :attends
  has_many :cards

  def status
    return Status::BeOut if self.attends.last.nil?
    self.attends.last.status
  end

  def email_required?
    false
  end

  module Status
    InRoom = 1
    BeOut  = 0
  end

  def in_room?
    status == Status::InRoom
  end

  def be_out?
    status == Status::BeOut
  end

  def next_status
    return Status::InRoom if be_out?
    return Status::BeOut if in_room?
  end
end
