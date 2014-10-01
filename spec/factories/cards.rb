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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    member_id nil
    idm "MyString"
  end
end
