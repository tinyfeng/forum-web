class AddActivationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activation, :boolean
  end
end
