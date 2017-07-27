class CreateUsers < ActiveRecord::Migration[5.0]
  def change

    create_table :users do |t|
      t.string :name
      t.string :email
      

      t.timestamps
    end
    add_column :users, :password_digest, :string
    add_column :users, :admin, :boolean, default: false
    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
