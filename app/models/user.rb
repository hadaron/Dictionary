require 'bcrypt'
class User < ApplicationRecord
  include BCrypt

  attr_reader :password, :password_confirmation
  has_many :words
  validates :full_name, :email, :password, presence: true, length: {minimum: 5, maximum: 30}
  validates :email, uniqueness: true
  validates :password, confirmation: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
