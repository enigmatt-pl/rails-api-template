class Subscriber < ApplicationRecord
  has_secure_password

  validates_presence_of :login, :password_digest

  has_many :todos
end
