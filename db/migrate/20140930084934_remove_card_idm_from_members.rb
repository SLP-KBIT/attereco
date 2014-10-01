class RemoveCardIdmFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :card_idm
  end
end
