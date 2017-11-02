class CreateRequirementsCount < ActiveRecord::Migration[5.0]
  def change
    create_table :req_count do |t|
      t.integer :count

      t.timestamps
    end
  end
end
