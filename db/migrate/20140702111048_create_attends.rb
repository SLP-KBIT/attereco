class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.datetime :date
      t.integer :member_id
      t.integer :log_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
