class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 16}, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/}

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :bookmarks


end
