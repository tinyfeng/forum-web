class AddTopToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :top, :boolean
  end
end
