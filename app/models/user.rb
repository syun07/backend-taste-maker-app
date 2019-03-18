class User < ApplicationRecord
	has_many :favorites
	has_many :tastes, through: :favorites

	has_secure_password
	validates :name, presence: true, uniqueness: true
	validates :password, presence: true
end
