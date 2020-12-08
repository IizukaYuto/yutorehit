class User < ApplicationRecord
  validates :name, presence: true,length: {maximum: 15}
  validates :email, presence: true
  validates :password, length: {maximum: 32, minimum: 8}
  validates :password, format: {with:/[0-9a-z]+/}
  validates :email, format: {with:/[0-9a-zA-Z]+@[a-z]+.[a-z]+/}
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'
end
