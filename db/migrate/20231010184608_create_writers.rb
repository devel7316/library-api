class CreateWriters < ActiveRecord::Migration[7.0]
  def change
    create_table :writers do |t|
      t.string :name, unique: true

      t.timestamps
    end
  end
  #
  def change
    add_index :name,  [name], unique: true
  end
end
