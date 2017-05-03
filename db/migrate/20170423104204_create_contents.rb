class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
    	t.text :ct
     	t.integer :floor
     	t.references :post, foreign_key: true
     	t.references :user, foreign_key: true
      t.time :last_reply_time
      t.timestamps
    end
    add_index :contents, [:user_id, :created_at, :post_id]
  end
end
