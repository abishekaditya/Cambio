class AddHashToGroupAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :group_accounts, :mapper, :text
  end
end
