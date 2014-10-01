class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :member, index: true
      t.string :idm
      t.string :name

      t.timestamps
    end
  end
end
