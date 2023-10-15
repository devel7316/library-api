class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
  #
  def change
    add_index :name,  [name], unique: true
    add_index :email,  [email], unique: true
  end
end
