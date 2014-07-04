class RenameAccontToMember < ActiveRecord::Migration
  def self.up
        rename_column :members, :accont, :account
  end
  def self.down
        rename_column :members, :account, :accont
  end
end
