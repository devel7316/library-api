class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :writer_id
      t.integer :genre_id
      t.integer :quantity
      t.datetime :acquisition_date

      t.timestamps
    end
  end
end
