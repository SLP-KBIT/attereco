class AddCollumnToMember < ActiveRecord::Migration
  def change
    add_column :members, :student_number, :string
    add_column :members, :card_idm, :string
    add_column :members, :name, :string
    add_column :members, :account, :string
    add_index  :members, :account, unique: true
    add_column :members, :grade, :string
    add_column :members, :is_admin, :boolean
    add_column :members, :deleted_at, :datetime
  end
end
