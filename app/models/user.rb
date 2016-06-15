class User < ActiveRecord::Base
  attr_accessor :name, :email
  # before_save { email.downcase! }
  validates :username,  presence: true, length: { maximum: 50 }
  validates :email_address, presence: true, length: { maximum: 85 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


  # def initialize(attributes = {})
  #   @name  = attributes[:name]
  #   @email = attributes[:email]
  # end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end