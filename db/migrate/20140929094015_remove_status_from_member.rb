class RemoveStatusFromMember < ActiveRecord::Migration
  def change
    remove_column :members, :status
  end
end
