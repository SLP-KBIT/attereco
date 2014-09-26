class ChangeColumnTypeOfDateInAttend < ActiveRecord::Migration
  def change
    change_column :attends, :date, :date, null: false
  end
end
