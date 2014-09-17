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
#

class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :account, presence: true, uniqueness: true
  validates_presence_of :email, if: :email_required?

  def email_required?
    false
  end
end
