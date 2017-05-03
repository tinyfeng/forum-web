class Content < ApplicationRecord
	belongs_to :post
	belongs_to :user
	default_scope -> { order(created_at: :asc) }
	validates :ct, presence: true, length: { maximum: 1000 }
	validates :user_id, presence: true

	
	
end
