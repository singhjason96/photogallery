class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.references :album, foreign_key: true
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
