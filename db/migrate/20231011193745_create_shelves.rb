class CreateShelves < ActiveRecord::Migration[7.0]
  def change
    create_table :shelves do |t|
      t.integer :book_id
      t.integer :client_id
      t.integer :quantity
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :devolution_date
      t.integer :status_id

      t.timestamps
    end
  end
  #
  def change
    add_index :book_client_idx,  [book_id, client_id], unique: true
  end
end
