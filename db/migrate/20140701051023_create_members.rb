class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :student_number
      t.string :grade
      t.string :accont
      t.text :password_digest
      t.string :card_idm
      t.boolean :is_admin
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
