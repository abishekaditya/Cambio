class CreateTranscations < ActiveRecord::Migration[5.0]
  def change
    create_table :transcations do |t|
      t.integer :from
      t.integer :to
      t.float :amt

      t.timestamps
    end
  end
end
