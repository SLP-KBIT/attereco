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
#  card_idm               :string(255)
#  name                   :string(255)
#  account                :string(255)
#  grade                  :string(255)
#  is_admin               :boolean
#  deleted_at             :datetime
#  status                 :integer
#

class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :account, presence: true, uniqueness: true
  validates_presence_of :email, if: :email_required?

  has_many :attends

  scope :in_room, -> { joins(:attends).where("attends.status = ?", Status::InRoom).order(created_at: :desc).limit(1) }

  def status
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
