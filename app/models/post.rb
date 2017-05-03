class Post < ApplicationRecord
	has_many :contents, dependent: :destroy
	belongs_to :user
	validates :subject, presence: true, length: { maximum: 50}
	validates :user_id, presence: true
	default_scope -> { order(updated_at: :desc) }

end
