class ChangeColumeTypeDateToDatetimeInAttend < ActiveRecord::Migration
  def change
    change_column :attends, :date, :datetime, null: false
  end
end
