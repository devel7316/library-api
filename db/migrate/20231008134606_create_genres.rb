class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end
  end
  #
  def change
    add_index :name,  [name], unique: true
  end
end
