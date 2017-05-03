class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
        t.string :subject
    	t.integer :content_count
    	t.references :user, foreign_key: true
    	t.time :reply_time
     	t.timestamps
    end
    add_index :posts, [:user_id, :updated_at]
  end
end
