class Count < ApplicationRecord
  self.table_name = "req_count"
  def self.add
    count = self.first
    count.count += 1
    count.save
  end
end
