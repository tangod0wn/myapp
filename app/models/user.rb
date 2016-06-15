class User < ActiveRecord::Base
  attr_accessor :name, :email
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 85 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end

  def initialize(attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
