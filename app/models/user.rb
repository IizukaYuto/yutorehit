class User < ApplicationRecord
  validates :name, presence: true,length: {maximum: 15}
  validates :email, presence: true
  validates :password, length: {maximum: 32, minimum: 8}
  validates :password, format: {with:/[0-9a-z]+/}
  validates :email, format: {with:/[0-9a-zA-Z]+@[a-z]+.[a-z]+/}
  has_secure_password
end
