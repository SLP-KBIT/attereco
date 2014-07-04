# == Schema Information
#
# Table name: belongings
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  project_id :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Belonging < ActiveRecord::Base
end
