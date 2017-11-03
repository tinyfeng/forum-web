class User < ApplicationRecord
	before_save { self.email.downcase! }
	validates :name, presence: true
	em_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                                  format: { with: em_regex },
	                                  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	has_many :posts, dependent: :destroy
	has_many :contents, dependent: :destroy

  def activated?
    self.activation == true
  end

	def self.new_token
	end

	def feed
		Post.where()
	end

	def self.digest(token)
		BCrypt::Password.create(token)
	end

  def activate
    UserMailer.activate(self).deliver_now!
  end


end
