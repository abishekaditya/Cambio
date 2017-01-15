class CreateGroupAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :group_accounts do |t|
      t.belongs_to :group, index: true
      t.text :matrix

      t.timestamps
    end
  end
end
