# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :text
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
end
